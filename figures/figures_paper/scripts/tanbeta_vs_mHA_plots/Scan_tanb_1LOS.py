#!/usr/bin/env python
# -*- coding: utf-8 -*-
import ROOT as r
from ROOT import gStyle,gROOT,kTRUE,TFile,TCanvas,TPad,TH1F,TGraphAsymmErrors,TColor,TGraph,kBlack,kRed,kSolid,TLatex,TLegend,gPad,TGaxis
import array
import numpy as np
import math

import yaml
import logging
import os
gStyle.SetOptStat(0)
gROOT.SetBatch(kTRUE)

# ATLASLabel = "Internal"
ATLASLabel = ""


Xsec_BR = [23.88161,49.25993,25.74307,11.17569,9.06952,7.09052,3.6] #Xsec is in fb unit
Xsec_BR_12fb = [12,12,12,12,12,12,12] #Xsec is in fb unit

MassList = [400,500,600,700,800,900,1000]
TeVMassList = [0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1]
ZeroErrorList = [0, 0, 0, 0, 0, 0, 0]

mass_dict = {0: 0.4,
             1: 0.5,
             2: 0.6,
             3: 0.7,
             4: 0.8,
             5: 0.9,
             6: 1,
            }
DefaultConfig = {"InputPrefix": "",
                 "InputSuffix": "",
                 "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/",
                 "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/default/",
                 "savename": "default.pdf",
                 "name": "",
                }

def convert_limit_to_tanb_ttH(limit_xsec):

    limit_xsec = np.array(limit_xsec)
    _ ,xsec_ttH_1p0 = TheoryXSec_type2(production="ttH",tanb=1.0)

    xsec_tb1 = xsec_ttH_1p0

    one_over_factor_squared = limit_xsec/xsec_tb1
    factor_squared = 1/one_over_factor_squared
    factor = np.sqrt(factor_squared)
    tb_values = factor

    return tb_values

def convert_limit_to_tanb_ttA(limit_xsec):

    limit_xsec = np.array(limit_xsec)
    _ ,xsec_ttA_1p0 = TheoryXSec_type2(production="ttA",tanb=1.0)
    xsec_tb1 = xsec_ttA_1p0

    one_over_factor_squared = limit_xsec/xsec_tb1
    factor_squared = 1/one_over_factor_squared
    factor = np.sqrt(factor_squared)
    tb_values = factor

    return tb_values



def convert_limit_to_tanb(limit_xsec):

    limit_xsec = np.array(limit_xsec)
    # _, xsec_tb01 = TheoryXSec_type2_H_ttH_tan0p1()
    # _, xsec_tb1 = TheoryXSec_type2_H_ttH(tanb=1.0)

    _ ,xsec_ttH_1p0 = TheoryXSec_type2(production="ttH",tanb=1.0)
    _ ,xsec_ttA_1p0 = TheoryXSec_type2(production="ttA",tanb=1.0)

    xsec_tb1 = xsec_ttH_1p0+xsec_ttA_1p0

    one_over_factor_squared = limit_xsec/xsec_tb1
    factor_squared = 1/one_over_factor_squared
    factor = np.sqrt(factor_squared)
    tb_values = factor

    return tb_values

