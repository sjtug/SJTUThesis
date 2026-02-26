void ljets_ge10j4b_postFit()
{
//=========Macro generated from canvas: c1_n40/
//=========  (Mon Feb 19 22:00:31 2024) by ROOT version 6.24/06
   TCanvas *c1_n40 = new TCanvas("c1_n40", "",0,0,600,700);
   gStyle->SetOptStat(0);
   gStyle->SetOptTitle(0);
   c1_n40->SetHighLightColor(2);
   c1_n40->Range(0,0,1,1);
   c1_n40->SetFillColor(0);
   c1_n40->SetBorderMode(0);
   c1_n40->SetBorderSize(2);
   c1_n40->SetTickx(1);
   c1_n40->SetTicky(1);
   c1_n40->SetLeftMargin(0.16);
   c1_n40->SetRightMargin(0.05);
   c1_n40->SetTopMargin(0.05);
   c1_n40->SetBottomMargin(0.16);
   c1_n40->SetFrameBorderMode(0);
  
// ------------>Primitives in pad: 
   TPad *pad = new TPad("", "",0,0,1,0.28);
   pad->Draw();
   pad->cd();
   pad->Range(-0.1728395,-0.0873016,1.061728,1.5);
   pad->SetFillColor(0);
   pad->SetFillStyle(4000);
   pad->SetBorderMode(0);
   pad->SetBorderSize(0);
   pad->SetTickx(1);
   pad->SetTicky(1);
   pad->SetLeftMargin(0.14);
   pad->SetRightMargin(0.01);
   pad->SetTopMargin(0);
   pad->SetBottomMargin(0.37);
   pad->SetFrameBorderMode(0);
   pad->SetFrameBorderMode(0);
   Double_t xAxis256[5] = {0, 0.5499, 0.7631, 0.8834, 1}; 
   
   TH1D *h_dummy2__176 = new TH1D("h_dummy2__176","h",4, xAxis256);
   h_dummy2__176->SetMinimum(0.5);
   h_dummy2__176->SetMaximum(1.499);
   h_dummy2__176->SetEntries(230235);
   h_dummy2__176->SetDirectory(0);
   h_dummy2__176->SetStats(0);
   h_dummy2__176->SetFillColor(2);
   h_dummy2__176->SetLineColor(2);
   h_dummy2__176->SetMarkerStyle(20);
   h_dummy2__176->SetMarkerSize(1.2);
   h_dummy2__176->GetXaxis()->SetTitle("GNN Score");
   h_dummy2__176->GetXaxis()->SetLabelFont(43);
   h_dummy2__176->GetXaxis()->SetLabelOffset(0.025);
   h_dummy2__176->GetXaxis()->SetLabelSize(21);
   h_dummy2__176->GetXaxis()->SetTitleSize(21);
   h_dummy2__176->GetXaxis()->SetTitleOffset(5);
   h_dummy2__176->GetXaxis()->SetTitleFont(43);
   h_dummy2__176->GetYaxis()->SetTitle("Data / Pred.  ");
   // h_dummy2__176->GetYaxis()->SetNdivisions(-504);
   h_dummy2__176->GetYaxis()->SetLabelFont(43);
   h_dummy2__176->GetYaxis()->SetLabelSize(21);
   h_dummy2__176->GetYaxis()->SetTitleSize(21);
   h_dummy2__176->GetYaxis()->SetTitleOffset(2.1);
   h_dummy2__176->GetYaxis()->SetTitleFont(43);
   h_dummy2__176->GetYaxis()->SetNdivisions(504);
   h_dummy2__176->GetZaxis()->SetLabelFont(43);
   h_dummy2__176->GetZaxis()->SetLabelSize(21);
   h_dummy2__176->GetZaxis()->SetTitleSize(21);
   h_dummy2__176->GetZaxis()->SetTitleOffset(1);
   h_dummy2__176->GetZaxis()->SetTitleFont(43);
   h_dummy2__176->Draw("HIST");

   TLine *line = new TLine(0,1,1,1);
   line->SetLineStyle(2);
   line->SetLineWidth(2);
   line->Draw();
   
   Double_t g_ratio2_fx3077[4] = {
   0.27495,
   0.6565,
   0.82325,
   0.9417};
   Double_t g_ratio2_fy3077[4] = {
   1,
   1,
   1,
   1};
   Double_t g_ratio2_felx3077[4] = {
   0.27495,
   0.1066,
   0.06015,
   0.0583};
   Double_t g_ratio2_fely3077[4] = {
   0.05618974,
   0.04481062,
   0.05621922,
   0.08119588};
   Double_t g_ratio2_fehx3077[4] = {
   0.27495,
   0.1066,
   0.06015,
   0.0583};
   Double_t g_ratio2_fehy3077[4] = {
   0.05618974,
   0.04481062,
   0.05621922,
   0.08119588};
   TGraphAsymmErrors *grae = new TGraphAsymmErrors(4,g_ratio2_fx3077,g_ratio2_fy3077,g_ratio2_felx3077,g_ratio2_fehx3077,g_ratio2_fely3077,g_ratio2_fehy3077);
   grae->SetName("g_ratio2");
   grae->SetTitle("h");

   Int_t ci;      // for color index setting
   TColor *color; // for color definition with alpha
   ci = TColor::GetColor("#6666ff");
   grae->SetFillColor(ci);
   grae->SetFillStyle(3354);
   grae->SetLineColor(0);
   grae->SetLineWidth(0);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(0);
   
   TH1F *Graph_g_ratio23077 = new TH1F("Graph_g_ratio23077","h",100,0,1.1);
   Graph_g_ratio23077->SetMinimum(0.9025649);
   Graph_g_ratio23077->SetMaximum(1.097435);
   Graph_g_ratio23077->SetDirectory(0);
   Graph_g_ratio23077->SetStats(0);
   Graph_g_ratio23077->SetLineWidth(2);
   Graph_g_ratio23077->SetMarkerStyle(20);
   Graph_g_ratio23077->SetMarkerSize(1.2);
   Graph_g_ratio23077->GetXaxis()->SetLabelFont(43);
   Graph_g_ratio23077->GetXaxis()->SetLabelSize(21);
   Graph_g_ratio23077->GetXaxis()->SetTitleSize(21);
   Graph_g_ratio23077->GetXaxis()->SetTitleOffset(1.4);
   Graph_g_ratio23077->GetXaxis()->SetTitleFont(43);
   Graph_g_ratio23077->GetYaxis()->SetLabelFont(43);
   Graph_g_ratio23077->GetYaxis()->SetLabelSize(21);
   Graph_g_ratio23077->GetYaxis()->SetTitleSize(21);
   Graph_g_ratio23077->GetYaxis()->SetTitleOffset(1.4);
   Graph_g_ratio23077->GetYaxis()->SetTitleFont(43);
   Graph_g_ratio23077->GetZaxis()->SetLabelFont(43);
   Graph_g_ratio23077->GetZaxis()->SetLabelSize(21);
   Graph_g_ratio23077->GetZaxis()->SetTitleSize(21);
   Graph_g_ratio23077->GetZaxis()->SetTitleOffset(1);
   Graph_g_ratio23077->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_g_ratio23077);
   
   grae->Draw("e2");
   
   Double_t Graph_from_h_ratio_fx3078[4] = {
   0.27495,
   0.6565,
   0.82325,
   0.9417};
   Double_t Graph_from_h_ratio_fy3078[4] = {
   1.06906,
   1.108474,
   0.893068,
   0.9671443};
   Double_t Graph_from_h_ratio_felx3078[4] = {
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fely3078[4] = {
   0.08586899,
   0.09914488,
   0.1083004,
   0.1529189};
   Double_t Graph_from_h_ratio_fehx3078[4] = {
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fehy3078[4] = {
   0.08586899,
   0.09914488,
   0.1083004,
   0.1529189};
   grae = new TGraphAsymmErrors(4,Graph_from_h_ratio_fx3078,Graph_from_h_ratio_fy3078,Graph_from_h_ratio_felx3078,Graph_from_h_ratio_fehx3078,Graph_from_h_ratio_fely3078,Graph_from_h_ratio_fehy3078);
   grae->SetName("Graph_from_h_ratio");
   grae->SetTitle("h");
   grae->SetLineWidth(2);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(1.4);
   
   TH1F *Graph_Graph_from_h_ratio3078 = new TH1F("Graph_Graph_from_h_ratio3078","h",100,0,1.099945);
   Graph_Graph_from_h_ratio3078->SetMinimum(0.7424825);
   Graph_Graph_from_h_ratio3078->SetMaximum(1.249903);
   Graph_Graph_from_h_ratio3078->SetDirectory(0);
   Graph_Graph_from_h_ratio3078->SetStats(0);
   Graph_Graph_from_h_ratio3078->SetLineWidth(2);
   Graph_Graph_from_h_ratio3078->SetMarkerStyle(20);
   Graph_Graph_from_h_ratio3078->SetMarkerSize(1.2);
   Graph_Graph_from_h_ratio3078->GetXaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3078->GetXaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3078->GetXaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3078->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_h_ratio3078->GetXaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio3078->GetYaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3078->GetYaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3078->GetYaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3078->GetYaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_h_ratio3078->GetYaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio3078->GetZaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3078->GetZaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3078->GetZaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3078->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_from_h_ratio3078->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_from_h_ratio3078);
   
   grae->Draw("PZ");
   Double_t xAxis257[5] = {0, 0.5499, 0.7631, 0.8834, 1}; 
   
   TH1D *h_blindratio__177 = new TH1D("h_blindratio__177","h",4, xAxis257);
   h_blindratio__177->SetBinError(1,70.42727);
   h_blindratio__177->SetBinError(2,63.24555);
   h_blindratio__177->SetBinError(3,46.64762);
   h_blindratio__177->SetBinError(4,35.77709);
   h_blindratio__177->SetEntries(804);
   h_blindratio__177->SetDirectory(0);
   h_blindratio__177->SetStats(0);

   ci = TColor::GetColor("#cccccc");
   h_blindratio__177->SetFillColor(ci);
   h_blindratio__177->SetFillStyle(3345);

   ci = TColor::GetColor("#cccccc");
   h_blindratio__177->SetLineColor(ci);
   h_blindratio__177->SetLineWidth(0);
   h_blindratio__177->SetMarkerStyle(20);
   h_blindratio__177->SetMarkerSize(1.2);
   h_blindratio__177->GetXaxis()->SetLabelFont(43);
   h_blindratio__177->GetXaxis()->SetLabelSize(21);
   h_blindratio__177->GetXaxis()->SetTitleSize(21);
   h_blindratio__177->GetXaxis()->SetTitleOffset(1.4);
   h_blindratio__177->GetXaxis()->SetTitleFont(43);
   h_blindratio__177->GetYaxis()->SetLabelFont(43);
   h_blindratio__177->GetYaxis()->SetLabelSize(21);
   h_blindratio__177->GetYaxis()->SetTitleSize(21);
   h_blindratio__177->GetYaxis()->SetTitleOffset(1.4);
   h_blindratio__177->GetYaxis()->SetTitleFont(43);
   h_blindratio__177->GetZaxis()->SetLabelFont(43);
   h_blindratio__177->GetZaxis()->SetLabelSize(21);
   h_blindratio__177->GetZaxis()->SetTitleSize(21);
   h_blindratio__177->GetZaxis()->SetTitleOffset(1);
   h_blindratio__177->GetZaxis()->SetTitleFont(43);
   h_blindratio__177->Draw("HIST same");
   Double_t xAxis258[5] = {0, 0.5499, 0.7631, 0.8834, 1}; 
   
   TH1D *h_dummy2_copy__178 = new TH1D("h_dummy2_copy__178","h",4, xAxis258);
   h_dummy2_copy__178->SetMinimum(0.5);
   h_dummy2_copy__178->SetMaximum(1.5);
   h_dummy2_copy__178->SetEntries(230235);
   h_dummy2_copy__178->SetDirectory(0);
   h_dummy2_copy__178->SetStats(0);
   h_dummy2_copy__178->SetFillColor(2);
   h_dummy2_copy__178->SetLineColor(2);
   h_dummy2_copy__178->SetMarkerStyle(20);
   h_dummy2_copy__178->SetMarkerSize(1.2);
   h_dummy2_copy__178->GetXaxis()->SetTitle("GNN Score");
   h_dummy2_copy__178->GetXaxis()->SetLabelFont(43);
   h_dummy2_copy__178->GetXaxis()->SetLabelOffset(0.025);
   h_dummy2_copy__178->GetXaxis()->SetLabelSize(21);
   h_dummy2_copy__178->GetXaxis()->SetTitleSize(21);
   h_dummy2_copy__178->GetXaxis()->SetTitleOffset(5);
   h_dummy2_copy__178->GetXaxis()->SetTitleFont(43);
   h_dummy2_copy__178->GetYaxis()->SetTitle("Data / Pred.");
   h_dummy2_copy__178->GetYaxis()->SetNdivisions(-504);
   h_dummy2_copy__178->GetYaxis()->SetLabelFont(43);
   h_dummy2_copy__178->GetYaxis()->SetLabelSize(21);
   h_dummy2_copy__178->GetYaxis()->SetTitleSize(21);
   h_dummy2_copy__178->GetYaxis()->SetTitleOffset(2.255033);
   h_dummy2_copy__178->GetYaxis()->SetTitleFont(43);
   h_dummy2_copy__178->GetZaxis()->SetLabelFont(43);
   h_dummy2_copy__178->GetZaxis()->SetLabelSize(21);
   h_dummy2_copy__178->GetZaxis()->SetTitleSize(21);
   h_dummy2_copy__178->GetZaxis()->SetTitleOffset(1);
   h_dummy2_copy__178->GetZaxis()->SetTitleFont(43);
   h_dummy2_copy__178->Draw("sameaxis");
//    TLatex *   tex = new TLatex(0.15,0.9,"   #chi^{2}/ndf = 2.4 / 4  #chi^{2}prob = 0.66");
// tex->SetNDC();
//    tex->SetTextFont(42);
//    tex->SetTextSize(0.1);
//    tex->SetLineWidth(2);
//    tex->Draw();
   pad->Modified();
   c1_n40->cd();
  
// ------------>Primitives in pad: 
   TPad *pad1 = new TPad("", "",0,0.2,1,1);
   pad1->Draw();
   pad1->cd();
   pad1->Range(-0.1728395,-35.45998,1.061728,319.1398);
   pad1->SetFillColor(0);
   pad1->SetFillStyle(4000);
   pad1->SetBorderMode(0);
   pad1->SetBorderSize(0);
   pad1->SetTickx(1);
   pad1->SetTicky(1);
   pad1->SetLeftMargin(0.14);
   pad1->SetRightMargin(0.01);
   pad1->SetTopMargin(0.05);
   pad1->SetFrameBorderMode(0);
   pad1->SetFrameBorderMode(0);
   Double_t xAxis259[5] = {0, 0.5499, 0.7631, 0.8834, 1}; 
   
   TH1D *h_dummy__179 = new TH1D("h_dummy__179","h",4, xAxis259);
   h_dummy__179->SetMinimum(0);
   h_dummy__179->SetMaximum(350);
   h_dummy__179->SetEntries(230235);
   h_dummy__179->SetDirectory(0);
   h_dummy__179->SetStats(0);
   h_dummy__179->SetFillColor(2);
   h_dummy__179->SetLineColor(2);
   h_dummy__179->SetMarkerStyle(20);
   h_dummy__179->SetMarkerSize(1.2);
   h_dummy__179->GetXaxis()->SetLabelFont(43);
   h_dummy__179->GetXaxis()->SetLabelSize(0);
   h_dummy__179->GetXaxis()->SetTitleSize(21);
   h_dummy__179->GetXaxis()->SetTitleOffset(2);
   h_dummy__179->GetXaxis()->SetTitleFont(43);
   h_dummy__179->GetYaxis()->SetTitle("Events");
   h_dummy__179->GetYaxis()->SetLabelFont(43);
   h_dummy__179->GetYaxis()->SetLabelSize(21);
   h_dummy__179->GetYaxis()->SetTitleSize(21);
   h_dummy__179->GetYaxis()->SetTitleOffset(2.1);
   h_dummy__179->GetYaxis()->SetTitleFont(43);
   h_dummy__179->GetZaxis()->SetLabelFont(43);
   h_dummy__179->GetZaxis()->SetLabelSize(21);
   h_dummy__179->GetZaxis()->SetTitleSize(21);
   h_dummy__179->GetZaxis()->SetTitleOffset(1);
   h_dummy__179->GetZaxis()->SetTitleFont(43);
   h_dummy__179->Draw("HIST");
   
   THStack *__stack__ = new THStack();
   __stack__->SetName("");
   __stack__->SetTitle("");
   Double_t xAxis260[5] = {0, 0.5499, 0.7631, 0.8834, 1}; 
   
   TH1F *_stack_20 = new TH1F("_stack_20","",4, xAxis260);
   _stack_20->SetMinimum(0);
   _stack_20->SetMaximum(152.2365);
   _stack_20->SetDirectory(0);
   _stack_20->SetStats(0);
   _stack_20->SetLineWidth(2);
   _stack_20->SetMarkerStyle(20);
   _stack_20->SetMarkerSize(1.2);
   _stack_20->GetXaxis()->SetLabelFont(43);
   _stack_20->GetXaxis()->SetLabelSize(21);
   _stack_20->GetXaxis()->SetTitleSize(21);
   _stack_20->GetXaxis()->SetTitleOffset(1.4);
   _stack_20->GetXaxis()->SetTitleFont(43);
   _stack_20->GetYaxis()->SetLabelFont(43);
   _stack_20->GetYaxis()->SetLabelSize(21);
   _stack_20->GetYaxis()->SetTitleSize(21);
   _stack_20->GetYaxis()->SetTitleOffset(1.4);
   _stack_20->GetYaxis()->SetTitleFont(43);
   _stack_20->GetZaxis()->SetLabelFont(43);
   _stack_20->GetZaxis()->SetLabelSize(21);
   _stack_20->GetZaxis()->SetTitleSize(21);
   _stack_20->GetZaxis()->SetTitleOffset(1);
   _stack_20->GetZaxis()->SetTitleFont(43);
   __stack__->SetHistogram(_stack_20);
   
   Double_t xAxis264[5] = {0, 0.5499, 0.7631, 0.8834, 1}; 
   
   TH1D *ljets_ge10j4b_ttt_stack_4 = new TH1D("ljets_ge10j4b_ttt_stack_4","h",4, xAxis264);
   ljets_ge10j4b_ttt_stack_4->SetBinContent(1,9.9326);
   ljets_ge10j4b_ttt_stack_4->SetBinContent(2,9.141474);
   ljets_ge10j4b_ttt_stack_4->SetBinContent(3,5.804022);
   ljets_ge10j4b_ttt_stack_4->SetBinContent(4,3.518477);
   ljets_ge10j4b_ttt_stack_4->SetEntries(18645);
   ljets_ge10j4b_ttt_stack_4->SetDirectory(0);
   ljets_ge10j4b_ttt_stack_4->SetStats(0);
   ljets_ge10j4b_ttt_stack_4->SetFillColor(kGray);
   ljets_ge10j4b_ttt_stack_4->SetMarkerStyle(20);
   ljets_ge10j4b_ttt_stack_4->SetMarkerSize(1.2);
   ljets_ge10j4b_ttt_stack_4->GetXaxis()->SetLabelFont(43);
   ljets_ge10j4b_ttt_stack_4->GetXaxis()->SetLabelSize(21);
   ljets_ge10j4b_ttt_stack_4->GetXaxis()->SetTitleSize(21);
   ljets_ge10j4b_ttt_stack_4->GetXaxis()->SetTitleOffset(1.4);
   ljets_ge10j4b_ttt_stack_4->GetXaxis()->SetTitleFont(43);
   ljets_ge10j4b_ttt_stack_4->GetYaxis()->SetLabelFont(43);
   ljets_ge10j4b_ttt_stack_4->GetYaxis()->SetLabelSize(21);
   ljets_ge10j4b_ttt_stack_4->GetYaxis()->SetTitleSize(21);
   ljets_ge10j4b_ttt_stack_4->GetYaxis()->SetTitleOffset(1.4);
   ljets_ge10j4b_ttt_stack_4->GetYaxis()->SetTitleFont(43);
   ljets_ge10j4b_ttt_stack_4->GetZaxis()->SetLabelFont(43);
   ljets_ge10j4b_ttt_stack_4->GetZaxis()->SetLabelSize(21);
   ljets_ge10j4b_ttt_stack_4->GetZaxis()->SetTitleSize(21);
   ljets_ge10j4b_ttt_stack_4->GetZaxis()->SetTitleOffset(1);
   ljets_ge10j4b_ttt_stack_4->GetZaxis()->SetTitleFont(43);
   __stack__->Add(ljets_ge10j4b_ttt_stack_4,"");
   Double_t xAxis261[5] = {0, 0.5499, 0.7631, 0.8834, 1}; 
   
   TH1D *ljets_ge10j4b_TTB_stack_1 = new TH1D("ljets_ge10j4b_TTB_stack_1","h",4, xAxis261);
   ljets_ge10j4b_TTB_stack_1->SetBinContent(1,116.4205);
   ljets_ge10j4b_TTB_stack_1->SetBinContent(2,88.62734);
   ljets_ge10j4b_TTB_stack_1->SetBinContent(3,54.95817);
   ljets_ge10j4b_TTB_stack_1->SetBinContent(4,23.64462);
   ljets_ge10j4b_TTB_stack_1->SetEntries(40135);
   ljets_ge10j4b_TTB_stack_1->SetDirectory(0);
   ljets_ge10j4b_TTB_stack_1->SetStats(0);

   ci = TColor::GetColor("#6666cc");
   ljets_ge10j4b_TTB_stack_1->SetFillColor(ci);
   ljets_ge10j4b_TTB_stack_1->SetMarkerStyle(20);
   ljets_ge10j4b_TTB_stack_1->SetMarkerSize(1.2);
   ljets_ge10j4b_TTB_stack_1->GetXaxis()->SetLabelFont(43);
   ljets_ge10j4b_TTB_stack_1->GetXaxis()->SetLabelSize(21);
   ljets_ge10j4b_TTB_stack_1->GetXaxis()->SetTitleSize(21);
   ljets_ge10j4b_TTB_stack_1->GetXaxis()->SetTitleOffset(1.4);
   ljets_ge10j4b_TTB_stack_1->GetXaxis()->SetTitleFont(43);
   ljets_ge10j4b_TTB_stack_1->GetYaxis()->SetLabelFont(43);
   ljets_ge10j4b_TTB_stack_1->GetYaxis()->SetLabelSize(21);
   ljets_ge10j4b_TTB_stack_1->GetYaxis()->SetTitleSize(21);
   ljets_ge10j4b_TTB_stack_1->GetYaxis()->SetTitleOffset(1.4);
   ljets_ge10j4b_TTB_stack_1->GetYaxis()->SetTitleFont(43);
   ljets_ge10j4b_TTB_stack_1->GetZaxis()->SetLabelFont(43);
   ljets_ge10j4b_TTB_stack_1->GetZaxis()->SetLabelSize(21);
   ljets_ge10j4b_TTB_stack_1->GetZaxis()->SetTitleSize(21);
   ljets_ge10j4b_TTB_stack_1->GetZaxis()->SetTitleOffset(1);
   ljets_ge10j4b_TTB_stack_1->GetZaxis()->SetTitleFont(43);
   __stack__->Add(ljets_ge10j4b_TTB_stack_1,"");
   Double_t xAxis262[5] = {0, 0.5499, 0.7631, 0.8834, 1}; 
   
   TH1D *ljets_ge10j4b_TTC_stack_2 = new TH1D("ljets_ge10j4b_TTC_stack_2","h",4, xAxis262);
   ljets_ge10j4b_TTC_stack_2->SetBinContent(1,14.77218);
   ljets_ge10j4b_TTC_stack_2->SetBinContent(2,7.648516);
   ljets_ge10j4b_TTC_stack_2->SetBinContent(3,4.058552);
   ljets_ge10j4b_TTC_stack_2->SetBinContent(4,1.233409);
   ljets_ge10j4b_TTC_stack_2->SetEntries(2130);
   ljets_ge10j4b_TTC_stack_2->SetDirectory(0);
   ljets_ge10j4b_TTC_stack_2->SetStats(0);

   ci = TColor::GetColor("#ccccff");
   ljets_ge10j4b_TTC_stack_2->SetFillColor(ci);
   ljets_ge10j4b_TTC_stack_2->SetMarkerStyle(20);
   ljets_ge10j4b_TTC_stack_2->SetMarkerSize(1.2);
   ljets_ge10j4b_TTC_stack_2->GetXaxis()->SetLabelFont(43);
   ljets_ge10j4b_TTC_stack_2->GetXaxis()->SetLabelSize(21);
   ljets_ge10j4b_TTC_stack_2->GetXaxis()->SetTitleSize(21);
   ljets_ge10j4b_TTC_stack_2->GetXaxis()->SetTitleOffset(1.4);
   ljets_ge10j4b_TTC_stack_2->GetXaxis()->SetTitleFont(43);
   ljets_ge10j4b_TTC_stack_2->GetYaxis()->SetLabelFont(43);
   ljets_ge10j4b_TTC_stack_2->GetYaxis()->SetLabelSize(21);
   ljets_ge10j4b_TTC_stack_2->GetYaxis()->SetTitleSize(21);
   ljets_ge10j4b_TTC_stack_2->GetYaxis()->SetTitleOffset(1.4);
   ljets_ge10j4b_TTC_stack_2->GetYaxis()->SetTitleFont(43);
   ljets_ge10j4b_TTC_stack_2->GetZaxis()->SetLabelFont(43);
   ljets_ge10j4b_TTC_stack_2->GetZaxis()->SetLabelSize(21);
   ljets_ge10j4b_TTC_stack_2->GetZaxis()->SetTitleSize(21);
   ljets_ge10j4b_TTC_stack_2->GetZaxis()->SetTitleOffset(1);
   ljets_ge10j4b_TTC_stack_2->GetZaxis()->SetTitleFont(43);
   __stack__->Add(ljets_ge10j4b_TTC_stack_2,"");
   Double_t xAxis263[5] = {0, 0.5499, 0.7631, 0.8834, 1}; 
   
   TH1D *ljets_ge10j4b_TTL_stack_3 = new TH1D("ljets_ge10j4b_TTL_stack_3","h",4, xAxis263);
   ljets_ge10j4b_TTL_stack_3->SetBinContent(1,1.027284);
   ljets_ge10j4b_TTL_stack_3->SetBinContent(2,0.3433976);
   ljets_ge10j4b_TTL_stack_3->SetBinContent(3,0.8285649);
   ljets_ge10j4b_TTL_stack_3->SetBinContent(4,0.1993628);
   ljets_ge10j4b_TTL_stack_3->SetEntries(187);
   ljets_ge10j4b_TTL_stack_3->SetDirectory(0);
   ljets_ge10j4b_TTL_stack_3->SetStats(0);
   ljets_ge10j4b_TTL_stack_3->SetMarkerStyle(20);
   ljets_ge10j4b_TTL_stack_3->SetMarkerSize(1.2);
   ljets_ge10j4b_TTL_stack_3->GetXaxis()->SetLabelFont(43);
   ljets_ge10j4b_TTL_stack_3->GetXaxis()->SetLabelSize(21);
   ljets_ge10j4b_TTL_stack_3->GetXaxis()->SetTitleSize(21);
   ljets_ge10j4b_TTL_stack_3->GetXaxis()->SetTitleOffset(1.4);
   ljets_ge10j4b_TTL_stack_3->GetXaxis()->SetTitleFont(43);
   ljets_ge10j4b_TTL_stack_3->GetYaxis()->SetLabelFont(43);
   ljets_ge10j4b_TTL_stack_3->GetYaxis()->SetLabelSize(21);
   ljets_ge10j4b_TTL_stack_3->GetYaxis()->SetTitleSize(21);
   ljets_ge10j4b_TTL_stack_3->GetYaxis()->SetTitleOffset(1.4);
   ljets_ge10j4b_TTL_stack_3->GetYaxis()->SetTitleFont(43);
   ljets_ge10j4b_TTL_stack_3->GetZaxis()->SetLabelFont(43);
   ljets_ge10j4b_TTL_stack_3->GetZaxis()->SetLabelSize(21);
   ljets_ge10j4b_TTL_stack_3->GetZaxis()->SetTitleSize(21);
   ljets_ge10j4b_TTL_stack_3->GetZaxis()->SetTitleOffset(1);
   ljets_ge10j4b_TTL_stack_3->GetZaxis()->SetTitleFont(43);
   __stack__->Add(ljets_ge10j4b_TTL_stack_3,"");
   Double_t xAxis265[5] = {0, 0.5499, 0.7631, 0.8834, 1}; 
   
   TH1D *ljets_ge10j4b_tttt_stack_5 = new TH1D("ljets_ge10j4b_tttt_stack_5","h",4, xAxis265);
   ljets_ge10j4b_tttt_stack_5->SetBinContent(1,1.454897);
   ljets_ge10j4b_tttt_stack_5->SetBinContent(2,3.30537);
   ljets_ge10j4b_tttt_stack_5->SetBinContent(3,4.738441);
   ljets_ge10j4b_tttt_stack_5->SetBinContent(4,5.239779);
   ljets_ge10j4b_tttt_stack_5->SetEntries(164726);
   ljets_ge10j4b_tttt_stack_5->SetDirectory(0);
   ljets_ge10j4b_tttt_stack_5->SetStats(0);
   ljets_ge10j4b_tttt_stack_5->SetFillColor(92);
   ljets_ge10j4b_tttt_stack_5->SetMarkerStyle(20);
   ljets_ge10j4b_tttt_stack_5->SetMarkerSize(1.2);
   ljets_ge10j4b_tttt_stack_5->GetXaxis()->SetLabelFont(43);
   ljets_ge10j4b_tttt_stack_5->GetXaxis()->SetLabelSize(21);
   ljets_ge10j4b_tttt_stack_5->GetXaxis()->SetTitleSize(21);
   ljets_ge10j4b_tttt_stack_5->GetXaxis()->SetTitleOffset(1.4);
   ljets_ge10j4b_tttt_stack_5->GetXaxis()->SetTitleFont(43);
   ljets_ge10j4b_tttt_stack_5->GetYaxis()->SetLabelFont(43);
   ljets_ge10j4b_tttt_stack_5->GetYaxis()->SetLabelSize(21);
   ljets_ge10j4b_tttt_stack_5->GetYaxis()->SetTitleSize(21);
   ljets_ge10j4b_tttt_stack_5->GetYaxis()->SetTitleOffset(1.4);
   ljets_ge10j4b_tttt_stack_5->GetYaxis()->SetTitleFont(43);
   ljets_ge10j4b_tttt_stack_5->GetZaxis()->SetLabelFont(43);
   ljets_ge10j4b_tttt_stack_5->GetZaxis()->SetLabelSize(21);
   ljets_ge10j4b_tttt_stack_5->GetZaxis()->SetTitleSize(21);
   ljets_ge10j4b_tttt_stack_5->GetZaxis()->SetTitleOffset(1);
   ljets_ge10j4b_tttt_stack_5->GetZaxis()->SetTitleFont(43);
   __stack__->Add(ljets_ge10j4b_tttt_stack_5,"");
   Double_t xAxis266[5] = {0, 0.5499, 0.7631, 0.8834, 1}; 
   
   TH1D *ljets_ge10j4b_BSMtttt400_stack_6 = new TH1D("ljets_ge10j4b_BSMtttt400_stack_6","h",4, xAxis266);
   ljets_ge10j4b_BSMtttt400_stack_6->SetBinContent(1,1.379657);
   ljets_ge10j4b_BSMtttt400_stack_6->SetBinContent(2,3.701596);
   ljets_ge10j4b_BSMtttt400_stack_6->SetBinContent(3,5.754271);
   ljets_ge10j4b_BSMtttt400_stack_6->SetBinContent(4,7.523221);
   ljets_ge10j4b_BSMtttt400_stack_6->SetEntries(4408);
   ljets_ge10j4b_BSMtttt400_stack_6->SetDirectory(0);
   ljets_ge10j4b_BSMtttt400_stack_6->SetStats(0);
   ljets_ge10j4b_BSMtttt400_stack_6->SetFillColor(2);
   ljets_ge10j4b_BSMtttt400_stack_6->SetLineColor(2);
   ljets_ge10j4b_BSMtttt400_stack_6->SetMarkerStyle(20);
   ljets_ge10j4b_BSMtttt400_stack_6->SetMarkerSize(1.2);
   ljets_ge10j4b_BSMtttt400_stack_6->GetXaxis()->SetLabelFont(43);
   ljets_ge10j4b_BSMtttt400_stack_6->GetXaxis()->SetLabelSize(21);
   ljets_ge10j4b_BSMtttt400_stack_6->GetXaxis()->SetTitleSize(21);
   ljets_ge10j4b_BSMtttt400_stack_6->GetXaxis()->SetTitleOffset(1.4);
   ljets_ge10j4b_BSMtttt400_stack_6->GetXaxis()->SetTitleFont(43);
   ljets_ge10j4b_BSMtttt400_stack_6->GetYaxis()->SetLabelFont(43);
   ljets_ge10j4b_BSMtttt400_stack_6->GetYaxis()->SetLabelSize(21);
   ljets_ge10j4b_BSMtttt400_stack_6->GetYaxis()->SetTitleSize(21);
   ljets_ge10j4b_BSMtttt400_stack_6->GetYaxis()->SetTitleOffset(1.4);
   ljets_ge10j4b_BSMtttt400_stack_6->GetYaxis()->SetTitleFont(43);
   ljets_ge10j4b_BSMtttt400_stack_6->GetZaxis()->SetLabelFont(43);
   ljets_ge10j4b_BSMtttt400_stack_6->GetZaxis()->SetLabelSize(21);
   ljets_ge10j4b_BSMtttt400_stack_6->GetZaxis()->SetTitleSize(21);
   ljets_ge10j4b_BSMtttt400_stack_6->GetZaxis()->SetTitleOffset(1);
   ljets_ge10j4b_BSMtttt400_stack_6->GetZaxis()->SetTitleFont(43);
   __stack__->Add(ljets_ge10j4b_BSMtttt400_stack_6,"");
   __stack__->Draw("hist same");
   
   Double_t g_totErr_postFit_fx3079[4] = {
   0.27495,
   0.6565,
   0.82325,
   0.9417};
   Double_t g_totErr_postFit_fy3079[4] = {
   144.9871,
   112.7677,
   76.14202,
   41.35887};
   Double_t g_totErr_postFit_felx3079[4] = {
   0.27495,
   0.1066,
   0.06015,
   0.0583};
   Double_t g_totErr_postFit_fely3079[4] = {
   8.14679,
   5.053191,
   4.280645,
   3.35817};
   Double_t g_totErr_postFit_fehx3079[4] = {
   0.27495,
   0.1066,
   0.06015,
   0.0583};
   Double_t g_totErr_postFit_fehy3079[4] = {
   8.14679,
   5.053191,
   4.280645,
   3.35817};
   grae = new TGraphAsymmErrors(4,g_totErr_postFit_fx3079,g_totErr_postFit_fy3079,g_totErr_postFit_felx3079,g_totErr_postFit_fehx3079,g_totErr_postFit_fely3079,g_totErr_postFit_fehy3079);
   grae->SetName("g_totErr_postFit");
   grae->SetTitle("h");

   ci = TColor::GetColor("#6666ff");
   grae->SetFillColor(ci);
   grae->SetFillStyle(3354);
   grae->SetLineColor(0);
   grae->SetLineWidth(0);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(0);
   
   TH1F *Graph_g_totErr_postFit3079 = new TH1F("Graph_g_totErr_postFit3079","h",100,0,1.1);
   Graph_g_totErr_postFit3079->SetMinimum(26.48738);
   Graph_g_totErr_postFit3079->SetMaximum(164.6473);
   Graph_g_totErr_postFit3079->SetDirectory(0);
   Graph_g_totErr_postFit3079->SetStats(0);
   Graph_g_totErr_postFit3079->SetLineWidth(2);
   Graph_g_totErr_postFit3079->SetMarkerStyle(20);
   Graph_g_totErr_postFit3079->SetMarkerSize(1.2);
   Graph_g_totErr_postFit3079->GetXaxis()->SetLabelFont(43);
   Graph_g_totErr_postFit3079->GetXaxis()->SetLabelSize(21);
   Graph_g_totErr_postFit3079->GetXaxis()->SetTitleSize(21);
   Graph_g_totErr_postFit3079->GetXaxis()->SetTitleOffset(1.4);
   Graph_g_totErr_postFit3079->GetXaxis()->SetTitleFont(43);
   Graph_g_totErr_postFit3079->GetYaxis()->SetLabelFont(43);
   Graph_g_totErr_postFit3079->GetYaxis()->SetLabelSize(21);
   Graph_g_totErr_postFit3079->GetYaxis()->SetTitleSize(21);
   Graph_g_totErr_postFit3079->GetYaxis()->SetTitleOffset(1.4);
   Graph_g_totErr_postFit3079->GetYaxis()->SetTitleFont(43);
   Graph_g_totErr_postFit3079->GetZaxis()->SetLabelFont(43);
   Graph_g_totErr_postFit3079->GetZaxis()->SetLabelSize(21);
   Graph_g_totErr_postFit3079->GetZaxis()->SetTitleSize(21);
   Graph_g_totErr_postFit3079->GetZaxis()->SetTitleOffset(1);
   Graph_g_totErr_postFit3079->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_g_totErr_postFit3079);
   
   grae->Draw("e2");
   Double_t xAxis267[5] = {0, 0.5499, 0.7631, 0.8834, 1}; 
   
   TH1D *ljets_ge10j4b_BSMtttt400__180 = new TH1D("ljets_ge10j4b_BSMtttt400__180","h",4, xAxis267);
   ljets_ge10j4b_BSMtttt400__180->SetBinContent(1,28.20042);
   ljets_ge10j4b_BSMtttt400__180->SetBinContent(2,75.66123);
   ljets_ge10j4b_BSMtttt400__180->SetBinContent(3,117.6182);
   ljets_ge10j4b_BSMtttt400__180->SetBinContent(4,153.7759);
   ljets_ge10j4b_BSMtttt400__180->SetEntries(4408);
   ljets_ge10j4b_BSMtttt400__180->SetDirectory(0);
   ljets_ge10j4b_BSMtttt400__180->SetStats(0);
   ljets_ge10j4b_BSMtttt400__180->SetFillStyle(0);
   ljets_ge10j4b_BSMtttt400__180->SetLineColor(2);
   ljets_ge10j4b_BSMtttt400__180->SetLineStyle(2);
   ljets_ge10j4b_BSMtttt400__180->SetLineWidth(2);
   ljets_ge10j4b_BSMtttt400__180->SetMarkerStyle(20);
   ljets_ge10j4b_BSMtttt400__180->SetMarkerSize(1.2);
   ljets_ge10j4b_BSMtttt400__180->GetXaxis()->SetLabelFont(43);
   ljets_ge10j4b_BSMtttt400__180->GetXaxis()->SetLabelSize(21);
   ljets_ge10j4b_BSMtttt400__180->GetXaxis()->SetTitleSize(21);
   ljets_ge10j4b_BSMtttt400__180->GetXaxis()->SetTitleOffset(1.4);
   ljets_ge10j4b_BSMtttt400__180->GetXaxis()->SetTitleFont(43);
   ljets_ge10j4b_BSMtttt400__180->GetYaxis()->SetLabelFont(43);
   ljets_ge10j4b_BSMtttt400__180->GetYaxis()->SetLabelSize(21);
   ljets_ge10j4b_BSMtttt400__180->GetYaxis()->SetTitleSize(21);
   ljets_ge10j4b_BSMtttt400__180->GetYaxis()->SetTitleOffset(1.4);
   ljets_ge10j4b_BSMtttt400__180->GetYaxis()->SetTitleFont(43);
   ljets_ge10j4b_BSMtttt400__180->GetZaxis()->SetLabelFont(43);
   ljets_ge10j4b_BSMtttt400__180->GetZaxis()->SetLabelSize(21);
   ljets_ge10j4b_BSMtttt400__180->GetZaxis()->SetTitleSize(21);
   ljets_ge10j4b_BSMtttt400__180->GetZaxis()->SetTitleOffset(1);
   ljets_ge10j4b_BSMtttt400__180->GetZaxis()->SetTitleFont(43);
   ljets_ge10j4b_BSMtttt400__180->Draw("HISTsame");
   Double_t xAxis268[5] = {0, 0.5499, 0.7631, 0.8834, 1}; 
   
   TH1D *ljets_ge10j4b_BSMtttt400__181 = new TH1D("ljets_ge10j4b_BSMtttt400__181","h",4, xAxis268);
   ljets_ge10j4b_BSMtttt400__181->SetBinContent(1,1.379657);
   ljets_ge10j4b_BSMtttt400__181->SetBinContent(2,3.701596);
   ljets_ge10j4b_BSMtttt400__181->SetBinContent(3,5.754271);
   ljets_ge10j4b_BSMtttt400__181->SetBinContent(4,7.523221);
   ljets_ge10j4b_BSMtttt400__181->SetEntries(4408);
   ljets_ge10j4b_BSMtttt400__181->SetDirectory(0);
   ljets_ge10j4b_BSMtttt400__181->SetStats(0);
   ljets_ge10j4b_BSMtttt400__181->SetFillStyle(0);
   ljets_ge10j4b_BSMtttt400__181->SetLineColor(2);
   ljets_ge10j4b_BSMtttt400__181->SetLineStyle(2);
   ljets_ge10j4b_BSMtttt400__181->SetLineWidth(2);
   ljets_ge10j4b_BSMtttt400__181->SetMarkerStyle(20);
   ljets_ge10j4b_BSMtttt400__181->SetMarkerSize(1.2);
   ljets_ge10j4b_BSMtttt400__181->GetXaxis()->SetLabelFont(43);
   ljets_ge10j4b_BSMtttt400__181->GetXaxis()->SetLabelSize(21);
   ljets_ge10j4b_BSMtttt400__181->GetXaxis()->SetTitleSize(21);
   ljets_ge10j4b_BSMtttt400__181->GetXaxis()->SetTitleOffset(1.4);
   ljets_ge10j4b_BSMtttt400__181->GetXaxis()->SetTitleFont(43);
   ljets_ge10j4b_BSMtttt400__181->GetYaxis()->SetLabelFont(43);
   ljets_ge10j4b_BSMtttt400__181->GetYaxis()->SetLabelSize(21);
   ljets_ge10j4b_BSMtttt400__181->GetYaxis()->SetTitleSize(21);
   ljets_ge10j4b_BSMtttt400__181->GetYaxis()->SetTitleOffset(1.4);
   ljets_ge10j4b_BSMtttt400__181->GetYaxis()->SetTitleFont(43);
   ljets_ge10j4b_BSMtttt400__181->GetZaxis()->SetLabelFont(43);
   ljets_ge10j4b_BSMtttt400__181->GetZaxis()->SetLabelSize(21);
   ljets_ge10j4b_BSMtttt400__181->GetZaxis()->SetTitleSize(21);
   ljets_ge10j4b_BSMtttt400__181->GetZaxis()->SetTitleOffset(1);
   ljets_ge10j4b_BSMtttt400__181->GetZaxis()->SetTitleFont(43);
   // ljets_ge10j4b_BSMtttt400__181->Draw("HISTsame");
   
   Double_t Graph_from_ljets_ge10j4b_data_fx3080[4] = {
   0.27495,
   0.6565,
   0.82325,
   0.9417};
   Double_t Graph_from_ljets_ge10j4b_data_fy3080[4] = {
   155,
   125,
   68,
   40};
   Double_t Graph_from_ljets_ge10j4b_data_felx3080[4] = {
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_ljets_ge10j4b_data_fely3080[4] = {
   12.4499,
   11.18034,
   8.246211,
   6.324555};
   Double_t Graph_from_ljets_ge10j4b_data_fehx3080[4] = {
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_ljets_ge10j4b_data_fehy3080[4] = {
   12.4499,
   11.18034,
   8.246211,
   6.324555};
   grae = new TGraphAsymmErrors(4,Graph_from_ljets_ge10j4b_data_fx3080,Graph_from_ljets_ge10j4b_data_fy3080,Graph_from_ljets_ge10j4b_data_felx3080,Graph_from_ljets_ge10j4b_data_fehx3080,Graph_from_ljets_ge10j4b_data_fely3080,Graph_from_ljets_ge10j4b_data_fehy3080);
   grae->SetName("Graph_from_ljets_ge10j4b_data");
   grae->SetTitle("h");
   grae->SetLineWidth(2);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(1.4);
   
   TH1F *Graph_Graph_from_ljets_ge10j4b_data3080 = new TH1F("Graph_Graph_from_ljets_ge10j4b_data3080","h",100,0,1.099945);
   Graph_Graph_from_ljets_ge10j4b_data3080->SetMinimum(20.298);
   Graph_Graph_from_ljets_ge10j4b_data3080->SetMaximum(180.8273);
   Graph_Graph_from_ljets_ge10j4b_data3080->SetDirectory(0);
   Graph_Graph_from_ljets_ge10j4b_data3080->SetStats(0);
   Graph_Graph_from_ljets_ge10j4b_data3080->SetLineWidth(2);
   Graph_Graph_from_ljets_ge10j4b_data3080->SetMarkerStyle(20);
   Graph_Graph_from_ljets_ge10j4b_data3080->SetMarkerSize(1.2);
   Graph_Graph_from_ljets_ge10j4b_data3080->GetXaxis()->SetLabelFont(43);
   Graph_Graph_from_ljets_ge10j4b_data3080->GetXaxis()->SetLabelSize(21);
   Graph_Graph_from_ljets_ge10j4b_data3080->GetXaxis()->SetTitleSize(21);
   Graph_Graph_from_ljets_ge10j4b_data3080->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_ljets_ge10j4b_data3080->GetXaxis()->SetTitleFont(43);
   Graph_Graph_from_ljets_ge10j4b_data3080->GetYaxis()->SetLabelFont(43);
   Graph_Graph_from_ljets_ge10j4b_data3080->GetYaxis()->SetLabelSize(21);
   Graph_Graph_from_ljets_ge10j4b_data3080->GetYaxis()->SetTitleSize(21);
   Graph_Graph_from_ljets_ge10j4b_data3080->GetYaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_ljets_ge10j4b_data3080->GetYaxis()->SetTitleFont(43);
   Graph_Graph_from_ljets_ge10j4b_data3080->GetZaxis()->SetLabelFont(43);
   Graph_Graph_from_ljets_ge10j4b_data3080->GetZaxis()->SetLabelSize(21);
   Graph_Graph_from_ljets_ge10j4b_data3080->GetZaxis()->SetTitleSize(21);
   Graph_Graph_from_ljets_ge10j4b_data3080->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_from_ljets_ge10j4b_data3080->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_from_ljets_ge10j4b_data3080);
   
   grae->Draw("PZ");
   Double_t xAxis269[5] = {0, 0.5499, 0.7631, 0.8834, 1}; 
   
   TH1D *h_blind__182 = new TH1D("h_blind__182","h",4, xAxis269);
   h_blind__182->SetBinError(1,10613.73);
   h_blind__182->SetBinError(2,9531.415);
   h_blind__182->SetBinError(3,7030.025);
   h_blind__182->SetBinError(4,5391.783);
   h_blind__182->SetEntries(804);
   h_blind__182->SetDirectory(0);
   h_blind__182->SetStats(0);

   ci = TColor::GetColor("#cccccc");
   h_blind__182->SetFillColor(ci);
   h_blind__182->SetFillStyle(3345);

   ci = TColor::GetColor("#cccccc");
   h_blind__182->SetLineColor(ci);
   h_blind__182->SetLineWidth(0);
   h_blind__182->SetMarkerStyle(20);
   h_blind__182->SetMarkerSize(1.2);
   h_blind__182->GetXaxis()->SetLabelFont(43);
   h_blind__182->GetXaxis()->SetLabelSize(21);
   h_blind__182->GetXaxis()->SetTitleSize(21);
   h_blind__182->GetXaxis()->SetTitleOffset(1.4);
   h_blind__182->GetXaxis()->SetTitleFont(43);
   h_blind__182->GetYaxis()->SetLabelFont(43);
   h_blind__182->GetYaxis()->SetLabelSize(21);
   h_blind__182->GetYaxis()->SetTitleSize(21);
   h_blind__182->GetYaxis()->SetTitleOffset(1.4);
   h_blind__182->GetYaxis()->SetTitleFont(43);
   h_blind__182->GetZaxis()->SetLabelFont(43);
   h_blind__182->GetZaxis()->SetLabelSize(21);
   h_blind__182->GetZaxis()->SetTitleSize(21);
   h_blind__182->GetZaxis()->SetTitleOffset(1);
   h_blind__182->GetZaxis()->SetTitleFont(43);
   h_blind__182->Draw("same HIST");
   TLatex*   tex = new TLatex(0.1812081,0.8816667,"ATLAS");
tex->SetNDC();
   tex->SetTextFont(73);
   tex->SetTextSize(21);
   tex->SetLineWidth(2);
   tex->Draw();
      tex = new TLatex(0.3724081,0.8816667,"Internal");
tex->SetNDC();
   tex->SetTextFont(43);
   tex->SetTextSize(21);
   tex->SetLineWidth(2);
   tex->Draw();
      tex = new TLatex(0.1812081,0.8316667,"#sqrt{s} = 13 TeV, 139 fb^{-1}");
tex->SetNDC();
   tex->SetTextFont(43);
   tex->SetTextSize(21);
   tex->SetLineWidth(2);
   tex->Draw();
//       tex = new TLatex(0.1812081,0.7816667,"None");
// tex->SetNDC();
//    tex->SetTextFont(43);
//    tex->SetTextSize(21);
//    tex->SetLineWidth(2);
//    tex->Draw();
      tex = new TLatex(0.1812081,0.7816667,"1L,#geq10j,4b");
      // tex = new TLatex(0.1812081,0.7316667,"1L,#geq10j,4b");
tex->SetNDC();
   tex->SetTextFont(43);
   tex->SetTextSize(21);
   tex->SetLineWidth(2);
   tex->Draw();
      tex = new TLatex(0.1812081,0.7316667,"Post-Fit");
      // tex = new TLatex(0.1812081,0.6816667,"Post-Fit");
tex->SetNDC();
   tex->SetTextFont(43);
   tex->SetTextSize(21);
   tex->SetLineWidth(2);
   tex->Draw();
   
   TLegend *leg = new TLegend(0.51,0.5,0.86,0.9166667,NULL,"brNDC");
   leg->SetNColumns(1);
   leg->SetBorderSize(0);
   leg->SetTextFont(43);
   leg->SetTextSize(21);
   leg->SetLineColor(1);
   leg->SetLineStyle(1);
   leg->SetLineWidth(1);
   leg->SetFillColor(0);
   leg->SetFillStyle(0);
   TLegendEntry *entry=leg->AddEntry("ljets_ge10j4b_data","Data","ep");
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(2);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(20);
   entry->SetMarkerSize(1.4);
   entry->SetTextFont(43);
   entry=leg->AddEntry("ljets_ge10j4b_BSMtttt400_stack_6","t#bar{t}H #rightarrow t#bar{t}t#bar{t} m_{H} = 400 GeV","f");
   entry->SetFillColor(2);
   entry->SetFillStyle(1001);
   entry->SetLineColor(2);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   entry=leg->AddEntry("ljets_ge10j4b_BSMtttt400","t#bar{t}H #rightarrow t#bar{t}t#bar{t} m_{H} = 400 GeV *","l");
   entry->SetLineColor(2);
   entry->SetLineStyle(2);
   entry->SetLineWidth(2);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   // entry=leg->AddEntry("ljets_ge10j4b_BSMtttt400","t#bar{t}t#bar{t}400","l");
   // entry->SetLineColor(2);
   // entry->SetLineStyle(2);
   // entry->SetLineWidth(2);
   // entry->SetMarkerColor(1);
   // entry->SetMarkerStyle(21);
   // entry->SetMarkerSize(1);
   // entry->SetTextFont(43);
   entry=leg->AddEntry("ljets_ge10j4b_tttt_stack_5","t#bar{t}t#bar{t}","f");
   entry->SetFillColor(92);
   entry->SetFillStyle(1001);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   entry=leg->AddEntry("ljets_ge10j4b_TTL_stack_3","t#bar{t}+light","f");
   entry->SetFillStyle(1001);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   entry=leg->AddEntry("ljets_ge10j4b_TTC_stack_2","t#bar{t}+#geq1c","f");

   ci = TColor::GetColor("#ccccff");
   entry->SetFillColor(ci);
   entry->SetFillStyle(1001);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   entry=leg->AddEntry("ljets_ge10j4b_TTB_stack_1","t#bar{t}+#geq1b","f");

   ci = TColor::GetColor("#6666cc");
   entry->SetFillColor(ci);
   entry->SetFillStyle(1001);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);

   entry=leg->AddEntry("ljets_ge10j4b_ttt_stack_4","Others","f");
   entry->SetFillColor(kGray);
   entry->SetFillStyle(1001);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);

   entry=leg->AddEntry("g_totErr_postFit","Uncertainty","f");

   ci = TColor::GetColor("#6666ff");
   entry->SetFillColor(ci);
   entry->SetFillStyle(3354);
   entry->SetLineStyle(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   leg->Draw();
      tex = new TLatex(0.4966443,0.96,"*: normalised to total bkg.");
tex->SetNDC();
   tex->SetTextFont(43);
   tex->SetTextSize(21);
   tex->SetLineWidth(2);
   tex->Draw();
   Double_t xAxis270[5] = {0, 0.5499, 0.7631, 0.8834, 1}; 
   
   TH1D *h_dummy_copy__183 = new TH1D("h_dummy_copy__183","h",4, xAxis270);
   h_dummy_copy__183->SetMinimum(0);
   h_dummy_copy__183->SetMaximum(301.4098);
   h_dummy_copy__183->SetEntries(230235);
   h_dummy_copy__183->SetDirectory(0);
   h_dummy_copy__183->SetStats(0);
   h_dummy_copy__183->SetFillColor(2);
   h_dummy_copy__183->SetLineColor(2);
   h_dummy_copy__183->SetMarkerStyle(20);
   h_dummy_copy__183->SetMarkerSize(1.2);
   h_dummy_copy__183->GetXaxis()->SetLabelFont(43);
   h_dummy_copy__183->GetXaxis()->SetLabelSize(0);
   h_dummy_copy__183->GetXaxis()->SetTitleSize(21);
   h_dummy_copy__183->GetXaxis()->SetTitleOffset(2);
   h_dummy_copy__183->GetXaxis()->SetTitleFont(43);
   h_dummy_copy__183->GetYaxis()->SetTitle("Events");
   h_dummy_copy__183->GetYaxis()->SetLabelFont(43);
   h_dummy_copy__183->GetYaxis()->SetLabelSize(21);
   h_dummy_copy__183->GetYaxis()->SetTitleSize(21);
   h_dummy_copy__183->GetYaxis()->SetTitleOffset(2.255033);
   h_dummy_copy__183->GetYaxis()->SetTitleFont(43);
   h_dummy_copy__183->GetZaxis()->SetLabelFont(43);
   h_dummy_copy__183->GetZaxis()->SetLabelSize(21);
   h_dummy_copy__183->GetZaxis()->SetTitleSize(21);
   h_dummy_copy__183->GetZaxis()->SetTitleOffset(1);
   h_dummy_copy__183->GetZaxis()->SetTitleFont(43);
   h_dummy_copy__183->Draw("sameaxis");
   pad1->Modified();
   c1_n40->cd();
   pad->RedrawAxis();
   c1_n40->Modified();
   c1_n40->cd();
   c1_n40->SetSelected(c1_n40);

   c1_n40->SaveAs("ljets_ge10j4b_postFit.pdf");
}
