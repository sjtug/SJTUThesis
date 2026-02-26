void HT_all()
{
//=========Macro generated from canvas: c1_n551/
//=========  (Mon Dec 11 21:39:00 2023) by ROOT version 6.24/06
   TCanvas *c1_n551 = new TCanvas("c1_n551", "",315,182,888,700);
   gStyle->SetOptStat(0);
   gStyle->SetOptTitle(0);
   c1_n551->SetHighLightColor(2);
   c1_n551->Range(0,0,1,1);
   c1_n551->SetFillColor(0);
   c1_n551->SetBorderMode(0);
   c1_n551->SetBorderSize(2);
   c1_n551->SetTickx(1);
   c1_n551->SetTicky(1);
   c1_n551->SetLeftMargin(0.16);
   c1_n551->SetRightMargin(0.05);
   c1_n551->SetTopMargin(0.05);
   c1_n551->SetBottomMargin(0.16);
   c1_n551->SetFrameBorderMode(0);
  
// ------------>Primitives in pad: 
   TPad *pad = new TPad("", "",0,0,1,0.28);
   pad->Draw();
   pad->cd();
   pad->Range(-111.1111,-0.0873016,2111.111,1.5);
   pad->SetFillColor(0);
   pad->SetFillStyle(4000);
   pad->SetBorderMode(0);
   pad->SetBorderSize(0);
   pad->SetTickx(1);
   pad->SetTicky(1);
   pad->SetLeftMargin(0.14);
   pad->SetRightMargin(0.05);
   pad->SetTopMargin(0);
   pad->SetBottomMargin(0.4);
   pad->SetFrameBorderMode(0);
   pad->SetFrameBorderMode(0);
   
   TH1D *h_dummy2__280 = new TH1D("h_dummy2__280","h",9,200,2000);
   h_dummy2__280->SetMinimum(0.2);
   h_dummy2__280->SetMaximum(1.8);
   h_dummy2__280->SetEntries(952014);
   h_dummy2__280->SetDirectory(0);
   h_dummy2__280->SetStats(0);
   h_dummy2__280->SetFillColor(2);
   h_dummy2__280->SetLineColor(2);
   h_dummy2__280->SetMarkerStyle(20);
   h_dummy2__280->SetMarkerSize(1.2);
   h_dummy2__280->GetXaxis()->SetTitle("H_{T}^{all} [GeV]");
   h_dummy2__280->GetXaxis()->SetLabelFont(43);
   h_dummy2__280->GetXaxis()->SetLabelOffset(0.025);
   h_dummy2__280->GetXaxis()->SetLabelSize(28);
   h_dummy2__280->GetXaxis()->SetTitleSize(28);
   h_dummy2__280->GetXaxis()->SetTitleOffset(1.1);
   h_dummy2__280->GetXaxis()->SetTitleFont(43);
   h_dummy2__280->GetYaxis()->SetTitle("Data / Bkg. ");
   h_dummy2__280->GetYaxis()->SetNdivisions(504);
   h_dummy2__280->GetYaxis()->SetTickLength(0);
   h_dummy2__280->GetYaxis()->SetLabelFont(43);
   h_dummy2__280->GetYaxis()->SetLabelSize(28);
   h_dummy2__280->GetYaxis()->SetTitleSize(28);
   h_dummy2__280->GetYaxis()->SetTitleOffset(2.2);
   h_dummy2__280->GetYaxis()->SetTitleFont(43);
   h_dummy2__280->GetZaxis()->SetLabelFont(43);
   h_dummy2__280->GetZaxis()->SetLabelSize(21);
   h_dummy2__280->GetZaxis()->SetTitleSize(21);
   h_dummy2__280->GetZaxis()->SetTitleOffset(1);
   h_dummy2__280->GetZaxis()->SetTitleFont(43);
   h_dummy2__280->Draw("HIST");
   TLine *line = new TLine(200,1,2000,1);
   line->SetLineStyle(2);
   line->SetLineWidth(2);
   line->Draw();
   
   Double_t g_ratio2_fx3129[9] = {
   300,
   500,
   700,
   900,
   1100,
   1300,
   1500,
   1700,
   1900};
   Double_t g_ratio2_fy3129[9] = {
   1,
   1,
   1,
   1,
   1,
   1,
   1,
   1,
   1};
   Double_t g_ratio2_felx3129[9] = {
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100};
   Double_t g_ratio2_fely3129[9] = {
   0.4029184,
   0.3883872,
   0.3750689,
   0.364621,
   0.3587511,
   0.3577658,
   0.3512695,
   0.3559165,
   0.3519439};
   Double_t g_ratio2_fehx3129[9] = {
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100};
   Double_t g_ratio2_fehy3129[9] = {
   0.4029184,
   0.3883872,
   0.3750689,
   0.364621,
   0.3587511,
   0.3577658,
   0.3512695,
   0.3559165,
   0.3519439};
   TGraphAsymmErrors *grae = new TGraphAsymmErrors(9,g_ratio2_fx3129,g_ratio2_fy3129,g_ratio2_felx3129,g_ratio2_fehx3129,g_ratio2_fely3129,g_ratio2_fehy3129);
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
   
   TH1F *Graph_g_ratio23129 = new TH1F("Graph_g_ratio23129","h",100,20,2180);
   Graph_g_ratio23129->SetMinimum(0.5164979);
   Graph_g_ratio23129->SetMaximum(1.483502);
   Graph_g_ratio23129->SetDirectory(0);
   Graph_g_ratio23129->SetStats(0);
   Graph_g_ratio23129->SetLineWidth(2);
   Graph_g_ratio23129->SetMarkerStyle(20);
   Graph_g_ratio23129->SetMarkerSize(1.2);
   Graph_g_ratio23129->GetXaxis()->SetLabelFont(43);
   Graph_g_ratio23129->GetXaxis()->SetLabelSize(21);
   Graph_g_ratio23129->GetXaxis()->SetTitleSize(21);
   Graph_g_ratio23129->GetXaxis()->SetTitleOffset(1.4);
   Graph_g_ratio23129->GetXaxis()->SetTitleFont(43);
   Graph_g_ratio23129->GetYaxis()->SetLabelFont(43);
   Graph_g_ratio23129->GetYaxis()->SetLabelSize(21);
   Graph_g_ratio23129->GetYaxis()->SetTitleSize(21);
   Graph_g_ratio23129->GetYaxis()->SetTitleOffset(2.2);
   Graph_g_ratio23129->GetYaxis()->SetTitleFont(43);
   Graph_g_ratio23129->GetZaxis()->SetLabelFont(43);
   Graph_g_ratio23129->GetZaxis()->SetLabelSize(21);
   Graph_g_ratio23129->GetZaxis()->SetTitleSize(21);
   Graph_g_ratio23129->GetZaxis()->SetTitleOffset(1);
   Graph_g_ratio23129->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_g_ratio23129);
   
   grae->Draw("e2");
   
   Double_t Graph_from_h_ratio_fx3130[9] = {
   300,
   500,
   700,
   900,
   1100,
   1300,
   1500,
   1700,
   1900};
   Double_t Graph_from_h_ratio_fy3130[9] = {
   1.05943,
   0.976308,
   1.08837,
   1.04962,
   1.1223,
   0.923321,
   1.11169,
   0.881367,
   0.979334};
   Double_t Graph_from_h_ratio_felx3130[9] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fely3130[9] = {
   0.07101623,
   0.02938023,
   0.03451039,
   0.04744845,
   0.07157759,
   0.09565031,
   0.1553457,
   0.1976376,
   0.2089135};
   Double_t Graph_from_h_ratio_fehx3130[9] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fehy3130[9] = {
   0.07101623,
   0.02938023,
   0.03451039,
   0.04744845,
   0.07157759,
   0.09565031,
   0.1553457,
   0.1976376,
   0.2089135};
   grae = new TGraphAsymmErrors(9,Graph_from_h_ratio_fx3130,Graph_from_h_ratio_fy3130,Graph_from_h_ratio_felx3130,Graph_from_h_ratio_fehx3130,Graph_from_h_ratio_fely3130,Graph_from_h_ratio_fehy3130);
   grae->SetName("Graph_from_h_ratio");
   grae->SetTitle("h");
   grae->SetLineWidth(2);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(1.4);
   
   TH1F *Graph_Graph_from_h_ratio3130 = new TH1F("Graph_Graph_from_h_ratio3130","h",100,20.22,2179.98);
   Graph_Graph_from_h_ratio3130->SetMinimum(0.6059528);
   Graph_Graph_from_h_ratio3130->SetMaximum(1.300658);
   Graph_Graph_from_h_ratio3130->SetDirectory(0);
   Graph_Graph_from_h_ratio3130->SetStats(0);
   Graph_Graph_from_h_ratio3130->SetLineWidth(2);
   Graph_Graph_from_h_ratio3130->SetMarkerStyle(20);
   Graph_Graph_from_h_ratio3130->SetMarkerSize(1.2);
   Graph_Graph_from_h_ratio3130->GetXaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3130->GetXaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3130->GetXaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3130->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_h_ratio3130->GetXaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio3130->GetYaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3130->GetYaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3130->GetYaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3130->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_from_h_ratio3130->GetYaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio3130->GetZaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3130->GetZaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3130->GetZaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3130->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_from_h_ratio3130->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_from_h_ratio3130);
   
   grae->Draw("PZ");
   
   /////
   Double_t Graph_from_h_ratio_fx31302[9] = {
   300,
   500,
   700,
   900,
   1100,
   1300,
   1500,
   1700,
   1900};
   Double_t Graph_from_h_ratio_fy31302[9] = {
   1.56573,
   1.26756,
   1.28661,
   1.14488,
   1.14264,
   0.881382,
   1.00847,
   0.763353,
   0.790441};
   Double_t Graph_from_h_ratio_felx31302[9] = {
   99.8,
   99.8,
   99.8,
   99.8,
   99.8,
   99.8,
   99.8,
   99.8,
   99.8};
   Double_t Graph_from_h_ratio_fely31302[9] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fehx31302[9] = {
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100};
   Double_t Graph_from_h_ratio_fehy31302[9] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   grae = new TGraphAsymmErrors(9,Graph_from_h_ratio_fx31302,Graph_from_h_ratio_fy31302,Graph_from_h_ratio_felx31302,Graph_from_h_ratio_fehx31302,Graph_from_h_ratio_fely31302,Graph_from_h_ratio_fehy31302);
   grae->SetName("Graph_from_h_ratio");
   grae->SetTitle("h");
   grae->SetLineWidth(2);
   grae->SetLineColor(kRed);
   grae->SetLineStyle(2);
   grae->SetMarkerColor(kRed);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(0.5);
   
   TH1F *Graph_Graph_from_h_ratio31302 = new TH1F("Graph_Graph_from_h_ratio31302","h",100,20.22,2179.98);
   Graph_Graph_from_h_ratio31302->SetMinimum(0.6059528);
   Graph_Graph_from_h_ratio31302->SetMaximum(1.300658);
   Graph_Graph_from_h_ratio31302->SetDirectory(0);
   Graph_Graph_from_h_ratio31302->SetStats(0);
   Graph_Graph_from_h_ratio31302->SetLineWidth(2);
   Graph_Graph_from_h_ratio31302->SetMarkerStyle(20);
   Graph_Graph_from_h_ratio31302->SetMarkerSize(1.2);
   Graph_Graph_from_h_ratio31302->GetXaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio31302->GetXaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio31302->GetXaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio31302->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_h_ratio31302->GetXaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio31302->GetYaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio31302->GetYaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio31302->GetYaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio31302->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_from_h_ratio31302->GetYaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio31302->GetZaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio31302->GetZaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio31302->GetZaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio31302->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_from_h_ratio31302->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_from_h_ratio31302);
   
   grae->Draw("Z");
   /////

   TH1D *h_blindratio__281 = new TH1D("h_blindratio__281","h",9,200,2000);
   h_blindratio__281->SetBinError(1,84.28523);
   h_blindratio__281->SetBinError(2,186.5905);
   h_blindratio__281->SetBinError(3,175.9091);
   h_blindratio__281->SetBinError(4,122.8983);
   h_blindratio__281->SetBinError(5,86.90224);
   h_blindratio__281->SetBinError(6,53.36666);
   h_blindratio__281->SetBinError(7,39.59798);
   h_blindratio__281->SetBinError(8,24.65766);
   h_blindratio__281->SetBinError(9,25.92296);
   h_blindratio__281->SetEntries(6396);
   h_blindratio__281->SetDirectory(0);
   h_blindratio__281->SetStats(0);

   ci = TColor::GetColor("#cccccc");
   h_blindratio__281->SetFillColor(ci);
   h_blindratio__281->SetFillStyle(3345);

   ci = TColor::GetColor("#cccccc");
   h_blindratio__281->SetLineColor(ci);
   h_blindratio__281->SetLineWidth(0);
   h_blindratio__281->SetMarkerStyle(20);
   h_blindratio__281->SetMarkerSize(1.2);
   h_blindratio__281->GetXaxis()->SetLabelFont(43);
   h_blindratio__281->GetXaxis()->SetLabelSize(21);
   h_blindratio__281->GetXaxis()->SetTitleSize(21);
   h_blindratio__281->GetXaxis()->SetTitleOffset(1.4);
   h_blindratio__281->GetXaxis()->SetTitleFont(43);
   h_blindratio__281->GetYaxis()->SetLabelFont(43);
   h_blindratio__281->GetYaxis()->SetLabelSize(21);
   h_blindratio__281->GetYaxis()->SetTitleSize(21);
   h_blindratio__281->GetYaxis()->SetTitleOffset(2.2);
   h_blindratio__281->GetYaxis()->SetTitleFont(43);
   h_blindratio__281->GetZaxis()->SetLabelFont(43);
   h_blindratio__281->GetZaxis()->SetLabelSize(21);
   h_blindratio__281->GetZaxis()->SetTitleSize(21);
   h_blindratio__281->GetZaxis()->SetTitleOffset(1);
   h_blindratio__281->GetZaxis()->SetTitleFont(43);
   h_blindratio__281->Draw("HIST same");
   
   TH1D *h_dummy2_copy__282 = new TH1D("h_dummy2_copy__282","h",9,200,2000);
   h_dummy2_copy__282->SetMinimum(0.5);
   h_dummy2_copy__282->SetMaximum(1.5);
   h_dummy2_copy__282->SetEntries(952014);
   h_dummy2_copy__282->SetDirectory(0);
   h_dummy2_copy__282->SetStats(0);
   h_dummy2_copy__282->SetFillColor(2);
   h_dummy2_copy__282->SetLineColor(2);
   h_dummy2_copy__282->SetMarkerStyle(20);
   h_dummy2_copy__282->SetMarkerSize(1.2);
   h_dummy2_copy__282->GetXaxis()->SetTitle("H_{T}^{all} [GeV]");
   h_dummy2_copy__282->GetXaxis()->SetLabelFont(43);
   h_dummy2_copy__282->GetXaxis()->SetLabelOffset(0.025);
   h_dummy2_copy__282->GetXaxis()->SetLabelSize(21);
   h_dummy2_copy__282->GetXaxis()->SetTitleSize(21);
   h_dummy2_copy__282->GetXaxis()->SetTitleOffset(5);
   h_dummy2_copy__282->GetXaxis()->SetTitleFont(43);
   h_dummy2_copy__282->GetYaxis()->SetTitle("Data / Bkg.");
   h_dummy2_copy__282->GetYaxis()->SetNdivisions(-504);
   h_dummy2_copy__282->GetYaxis()->SetLabelFont(43);
   h_dummy2_copy__282->GetYaxis()->SetLabelSize(21);
   h_dummy2_copy__282->GetYaxis()->SetTitleSize(21);
   h_dummy2_copy__282->GetYaxis()->SetTitleOffset(2.255033);
   h_dummy2_copy__282->GetYaxis()->SetTitleFont(43);
   h_dummy2_copy__282->GetZaxis()->SetLabelFont(43);
   h_dummy2_copy__282->GetZaxis()->SetLabelSize(21);
   h_dummy2_copy__282->GetZaxis()->SetTitleSize(21);
   h_dummy2_copy__282->GetZaxis()->SetTitleOffset(1);
   h_dummy2_copy__282->GetZaxis()->SetTitleFont(43);
   h_dummy2_copy__282->Draw("sameaxis");

   pad->Modified();
   c1_n551->cd();
  