def Single_tanb_Plot(input_Xsec_BR,config=DefaultConfig):

    n_mass_points = len(input_Xsec_BR)

    f = list(range(n_mass_points))
    # TH2Plot = list(range(Range))
    exp_uplimit_on_musignal = list(range(n_mass_points))
    exp_uplimit_on_musignal_plus1 = list(range(n_mass_points))
    exp_uplimit_on_musignal_plus2 = list(range(n_mass_points))
    exp_uplimit_on_musignal_minus1 = list(range(n_mass_points))
    exp_uplimit_on_musignal_minus2 = list(range(n_mass_points))
    obs_uplimit_on_musignal = list(range(n_mass_points))

    exp_uplimit_on_Xsec = list(range(n_mass_points))
    exp_uplimit_on_Xsec_plus1 = list(range(n_mass_points))
    exp_uplimit_on_Xsec_plus2 = list(range(n_mass_points))
    exp_uplimit_on_Xsec_minus1 = list(range(n_mass_points))
    exp_uplimit_on_Xsec_minus2 = list(range(n_mass_points))
    obs_uplimit_on_Xsec = list(range(n_mass_points))

    OneSigma_y_plus_List  = list(range(n_mass_points))
    OneSigma_y_minus_List = list(range(n_mass_points))
    TwoSigma_y_plus_List  = list(range(n_mass_points))
    TwoSigma_y_minus_List = list(range(n_mass_points))

    InputPrefix = config.get("InputPrefix")
    InputSuffix = config.get("InputSuffix")
    InputFolder = config.get("InputFolder")
    savename    = config.get("savename")
    outputfolder = config.get("outputfolder")
    Input_Results = config.get("Input_Results")
    SigType = config.get("SigType") # exp, obs
    FitType = config.get("FitType") # exp, obs
    interpretation = config.get("interpretation")
    draw_xs_points = config.get("draw_xs_points") # exp, obs
    ShowPreviousResults = config.get("ShowPreviousResults") # exp, obs

    if interpretation==None:
        interpretation = "ttH_ttA"

    if draw_xs_points==None:
        draw_xs_points = False

    if ShowPreviousResults==None:
        ShowPreviousResults = False

    if FitType==None:
        FitFile = "myLimit_BLIND_CL95.root"
    elif FitType=='Real' or FitType=='Data':
        FitFile = "myLimit_CL95.root"
    elif FitType=='Plain' or FitType=='StatOnly':
        FitFile = "myLimit_BLIND_CL95.root"
    else:
        FitFile = "myLimit_BLIND_CL95.root"

    if SigType==None:
        SigType = "obs"

    if Input_Results==None:
        Envelope = False
    else:
        Envelope = True

    os.system("mkdir -p "+outputfolder)

    for i in range(n_mass_points): # range(i,j) from i to j-1
        if Envelope == False:
            file_name = InputPrefix+str(MassList[i])+InputSuffix
        else:
            file_name = Input_Results[i]

        # file_name = InputPrefix+str(MassList[i])+InputSuffix
        # print(file_name)
        f[i] = TFile(InputFolder+file_name+"/Limits/asymptotics/"+FitFile)
        #f[i] = TFile(InputFolder+file_name+"/"+FitFile)
        # print(InputFolder+file_name+"/Limits/asymptotics/"+FitFile)
        stats = f[i].Get("stats")
        stats.GetEntry(0)
        # gDirectory.GetObject("stats",stats)
        # if (stats): stats.Print()
        # stats.Scan("exp_upperlimit:exp_upperlimit_plus1:exp_upperlimit_plus2:exp_upperlimit_minus1:exp_upperlimit_minus2")

        if FitType=='Data':
            obs_uplimit_on_musignal[i] = stats.GetLeaf("obs_upperlimit").GetValue(0)

        exp_uplimit_on_musignal[i] = stats.GetLeaf("exp_upperlimit").GetValue(0)
        exp_uplimit_on_musignal_plus1[i] = stats.GetLeaf("exp_upperlimit_plus1").GetValue(0)
        exp_uplimit_on_musignal_plus2[i] = stats.GetLeaf("exp_upperlimit_plus2").GetValue(0)
        exp_uplimit_on_musignal_minus1[i] = stats.GetLeaf("exp_upperlimit_minus1").GetValue(0)
        exp_uplimit_on_musignal_minus2[i] = stats.GetLeaf("exp_upperlimit_minus2").GetValue(0)

        if FitType=='Data':
            obs_uplimit_on_Xsec[i] = obs_uplimit_on_musignal[i] * input_Xsec_BR[i] * 0.001

        exp_uplimit_on_Xsec[i] = exp_uplimit_on_musignal[i] * input_Xsec_BR[i] * 0.001  # 0.001 to make the unit become pb
        exp_uplimit_on_Xsec_plus1[i] = exp_uplimit_on_musignal_plus1[i] * input_Xsec_BR[i] * 0.001
        exp_uplimit_on_Xsec_plus2[i] = exp_uplimit_on_musignal_plus2[i] * input_Xsec_BR[i] * 0.001
        exp_uplimit_on_Xsec_minus1[i] = exp_uplimit_on_musignal_minus1[i] * input_Xsec_BR[i] * 0.001
        exp_uplimit_on_Xsec_minus2[i] = exp_uplimit_on_musignal_minus2[i] * input_Xsec_BR[i] * 0.001

        # OneSigma_y_plus_List[i] = exp_uplimit_on_Xsec_plus1[i]-exp_uplimit_on_Xsec[i]
        # OneSigma_y_minus_List[i] = exp_uplimit_on_Xsec[i]-exp_uplimit_on_Xsec_minus1[i]
        # TwoSigma_y_plus_List[i] = exp_uplimit_on_Xsec_plus2[i]-exp_uplimit_on_Xsec[i]
        # TwoSigma_y_minus_List[i] = exp_uplimit_on_Xsec[i]-exp_uplimit_on_Xsec_minus2[i]
        #
        # print("exp upper-limit on Xsec for "+str(MassList[i])+" = {}".format(exp_uplimit_on_Xsec[i]))
        # print("1 sigma up error on Xsec for "+str(MassList[i])+" = {}".format(OneSigma_y_plus_List[i]))
        # print("2 sigma up error on Xsec for "+str(MassList[i])+" = {}".format(TwoSigma_y_plus_List[i]))
        # print("1 sigma down error on Xsec for "+str(MassList[i])+" = {}".format(OneSigma_y_minus_List[i]))
        # print("2 sigma down error on Xsec for "+str(MassList[i])+" = {}".format(TwoSigma_y_minus_List[i]))
        stats.Delete()


    exp_uplimit_on_Xsec        = np.array(exp_uplimit_on_Xsec)
    exp_uplimit_on_Xsec_plus1  = np.array(exp_uplimit_on_Xsec_plus1)
    exp_uplimit_on_Xsec_plus2  = np.array(exp_uplimit_on_Xsec_plus2)
    exp_uplimit_on_Xsec_minus1 = np.array(exp_uplimit_on_Xsec_minus1)
    exp_uplimit_on_Xsec_minus2 = np.array(exp_uplimit_on_Xsec_minus2)

    if interpretation=="ttH_ttA":
        exp_uplimit_on_tanb         = convert_limit_to_tanb(exp_uplimit_on_Xsec)
        exp_uplimit_on_tanb_minus1  = convert_limit_to_tanb(exp_uplimit_on_Xsec_plus1)
        exp_uplimit_on_tanb_minus2  = convert_limit_to_tanb(exp_uplimit_on_Xsec_plus2)
        exp_uplimit_on_tanb_plus1   = convert_limit_to_tanb(exp_uplimit_on_Xsec_minus1)
        exp_uplimit_on_tanb_plus2   = convert_limit_to_tanb(exp_uplimit_on_Xsec_minus2)

    elif interpretation=="ttH":
        exp_uplimit_on_tanb         = convert_limit_to_tanb_ttH(exp_uplimit_on_Xsec)
        exp_uplimit_on_tanb_minus1  = convert_limit_to_tanb_ttH(exp_uplimit_on_Xsec_plus1)
        exp_uplimit_on_tanb_minus2  = convert_limit_to_tanb_ttH(exp_uplimit_on_Xsec_plus2)
        exp_uplimit_on_tanb_plus1   = convert_limit_to_tanb_ttH(exp_uplimit_on_Xsec_minus1)
        exp_uplimit_on_tanb_plus2   = convert_limit_to_tanb_ttH(exp_uplimit_on_Xsec_minus2)

    elif interpretation=="ttA":
        exp_uplimit_on_tanb         = convert_limit_to_tanb_ttA(exp_uplimit_on_Xsec)
        exp_uplimit_on_tanb_minus1  = convert_limit_to_tanb_ttA(exp_uplimit_on_Xsec_plus1)
        exp_uplimit_on_tanb_minus2  = convert_limit_to_tanb_ttA(exp_uplimit_on_Xsec_plus2)
        exp_uplimit_on_tanb_plus1   = convert_limit_to_tanb_ttA(exp_uplimit_on_Xsec_minus1)
        exp_uplimit_on_tanb_plus2   = convert_limit_to_tanb_ttA(exp_uplimit_on_Xsec_minus2)

    # if other_interpretation:
    #     exp_uplimit_on_tanb_ttH         = convert_limit_to_tanb_ttH(exp_uplimit_on_Xsec)
    #     exp_uplimit_on_tanb_ttA         = convert_limit_to_tanb_ttA(exp_uplimit_on_Xsec)
    #     exp_uplimit_on_tanb_ttH = array.array('d', exp_uplimit_on_tanb_ttH)
    #     exp_uplimit_on_tanb_ttA = array.array('d', exp_uplimit_on_tanb_ttA)

    if FitType=='Data':
        obs_y = array.array('d', obs_uplimit_on_Xsec)
        if interpretation=="ttH_ttA":
            obs_tanb = convert_limit_to_tanb(obs_y)
        elif interpretation=="ttH":
            obs_tanb = convert_limit_to_tanb_ttH(obs_y)
        elif interpretation=="ttA":
            obs_tanb = convert_limit_to_tanb_ttA(obs_y)

        # if other_interpretation:
        #     obs_uplimit_on_Xsec_ttH         = convert_limit_to_tanb_ttH(obs_uplimit_on_Xsec)
        #     obs_uplimit_on_Xsec_ttA         = convert_limit_to_tanb_ttA(obs_uplimit_on_Xsec)
        #     obs_uplimit_on_Xsec_ttH = array.array('d', obs_uplimit_on_Xsec_ttH)
        #     obs_uplimit_on_Xsec_ttA = array.array('d', obs_uplimit_on_Xsec_ttA)


    OneSigma_y_plus_List  = exp_uplimit_on_tanb_plus1-exp_uplimit_on_tanb
    OneSigma_y_minus_List = exp_uplimit_on_tanb-exp_uplimit_on_tanb_minus1
    TwoSigma_y_plus_List  = exp_uplimit_on_tanb_plus2-exp_uplimit_on_tanb
    TwoSigma_y_minus_List = exp_uplimit_on_tanb-exp_uplimit_on_tanb_minus2


    x = array.array('d', TeVMassList)
    # y = array.array('d', exp_uplimit_on_tanb)
    y = np.array(exp_uplimit_on_tanb)

    # Since the xsec and tanbeta is inversely relation, one (two) sigma plus <-> one (two) sigma minus
    OneSigma_x_left  = array.array('d', ZeroErrorList)
    OneSigma_y_plus  = array.array('d', OneSigma_y_plus_List)
    OneSigma_x_right = array.array('d', ZeroErrorList)
    OneSigma_y_minus = array.array('d', OneSigma_y_minus_List)
    TwoSigma_x_left  = array.array('d', ZeroErrorList)
    TwoSigma_y_plus  = array.array('d', TwoSigma_y_plus_List)
    TwoSigma_x_right = array.array('d', ZeroErrorList)
    TwoSigma_y_minus = array.array('d', TwoSigma_y_minus_List)

    print("Expected value ", repr(y))

    Exclusion = TCanvas("Exclusion","Exclusion",200,10,600,500)
    # Exclusion.SetGrid()
    # Exclusion.SetGrid(1,1)
    # For Log
    # gPad.SetLogy()

    pad_main  =  TPad("main", "main", 0, 0.05, 1, 1.0)
    pad_main.SetTopMargin(0.05)
    pad_main.SetLeftMargin(0.14)
    pad_main.SetRightMargin(0.05) #0.05
    pad_main.SetBottomMargin(0.15)
    # pad_main.SetGrid(1,1)
    pad_main.Draw()
    pad_main.cd()


    white_hist = TH1F("white_hist","white_hist",6,0.4,1)
    white_hist.SetTitle("")
    white_hist.Draw("AXIS")
    # Exclusion.Update()

    ymax = config["ymax"]
    ymin = config["ymin"]
    white_hist.SetMaximum(ymax)
    white_hist.SetMinimum(ymin)
    white_hist.GetYaxis().SetMoreLogLabels()
    if interpretation=="ttH_ttA":
        white_hist.GetXaxis().SetTitle("m_{A} = m_{H} [TeV]")
    elif interpretation=="ttH":
        white_hist.GetXaxis().SetTitle("m_{H} [TeV]")
    elif interpretation=="ttA":
        white_hist.GetXaxis().SetTitle("m_{A} [TeV]")

    white_hist.GetYaxis().SetTitle("tan#beta")

    white_hist.GetXaxis().SetTitleOffset(1.3)
    white_hist.GetYaxis().SetTitleOffset(1.3)
    white_hist.GetXaxis().SetTitleSize(0.05)
    white_hist.GetYaxis().SetTitleSize(0.05)

    white_hist.GetXaxis().SetLabelSize(0.05)
    white_hist.GetYaxis().SetLabelSize(0.05)


    # Grey area
    # if FitType=='Data':
    #     ge_exclusion = TGraphAsymmErrors(len(x), x, obs_tanb, TwoSigma_x_left, TwoSigma_x_right, obs_tanb, TwoSigma_x_left)
    #     ge_exclusion.SetFillColorAlpha(1, 0.3);
    #     # ge_exclusion.SetFillStyle(3354);
    #     ge_exclusion.SetFillStyle(1001);
    #     ge_exclusion.SetFillColor(17);
    #     # ge_exclusion.SetFillColorAlpha(16, 0.8);
    #
    # else:
    #     ge_exclusion = TGraphAsymmErrors(len(x), x, y, TwoSigma_x_left, TwoSigma_x_right, y, TwoSigma_x_left)
    #     # ge_exclusion.SetFillColorAlpha(1, 0.3);
    #     # ge_exclusion.SetFillStyle(3354);
    #     ge_exclusion.SetFillStyle(1001);
    #     ge_exclusion.SetFillColor(17);
    #     # ge_exclusion.SetFillColorAlpha(16, 0.8);
    # ge_exclusion.Draw("3 SAME")



    # mg = TMultiGraph()
    # ge = TGraphAsymmErrors(len(x), x, y, OneSigma_x_left, OneSigma_x_right, OneSigma_y_minus, OneSigma_y_plus)
    # ge.SetFillColor(kGreen)
    # ge.SetFillColor(kGreen)
    #
    # ge.SetLineColor(kRed)
    # ge.SetLineStyle(kSolid)


    # mg = TMultiGraph()
    #
    # # For Log
    # ymax = config["ymax"]
    # ymin = config["ymin"]
    # mg.SetMaximum(ymax)
    # mg.SetMinimum(ymin)
    #
    # mg.GetYaxis().SetMoreLogLabels()
    #
    # if interpretation=="ttH_ttA":
    #     mg.GetXaxis().SetTitle("m_{A} = m_{H} [TeV]")
    # elif interpretation=="ttH":
    #     mg.GetXaxis().SetTitle("m_{H} [TeV]")
    # elif interpretation=="ttA":
    #     mg.GetXaxis().SetTitle("m_{A} [TeV]")
    #
    # mg.GetYaxis().SetTitle("tan#beta")

    # mg.GetXaxis().SetLimits(0.3,1.1)
    # axis->SetLimits(0.,5.);                 // along X

    # ge = TGraphAsymmErrors(len(x), x, y, OneSigma_x_left, OneSigma_x_right, OneSigma_y_minus, OneSigma_y_plus)
    # ge.SetFillColor(kOrange-2)
    # ge.Draw("L3 SAME")

    # ge2 = TGraph(len(x), x, y)
    # ge2.SetFillColor(kRed);

    # ge2.SetFillColorAlpha(kYellow, 0.5);

    # ge2 = TGraphAsymmErrors(len(x), x, y, TwoSigma_x_left, TwoSigma_x_right, TwoSigma_y_minus, TwoSigma_y_plus)
    # ge2.SetFillColorAlpha(kYellow, 0.5);
    #
    # if FitType=='Data':
    #     ge_exclusion = TGraphAsymmErrors(len(x), x, obs_tanb, TwoSigma_x_left, TwoSigma_x_right, obs_tanb, TwoSigma_x_left)
    #     ge_exclusion.SetFillColorAlpha(1, 0.3);
    #     # ge_exclusion.SetFillStyle(3354);
    #     ge_exclusion.SetFillStyle(1001);
    #     ge_exclusion.SetFillColor(17);
    #     # ge_exclusion.SetFillColorAlpha(16, 0.8);
    #
    # else:
    #     ge_exclusion = TGraphAsymmErrors(len(x), x, y, TwoSigma_x_left, TwoSigma_x_right, y, TwoSigma_x_left)
    #     # ge_exclusion.SetFillColorAlpha(1, 0.3);
    #     # ge_exclusion.SetFillStyle(3354);
    #     ge_exclusion.SetFillStyle(1001);
    #     ge_exclusion.SetFillColor(17);
    #     # ge_exclusion.SetFillColorAlpha(16, 0.8);
    #
    # mg.Add(ge)
    # mg.Add(ge2)

    # mg.Add(ge_exclusion)
    # mg.Draw("3 SAME")
    # # mg.Draw("ALP 3")


    if draw_xs_points:
        gr_points = {}
        for k,tanb in enumerate([0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0,1.2,1.4,1.6,1.8,2.0]):

            _ ,xsec_ttH_1p0 = TheoryXSec_type2(production="ttH",tanb=tanb)
            _ ,xsec_ttA_1p0 = TheoryXSec_type2(production="ttA",tanb=tanb)
            xsec_tb = xsec_ttH_1p0+xsec_ttA_1p0
            # _, xsec_tb = TheoryXSec_type2_H_ttH(tanb=tanb)
            for i, xs in enumerate(xsec_tb):

                latex = TLatex()
                latex.SetTextSize(0.015);
                latex.SetTextFont(42);
                latex.SetTextAlign(12); #21
                latex.SetTextAngle(45);

                # latex.DrawLatex(mass_dict[i],tanb, "%.2f" % (xs*1000) ); # in unit of fb
                latex.DrawLatex(mass_dict[i]+0.005,tanb+0.05, "%.4f" % (xs) ); # in unit of pb
                # latex.DrawLatex(mass_dict[i]+0.01,tanb, "%.2e" % (xs) ); # in unit of pb - scienfic notion


            # tanb_points = TH2F("tanb_points","tanb_points",)
            array_tanb = array.array('d', [tanb]*len(x))
            gr_points[k] = TGraph(len(x),x,array_tanb)
            gr_points[k].SetMarkerSize(0.5)
            gr_points[k].SetMarkerStyle(20)
            gr_points[k].SetMarkerColor(kBlue)
            gr_points[k].SetFillStyle(0);

            gr_points[k].Draw("P SAME")



            # gr_points.Draw("SAME")

                # l = TLatex(mass_dict[i],tanb,Form("%.2f",xs));
                # latex.Paint()
    # Latex1 = TLatex(0.12,0.82,"ATLAS #bf{Work in progress}")

        # latex = TLatex(0.4,1,"100")
        # latex.SetTextSize(0.5);
        # latex.SetTextFont(42);
        # latex.SetTextAlign(21);
        # latex.Draw("SAME")

        # latex.DrawLatex(mass_dict[i],tanb,"%.2f" % xs );

    # if other_interpretation:
    #     exp_uplimit_on_tanb_ttH         = convert_limit_to_tanb_ttH(exp_uplimit_on_Xsec)
    #     exp_uplimit_on_tanb_ttA         = convert_limit_to_tanb_ttA(exp_uplimit_on_Xsec)
    #     exp_uplimit_on_tanb_ttH = array.array('d', exp_uplimit_on_tanb_ttH)
    #     exp_uplimit_on_tanb_ttA = array.array('d', exp_uplimit_on_tanb_ttA)
    #
    #     gr_ttH = TGraph(len(x),x,exp_uplimit_on_tanb_ttH)
    #     gr_ttH.SetLineColor(kOrange)
    #     gr_ttH.SetLineStyle(10)
    #     gr_ttH.SetMarkerSize(0)
    #     gr_ttH.SetMarkerStyle(1)
    #     gr_ttH.SetMarkerColor(kBlack)
    #     gr_ttH.SetLineWidth(4);
    #     gr_ttH.SetFillStyle(0);
    #     gr_ttH.Draw("L SAME")
    #
    #     gr_ttA = TGraph(len(x),x,exp_uplimit_on_tanb_ttA)
    #     gr_ttA.SetLineColor(kBlue)
    #     gr_ttA.SetLineStyle(6)
    #     gr_ttA.SetMarkerSize(0)
    #     gr_ttA.SetMarkerStyle(1)
    #     gr_ttA.SetMarkerColor(kBlack)
    #     gr_ttA.SetLineWidth(4);
    #     gr_ttA.SetFillStyle(0);
    #     gr_ttA.Draw("L SAME")
    #
    #     gr_ttH_obs = TGraph(len(x),x,obs_uplimit_on_Xsec_ttH)
    #     gr_ttH_obs.SetLineColor(kOrange)
    #     gr_ttH_obs.SetLineStyle(kSolid)
    #     gr_ttH_obs.SetMarkerSize(0)
    #     gr_ttH_obs.SetMarkerStyle(1)
    #     gr_ttH_obs.SetMarkerColor(kBlack)
    #     gr_ttH_obs.SetLineWidth(4);
    #     gr_ttH_obs.SetFillStyle(0);
    #     gr_ttH_obs.Draw("L SAME")
    #
    #     gr_ttA_obs = TGraph(len(x),x,obs_uplimit_on_Xsec_ttA)
    #     gr_ttA_obs.SetLineColor(kBlue)
    #     gr_ttA_obs.SetLineStyle(kSolid)
    #     gr_ttA_obs.SetMarkerSize(0)
    #     gr_ttA_obs.SetMarkerStyle(1)
    #     gr_ttA_obs.SetMarkerColor(kBlack)
    #     gr_ttA_obs.SetLineWidth(4);
    #     gr_ttA_obs.SetFillStyle(0);
    #     gr_ttA_obs.Draw("L SAME")






    gr_exp_error = TGraphAsymmErrors(len(x), x, y, OneSigma_x_left, OneSigma_x_right, OneSigma_y_minus, OneSigma_y_plus)
    gr_exp_error.SetFillColorAlpha(TColor.GetColor("#ffd700"),0.5) #ffe938
    # gr_exp_error.SetFillColorAlpha(kGreen,0.5) #ffe938
    # gr_exp_error.SetFillColor(kGreen) #ffe938

    # gr_exp_error.SetFillColor(5)

    # gr_exp_error.SetLineColor(kBlack)
    # gr_exp_error.SetLineStyle(9)
    # gr_exp_error.SetMarkerSize(0)
    # gr_exp_error.SetMarkerStyle(1)
    # gr_exp_error.SetLineWidth(4);
    # gr_exp_error.SetFillStyle(0);

    gr_exp_error.Draw("3 SAME")

    gr_exp = TGraph(len(x),x,y)
    gr_exp.SetLineColor(kBlack)
    # gr_exp.SetLineStyle(kDashed)
    gr_exp.SetLineStyle(9)
    gr_exp.SetMarkerSize(0)
    gr_exp.SetMarkerStyle(1)
    gr_exp.SetMarkerColor(kRed)
    gr_exp.SetLineWidth(4);
    gr_exp.SetFillStyle(0);
    gr_exp.Draw("L SAME")

    # This is for experimenatal

    # gr_exp_scale_up = TGraph(len(x),x,exp_uplimit_on_tanb_plus1)
    # gr_exp_scale_up.SetLineColor(kRed)
    # gr_exp_scale_up.SetLineStyle(7)#7
    # gr_exp_scale_up.SetMarkerSize(0.5)
    # gr_exp_scale_up.SetMarkerStyle(20)
    # gr_exp_scale_up.SetLineWidth(3);
    # gr_exp_scale_up.SetFillStyle(0);
    # gr_exp_scale_up.Draw("L SAME")
    #
    # gr_exp_scale_down = TGraph(len(x),x,exp_uplimit_on_tanb_minus1)
    # gr_exp_scale_down.SetLineColor(kRed)
    # gr_exp_scale_down.SetLineStyle(7)
    # gr_exp_scale_down.SetMarkerSize(0.5)
    # gr_exp_scale_down.SetMarkerStyle(20)
    # gr_exp_scale_down.SetLineWidth(3);
    # gr_exp_scale_down.SetFillStyle(0);
    # gr_exp_scale_down.Draw("L SAME")


    # # This is for theory uncertainty
    #
    # error_up   = np.array([0.098, 0.109 ,0.114 ,0.122 ,0.129 ,0.136 ,0.142 ])
    # error_down = np.array([0.128 ,0.136 ,0.141 ,0.148 ,0.154 ,0.160 ,0.166  ])
    #
    # exp_scale_up = np.array(y)*(1+error_up)
    # exp_scale_down = np.array(y)*(1-error_down)
    # gr_exp_scale_up = TGraph(len(x),x,exp_scale_up)
    # gr_exp_scale_up.SetLineColor(kRed)
    # gr_exp_scale_up.SetLineStyle(7)#7
    # gr_exp_scale_up.SetMarkerSize(0.5)
    # gr_exp_scale_up.SetMarkerStyle(20)
    # gr_exp_scale_up.SetLineWidth(3);
    # gr_exp_scale_up.SetFillStyle(0);
    # # gr_exp_scale_up.Draw("L SAME")
    #
    # gr_exp_scale_down = TGraph(len(x),x,exp_scale_down)
    # gr_exp_scale_down.SetLineColor(kRed)
    # gr_exp_scale_down.SetLineStyle(7)
    # gr_exp_scale_down.SetMarkerSize(0.5)
    # gr_exp_scale_down.SetMarkerStyle(20)
    # gr_exp_scale_down.SetLineWidth(3);
    # gr_exp_scale_down.SetFillStyle(0);
    # # gr_exp_scale_down.Draw("L SAME")

    TeVMassList_forObs = [0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.9999]
    x_forObs = array.array('d', TeVMassList_forObs)

    if FitType=='Data':

        # data_mg = TMultiGraph()

        gr_obs = TGraph(len(x_forObs),x_forObs,obs_tanb)

        gr_obs.SetLineColor(kRed+2)
        gr_obs.SetMarkerColor(kRed+2)

        # gr_obs.SetLineColor(kRed)
        # gr_obs.SetMarkerColor(kRed)


        gr_obs.SetLineStyle(kSolid)
        gr_obs.SetMarkerSize(1.2)
        gr_obs.SetMarkerStyle(20)

        gr_obs.SetLineWidth(4);
        gr_obs.SetFillStyle(0);
        # gr_obs.Draw("LP SAME")

        # old value
        # error_up = math.sqrt(pow(0.058,2)+pow(0.036,2)) #0.06826419266
        # error_down = math.sqrt(pow(0.092,2)+pow(0.036,2)) #0.09879271228

        error_up   = np.array([0.098, 0.109 ,0.114 ,0.122 ,0.129 ,0.136 ,0.142 ])
        error_down = np.array([0.128 ,0.136 ,0.141 ,0.148 ,0.154 ,0.160 ,0.166  ])

        obs_scale_up = np.array(obs_tanb)*(1+error_up)
        obs_scale_down = np.array(obs_tanb)*(1-error_down)
        print("Observed value",repr(obs_tanb))
        # print(obs_scale_up)
        # print(obs_scale_down)
        gr_obs_scale_up = TGraph(len(x),x,obs_scale_up)
        # gr_obs_scale_up.SetLineColor(kBlack)
        gr_obs_scale_up.SetLineColor(kRed+2)
        # gr_obs_scale_up.SetLineColor(kRed)

        gr_obs_scale_up.SetLineStyle(7)
        gr_obs_scale_up.SetMarkerSize(0.5)
        gr_obs_scale_up.SetMarkerStyle(20)
        gr_obs_scale_up.SetLineWidth(4);
        gr_obs_scale_up.SetFillStyle(0);
        gr_obs_scale_up.Draw("L SAME")

        gr_obs_scale_down = TGraph(len(x),x,obs_scale_down)
        # gr_obs_scale_down.SetLineColor(kBlack)
        gr_obs_scale_down.SetLineColor(kRed+2)
        # gr_obs_scale_down.SetLineColor(kRed)

        gr_obs_scale_down.SetLineStyle(7)
        gr_obs_scale_down.SetMarkerSize(0.5)
        gr_obs_scale_down.SetMarkerStyle(20)
        gr_obs_scale_down.SetLineWidth(4);
        gr_obs_scale_down.SetFillStyle(0);
        gr_obs_scale_down.Draw("L SAME")


        # data_mg.Add(gr_obs)
        # data_mg.Add(gr_obs_scale_up)
        # data_mg.Add(gr_obs_scale_down)
        # mg.Draw("a3")
        # data_mg.Draw("SAME")
        # print(obs_tanb)
        # print(obs_scale_up)
        # print(obs_scale_down)

        # error_up = math.sqrt(pow(0.058,2)+pow(0.036,2))
        # error_down = math.sqrt(pow(0.092,2)+pow(0.036,2))
        # obs_scale_up = np.array([error_up]*len(x))
        # obs_scale_down = np.array([error_down]*len(x))
        #
        # gr_obs_band = TGraphAsymmErrors(len(x), x, obs_tanb, OneSigma_x_left, OneSigma_x_right, obs_scale_down, obs_scale_up)
        #
        # gr_obs_band.SetLineColor(kBlack)
        # gr_obs_band.SetFillColorAlpha(1, 1);
        #
        # gr_obs_band.SetFillStyle(0);
        # gStyle.SetEndErrorSize(0)
        # gr_obs_band.Draw("LP3 SAME")



    _, previous_expected_xsec = ExpectedXsecPrevious()
    _, previous_observed_xsec = ObservedXsecPrevious()

    if interpretation=="ttH_ttA":
        previous_expected_tanb = convert_limit_to_tanb(previous_expected_xsec)
        previous_observed_xsec = convert_limit_to_tanb(previous_observed_xsec)

    elif interpretation=="ttH":
        previous_expected_tanb = convert_limit_to_tanb_ttH(previous_expected_xsec)
        previous_observed_xsec = convert_limit_to_tanb_ttH(previous_observed_xsec)

    elif interpretation=="ttA":
        previous_expected_tanb = convert_limit_to_tanb_ttA(previous_expected_xsec)
        previous_observed_xsec = convert_limit_to_tanb_ttA(previous_observed_xsec)


    if ShowPreviousResults:
        ge_Exp_previous = TGraph(len(x), x, previous_expected_tanb)
        ge_Exp_previous.SetLineColor(6)#kRed
        ge_Exp_previous.SetLineStyle(5)
        ge_Exp_previous.SetMarkerSize(0.2)
        ge_Exp_previous.SetLineWidth(4);
        ge_Exp_previous.SetFillStyle(0);
        ge_Exp_previous.Draw("L SAME")

        ge_Obs_previous = TGraph(len(x), x, previous_observed_xsec)
        ge_Obs_previous.SetLineColor(6)#kRed
        ge_Obs_previous.SetMarkerSize(0.9)
        ge_Obs_previous.SetLineStyle(kSolid)
        ge_Obs_previous.SetLineWidth(3);
        ge_Obs_previous.SetMarkerStyle(20)
        ge_Obs_previous.SetMarkerColor(6)#kRed
        ge_Obs_previous.SetFillStyle(0);
        ge_Obs_previous.Draw("L SAME")


    # Latex1 = TLatex(0.12,0.82,"ATLAS #bf{Work in progress}")
    # Latex1 = TLatex(0.15,0.82,"ATLAS #bf{Internal}")
    # Latex2 = TLatex(0.15,0.77,"#bf{#sqrt{s} = 13 TeV, 139 fb^{-1}}")
    # Latex3 = TLatex(0.15,0.72,"#bf{SSML}")
    # Latex4 = TLatex(0.15,0.67,LatexString)
    # Latex3 = TLatex(0.15,0.72,LatexString)
    # Latex4 = TLatex(0.15,0.72,"#bf{SSML}")

    # Latex1 = TLatex(0.18,0.88,"ATLAS #bf{Internal}")
    Latex1 = TLatex(0.18,0.88,"#it{ATLAS} #bf{"+ATLASLabel+"}")
    Latex2 = TLatex(0.18,0.83,"#bf{#sqrt{s} = 13 TeV, 139 fb^{-1}}")
    #Latex4 = TLatex(0.18,0.78,"#bf{BSM 4tops SSML}")
    Latex4 = TLatex(0.18,0.78,"#bf{1L/2LOS}")
    Latex6 = TLatex(0.18,0.73,"#bf{#it{All limits at 95% CL}}")


    Latex1.SetNDC() # make it abosulte position
    Latex2.SetNDC()
    # Latex3.SetNDC()
    Latex4.SetNDC()
    Latex6.SetNDC()

    Latex1.SetTextSize(40)
    Latex2.SetTextSize(35)
    # Latex3.SetTextSize(35)
    Latex4.SetTextSize(35)
    Latex6.SetTextSize(35)

    Latex1.SetTextSize(0.04)
    Latex2.SetTextSize(0.04)
    # Latex3.SetTextSize(0.04)
    Latex4.SetTextSize(0.04)
    Latex6.SetTextSize(0.04)

    Latex1.Draw("SAME")
    Latex2.Draw("SAME")
    # Latex3.Draw("SAME")
    Latex4.Draw("SAME")
    Latex6.Draw("SAME")

    if interpretation=="ttH_ttA":
        Latex5 = TLatex(0.515,0.63,"#bf{Scalar + pseudo-scalar}")
    elif interpretation=="ttH":
        Latex5 = TLatex(0.515,0.63,"#bf{Scalar}")
    elif interpretation=="ttA":
        Latex5 = TLatex(0.515,0.63,"#bf{Pseudo-scalar}")

    Latex5.SetNDC()
    Latex5.SetTextAlign(11)
    Latex5.SetTextSize(35)
    Latex5.SetTextSize(0.045)
    Latex5.Draw("SAME")


    # legend = TLegend(0.5,0.65,0.88,0.88)
    legend = TLegend(0.5,0.7,0.88,0.93)

    if ShowPreviousResults:
        legend.AddEntry(ge_Obs_previous,"Observed (36 fb^{-1})","l")
        legend.AddEntry(ge_Exp_previous,"Expected (36 fb^{-1})","l")

    # if other_interpretation:
    #     legend.AddEntry(gr_ttH,"Exp. ttH int. (139 fb^{-1})","l")
    #     legend.AddEntry(gr_ttA,"Exp. ttA int. (139 fb^{-1})","l")

    # legend.AddEntry(ge_exclusion,"95% CL exclusion regions (139 fb^{-1})","lf")
    if FitType=='Data':
        # if other_interpretation:
        #
        #     legend.AddEntry(gr_ttH_obs,"Obs. ttH int. (139 fb^{-1})","l")
        #     legend.AddEntry(gr_ttA_obs,"Exp. ttA int. (139 fb^{-1})","l")


        legend.AddEntry(gr_obs,"Observed","lp")
        legend.AddEntry(gr_obs_scale_up,"Observed #pm1 #sigma_{theory}","l")


        # legend.AddEntry(data_mg,"Observed #pm 1#sigma_{theory} (139 fb^{-1})","l")
    legend.AddEntry(gr_exp,"Expected","l")
    legend.AddEntry(gr_exp_error,"Expected #pm1 #sigma_{experiment}","f")
    # legend.AddEntry(mg,"#pm 1#sigma","le")

    # legend.AddEntry(ge,"#pm 1#sigma","f")
    # legend.AddEntry(ge2,"#pm 2#sigma","f")
    legend.Draw("same")
    legend.SetBorderSize(0)




    # obs_tanb_list = obs_tanb.tolist()
    # exp_uplimit_on_tanb_list = exp_uplimit_on_tanb.tolist()
    # exp_uplimit_on_tanb_minus1_list = exp_uplimit_on_tanb_minus1.tolist()
    # exp_uplimit_on_tanb_minus2_list = exp_uplimit_on_tanb_minus2.tolist()
    # exp_uplimit_on_tanb_plus1_list = exp_uplimit_on_tanb_plus1.tolist()
    # exp_uplimit_on_tanb_plus2_list = exp_uplimit_on_tanb_plus2.tolist()
    # obs_scale_down_list = obs_scale_down.tolist()
    # obs_scale_up_list = obs_scale_up.tolist()

    # obs_tanb_list = list(obs_tanb)
    # exp_uplimit_on_tanb_list = list(exp_uplimit_on_tanb)
    # exp_uplimit_on_tanb_minus1_list = list(exp_uplimit_on_tanb_minus1)
    # exp_uplimit_on_tanb_minus2_list = list(exp_uplimit_on_tanb_minus2)
    # exp_uplimit_on_tanb_plus1_list = list(exp_uplimit_on_tanb_plus1)
    # exp_uplimit_on_tanb_plus2_list = list(exp_uplimit_on_tanb_plus2)
    # obs_scale_down_list = list(obs_scale_down)
    # obs_scale_up_list = list(obs_scale_up)


    print("Observed")
    for i in range(obs_tanb.shape[0]):
        print("  - value: %.8f" % (obs_tanb[i]))
        print("    errors:")
        print("    - {asymerror: {plus: %.8f, minus: %.8f}, label: '1 sigma'}" % (obs_scale_up[i]-obs_tanb[i],obs_scale_down[i]-obs_tanb[i]) )
        # print("    - {asymerror: {plus: %.8f, minus: %.8f}, label: '2 sigma'}" % (exp_uplimit_on_tanb_plus2[i]-exp_uplimit_on_tanb[i],exp_uplimit_on_tanb_minus2[i]-exp_uplimit_on_tanb[i]) )

    print()
    print("Expected")
    for i in range(exp_uplimit_on_tanb.shape[0]):
        print("  - value: %.8f" % (exp_uplimit_on_tanb[i]))
        print("    errors:")
        print("    - {asymerror: {plus: %.8f, minus: %.8f}, label: '1 sigma'}" % (exp_uplimit_on_tanb_plus1[i]-exp_uplimit_on_tanb[i],exp_uplimit_on_tanb_minus1[i]-exp_uplimit_on_tanb[i]) )
        # print("    - {asymerror: {plus: %.8f, minus: %.8f}, label: '2 sigma'}" % (exp_uplimit_on_tanb_plus2[i]-exp_uplimit_on_tanb[i],exp_uplimit_on_tanb_minus2[i]-exp_uplimit_on_tanb[i]) )






    # axis1 = ge_Exp_previous.GetXaxis()
    # axis1 = gr_exp.GetXaxis()
    axis1 = white_hist.GetXaxis() #xaxis
    axis2 = white_hist.GetYaxis() #yaxis

    # Let the axis to be negative
    # axis1.SetTickLength(-0.015);
    # axis2.SetTickLength(-0.015);

    axis1.SetTickLength(0.03);
    axis2.SetTickLength(0.03);

    axis1.SetLabelOffset(0.02)
    axis2.SetLabelOffset(0.02)
    # axis1.Draw("same")
    # axis2.Draw("same")

    # To make the axis redraw in case the fill color overlap the axis
    gPad.RedrawAxis()

    # xmin = axis1.GetXmin()+0.03
    # xmax = axis1.GetXmax()-0.03
    xmin = axis1.GetXmin()
    xmax = axis1.GetXmax()

    ypos = Exclusion.GetFrame().GetY2()
    # xpos = Exclusion.GetFrame().GetX2()+0.03
    xpos = Exclusion.GetFrame().GetX2()
    # print(xmin,xmax,xpos,ypos)

    ypos = ymax
    # x_axis2 = TGaxis(xmin,ypos,xmax,ypos,xmin,xmax,510,"US+")#U-
    x_axis2 = TGaxis(xmin,ypos,xmax,ypos,xmin,xmax,510,"US-")#U-
    x_axis2.SetName("x_axis2");
    x_axis2.SetLabelFont(42)
    x_axis2.SetLabelSize(0.03)
    x_axis2.SetTickSize(0.015);
    x_axis2.Draw("same")

    # y_axis2 = TGaxis(xpos,ymin,xpos,ymax,ymin,ymax,510,"US-")
    y_axis2 = TGaxis(xpos,ymin,xpos,ymax,ymin,ymax,510,"US+")
    y_axis2.SetName("y_axis2");
    y_axis2.SetLabelFont(42)
    y_axis2.SetLabelSize(0.03)
    y_axis2.SetTickSize(0.015);
    y_axis2.Draw("same")

    x_axis2.SetTickLength(0.03);
    y_axis2.SetTickLength(0.03);

    if FitType=='Data':
        gr_obs.Draw("LP SAME")

    Exclusion.Update()
    Exclusion.SaveAs(outputfolder+savename)

