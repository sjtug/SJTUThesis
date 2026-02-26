void limit()
{
  //string file_loc = "/afs/cern.ch/work/a/asonay/BSM4t_1LOS_McBased_212120_Asimov_syst_v1_m";
  string file_loc_1 = "/eos/user/p/pberta/4tops/latest/GNN/";
  string file_loc_2 = "/eos/user/p/pberta/4tops/latest/GNN/";
  //vector<int> mps = {400,500,600,700,800,900,1000};
  vector<int> mps = {400,500,600,700,800,900,1000};

  float xs=0.012; //pb
  vector<float> x_1,med_1,up1_1,down1_1,up2_1,down2_1;
  vector<float> x_2,med_2,up1_2,down1_2,up2_2,down2_2;
  for (auto mp : mps) {
    string ntup_1 = file_loc_1+to_string(mp)+"/all/data_unblindedSplusB//Limits/asymptotics/myLimit_CL95.root";
    string ntup_2 = file_loc_2+to_string(mp)+"/all/data_unblindedSplusB//Limits/asymptotics/myLimit_CL95.root";
    TChain *chain_1 = new TChain("stats");
    chain_1->Add(ntup_1.c_str());
    chain_1->Draw("exp_upperlimit","","goff");
    med_1.push_back((*chain_1->GetVal(0))*xs);
    chain_1->Draw("exp_upperlimit_plus1","","goff");
    up1_1.push_back((*chain_1->GetVal(0))*xs-med_1.back());
    chain_1->Draw("exp_upperlimit_minus1","","goff");
    down1_1.push_back(med_1.back()-(*chain_1->GetVal(0))*xs);
    chain_1->Draw("exp_upperlimit_plus2","","goff");
    up2_1.push_back((*chain_1->GetVal(0))*xs-med_1.back());
    chain_1->Draw("exp_upperlimit_minus2","","goff");
    down2_1.push_back(med_1.back()-(*chain_1->GetVal(0))*xs);
    x_1.push_back(float(mp)/1000.);
    cout << x_1.back() << " "
	 << med_1.back() << " "
	 << up1_1.back() << " "
	 << down1_1.back() << " "
	 << up2_1.back() << " "
	 << down2_1.back() << endl;
    delete chain_1;
    TChain *chain_2 = new TChain("stats");
    chain_2->Add(ntup_2.c_str());
    chain_2->Draw("obs_upperlimit","","goff");
    med_2.push_back((*chain_2->GetVal(0))*xs);
    x_2.push_back(float(mp)/1000.);
    cout << x_2.back() << " "
	 << med_2.back() << endl;
    delete chain_2;
  }

  auto gr2sig_1 = new TGraphAsymmErrors(x_1.size(),&x_1[0],&med_1[0],0,0,&down2_1[0],&up2_1[0]);
  gr2sig_1->SetFillColor(5);gr2sig_1->SetLineWidth(0);
  auto gr1sig_1 = new TGraphAsymmErrors(x_1.size(),&x_1[0],&med_1[0],0,0,&down1_1[0],&up1_1[0]);
  gr1sig_1->SetFillColor(3);gr1sig_1->SetLineWidth(0);
  auto grmed_1 = new TGraph(x_1.size(),&x_1[0],&med_1[0]);
  grmed_1->SetLineColor(kGray+3); grmed_1->SetLineWidth(2); grmed_1->SetLineStyle(9);

  auto grmed_2 = new TGraph(x_2.size(),&x_2[0],&med_2[0]);
  grmed_2->SetLineColor(kGray+3); grmed_2->SetLineWidth(2); grmed_2->SetLineStyle(1); grmed_2->SetMarkerColor(kGray+3); grmed_2->SetMarkerSize(1); grmed_2->SetMarkerStyle(20);

  auto theory_line1 = new TGraph("./xsec_times_br_ttH_tttt_type2_tanbeta_1p0.txt");
  auto theory_line05 = new TGraph("./xsec_times_br_ttH_tttt_type2_tanbeta_0p5.txt");
  theory_line1->SetLineColor(kAzure-3); theory_line1->SetLineWidth(2);
  theory_line05->SetLineColor(kRed-4); theory_line05->SetLineWidth(2);

  //GNN 1TeV
  vector<double> xgnn = {1000};
  vector<double> ygnn = {0.5257902*0.012};
  auto gnn_1000 = new TGraph(xgnn.size(),&xgnn[0],&ygnn[0]);
  gnn_1000->SetMarkerStyle(29); gnn_1000->SetMarkerSize(3);

  //Draw
  auto c = new TCanvas("c","c",650,500);
  //c->SetTickx();c->SetTicky();c->SetLogy();
  auto pad = new TPad("pad","",0,0.,1,1.0);
  pad->SetTickx(); pad->SetTicky(); pad->SetLogy();
  pad->SetTopMargin(0.05);
  pad->SetLeftMargin(0.14);
  pad->SetRightMargin(0.05);
  pad->SetBottomMargin(0.15);
  pad->Draw();
  pad->cd();


  auto hcan = new TH2F("hcan","",100,0.35,1.05,100,1e-03,1.5e+01);
  hcan->GetXaxis()->SetTitle("m_{H/A} [TeV]");
  hcan->GetXaxis()->SetTitleSize(0.06);
  hcan->GetXaxis()->SetTitleOffset(1.2);
  hcan->GetXaxis()->SetLabelSize(0.05);

  hcan->GetYaxis()->SetTitle("#sigma(pp#rightarrowt#bar{t}H/A) #times B(H/A#rightarrowt#bar{t}) [pb]");
  hcan->GetYaxis()->SetTitleSize(0.06);
  hcan->GetYaxis()->SetTitleOffset(1.2);
  hcan->GetYaxis()->SetLabelSize(0.05);
  hcan->SetStats(0);

  hcan->Draw();

  gr2sig_1->Draw("3");
  gr1sig_1->Draw("3");
  grmed_1->Draw("l");
  //gr2sig_2->Draw("3");
  //gr1sig_2->Draw("3");
  grmed_2->Draw("lp");
  //gnn_1000->Draw("p");
  theory_line1->Draw("l");
  theory_line05->Draw("l");

  
  auto leg = new TLegend(0.55,0.5,0.9,0.9);
  leg->SetLineWidth(0);
  leg->SetFillStyle(0);
  leg->AddEntry(grmed_2,"Observed","lp");
  leg->AddEntry(grmed_1,"Expected","l");
  leg->AddEntry(gr1sig_1,"Expected #pm1 #sigma","f");
  leg->AddEntry(gr2sig_1,"Expected #pm2 #sigma","f");
  //leg->AddEntry(gnn_1000,"95% C.L. expected limit GNN (Stat)","p");
  //leg->AddEntry(gr1sig_2,"95% C.L. expected limit #pm1#sigma (Stat)","f");
  //leg->AddEntry(gr2sig_2,"95% C.L. expected limit #pm2#sigma (Stat)","f");
  leg->AddEntry((TObject*)0, "Theory (NLO)", "");
  leg->AddEntry(theory_line05,"tan #beta = 0.5 (H)","l");
  leg->AddEntry(theory_line1,"tan #beta = 1.0 (H)","l");
  leg->Draw();

  TLatex T1;
  T1.SetNDC();
  T1.SetTextAlign(11);
  T1.SetTextSize(0.05);
  T1.DrawLatex(0.18,0.85,"#it{ATLAS}");
  T1.DrawLatex(0.18,0.79,"#bf{#sqrt{s} = 13 TeV, 139 fb^{-1}}");
  T1.DrawLatex(0.18,0.73,"#bf{1L/2LOS}");
  T1.DrawLatex(0.18,0.67,"#bf{#it{All limits at 95% CL}}");

  T1.Draw();

  c->SaveAs("limit_1LOS_only.pdf");
  
}