// ------------>Primitives in pad: 
   TPad *pad2 = new TPad("", "",0,0.2,1,1);
   pad2->Draw();
   pad2->cd();
   pad2->Range(-111.1111,-237.7458,2111.111,2139.712);
   pad2->SetFillColor(0);
   pad2->SetFillStyle(4000);
   pad2->SetBorderMode(0);
   pad2->SetBorderSize(0);
   pad2->SetTickx(1);
   pad2->SetTicky(1);
   pad2->SetLeftMargin(0.14);
   pad2->SetRightMargin(0.05);
   pad2->SetTopMargin(0.05);
   pad2->SetFrameBorderMode(0);
   pad2->SetFrameBorderMode(0);
   
   TH1D *h_dummy__283 = new TH1D("h_dummy__283","h",9,200,2000);
   h_dummy__283->SetMinimum(0);
   h_dummy__283->SetMaximum(2020.84);
   h_dummy__283->SetMaximum(h_dummy__283->GetMaximum()*1.1);
   h_dummy__283->SetEntries(952014);
   h_dummy__283->SetDirectory(0);
   h_dummy__283->SetStats(0);
   h_dummy__283->SetFillColor(2);
   h_dummy__283->SetLineColor(2);
   h_dummy__283->SetMarkerStyle(20);
   h_dummy__283->SetMarkerSize(1.2);
   h_dummy__283->GetXaxis()->SetLabelFont(43);
   h_dummy__283->GetXaxis()->SetLabelSize(0);
   h_dummy__283->GetXaxis()->SetTitleSize(28);
   h_dummy__283->GetXaxis()->SetTitleOffset(2);
   h_dummy__283->GetXaxis()->SetTitleFont(43);
   h_dummy__283->GetYaxis()->SetTitle("Events / 200 GeV");
   h_dummy__283->GetYaxis()->SetLabelFont(43);
   h_dummy__283->GetYaxis()->SetLabelSize(28);
   h_dummy__283->GetYaxis()->SetTitleSize(28);
   h_dummy__283->GetYaxis()->SetTitleOffset(2.2);
   h_dummy__283->GetYaxis()->SetTitleFont(43);
   h_dummy__283->GetYaxis()->SetNdivisions(505);
   h_dummy__283->GetZaxis()->SetLabelFont(43);
   h_dummy__283->GetZaxis()->SetLabelSize(21);
   h_dummy__283->GetZaxis()->SetTitleSize(21);
   h_dummy__283->GetZaxis()->SetTitleOffset(1);
   h_dummy__283->GetZaxis()->SetTitleFont(43);
   h_dummy__283->Draw("HIST");
   
   THStack * myStack= new THStack();
   myStack->SetName("");
   myStack->SetTitle("");
   
   TH1F *_stack_33 = new TH1F("_stack_33","",9,200,2000);
   _stack_33->SetMinimum(0);
   _stack_33->SetMaximum(1178.823);
   _stack_33->SetDirectory(0);
   _stack_33->SetStats(0);
   _stack_33->SetLineWidth(2);
   _stack_33->SetMarkerStyle(20);
   _stack_33->SetMarkerSize(1.2);
   _stack_33->GetXaxis()->SetLabelFont(43);
   _stack_33->GetXaxis()->SetLabelSize(21);
   _stack_33->GetXaxis()->SetTitleSize(21);
   _stack_33->GetXaxis()->SetTitleOffset(1.4);
   _stack_33->GetXaxis()->SetTitleFont(43);
   _stack_33->GetYaxis()->SetLabelFont(43);
   _stack_33->GetYaxis()->SetLabelSize(21);
   _stack_33->GetYaxis()->SetTitleSize(21);
   _stack_33->GetYaxis()->SetTitleOffset(2.2);
   _stack_33->GetYaxis()->SetTitleFont(43);
   _stack_33->GetZaxis()->SetLabelFont(43);
   _stack_33->GetZaxis()->SetLabelSize(21);
   _stack_33->GetZaxis()->SetTitleSize(21);
   _stack_33->GetZaxis()->SetTitleOffset(1);
   _stack_33->GetZaxis()->SetTitleFont(43);
   myStack->SetHistogram(_stack_33);
   
   
   TH1D *val_os2l_ge6jge3b_HT_all_ttW_stack_1 = new TH1D("val_os2l_ge6jge3b_HT_all_ttW_stack_1","h",9,200,2000);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetBinContent(1,12.57407+0.01489219+0.1198548);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetBinContent(2,74.57216+0.3377766+4.29077);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetBinContent(3,72.15912+0.6605664+9.921857);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetBinContent(4,42.93615+0.6024205+9.036091);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetBinContent(5,22.98021+0.4257209+5.868075);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetBinContent(6,10.97598+0.2778086+3.139968);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetBinContent(7,6.215696+0.1351404+1.575505);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetBinContent(8,3.20129+0.0977604+0.7818437);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetBinContent(9,3.671042+0.1299775+0.8093039);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetBinError(1,0.8635713);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetBinError(2,1.717459);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetBinError(3,1.636701);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetBinError(4,1.348241);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetBinError(5,1.069009);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetBinError(6,0.716127);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetBinError(7,0.5245777);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetBinError(8,0.4599312);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetBinError(9,0.3889181);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetEntries(278075);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetDirectory(0);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetStats(0);

   ci = TColor::GetColor("#cccccc");
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetFillColor(ci);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetMarkerStyle(20);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->SetMarkerSize(1.2);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->GetXaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->GetXaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->GetXaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->GetXaxis()->SetTitleOffset(1.4);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->GetXaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->GetYaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->GetYaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->GetYaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->GetYaxis()->SetTitleOffset(2.2);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->GetYaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->GetZaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->GetZaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->GetZaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->GetZaxis()->SetTitleOffset(1);
   val_os2l_ge6jge3b_HT_all_ttW_stack_1->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_os2l_ge6jge3b_HT_all_ttW_stack_1,"");
   
   TH1D *val_os2l_ge6jge3b_HT_all_TTB_stack_2 = new TH1D("val_os2l_ge6jge3b_HT_all_TTB_stack_2","h",9,200,2000);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetBinContent(1,130.9474);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetBinContent(2,709.8884);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetBinContent(3,567.8664);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetBinContent(4,281.2948);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetBinContent(5,128.2418);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetBinContent(6,57.82531);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetBinContent(7,25.37678);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetBinContent(8,12.33022);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetBinContent(9,12.02829);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetBinError(1,1.298303);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetBinError(2,2.801875);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetBinError(3,2.384175);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetBinError(4,1.589736);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetBinError(5,1.037782);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetBinError(6,0.6668445);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetBinError(7,0.4248974);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetBinError(8,0.2697383);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetBinError(9,0.2579539);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetEntries(267827);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetDirectory(0);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetStats(0);

   ci = TColor::GetColor("#6666cc");
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetFillColor(ci);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetMarkerStyle(20);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->SetMarkerSize(1.2);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->GetXaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->GetXaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->GetXaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->GetXaxis()->SetTitleOffset(1.4);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->GetXaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->GetYaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->GetYaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->GetYaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->GetYaxis()->SetTitleOffset(2.2);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->GetYaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->GetZaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->GetZaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->GetZaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->GetZaxis()->SetTitleOffset(1);
   val_os2l_ge6jge3b_HT_all_TTB_stack_2->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_os2l_ge6jge3b_HT_all_TTB_stack_2,"");
   
   TH1D *val_os2l_ge6jge3b_HT_all_TTC_stack_3 = new TH1D("val_os2l_ge6jge3b_HT_all_TTC_stack_3","h",9,200,2000);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetBinContent(1,57.18259);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetBinContent(2,287.1147);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetBinContent(3,211.5159);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetBinContent(4,103.5597);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetBinContent(5,47.33623);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetBinContent(6,21.36076);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetBinContent(7,9.647812);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetBinContent(8,4.596602);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetBinContent(9,4.293162);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetBinError(1,1.34921);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetBinError(2,2.587712);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetBinError(3,2.489245);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetBinError(4,2.017834);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetBinError(5,1.118891);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetBinError(6,0.6788909);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetBinError(7,0.4193452);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetBinError(8,0.2323035);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetBinError(9,0.2164293);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetEntries(72057);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetDirectory(0);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetStats(0);

   ci = TColor::GetColor("#ccccff");
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetFillColor(ci);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetMarkerStyle(20);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->SetMarkerSize(1.2);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->GetXaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->GetXaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->GetXaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->GetXaxis()->SetTitleOffset(1.4);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->GetXaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->GetYaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->GetYaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->GetYaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->GetYaxis()->SetTitleOffset(2.2);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->GetYaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->GetZaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->GetZaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->GetZaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->GetZaxis()->SetTitleOffset(1);
   val_os2l_ge6jge3b_HT_all_TTC_stack_3->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_os2l_ge6jge3b_HT_all_TTC_stack_3,"");
   
   TH1D *val_os2l_ge6jge3b_HT_all_TTL_stack_4 = new TH1D("val_os2l_ge6jge3b_HT_all_TTL_stack_4","h",9,200,2000);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetBinContent(1,8.70689);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetBinContent(2,38.19865);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetBinContent(3,26.36461);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetBinContent(4,12.25557);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetBinContent(5,5.43029);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetBinContent(6,2.811347);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetBinContent(7,1.126286);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetBinContent(8,0.5497095);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetBinContent(9,0.511373);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetBinError(1,0.6035061);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetBinError(2,1.358155);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetBinError(3,1.793977);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetBinError(4,1.309486);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetBinError(5,0.4512565);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetBinError(6,0.1963782);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetBinError(7,0.1003578);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetBinError(8,0.05446397);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetBinError(9,0.051154);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetEntries(4887);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetDirectory(0);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetStats(0);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetMarkerStyle(20);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->SetMarkerSize(1.2);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->GetXaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->GetXaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->GetXaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->GetXaxis()->SetTitleOffset(1.4);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->GetXaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->GetYaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->GetYaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->GetYaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->GetYaxis()->SetTitleOffset(2.2);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->GetYaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->GetZaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->GetZaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->GetZaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->GetZaxis()->SetTitleOffset(1);
   val_os2l_ge6jge3b_HT_all_TTL_stack_4->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_os2l_ge6jge3b_HT_all_TTL_stack_4,"");
   
   

   myStack->Draw("hist same");
   
   Double_t g_totErr_fx3131[9] = {
   300,
   500,
   700,
   900,
   1100,
   1300,
   1500,
   1700,
   1900};
   Double_t g_totErr_fy3131[9] = {
   209.546,
   1114.4,
   888.489,
   449.685,
   210.282,
   96.3912,
   44.0772,
   21.5574,
   21.4432};
   Double_t g_totErr_felx3131[9] = {
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100};
   Double_t g_totErr_fely3131[9] = {
   84.5349,
   436.0379,
   337.9672,
   166.9516,
   76.99671,
   35.28641,
   15.82848,
   7.849741,
   7.719987};
   Double_t g_totErr_fehx3131[9] = {
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100};
   Double_t g_totErr_fehy3131[9] = {
   84.5349,
   436.0379,
   337.9672,
   166.9516,
   76.99671,
   35.28641,
   15.82848,
   7.849741,
   7.719987};
   grae = new TGraphAsymmErrors(9,g_totErr_fx3131,g_totErr_fy3131,g_totErr_felx3131,g_totErr_fehx3131,g_totErr_fely3131,g_totErr_fehy3131);
   grae->SetName("g_totErr");
   grae->SetTitle("h");

   ci = TColor::GetColor("#6666ff");
   grae->SetFillColor(ci);
   grae->SetFillStyle(3354);
   grae->SetLineColor(0);
   grae->SetLineWidth(0);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(0);
   
   TH1F *Graph_g_totErr3131 = new TH1F("Graph_g_totErr3131","h",100,20,2180);
   Graph_g_totErr3131->SetMinimum(12.78474);
   Graph_g_totErr3131->SetMaximum(1713.179);
   Graph_g_totErr3131->SetDirectory(0);
   Graph_g_totErr3131->SetStats(0);
   Graph_g_totErr3131->SetLineWidth(2);
   Graph_g_totErr3131->SetMarkerStyle(20);
   Graph_g_totErr3131->SetMarkerSize(1.2);
   Graph_g_totErr3131->GetXaxis()->SetLabelFont(43);
   Graph_g_totErr3131->GetXaxis()->SetLabelSize(21);
   Graph_g_totErr3131->GetXaxis()->SetTitleSize(21);
   Graph_g_totErr3131->GetXaxis()->SetTitleOffset(1.4);
   Graph_g_totErr3131->GetXaxis()->SetTitleFont(43);
   Graph_g_totErr3131->GetYaxis()->SetLabelFont(43);
   Graph_g_totErr3131->GetYaxis()->SetLabelSize(21);
   Graph_g_totErr3131->GetYaxis()->SetTitleSize(21);
   Graph_g_totErr3131->GetYaxis()->SetTitleOffset(2.2);
   Graph_g_totErr3131->GetYaxis()->SetTitleFont(43);
   Graph_g_totErr3131->GetZaxis()->SetLabelFont(43);
   Graph_g_totErr3131->GetZaxis()->SetLabelSize(21);
   Graph_g_totErr3131->GetZaxis()->SetTitleSize(21);
   Graph_g_totErr3131->GetZaxis()->SetTitleOffset(1);
   Graph_g_totErr3131->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_g_totErr3131);
   
   grae->Draw("e2");
   
   TH1D *val_os2l_ge6jge3b_HT_all_BSMtttt400__284 = new TH1D("val_os2l_ge6jge3b_HT_all_BSMtttt400__284","h",9,200,2000);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->SetBinContent(1,141.787);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->SetBinContent(2,858.339);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->SetBinContent(3,751.59);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->SetBinContent(4,412.27);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->SetBinContent(5,206.538);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->SetBinContent(6,100.978);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->SetBinContent(7,48.5885);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->SetBinContent(8,24.8902);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->SetBinContent(9,26.5674);

   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->SetEntries(11959);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->SetDirectory(0);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->SetStats(0);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->SetFillStyle(0);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->SetLineColor(2);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->SetLineStyle(2);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->SetLineWidth(2);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->SetMarkerStyle(20);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->SetMarkerSize(1.2);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->GetXaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->GetXaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->GetXaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->GetXaxis()->SetTitleOffset(1.4);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->GetXaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->GetYaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->GetYaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->GetYaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->GetYaxis()->SetTitleOffset(2.2);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->GetYaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->GetZaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->GetZaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->GetZaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->GetZaxis()->SetTitleOffset(1);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->GetZaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_HT_all_BSMtttt400__284->Draw("HISTsame");
   

   
   Double_t Graph_from_val_os2l_ge6jge3b_HT_all_data_fx3132[9] = {
   300,
   500,
   700,
   900,
   1100,
   1300,
   1500,
   1700,
   1900};
   Double_t Graph_from_val_os2l_ge6jge3b_HT_all_data_fy3132[9] = {
   222,
   1088,
   967,
   472,
   236,
   89,
   49,
   19,
   21};
   Double_t Graph_from_val_os2l_ge6jge3b_HT_all_data_felx3132[9] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_val_os2l_ge6jge3b_HT_all_data_fely3132[9] = {
   14.89966,
   32.98485,
   31.09662,
   21.72556,
   15.36229,
   9.433981,
   7,
   4.358899,
   4.582576};
   Double_t Graph_from_val_os2l_ge6jge3b_HT_all_data_fehx3132[9] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_val_os2l_ge6jge3b_HT_all_data_fehy3132[9] = {
   14.89966,
   32.98485,
   31.09662,
   21.72556,
   15.36229,
   9.433981,
   7,
   4.358899,
   4.582576};
   grae = new TGraphAsymmErrors(9,Graph_from_val_os2l_ge6jge3b_HT_all_data_fx3132,Graph_from_val_os2l_ge6jge3b_HT_all_data_fy3132,Graph_from_val_os2l_ge6jge3b_HT_all_data_felx3132,Graph_from_val_os2l_ge6jge3b_HT_all_data_fehx3132,Graph_from_val_os2l_ge6jge3b_HT_all_data_fely3132,Graph_from_val_os2l_ge6jge3b_HT_all_data_fehy3132);
   grae->SetName("Graph_from_val_os2l_ge6jge3b_HT_all_data");
   grae->SetTitle("h");
   grae->SetLineWidth(2);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(1.4);
   
   TH1F *Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132 = new TH1F("Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132","h",100,20.22,2179.98);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->SetMinimum(13.17699);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->SetMaximum(1231.619);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->SetDirectory(0);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->SetStats(0);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->SetLineWidth(2);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->SetMarkerStyle(20);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->SetMarkerSize(1.2);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->GetXaxis()->SetLabelFont(43);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->GetXaxis()->SetLabelSize(21);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->GetXaxis()->SetTitleSize(21);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->GetXaxis()->SetTitleFont(43);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->GetYaxis()->SetLabelFont(43);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->GetYaxis()->SetLabelSize(21);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->GetYaxis()->SetTitleSize(21);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->GetYaxis()->SetTitleFont(43);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->GetZaxis()->SetLabelFont(43);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->GetZaxis()->SetLabelSize(21);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->GetZaxis()->SetTitleSize(21);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_from_val_os2l_ge6jge3b_HT_all_data3132);
   
   grae->Draw("PZ");
   
   TH1D *h_blind__286 = new TH1D("h_blind__286","h",9,200,2000);
   h_blind__286->SetBinError(1,85163.46);
   h_blind__286->SetBinError(2,188534.7);
   h_blind__286->SetBinError(3,177742);
   h_blind__286->SetBinError(4,124178.9);
   h_blind__286->SetBinError(5,87807.75);
   h_blind__286->SetBinError(6,53922.72);
   h_blind__286->SetBinError(7,40010.58);
   h_blind__286->SetBinError(8,24914.58);
   h_blind__286->SetBinError(9,26193.07);
   h_blind__286->SetEntries(6396);
   h_blind__286->SetDirectory(0);
   h_blind__286->SetStats(0);

   ci = TColor::GetColor("#cccccc");
   h_blind__286->SetFillColor(ci);
   h_blind__286->SetFillStyle(3345);

   ci = TColor::GetColor("#cccccc");
   h_blind__286->SetLineColor(ci);
   h_blind__286->SetLineWidth(0);
   h_blind__286->SetMarkerStyle(20);
   h_blind__286->SetMarkerSize(1.2);
   h_blind__286->GetXaxis()->SetLabelFont(43);
   h_blind__286->GetXaxis()->SetLabelSize(21);
   h_blind__286->GetXaxis()->SetTitleSize(21);
   h_blind__286->GetXaxis()->SetTitleOffset(1.4);
   h_blind__286->GetXaxis()->SetTitleFont(43);
   h_blind__286->GetYaxis()->SetLabelFont(43);
   h_blind__286->GetYaxis()->SetLabelSize(21);
   h_blind__286->GetYaxis()->SetTitleSize(21);
   h_blind__286->GetYaxis()->SetTitleOffset(2.2);
   h_blind__286->GetYaxis()->SetTitleFont(43);
   h_blind__286->GetZaxis()->SetLabelFont(43);
   h_blind__286->GetZaxis()->SetLabelSize(21);
   h_blind__286->GetZaxis()->SetTitleSize(21);
   h_blind__286->GetZaxis()->SetTitleOffset(1);
   h_blind__286->GetZaxis()->SetTitleFont(43);
   h_blind__286->Draw("same HIST");
   TLatex * tex = new TLatex(0.1812081,0.87,"ATLAS");