def GetLine(input_Xsec_BR,config=DefaultConfig):

    n_mass_points = len(input_Xsec_BR)
    f = list(range(n_mass_points))
    exp_uplimit_on_musignal = list(range(n_mass_points))
    exp_uplimit_on_Xsec = list(range(n_mass_points))

    InputPrefix = config["InputPrefix"]
    InputSuffix = config["InputSuffix"]
    InputFolder = config["InputFolder"]
    SigType = config.get("SigType") # exp, obs
    FitType = config.get("FitType") # exp, obs
    interpretation = config.get("interpretation") # exp, obs

    if FitType==None:
        FitFile = "myLimit_BLIND_CL95.root"
    elif FitType=='Real' or FitType=='Data':
        FitFile = "myLimit_CL95.root"
    elif FitType=='Plain':
        FitFile = "myLimit_BLIND_CL95.root"
    else:
        FitFile = "myLimit_BLIND_CL95.root"

    for i in range(n_mass_points): # range(i,j) from i to j-1
        file_name = InputPrefix+str(MassList[i])+InputSuffix
        f[i] = TFile(InputFolder+file_name+"/Limits/asymptotics/"+FitFile)
        stats = f[i].Get("stats")
        stats.GetEntry(0)
        # gDirectory.GetObject("stats",stats)
        # stats.Scan("exp_upperlimit:exp_upperlimit_plus1:exp_upperlimit_plus2:exp_upperlimit_minus1:exp_upperlimit_minus2")
        exp_uplimit_on_musignal[i] = stats.GetLeaf(SigType+"_upperlimit").GetValue(0)
        exp_uplimit_on_Xsec[i] = exp_uplimit_on_musignal[i] * input_Xsec_BR[i] * 0.001  # 0.001 to make the unit become pb
        stats.Delete()

    # x = array.array('d', TeVMassList)
    exp_uplimit_on_Xsec = np.array(exp_uplimit_on_Xsec)

    if interpretation=="ttH_ttA":
        exp_uplimit_on_tanb = convert_limit_to_tanb(exp_uplimit_on_Xsec)

    elif interpretation=="ttH":
        exp_uplimit_on_tanb = convert_limit_to_tanb_ttH(exp_uplimit_on_Xsec)

    elif interpretation=="ttA":
        exp_uplimit_on_tanb = convert_limit_to_tanb_ttA(exp_uplimit_on_Xsec)

    y = array.array('d', exp_uplimit_on_tanb)

    return y

def GetLine_envelope(GetLine_envelope,config=DefaultConfig):

    n_mass_points = len(Xsec_BR)
    f = list(range(n_mass_points))
    exp_uplimit_on_musignal = list(range(n_mass_points))
    exp_uplimit_on_Xsec = list(range(n_mass_points))

    Input_Results = config.get("Input_Results")
    InputFolder = config["InputFolder"]
    SigType = config.get("SigType") # exp, obs
    FitType = config.get("FitType") # exp, obs
    interpretation = config.get("interpretation") # exp, obs

    if FitType==None:
        FitFile = "myLimit_BLIND_CL95.root"
    elif FitType=='Real' or FitType=='Data':
        FitFile = "myLimit_CL95.root"
    elif FitType=='Plain':
        FitFile = "myLimit_BLIND_CL95.root"
    else:
        FitFile = "myLimit_BLIND_CL95.root"

    for i in range(n_mass_points): # range(i,j) from i to j-1
        f[i] = TFile(InputFolder+Input_Results[i]+"/Limits/asymptotics/"+FitFile)
        stats = f[i].Get("stats")
        stats.GetEntry(0)
        # gDirectory.GetObject("stats",stats)
        # stats.Scan("exp_upperlimit:exp_upperlimit_plus1:exp_upperlimit_plus2:exp_upperlimit_minus1:exp_upperlimit_minus2")
        exp_uplimit_on_musignal[i] = stats.GetLeaf(SigType+"_upperlimit").GetValue(0)
        exp_uplimit_on_Xsec[i] = exp_uplimit_on_musignal[i] * Xsec_BR[i] * 0.001  # 0.001 to make the unit become pb
        stats.Delete()

    # x = array.array('d', TeVMassList)
    exp_uplimit_on_Xsec = np.array(exp_uplimit_on_Xsec)


    if interpretation=="ttH_ttA":
        exp_uplimit_on_tanb = convert_limit_to_tanb(exp_uplimit_on_Xsec)

    elif interpretation=="ttH":
        exp_uplimit_on_tanb = convert_limit_to_tanb_ttH(exp_uplimit_on_Xsec)

    elif interpretation=="ttA":
        exp_uplimit_on_tanb = convert_limit_to_tanb_ttA(exp_uplimit_on_Xsec)


    y = array.array('d', exp_uplimit_on_tanb)

    return y

def ExpectedXsecPrevious():
    # The cross section is from https://www.hepdata.net/record/83662
    Xsec = [0.0369488, 0.0318703, 0.0230452, 0.0252039, 0.0204837, 0.021061, 0.0189155]
    XsecList = array.array('d', Xsec)
    Xsec_nparray = np.array(Xsec)
    return XsecList, Xsec_nparray

def ObservedXsecPrevious():
    Xsec = [0.0832549, 0.0635521, 0.0508356, 0.053125, 0.040798, 0.0417561, 0.0356999]
    XsecList = array.array('d', Xsec)
    Xsec_nparray = np.array(Xsec)

    return XsecList, Xsec_nparray

# This is from previous verison
# def TheoryXSec_type2_H_ttH_tan0p1(): # CrossSec_xsec_H_ttH_type_2_tanbeta_5.txt
#     Xsec = [1.973215,1.158386,0.841158,0.523318,0.316680,0.221414,0.126109]
#     XsecList = array.array('d', Xsec)
#     Xsec_nparray = np.array(Xsec)
#
#     return XsecList, Xsec_nparray
#
# def TheoryXSec_type2_H_ttH_tan0p5(): # CrossSec_xsec_H_ttH_type_2_tanbeta_5.txt
#     Xsec = [0.078918,0.046333, 0.033645,0.020932, 0.012667,0.008856,0.005044]
#     XsecList = array.array('d', Xsec)
#     return XsecList
#
# def TheoryXSec_type2_H_ttH_tan1p0(): # CrossSec_xsec_H_ttH_type_2_tanbeta_5.txt
#     Xsec = [0.019691,0.011575,0.008407,0.005231,0.003165,0.002213,0.001261]
#     XsecList = array.array('d', Xsec)
#     return XsecList

# New version 1.6.8
def TheoryXSec_type2(production="ttH",tanb=0.3):

    ### temporary change
    #filename = "xsec_times_br_"+production+"_tttt_type2_tanbeta_"+str(tanb).replace('.','p')+".txt"
    #with open("xsec_times_br/"+filename) as f:
    filename = "/eos/user/l/lmao/4t/combined_results/2D_plot/CrossSec_xsec_A_ttH_type_2_tanbeta_10.txt"
    with open(filename) as f:
        lines = f.readlines()
        xsec_dict = {}

        mass_LIST = []
        xsec_LIST = []

        for line in lines:
            #mass_LIST.append(float(line.split(',')[0])/1000)
            #xsec_LIST.append(float(line.split(',')[1].replace('\n','')))
            mass_LIST.append(float(line.split(' ')[0])/1000)
            xsec_LIST.append(float(line.split(' ')[1].replace('\n','')))

    # mass_LIST = array.array('d', mass_LIST)
    # xsec_LIST = array.array('d', xsec_LIST)

    mass_LIST = np.array(mass_LIST)
    xsec_LIST = np.array(xsec_LIST)


    return mass_LIST,xsec_LIST


def Comparison(config):

    Exclusion = TCanvas("Exclusion","Exclusion",200,10,600,500)
    Exclusion.SetGrid(1,1)

    mg = TMultiGraph()
    ylog = config["ylog"]
    if ylog:
        gPad.SetLogy()

    ymin = config["ymin"]
    ymax = config["ymax"]
    interpretation = config.get("interpretation")

    mg.SetMaximum(ymax)
    mg.SetMinimum(ymin)
    mg.GetYaxis().SetMoreLogLabels()
    mg.GetXaxis().SetTitle("m_{H/A} [TeV]")
    mg.GetYaxis().SetTitle("tan#beta")

    x = array.array('d', TeVMassList)

    _, previous_expected_xsec = ExpectedXsecPrevious()

    if interpretation=="ttH_ttA":
        previous_expected_tanb = convert_limit_to_tanb(previous_expected_xsec)

    elif interpretation=="ttH":
        previous_expected_tanb = convert_limit_to_tanb_ttH(previous_expected_xsec)

    elif interpretation=="ttA":
        previous_expected_tanb = convert_limit_to_tanb_ttA(previous_expected_xsec)

    ge_Exp_previous = TGraph(len(x), x, previous_expected_tanb)

    gr = []
    color = [1,2,3,4,6,9,28,35,46]

    ShowOldResults = config["ShowOldResults"]
    if ShowOldResults:
        ge_Exp_previous.SetLineColor(kBlack)
        ge_Exp_previous.SetLineWidth(4)
        ge_Exp_previous.SetMarkerSize(0.5)
        ge_Exp_previous.SetLineStyle(kDashed)
        ge_Exp_previous.SetMarkerStyle(8)
        ge_Exp_previous.SetFillStyle(3005);

        # ge_Obs_previous.SetLineColor(kBlack)
        # ge_Obs_previous.SetLineWidth(2)
        # ge_Obs_previous.SetMarkerSize(0.8)
        # ge_Obs_previous.SetLineStyle(kSolid)
        # ge_Obs_previous.SetMarkerStyle(8)
        # ge_Obs_previous.SetFillStyle(3005);


    # legend = TLegend(0.55,0.55,0.88,0.88)
    legend = TLegend(0.55,0.65,0.88,0.88)
    if ShowOldResults:
        legend.AddEntry(ge_Exp_previous,"Median expected 36 fb^{-1}","l")
        # legend.AddEntry(ge_Obs_previous,"36 fb^{-1} Observed results","l")
    legend.SetFillStyle(0);
    LineConfig = config["LineConfig"]
    # InputFolder = config["InputFolder"]
    savename    = config["savename"]
    outputfolder = config["outputfolder"]
    os.system("mkdir -p "+outputfolder)
    for i, configfile in enumerate(LineConfig):
        if configfile.get("Input_Results")!=None:
            LimitArray = GetLine_envelope(Xsec_BR_12fb,config=configfile)
        else:
            LimitArray = GetLine(Xsec_BR_12fb,config=configfile)

        # LimitArray = GetLine(Xsec_BR,config=configfile)
        gr.append(TGraph(len(x), x, LimitArray))
        gr[i].SetLineColor(color[i])
        gr[i].SetLineWidth(2)
        gr[i].SetMarkerSize(0.5)
        gr[i].SetMarkerStyle(8)
        gr[i].SetFillStyle(3005);
        mg.Add(gr[i])
        legend.AddEntry(gr[i],configfile["name"],"l")
    if ShowOldResults:
        mg.Add(ge_Exp_previous)
        # mg.Add(ge_Obs_previous)
    #mg.Draw("ACP")
    mg.Draw("ALP")

    # Latex1 = TLatex(0.12,0.82,"ATLAS #bf{Work in progress}")
    # Latex1 = TLatex(0.15,0.82,"ATLAS #bf{Internal}")
    Latex1 = TLatex(0.15,0.82,"ATLAS #bf{"+ATLASLabel+"}")


    Latex2 = TLatex(0.15,0.77,"#bf{#sqrt{s} = 13 TeV, 139 fb^{-1}}")
    #Latex3 = TLatex(0.15,0.72,"#bf{BSM 4tops SSML}")
    Latex3 = TLatex(0.15,0.72,"#bf{1L/2LOS}")


    Latex1.SetNDC() # make it abosulte position
    Latex2.SetNDC()
    Latex3.SetNDC()

    Latex1.SetTextSize(40)
    Latex2.SetTextSize(35)
    Latex3.SetTextSize(35)

    Latex1.SetTextSize(0.04)
    Latex2.SetTextSize(0.04)
    Latex3.SetTextSize(0.04)

    Latex1.Draw("SAME")
    Latex2.Draw("SAME")
    Latex3.Draw("SAME")

    if interpretation=="ttH_ttA":
        Latex5 = TLatex(0.515,0.58,"#bf{Scalar+pseudo-scalar}")
    elif interpretation=="ttH":
        Latex5 = TLatex(0.515,0.58,"#bf{Scalar}")
    elif interpretation=="ttA":
        Latex5 = TLatex(0.515,0.58,"#bf{Pseudo-scalar}")

    Latex5.SetNDC()
    Latex5.SetTextAlign(11)
    Latex5.SetTextSize(35)
    Latex5.SetTextSize(0.04)
    Latex5.Draw("SAME")

    legend.Draw("same")
    legend.SetBorderSize(0)

    Exclusion.SaveAs(outputfolder+savename)


