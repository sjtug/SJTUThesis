void nJets()
{
//=========Macro generated from canvas: c1_n13/
//=========  (Fri Dec  8 08:47:14 2023) by ROOT version 6.24/06
   TCanvas *c1_n13 = new TCanvas("c1_n13", "",315,182,888,700);
   gStyle->SetOptStat(0);
   gStyle->SetOptTitle(0);
   c1_n13->SetHighLightColor(2);
   c1_n13->Range(0,0,1,1);
   c1_n13->SetFillColor(0);
   c1_n13->SetBorderMode(0);
   c1_n13->SetBorderSize(2);
   c1_n13->SetTickx(1);
   c1_n13->SetTicky(1);
   c1_n13->SetLeftMargin(0.16);
   c1_n13->SetRightMargin(0.05);
   c1_n13->SetTopMargin(0.05);
   c1_n13->SetBottomMargin(0.16);
   c1_n13->SetFrameBorderMode(0);
  
// ------------>Primitives in pad: 
   TPad *pad = new TPad("", "",0,0,1,0.28);
   pad->Draw();
   pad->cd();
   pad->Range(6.462963,-0.0873016,13.87037,1.5);
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
   
   TH1D *h_dummy2__11 = new TH1D("h_dummy2__11","h",6,7.5,13.5);
   h_dummy2__11->SetMinimum(0.2);
   h_dummy2__11->SetMaximum(1.8);
   h_dummy2__11->SetEntries(3310478);
   h_dummy2__11->SetDirectory(0);
   h_dummy2__11->SetStats(0);
   h_dummy2__11->SetFillColor(2);
   h_dummy2__11->SetLineColor(2);
   h_dummy2__11->SetMarkerStyle(20);
   h_dummy2__11->SetMarkerSize(1.2);
   h_dummy2__11->GetXaxis()->SetTitle("Number of jets");
   h_dummy2__11->GetXaxis()->SetBinLabel(1,"8");
   h_dummy2__11->GetXaxis()->SetBinLabel(2,"9");
   h_dummy2__11->GetXaxis()->SetBinLabel(3,"10");
   h_dummy2__11->GetXaxis()->SetBinLabel(4,"11");
   h_dummy2__11->GetXaxis()->SetBinLabel(5,"12");
   h_dummy2__11->GetXaxis()->SetBinLabel(6,"#geq13");
   h_dummy2__11->GetXaxis()->SetLabelFont(43);
   h_dummy2__11->GetXaxis()->SetLabelOffset(0.025);
   h_dummy2__11->GetXaxis()->SetLabelSize(28);
   h_dummy2__11->GetXaxis()->SetTitleSize(28);
   h_dummy2__11->GetXaxis()->SetTitleOffset(1.1);
   h_dummy2__11->GetXaxis()->SetTitleFont(43);
   h_dummy2__11->GetYaxis()->SetTitle("Data / Bkg. ");
   // h_dummy2__11->GetYaxis()->SetNdivisions(-504);
   h_dummy2__11->GetYaxis()->SetTickLength(0);   
   h_dummy2__11->GetYaxis()->SetLabelFont(43);
   h_dummy2__11->GetYaxis()->SetLabelSize(28);
   h_dummy2__11->GetYaxis()->SetTitleSize(28);
   h_dummy2__11->GetYaxis()->SetTitleOffset(2.2);
   h_dummy2__11->GetYaxis()->SetTitleFont(43);
   h_dummy2__11->GetYaxis()->SetNdivisions(504);
   h_dummy2__11->GetZaxis()->SetLabelFont(43);
   h_dummy2__11->GetZaxis()->SetLabelSize(21);
   h_dummy2__11->GetZaxis()->SetTitleSize(21);
   h_dummy2__11->GetZaxis()->SetTitleOffset(1);
   h_dummy2__11->GetZaxis()->SetTitleFont(43);
   h_dummy2__11->Draw("HIST");
   TLine *line = new TLine(7.5,1,13.5,1);
   line->SetLineStyle(2);
   line->SetLineWidth(2);
   line->Draw();

   Double_t g_ratio2_fx3005[6] = {
   8,
   9,
   10,
   11,
   12,
   13};
   Double_t g_ratio2_fy3005[6] = {
   1,
   1,
   1,
   1,
   1,
   1};
   Double_t g_ratio2_felx3005[6] = {
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t g_ratio2_fely3005[6] = {
   0.3474199,
   0.3707636,
   0.3942635,
   0.4270444,
   0.4714598,
   0.5388545};
   Double_t g_ratio2_fehx3005[6] = {
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t g_ratio2_fehy3005[6] = {
   0.3474199,
   0.3707636,
   0.3942635,
   0.4270444,
   0.4714598,
   0.5388545};
   TGraphAsymmErrors *grae = new TGraphAsymmErrors(6,g_ratio2_fx3005,g_ratio2_fy3005,g_ratio2_felx3005,g_ratio2_fehx3005,g_ratio2_fely3005,g_ratio2_fehy3005);
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
   
   TH1F *Graph_g_ratio23005 = new TH1F("Graph_g_ratio23005","h",100,6.9,14.1);
   Graph_g_ratio23005->SetMinimum(0.3533746);
   Graph_g_ratio23005->SetMaximum(1.646625);
   Graph_g_ratio23005->SetDirectory(0);
   Graph_g_ratio23005->SetStats(0);
   Graph_g_ratio23005->SetLineWidth(2);
   Graph_g_ratio23005->SetMarkerStyle(20);
   Graph_g_ratio23005->SetMarkerSize(1.2);
   Graph_g_ratio23005->GetXaxis()->SetLabelFont(43);
   Graph_g_ratio23005->GetXaxis()->SetLabelSize(21);
   Graph_g_ratio23005->GetXaxis()->SetTitleSize(21);
   Graph_g_ratio23005->GetXaxis()->SetTitleOffset(1.4);
   Graph_g_ratio23005->GetXaxis()->SetTitleFont(43);
   Graph_g_ratio23005->GetYaxis()->SetLabelFont(43);
   Graph_g_ratio23005->GetYaxis()->SetLabelSize(21);
   Graph_g_ratio23005->GetYaxis()->SetTitleSize(21);
   Graph_g_ratio23005->GetYaxis()->SetTitleOffset(2.2);
   Graph_g_ratio23005->GetYaxis()->SetTitleFont(43);
   Graph_g_ratio23005->GetZaxis()->SetLabelFont(43);
   Graph_g_ratio23005->GetZaxis()->SetLabelSize(21);
   Graph_g_ratio23005->GetZaxis()->SetTitleSize(21);
   Graph_g_ratio23005->GetZaxis()->SetTitleOffset(1);
   Graph_g_ratio23005->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_g_ratio23005);
   
   grae->Draw("e2");
   
   Double_t Graph_from_h_ratio_fx3006[6] = {
   8,
   9,
   10,
   11,
   12,
   13};
   Double_t Graph_from_h_ratio_fy3006[6] = {
   1.03683,
   1.045,
   1.02168,
   1.13495,
   1.13841,
   1.2887};
   Double_t Graph_from_h_ratio_felx3006[6] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fely3006[6] = {
   0.009538264,
   0.01596709,
   0.02680875,
   0.05045543,
   0.09386656,
   0.1674489};
   Double_t Graph_from_h_ratio_fehx3006[6] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fehy3006[6] = {
   0.009538264,
   0.01596709,
   0.02680875,
   0.05045543,
   0.09386656,
   0.1674489};
   grae = new TGraphAsymmErrors(6,Graph_from_h_ratio_fx3006,Graph_from_h_ratio_fy3006,Graph_from_h_ratio_felx3006,Graph_from_h_ratio_fehx3006,Graph_from_h_ratio_fely3006,Graph_from_h_ratio_fehy3006);
   grae->SetName("Graph_from_h_ratio");
   grae->SetTitle("h");
   grae->SetLineWidth(2);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(1.4);
   
   TH1F *Graph_Graph_from_h_ratio3006 = new TH1F("Graph_Graph_from_h_ratio3006","h",100,6.9011,14.0999);
   Graph_Graph_from_h_ratio3006->SetMinimum(0.9352987);
   Graph_Graph_from_h_ratio3006->SetMaximum(1.44);
   Graph_Graph_from_h_ratio3006->SetDirectory(0);
   Graph_Graph_from_h_ratio3006->SetStats(0);
   Graph_Graph_from_h_ratio3006->SetLineWidth(2);
   Graph_Graph_from_h_ratio3006->SetMarkerStyle(20);
   Graph_Graph_from_h_ratio3006->SetMarkerSize(1.2);
   Graph_Graph_from_h_ratio3006->GetXaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3006->GetXaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3006->GetXaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3006->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_h_ratio3006->GetXaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio3006->GetYaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3006->GetYaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3006->GetYaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3006->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_from_h_ratio3006->GetYaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio3006->GetZaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3006->GetZaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3006->GetZaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3006->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_from_h_ratio3006->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_from_h_ratio3006);
   
   grae->Draw("PZ");
 
   //////
   Double_t Graph_from_h_ratio_fx30062[6] = {
   8,
   9,
   10,
   11,
   12,
   13};
   Double_t Graph_from_h_ratio_fy30062[6] = {
   1.19356,
   1.21166,
   1.2384,
   1.47703,
   1.52715,
   1.79107};
   Double_t Graph_from_h_ratio_felx30062[6] = {
   0.499,
   0.499,
   0.499,
   0.499,
   0.499,
   0.499};
   Double_t Graph_from_h_ratio_fely30062[6] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fehx30062[6] = {
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t Graph_from_h_ratio_fehy30062[6] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   grae = new TGraphAsymmErrors(6,Graph_from_h_ratio_fx30062,Graph_from_h_ratio_fy30062,Graph_from_h_ratio_felx30062,Graph_from_h_ratio_fehx30062,Graph_from_h_ratio_fely30062,Graph_from_h_ratio_fehy30062);
   grae->SetName("Graph_from_h_ratio");
   grae->SetTitle("h");
   grae->SetLineColor(kRed);
   grae->SetMarkerColor(kRed);
   grae->SetLineStyle(2);
   grae->SetLineWidth(2);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(0.5);
   
   TH1F *Graph_Graph_from_h_ratio30062 = new TH1F("Graph_Graph_from_h_ratio30062","h",100,6.9011,14.0999);
   Graph_Graph_from_h_ratio30062->SetMinimum(0.9352987);
   Graph_Graph_from_h_ratio30062->SetMaximum(1.44);
   Graph_Graph_from_h_ratio30062->SetDirectory(0);
   Graph_Graph_from_h_ratio30062->SetStats(0);
   Graph_Graph_from_h_ratio30062->SetLineWidth(2);
   Graph_Graph_from_h_ratio30062->SetMarkerStyle(20);
   Graph_Graph_from_h_ratio30062->SetMarkerSize(1.2);
   Graph_Graph_from_h_ratio30062->GetXaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio30062->GetXaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio30062->GetXaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio30062->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_h_ratio30062->GetXaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio30062->GetYaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio30062->GetYaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio30062->GetYaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio30062->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_from_h_ratio30062->GetYaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio30062->GetZaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio30062->GetZaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio30062->GetZaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio30062->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_from_h_ratio30062->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_from_h_ratio30062);
   
   grae->Draw("Z");
   ///////     
   TH1D *h_blindratio__12 = new TH1D("h_blindratio__12","h",6,7.5,13.5);
   h_blindratio__12->SetBinError(1,612.4835);
   h_blindratio__12->SetBinError(2,366.6933);
   h_blindratio__12->SetBinError(3,211.8868);
   h_blindratio__12->SetBinError(4,123.9355);
   h_blindratio__12->SetBinError(5,66.21178);
   h_blindratio__12->SetBinError(6,41.56922);
   h_blindratio__12->SetEntries(36062);
   h_blindratio__12->SetDirectory(0);
   h_blindratio__12->SetStats(0);

   ci = TColor::GetColor("#cccccc");
   h_blindratio__12->SetFillColor(ci);
   h_blindratio__12->SetFillStyle(3345);

   ci = TColor::GetColor("#cccccc");
   h_blindratio__12->SetLineColor(ci);
   h_blindratio__12->SetLineWidth(0);
   h_blindratio__12->SetMarkerStyle(20);
   h_blindratio__12->SetMarkerSize(1.2);
   h_blindratio__12->GetXaxis()->SetLabelFont(43);
   h_blindratio__12->GetXaxis()->SetLabelSize(21);
   h_blindratio__12->GetXaxis()->SetTitleSize(21);
   h_blindratio__12->GetXaxis()->SetTitleOffset(1.4);
   h_blindratio__12->GetXaxis()->SetTitleFont(43);
   h_blindratio__12->GetYaxis()->SetLabelFont(43);
   h_blindratio__12->GetYaxis()->SetLabelSize(21);
   h_blindratio__12->GetYaxis()->SetTitleSize(21);
   h_blindratio__12->GetYaxis()->SetTitleOffset(2.2);
   h_blindratio__12->GetYaxis()->SetTitleFont(43);
   h_blindratio__12->GetZaxis()->SetLabelFont(43);
   h_blindratio__12->GetZaxis()->SetLabelSize(21);
   h_blindratio__12->GetZaxis()->SetTitleSize(21);
   h_blindratio__12->GetZaxis()->SetTitleOffset(1);
   h_blindratio__12->GetZaxis()->SetTitleFont(43);
   h_blindratio__12->Draw("HIST same");
   
   TH1D *h_dummy2_copy__13 = new TH1D("h_dummy2_copy__13","h",6,7.5,13.5);
   h_dummy2_copy__13->SetMinimum(0.5);
   h_dummy2_copy__13->SetMaximum(1.5);
   h_dummy2_copy__13->SetEntries(3310478);
   h_dummy2_copy__13->SetDirectory(0);
   h_dummy2_copy__13->SetStats(0);
   h_dummy2_copy__13->SetFillColor(2);
   h_dummy2_copy__13->SetLineColor(2);
   h_dummy2_copy__13->SetMarkerStyle(20);
   h_dummy2_copy__13->SetMarkerSize(1.2);
   h_dummy2_copy__13->GetXaxis()->SetTitle("Number of jets");
   h_dummy2_copy__13->GetXaxis()->SetBinLabel(1,"8");
   h_dummy2_copy__13->GetXaxis()->SetBinLabel(2,"9");
   h_dummy2_copy__13->GetXaxis()->SetBinLabel(3,"10");
   h_dummy2_copy__13->GetXaxis()->SetBinLabel(4,"11");
   h_dummy2_copy__13->GetXaxis()->SetBinLabel(5,"12");
   h_dummy2_copy__13->GetXaxis()->SetBinLabel(6,"#geq13");
   h_dummy2_copy__13->GetXaxis()->SetLabelFont(43);
   h_dummy2_copy__13->GetXaxis()->SetLabelOffset(0.045);
   h_dummy2_copy__13->GetXaxis()->SetLabelSize(21);
   h_dummy2_copy__13->GetXaxis()->SetTitleSize(21);
   h_dummy2_copy__13->GetXaxis()->SetTitleOffset(5);
   h_dummy2_copy__13->GetXaxis()->SetTitleFont(43);
   h_dummy2_copy__13->GetYaxis()->SetTitle("Data / Bkg.");
   h_dummy2_copy__13->GetYaxis()->SetNdivisions(-504);
   h_dummy2_copy__13->GetYaxis()->SetLabelFont(43);
   h_dummy2_copy__13->GetYaxis()->SetLabelSize(21);
   h_dummy2_copy__13->GetYaxis()->SetTitleSize(21);
   h_dummy2_copy__13->GetYaxis()->SetTitleOffset(2.255033);
   h_dummy2_copy__13->GetYaxis()->SetTitleFont(43);
   h_dummy2_copy__13->GetZaxis()->SetLabelFont(43);
   h_dummy2_copy__13->GetZaxis()->SetLabelSize(21);
   h_dummy2_copy__13->GetZaxis()->SetTitleSize(21);
   h_dummy2_copy__13->GetZaxis()->SetTitleOffset(1);
   h_dummy2_copy__13->GetZaxis()->SetTitleFont(43);
   h_dummy2_copy__13->Draw("sameaxis");
   
   pad->Modified();
   c1_n13->cd();
  
// ------------>Primitives in pad: 
   TPad *pad2 = new TPad("", "",0,0.2,1,1);
   pad2->Draw();
   pad2->cd();
   pad2->Range(6.462963,-2505.446,13.87037,22549.01);
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

   TH1D *h_dummy__14 = new TH1D("h_dummy__14","h",6,7.5,13.5);
   h_dummy__14->SetMinimum(0);
   h_dummy__14->SetMaximum(21296.29);
   h_dummy__14->SetMaximum(h_dummy__14->GetMaximum()*1.1);
   h_dummy__14->SetEntries(3310478);
   h_dummy__14->SetDirectory(0);
   h_dummy__14->SetStats(0);
   h_dummy__14->SetFillColor(2);
   h_dummy__14->SetLineColor(2);
   h_dummy__14->SetMarkerStyle(20);
   h_dummy__14->SetMarkerSize(1.2);
   h_dummy__14->GetXaxis()->SetBinLabel(1,"8");
   h_dummy__14->GetXaxis()->SetBinLabel(2,"9");
   h_dummy__14->GetXaxis()->SetBinLabel(3,"10");
   h_dummy__14->GetXaxis()->SetBinLabel(4,"11");
   h_dummy__14->GetXaxis()->SetBinLabel(5,"12");
   h_dummy__14->GetXaxis()->SetBinLabel(6,"#geq13");
   h_dummy__14->GetXaxis()->SetLabelFont(43);
   h_dummy__14->GetXaxis()->SetLabelSize(0);
   h_dummy__14->GetXaxis()->SetTitleSize(28);
   h_dummy__14->GetXaxis()->SetTitleOffset(2);
   h_dummy__14->GetXaxis()->SetTitleFont(43);
   h_dummy__14->GetYaxis()->SetTitle("Events");
   h_dummy__14->GetYaxis()->SetLabelFont(43);
   h_dummy__14->GetYaxis()->SetLabelSize(28);
   h_dummy__14->GetYaxis()->SetTitleSize(28);
   h_dummy__14->GetYaxis()->SetTitleOffset(2.2);
   h_dummy__14->GetYaxis()->SetTitleFont(43);
   h_dummy__14->GetYaxis()->SetNdivisions(505);
   h_dummy__14->GetZaxis()->SetLabelFont(43);
   h_dummy__14->GetZaxis()->SetLabelSize(21);
   h_dummy__14->GetZaxis()->SetTitleSize(21);
   h_dummy__14->GetZaxis()->SetTitleOffset(1);
   h_dummy__14->GetZaxis()->SetTitleFont(43);
   h_dummy__14->Draw("HIST");
   
   THStack * myStack= new THStack();
   myStack->SetName("");
   myStack->SetTitle("");
   
   TH1F *_stack_2 = new TH1F("_stack_2","",6,7.5,13.5);
   _stack_2->SetMinimum(0);
   _stack_2->SetMaximum(11918.99);
   _stack_2->SetDirectory(0);
   _stack_2->SetStats(0);
   _stack_2->SetLineWidth(2);
   _stack_2->SetMarkerStyle(20);
   _stack_2->SetMarkerSize(1.2);
   _stack_2->GetXaxis()->SetLabelFont(43);
   _stack_2->GetXaxis()->SetLabelSize(21);
   _stack_2->GetXaxis()->SetTitleSize(21);
   _stack_2->GetXaxis()->SetTitleOffset(1.4);
   _stack_2->GetXaxis()->SetTitleFont(43);
   _stack_2->GetYaxis()->SetLabelFont(43);
   _stack_2->GetYaxis()->SetLabelSize(21);
   _stack_2->GetYaxis()->SetTitleSize(21);
   _stack_2->GetYaxis()->SetTitleOffset(2.2);
   _stack_2->GetYaxis()->SetTitleFont(43);
   _stack_2->GetZaxis()->SetLabelFont(43);
   _stack_2->GetZaxis()->SetLabelSize(21);
   _stack_2->GetZaxis()->SetTitleSize(21);
   _stack_2->GetZaxis()->SetTitleOffset(1);
   _stack_2->GetZaxis()->SetTitleFont(43);
   myStack->SetHistogram(_stack_2);

   
   TH1D *val_ljets_ge8jge3b_nJets_ttW_stack_1 = new TH1D("val_ljets_ge8jge3b_nJets_ttW_stack_1","h",6,7.5,13.5);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->SetBinContent(1,860.6662+3.299549+38.32735);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->SetBinContent(2,308.6276+2.714117+37.88962);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->SetBinContent(3,103.5325+1.658339+26.65695);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->SetBinContent(4,28.63412+0.8326594+13.8099);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->SetBinContent(5,7.862303+0.3288541+5.514146);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->SetBinContent(6,3.392461+0.1632717+2.387169);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->SetBinError(1,7.566319);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->SetBinError(2,4.307258);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->SetBinError(3,2.352907);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->SetBinError(4,1.260154);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->SetBinError(5,0.6253524);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->SetBinError(6,0.4849083);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->SetEntries(454838);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->SetDirectory(0);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->SetStats(0);

   ci = TColor::GetColor("#cccccc");
   val_ljets_ge8jge3b_nJets_ttW_stack_1->SetFillColor(ci);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->SetMarkerStyle(20);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->SetMarkerSize(1.2);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->GetXaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->GetXaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->GetXaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->GetXaxis()->SetTitleOffset(1.4);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->GetXaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->GetYaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->GetYaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->GetYaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->GetYaxis()->SetTitleOffset(2.2);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->GetYaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->GetZaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->GetZaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->GetZaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->GetZaxis()->SetTitleOffset(1);
   val_ljets_ge8jge3b_nJets_ttW_stack_1->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_ljets_ge8jge3b_nJets_ttW_stack_1,"");
   
   TH1D *val_ljets_ge8jge3b_nJets_TTB_stack_2 = new TH1D("val_ljets_ge8jge3b_nJets_TTB_stack_2","h",6,7.5,13.5);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->SetBinContent(1,5870.416);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->SetBinContent(2,2186.606);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->SetBinContent(3,761.6467);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->SetBinContent(4,243.7243);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->SetBinContent(5,69.61508);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->SetBinContent(6,23.68946);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->SetBinError(1,9.743234);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->SetBinError(2,5.852493);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->SetBinError(3,3.521524);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->SetBinError(4,2.056992);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->SetBinError(5,1.131768);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->SetBinError(6,0.6750532);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->SetEntries(1233447);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->SetDirectory(0);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->SetStats(0);

   ci = TColor::GetColor("#6666cc");
   val_ljets_ge8jge3b_nJets_TTB_stack_2->SetFillColor(ci);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->SetMarkerStyle(20);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->SetMarkerSize(1.2);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->GetXaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->GetXaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->GetXaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->GetXaxis()->SetTitleOffset(1.4);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->GetXaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->GetYaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->GetYaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->GetYaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->GetYaxis()->SetTitleOffset(2.2);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->GetYaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->GetZaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->GetZaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->GetZaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->GetZaxis()->SetTitleOffset(1);
   val_ljets_ge8jge3b_nJets_TTB_stack_2->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_ljets_ge8jge3b_nJets_TTB_stack_2,"");
   
   TH1D *val_ljets_ge8jge3b_nJets_TTC_stack_3 = new TH1D("val_ljets_ge8jge3b_nJets_TTC_stack_3","h",6,7.5,13.5);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->SetBinContent(1,3026.682);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->SetBinContent(2,1070.028);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->SetBinContent(3,360.192);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->SetBinContent(4,107.9853);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->SetBinContent(5,30.43875);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->SetBinContent(6,10.56602);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->SetBinError(1,14.50317);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->SetBinError(2,8.392571);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->SetBinError(3,4.872897);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->SetBinError(4,2.587283);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->SetBinError(5,1.336862);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->SetBinError(6,0.7942457);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->SetEntries(277152);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->SetDirectory(0);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->SetStats(0);

   ci = TColor::GetColor("#ccccff");
   val_ljets_ge8jge3b_nJets_TTC_stack_3->SetFillColor(ci);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->SetMarkerStyle(20);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->SetMarkerSize(1.2);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->GetXaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->GetXaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->GetXaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->GetXaxis()->SetTitleOffset(1.4);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->GetXaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->GetYaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->GetYaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->GetYaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->GetYaxis()->SetTitleOffset(2.2);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->GetYaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->GetZaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->GetZaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->GetZaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->GetZaxis()->SetTitleOffset(1);
   val_ljets_ge8jge3b_nJets_TTC_stack_3->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_ljets_ge8jge3b_nJets_TTC_stack_3,"");
   
   TH1D *val_ljets_ge8jge3b_nJets_TTL_stack_4 = new TH1D("val_ljets_ge8jge3b_nJets_TTL_stack_4","h",6,7.5,13.5);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->SetBinContent(1,1507.224);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->SetBinContent(2,415.1905);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->SetBinContent(3,119.5379);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->SetBinContent(4,27.93925);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->SetBinContent(5,6.584662);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->SetBinContent(6,1.704307);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->SetBinError(1,13.4592);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->SetBinError(2,6.978197);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->SetBinError(3,3.782241);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->SetBinError(4,1.715443);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->SetBinError(5,0.8662575);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->SetBinError(6,0.2254755);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->SetEntries(96065);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->SetDirectory(0);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->SetStats(0);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->SetMarkerStyle(20);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->SetMarkerSize(1.2);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->GetXaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->GetXaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->GetXaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->GetXaxis()->SetTitleOffset(1.4);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->GetXaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->GetYaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->GetYaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->GetYaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->GetYaxis()->SetTitleOffset(2.2);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->GetYaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->GetZaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->GetZaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->GetZaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->GetZaxis()->SetTitleOffset(1);
   val_ljets_ge8jge3b_nJets_TTL_stack_4->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_ljets_ge8jge3b_nJets_TTL_stack_4,"");
   
   
   myStack->Draw("hist same");
   
   Double_t g_totErr_fx3007[6] = {
   8,
   9,
   10,
   11,
   12,
   13};
   Double_t g_totErr_fy3007[6] = {
   11306.6,
   4021.06,
   1373.22,
   422.926,
   120.344,
   41.9027};
   Double_t g_totErr_felx3007[6] = {
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t g_totErr_fely3007[6] = {
   3943.708,
   1505.217,
   550.8569,
   185.4324,
   58.78872,
   23.64755};
   Double_t g_totErr_fehx3007[6] = {
   0.5,
   0.5,
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t g_totErr_fehy3007[6] = {
   3943.708,
   1505.217,
   550.8569,
   185.4324,
   58.78872,
   23.64755};
   grae = new TGraphAsymmErrors(6,g_totErr_fx3007,g_totErr_fy3007,g_totErr_felx3007,g_totErr_fehx3007,g_totErr_fely3007,g_totErr_fehy3007);
   grae->SetName("g_totErr");
   grae->SetTitle("h");

   ci = TColor::GetColor("#6666ff");
   grae->SetFillColor(ci);
   grae->SetFillStyle(3354);
   grae->SetLineColor(0);
   grae->SetLineWidth(0);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(0);
   
   TH1F *Graph_g_totErr3007 = new TH1F("Graph_g_totErr3007","h",100,6.9,14.1);
   Graph_g_totErr3007->SetMinimum(18.21357);
   Graph_g_totErr3007->SetMaximum(16822.61);
   Graph_g_totErr3007->SetDirectory(0);
   Graph_g_totErr3007->SetStats(0);
   Graph_g_totErr3007->SetLineWidth(2);
   Graph_g_totErr3007->SetMarkerStyle(20);
   Graph_g_totErr3007->SetMarkerSize(1.2);
   Graph_g_totErr3007->GetXaxis()->SetLabelFont(43);
   Graph_g_totErr3007->GetXaxis()->SetLabelSize(21);
   Graph_g_totErr3007->GetXaxis()->SetTitleSize(21);
   Graph_g_totErr3007->GetXaxis()->SetTitleOffset(1.4);
   Graph_g_totErr3007->GetXaxis()->SetTitleFont(43);
   Graph_g_totErr3007->GetYaxis()->SetLabelFont(43);
   Graph_g_totErr3007->GetYaxis()->SetLabelSize(21);
   Graph_g_totErr3007->GetYaxis()->SetTitleSize(21);
   Graph_g_totErr3007->GetYaxis()->SetTitleOffset(2.2);
   Graph_g_totErr3007->GetYaxis()->SetTitleFont(43);
   Graph_g_totErr3007->GetZaxis()->SetLabelFont(43);
   Graph_g_totErr3007->GetZaxis()->SetLabelSize(21);
   Graph_g_totErr3007->GetZaxis()->SetTitleSize(21);
   Graph_g_totErr3007->GetZaxis()->SetTitleOffset(1);
   Graph_g_totErr3007->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_g_totErr3007);
   
   grae->Draw("e2");
   
   TH1D *val_ljets_ge8jge3b_nJets_BSMtttt400__15 = new TH1D("val_ljets_ge8jge3b_nJets_BSMtttt400__15","h",6,7.5,13.5);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->SetBinContent(1,9821.88);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->SetBinContent(2,3467.97);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->SetBinContent(3,1132.92);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->SetBinContent(4,324.977);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->SetBinContent(5,89.7095);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->SetBinContent(6,30.1496);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->SetEntries(41085);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->SetDirectory(0);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->SetStats(0);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->SetFillStyle(0);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->SetLineColor(2);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->SetLineStyle(2);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->SetLineWidth(2);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->SetMarkerStyle(20);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->SetMarkerSize(1.2);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->GetXaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->GetXaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->GetXaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->GetXaxis()->SetTitleOffset(1.4);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->GetXaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->GetYaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->GetYaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->GetYaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->GetYaxis()->SetTitleOffset(2.2);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->GetYaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->GetZaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->GetZaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->GetZaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->GetZaxis()->SetTitleOffset(1);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->GetZaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nJets_BSMtttt400__15->Draw("HISTsame");
   

   
   Double_t Graph_from_val_ljets_ge8jge3b_nJets_data_fx3008[6] = {
   8,
   9,
   10,
   11,
   12,
   13};
   Double_t Graph_from_val_ljets_ge8jge3b_nJets_data_fy3008[6] = {
   11723,
   4202,
   1403,
   480,
   137,
   54};
   Double_t Graph_from_val_ljets_ge8jge3b_nJets_data_felx3008[6] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_val_ljets_ge8jge3b_nJets_data_fely3008[6] = {
   108.2728,
   64.82284,
   37.45664,
   21.9089,
   11.7047,
   7.348469};
   Double_t Graph_from_val_ljets_ge8jge3b_nJets_data_fehx3008[6] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_val_ljets_ge8jge3b_nJets_data_fehy3008[6] = {
   108.2728,
   64.82284,
   37.45664,
   21.9089,
   11.7047,
   7.348469};
   grae = new TGraphAsymmErrors(6,Graph_from_val_ljets_ge8jge3b_nJets_data_fx3008,Graph_from_val_ljets_ge8jge3b_nJets_data_fy3008,Graph_from_val_ljets_ge8jge3b_nJets_data_felx3008,Graph_from_val_ljets_ge8jge3b_nJets_data_fehx3008,Graph_from_val_ljets_ge8jge3b_nJets_data_fely3008,Graph_from_val_ljets_ge8jge3b_nJets_data_fehy3008);
   grae->SetName("Graph_from_val_ljets_ge8jge3b_nJets_data");
   grae->SetTitle("h");
   grae->SetLineWidth(2);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(1.4);
   
   TH1F *Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008 = new TH1F("Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008","h",100,6.9011,14.0999);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->SetMinimum(41.98638);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->SetMaximum(13009.73);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->SetDirectory(0);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->SetStats(0);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->SetLineWidth(2);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->SetMarkerStyle(20);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->SetMarkerSize(1.2);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->GetXaxis()->SetLabelFont(43);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->GetXaxis()->SetLabelSize(21);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->GetXaxis()->SetTitleSize(21);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->GetXaxis()->SetTitleFont(43);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->GetYaxis()->SetLabelFont(43);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->GetYaxis()->SetLabelSize(21);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->GetYaxis()->SetTitleSize(21);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->GetYaxis()->SetTitleFont(43);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->GetZaxis()->SetLabelFont(43);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->GetZaxis()->SetLabelSize(21);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->GetZaxis()->SetTitleSize(21);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_from_val_ljets_ge8jge3b_nJets_data3008);
   
   grae->Draw("PZ");
   
   TH1D *h_blind__17 = new TH1D("h_blind__17","h",6,7.5,13.5);
   h_blind__17->SetBinError(1,6521813);
   h_blind__17->SetBinError(2,3904604);
   h_blind__17->SetBinError(3,2256201);
   h_blind__17->SetBinError(4,1319683);
   h_blind__17->SetBinError(5,705032.7);
   h_blind__17->SetBinError(6,442635.1);
   h_blind__17->SetEntries(36062);
   h_blind__17->SetDirectory(0);
   h_blind__17->SetStats(0);

   ci = TColor::GetColor("#cccccc");
   h_blind__17->SetFillColor(ci);
   h_blind__17->SetFillStyle(3345);

   ci = TColor::GetColor("#cccccc");
   h_blind__17->SetLineColor(ci);
   h_blind__17->SetLineWidth(0);
   h_blind__17->SetMarkerStyle(20);
   h_blind__17->SetMarkerSize(1.2);
   h_blind__17->GetXaxis()->SetLabelFont(43);
   h_blind__17->GetXaxis()->SetLabelSize(21);
   h_blind__17->GetXaxis()->SetTitleSize(21);
   h_blind__17->GetXaxis()->SetTitleOffset(1.4);
   h_blind__17->GetXaxis()->SetTitleFont(43);
   h_blind__17->GetYaxis()->SetLabelFont(43);
   h_blind__17->GetYaxis()->SetLabelSize(21);
   h_blind__17->GetYaxis()->SetTitleSize(21);
   h_blind__17->GetYaxis()->SetTitleOffset(2.2);
   h_blind__17->GetYaxis()->SetTitleFont(43);
   h_blind__17->GetZaxis()->SetLabelFont(43);
   h_blind__17->GetZaxis()->SetLabelSize(21);
   h_blind__17->GetZaxis()->SetTitleSize(21);
   h_blind__17->GetZaxis()->SetTitleOffset(1);
   h_blind__17->GetZaxis()->SetTitleFont(43);
   h_blind__17->Draw("same HIST");
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
      tex = new TLatex(0.1812081,0.76,"1L, #geq8j, #geq3b");
      // tex = new TLatex(0.1812081,0.7316667,"LJETS,#geq8j,#geq3b");
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
   TLegendEntry *entry=leg->AddEntry("val_ljets_ge8jge3b_nJets_data","Data","ep");

   entry->SetFillColor(62);
   entry->SetFillStyle(1001);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(20);
   entry->SetMarkerSize(1.4);
   entry->SetTextFont(43);
   entry=leg->AddEntry("val_ljets_ge8jge3b_nJets_TTL_stack_4","t#bar{t}+light","f");
   entry->SetFillStyle(1001);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   entry=leg->AddEntry("val_ljets_ge8jge3b_nJets_TTC_stack_3","t#bar{t}+#geq1c","f");

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
   entry=leg->AddEntry("val_ljets_ge8jge3b_nJets_TTB_stack_2","t#bar{t}+#geq1b","f");

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
   entry=leg->AddEntry("val_ljets_ge8jge3b_nJets_ttW_stack_1","Others","f");

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
   entry=leg->AddEntry("val_ljets_ge8jge3b_nJets_BSMtttt400__15","Bkg. before corr.","l");
   entry->SetLineColor(2);
   entry->SetLineStyle(2);
   entry->SetLineWidth(2);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   leg->Draw();
   
   
   TH1D *h_dummy_copy__18 = new TH1D("h_dummy_copy__18","h",6,7.5,13.5);
   h_dummy_copy__18->SetMinimum(0);
   h_dummy_copy__18->SetMaximum(21296.29);
   h_dummy_copy__18->SetEntries(3310478);
   h_dummy_copy__18->SetDirectory(0);
   h_dummy_copy__18->SetStats(0);
   h_dummy_copy__18->SetFillColor(2);
   h_dummy_copy__18->SetLineColor(2);
   h_dummy_copy__18->SetMarkerStyle(20);
   h_dummy_copy__18->SetMarkerSize(1.2);
   h_dummy_copy__18->GetXaxis()->SetBinLabel(1,"8");
   h_dummy_copy__18->GetXaxis()->SetBinLabel(2,"9");
   h_dummy_copy__18->GetXaxis()->SetBinLabel(3,"10");
   h_dummy_copy__18->GetXaxis()->SetBinLabel(4,"11");
   h_dummy_copy__18->GetXaxis()->SetBinLabel(5,"12");
   h_dummy_copy__18->GetXaxis()->SetBinLabel(6,"#geq13");
   h_dummy_copy__18->GetXaxis()->SetLabelFont(43);
   h_dummy_copy__18->GetXaxis()->SetLabelSize(0);
   h_dummy_copy__18->GetXaxis()->SetTitleSize(21);
   h_dummy_copy__18->GetXaxis()->SetTitleOffset(2);
   h_dummy_copy__18->GetXaxis()->SetTitleFont(43);
   h_dummy_copy__18->GetYaxis()->SetTitle("Events");
   h_dummy_copy__18->GetYaxis()->SetLabelFont(43);
   h_dummy_copy__18->GetYaxis()->SetLabelSize(21);
   h_dummy_copy__18->GetYaxis()->SetTitleSize(21);
   h_dummy_copy__18->GetYaxis()->SetTitleOffset(2.255033);
   h_dummy_copy__18->GetYaxis()->SetTitleFont(43);
   h_dummy_copy__18->GetZaxis()->SetLabelFont(43);
   h_dummy_copy__18->GetZaxis()->SetLabelSize(21);
   h_dummy_copy__18->GetZaxis()->SetTitleSize(21);
   h_dummy_copy__18->GetZaxis()->SetTitleOffset(1);
   h_dummy_copy__18->GetZaxis()->SetTitleFont(43);
   h_dummy_copy__18->Draw("sameaxis");
   pad->Modified();
   c1_n13->cd();
   c1_n13->Modified();
   c1_n13->cd();
   c1_n13->SetSelected(c1_n13);

   c1_n13->SaveAs("val_ljets_ge8jge3b_nJets.pdf");
}