tex->SetNDC();
   tex->SetTextFont(73);
   tex->SetTextSize(28);
   tex->SetLineWidth(2);
   tex->Draw();
   tex = new TLatex(0.3724081,0.87,"");
tex->SetNDC();
   tex->SetTextFont(43);
   tex->SetTextSize(28);
   tex->SetLineWidth(2);
   tex->Draw();
      tex = new TLatex(0.1812081,0.81,"#sqrt{s} = 13 TeV, 139 fb^{-1}");
tex->SetNDC();
   tex->SetTextFont(43);
   tex->SetTextSize(28);
   tex->SetLineWidth(2);
   tex->Draw();
//       tex = new TLatex(0.1812081,0.7816667,"4-top 1LOS");
// tex->SetNDC();
//    tex->SetTextFont(43);
//    tex->SetTextSize(28);
//    tex->SetLineWidth(2);
//    tex->Draw();
      tex = new TLatex(0.1812081,0.76,"2LOS, #geq6j, #geq3b");
      // tex = new TLatex(0.1812081,0.7316667,"OS2L,#geq6j,#geq3b");
tex->SetNDC();
   tex->SetTextFont(43);
   tex->SetTextSize(28);
   tex->SetLineWidth(2);
   tex->Draw();
      tex = new TLatex(0.1812081,0.70,"Pre-Fit");
      // tex = new TLatex(0.1812081,0.6816667,"Pre-Fit");