def compare_strategy():

    # # BSM BDT with SMBDT as input
    # v212120_BSMBDT_bkg_config = {"InputPrefix": "BSM4T_BDTFit_bkg_RealAsimov_v212120_mH",
    #           "InputSuffix": "",
    #           "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/",
    #           "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/BSM4T_BDTFit_bkg_RealAsimov_v212120_ttttXsec50/",
    #           "savename": "limit.pdf",
    #           "name": "Method2",
    #         }
    #
    # Single_tanb_Plot(Xsec_BR,config=v212120_BSMBDT_bkg_config)
    #
    # # BSM BDT nominal (optimal set + mH)
    # v212120_BSMBDT_config = {"InputPrefix": "BSM4T_BDTFit_RealAsimov_v212120_mH",
    #           "InputSuffix": "",
    #           "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/",
    #           "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/BSM4T_BDTFit_RealAsimov_v212120_ttttXsec50/",
    #           "savename": "limit.pdf",
    #           "name": "Nominal (ttttXsec50)",
    #         }
    #
    # Single_tanb_Plot(Xsec_BR,config=v212120_BSMBDT_config)
    #
    # # 212075 results
    # v212075_BSMBDT_config = {"InputPrefix": "BSM_Finalfit_Full_Syst_mH",
    #           "InputSuffix": "_NewBDT_Auto5Bin_23_EachMass_BDTL02_RealisticAsimov_ttttXsec50_NFtttt1_official",
    #           "InputFolder": "/lustre/umt3/user/metsai/hbsm4top/FitResults/protected_212075_May2020_Oct2020/20200801_BSMBDT/ttttXsec/",
    #           "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/BSM4T_BDTFit_RealAsimov_v212075_ttttXsec50/",
    #           "savename": "limit.pdf",
    #           "name": "v212075 (full syst)",
    #         }
    #
    # Single_tanb_Plot(Xsec_BR,config=v212075_BSMBDT_config)
    #
    #
    # ############
    #
    # comparison_config = {"LineConfig": [v212075_BSMBDT_config,v212120_BSMBDT_config,v212120_BSMBDT_bkg_config],
    #                      "ShowOldResults": True,
    #                      "ShowTheory": False,
    #                       "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/BSM4T_BDTFit_RealAsimov_v212075_v212120_comparison/",
    #                       "savename": "comparison-1.pdf",
    #                       "ymin":1e-3,
    #                       "ymax":1,
    #                     }
    #
    # Comparison(comparison_config)
    #
    #
    # ############
    #
    # comparison_config = {"LineConfig": [v212075_BSMBDT_config,v212120_BSMBDT_config,v212120_BSMBDT_bkg_config],
    #                      "ShowOldResults": True,
    #                      "ShowTheory": False,
    #                       "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/BSM4T_BDTFit_RealAsimov_v212075_v212120_comparison/",
    #                       "savename": "comparison-2.pdf",
    #                       "ymin":5e-3,
    #                       "ymax":1,
    #                     }
    #
    # Comparison(comparison_config)
    #
    # ############
    #
    # comparison_config = {"LineConfig": [v212075_BSMBDT_config,v212120_BSMBDT_config,v212120_BSMBDT_bkg_config],
    #                      "ShowOldResults": False,
    #                      "ShowTheory": False,
    #                       "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/BSM4T_BDTFit_RealAsimov_v212075_v212120_comparison/",
    #                       "savename": "comparison-3.pdf",
    #                       "ymin":5e-3,
    #                       "ymax":2e-2,
    #                     }
    #
    # Comparison(comparison_config)


    # 202103012
    # Nominal SM BDT with Nominal BSM BDT (w/ tttt_xsec 20%)
    v212120_NominalSMBDT_NominalBSMBDT_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_nominal_212120_RealAsimov_",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_v3/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210312_BSM4top_reduce_ttWsyst/tanb/",
              "savename": "Tanb_NominalSMBDT_NominalBSMBDT.pdf",
              "name": "Nominal",
              "ymin":0,
              "ymax":3,

            }

    Single_tanb_Plot(Xsec_BR,config=v212120_NominalSMBDT_NominalBSMBDT_config)

    # New SM BDT with Nominal BSM BDT (w/ tttt_xsec 20%)
    v212120_NewSMBDT_NominalBSMBDT_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_NewSMBDT_NominalBSMBDT_212120_RealAsimov_",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_v3/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210312_BSM4top_reduce_ttWsyst/tanb/",
              "savename": "Tanb_NewSMBDT_NominalBSMBDT.pdf",
              "name": "New SMBDT, nom BSMBDT",
              "ymin":0,
              "ymax":3,

            }

    Single_tanb_Plot(Xsec_BR,config=v212120_NewSMBDT_NominalBSMBDT_config)


    # New SM BDT with New BSM BDT bkg (w/ tttt_xsec 20%)
    v212120_NewSMBDT_NewBSMBDT_bkg_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_NewSMBDT_NewBSMBDT_bkg_212120_RealAsimov_",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_v3/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210312_BSM4top_reduce_ttWsyst/tanb/",
              "savename": "Tanb_NewSMBDT_NewBSMBDT_withNewSMBDT.pdf",
              "name": "New SMBDT, New BSMBDT (w/ SMBDT, no bkg)",
              "ymin":0,
              "ymax":3,

            }

    Single_tanb_Plot(Xsec_BR,config=v212120_NewSMBDT_NewBSMBDT_bkg_config)

    # New SM BDT with New BSM BDT bkg02 (w/ tttt_xsec 20%)
    v212120_NewSMBDT_NewBSMBDT_bkg02_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_NewSMBDT_NewBSMBDT_bkg02_212120_RealAsimov_",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_v3/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210312_BSM4top_reduce_ttWsyst/tanb/",
              "savename": "Tanb_NewSMBDT_NewBSMBDT_bkg02.pdf",
              "name": "New SMBDT,New BSMBDT bkg02",
              "ymin":0,
              "ymax":3,

            }

    Single_tanb_Plot(Xsec_BR,config=v212120_NewSMBDT_NewBSMBDT_bkg02_config)

    # New SM BDT with New BSM BDT bkg03 (w/ tttt_xsec 20%)
    v212120_NewSMBDT_NewBSMBDT_bkg03_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_NewSMBDT_NewBSMBDT_bkg03_212120_RealAsimov_",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_v3/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210312_BSM4top_reduce_ttWsyst/tanb/",
              "savename": "Tanb_NewSMBDT_NewBSMBDT_bkg03.pdf",
              "name": "New SMBDT,New BSMBDT bkg03",
              "ymin":0,
              "ymax":3,

            }

    Single_tanb_Plot(Xsec_BR,config=v212120_NewSMBDT_NewBSMBDT_bkg03_config)

    # New SM BDT with New BSM BDT bkg04 (w/ tttt_xsec 20%)
    v212120_NewSMBDT_NewBSMBDT_bkg04_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_NewSMBDT_NewBSMBDT_bkg04_212120_RealAsimov_",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_v3/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210312_BSM4top_reduce_ttWsyst/tanb/",
              "savename": "Tanb_NewSMBDT_NewBSMBDT_bkg04.pdf",
              "name": "New SMBDT,New BSMBDT bkg04",
              "ymin":0,
              "ymax":3,

            }

    Single_tanb_Plot(Xsec_BR,config=v212120_NewSMBDT_NewBSMBDT_bkg04_config)

    # New SM BDT with New BSM BDT bkg05 (w/ tttt_xsec 20%)
    v212120_NewSMBDT_NewBSMBDT_bkg05_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_NewSMBDT_NewBSMBDT_bkg05_212120_RealAsimov_",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_v3/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210312_BSM4top_reduce_ttWsyst/tanb/",
              "savename": "Tanb_NewSMBDT_NewBSMBDT_bkg05.pdf",
              "name": "New SMBDT,New BSMBDT bkg05",
              "ymin":0,
              "ymax":3,

            }

    Single_tanb_Plot(Xsec_BR,config=v212120_NewSMBDT_NewBSMBDT_bkg05_config)

    # New SM BDT with New BSM BDT bkg06 (w/ tttt_xsec 20%)
    v212120_NewSMBDT_NewBSMBDT_bkg06_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_NewSMBDT_NewBSMBDT_bkg06_212120_RealAsimov_",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_v3/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210312_BSM4top_reduce_ttWsyst/tanb/",
              "savename": "Tanb_NewSMBDT_NewBSMBDT_bkg06.pdf",
              "name": "New SMBDT,New BSMBDT bkg06",
              "ymin":0,
              "ymax":3,

            }

    Single_tanb_Plot(Xsec_BR,config=v212120_NewSMBDT_NewBSMBDT_bkg06_config)

    # New SM BDT with New BSM BDT bkg07 (w/ tttt_xsec 20%)
    v212120_NewSMBDT_NewBSMBDT_bkg07_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_NewSMBDT_NewBSMBDT_bkg07_212120_RealAsimov_",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_v3/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210312_BSM4top_reduce_ttWsyst/tanb/",
              "savename": "Tanb_NewSMBDT_NewBSMBDT_bkg07.pdf",
              "name": "New SMBDT,New BSMBDT bkg07",
              "ymin":0,
              "ymax":3,

            }

    Single_tanb_Plot(Xsec_BR,config=v212120_NewSMBDT_NewBSMBDT_bkg07_config)

    # New SM BDT with New BSM BDT bkg07 (w/ tttt_xsec 20%)
    v212120_NewSMBDT_NewBSMBDT_bkg07_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_NewSMBDT_NewBSMBDT_bkg07_212120_RealAsimov_",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_v3/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210312_BSM4top_reduce_ttWsyst/tanb/",
              "savename": "Tanb_NewSMBDT_NewBSMBDT_bkg07_ymax2.pdf",
              "name": "New SMBDT,New BSMBDT bkg07",
              "ymin":0,
              "ymax":2,

            }

    Single_tanb_Plot(Xsec_BR,config=v212120_NewSMBDT_NewBSMBDT_bkg07_config)


    # New SM BDT with New BSM BDT bkg08 (w/ tttt_xsec 20%)
    v212120_NewSMBDT_NewBSMBDT_bkg08_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_NewSMBDT_NewBSMBDT_bkg08_212120_RealAsimov_",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_v3/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210312_BSM4top_reduce_ttWsyst/tanb/",
              "savename": "Tanb_NewSMBDT_NewBSMBDT_bkg08.pdf",
              "name": "New SMBDT,New BSMBDT bkg08",
              "ymin":0,
              "ymax":3,

            }

    Single_tanb_Plot(Xsec_BR,config=v212120_NewSMBDT_NewBSMBDT_bkg08_config)

    # New SM BDT with New BSM BDT bkg09 (w/ tttt_xsec 20%)
    v212120_NewSMBDT_NewBSMBDT_bkg09_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_NewSMBDT_NewBSMBDT_bkg09_212120_RealAsimov_",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_v3/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210312_BSM4top_reduce_ttWsyst/tanb/",
              "savename": "Tanb_NewSMBDT_NewBSMBDT_bkg09.pdf",
              "name": "New SMBDT,New BSMBDT bkg09",
              "ymin":0,
              "ymax":3,

            }

    Single_tanb_Plot(Xsec_BR,config=v212120_NewSMBDT_NewBSMBDT_bkg09_config)

    # pBDT ttW ratio 04 : other 06
    v212120_pBDT_ttWratio04_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_pBDT_ttWratio04_212120_RealAsimov_",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_v3/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210312_BSM4top_reduce_ttWsyst/tanb/",
              "savename": "Tanb_pBDT_ttWratio04.pdf",
              "name": "Single pBDT (ttW:other=0.4:0.6)",
              "ymin":0,
              "ymax":3,

            }

    Single_tanb_Plot(Xsec_BR,config=v212120_pBDT_ttWratio04_config)


    # pBDT ttW ratio 04 : SM 4top 03: other 03
    v212120_pBDT_ttWratio04_SM4top03_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_pBDT_ttWratio04_SM4top03_212120_RealAsimov_",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_v3/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210312_BSM4top_reduce_ttWsyst/tanb/",
              "savename": "Tanb_pBDT_ttWratio04_SM4top03.pdf",
              "name": "Single pBDT (ttW:4top:other=0.4:0.3:0.3)",
              "ymin":0,
              "ymax":3,

            }

    Single_tanb_Plot(Xsec_BR,config=v212120_pBDT_ttWratio04_SM4top03_config)



    # Comparison between Nominal SM BDT vs. New SM BDT
    comparison_Nominal_vs_New_SMBDT_config = {"LineConfig": [v212120_NominalSMBDT_NominalBSMBDT_config,v212120_NewSMBDT_NominalBSMBDT_config,
                                                            v212120_NewSMBDT_NewBSMBDT_bkg_config],
                         "ShowOldResults": False,
                         "ShowTheory": False,
                          "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210312_BSM4top_reduce_ttWsyst/tanb/",
                          "savename": "Tanb_comparison_Nominal_NewSMBDT.pdf",
                          "ymin":0.5,
                          "ymax":2,
                          "ylog": True,
                        }

    Comparison(comparison_Nominal_vs_New_SMBDT_config)



    # Comparison
    comparison_config = {"LineConfig": [v212120_NominalSMBDT_NominalBSMBDT_config,
                                        v212120_NewSMBDT_NewBSMBDT_bkg02_config,v212120_NewSMBDT_NewBSMBDT_bkg03_config,v212120_NewSMBDT_NewBSMBDT_bkg04_config,
                                        v212120_NewSMBDT_NewBSMBDT_bkg05_config,v212120_NewSMBDT_NewBSMBDT_bkg06_config,v212120_NewSMBDT_NewBSMBDT_bkg07_config,
                                        v212120_NewSMBDT_NewBSMBDT_bkg08_config,v212120_NewSMBDT_NewBSMBDT_bkg09_config,
                                        ],
                         "ShowOldResults": False,
                         "ShowTheory": False,
                          "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210312_BSM4top_reduce_ttWsyst/tanb/",
                          "savename": "Tanb_comparison_Nominal_NewSMBDT_newBSMBDT.pdf",
                          "ymin":0.5,
                          "ymax":2,
                          "ylog": True,
                        }

    Comparison(comparison_config)


    # Comparison
    comparison_config = {"LineConfig": [v212120_NominalSMBDT_NominalBSMBDT_config,v212120_NewSMBDT_NewBSMBDT_bkg07_config,v212120_NewSMBDT_NewBSMBDT_bkg09_config,
                                        v212120_pBDT_ttWratio04_config,v212120_pBDT_ttWratio04_SM4top03_config
                                        ],
                         "ShowOldResults": False,
                         "ShowTheory": False,
                          "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210312_BSM4top_reduce_ttWsyst/tanb/",
                          "savename": "Tanb_comparison_2DBDT_1DBDT.pdf",
                          "ymin":0.5,
                          "ymax":2,
                          "ylog": True,
                        }

    Comparison(comparison_config)

    # Comparison
    comparison_config = {"LineConfig": [v212120_NominalSMBDT_NominalBSMBDT_config,v212120_NewSMBDT_NewBSMBDT_bkg07_config,v212120_NewSMBDT_NewBSMBDT_bkg09_config,
                                        ],
                         "ShowOldResults": False,
                         "ShowTheory": False,
                          "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210312_BSM4top_reduce_ttWsyst/tanb/",
                          "savename": "Tanb_comparison_2DBDTs.pdf",
                          "ymin":0.5,
                          "ymax":2,
                          "ylog": True,
                        }

    Comparison(comparison_config)



