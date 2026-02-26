void nJets()
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
   pad->Range(4.462963,-0.0873016,11.87037,1.5);
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
   
   TH1D *h_dummy2__288 = new TH1D("h_dummy2__288","h",6,5.5,11.5);
   h_dummy2__288->SetMinimum(0.2);
   h_dummy2__288->SetMaximum(1.8);
   h_dummy2__288->SetEntries(952015);
   h_dummy2__288->SetDirectory(0);
   h_dummy2__288->SetStats(0);
   h_dummy2__288->SetFillColor(2);
   h_dummy2__288->SetLineColor(2);
   h_dummy2__288->SetMarkerStyle(20);
   h_dummy2__288->SetMarkerSize(1.2);
   h_dummy2__288->GetXaxis()->SetTitle("Number of jets");
   h_dummy2__288->GetXaxis()->SetBinLabel(1,"6");
   h_dummy2__288->GetXaxis()->SetBinLabel(2,"7");
   h_dummy2__288->GetXaxis()->SetBinLabel(3,"8");
   h_dummy2__288->GetXaxis()->SetBinLabel(4,"9");
   h_dummy2__288->GetXaxis()->SetBinLabel(5,"10");
   h_dummy2__288->GetXaxis()->SetBinLabel(6,"#geq11");
   h_dummy2__288->GetXaxis()->SetLabelFont(43);
   h_dummy2__288->GetXaxis()->SetLabelOffset(0.025);
   h_dummy2__288->GetXaxis()->SetLabelSize(28);
   h_dummy2__288->GetXaxis()->SetTitleSize(28);
   h_dummy2__288->GetXaxis()->SetTitleOffset(1.1);
   h_dummy2__288->GetXaxis()->SetTitleFont(43);
   h_dummy2__288->GetYaxis()->SetTitle("Data / Bkg. ");
   h_dummy2__288->GetYaxis()->SetNdivisions(504);
   h_dummy2__288->GetYaxis()->SetTickLength(0);
   h_dummy2__288->GetYaxis()->SetLabelFont(43);
   h_dummy2__288->GetYaxis()->SetLabelSize(28);
   h_dummy2__288->GetYaxis()->SetTitleSize(28);
   h_dummy2__288->GetYaxis()->SetTitleOffset(2.2);
   h_dummy2__288->GetYaxis()->SetTitleFont(43);
   h_dummy2__288->GetZaxis()->SetLabelFont(43);
   h_dummy2__288->GetZaxis()->SetLabelSize(21);
   h_dummy2__288->GetZaxis()->SetTitleSize(21);
   h_dummy2__288->GetZaxis()->SetTitleOffset(1);
   h_dummy2__288->GetZaxis()->SetTitleFont(43);
   h_dummy2__288->Draw("HIST");
   TLine *line = new TLine(5.5,1,11.5,1);
   line->SetLineStyle(2);
   line->SetLineWidth(2);
   line->Draw();
   
   Double_t g_ratio2_fx3133[6] = {
   6,
   7,
   8,
   9,
   10,
   11};
   Double_t g_ratio2_fy3133[6] = {
   1,
   1,
   1,
   1,
   1,
   1};
   Double_t g_ratio2_felx3133[6] = {
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t g_ratio2_fely3133[6] = {
   0.3745404,
   0.3810214,
   0.3860256,
   0.4063268,
   0.4251365,
   0.4759914};
   Double_t g_ratio2_fehx3133[6] = {
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t g_ratio2_fehy3133[6] = {
   0.3745404,
   0.3810214,
   0.3860256,
   0.4063268,
   0.4251365,
   0.4759914};
   TGraphAsymmErrors *grae = new TGraphAsymmErrors(6,g_ratio2_fx3133,g_ratio2_fy3133,g_ratio2_felx3133,g_ratio2_fehx3133,g_ratio2_fely3133,g_ratio2_fehy3133);
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
   
   TH1F *Graph_g_ratio23133 = new TH1F("Graph_g_ratio23133","h",100,4.9,12.1);
   Graph_g_ratio23133->SetMinimum(0.4288103);
   Graph_g_ratio23133->SetMaximum(1.57119);
   Graph_g_ratio23133->SetDirectory(0);
   Graph_g_ratio23133->SetStats(0);
   Graph_g_ratio23133->SetLineWidth(2);
   Graph_g_ratio23133->SetMarkerStyle(20);
   Graph_g_ratio23133->SetMarkerSize(1.2);
   Graph_g_ratio23133->GetXaxis()->SetLabelFont(43);
   Graph_g_ratio23133->GetXaxis()->SetLabelSize(21);
   Graph_g_ratio23133->GetXaxis()->SetTitleSize(21);
   Graph_g_ratio23133->GetXaxis()->SetTitleOffset(1.4);
   Graph_g_ratio23133->GetXaxis()->SetTitleFont(43);
   Graph_g_ratio23133->GetYaxis()->SetLabelFont(43);
   Graph_g_ratio23133->GetYaxis()->SetLabelSize(21);
   Graph_g_ratio23133->GetYaxis()->SetTitleSize(21);
   Graph_g_ratio23133->GetYaxis()->SetTitleOffset(2.2);
   Graph_g_ratio23133->GetYaxis()->SetTitleFont(43);
   Graph_g_ratio23133->GetZaxis()->SetLabelFont(43);
   Graph_g_ratio23133->GetZaxis()->SetLabelSize(21);
   Graph_g_ratio23133->GetZaxis()->SetTitleSize(21);
   Graph_g_ratio23133->GetZaxis()->SetTitleOffset(1);
   Graph_g_ratio23133->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_g_ratio23133);
   
   grae->Draw("e2");
   
   Double_t Graph_from_h_ratio_fx3134[6] = {
   6,
   7,
   8,
   9,
   10,
   11};
   Double_t Graph_from_h_ratio_fy3134[6] = {
   1.00347,
   1.09029,
   1.08868,
   0.987497,
   0.933382,
   2.27635};
   Double_t Graph_from_h_ratio_felx3134[6] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fely3134[6] = {
   0.02289912,
   0.03779904,
   0.06004393,
   0.09552945,
   0.1650052,
   0.446539};
   Double_t Graph_from_h_ratio_fehx3134[6] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fehy3134[6] = {
   0.02289912,
   0.03779904,
   0.06004393,
   0.09552945,
   0.1650052,
   0.446539};
   grae = new TGraphAsymmErrors(6,Graph_from_h_ratio_fx3134,Graph_from_h_ratio_fy3134,Graph_from_h_ratio_felx3134,Graph_from_h_ratio_fehx3134,Graph_from_h_ratio_fely3134,Graph_from_h_ratio_fehy3134);
   grae->SetName("Graph_from_h_ratio");
   grae->SetTitle("h");
   grae->SetLineWidth(2);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(1.4);
   
   TH1F *Graph_Graph_from_h_ratio3134 = new TH1F("Graph_Graph_from_h_ratio3134","h",100,4.9011,12.0999);
   Graph_Graph_from_h_ratio3134->SetMinimum(0.5296485);
   Graph_Graph_from_h_ratio3134->SetMaximum(2.67131);
   Graph_Graph_from_h_ratio3134->SetDirectory(0);
   Graph_Graph_from_h_ratio3134->SetStats(0);
   Graph_Graph_from_h_ratio3134->SetLineWidth(2);
   Graph_Graph_from_h_ratio3134->SetMarkerStyle(20);
   Graph_Graph_from_h_ratio3134->SetMarkerSize(1.2);
   Graph_Graph_from_h_ratio3134->GetXaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3134->GetXaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3134->GetXaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3134->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_h_ratio3134->GetXaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio3134->GetYaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3134->GetYaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3134->GetYaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3134->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_from_h_ratio3134->GetYaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio3134->GetZaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3134->GetZaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3134->GetZaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3134->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_from_h_ratio3134->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_from_h_ratio3134);
   
   grae->Draw("PZ");

   ////
   Double_t Graph_from_h_ratio_fx31342[6] = {
   6,
   7,
   8,
   9,
   10,
   11};
   Double_t Graph_from_h_ratio_fy31342[6] = {
   1.19124,
   1.25632,
   1.34447,
   1.31982,
   1.24858,
   2.75369};
   Double_t Graph_from_h_ratio_felx31342[6] = {
   0.499,
   0.499,
   0.499,
   0.499,
   0.499,
   0.499};
   Double_t Graph_from_h_ratio_fely31342[6] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fehx31342[6] = {
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t Graph_from_h_ratio_fehy31342[6] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   grae = new TGraphAsymmErrors(6,Graph_from_h_ratio_fx31342,Graph_from_h_ratio_fy31342,Graph_from_h_ratio_felx31342,Graph_from_h_ratio_fehx31342,Graph_from_h_ratio_fely31342,Graph_from_h_ratio_fehy31342);
   grae->SetName("Graph_from_h_ratio");
   grae->SetTitle("h");
   grae->SetLineWidth(2);
   grae->SetLineColor(kRed);
   grae->SetLineStyle(2);
   grae->SetMarkerColor(kRed);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(0.5);
   
   TH1F *Graph_Graph_from_h_ratio31342 = new TH1F("Graph_Graph_from_h_ratio31342","h",100,4.9011,12.0999);
   Graph_Graph_from_h_ratio31342->SetMinimum(0.5296485);
   Graph_Graph_from_h_ratio31342->SetMaximum(2.67131);
   Graph_Graph_from_h_ratio31342->SetDirectory(0);
   Graph_Graph_from_h_ratio31342->SetStats(0);
   Graph_Graph_from_h_ratio31342->SetLineWidth(2);
   Graph_Graph_from_h_ratio31342->SetMarkerStyle(20);
   Graph_Graph_from_h_ratio31342->SetMarkerSize(1.2);
   Graph_Graph_from_h_ratio31342->GetXaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio31342->GetXaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio31342->GetXaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio31342->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_h_ratio31342->GetXaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio31342->GetYaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio31342->GetYaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio31342->GetYaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio31342->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_from_h_ratio31342->GetYaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio31342->GetZaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio31342->GetZaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio31342->GetZaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio31342->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_from_h_ratio31342->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_from_h_ratio31342);
   
   grae->Draw("Z");   
   ////
   
   TH1D *h_blindratio__289 = new TH1D("h_blindratio__289","h",6,5.5,11.5);
   h_blindratio__289->SetBinError(1,246.6414);
   h_blindratio__289->SetBinError(2,160.6985);
   h_blindratio__289->SetBinError(3,99.43842);
   h_blindratio__289->SetBinError(4,55.71355);
   h_blindratio__289->SetBinError(5,29.93326);
   h_blindratio__289->SetBinError(6,25.92296);
   h_blindratio__289->SetEntries(6390);
   h_blindratio__289->SetDirectory(0);
   h_blindratio__289->SetStats(0);

   ci = TColor::GetColor("#cccccc");
   h_blindratio__289->SetFillColor(ci);
   h_blindratio__289->SetFillStyle(3345);

   ci = TColor::GetColor("#cccccc");
   h_blindratio__289->SetLineColor(ci);
   h_blindratio__289->SetLineWidth(0);
   h_blindratio__289->SetMarkerStyle(20);
   h_blindratio__289->SetMarkerSize(1.2);
   h_blindratio__289->GetXaxis()->SetLabelFont(43);
   h_blindratio__289->GetXaxis()->SetLabelSize(21);
   h_blindratio__289->GetXaxis()->SetTitleSize(21);
   h_blindratio__289->GetXaxis()->SetTitleOffset(1.4);
   h_blindratio__289->GetXaxis()->SetTitleFont(43);
   h_blindratio__289->GetYaxis()->SetLabelFont(43);
   h_blindratio__289->GetYaxis()->SetLabelSize(21);
   h_blindratio__289->GetYaxis()->SetTitleSize(21);
   h_blindratio__289->GetYaxis()->SetTitleOffset(2.2);
   h_blindratio__289->GetYaxis()->SetTitleFont(43);
   h_blindratio__289->GetZaxis()->SetLabelFont(43);
   h_blindratio__289->GetZaxis()->SetLabelSize(21);
   h_blindratio__289->GetZaxis()->SetTitleSize(21);
   h_blindratio__289->GetZaxis()->SetTitleOffset(1);
   h_blindratio__289->GetZaxis()->SetTitleFont(43);
   h_blindratio__289->Draw("HIST same");
   
   TH1D *h_dummy2_copy__290 = new TH1D("h_dummy2_copy__290","h",6,5.5,11.5);
   h_dummy2_copy__290->SetMinimum(0.5);
   h_dummy2_copy__290->SetMaximum(1.5);
   h_dummy2_copy__290->SetEntries(952015);
   h_dummy2_copy__290->SetDirectory(0);
   h_dummy2_copy__290->SetStats(0);
   h_dummy2_copy__290->SetFillColor(2);
   h_dummy2_copy__290->SetLineColor(2);
   h_dummy2_copy__290->SetMarkerStyle(20);
   h_dummy2_copy__290->SetMarkerSize(1.2);
   h_dummy2_copy__290->GetXaxis()->SetTitle("Number of jets");
   h_dummy2_copy__290->GetXaxis()->SetBinLabel(1,"6");
   h_dummy2_copy__290->GetXaxis()->SetBinLabel(2,"7");
   h_dummy2_copy__290->GetXaxis()->SetBinLabel(3,"8");
   h_dummy2_copy__290->GetXaxis()->SetBinLabel(4,"9");
   h_dummy2_copy__290->GetXaxis()->SetBinLabel(5,"10");
   h_dummy2_copy__290->GetXaxis()->SetBinLabel(6,"#geq11");
   h_dummy2_copy__290->GetXaxis()->SetLabelFont(43);
   h_dummy2_copy__290->GetXaxis()->SetLabelOffset(0.045);
   h_dummy2_copy__290->GetXaxis()->SetLabelSize(21);
   h_dummy2_copy__290->GetXaxis()->SetTitleSize(21);
   h_dummy2_copy__290->GetXaxis()->SetTitleOffset(5);
   h_dummy2_copy__290->GetXaxis()->SetTitleFont(43);
   h_dummy2_copy__290->GetYaxis()->SetTitle("Data / Bkg.");
   h_dummy2_copy__290->GetYaxis()->SetNdivisions(-504);
   h_dummy2_copy__290->GetYaxis()->SetLabelFont(43);
   h_dummy2_copy__290->GetYaxis()->SetLabelSize(21);
   h_dummy2_copy__290->GetYaxis()->SetTitleSize(21);
   h_dummy2_copy__290->GetYaxis()->SetTitleOffset(2.255033);
   h_dummy2_copy__290->GetYaxis()->SetTitleFont(43);
   h_dummy2_copy__290->GetZaxis()->SetLabelFont(43);
   h_dummy2_copy__290->GetZaxis()->SetLabelSize(21);
   h_dummy2_copy__290->GetZaxis()->SetTitleSize(21);
   h_dummy2_copy__290->GetZaxis()->SetTitleOffset(1);
   h_dummy2_copy__290->GetZaxis()->SetTitleFont(43);
   h_dummy2_copy__290->Draw("sameaxis");
   TArrow *arrow = new TArrow(11,1.45,11,1.8,0.03,"|>");
   arrow->SetFillColor(10);
   arrow->SetFillStyle(1001);

   ci = TColor::GetColor("#6666ff");
   arrow->SetLineColor(ci);
   arrow->SetLineWidth(2);
   arrow->SetAngle(40);
   arrow->Draw();

   pad->Modified();
   c1_n551->cd();
  