tex->SetNDC();
   tex->SetTextFont(43);
   tex->SetTextSize(28);
   tex->SetLineWidth(2);
   tex->Draw();
   
   TLegend *leg = new TLegend(0.58,0.4166667,0.91,0.9166667,NULL,"brNDC");
   leg->SetBorderSize(0);
   leg->SetTextAlign(12);
   leg->SetTextFont(43);
   leg->SetTextSize(28);
   leg->SetLineColor(1);
   leg->SetLineStyle(1);
   leg->SetLineWidth(1);
   leg->SetFillColor(0);
   leg->SetFillStyle(0);
   TLegendEntry *entry=leg->AddEntry("val_os2l_ge6jge3b_HT_all_data","Data","ep");

   entry->SetFillColor(62);
   entry->SetFillStyle(1001);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(20);
   entry->SetMarkerSize(1.4);
   entry->SetTextFont(43);
   entry=leg->AddEntry("val_os2l_ge6jge3b_HT_all_TTL_stack_4","t#bar{t}+light","f");
   entry->SetFillStyle(1001);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   entry=leg->AddEntry("val_os2l_ge6jge3b_HT_all_TTC_stack_3","t#bar{t}+#geq1c","f");

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
   entry=leg->AddEntry("val_os2l_ge6jge3b_HT_all_TTB_stack_2","t#bar{t}+#geq1b","f");

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
   entry=leg->AddEntry("val_os2l_ge6jge3b_HT_all_ttW_stack_1","Others","f");

   ci = TColor::GetColor("#cccccc");
   entry->SetFillColor(ci);
   entry->SetFillStyle(1001);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   entry=leg->AddEntry("g_totErr","Uncertainty","f");

   ci = TColor::GetColor("#6666ff");
   entry->SetFillColor(ci);
   entry->SetFillStyle(3354);
   entry->SetLineStyle(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   entry=leg->AddEntry("val_os2l_ge6jge3b_HT_all_BSMtttt400__284","Bkg. before corr.","l");
   entry->SetFillColor(2);
   entry->SetFillStyle(1001);
   entry->SetLineColor(2);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   leg->Draw();
   

   
   TH1D *h_dummy_copy__287 = new TH1D("h_dummy_copy__287","h",9,200,2000);
   h_dummy_copy__287->SetMinimum(0);
   h_dummy_copy__287->SetMaximum(2020.84);
   h_dummy_copy__287->SetEntries(952014);
   h_dummy_copy__287->SetDirectory(0);
   h_dummy_copy__287->SetStats(0);
   h_dummy_copy__287->SetFillColor(2);
   h_dummy_copy__287->SetLineColor(2);
   h_dummy_copy__287->SetMarkerStyle(20);
   h_dummy_copy__287->SetMarkerSize(1.2);
   h_dummy_copy__287->GetXaxis()->SetLabelFont(43);
   h_dummy_copy__287->GetXaxis()->SetLabelSize(0);
   h_dummy_copy__287->GetXaxis()->SetTitleSize(21);
   h_dummy_copy__287->GetXaxis()->SetTitleOffset(2);
   h_dummy_copy__287->GetXaxis()->SetTitleFont(43);
   h_dummy_copy__287->GetYaxis()->SetTitle("Events");
   h_dummy_copy__287->GetYaxis()->SetLabelFont(43);
   h_dummy_copy__287->GetYaxis()->SetLabelSize(21);
   h_dummy_copy__287->GetYaxis()->SetTitleSize(21);
   h_dummy_copy__287->GetYaxis()->SetTitleOffset(2.255033);
   h_dummy_copy__287->GetYaxis()->SetTitleFont(43);
   h_dummy_copy__287->GetZaxis()->SetLabelFont(43);
   h_dummy_copy__287->GetZaxis()->SetLabelSize(21);
   h_dummy_copy__287->GetZaxis()->SetTitleSize(21);
   h_dummy_copy__287->GetZaxis()->SetTitleOffset(1);
   h_dummy_copy__287->GetZaxis()->SetTitleFont(43);
   h_dummy_copy__287->Draw("sameaxis");
   pad->Modified();
   c1_n551->cd();
   c1_n551->Modified();
   c1_n551->cd();
   c1_n551->SetSelected(c1_n551);

   c1_n551->SaveAs("val_os2l_ge6jge3b_HT_all.pdf");
}