def BDT_scan():

    # New SM BDT with New BSM BDT bkg07 (w/ tttt_xsec 20%)
    v212120_NewSMBDT_NewBSMBDT_bkg07_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_NewSMBDT_NewBSMBDT_bkg07_212120_RealAsimov_",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_v3/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210323_SRCutOpt_AutoBin/tanb/",
              "savename": "tanb_NewSMBDT_NewBSMBDT_bkg07_L06.pdf",
              "name": "New SMBDT, New BSMBDT bkg07 (old)",
                "ymin":0,
                "ymax":3,

            }

    # New SM BDT with New BSM BDT bkg07 (w/ tttt_xsec 20%)
    v212120_bkg07_BDTScanL06_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_NewSMBDT_NewBSMBDT_bkg07_SRCutOptL06_212120_RealAsimov_",
                                      "InputSuffix": "",
                                      "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_SRCutOpt_AutoBin_v3/",
                                      "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210323_SRCutOpt_AutoBin/tanb/",
                                      "savename": "tanb_NewSMBDT_NewBSMBDT_bkg07_L06_new.pdf",
                                      "name": "New SMBDT, New BSMBDT bkg07 (new)",
                          "ymin":0.5,
                          "ymax":2,

                                    }
    # Comparison
    comparison_config = {"LineConfig": [v212120_NewSMBDT_NewBSMBDT_bkg07_config,
                                        v212120_bkg07_BDTScanL06_config,
                                        ],
                         "ShowOldResults": False,
                         "ShowTheory": False,
                          "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210323_SRCutOpt_AutoBin/tanb/",
                          "savename": "Comparison_NewStrategy_old_new.pdf",
                          "ymin":0.5,
                          "ymax":2,
                          "ylog": True,
                        }

    Comparison(comparison_config)

    # New SM BDT with New BSM BDT bkg07 (w/ tttt_xsec 20%)
    v212120_bkg07_BDTScanL00_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_NewSMBDT_NewBSMBDT_bkg07_1DpBSMBDT_212120_RealAsimov_",
                                      "InputSuffix": "",
                                      "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_SRCutOpt_AutoBin_v3/",
                                      "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210323_SRCutOpt_AutoBin/tanb/",
                                      "savename": "tanb_NewSMBDT_NewBSMBDT_bkg07_L00_new.pdf",
                                      "name": "BSM BDT only",
                                      "ymin":0,
                                      "ymax":3,

                                    }

    Single_tanb_Plot(Xsec_BR,config=v212120_bkg07_BDTScanL00_config)

    # New SM BDT with New BSM BDT bkg07 (w/ tttt_xsec 20%)
    v212120_bkg07_BDTScanL055_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_NewSMBDT_NewBSMBDT_bkg07_SRCutOptL055_212120_RealAsimov_",
                                      "InputSuffix": "",
                                      "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_SRCutOpt_AutoBin_v3/",
                                      "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210323_SRCutOpt_AutoBin/tanb/",
                                      "savename": "tanb_NewSMBDT_NewBSMBDT_bkg07_L055_new.pdf",
                                      "name": "BSM SR (SMBDT>0.55)",
                                      "ymin":0,
                                      "ymax":3,

                                    }

    Single_tanb_Plot(Xsec_BR,config=v212120_bkg07_BDTScanL055_config)

    # New SM BDT with New BSM BDT bkg07 (w/ tttt_xsec 20%)
    v212120_bkg07_BDTScanL06_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_NewSMBDT_NewBSMBDT_bkg07_SRCutOptL06_212120_RealAsimov_",
                                      "InputSuffix": "",
                                      "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_SRCutOpt_AutoBin_v3/",
                                      "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210323_SRCutOpt_AutoBin/tanb/",
                                      "savename": "tanb_NewSMBDT_NewBSMBDT_bkg07_L06_new.pdf",
                                      "name": "BSM SR (SMBDT>0.6)",
                                        "ymin":0.5,
                                        "ymax":2,

                                    }

    # New SM BDT with New BSM BDT bkg07 (w/ tttt_xsec 20%)
    v212120_bkg07_BDTScanL09_config = {"InputPrefix": "BSM4T_BDTFit_Reduce_ttWsyst_ttttXsec20_NewSMBDT_NewBSMBDT_bkg07_SRCutOptL09_212120_RealAsimov_",
                                      "InputSuffix": "",
                                      "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/20210312_BSM4tops_SRCutOpt_AutoBin_v3/",
                                      "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210323_SRCutOpt_AutoBin/tanb/",
                                      "savename": "tanb_NewSMBDT_NewBSMBDT_bkg07_L09_new.pdf",
                                      "name": "BSM SR (SMBDT>0.9)",
                                        "ymin":0.5,
                                        "ymax":2,

                                    }


    # Comparison
    comparison_config = {"LineConfig": [v212120_bkg07_BDTScanL00_config,
                                        v212120_bkg07_BDTScanL055_config,
                                        v212120_bkg07_BDTScanL06_config,
                                        v212120_bkg07_BDTScanL09_config,
                                        ],
                         "ShowOldResults": False,
                         "ShowTheory": False,
                          "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/20210323_SRCutOpt_AutoBin/tanb/",
                          "savename": "Comparison_different_BDTCut.pdf",
                          "ylog": True,
                          "ymin":4e-1,
                          "ymax":2,
                        }

    Comparison(comparison_config)

def full_syst_v1():
    v212120_2DBDTL00_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL00_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL00_RealAsimov.pdf",
              "name": "BSM pBDT fit",
              "ymin":0,
              "ymax":3,
            }

    v212120_2DBDTL015_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL015_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL015_RealAsimov.pdf",
              "name": "2DBDT L015",
              "ymin":0,
              "ymax":3,
            }

    v212120_2DBDTL02_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL02_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL02_RealAsimov.pdf",
              "name": "2DBDT L02",
              "ymin":0,
              "ymax":3,
            }

    v212120_2DBDTL025_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL025_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL025_RealAsimov.pdf",
              "name": "2DBDT L025",
              "ymin":0,
              "ymax":3,
            }

    v212120_2DBDTL03_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL03_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL03_RealAsimov.pdf",
              "name": "2DBDT L03",
              "ymin":0,
              "ymax":3,
            }

    v212120_2DBDTL035_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL035_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL035_RealAsimov.pdf",
              "name": "2DBDT L035",
              "ymin":0,
              "ymax":3,
            }

    v212120_2DBDTL04_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL04_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL04_RealAsimov.pdf",
              "name": "2DBDT L04",
              "ymin":0,
              "ymax":3,
            }

    v212120_2DBDTL045_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL045_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL045_RealAsimov.pdf",
              "name": "2DBDT L045",
              "ymin":0,
              "ymax":3,
            }

    v212120_2DBDTL05_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL05_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL05_RealAsimov.pdf",
              "name": "2DBDT L05",
              "ymin":0,
              "ymax":3,
            }

    v212120_2DBDTL055_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL055_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL055_RealAsimov.pdf",
              "name": "2DBDT L055",
              "ymin":0,
              "ymax":3,
            }


    v212120_2DBDTL06_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL06_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL06_RealAsimov.pdf",
              "name": "2DBDT L06",
              "ymin":0,
              "ymax":3,
            }

    v212120_2DBDTL065_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL065_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL065_RealAsimov.pdf",
              "name": "2DBDT L065",
              "ymin":0,
              "ymax":3,
            }

    v212120_2DBDTL07_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL07_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL07_RealAsimov.pdf",
              "name": "2DBDT L07",
              "ymin":0,
              "ymax":3,
            }

    v212120_2DBDTL075_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL075_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL075_RealAsimov.pdf",
              "name": "2DBDT L075",
              "ymin":0,
              "ymax":3,
            }

    v212120_2DBDTL08_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL08_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL08_RealAsimov.pdf",
              "name": "2DBDT L08",
              "ymin":0,
              "ymax":3,
            }

    v212120_2DBDTL085_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL085_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL085_RealAsimov.pdf",
              "name": "2DBDT L085",
              "ymin":0,
              "ymax":3,
            }

    v212120_2DBDTL09_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL09_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL09_RealAsimov.pdf",
              "name": "2DBDT L09",
              "ymin":0,
              "ymax":3,
            }



    # Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL00_config)
    # Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL015_config)
    # Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL02_config)
    # Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL025_config)
    # Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL03_config)
    # Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL035_config)
    # Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL04_config)
    # Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL045_config)
    # Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL05_config)
    # Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL055_config)
    # Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL06_config)
    # Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL065_config)
    # Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL07_config)
    # Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL075_config)
    # Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL08_config)
    # Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL085_config)
    # Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL09_config)


    # Comparison
    comparison_config = {"LineConfig": [
                                        v212120_2DBDTL00_config,
                                        # v212120_2DBDTL015_config,
                                        # v212120_2DBDTL02_config,
                                        v212120_2DBDTL025_config,
                                        # v212120_2DBDTL03_config,
                                        # v212120_2DBDTL035_config,
                                        # v212120_2DBDTL04_config,
                                        # v212120_2DBDTL045_config,
                                        # v212120_2DBDTL05_config,
                                        v212120_2DBDTL055_config,
                                        # v212120_2DBDTL06_config,
                                        # v212120_2DBDTL065_config,
                                        # v212120_2DBDTL07_config,
                                        # v212120_2DBDTL075_config,
                                        # v212120_2DBDTL08_config,
                                        # v212120_2DBDTL085_config,
                                        # v212120_2DBDTL09_config,
                                        ],
                         "ShowOldResults": False,
                         "ShowTheory": False,
                          "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
                          "savename": "Comparison_all_methods_RealAsimov.pdf",
                          "ymin":0.5,
                          "ymax":2,
                          "ylog": True,
                        }

    # Comparison(comparison_config)





    v212120_2DBDTL055_PlainAsimov_config = {"InputPrefix": "FourTop_BDTFit_PlainAsimov_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL055_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL055_PlainAsimov.pdf",
              "name": "Plain Asimov",
              "ymin":0,
              "ymax":3,
            }
    Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL055_PlainAsimov_config)


    v212120_2DBDTL055_StatOnly_config = {"InputPrefix": "FourTop_BDTFit_PlainAsimov_StatOnly_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL055_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL055_StatOnly.pdf",
              "name": "StatOnly",
              "ymin":0,
              "ymax":3,
            }
    Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL055_StatOnly_config)



    v212120_2DBDTL055_RealAsimov_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v1_1_sherpa228_EW_2DBDTL055_mH",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210417_v1_1/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
              "savename": "2DBDTL055_RealAsimov.pdf",
              "name": "Realistic Asimov",
              "ymin":0,
              "ymax":3,
            }
    Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL055_RealAsimov_config)

    comparison_config = {"LineConfig": [
                                        v212120_2DBDTL055_RealAsimov_config,
                                        v212120_2DBDTL055_PlainAsimov_config,
                                        v212120_2DBDTL055_StatOnly_config,
                                        ],
                         "ShowOldResults": False,
                         "ShowTheory": False,
                          "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210417_v1_1/tanb/Comparison/",
                          "savename": "Comparison_Plain_Real_L055.pdf",
                          "ymin":0.5,
                          "ymax":2,
                          "ylog": True,
                        }

    Comparison(comparison_config)


def full_syst_Post1stEB():
    # plot_dict = {}
    #
    # scanlist = ['0_4','1_3','2_2','3_1','4_0','0_5','1_4','2_3','3_2','4_1','5_0','0_6','1_5','2_4','3_3','4_2','5_1','6_0','0_7','1_6','2_5','3_4','4_3','5_2','6_1','7_0']
    # # scanlist = ['0_4','1_3','2_2','3_1','4_0','0_5','1_4','2_3','3_2','4_1','5_0','0_6','1_5','2_4','3_3','4_2','5_1','6_0','0_7','1_6','3_4','4_3','5_2','6_1','7_0']
    #
    # for binning in scanlist:
    #
    #     plot_dict["v212120_2DBDTL055_AutoBin_"+binning+"_config"] = {"InputPrefix": "FourTop_BDTFit_RealAsimov_mH",
    #               "InputSuffix": "_v212120_FullSyst_v5_finalBDT_sherpa228_EW_DDQmisID_ttWQCDOnlySyst_L055_Autobin_"+binning,
    #               "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210601_v5_FinalBDT_ttWQCDOnlySyst/",
    #               "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210601_v5_FinalBDT_ttWQCDOnlySyst/tanb/Comparison/",
    #               "savename": "2DBDTL055_RealAsimov_AutoBin_"+binning+".pdf",
    #               "name": "AutoBin (zs,zb)=("+binning.split("_")[0]+","+binning.split("_")[1]+")",
    #               "SigType": "obs",
    #             }
    #
    #
    #     # Single_tanb_Plot(Xsec_BR,config=plot_dict["v212120_2DBDTL055_AutoBin_"+binning+"_config"])
    #
    #
    # v212120_2DBDTL055_envelope_config = {"Input_Results":  ["FourTop_BDTFit_RealAsimov_mH400_v212120_FullSyst_v5_finalBDT_sherpa228_EW_DDQmisID_ttWQCDOnlySyst_L055_Autobin_2_3",
    #                                                         "FourTop_BDTFit_RealAsimov_mH500_v212120_FullSyst_v5_finalBDT_sherpa228_EW_DDQmisID_ttWQCDOnlySyst_L055_Autobin_3_2",
    #                                                         "FourTop_BDTFit_RealAsimov_mH600_v212120_FullSyst_v5_finalBDT_sherpa228_EW_DDQmisID_ttWQCDOnlySyst_L055_Autobin_4_1",
    #                                                         "FourTop_BDTFit_RealAsimov_mH700_v212120_FullSyst_v5_finalBDT_sherpa228_EW_DDQmisID_ttWQCDOnlySyst_L055_Autobin_2_3",
    #                                                         "FourTop_BDTFit_RealAsimov_mH800_v212120_FullSyst_v5_finalBDT_sherpa228_EW_DDQmisID_ttWQCDOnlySyst_L055_Autobin_2_3",
    #                                                         "FourTop_BDTFit_RealAsimov_mH900_v212120_FullSyst_v5_finalBDT_sherpa228_EW_DDQmisID_ttWQCDOnlySyst_L055_Autobin_3_2",
    #                                                         "FourTop_BDTFit_RealAsimov_mH1000_v212120_FullSyst_v5_finalBDT_sherpa228_EW_DDQmisID_ttWQCDOnlySyst_L055_Autobin_3_2",
    #                                                         ],
    #           "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210601_v5_FinalBDT_ttWQCDOnlySyst/",
    #           "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210601_v5_FinalBDT_ttWQCDOnlySyst/tanb/Comparison/",
    #           "savename": "2DBDTL055_RealAsimov_realistic_envelope.pdf",
    #           "name": "Realistic",
    #           "SigType": "obs",
    #           "ymin":0,
    #           "ymax":3,
    #
    #         }
    # Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL055_envelope_config)
    #
    # v212120_2DBDTL055_envelope_exp_config = {"Input_Results":  ["FourTop_BDTFit_RealAsimov_mH400_v212120_FullSyst_v5_finalBDT_sherpa228_EW_DDQmisID_ttWQCDOnlySyst_L055_Autobin_2_3",
    #                                                         "FourTop_BDTFit_RealAsimov_mH500_v212120_FullSyst_v5_finalBDT_sherpa228_EW_DDQmisID_ttWQCDOnlySyst_L055_Autobin_3_2",
    #                                                         "FourTop_BDTFit_RealAsimov_mH600_v212120_FullSyst_v5_finalBDT_sherpa228_EW_DDQmisID_ttWQCDOnlySyst_L055_Autobin_4_1",
    #                                                         "FourTop_BDTFit_RealAsimov_mH700_v212120_FullSyst_v5_finalBDT_sherpa228_EW_DDQmisID_ttWQCDOnlySyst_L055_Autobin_2_3",
    #                                                         "FourTop_BDTFit_RealAsimov_mH800_v212120_FullSyst_v5_finalBDT_sherpa228_EW_DDQmisID_ttWQCDOnlySyst_L055_Autobin_2_3",
    #                                                         "FourTop_BDTFit_RealAsimov_mH900_v212120_FullSyst_v5_finalBDT_sherpa228_EW_DDQmisID_ttWQCDOnlySyst_L055_Autobin_3_2",
    #                                                         "FourTop_BDTFit_RealAsimov_mH1000_v212120_FullSyst_v5_finalBDT_sherpa228_EW_DDQmisID_ttWQCDOnlySyst_L055_Autobin_3_2",
    #                                                         ],
    #           "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210601_v5_FinalBDT_ttWQCDOnlySyst/",
    #           "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210601_v5_FinalBDT_ttWQCDOnlySyst/tanb/Comparison/",
    #           "savename": "2DBDTL055_RealAsimov_NFOnly_envelope.pdf",
    #           "name": "Inject NF only",
    #           "SigType": "exp",
    #           "ymin":0,
    #           "ymax":3,
    #         }
    # Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL055_envelope_exp_config)
    #
    # comparison_config = {"LineConfig": [v212120_2DBDTL055_envelope_exp_config,v212120_2DBDTL055_envelope_config,
    #                                     ],
    #                       "ShowOldResults": False,
    #                       "ShowTheory": False,
    #                       "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210601_v5_FinalBDT_ttWQCDOnlySyst/tanb/Comparison/",
    #                       "savename": "Comparison_2DBDTL055_NFOnly_realistic.pdf",
    #                       "ymin":0.5,
    #                       "ymax":2,
    #                       "ylog": True,
    #                     }
    #
    # Comparison(comparison_config)






    # StatOnly
    v212120_2DBDTL055_StatOnly_config = {"InputPrefix": "StatOnly_",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210601_v5_FinalBDT_ttWQCDOnlySyst/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210601_v5_FinalBDT_ttWQCDOnlySyst/tanb/Comparison/",
              "savename": "tanb_2DBDTL055_StatOnly.pdf",
              "name": "StatOnly",
              "SigType": "exp",
              "ymin":0,
              "ymax":3,
              "FitType": "StatOnly",
            }
    Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL055_StatOnly_config)

    # Plain
    v212120_2DBDTL055_Plain_config = {"InputPrefix": "plain_",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210601_v5_FinalBDT_ttWQCDOnlySyst/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210601_v5_FinalBDT_ttWQCDOnlySyst/tanb/Comparison/",
              "savename": "tanb_2DBDTL055_PlainAsimov.pdf",
              "name": "Plain Asimov",
              "SigType": "exp",
              "ymin":0,
              "ymax":3,
              "FitType": "Plain",
            }
    Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL055_Plain_config)

    v212120_2DBDTL055_Real_config = {"InputPrefix": "optimal_",
              "InputSuffix": "",
              "InputFolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210601_v5_FinalBDT_ttWQCDOnlySyst/",
              "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210601_v5_FinalBDT_ttWQCDOnlySyst/tanb/Comparison/",
              "savename": "tanb_2DBDTL055_RealAsimov.pdf",
              "name": "Realistic Asimov",
              "SigType": "exp",
              "ymin":0,
              "ymax":3,
              "FitType": "Real",
            }
    Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL055_Real_config)


    comparison_config = {"LineConfig": [v212120_2DBDTL055_StatOnly_config,v212120_2DBDTL055_Plain_config,v212120_2DBDTL055_Real_config,
                                        ],
                          "ShowOldResults": False,
                          "ShowTheory": False,
                          "outputfolder": "/atlas/data19/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210601_v5_FinalBDT_ttWQCDOnlySyst/tanb/Comparison/",
                          "savename": "tanb_Comparison_Plain_Real_L055.pdf",
                          "ymin":0.5,
                          "ymax":2.5,
                          "ylog": True,
                        }

    Comparison(comparison_config)