// ------------>Primitives in pad: 
   TPad *pad2 = new TPad("", "",0,0.2,1,1);
   pad2->Draw();
   pad2->cd();
   pad2->Range(4.462963,-411.7978,11.87037,3706.18);
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
   
   TH1D *h_dummy__291 = new TH1D("h_dummy__291","h",6,5.5,11.5);
   h_dummy__291->SetMinimum(0);
   h_dummy__291->SetMaximum(3500.281);
   h_dummy__291->SetMaximum(h_dummy__291->GetMaximum()*1.1);
   h_dummy__291->SetEntries(952015);
   h_dummy__291->SetDirectory(0);
   h_dummy__291->SetStats(0);
   h_dummy__291->SetFillColor(2);
   h_dummy__291->SetLineColor(2);
   h_dummy__291->SetMarkerStyle(20);
   h_dummy__291->SetMarkerSize(1.2);
   h_dummy__291->GetXaxis()->SetBinLabel(1,"6");
   h_dummy__291->GetXaxis()->SetBinLabel(2,"7");
   h_dummy__291->GetXaxis()->SetBinLabel(3,"8");
   h_dummy__291->GetXaxis()->SetBinLabel(4,"9");
   h_dummy__291->GetXaxis()->SetBinLabel(5,"10");
   h_dummy__291->GetXaxis()->SetBinLabel(6,"#geq11");
   h_dummy__291->GetXaxis()->SetLabelFont(43);
   h_dummy__291->GetXaxis()->SetLabelSize(0);
   h_dummy__291->GetXaxis()->SetTitleSize(28);
   h_dummy__291->GetXaxis()->SetTitleOffset(2);
   h_dummy__291->GetXaxis()->SetTitleFont(43);
   h_dummy__291->GetYaxis()->SetTitle("Events");
   h_dummy__291->GetYaxis()->SetLabelFont(43);
   h_dummy__291->GetYaxis()->SetLabelSize(28);
   h_dummy__291->GetYaxis()->SetTitleSize(28);
   h_dummy__291->GetYaxis()->SetTitleOffset(2.2);
   h_dummy__291->GetYaxis()->SetTitleFont(43);
   h_dummy__291->GetZaxis()->SetLabelFont(43);
   h_dummy__291->GetZaxis()->SetLabelSize(21);
   h_dummy__291->GetZaxis()->SetTitleSize(21);
   h_dummy__291->GetZaxis()->SetTitleOffset(1);
   h_dummy__291->GetZaxis()->SetTitleFont(43);
   h_dummy__291->Draw("HIST");
   
   THStack * myStack= new THStack();
   myStack->SetName("");
   myStack->SetTitle("");
   
   TH1F *_stack_34 = new TH1F("_stack_34","",6,5.5,11.5);
   _stack_34->SetMinimum(0);
   _stack_34->SetMaximum(1999.224);
   _stack_34->SetDirectory(0);
   _stack_34->SetStats(0);
   _stack_34->SetLineWidth(2);
   _stack_34->SetMarkerStyle(20);
   _stack_34->SetMarkerSize(1.2);
   _stack_34->GetXaxis()->SetLabelFont(43);
   _stack_34->GetXaxis()->SetLabelSize(21);
   _stack_34->GetXaxis()->SetTitleSize(21);
   _stack_34->GetXaxis()->SetTitleOffset(1.4);
   _stack_34->GetXaxis()->SetTitleFont(43);
   _stack_34->GetYaxis()->SetLabelFont(43);
   _stack_34->GetYaxis()->SetLabelSize(21);
   _stack_34->GetYaxis()->SetTitleSize(21);
   _stack_34->GetYaxis()->SetTitleOffset(2.2);
   _stack_34->GetYaxis()->SetTitleFont(43);
   _stack_34->GetZaxis()->SetLabelFont(43);
   _stack_34->GetZaxis()->SetLabelSize(21);
   _stack_34->GetZaxis()->SetTitleSize(21);
   _stack_34->GetZaxis()->SetTitleOffset(1);
   _stack_34->GetZaxis()->SetTitleFont(43);
   myStack->SetHistogram(_stack_34);
   
   
   TH1D *val_os2l_ge6jge3b_nJets_ttW_stack_1 = new TH1D("val_os2l_ge6jge3b_nJets_ttW_stack_1","h",6,5.5,11.5);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->SetBinContent(1,152.0092+0.7057602+7.203335);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->SetBinContent(2,62.74088+0.8071121+9.968591);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->SetBinContent(3,24.25828+0.6011552+8.947388);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->SetBinContent(4,7.499825+0.3413614+5.592652);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->SetBinContent(5,2.045475+0.1489723+2.673818);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->SetBinContent(6,0.732084+0.07770231+1.157483);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->SetBinError(1,2.59568);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->SetBinError(2,1.540981);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->SetBinError(3,1.014732);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->SetBinError(4,0.5269471);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->SetBinError(5,0.2553002);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->SetBinError(6,0.131543);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->SetEntries(278079);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->SetDirectory(0);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->SetStats(0);

   ci = TColor::GetColor("#cccccc");
   val_os2l_ge6jge3b_nJets_ttW_stack_1->SetFillColor(ci);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->SetMarkerStyle(20);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->SetMarkerSize(1.2);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->GetXaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->GetXaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->GetXaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->GetXaxis()->SetTitleOffset(1.4);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->GetXaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->GetYaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->GetYaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->GetYaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->GetYaxis()->SetTitleOffset(2.2);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->GetYaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->GetZaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->GetZaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->GetZaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->GetZaxis()->SetTitleOffset(1);
   val_os2l_ge6jge3b_nJets_ttW_stack_1->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_os2l_ge6jge3b_nJets_ttW_stack_1,"");
   
   TH1D *val_os2l_ge6jge3b_nJets_TTB_stack_2 = new TH1D("val_os2l_ge6jge3b_nJets_TTB_stack_2","h",6,5.5,11.5);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->SetBinContent(1,1196.712);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->SetBinContent(2,469.3353);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->SetBinContent(3,176.0248);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->SetBinContent(4,60.43546);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->SetBinContent(5,17.505);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->SetBinContent(6,5.7872);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->SetBinError(1,3.484493);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->SetBinError(2,2.158302);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->SetBinError(3,1.35906);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->SetBinError(4,0.8314974);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->SetBinError(5,0.4426814);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->SetBinError(6,0.2340873);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->SetEntries(267827);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->SetDirectory(0);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->SetStats(0);

   ci = TColor::GetColor("#6666cc");
   val_os2l_ge6jge3b_nJets_TTB_stack_2->SetFillColor(ci);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->SetMarkerStyle(20);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->SetMarkerSize(1.2);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->GetXaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->GetXaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->GetXaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->GetXaxis()->SetTitleOffset(1.4);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->GetXaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->GetYaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->GetYaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->GetYaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->GetYaxis()->SetTitleOffset(2.2);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->GetYaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->GetZaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->GetZaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->GetZaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->GetZaxis()->SetTitleOffset(1);
   val_os2l_ge6jge3b_nJets_TTB_stack_2->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_os2l_ge6jge3b_nJets_TTB_stack_2,"");
   
   TH1D *val_os2l_ge6jge3b_nJets_TTC_stack_3 = new TH1D("val_os2l_ge6jge3b_nJets_TTC_stack_3","h",6,5.5,11.5);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->SetBinContent(1,472.1542);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->SetBinContent(2,177.8692);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->SetBinContent(3,66.02665);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->SetBinContent(4,22.46732);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->SetBinContent(5,6.735137);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->SetBinContent(6,1.354867);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->SetBinError(1,3.542688);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->SetBinError(2,2.168893);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->SetBinError(3,1.518396);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->SetBinError(4,0.964393);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->SetBinError(5,0.5121308);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->SetBinError(6,0.1465787);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->SetEntries(72057);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->SetDirectory(0);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->SetStats(0);

   ci = TColor::GetColor("#ccccff");
   val_os2l_ge6jge3b_nJets_TTC_stack_3->SetFillColor(ci);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->SetMarkerStyle(20);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->SetMarkerSize(1.2);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->GetXaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->GetXaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->GetXaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->GetXaxis()->SetTitleOffset(1.4);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->GetXaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->GetYaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->GetYaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->GetYaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->GetYaxis()->SetTitleOffset(2.2);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->GetYaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->GetZaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->GetZaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->GetZaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->GetZaxis()->SetTitleOffset(1);
   val_os2l_ge6jge3b_nJets_TTC_stack_3->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_os2l_ge6jge3b_nJets_TTC_stack_3,"");
   
   TH1D *val_os2l_ge6jge3b_nJets_TTL_stack_4 = new TH1D("val_os2l_ge6jge3b_nJets_TTL_stack_4","h",6,5.5,11.5);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->SetBinContent(1,65.63345);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->SetBinContent(2,19.45115);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->SetBinContent(3,7.972591);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->SetBinContent(4,1.891552);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->SetBinContent(5,0.8900409);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->SetBinContent(6,0.1159449);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->SetBinError(1,2.210002);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->SetBinError(2,1.161975);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->SetBinError(3,0.9196433);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->SetBinError(4,0.4008654);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->SetBinError(5,0.3960664);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->SetBinError(6,0.04651177);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->SetEntries(4887);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->SetDirectory(0);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->SetStats(0);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->SetMarkerStyle(20);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->SetMarkerSize(1.2);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->GetXaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->GetXaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->GetXaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->GetXaxis()->SetTitleOffset(1.4);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->GetXaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->GetYaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->GetYaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->GetYaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->GetYaxis()->SetTitleOffset(2.2);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->GetYaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->GetZaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->GetZaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->GetZaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->GetZaxis()->SetTitleOffset(1);
   val_os2l_ge6jge3b_nJets_TTL_stack_4->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_os2l_ge6jge3b_nJets_TTL_stack_4,"");
   
   
   myStack->Draw("hist same");
   
   Double_t g_totErr_fx3135[6] = {
   6,
   7,
   8,
   9,
   10,
   11};
   Double_t g_totErr_fy3135[6] = {
   1894.42,
   740.172,
   283.831,
   98.2282,
   29.9984,
   9.22528};
   Double_t g_totErr_felx3135[6] = {
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t g_totErr_fely3135[6] = {
   713.1336,
   286.3554,
   113.0124,
   41.89132,
   13.63357,
   4.884828};
   Double_t g_totErr_fehx3135[6] = {
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t g_totErr_fehy3135[6] = {
   713.1336,
   286.3554,
   113.0124,
   41.89132,
   13.63357,
   4.884828};
   grae = new TGraphAsymmErrors(6,g_totErr_fx3135,g_totErr_fy3135,g_totErr_felx3135,g_totErr_fehx3135,g_totErr_fely3135,g_totErr_fehy3135);
   grae->SetName("g_totErr");
   grae->SetTitle("h");

   ci = TColor::GetColor("#6666ff");
   grae->SetFillColor(ci);
   grae->SetFillStyle(3354);
   grae->SetLineColor(0);
   grae->SetLineWidth(0);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(0);
   
   TH1F *Graph_g_totErr3135 = new TH1F("Graph_g_totErr3135","h",100,4.9,12.1);
   Graph_g_totErr3135->SetMinimum(4.839842);
   Graph_g_totErr3135->SetMaximum(2878.335);
   Graph_g_totErr3135->SetDirectory(0);
   Graph_g_totErr3135->SetStats(0);
   Graph_g_totErr3135->SetLineWidth(2);
   Graph_g_totErr3135->SetMarkerStyle(20);
   Graph_g_totErr3135->SetMarkerSize(1.2);
   Graph_g_totErr3135->GetXaxis()->SetLabelFont(43);
   Graph_g_totErr3135->GetXaxis()->SetLabelSize(21);
   Graph_g_totErr3135->GetXaxis()->SetTitleSize(21);
   Graph_g_totErr3135->GetXaxis()->SetTitleOffset(1.4);
   Graph_g_totErr3135->GetXaxis()->SetTitleFont(43);
   Graph_g_totErr3135->GetYaxis()->SetLabelFont(43);
   Graph_g_totErr3135->GetYaxis()->SetLabelSize(21);
   Graph_g_totErr3135->GetYaxis()->SetTitleSize(21);
   Graph_g_totErr3135->GetYaxis()->SetTitleOffset(2.2);
   Graph_g_totErr3135->GetYaxis()->SetTitleFont(43);
   Graph_g_totErr3135->GetZaxis()->SetLabelFont(43);
   Graph_g_totErr3135->GetZaxis()->SetLabelSize(21);
   Graph_g_totErr3135->GetZaxis()->SetTitleSize(21);
   Graph_g_totErr3135->GetZaxis()->SetTitleOffset(1);
   Graph_g_totErr3135->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_g_totErr3135);
   
   grae->Draw("e2");
   
   TH1D *val_os2l_ge6jge3b_nJets_BSMtttt400__292 = new TH1D("val_os2l_ge6jge3b_nJets_BSMtttt400__292","h",6,5.5,11.5);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->SetBinContent(1,1595.82);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->SetBinContent(2,642.354);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->SetBinContent(3,229.83);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->SetBinContent(4,73.4949);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->SetBinContent(5,22.4255);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->SetBinContent(6,7.62614);

   val_os2l_ge6jge3b_nJets_BSMtttt400__292->SetEntries(11959);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->SetDirectory(0);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->SetStats(0);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->SetFillStyle(0);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->SetLineColor(2);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->SetLineStyle(2);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->SetLineWidth(2);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->SetMarkerStyle(20);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->SetMarkerSize(1.2);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->GetXaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->GetXaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->GetXaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->GetXaxis()->SetTitleOffset(1.4);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->GetXaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->GetYaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->GetYaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->GetYaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->GetYaxis()->SetTitleOffset(2.2);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->GetYaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->GetZaxis()->SetLabelFont(43);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->GetZaxis()->SetLabelSize(21);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->GetZaxis()->SetTitleSize(21);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->GetZaxis()->SetTitleOffset(1);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->GetZaxis()->SetTitleFont(43);
   val_os2l_ge6jge3b_nJets_BSMtttt400__292->Draw("HISTsame");
   
   
   Double_t Graph_from_val_os2l_ge6jge3b_nJets_data_fx3136[6] = {
   6,
   7,
   8,
   9,
   10,
   11};
   Double_t Graph_from_val_os2l_ge6jge3b_nJets_data_fy3136[6] = {
   1901,
   807,
   309,
   97,
   28,
   21};
   Double_t Graph_from_val_os2l_ge6jge3b_nJets_data_felx3136[6] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_val_os2l_ge6jge3b_nJets_data_fely3136[6] = {
   43.60046,
   28.40775,
   17.5784,
   9.848858,
   5.291503,
   4.582576};
   Double_t Graph_from_val_os2l_ge6jge3b_nJets_data_fehx3136[6] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_val_os2l_ge6jge3b_nJets_data_fehy3136[6] = {
   43.60046,
   28.40775,
   17.5784,
   9.848858,
   5.291503,
   4.582576};
   grae = new TGraphAsymmErrors(6,Graph_from_val_os2l_ge6jge3b_nJets_data_fx3136,Graph_from_val_os2l_ge6jge3b_nJets_data_fy3136,Graph_from_val_os2l_ge6jge3b_nJets_data_felx3136,Graph_from_val_os2l_ge6jge3b_nJets_data_fehx3136,Graph_from_val_os2l_ge6jge3b_nJets_data_fely3136,Graph_from_val_os2l_ge6jge3b_nJets_data_fehy3136);
   grae->SetName("Graph_from_val_os2l_ge6jge3b_nJets_data");
   grae->SetTitle("h");
   grae->SetLineWidth(2);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(1.4);
   
   TH1F *Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136 = new TH1F("Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136","h",100,4.9011,12.0999);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->SetMinimum(14.77568);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->SetMaximum(2137.419);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->SetDirectory(0);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->SetStats(0);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->SetLineWidth(2);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->SetMarkerStyle(20);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->SetMarkerSize(1.2);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->GetXaxis()->SetLabelFont(43);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->GetXaxis()->SetLabelSize(21);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->GetXaxis()->SetTitleSize(21);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->GetXaxis()->SetTitleFont(43);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->GetYaxis()->SetLabelFont(43);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->GetYaxis()->SetLabelSize(21);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->GetYaxis()->SetTitleSize(21);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->GetYaxis()->SetTitleFont(43);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->GetZaxis()->SetLabelFont(43);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->GetZaxis()->SetLabelSize(21);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->GetZaxis()->SetTitleSize(21);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_from_val_os2l_ge6jge3b_nJets_data3136);
   
   grae->Draw("PZ");
   
   TH1D *h_blind__294 = new TH1D("h_blind__294","h",6,5.5,11.5);
   h_blind__294->SetBinError(1,431657.2);
   h_blind__294->SetBinError(2,281244.9);
   h_blind__294->SetBinError(3,174031.2);
   h_blind__294->SetBinError(4,97506.54);
   h_blind__294->SetBinError(5,52387.41);
   h_blind__294->SetBinError(6,45368.82);
   h_blind__294->SetEntries(6390);
   h_blind__294->SetDirectory(0);
   h_blind__294->SetStats(0);

   ci = TColor::GetColor("#cccccc");
   h_blind__294->SetFillColor(ci);
   h_blind__294->SetFillStyle(3345);

   ci = TColor::GetColor("#cccccc");
   h_blind__294->SetLineColor(ci);
   h_blind__294->SetLineWidth(0);
   h_blind__294->SetMarkerStyle(20);
   h_blind__294->SetMarkerSize(1.2);
   h_blind__294->GetXaxis()->SetLabelFont(43);
   h_blind__294->GetXaxis()->SetLabelSize(21);
   h_blind__294->GetXaxis()->SetTitleSize(21);
   h_blind__294->GetXaxis()->SetTitleOffset(1.4);
   h_blind__294->GetXaxis()->SetTitleFont(43);
   h_blind__294->GetYaxis()->SetLabelFont(43);
   h_blind__294->GetYaxis()->SetLabelSize(21);
   h_blind__294->GetYaxis()->SetTitleSize(21);
   h_blind__294->GetYaxis()->SetTitleOffset(2.2);
   h_blind__294->GetYaxis()->SetTitleFont(43);
   h_blind__294->GetZaxis()->SetLabelFont(43);
   h_blind__294->GetZaxis()->SetLabelSize(21);
   h_blind__294->GetZaxis()->SetTitleSize(21);
   h_blind__294->GetZaxis()->SetTitleOffset(1);
   h_blind__294->GetZaxis()->SetTitleFont(43);
   h_blind__294->Draw("same HIST");
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
   TLegendEntry *entry=leg->AddEntry("val_os2l_ge6jge3b_nJets_data","Data","ep");

   entry->SetFillColor(62);
   entry->SetFillStyle(1001);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(20);
   entry->SetMarkerSize(1.4);
   entry->SetTextFont(43);
   entry=leg->AddEntry("val_os2l_ge6jge3b_nJets_TTL_stack_4","t#bar{t}+light","f");
   entry->SetFillStyle(1001);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   entry=leg->AddEntry("val_os2l_ge6jge3b_nJets_TTC_stack_3","t#bar{t}+#geq1c","f");

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
   entry=leg->AddEntry("val_os2l_ge6jge3b_nJets_TTB_stack_2","t#bar{t}+#geq1b","f");

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
   entry=leg->AddEntry("val_os2l_ge6jge3b_nJets_ttW_stack_1","Others","f");

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
   entry=leg->AddEntry("val_os2l_ge6jge3b_nJets_BSMtttt400__292","Bkg. before corr.","l");
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
   

   
   TH1D *h_dummy_copy__295 = new TH1D("h_dummy_copy__295","h",6,5.5,11.5);
   h_dummy_copy__295->SetMinimum(0);
   h_dummy_copy__295->SetMaximum(3500.281);
   h_dummy_copy__295->SetEntries(952015);
   h_dummy_copy__295->SetDirectory(0);
   h_dummy_copy__295->SetStats(0);
   h_dummy_copy__295->SetFillColor(2);
   h_dummy_copy__295->SetLineColor(2);
   h_dummy_copy__295->SetMarkerStyle(20);
   h_dummy_copy__295->SetMarkerSize(1.2);
   h_dummy_copy__295->GetXaxis()->SetBinLabel(1,"6");
   h_dummy_copy__295->GetXaxis()->SetBinLabel(2,"7");
   h_dummy_copy__295->GetXaxis()->SetBinLabel(3,"8");
   h_dummy_copy__295->GetXaxis()->SetBinLabel(4,"9");
   h_dummy_copy__295->GetXaxis()->SetBinLabel(5,"10");
   h_dummy_copy__295->GetXaxis()->SetBinLabel(6,"#geq11");
   h_dummy_copy__295->GetXaxis()->SetLabelFont(43);
   h_dummy_copy__295->GetXaxis()->SetLabelSize(0);
   h_dummy_copy__295->GetXaxis()->SetTitleSize(21);
   h_dummy_copy__295->GetXaxis()->SetTitleOffset(2);
   h_dummy_copy__295->GetXaxis()->SetTitleFont(43);
   h_dummy_copy__295->GetYaxis()->SetTitle("Events");
   h_dummy_copy__295->GetYaxis()->SetLabelFont(43);
   h_dummy_copy__295->GetYaxis()->SetLabelSize(21);
   h_dummy_copy__295->GetYaxis()->SetTitleSize(21);
   h_dummy_copy__295->GetYaxis()->SetTitleOffset(2.255033);
   h_dummy_copy__295->GetYaxis()->SetTitleFont(43);
   h_dummy_copy__295->GetZaxis()->SetLabelFont(43);
   h_dummy_copy__295->GetZaxis()->SetLabelSize(21);
   h_dummy_copy__295->GetZaxis()->SetTitleSize(21);
   h_dummy_copy__295->GetZaxis()->SetTitleOffset(1);
   h_dummy_copy__295->GetZaxis()->SetTitleFont(43);
   h_dummy_copy__295->Draw("sameaxis");
   pad->Modified();
   c1_n551->cd();
   c1_n551->Modified();
   c1_n551->cd();
   c1_n551->SetSelected(c1_n551);

   c1_n551->SaveAs("val_os2l_ge6jge3b_nJets.pdf");
}
