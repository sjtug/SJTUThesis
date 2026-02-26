void nRCJets()
{
//=========Macro generated from canvas: c1_n551/
//=========  (Mon Dec 11 21:39:00 2023) by ROOT version 6.24/06
   TCanvas *c1_n551 = new TCanvas("c1_n13", "",315,182,888,700);
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
   pad->Range(-1.191358,-0.0873016,3.746914,1.5);
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
   
   TH1D *h_dummy2__296 = new TH1D("h_dummy2__296","h",4,-0.5,3.5);
   h_dummy2__296->SetMinimum(0.2);
   h_dummy2__296->SetMaximum(1.8);
   h_dummy2__296->SetEntries(951999);
   h_dummy2__296->SetDirectory(0);
   h_dummy2__296->SetStats(0);
   h_dummy2__296->SetFillColor(2);
   h_dummy2__296->SetLineColor(2);
   h_dummy2__296->SetMarkerStyle(20);
   h_dummy2__296->SetMarkerSize(1.2);
   h_dummy2__296->GetXaxis()->SetTitle("Number of large-R jets");
   h_dummy2__296->GetXaxis()->SetBinLabel(1,"0");
   h_dummy2__296->GetXaxis()->SetBinLabel(2,"1");
   h_dummy2__296->GetXaxis()->SetBinLabel(3,"2");
   h_dummy2__296->GetXaxis()->SetBinLabel(4,"#geq3");
   h_dummy2__296->GetXaxis()->SetLabelFont(43);
   h_dummy2__296->GetXaxis()->SetLabelOffset(0.025);
   h_dummy2__296->GetXaxis()->SetLabelSize(28);
   h_dummy2__296->GetXaxis()->SetTitleSize(28);
   h_dummy2__296->GetXaxis()->SetTitleOffset(1.1);
   h_dummy2__296->GetXaxis()->SetTitleFont(43);
   h_dummy2__296->GetYaxis()->SetTitle("Data / Bkg. ");
   h_dummy2__296->GetYaxis()->SetNdivisions(504);
   h_dummy2__296->GetYaxis()->SetTickLength(0);
   h_dummy2__296->GetYaxis()->SetLabelFont(43);
   h_dummy2__296->GetYaxis()->SetLabelSize(28);
   h_dummy2__296->GetYaxis()->SetTitleSize(28);
   h_dummy2__296->GetYaxis()->SetTitleOffset(2.2);
   h_dummy2__296->GetYaxis()->SetTitleFont(43);
   h_dummy2__296->GetZaxis()->SetLabelFont(43);
   h_dummy2__296->GetZaxis()->SetLabelSize(21);
   h_dummy2__296->GetZaxis()->SetTitleSize(21);
   h_dummy2__296->GetZaxis()->SetTitleOffset(1);
   h_dummy2__296->GetZaxis()->SetTitleFont(43);
   h_dummy2__296->Draw("HIST");
   TLine *line = new TLine(-0.5,1,3.5,1);
   line->SetLineStyle(2);
   line->SetLineWidth(2);
   line->Draw();
   
   Double_t g_ratio2_fx3137[4] = {
   0,
   1,
   2,
   3};
   Double_t g_ratio2_fy3137[4] = {
   1,
   1,
   1,
   1};
   Double_t g_ratio2_felx3137[4] = {
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t g_ratio2_fely3137[4] = {
   0.3804925,
   0.3577769,
   0.3436376,
   0.3603294};
   Double_t g_ratio2_fehx3137[4] = {
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t g_ratio2_fehy3137[4] = {
   0.3804925,
   0.3577769,
   0.3436376,
   0.3603294};
   TGraphAsymmErrors *grae = new TGraphAsymmErrors(4,g_ratio2_fx3137,g_ratio2_fy3137,g_ratio2_felx3137,g_ratio2_fehx3137,g_ratio2_fely3137,g_ratio2_fehy3137);
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
   
   TH1F *Graph_g_ratio23137 = new TH1F("Graph_g_ratio23137","h",100,-0.9,3.9);
   Graph_g_ratio23137->SetMinimum(0.543409);
   Graph_g_ratio23137->SetMaximum(1.456591);
   Graph_g_ratio23137->SetDirectory(0);
   Graph_g_ratio23137->SetStats(0);
   Graph_g_ratio23137->SetLineWidth(2);
   Graph_g_ratio23137->SetMarkerStyle(20);
   Graph_g_ratio23137->SetMarkerSize(1.2);
   Graph_g_ratio23137->GetXaxis()->SetLabelFont(43);
   Graph_g_ratio23137->GetXaxis()->SetLabelSize(21);
   Graph_g_ratio23137->GetXaxis()->SetTitleSize(21);
   Graph_g_ratio23137->GetXaxis()->SetTitleOffset(1.4);
   Graph_g_ratio23137->GetXaxis()->SetTitleFont(43);
   Graph_g_ratio23137->GetYaxis()->SetLabelFont(43);
   Graph_g_ratio23137->GetYaxis()->SetLabelSize(21);
   Graph_g_ratio23137->GetYaxis()->SetTitleSize(21);
   Graph_g_ratio23137->GetYaxis()->SetTitleOffset(2.2);
   Graph_g_ratio23137->GetYaxis()->SetTitleFont(43);
   Graph_g_ratio23137->GetZaxis()->SetLabelFont(43);
   Graph_g_ratio23137->GetZaxis()->SetLabelSize(21);
   Graph_g_ratio23137->GetZaxis()->SetTitleSize(21);
   Graph_g_ratio23137->GetZaxis()->SetTitleOffset(1);
   Graph_g_ratio23137->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_g_ratio23137);
   
   grae->Draw("e2");
   
   Double_t Graph_from_h_ratio_fx3138[4] = {
   0,
   1,
   2,
   3};
   Double_t Graph_from_h_ratio_fy3138[4] = {
   1.03061,
   1.07676,
   0.863822,
   1.19656};
   Double_t Graph_from_h_ratio_felx3138[4] = {
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fely3138[4] = {
   0.02013659,
   0.04538006,
   0.1153485,
   0.6526585};
   Double_t Graph_from_h_ratio_fehx3138[4] = {
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fehy3138[4] = {
   0.02013659,
   0.04538006,
   0.1153485,
   0.6526585};
   grae = new TGraphAsymmErrors(4,Graph_from_h_ratio_fx3138,Graph_from_h_ratio_fy3138,Graph_from_h_ratio_felx3138,Graph_from_h_ratio_fehx3138,Graph_from_h_ratio_fely3138,Graph_from_h_ratio_fehy3138);
   grae->SetName("Graph_from_h_ratio");
   grae->SetTitle("h");
   grae->SetLineWidth(2);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(1.4);
   
   TH1F *Graph_Graph_from_h_ratio3138 = new TH1F("Graph_Graph_from_h_ratio3138","h",100,-0.8989,3.8999);
   Graph_Graph_from_h_ratio3138->SetMinimum(0.3472475);
   Graph_Graph_from_h_ratio3138->SetMaximum(1.913628);
   Graph_Graph_from_h_ratio3138->SetDirectory(0);
   Graph_Graph_from_h_ratio3138->SetStats(0);
   Graph_Graph_from_h_ratio3138->SetLineWidth(2);
   Graph_Graph_from_h_ratio3138->SetMarkerStyle(20);
   Graph_Graph_from_h_ratio3138->SetMarkerSize(1.2);
   Graph_Graph_from_h_ratio3138->GetXaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3138->GetXaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3138->GetXaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3138->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_h_ratio3138->GetXaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio3138->GetYaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3138->GetYaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3138->GetYaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3138->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_from_h_ratio3138->GetYaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio3138->GetZaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3138->GetZaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3138->GetZaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3138->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_from_h_ratio3138->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_from_h_ratio3138);
   
   grae->Draw("PZ");

   ///////////
   Double_t Graph_from_h_ratio_fx31382[4] = {
   0,
   1,
   2,
   3};
   Double_t Graph_from_h_ratio_fy31382[4] = {
   1.24491,
   1.19486,
   0.946538,
   1.34195};
   Double_t Graph_from_h_ratio_felx31382[4] = {
   0.499,
   0.499,
   0.499,
   0.499};
   Double_t Graph_from_h_ratio_fely31382[4] = {
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fehx31382[4] = {
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t Graph_from_h_ratio_fehy31382[4] = {
   0.,
   0.,
   0.,
   0.};
   grae = new TGraphAsymmErrors(4,Graph_from_h_ratio_fx31382,Graph_from_h_ratio_fy31382,Graph_from_h_ratio_felx31382,Graph_from_h_ratio_fehx31382,Graph_from_h_ratio_fely31382,Graph_from_h_ratio_fehy31382);
   grae->SetName("Graph_from_h_ratio");
   grae->SetTitle("h");
   grae->SetLineWidth(2);
   grae->SetLineColor(kRed);
   grae->SetLineStyle(2);
   grae->SetMarkerColor(kRed);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(0.5);
   
   TH1F *Graph_Graph_from_h_ratio31382 = new TH1F("Graph_Graph_from_h_ratio31382","h",100,-0.8989,3.8999);
   Graph_Graph_from_h_ratio31382->SetMinimum(0.3472475);
   Graph_Graph_from_h_ratio31382->SetMaximum(1.913628);
   Graph_Graph_from_h_ratio31382->SetDirectory(0);
   Graph_Graph_from_h_ratio31382->SetStats(0);
   Graph_Graph_from_h_ratio31382->SetLineWidth(2);
   Graph_Graph_from_h_ratio31382->SetMarkerStyle(20);
   Graph_Graph_from_h_ratio31382->SetMarkerSize(1.2);
   Graph_Graph_from_h_ratio31382->GetXaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio31382->GetXaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio31382->GetXaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio31382->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_h_ratio31382->GetXaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio31382->GetYaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio31382->GetYaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio31382->GetYaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio31382->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_from_h_ratio31382->GetYaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio31382->GetZaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio31382->GetZaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio31382->GetZaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio31382->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_from_h_ratio31382->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_from_h_ratio31382);
   
   grae->Draw("Z");
   ///////////   
   TH1D *h_blindratio__297 = new TH1D("h_blindratio__297","h",4,-0.5,3.5);
   h_blindratio__297->SetBinError(1,286.8867);
   h_blindratio__297->SetBinError(2,131.0878);
   h_blindratio__297->SetBinError(3,40.39802);
   h_blindratio__297->SetBinError(4,9.797959);
   h_blindratio__297->SetEntries(6386);
   h_blindratio__297->SetDirectory(0);
   h_blindratio__297->SetStats(0);

   ci = TColor::GetColor("#cccccc");
   h_blindratio__297->SetFillColor(ci);
   h_blindratio__297->SetFillStyle(3345);

   ci = TColor::GetColor("#cccccc");
   h_blindratio__297->SetLineColor(ci);
   h_blindratio__297->SetLineWidth(0);
   h_blindratio__297->SetMarkerStyle(20);
   h_blindratio__297->SetMarkerSize(1.2);
   h_blindratio__297->GetXaxis()->SetLabelFont(43);
   h_blindratio__297->GetXaxis()->SetLabelSize(21);
   h_blindratio__297->GetXaxis()->SetTitleSize(21);
   h_blindratio__297->GetXaxis()->SetTitleOffset(1.4);
   h_blindratio__297->GetXaxis()->SetTitleFont(43);
   h_blindratio__297->GetYaxis()->SetLabelFont(43);
   h_blindratio__297->GetYaxis()->SetLabelSize(21);
   h_blindratio__297->GetYaxis()->SetTitleSize(21);
   h_blindratio__297->GetYaxis()->SetTitleOffset(2.2);
   h_blindratio__297->GetYaxis()->SetTitleFont(43);
   h_blindratio__297->GetZaxis()->SetLabelFont(43);
   h_blindratio__297->GetZaxis()->SetLabelSize(21);
   h_blindratio__297->GetZaxis()->SetTitleSize(21);
   h_blindratio__297->GetZaxis()->SetTitleOffset(1);
   h_blindratio__297->GetZaxis()->SetTitleFont(43);
   h_blindratio__297->Draw("HIST same");
   
   TH1D *h_dummy2_copy__298 = new TH1D("h_dummy2_copy__298","h",4,-0.5,3.5);
   h_dummy2_copy__298->SetMinimum(0.5);
   h_dummy2_copy__298->SetMaximum(1.5);
   h_dummy2_copy__298->SetEntries(951999);
   h_dummy2_copy__298->SetDirectory(0);
   h_dummy2_copy__298->SetStats(0);
   h_dummy2_copy__298->SetFillColor(2);
   h_dummy2_copy__298->SetLineColor(2);
   h_dummy2_copy__298->SetMarkerStyle(20);
   h_dummy2_copy__298->SetMarkerSize(1.2);
   h_dummy2_copy__298->GetXaxis()->SetTitle("Number of RC jets");
   h_dummy2_copy__298->GetXaxis()->SetBinLabel(1,"0");
   h_dummy2_copy__298->GetXaxis()->SetBinLabel(2,"1");
   h_dummy2_copy__298->GetXaxis()->SetBinLabel(3,"2");
   h_dummy2_copy__298->GetXaxis()->SetBinLabel(4,"#geq3");
   h_dummy2_copy__298->GetXaxis()->SetLabelFont(43);
   h_dummy2_copy__298->GetXaxis()->SetLabelOffset(0.045);
   h_dummy2_copy__298->GetXaxis()->SetLabelSize(21);
   h_dummy2_copy__298->GetXaxis()->SetTitleSize(21);
   h_dummy2_copy__298->GetXaxis()->SetTitleOffset(5);
   h_dummy2_copy__298->GetXaxis()->SetTitleFont(43);
   h_dummy2_copy__298->GetYaxis()->SetTitle("Data / Bkg.");
   h_dummy2_copy__298->GetYaxis()->SetNdivisions(-504);
   h_dummy2_copy__298->GetYaxis()->SetLabelFont(43);
   h_dummy2_copy__298->GetYaxis()->SetLabelSize(21);
   h_dummy2_copy__298->GetYaxis()->SetTitleSize(21);
   h_dummy2_copy__298->GetYaxis()->SetTitleOffset(2.255033);
   h_dummy2_copy__298->GetYaxis()->SetTitleFont(43);
   h_dummy2_copy__298->GetZaxis()->SetLabelFont(43);
   h_dummy2_copy__298->GetZaxis()->SetLabelSize(21);
   h_dummy2_copy__298->GetZaxis()->SetTitleSize(21);
   h_dummy2_copy__298->GetZaxis()->SetTitleOffset(1);
   h_dummy2_copy__298->GetZaxis()->SetTitleFont(43);
   h_dummy2_copy__298->Draw("sameaxis");

   pad->Modified();
   c1_n551->cd();
  
// ------------>Primitives in pad: 
   TPad *pad2 = new TPad("", "",0,0.2,1,1);
   pad2->Draw();
   pad2->cd();
   pad2->Range(-1.191358,-555.3985,3.746914,4998.586);
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
   
   TH1D *h_dummy__299 = new TH1D("h_dummy__299","h",4,-0.5,3.5);
   h_dummy__299->SetMinimum(0);
   h_dummy__299->SetMaximum(4720.887);
   h_dummy__299->SetMaximum(h_dummy__299->GetMaximum()*1.1);
   h_dummy__299->SetEntries(951999);
   h_dummy__299->SetDirectory(0);
   h_dummy__299->SetStats(0);
   h_dummy__299->SetFillColor(2);
   h_dummy__299->SetLineColor(2);
   h_dummy__299->SetMarkerStyle(20);
   h_dummy__299->SetMarkerSize(1.2);
   h_dummy__299->GetXaxis()->SetBinLabel(1,"0");
   h_dummy__299->GetXaxis()->SetBinLabel(2,"1");
   h_dummy__299->GetXaxis()->SetBinLabel(3,"2");
   h_dummy__299->GetXaxis()->SetBinLabel(4,"#geq3");
   h_dummy__299->GetXaxis()->SetLabelFont(43);
   h_dummy__299->GetXaxis()->SetLabelSize(0);
   h_dummy__299->GetXaxis()->SetTitleSize(28);
   h_dummy__299->GetXaxis()->SetTitleOffset(2);
   h_dummy__299->GetXaxis()->SetTitleFont(43);
   h_dummy__299->GetYaxis()->SetTitle("Events");
   h_dummy__299->GetYaxis()->SetLabelFont(43);
   h_dummy__299->GetYaxis()->SetLabelSize(28);
   h_dummy__299->GetYaxis()->SetTitleSize(28);
   h_dummy__299->GetYaxis()->SetTitleOffset(2.2);
   h_dummy__299->GetYaxis()->SetTitleFont(43);
   h_dummy__299->GetZaxis()->SetLabelFont(43);
   h_dummy__299->GetZaxis()->SetLabelSize(21);
   h_dummy__299->GetZaxis()->SetTitleSize(21);
   h_dummy__299->GetZaxis()->SetTitleOffset(1);
   h_dummy__299->GetZaxis()->SetTitleFont(43);
   h_dummy__299->Draw("HIST");
   
   THStack * myStack= new THStack();
   myStack->SetName("");
   myStack->SetTitle("");
   
   TH1F *_stack_35 = new TH1F("_stack_35","",4,-0.5,3.5);
   _stack_35->SetMinimum(0);
   _stack_35->SetMaximum(2644.471);
   _stack_35->SetDirectory(0);
   _stack_35->SetStats(0);
   _stack_35->SetLineWidth(2);
   _stack_35->SetMarkerStyle(20);
   _stack_35->SetMarkerSize(1.2);
   _stack_35->GetXaxis()->SetLabelFont(43);
   _stack_35->GetXaxis()->SetLabelSize(21);
   _stack_35->GetXaxis()->SetTitleSize(21);
   _stack_35->GetXaxis()->SetTitleOffset(1.4);
   _stack_35->GetXaxis()->SetTitleFont(43);
   _stack_35->GetYaxis()->SetLabelFont(43);
   _stack_35->GetYaxis()->SetLabelSize(21);
   _stack_35->GetYaxis()->SetTitleSize(21);
   _stack_35->GetYaxis()->SetTitleOffset(2.2);
   _stack_35->GetYaxis()->SetTitleFont(43);
   _stack_35->GetZaxis()->SetLabelFont(43);
   _stack_35->GetZaxis()->SetLabelSize(21);
   _stack_35->GetZaxis()->SetTitleSize(21);
   _stack_35->GetZaxis()->SetTitleOffset(1);
   _stack_35->GetZaxis()->SetTitleFont(43);
   myStack->SetHistogram(_stack_35);
   
   
   TH1D *val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1 = new TH1D("val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1","h",4,-0.5,3.5);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->SetBinContent(1,187.9932+1.398932+18.36201);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->SetBinContent(2,53.76825+1.013845+13.47071);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->SetBinContent(3,7.235918+0.2476441+3.507523);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->SetBinContent(4,0.2883793+0.02164207+0.2030179);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->SetBinError(1,2.854672);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->SetBinError(2,1.446553);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->SetBinError(3,0.5065665);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->SetBinError(4,0.1227672);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->SetEntries(278065);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->SetDirectory(0);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->SetStats(0);

   ci = TColor::GetColor("#cccccc");
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->SetFillColor(ci);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->SetMarkerStyle(20);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->SetMarkerSize(1.2);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->GetXaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->GetXaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->GetXaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->GetXaxis()->SetTitleOffset(1.4);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->GetXaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->GetYaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->GetYaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->GetYaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->GetYaxis()->SetTitleOffset(2.2);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->GetYaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->GetZaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->GetZaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->GetZaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->GetZaxis()->SetTitleOffset(1);
   val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1,"");
   
   TH1D *val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2 = new TH1D("val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2","h",4,-0.5,3.5);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->SetBinContent(1,1585.157);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->SetBinContent(2,304.8042);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->SetBinContent(3,34.37546);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->SetBinContent(4,1.462303);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->SetBinError(1,4.055465);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->SetBinError(2,1.679815);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->SetBinError(3,0.5557345);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->SetBinError(4,0.108339);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->SetEntries(267827);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->SetDirectory(0);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->SetStats(0);

   ci = TColor::GetColor("#6666cc");
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->SetFillColor(ci);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->SetMarkerStyle(20);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->SetMarkerSize(1.2);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->GetXaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->GetXaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->GetXaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->GetXaxis()->SetTitleOffset(1.4);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->GetXaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->GetYaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->GetYaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->GetYaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->GetYaxis()->SetTitleOffset(2.2);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->GetYaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->GetZaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->GetZaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->GetZaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->GetZaxis()->SetTitleOffset(1);
   val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2,"");
   
   TH1D *val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3 = new TH1D("val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3","h",4,-0.5,3.5);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->SetBinContent(1,621.3399);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->SetBinContent(2,112.1339);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->SetBinContent(3,12.62904);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->SetBinContent(4,0.5045112);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->SetBinError(1,4.176671);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->SetBinError(2,1.696906);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->SetBinError(3,0.6620393);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->SetBinError(4,0.1082324);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->SetEntries(72057);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->SetDirectory(0);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->SetStats(0);

   ci = TColor::GetColor("#ccccff");
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->SetFillColor(ci);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->SetMarkerStyle(20);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->SetMarkerSize(1.2);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->GetXaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->GetXaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->GetXaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->GetXaxis()->SetTitleOffset(1.4);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->GetXaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->GetYaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->GetYaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->GetYaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->GetYaxis()->SetTitleOffset(2.2);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->GetYaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->GetZaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->GetZaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->GetZaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->GetZaxis()->SetTitleOffset(1);
   val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3,"");
   
   TH1D *val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4 = new TH1D("val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4","h",4,-0.5,3.5);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->SetBinContent(1,81.35604);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->SetBinContent(2,13.52702);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->SetBinContent(3,1.04433);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->SetBinContent(4,0.02734279);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->SetBinError(1,2.448076);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->SetBinError(2,1.180583);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->SetBinError(3,0.1127598);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->SetBinError(4,0.01402979);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->SetEntries(4887);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->SetDirectory(0);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->SetStats(0);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->SetMarkerStyle(20);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->SetMarkerSize(1.2);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->GetXaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->GetXaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->GetXaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->GetXaxis()->SetTitleOffset(1.4);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->GetXaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->GetYaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->GetYaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->GetYaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->GetYaxis()->SetTitleOffset(2.2);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->GetYaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->GetZaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->GetZaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->GetZaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->GetZaxis()->SetTitleOffset(1);
   val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4,"");
   
   myStack->Draw("hist same");
   
   Double_t g_totErr_fx3139[4] = {
   0,
   1,
   2,
   3};
   Double_t g_totErr_fy3139[4] = {
   2495.61,
   498.718,
   59.0399,
   2.5072};
   Double_t g_totErr_felx3139[4] = {
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t g_totErr_fely3139[4] = {
   958.2869,
   182.6982,
   21.2752,
   0.9562563};
   Double_t g_totErr_fehx3139[4] = {
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t g_totErr_fehy3139[4] = {
   958.2869,
   182.6982,
   21.2752,
   0.9562563};
   grae = new TGraphAsymmErrors(4,g_totErr_fx3139,g_totErr_fy3139,g_totErr_felx3139,g_totErr_fehx3139,g_totErr_fely3139,g_totErr_fehy3139);
   grae->SetName("g_totErr");
   grae->SetTitle("h");

   ci = TColor::GetColor("#6666ff");
   grae->SetFillColor(ci);
   grae->SetFillStyle(3354);
   grae->SetLineColor(0);
   grae->SetLineWidth(0);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(0);
   
   TH1F *Graph_g_totErr3139 = new TH1F("Graph_g_totErr3139","h",100,-0.9,3.9);
   Graph_g_totErr3139->SetMinimum(1.527825);
   Graph_g_totErr3139->SetMaximum(3824.344);
   Graph_g_totErr3139->SetDirectory(0);
   Graph_g_totErr3139->SetStats(0);
   Graph_g_totErr3139->SetLineWidth(2);
   Graph_g_totErr3139->SetMarkerStyle(20);
   Graph_g_totErr3139->SetMarkerSize(1.2);
   Graph_g_totErr3139->GetXaxis()->SetLabelFont(43);
   Graph_g_totErr3139->GetXaxis()->SetLabelSize(21);
   Graph_g_totErr3139->GetXaxis()->SetTitleSize(21);
   Graph_g_totErr3139->GetXaxis()->SetTitleOffset(1.4);
   Graph_g_totErr3139->GetXaxis()->SetTitleFont(43);
   Graph_g_totErr3139->GetYaxis()->SetLabelFont(43);
   Graph_g_totErr3139->GetYaxis()->SetLabelSize(21);
   Graph_g_totErr3139->GetYaxis()->SetTitleSize(21);
   Graph_g_totErr3139->GetYaxis()->SetTitleOffset(2.2);
   Graph_g_totErr3139->GetYaxis()->SetTitleFont(43);
   Graph_g_totErr3139->GetZaxis()->SetLabelFont(43);
   Graph_g_totErr3139->GetZaxis()->SetLabelSize(21);
   Graph_g_totErr3139->GetZaxis()->SetTitleSize(21);
   Graph_g_totErr3139->GetZaxis()->SetTitleOffset(1);
   Graph_g_totErr3139->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_g_totErr3139);
   
   grae->Draw("e2");
   
   TH1D *val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300 = new TH1D("val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300","h",4,-0.5,3.5);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->SetBinContent(1,2066.01);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->SetBinContent(2,449.425);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->SetBinContent(3,53.8806);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->SetBinContent(4,2.23556);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->SetEntries(11959);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->SetDirectory(0);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->SetStats(0);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->SetFillStyle(0);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->SetLineColor(2);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->SetLineStyle(2);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->SetLineWidth(2);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->SetMarkerStyle(20);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->SetMarkerSize(1.2);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->GetXaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->GetXaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->GetXaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->GetXaxis()->SetTitleOffset(1.4);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->GetXaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->GetYaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->GetYaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->GetYaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->GetYaxis()->SetTitleOffset(2.2);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->GetYaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->GetZaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->GetZaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->GetZaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->GetZaxis()->SetTitleOffset(1);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->GetZaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300->Draw("HISTsame");
   
  
   
   Double_t Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data_fx3140[4] = {
   0,
   1,
   2,
   3};
   Double_t Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data_fy3140[4] = {
   2572,
   537,
   51,
   3};
   Double_t Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data_felx3140[4] = {
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data_fely3140[4] = {
   50.71489,
   23.17326,
   7.141428,
   1.732051};
   Double_t Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data_fehx3140[4] = {
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data_fehy3140[4] = {
   50.71489,
   23.17326,
   7.141428,
   1.732051};
   grae = new TGraphAsymmErrors(4,Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data_fx3140,Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data_fy3140,Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data_felx3140,Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data_fehx3140,Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data_fely3140,Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data_fehy3140);
   grae->SetName("Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data");
   grae->SetTitle("h");
   grae->SetLineWidth(2);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(1.4);
   
   TH1F *Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140 = new TH1F("Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140","h",100,-0.8989,3.8999);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->SetMinimum(1.141154);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->SetMaximum(2884.86);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->SetDirectory(0);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->SetStats(0);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->SetLineWidth(2);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->SetMarkerStyle(20);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->SetMarkerSize(1.2);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->GetXaxis()->SetLabelFont(43);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->GetXaxis()->SetLabelSize(21);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->GetXaxis()->SetTitleSize(21);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->GetXaxis()->SetTitleFont(43);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->GetYaxis()->SetLabelFont(43);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->GetYaxis()->SetLabelSize(21);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->GetYaxis()->SetTitleSize(21);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->GetYaxis()->SetTitleFont(43);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->GetZaxis()->SetLabelFont(43);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->GetZaxis()->SetLabelSize(21);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->GetZaxis()->SetTitleSize(21);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_from_val_os2l_ge6jge3b_nRCJetsM100_data3140);
   
   grae->Draw("PZ");
   
   TH1D *h_blind__302 = new TH1D("h_blind__302","h",4,-0.5,3.5);
   h_blind__302->SetBinError(1,677179.9);
   h_blind__302->SetBinError(2,309425.2);
   h_blind__302->SetBinError(3,95357.24);
   h_blind__302->SetBinError(4,23127.53);
   h_blind__302->SetEntries(6386);
   h_blind__302->SetDirectory(0);
   h_blind__302->SetStats(0);

   ci = TColor::GetColor("#cccccc");
   h_blind__302->SetFillColor(ci);
   h_blind__302->SetFillStyle(3345);

   ci = TColor::GetColor("#cccccc");
   h_blind__302->SetLineColor(ci);
   h_blind__302->SetLineWidth(0);
   h_blind__302->SetMarkerStyle(20);
   h_blind__302->SetMarkerSize(1.2);
   h_blind__302->GetXaxis()->SetLabelFont(43);
   h_blind__302->GetXaxis()->SetLabelSize(21);
   h_blind__302->GetXaxis()->SetTitleSize(21);
   h_blind__302->GetXaxis()->SetTitleOffset(1.4);
   h_blind__302->GetXaxis()->SetTitleFont(43);
   h_blind__302->GetYaxis()->SetLabelFont(43);
   h_blind__302->GetYaxis()->SetLabelSize(21);
   h_blind__302->GetYaxis()->SetTitleSize(21);
   h_blind__302->GetYaxis()->SetTitleOffset(2.2);
   h_blind__302->GetYaxis()->SetTitleFont(43);
   h_blind__302->GetZaxis()->SetLabelFont(43);
   h_blind__302->GetZaxis()->SetLabelSize(21);
   h_blind__302->GetZaxis()->SetTitleSize(21);
   h_blind__302->GetZaxis()->SetTitleOffset(1);
   h_blind__302->GetZaxis()->SetTitleFont(43);
   h_blind__302->Draw("same HIST");
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
   TLegendEntry *entry=leg->AddEntry("val_os2l_ge6jge3b_nRCJetsM100_data","Data","ep");


   entry->SetFillColor(62);
   entry->SetFillStyle(1001);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(20);
   entry->SetMarkerSize(1.4);
   entry->SetTextFont(43);
   entry=leg->AddEntry("val_os2l_ge6jge3b_nRCJetsM100_TTL_stack_4","t#bar{t}+light","f");
   entry->SetFillStyle(1001);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   entry=leg->AddEntry("val_os2l_ge6jge3b_nRCJetsM100_TTC_stack_3","t#bar{t}+#geq1c","f");

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
   entry=leg->AddEntry("val_os2l_ge6jge3b_nRCJetsM100_TTB_stack_2","t#bar{t}+#geq1b","f");

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
   entry=leg->AddEntry("val_os2l_ge6jge3b_nRCJetsM100_ttW_stack_1","Others","f");

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
entry=leg->AddEntry("val_os2l_ge6jge3b_nRCJetsM100_BSMtttt400__300","Bkg. before corr.","l");
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
   
   
   TH1D *h_dummy_copy__303 = new TH1D("h_dummy_copy__303","h",4,-0.5,3.5);
   h_dummy_copy__303->SetMinimum(0);
   h_dummy_copy__303->SetMaximum(4720.887);
   h_dummy_copy__303->SetEntries(951999);
   h_dummy_copy__303->SetDirectory(0);
   h_dummy_copy__303->SetStats(0);
   h_dummy_copy__303->SetFillColor(2);
   h_dummy_copy__303->SetLineColor(2);
   h_dummy_copy__303->SetMarkerStyle(20);
   h_dummy_copy__303->SetMarkerSize(1.2);
   h_dummy_copy__303->GetXaxis()->SetBinLabel(1,"0");
   h_dummy_copy__303->GetXaxis()->SetBinLabel(2,"1");
   h_dummy_copy__303->GetXaxis()->SetBinLabel(3,"2");
   h_dummy_copy__303->GetXaxis()->SetBinLabel(4,"#geq3");
   h_dummy_copy__303->GetXaxis()->SetLabelFont(43);
   h_dummy_copy__303->GetXaxis()->SetLabelSize(0);
   h_dummy_copy__303->GetXaxis()->SetTitleSize(21);
   h_dummy_copy__303->GetXaxis()->SetTitleOffset(2);
   h_dummy_copy__303->GetXaxis()->SetTitleFont(43);
   h_dummy_copy__303->GetYaxis()->SetTitle("Events");
   h_dummy_copy__303->GetYaxis()->SetLabelFont(43);
   h_dummy_copy__303->GetYaxis()->SetLabelSize(21);
   h_dummy_copy__303->GetYaxis()->SetTitleSize(21);
   h_dummy_copy__303->GetYaxis()->SetTitleOffset(2.255033);
   h_dummy_copy__303->GetYaxis()->SetTitleFont(43);
   h_dummy_copy__303->GetZaxis()->SetLabelFont(43);
   h_dummy_copy__303->GetZaxis()->SetLabelSize(21);
   h_dummy_copy__303->GetZaxis()->SetTitleSize(21);
   h_dummy_copy__303->GetZaxis()->SetTitleOffset(1);
   h_dummy_copy__303->GetZaxis()->SetTitleFont(43);
   h_dummy_copy__303->Draw("sameaxis");
   pad->Modified();
   c1_n551->cd();
   c1_n551->Modified();
   c1_n551->cd();
   c1_n551->SetSelected(c1_n551);

   c1_n551->SaveAs("val_os2l_ge6jge3b_nRCJetsM100.pdf");
}