def full_syst_finalfit_ForUnblinding():

    plot_dict = {}
    outputfolder = "/home/metsai/hbsm4top/bsm4topssml_fitter/final_fit/results/4T_FullSyst_v212120_Date20210601_v6_FinalBDT_FinalSetup_DPF/tanb/Comparison/"

    # 2D Eta rates with ttW QCD+EW as nominal, ttW QCD syst
    v212120_2DBDTL055_Real_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v6_finalBDT_sherpa228_ttWQCDOnly_DDQmisID_COCR_2D_rates_Final_mH",
              "InputSuffix": "",
              "InputFolder": "/home/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210601_v6_FinalBDT_ttWQCDOnlySyst/",
              "outputfolder": outputfolder,
              "savename": "Tanb_final_setup.pdf",
              "name": "Expected limit ",
              "SigType": "exp",
              "FitType": "Real",
              "ymin":0,
              "ymax":3,
            }
    Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL055_Real_config)


    # 2D Eta rates with ttW QCD+EW as nominal, ttW QCD syst
    v212120_2DBDTL055_comp_Plain_config = {"InputPrefix": "FourTop_BDTFit_PlainAsimov_v212120_FullSyst_v6_finalBDT_sherpa228_ttWQCDOnly_DDQmisID_COCR_2D_rates_Final_mH",
              "InputSuffix": "",
              "InputFolder": "/home/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210601_v6_FinalBDT_ttWQCDOnlySyst/",
              "outputfolder": outputfolder,
              "savename": "Limit_Plain.pdf",
              "name": "Plain Asimov",
              "SigType": "exp",
              "FitType": "Plain",
            }

    v212120_2DBDTL055_comp_Real_config = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v6_finalBDT_sherpa228_ttWQCDOnly_DDQmisID_COCR_2D_rates_Final_mH",
              "InputSuffix": "",
              "InputFolder": "/home/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210601_v6_FinalBDT_ttWQCDOnlySyst/",
              "outputfolder": outputfolder,
              "savename": "Limit_Realistic.pdf",
              "name": "Realistic Asimov",
              "SigType": "exp",
              "FitType": "Real",
            }

    v212120_2DBDTL055_comp_StatOnly_config = {"InputPrefix": "FourTop_BDTFit_StatOnly_v212120_FullSyst_v6_finalBDT_sherpa228_ttWQCDOnly_DDQmisID_COCR_2D_rates_Final_mH",
              "InputSuffix": "",
              "InputFolder": "/home/metsai/hbsm4top/bsm4topssml_fitter/final_fit/fit/4T_FullSyst_v212120_Date20210601_v6_FinalBDT_ttWQCDOnlySyst/",
              "outputfolder": outputfolder,
              "savename": "Limit_StatOnly.pdf",
              "name": "StatOnly",
              "SigType": "exp",
              "FitType": "StatOnly",
            }

    comparison_config = {"LineConfig": [v212120_2DBDTL055_comp_StatOnly_config,v212120_2DBDTL055_comp_Plain_config,
                                        v212120_2DBDTL055_comp_Real_config,
                                        ],
                          "ShowOldResults": False,
                          "ShowTheory": False,
                          "outputfolder": outputfolder,
                          "savename": "Tanb_Comparison_setup.pdf",
                          "ymin":0,
                          "ymax":3,
                          "ylog": False,
                        }

    Comparison(comparison_config)


def full_syst_finalfit_3rdEB(): # 3rd EB and unblinding clousre

    plot_dict = {}
    inputfolder = "fit/4T_FullSyst_v212120_Date20210701_v7_FinalBDT_ttWQCDEW/"
    outputfolder = "results/4T_FullSyst_v212120_Date20210701_v7_FinalBDT_ttWQCDEW/Tanb/Comparison/"


    # Sherpa 2210 QCD+EW , ttZ, sh2210
    # Plain (sh2210)
    v212120_2DBDTL055_comp_Plain_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_plain_v212120_FullSyst_v7_finalBDT_sherpa2210_ttWQCDEW_DDQmisID_COCR_2D_rates_Final_mH",
              "InputSuffix": "",
              "InputFolder": inputfolder,
              "outputfolder": outputfolder,
              "savename": "Limit_Plain.pdf",
              "name": "Plain Asimov",
              "SigType": "exp",
              "FitType": "Plain",
              "ymin":0,
              "ymax":3,
            }
    Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL055_comp_Plain_config_sh2210QCDEW)

    # StatOnly (sh2210)
    v212120_2DBDTL055_comp_StatOnly_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_statonly_v212120_FullSyst_v7_finalBDT_sherpa2210_ttWQCDEW_DDQmisID_COCR_2D_rates_Final_mH",
              "InputSuffix": "",
              "InputFolder": inputfolder,
              "outputfolder": outputfolder,
              "savename": "Limit_StatOnly.pdf",
              "name": "StatOnly",
              "SigType": "exp",
              "FitType": "StatOnly",
              "ymin":0,
              "ymax":3,

            }
    Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL055_comp_StatOnly_config_sh2210QCDEW)

    # Real (sh2210)
    v212120_2DBDTL055_comp_Real_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_real_v212120_FullSyst_v7_finalBDT_sherpa2210_ttWQCDEW_DDQmisID_COCR_2D_rates_Final_mH",
                                          "InputSuffix": "",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Limit_Realistic.pdf",
                                          "name": "Realistic Asimov",
                                          "SigType": "exp",
                                          "FitType": "Real",
                                          "ymin":0,
                                          "ymax":3,
                                        }
    Single_tanb_Plot(Xsec_BR,config=v212120_2DBDTL055_comp_Real_config_sh2210QCDEW)


    comparison_config = {"LineConfig": [v212120_2DBDTL055_comp_StatOnly_config_sh2210QCDEW,v212120_2DBDTL055_comp_Plain_config_sh2210QCDEW,
                                        v212120_2DBDTL055_comp_Real_config_sh2210QCDEW,
                                        ],
                          "ShowOldResults": False,
                          "ShowTheory": False,
                          "outputfolder": outputfolder,
                          "savename": "limit_Comparison_setup_sh2210QCDEW.pdf",
                          "ymin":0.5,
                          "ymax":2.5,
                          "ylog": False,
                        }

    Comparison(comparison_config)



    # Plain (sh2218)
    v212120_2DBDTL055_comp_Plain_config_sh228QCD = {"InputPrefix": "FourTop_BDTFit_PlainAsimov_v212120_FullSyst_v6_finalBDT_sherpa228_ttWQCDOnly_DDQmisID_COCR_2D_rates_Final_mH",
              "InputSuffix": "",
              "InputFolder": "fit/4T_FullSyst_v212120_Date20210601_v6_FinalBDT_ttWQCDOnlySyst/",
              "outputfolder": outputfolder,
              "savename": "Limit_Plain.pdf",
              "name": "Plain Asimov",
              "SigType": "exp",
              "FitType": "Plain",
            }

    v212120_2DBDTL055_comp_StatOnly_config_sh228QCD = {"InputPrefix": "FourTop_BDTFit_StatOnly_v212120_FullSyst_v6_finalBDT_sherpa228_ttWQCDOnly_DDQmisID_COCR_2D_rates_Final_mH",
              "InputSuffix": "",
              "InputFolder": "fit/4T_FullSyst_v212120_Date20210601_v6_FinalBDT_ttWQCDOnlySyst/",
              "outputfolder": outputfolder,
              "savename": "Limit_StatOnly.pdf",
              "name": "StatOnly",
              "SigType": "exp",
              "FitType": "StatOnly",
            }


    v212120_2DBDTL055_comp_Real_config_sh228QCD = {"InputPrefix": "FourTop_BDTFit_RealAsimov_v212120_FullSyst_v6_finalBDT_sherpa228_ttWQCDOnly_DDQmisID_COCR_2D_rates_Final_mH",
              "InputSuffix": "",
              "InputFolder": "fit/4T_FullSyst_v212120_Date20210601_v6_FinalBDT_ttWQCDOnlySyst/",
              "outputfolder": outputfolder,
              "savename": "Limit_Realistic.pdf",
              "name": "Realistic Asimov",
              "SigType": "exp",
              "FitType": "Real",
            }


    # Compare Real
    v212120_2DBDTL055_comp_Plain_config_sh228QCD["name"] = "last unblind appr."
    v212120_2DBDTL055_comp_Plain_config_sh2210QCDEW["name"] = "New"

    v212120_2DBDTL055_comp_StatOnly_config_sh228QCD["name"] = "last unblind appr."
    v212120_2DBDTL055_comp_StatOnly_config_sh2210QCDEW["name"] = "New"

    v212120_2DBDTL055_comp_Real_config_sh228QCD["name"] = "last unblind appr."
    v212120_2DBDTL055_comp_Real_config_sh2210QCDEW["name"] = "New"



    comparison_config = {"LineConfig": [v212120_2DBDTL055_comp_Plain_config_sh228QCD,v212120_2DBDTL055_comp_Plain_config_sh2210QCDEW,
                                        ],
                          "ShowOldResults": False,
                          "ShowTheory": False,
                          "outputfolder": outputfolder,
                          "savename": "limit_plain_Sh228QCD_Sh2210QCDEW.pdf",
                          "ymin":0.5,
                          "ymax":2.5,
                          "ratio_max": 1.1,
                          "ratio_min": 0.85,
                          "draw_ratio": True,
                          "LengenTextSize": 0.05 ,
                          "ylog": False,
                        }

    Comparison(comparison_config)



    comparison_config = {"LineConfig": [v212120_2DBDTL055_comp_StatOnly_config_sh228QCD,v212120_2DBDTL055_comp_StatOnly_config_sh2210QCDEW,
                                        ],
                          "ShowOldResults": False,
                          "ShowTheory": False,
                          "outputfolder": outputfolder,
                          "savename": "limit_statonly_Sh228QCD_Sh2210QCDEW.pdf",
                          "ymin":0.5,
                          "ymax":2.5,
                          "ratio_max": 1.1,
                          "ratio_min": 0.85,
                          "draw_ratio": True,
                          "LengenTextSize": 0.05,
                          "ylog": False,
                        }

    Comparison(comparison_config)

    comparison_config = {"LineConfig": [v212120_2DBDTL055_comp_Real_config_sh228QCD,v212120_2DBDTL055_comp_Real_config_sh2210QCDEW,],
                          "ShowOldResults": False,
                          "ShowTheory": False,
                          "outputfolder": outputfolder,
                          "savename": "limit_real_Sh228QCD_Sh2210QCDEW.pdf",
                          "ymin":0.5,
                          "ymax":2.5,
                          "ratio_max": 1.1,
                          "ratio_min": 0.85,
                          "draw_ratio": True,
                          "LengenTextSize": 0.05,
                          "ylog": False,
                        }

    Comparison(comparison_config)

def full_syst_Unblinding():


    # run in MICHIGAN Cluster
    # inputfolder = "fit/4T_FullSyst_v212120_Date20211006_v10_FinalBDT_ttWQCDEW_deco_4tEW/"
    # outputfolder = "results/4T_FullSyst_v212120_Date20211006_v10_FinalBDT_ttWQCDEW_deco_4tEW/tanb/Comparison/"
    inputfolder = "/lustre/umt3/user/metsai/analysis/4tops/fit/4T_FullSyst_v212120_Date20211006_v10_FinalBDT_ttWQCDEW_deco_4tEW/"
    outputfolder = "/lustre/umt3/user/metsai/analysis/4tops/results/4T_FullSyst_v212120_Date20211006_v10_FinalBDT_ttWQCDEW_deco_4tEW/tanb/Comparison/"


    # # statonly
    v212120_2DBDTL055_comp_StatOnly_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_statonly_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v10_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "savename": "StatOnly_12fb.pdf",
                                          "name": "StatOnly",
                                          "SigType": "exp",
                                          "FitType": "StatOnly",
                                          "ymin":0,
                                          "ymax":3,

                                        }

    # # Plain
    v212120_2DBDTL055_comp_Plain_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_plain_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v10_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "savename": "Plain_12fb.pdf",
                                          "name": "Plain",
                                          "SigType": "exp",
                                          "FitType": "Plain",
                                          "ymin":0,
                                          "ymax":3,

                                        }

    # # Real - L025 CROnly model
    v212120_2DBDTL025_comp_Real_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_real_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v10_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "savename": "Real_CRL025_12fb.pdf",
                                          "name": "Real (CRL025)",
                                          "SigType": "exp",
                                          "FitType": "Real",
                                          "ymin":0,
                                          "ymax":3,

                                        }


    # Real - L055 CROnly model
    v212120_2DBDTL055_comp_Real_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_real_BSM4t_L055_mH",
                                          "InputSuffix": "_v212120_FullSyst_v10_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Real_CRL055_12fb.pdf",
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Real (CRL055)",
                                          "SigType": "exp",
                                          "FitType": "Real",
                                          "ymin":0,
                                          "ymax":3,
                                        }

    # Data - L055
    v212120_2DBDTL055_comp_Data_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_data_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v10_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Data_12fb.pdf",
                                          "draw_xs_points": False,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Data",
                                          "SigType": "obs",
                                          "FitType": "Data",
                                          "ymin":0,
                                          "ymax":4,
                                        }

    # Data - L055 (no xsec points)
    v212120_2DBDTL055_comp_Data_12fb_config_sh2210QCDEW_HasXSpoints = {"InputPrefix": "FourTop_BDTFit_data_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v10_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "draw_xs_points": True,
                                          "savename": "Data_12fb_XSpoints.pdf",
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Data",
                                          "SigType": "obs",
                                          "FitType": "Data",
                                          "ymin":0,
                                          "ymax":4,
                                        }


    # Data - L055 (free floating)
    v212120_2DBDTL055_comp_Data_freefloatSM4t_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_data_BSM4t_freefloatSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v10_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Data_freefloatSM4t_12fb.pdf",
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Data",
                                          # "SigType": "obs",
                                          "FitType": "Data",
                                          "ymin":0,
                                          "ymax":3,
                                        }

    # Data - L055 (all ttH/ttA)
    v212120_2DBDTL055_comp_Data_allInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_data_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v10_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Data_12fb_ALL_hasPrevious.pdf",
                                          "draw_xs_points": False,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Data",
                                          "SigType": "obs",
                                          "FitType": "Data",
                                          "ShowPreviousResults": True,
                                          "interpretation": "ttH_ttA",
                                          "ymin":0,
                                          "ymax":3,
                                        }

    # Data - L055 (all ttH/ttA)
    v212120_2DBDTL055_comp_Data_ttHInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_data_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v10_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Data_12fb_ttH_hasPrevious.pdf",
                                          "draw_xs_points": False,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Data",
                                          "SigType": "obs",
                                          "FitType": "Data",
                                          "interpretation": "ttH",
                                          "ShowPreviousResults": True,
                                          "ymin":0,
                                          "ymax":3,
                                        }

    # Data - L055 (all ttH/ttA)
    v212120_2DBDTL055_comp_Data_ttAInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_data_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v10_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Data_12fb_ttA_hasPrevious.pdf",
                                          "draw_xs_points": False,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Data",
                                          "SigType": "obs",
                                          "FitType": "Data",
                                          "interpretation": "ttA",
                                          "ShowPreviousResults": True,
                                          "ymin":0,
                                          "ymax":3,
                                        }


    # Data - L055 (all ttH/ttA)
    v212120_2DBDTL055_comp_Data_allInterpretation_12fb_config_sh2210QCDEW_noPrevious = {"InputPrefix": "FourTop_BDTFit_data_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v10_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Data_12fb_ALL.pdf",
                                          "draw_xs_points": False,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Data",
                                          "SigType": "obs",
                                          "FitType": "Data",
                                          # "other_interpretation": True,
                                          "interpretation": "ttH_ttA",
                                          "ymin":0,
                                          "ymax":3,
                                        }

    # Data - L055 (all ttH/ttA)
    v212120_2DBDTL055_comp_Data_ttHInterpretation_12fb_config_sh2210QCDEW_noPrevious = {"InputPrefix": "FourTop_BDTFit_data_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v10_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Data_12fb_ttH.pdf",
                                          "draw_xs_points": False,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Data",
                                          "SigType": "obs",
                                          "FitType": "Data",
                                          "interpretation": "ttH",
                                          "ymin":0,
                                          "ymax":3,
                                        }

    # Data - L055 (all ttH/ttA)
    v212120_2DBDTL055_comp_Data_ttAInterpretation_12fb_config_sh2210QCDEW_noPrevious = {"InputPrefix": "FourTop_BDTFit_data_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v10_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Data_12fb_ttA.pdf",
                                          "draw_xs_points": False,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Data",
                                          "SigType": "obs",
                                          "FitType": "Data",
                                          "interpretation": "ttA",
                                          "ymin":0,
                                          "ymax":3,
                                        }



    Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_StatOnly_12fb_config_sh2210QCDEW)
    Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Plain_12fb_config_sh2210QCDEW)

    Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL025_comp_Real_12fb_config_sh2210QCDEW)
    Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Real_12fb_config_sh2210QCDEW)
    Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_12fb_config_sh2210QCDEW)
    Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_12fb_config_sh2210QCDEW_HasXSpoints)
    Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_allInterpretation_12fb_config_sh2210QCDEW)
    Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_ttHInterpretation_12fb_config_sh2210QCDEW)
    Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_ttAInterpretation_12fb_config_sh2210QCDEW)

    Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_allInterpretation_12fb_config_sh2210QCDEW_noPrevious)
    Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_ttHInterpretation_12fb_config_sh2210QCDEW_noPrevious)
    Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_ttAInterpretation_12fb_config_sh2210QCDEW_noPrevious)



    comparison_config = {"LineConfig": [v212120_2DBDTL055_comp_StatOnly_12fb_config_sh2210QCDEW,
                                        v212120_2DBDTL055_comp_Plain_12fb_config_sh2210QCDEW,
                                        v212120_2DBDTL025_comp_Real_12fb_config_sh2210QCDEW,
                                        v212120_2DBDTL055_comp_Real_12fb_config_sh2210QCDEW,
                                        v212120_2DBDTL055_comp_Data_12fb_config_sh2210QCDEW,
                                        ],
                          "ShowOldResults": False,
                          "ShowTheory": False,
                          "outputfolder": outputfolder,
                          "savename": "Comp_all.pdf",
                          "ymin":0,
                          "ymax":3,
                          "ratio_max": 1.1,
                          "ratio_min": 0.85,
                          "draw_ratio": True,
                          "LengenTextSize": 0.05,
                          "ylog": False,

                        }

    Comparison(comparison_config)


    # comparison_config = {"LineConfig": [v212120_2DBDTL055_comp_Real_12fb_config_sh2210QCDEW,
    #                                     v212120_2DBDTL055_comp_Real_12fb_L055_config_sh2210QCDEW,
    #                                     v212120_2DBDTL055_comp_Data_12fb_config_sh2210QCDEW,
    #                                     ],
    #                       "ShowOldResults": False,
    #                       "ShowTheory": False,
    #                       "outputfolder": outputfolder,
    #                       "savename": "tanb_all_12fb.pdf",
    #                       "ymin":3e-3,
    #                       "ymax":3e-2,
    #                       "ratio_max": 1.1,
    #                       "ratio_min": 0.85,
    #                       "draw_ratio": True,
    #                       "LengenTextSize": 0.05,
    #                     }
    #
    # Comparison(comparison_config)
    #
    #
    # comparison_config = {"LineConfig": [v212120_2DBDTL055_comp_Data_12fb_config_sh2210QCDEW,
    #                                     v212120_2DBDTL055_comp_Data_freefloatSM4t_12fb_config_sh2210QCDEW,
    #                                     ],
    #                       "ShowOldResults": False,
    #                       "ShowTheory": False,
    #                       "outputfolder": outputfolder,
    #                       "savename": "tanb_fixed_freefloat_12fb.pdf",
    #                       "ymin":3e-3,
    #                       "ymax":3e-2,
    #                       "ratio_max": 1.1,
    #                       "ratio_min": 0.85,
    #                       "draw_ratio": True,
    #                       "LengenTextSize": 0.05,
    #                     }
    #
    # Comparison(comparison_config)

# def full_syst_Unblinding_paper_v11_AllSyst_Buggy_ttW(): # final results
#
#     inputfolder = "/lustre/umt3/user/metsai/analysis/4tops/fit/4T_FullSyst_v212120_Date20211006_v11_FinalBDT_ttWQCDEW_deco_4tEW/"
#     outputfolder = "/lustre/umt3/user/metsai/analysis/4tops/results/4T_FullSyst_v212120_Date20211006_v11_FinalBDT_ttWQCDEW_deco_4tEW/tanb/Comparison/"
#
#
#     # Data - L055 (all ttH/ttA)
#     v212120_2DBDTL055_comp_Data_allInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_data_SplusB_BSM4t_mH",
#                                           "InputSuffix": "_v212120_FullSyst_v11_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
#                                           "InputFolder": inputfolder,
#                                           "outputfolder": outputfolder,
#                                           "savename": "Data_12fb_All_hasPrevious.pdf",
#                                           "draw_xs_points": False,
#                                           "Xsec_dict": Xsec_BR_12fb,
#                                           "name": "Data",
#                                           "SigType": "obs",
#                                           "FitType": "Data",
#                                           "ShowPreviousResults": True,
#                                           "interpretation": "ttH_ttA",
#                                           "ymin":0,
#                                           "ymax":3,
#                                         }
#
#     # Data - L055 (all ttH)
#     v212120_2DBDTL055_comp_Data_ttHInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_data_SplusB_BSM4t_mH",
#                                           "InputSuffix": "_v212120_FullSyst_v11_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
#                                           "InputFolder": inputfolder,
#                                           "outputfolder": outputfolder,
#                                           "savename": "Data_12fb_ttH_hasPrevious.pdf",
#                                           "draw_xs_points": False,
#                                           "Xsec_dict": Xsec_BR_12fb,
#                                           "name": "Data",
#                                           "SigType": "obs",
#                                           "FitType": "Data",
#                                           "interpretation": "ttH",
#                                           "ShowPreviousResults": True,
#                                           "ymin":0,
#                                           "ymax":3,
#                                         }
#
#     # Data - L055 (all ttA)
#     v212120_2DBDTL055_comp_Data_ttAInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_data_SplusB_BSM4t_mH",
#                                           "InputSuffix": "_v212120_FullSyst_v11_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
#                                           "InputFolder": inputfolder,
#                                           "outputfolder": outputfolder,
#                                           "savename": "Data_12fb_ttA_hasPrevious.pdf",
#                                           "draw_xs_points": False,
#                                           "Xsec_dict": Xsec_BR_12fb,
#                                           "name": "Data",
#                                           "SigType": "obs",
#                                           "FitType": "Data",
#                                           "interpretation": "ttA",
#                                           "ShowPreviousResults": True,
#                                           "ymin":0,
#                                           "ymax":3,
#                                         }
#
#
#     # Data - L055 (all ttH/ttA)
#     v212120_2DBDTL055_comp_Data_allInterpretation_12fb_config_sh2210QCDEW_noPrevious = {"InputPrefix": "FourTop_BDTFit_Paper_data_SplusB_BSM4t_mH",
#                                           "InputSuffix": "_v212120_FullSyst_v11_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
#                                           "InputFolder": inputfolder,
#                                           "outputfolder": outputfolder,
#                                           "savename": "Data_12fb_All.pdf",
#                                           "draw_xs_points": False,
#                                           "Xsec_dict": Xsec_BR_12fb,
#                                           "name": "Data",
#                                           "SigType": "obs",
#                                           "FitType": "Data",
#                                           # "other_interpretation": True,
#                                           "interpretation": "ttH_ttA",
#                                           "ymin":0,
#                                           "ymax":3,
#                                         }
#
#     # Data - L055 (all ttH/ttA)
#     v212120_2DBDTL055_comp_Data_ttHInterpretation_12fb_config_sh2210QCDEW_noPrevious = {"InputPrefix": "FourTop_BDTFit_Paper_data_SplusB_BSM4t_mH",
#                                           "InputSuffix": "_v212120_FullSyst_v11_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
#                                           "InputFolder": inputfolder,
#                                           "outputfolder": outputfolder,
#                                           "savename": "Data_12fb_ttH.pdf",
#                                           "draw_xs_points": False,
#                                           "Xsec_dict": Xsec_BR_12fb,
#                                           "name": "Data",
#                                           "SigType": "obs",
#                                           "FitType": "Data",
#                                           "interpretation": "ttH",
#                                           "ymin":0,
#                                           "ymax":3,
#                                         }
#
#     # Data - L055 (all ttH/ttA)
#     v212120_2DBDTL055_comp_Data_ttAInterpretation_12fb_config_sh2210QCDEW_noPrevious = {"InputPrefix": "FourTop_BDTFit_Paper_data_SplusB_BSM4t_mH",
#                                           "InputSuffix": "_v212120_FullSyst_v11_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
#                                           "InputFolder": inputfolder,
#                                           "outputfolder": outputfolder,
#                                           "savename": "Data_12fb_ttA.pdf",
#                                           "draw_xs_points": False,
#                                           "Xsec_dict": Xsec_BR_12fb,
#                                           "name": "Data",
#                                           "SigType": "obs",
#                                           "FitType": "Data",
#                                           "interpretation": "ttA",
#                                           "ymin":0,
#                                           "ymax":3,
#                                         }
#
#
#
#     Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_allInterpretation_12fb_config_sh2210QCDEW)
#     Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_ttHInterpretation_12fb_config_sh2210QCDEW)
#     Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_ttAInterpretation_12fb_config_sh2210QCDEW)
#
#     Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_allInterpretation_12fb_config_sh2210QCDEW_noPrevious)
#     Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_ttHInterpretation_12fb_config_sh2210QCDEW_noPrevious)
#     Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_ttAInterpretation_12fb_config_sh2210QCDEW_noPrevious)
#
#
#
#     # # statonly
#     v212120_2DBDTL055_comp_StatOnly_allInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_statonly_SplusB_BSM4t_mH",
#                                           "InputSuffix": "_v212120_FullSyst_v11_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
#                                           "InputFolder": inputfolder,
#                                           "outputfolder": outputfolder,
#                                           "Xsec_dict": Xsec_BR_12fb,
#                                           "savename": "StatOnly_all_12fb.pdf",
#                                           "name": "StatOnly",
#                                           "SigType": "exp",
#                                           "FitType": "StatOnly",
#                                           "ymin":0,
#                                           "ymax":3.5,
#                                           "draw_xs_points": False,
#                                           "interpretation": "ttH_ttA",
#                                           "ShowPreviousResults": True,
#                                         }
#
#     # # statonly
#     v212120_2DBDTL055_comp_StatOnly_ttHInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_statonly_SplusB_BSM4t_mH",
#                                           "InputSuffix": "_v212120_FullSyst_v11_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
#                                           "InputFolder": inputfolder,
#                                           "outputfolder": outputfolder,
#                                           "Xsec_dict": Xsec_BR_12fb,
#                                           "savename": "StatOnly_ttH_12fb.pdf",
#                                           "name": "StatOnly",
#                                           "SigType": "exp",
#                                           "FitType": "StatOnly",
#                                           "ymin":0,
#                                           "ymax":3.5,
#                                           "draw_xs_points": False,
#                                           "interpretation": "ttH",
#                                           "ShowPreviousResults": True,
#                                         }
#
#     # # statonly
#     v212120_2DBDTL055_comp_StatOnly_ttAInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_statonly_SplusB_BSM4t_mH",
#                                           "InputSuffix": "_v212120_FullSyst_v11_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
#                                           "InputFolder": inputfolder,
#                                           "outputfolder": outputfolder,
#                                           "Xsec_dict": Xsec_BR_12fb,
#                                           "savename": "StatOnly_ttA_12fb.pdf",
#                                           "name": "StatOnly",
#                                           "SigType": "exp",
#                                           "FitType": "StatOnly",
#                                           "ymin":0,
#                                           "ymax":3.5,
#                                           "draw_xs_points": False,
#                                           "interpretation": "ttA",
#                                           "ShowPreviousResults": True,
#                                         }
#
#
#     # # Plain
#     v212120_2DBDTL055_comp_Plain_allInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_plain_SplusB_BSM4t_mH",
#                                           "InputSuffix": "_v212120_FullSyst_v11_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
#                                           "InputFolder": inputfolder,
#                                           "outputfolder": outputfolder,
#                                           "Xsec_dict": Xsec_BR_12fb,
#                                           "savename": "Plain_all_12fb.pdf",
#                                           "name": "Plain",
#                                           "SigType": "exp",
#                                           "FitType": "Plain",
#                                           "ymin":0,
#                                           "ymax":3.5,
#                                           "draw_xs_points": False,
#                                           "interpretation": "ttH_ttA",
#                                           "ShowPreviousResults": True,
#                                         }
#
#     # # Plain
#     v212120_2DBDTL055_comp_Plain_ttHInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_plain_SplusB_BSM4t_mH",
#                                           "InputSuffix": "_v212120_FullSyst_v11_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
#                                           "InputFolder": inputfolder,
#                                           "outputfolder": outputfolder,
#                                           "Xsec_dict": Xsec_BR_12fb,
#                                           "savename": "Plain_ttH_12fb.pdf",
#                                           "name": "Plain",
#                                           "SigType": "exp",
#                                           "FitType": "Plain",
#                                           "ymin":0,
#                                           "ymax":3.5,
#                                           "draw_xs_points": False,
#                                           "interpretation": "ttH",
#                                           "ShowPreviousResults": True,
#                                         }
#
#     v212120_2DBDTL055_comp_Plain_ttAInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_plain_SplusB_BSM4t_mH",
#                                           "InputSuffix": "_v212120_FullSyst_v11_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
#                                           "InputFolder": inputfolder,
#                                           "outputfolder": outputfolder,
#                                           "Xsec_dict": Xsec_BR_12fb,
#                                           "savename": "Plain_ttA_12fb.pdf",
#                                           "name": "Plain",
#                                           "SigType": "exp",
#                                           "FitType": "Plain",
#                                           "ymin":0,
#                                           "ymax":3.5,
#                                           "draw_xs_points": False,
#                                           "interpretation": "ttA",
#                                           "ShowPreviousResults": True,
#                                         }
#
#     Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_StatOnly_allInterpretation_12fb_config_sh2210QCDEW)
#     Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_StatOnly_ttHInterpretation_12fb_config_sh2210QCDEW)
#     Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_StatOnly_ttAInterpretation_12fb_config_sh2210QCDEW)
#     Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Plain_allInterpretation_12fb_config_sh2210QCDEW)
#     Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Plain_ttHInterpretation_12fb_config_sh2210QCDEW)
#     Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Plain_ttAInterpretation_12fb_config_sh2210QCDEW)
#
#
#     # Real - L055 CROnly model
#     v212120_2DBDTL055_comp_Real_allInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_real_SplusB_BSM4t_mH",
#                                           "InputSuffix": "_v212120_FullSyst_v11_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
#                                           "InputFolder": inputfolder,
#                                           "outputfolder": outputfolder,
#                                           "savename": "Real_CRL055_all_12fb.pdf",
#                                           "Xsec_dict": Xsec_BR_12fb,
#                                           "name": "Real (CRL055)",
#                                           "SigType": "exp",
#                                           "FitType": "Real",
#                                           "ymin":0,
#                                           "ymax":3,
#                                           "draw_xs_points": False,
#                                           "interpretation": "ttH_ttA",
#                                           "ShowPreviousResults": True,
#
#                                         }
#
#     v212120_2DBDTL055_comp_Real_ttHInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_real_SplusB_BSM4t_mH",
#                                           "InputSuffix": "_v212120_FullSyst_v11_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
#                                           "InputFolder": inputfolder,
#                                           "outputfolder": outputfolder,
#                                           "savename": "Real_CRL055_ttH_12fb.pdf",
#                                           "Xsec_dict": Xsec_BR_12fb,
#                                           "name": "Real (CRL055)",
#                                           "SigType": "exp",
#                                           "FitType": "Real",
#                                           "ymin":0,
#                                           "ymax":3,
#                                           "draw_xs_points": False,
#                                           "interpretation": "ttH",
#                                           "ShowPreviousResults": True,
#
#                                         }
#
#     v212120_2DBDTL055_comp_Real_ttAInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_real_SplusB_BSM4t_mH",
#                                           "InputSuffix": "_v212120_FullSyst_v11_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
#                                           "InputFolder": inputfolder,
#                                           "outputfolder": outputfolder,
#                                           "savename": "Real_CRL055_ttA_12fb.pdf",
#                                           "Xsec_dict": Xsec_BR_12fb,
#                                           "name": "Real (CRL055)",
#                                           "SigType": "exp",
#                                           "FitType": "Real",
#                                           "ymin":0,
#                                           "ymax":3,
#                                           "draw_xs_points": False,
#                                           "interpretation": "ttA",
#                                           "ShowPreviousResults": True,
#
#                                         }
#
#
#     Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Real_allInterpretation_12fb_config_sh2210QCDEW)
#     Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Real_ttHInterpretation_12fb_config_sh2210QCDEW)
#     Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Real_ttAInterpretation_12fb_config_sh2210QCDEW)
#
#
#
#
#     # Real - L025 CROnly model
#     v212120_2DBDTL025_comp_Real_allInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_real_L025_SplusB_BSM4t_mH",
#                                           "InputSuffix": "_v212120_FullSyst_v11_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
#                                           "InputFolder": inputfolder,
#                                           "outputfolder": outputfolder,
#                                           "savename": "Real_CRL025_all_12fb.pdf",
#                                           "Xsec_dict": Xsec_BR_12fb,
#                                           "name": "Real (CRL025)",
#                                           "SigType": "exp",
#                                           "FitType": "Real",
#                                           "ymin":0,
#                                           "ymax":3,
#                                           "draw_xs_points": False,
#                                           "interpretation": "ttH_ttA",
#                                           "ShowPreviousResults": True,
#
#                                         }
#
#     v212120_2DBDTL025_comp_Real_ttHInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_real_L025_SplusB_BSM4t_mH",
#                                           "InputSuffix": "_v212120_FullSyst_v11_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
#                                           "InputFolder": inputfolder,
#                                           "outputfolder": outputfolder,
#                                           "savename": "Real_CRL025_ttH_12fb.pdf",
#                                           "Xsec_dict": Xsec_BR_12fb,
#                                           "name": "Real (CRL025)",
#                                           "SigType": "exp",
#                                           "FitType": "Real",
#                                           "ymin":0,
#                                           "ymax":3,
#                                           "draw_xs_points": False,
#                                           "interpretation": "ttH",
#                                           "ShowPreviousResults": True,
#
#                                         }
#
#     v212120_2DBDTL025_comp_Real_ttAInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_real_L025_SplusB_BSM4t_mH",
#                                           "InputSuffix": "_v212120_FullSyst_v11_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
#                                           "InputFolder": inputfolder,
#                                           "outputfolder": outputfolder,
#                                           "savename": "Real_CRL025_ttA_12fb.pdf",
#                                           "Xsec_dict": Xsec_BR_12fb,
#                                           "name": "Real (CRL025)",
#                                           "SigType": "exp",
#                                           "FitType": "Real",
#                                           "ymin":0,
#                                           "ymax":3,
#                                           "draw_xs_points": False,
#                                           "interpretation": "ttA",
#                                           "ShowPreviousResults": True,
#
#                                         }
#
#
#     Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL025_comp_Real_allInterpretation_12fb_config_sh2210QCDEW)
#     Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL025_comp_Real_ttHInterpretation_12fb_config_sh2210QCDEW)
#     Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL025_comp_Real_ttAInterpretation_12fb_config_sh2210QCDEW)
#
#
#
#     comparison_config = {"LineConfig": [v212120_2DBDTL055_comp_StatOnly_allInterpretation_12fb_config_sh2210QCDEW,
#                                         v212120_2DBDTL055_comp_Plain_allInterpretation_12fb_config_sh2210QCDEW,
#                                         v212120_2DBDTL025_comp_Real_allInterpretation_12fb_config_sh2210QCDEW,
#                                         v212120_2DBDTL055_comp_Real_allInterpretation_12fb_config_sh2210QCDEW,
#                                         v212120_2DBDTL055_comp_Data_allInterpretation_12fb_config_sh2210QCDEW,
#                                         ],
#                           "ShowOldResults": False,
#                           "ShowTheory": False,
#                           "outputfolder": outputfolder,
#                           "savename": "Comp_allInpretation.pdf",
#                           "ymin":0,
#                           "ymax":3,
#                           "ratio_max": 1.1,
#                           "ratio_min": 0.85,
#                           "draw_ratio": True,
#                           "LengenTextSize": 0.05,
#                           "ylog": False,
#                           "interpretation": "ttH_ttA",
#                         }
#
#
#     Comparison(comparison_config)
#
#     comparison_config = {"LineConfig": [v212120_2DBDTL055_comp_StatOnly_ttHInterpretation_12fb_config_sh2210QCDEW,
#                                         v212120_2DBDTL055_comp_Plain_ttHInterpretation_12fb_config_sh2210QCDEW,
#                                         v212120_2DBDTL025_comp_Real_ttHInterpretation_12fb_config_sh2210QCDEW,
#                                         v212120_2DBDTL055_comp_Real_ttHInterpretation_12fb_config_sh2210QCDEW,
#                                         v212120_2DBDTL055_comp_Data_ttHInterpretation_12fb_config_sh2210QCDEW,
#                                         ],
#                           "ShowOldResults": False,
#                           "ShowTheory": False,
#                           "outputfolder": outputfolder,
#                           "savename": "Comp_ttHInpretation.pdf",
#                           "ymin":0,
#                           "ymax":3,
#                           "ratio_max": 1.1,
#                           "ratio_min": 0.85,
#                           "draw_ratio": True,
#                           "LengenTextSize": 0.05,
#                           "ylog": False,
#                           "interpretation": "ttH",
#                         }
#
#     Comparison(comparison_config)
#
#
#     comparison_config = {"LineConfig": [v212120_2DBDTL055_comp_StatOnly_ttAInterpretation_12fb_config_sh2210QCDEW,
#                                         v212120_2DBDTL055_comp_Plain_ttAInterpretation_12fb_config_sh2210QCDEW,
#                                         v212120_2DBDTL025_comp_Real_ttAInterpretation_12fb_config_sh2210QCDEW,
#                                         v212120_2DBDTL055_comp_Real_ttAInterpretation_12fb_config_sh2210QCDEW,
#                                         v212120_2DBDTL055_comp_Data_ttAInterpretation_12fb_config_sh2210QCDEW,
#                                         ],
#                           "ShowOldResults": False,
#                           "ShowTheory": False,
#                           "outputfolder": outputfolder,
#                           "savename": "Comp_ttAInpretation.pdf",
#                           "ymin":0,
#                           "ymax":3,
#                           "ratio_max": 1.1,
#                           "ratio_min": 0.85,
#                           "draw_ratio": True,
#                           "LengenTextSize": 0.05,
#                           "ylog": False,
#                           "interpretation": "ttA",
#                         }
#
#     Comparison(comparison_config)





def full_syst_Unblinding_paper(): # final results

    inputfolder = "/eos/user/p/pberta/4tops/latest/GNN/"
    #inputfolder = "/afs/cern.ch/user/l/lmao/MyWorkingDir/fit-config/configs/lining/2D_plot/limit_"
    # outputfolder = "/lustre/umt3/user/metsai/analysis/4tops/results/4T_FullSyst_v212120_Date20220404_v12_FinalBDT_ttWQCDEW_deco_4tEW/tanb/Comparison/"
    outputfolder = "./"


    # Data - L055 (all ttH/ttA)
    v212120_2DBDTL055_comp_Data_allInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_data_SplusB_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v12_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Data_12fb_All_hasPrevious.pdf",
                                          "draw_xs_points": False,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Data",
                                          "SigType": "obs",
                                          "FitType": "Data",
                                          "ShowPreviousResults": True,
                                          "interpretation": "ttH_ttA",
                                          "ymin":0,
                                          "ymax":3,
                                        }

    # Data - L055 (all ttH)
    v212120_2DBDTL055_comp_Data_ttHInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_data_SplusB_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v12_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Data_12fb_ttH_hasPrevious.pdf",
                                          "draw_xs_points": False,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Data",
                                          "SigType": "obs",
                                          "FitType": "Data",
                                          "interpretation": "ttH",
                                          "ShowPreviousResults": True,
                                          "ymin":0,
                                          "ymax":3,
                                        }

    # Data - L055 (all ttA)
    v212120_2DBDTL055_comp_Data_ttAInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_data_SplusB_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v12_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Data_12fb_ttA_hasPrevious.pdf",
                                          "draw_xs_points": False,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Data",
                                          "SigType": "obs",
                                          "FitType": "Data",
                                          "interpretation": "ttA",
                                          "ShowPreviousResults": True,
                                          "ymin":0,
                                          "ymax":3,
                                        }


    # Data - L055 (all ttH/ttA)
    v212120_2DBDTL055_comp_Data_allInterpretation_12fb_config_sh2210QCDEW_noPrevious = {"InputPrefix": "",
                                          "InputSuffix": "/all/data_unblindedSplusB",
                                          #"InputSuffix": "",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Data_12fb_All_1LOS.pdf",
                                          "draw_xs_points": False,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Data",
                                          "SigType": "obs",
                                          "FitType": "Data",
                                          # "other_interpretation": True,
                                          "interpretation": "ttH_ttA",
                                          "ymin":0.4,
                                          "ymax":2.,
                                        }

    # Data - L055 (all ttH/ttA)
    v212120_2DBDTL055_comp_Data_ttHInterpretation_12fb_config_sh2210QCDEW_noPrevious = {"InputPrefix": "",
                                          "InputSuffix": "/all/data_unblindedSplusB",
                                          #"InputSuffix": "",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Data_12fb_ttH_1LOS.pdf",
                                          "draw_xs_points": False,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Data",
                                          "SigType": "obs",
                                          "FitType": "Data",
                                          "interpretation": "ttH",
                                          "ymin":0.4,
                                          "ymax":2.,
                                        }

    # Data - L055 (all ttH/ttA)
    v212120_2DBDTL055_comp_Data_ttAInterpretation_12fb_config_sh2210QCDEW_noPrevious = {"InputPrefix": "",
                                          "InputSuffix": "/all/data_unblindedSplusB",
                                          #"InputSuffix": "",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Data_12fb_ttA_1LOS.pdf",
                                          "draw_xs_points": False,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Data",
                                          "SigType": "obs",
                                          "FitType": "Data",
                                          "interpretation": "ttA",
                                          "ymin":0.4,
                                          "ymax":1.8,
                                        }



    # Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_allInterpretation_12fb_config_sh2210QCDEW)
    # Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_ttHInterpretation_12fb_config_sh2210QCDEW)
    # Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_ttAInterpretation_12fb_config_sh2210QCDEW)

    Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_allInterpretation_12fb_config_sh2210QCDEW_noPrevious)
    Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_ttHInterpretation_12fb_config_sh2210QCDEW_noPrevious)
    # Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Data_ttAInterpretation_12fb_config_sh2210QCDEW_noPrevious)



    # # statonly
    v212120_2DBDTL055_comp_StatOnly_allInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_statonly_nosyst_SplusB_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v12_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "savename": "StatOnly_all_12fb.pdf",
                                          "name": "StatOnly",
                                          "SigType": "exp",
                                          "FitType": "StatOnly",
                                          "ymin":0,
                                          "ymax":3.5,
                                          "draw_xs_points": False,
                                          "interpretation": "ttH_ttA",
                                          "ShowPreviousResults": True,
                                        }

    # # statonly
    v212120_2DBDTL055_comp_StatOnly_ttHInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_statonly_nosyst_SplusB_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v12_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "savename": "StatOnly_ttH_12fb.pdf",
                                          "name": "StatOnly",
                                          "SigType": "exp",
                                          "FitType": "StatOnly",
                                          "ymin":0,
                                          "ymax":3.5,
                                          "draw_xs_points": False,
                                          "interpretation": "ttH",
                                          "ShowPreviousResults": True,
                                        }

    # # statonly
    v212120_2DBDTL055_comp_StatOnly_ttAInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_statonly_nosyst_SplusB_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v12_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "savename": "StatOnly_ttA_12fb.pdf",
                                          "name": "StatOnly",
                                          "SigType": "exp",
                                          "FitType": "StatOnly",
                                          "ymin":0,
                                          "ymax":3.5,
                                          "draw_xs_points": False,
                                          "interpretation": "ttA",
                                          "ShowPreviousResults": True,
                                        }


    # # Plain
    v212120_2DBDTL055_comp_Plain_allInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_plain_SplusB_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v12_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "savename": "Plain_all_12fb.pdf",
                                          "name": "Plain",
                                          "SigType": "exp",
                                          "FitType": "Plain",
                                          "ymin":0,
                                          "ymax":3.5,
                                          "draw_xs_points": False,
                                          "interpretation": "ttH_ttA",
                                          "ShowPreviousResults": True,
                                        }

    # # Plain
    v212120_2DBDTL055_comp_Plain_ttHInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_plain_SplusB_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v12_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "savename": "Plain_ttH_12fb.pdf",
                                          "name": "Plain",
                                          "SigType": "exp",
                                          "FitType": "Plain",
                                          "ymin":0,
                                          "ymax":3.5,
                                          "draw_xs_points": False,
                                          "interpretation": "ttH",
                                          "ShowPreviousResults": True,
                                        }

    v212120_2DBDTL055_comp_Plain_ttAInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_plain_SplusB_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v12_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "savename": "Plain_ttA_12fb.pdf",
                                          "name": "Plain",
                                          "SigType": "exp",
                                          "FitType": "Plain",
                                          "ymin":0,
                                          "ymax":3.5,
                                          "draw_xs_points": False,
                                          "interpretation": "ttA",
                                          "ShowPreviousResults": True,
                                        }

    # Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_StatOnly_allInterpretation_12fb_config_sh2210QCDEW)
    # Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_StatOnly_ttHInterpretation_12fb_config_sh2210QCDEW)
    # Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_StatOnly_ttAInterpretation_12fb_config_sh2210QCDEW)
    # Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Plain_allInterpretation_12fb_config_sh2210QCDEW)
    # Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Plain_ttHInterpretation_12fb_config_sh2210QCDEW)
    # Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Plain_ttAInterpretation_12fb_config_sh2210QCDEW)


    # Real - L055 CROnly model
    v212120_2DBDTL055_comp_Real_allInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_real_SplusB_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v12_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Real_CRL055_all_12fb.pdf",
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Real (CRL055)",
                                          "SigType": "exp",
                                          "FitType": "Real",
                                          "ymin":0,
                                          "ymax":3,
                                          "draw_xs_points": False,
                                          "interpretation": "ttH_ttA",
                                          "ShowPreviousResults": True,

                                        }

    v212120_2DBDTL055_comp_Real_ttHInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_real_SplusB_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v12_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Real_CRL055_ttH_12fb.pdf",
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Real (CRL055)",
                                          "SigType": "exp",
                                          "FitType": "Real",
                                          "ymin":0,
                                          "ymax":3,
                                          "draw_xs_points": False,
                                          "interpretation": "ttH",
                                          "ShowPreviousResults": True,

                                        }

    v212120_2DBDTL055_comp_Real_ttAInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_real_SplusB_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v12_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Real_CRL055_ttA_12fb.pdf",
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Real (CRL055)",
                                          "SigType": "exp",
                                          "FitType": "Real",
                                          "ymin":0,
                                          "ymax":3,
                                          "draw_xs_points": False,
                                          "interpretation": "ttA",
                                          "ShowPreviousResults": True,

                                        }


    # Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Real_allInterpretation_12fb_config_sh2210QCDEW)
    # Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Real_ttHInterpretation_12fb_config_sh2210QCDEW)
    # Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL055_comp_Real_ttAInterpretation_12fb_config_sh2210QCDEW)




    # Real - L025 CROnly model
    v212120_2DBDTL025_comp_Real_allInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_real_L025_SplusB_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v12_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Real_CRL025_all_12fb.pdf",
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Real (CRL025)",
                                          "SigType": "exp",
                                          "FitType": "Real",
                                          "ymin":0,
                                          "ymax":3,
                                          "draw_xs_points": False,
                                          "interpretation": "ttH_ttA",
                                          "ShowPreviousResults": True,

                                        }

    v212120_2DBDTL025_comp_Real_ttHInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_real_L025_SplusB_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v12_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Real_CRL025_ttH_12fb.pdf",
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Real (CRL025)",
                                          "SigType": "exp",
                                          "FitType": "Real",
                                          "ymin":0,
                                          "ymax":3,
                                          "draw_xs_points": False,
                                          "interpretation": "ttH",
                                          "ShowPreviousResults": True,

                                        }

    v212120_2DBDTL025_comp_Real_ttAInterpretation_12fb_config_sh2210QCDEW = {"InputPrefix": "FourTop_BDTFit_Paper_real_L025_SplusB_BSM4t_mH",
                                          "InputSuffix": "_v212120_FullSyst_v12_finalBDT_sherpa2210_ttWQCDEW_deco_DDQmisID_COCR_2D_rates_Final_EWXsec20",
                                          "InputFolder": inputfolder,
                                          "outputfolder": outputfolder,
                                          "savename": "Real_CRL025_ttA_12fb.pdf",
                                          "Xsec_dict": Xsec_BR_12fb,
                                          "name": "Real (CRL025)",
                                          "SigType": "exp",
                                          "FitType": "Real",
                                          "ymin":0,
                                          "ymax":3,
                                          "draw_xs_points": False,
                                          "interpretation": "ttA",
                                          "ShowPreviousResults": True,

                                        }


    # Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL025_comp_Real_allInterpretation_12fb_config_sh2210QCDEW)
    # Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL025_comp_Real_ttHInterpretation_12fb_config_sh2210QCDEW)
    # Single_tanb_Plot(Xsec_BR_12fb,config=v212120_2DBDTL025_comp_Real_ttAInterpretation_12fb_config_sh2210QCDEW)



    comparison_config = {"LineConfig": [v212120_2DBDTL055_comp_StatOnly_allInterpretation_12fb_config_sh2210QCDEW,
                                        v212120_2DBDTL055_comp_Plain_allInterpretation_12fb_config_sh2210QCDEW,
                                        v212120_2DBDTL025_comp_Real_allInterpretation_12fb_config_sh2210QCDEW,
                                        v212120_2DBDTL055_comp_Real_allInterpretation_12fb_config_sh2210QCDEW,
                                        v212120_2DBDTL055_comp_Data_allInterpretation_12fb_config_sh2210QCDEW,
                                        ],
                          "ShowOldResults": False,
                          "ShowTheory": False,
                          "outputfolder": outputfolder,
                          "savename": "Comp_allInpretation.pdf",
                          "ymin":0,
                          "ymax":3,
                          "ratio_max": 1.1,
                          "ratio_min": 0.85,
                          "draw_ratio": True,
                          "LengenTextSize": 0.05,
                          "ylog": False,
                          "interpretation": "ttH_ttA",
                        }


    # Comparison(comparison_config)

    comparison_config = {"LineConfig": [v212120_2DBDTL055_comp_StatOnly_ttHInterpretation_12fb_config_sh2210QCDEW,
                                        v212120_2DBDTL055_comp_Plain_ttHInterpretation_12fb_config_sh2210QCDEW,
                                        v212120_2DBDTL025_comp_Real_ttHInterpretation_12fb_config_sh2210QCDEW,
                                        v212120_2DBDTL055_comp_Real_ttHInterpretation_12fb_config_sh2210QCDEW,
                                        v212120_2DBDTL055_comp_Data_ttHInterpretation_12fb_config_sh2210QCDEW,
                                        ],
                          "ShowOldResults": False,
                          "ShowTheory": False,
                          "outputfolder": outputfolder,
                          "savename": "Comp_ttHInpretation.pdf",
                          "ymin":0,
                          "ymax":3,
                          "ratio_max": 1.1,
                          "ratio_min": 0.85,
                          "draw_ratio": True,
                          "LengenTextSize": 0.05,
                          "ylog": False,
                          "interpretation": "ttH",
                        }

    # Comparison(comparison_config)


    comparison_config = {"LineConfig": [v212120_2DBDTL055_comp_StatOnly_ttAInterpretation_12fb_config_sh2210QCDEW,
                                        v212120_2DBDTL055_comp_Plain_ttAInterpretation_12fb_config_sh2210QCDEW,
                                        v212120_2DBDTL025_comp_Real_ttAInterpretation_12fb_config_sh2210QCDEW,
                                        v212120_2DBDTL055_comp_Real_ttAInterpretation_12fb_config_sh2210QCDEW,
                                        v212120_2DBDTL055_comp_Data_ttAInterpretation_12fb_config_sh2210QCDEW,
                                        ],
                          "ShowOldResults": False,
                          "ShowTheory": False,
                          "outputfolder": outputfolder,
                          "savename": "Comp_ttAInpretation.pdf",
                          "ymin":0,
                          "ymax":3,
                          "ratio_max": 1.1,
                          "ratio_min": 0.85,
                          "draw_ratio": True,
                          "LengenTextSize": 0.05,
                          "ylog": False,
                          "interpretation": "ttA",
                        }

    # Comparison(comparison_config)




def main():
    # compare_strategy()
    # BDT_scan()
    # full_syst_v1()
    # full_syst_Post1stEB()
    # full_syst_finalfit_ForUnblinding()
    # full_syst_finalfit_3rdEB()

    # full_syst_Unblinding() # CONF results - missing some syst

    # full_syst_Unblinding_paper_v11_AllSyst_Buggy_ttW() # NewTRE and full syst, but buggy ttW VR config

    full_syst_Unblinding_paper()

if __name__ == '__main__':

    main()
