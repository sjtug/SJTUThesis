void nRCJets()
{
//=========Macro generated from canvas: c1_n13/
//=========  (Mon Dec 11 23:01:38 2023) by ROOT version 6.22/01
   TCanvas * c1_n13= new TCanvas("c1_n13", "",315,182,888,700);
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
   
   TH1D *h_dummy2__19__1 = new TH1D("h_dummy2__19__1","h",4,-0.5,3.5);
   h_dummy2__19__1->SetMinimum(0.2);
   h_dummy2__19__1->SetMaximum(1.8);
   h_dummy2__19__1->SetEntries(3310481);
   h_dummy2__19__1->SetDirectory(0);
   h_dummy2__19__1->SetStats(0);
   h_dummy2__19__1->SetFillColor(2);
   h_dummy2__19__1->SetLineColor(2);
   h_dummy2__19__1->SetMarkerStyle(20);
   h_dummy2__19__1->SetMarkerSize(1.2);
   h_dummy2__19__1->GetXaxis()->SetTitle("Number of large-R jets");
   h_dummy2__19__1->GetXaxis()->SetBinLabel(1,"0");
   h_dummy2__19__1->GetXaxis()->SetBinLabel(2,"1");
   h_dummy2__19__1->GetXaxis()->SetBinLabel(3,"2");
   h_dummy2__19__1->GetXaxis()->SetBinLabel(4,"#geq3");
   h_dummy2__19__1->GetXaxis()->SetLabelFont(43);
   h_dummy2__19__1->GetXaxis()->SetLabelOffset(0.025);
   h_dummy2__19__1->GetXaxis()->SetLabelSize(28);
   h_dummy2__19__1->GetXaxis()->SetTitleSize(28);
   h_dummy2__19__1->GetXaxis()->SetTitleOffset(1.1);
   h_dummy2__19__1->GetXaxis()->SetTitleFont(43);
   h_dummy2__19__1->GetYaxis()->SetTitle("Data / Bkg. ");
   // h_dummy2__19__1->GetYaxis()->SetNdivisions(-504);
   h_dummy2__19__1->GetYaxis()->SetTickLength(0);
   h_dummy2__19__1->GetYaxis()->SetLabelFont(43);
   h_dummy2__19__1->GetYaxis()->SetLabelSize(28);
   h_dummy2__19__1->GetYaxis()->SetTitleSize(28);
   h_dummy2__19__1->GetYaxis()->SetTitleOffset(2.2);
   h_dummy2__19__1->GetYaxis()->SetTitleFont(43);
   h_dummy2__19__1->GetYaxis()->SetNdivisions(504);
   h_dummy2__19__1->GetZaxis()->SetLabelFont(43);
   h_dummy2__19__1->GetZaxis()->SetLabelSize(21);
   h_dummy2__19__1->GetZaxis()->SetTitleSize(21);
   h_dummy2__19__1->GetZaxis()->SetTitleOffset(1);
   h_dummy2__19__1->GetZaxis()->SetTitleFont(43);
   h_dummy2__19__1->Draw("HIST");
   TLine *line = new TLine(-0.5,1,3.5,1);
   line->SetLineStyle(2);
   line->SetLineWidth(2);
   line->Draw();
   
   Double_t g_ratio2_fx3001[4] = {
   0,
   1,
   2,
   3};
   Double_t g_ratio2_fy3001[4] = {
   1,
   1,
   1,
   1};
   Double_t g_ratio2_felx3001[4] = {
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t g_ratio2_fely3001[4] = {
   0.3647606,
   0.3477093,
   0.3442746,
   0.3514954};
   Double_t g_ratio2_fehx3001[4] = {
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t g_ratio2_fehy3001[4] = {
   0.3647606,
   0.3477093,
   0.3442746,
   0.3514954};
   TGraphAsymmErrors *grae = new TGraphAsymmErrors(4,g_ratio2_fx3001,g_ratio2_fy3001,g_ratio2_felx3001,g_ratio2_fehx3001,g_ratio2_fely3001,g_ratio2_fehy3001);
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
   
   TH1F *Graph_Graph_g_ratio230093001 = new TH1F("Graph_Graph_g_ratio230093001","h",100,-0.9,3.9);
   Graph_Graph_g_ratio230093001->SetMinimum(0.5622873);
   Graph_Graph_g_ratio230093001->SetMaximum(1.437713);
   Graph_Graph_g_ratio230093001->SetDirectory(0);
   Graph_Graph_g_ratio230093001->SetStats(0);

   ci = TColor::GetColor("#000099");
   Graph_Graph_g_ratio230093001->SetLineColor(ci);
   Graph_Graph_g_ratio230093001->SetLineWidth(2);
   Graph_Graph_g_ratio230093001->SetMarkerStyle(20);
   Graph_Graph_g_ratio230093001->SetMarkerSize(1.2);
   Graph_Graph_g_ratio230093001->GetXaxis()->SetLabelFont(43);
   Graph_Graph_g_ratio230093001->GetXaxis()->SetLabelSize(21);
   Graph_Graph_g_ratio230093001->GetXaxis()->SetTitleSize(21);
   Graph_Graph_g_ratio230093001->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_g_ratio230093001->GetXaxis()->SetTitleFont(43);
   Graph_Graph_g_ratio230093001->GetYaxis()->SetLabelFont(43);
   Graph_Graph_g_ratio230093001->GetYaxis()->SetLabelSize(21);
   Graph_Graph_g_ratio230093001->GetYaxis()->SetTitleSize(21);
   Graph_Graph_g_ratio230093001->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_g_ratio230093001->GetYaxis()->SetTitleFont(43);
   Graph_Graph_g_ratio230093001->GetZaxis()->SetLabelFont(43);
   Graph_Graph_g_ratio230093001->GetZaxis()->SetLabelSize(21);
   Graph_Graph_g_ratio230093001->GetZaxis()->SetTitleSize(21);
   Graph_Graph_g_ratio230093001->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_g_ratio230093001->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_g_ratio230093001);
   
   grae->Draw("e2");
   
   Double_t Graph_from_h_ratio_fx3002[4] = {
   0,
   1,
   2,
   3};
   Double_t Graph_from_h_ratio_fy3002[4] = {
   1.026302,
   1.07442,
   1.041591,
   1.226505};
   Double_t Graph_from_h_ratio_felx3002[4] = {
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fely3002[4] = {
   0.00947553,
   0.01485043,
   0.02981403,
   0.1382526};
   Double_t Graph_from_h_ratio_fehx3002[4] = {
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fehy3002[4] = {
   0.00947553,
   0.01485043,
   0.02981403,
   0.1382526};
   grae = new TGraphAsymmErrors(4,Graph_from_h_ratio_fx3002,Graph_from_h_ratio_fy3002,Graph_from_h_ratio_felx3002,Graph_from_h_ratio_fehx3002,Graph_from_h_ratio_fely3002,Graph_from_h_ratio_fehy3002);
   grae->SetName("Graph_from_h_ratio");
   grae->SetTitle("h");
   grae->SetFillStyle(1000);
   grae->SetLineWidth(2);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(1.4);
   
   TH1F *Graph_Graph_Graph_from_h_ratio30103002 = new TH1F("Graph_Graph_Graph_from_h_ratio30103002","h",100,-0.8989,3.8999);
   Graph_Graph_Graph_from_h_ratio30103002->SetMinimum(0.9626282);
   Graph_Graph_Graph_from_h_ratio30103002->SetMaximum(1.343068);
   Graph_Graph_Graph_from_h_ratio30103002->SetDirectory(0);
   Graph_Graph_Graph_from_h_ratio30103002->SetStats(0);

   ci = TColor::GetColor("#000099");
   Graph_Graph_Graph_from_h_ratio30103002->SetLineColor(ci);
   Graph_Graph_Graph_from_h_ratio30103002->SetLineWidth(2);
   Graph_Graph_Graph_from_h_ratio30103002->SetMarkerStyle(20);
   Graph_Graph_Graph_from_h_ratio30103002->SetMarkerSize(1.2);
   Graph_Graph_Graph_from_h_ratio30103002->GetXaxis()->SetLabelFont(43);
   Graph_Graph_Graph_from_h_ratio30103002->GetXaxis()->SetLabelSize(21);
   Graph_Graph_Graph_from_h_ratio30103002->GetXaxis()->SetTitleSize(21);
   Graph_Graph_Graph_from_h_ratio30103002->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_Graph_from_h_ratio30103002->GetXaxis()->SetTitleFont(43);
   Graph_Graph_Graph_from_h_ratio30103002->GetYaxis()->SetLabelFont(43);
   Graph_Graph_Graph_from_h_ratio30103002->GetYaxis()->SetLabelSize(21);
   Graph_Graph_Graph_from_h_ratio30103002->GetYaxis()->SetTitleSize(21);
   Graph_Graph_Graph_from_h_ratio30103002->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_Graph_from_h_ratio30103002->GetYaxis()->SetTitleFont(43);
   Graph_Graph_Graph_from_h_ratio30103002->GetZaxis()->SetLabelFont(43);
   Graph_Graph_Graph_from_h_ratio30103002->GetZaxis()->SetLabelSize(21);
   Graph_Graph_Graph_from_h_ratio30103002->GetZaxis()->SetTitleSize(21);
   Graph_Graph_Graph_from_h_ratio30103002->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_Graph_from_h_ratio30103002->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_Graph_from_h_ratio30103002);
   
   grae->Draw("PZ");

   ///////////////   
   Double_t Graph_from_h_ratio2_fx3003[4] = {
   0,
   1,
   2,
   3};
   Double_t Graph_from_h_ratio2_fy3003[4] = {
   1.229558,
   1.196905,
   1.101151,
   1.168647};
   Double_t Graph_from_h_ratio2_felx3003[4] = {
   0.499,
   0.499,
   0.499,
   0.499};
   Double_t Graph_from_h_ratio2_fely3003[4] = {
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio2_fehx3003[4] = {
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t Graph_from_h_ratio2_fehy3003[4] = {
   0.,
   0.,
   0.,
   0.};
   grae = new TGraphAsymmErrors(4,Graph_from_h_ratio2_fx3003,Graph_from_h_ratio2_fy3003,Graph_from_h_ratio2_felx3003,Graph_from_h_ratio2_fehx3003,Graph_from_h_ratio2_fely3003,Graph_from_h_ratio2_fehy3003);
   grae->SetName("Graph_from_h_ratio2");
   grae->SetTitle("h");
   grae->SetFillStyle(1000);

   ci = TColor::GetColor("#ff0000");
   grae->SetLineColor(ci);
   grae->SetLineStyle(2);
   grae->SetLineWidth(2);

   ci = TColor::GetColor("#ff0000");
   grae->SetMarkerColor(ci);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(0.5);
   
   TH1F *Graph_Graph_Graph_from_h_ratio301023003 = new TH1F("Graph_Graph_Graph_from_h_ratio301023003","h2",100,-0.8989,3.8999);
   Graph_Graph_Graph_from_h_ratio301023003->SetMinimum(0.9626282);
   Graph_Graph_Graph_from_h_ratio301023003->SetMaximum(1.343068);
   Graph_Graph_Graph_from_h_ratio301023003->SetDirectory(0);
   Graph_Graph_Graph_from_h_ratio301023003->SetStats(0);

   ci = TColor::GetColor("#000099");
   Graph_Graph_Graph_from_h_ratio301023003->SetLineColor(ci);
   Graph_Graph_Graph_from_h_ratio301023003->SetLineWidth(2);
   Graph_Graph_Graph_from_h_ratio301023003->SetMarkerStyle(20);
   Graph_Graph_Graph_from_h_ratio301023003->SetMarkerSize(1.2);
   Graph_Graph_Graph_from_h_ratio301023003->GetXaxis()->SetLabelFont(43);
   Graph_Graph_Graph_from_h_ratio301023003->GetXaxis()->SetLabelSize(21);
   Graph_Graph_Graph_from_h_ratio301023003->GetXaxis()->SetTitleSize(21);
   Graph_Graph_Graph_from_h_ratio301023003->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_Graph_from_h_ratio301023003->GetXaxis()->SetTitleFont(43);
   Graph_Graph_Graph_from_h_ratio301023003->GetYaxis()->SetLabelFont(43);
   Graph_Graph_Graph_from_h_ratio301023003->GetYaxis()->SetLabelSize(21);
   Graph_Graph_Graph_from_h_ratio301023003->GetYaxis()->SetTitleSize(21);
   Graph_Graph_Graph_from_h_ratio301023003->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_Graph_from_h_ratio301023003->GetYaxis()->SetTitleFont(43);
   Graph_Graph_Graph_from_h_ratio301023003->GetZaxis()->SetLabelFont(43);
   Graph_Graph_Graph_from_h_ratio301023003->GetZaxis()->SetLabelSize(21);
   Graph_Graph_Graph_from_h_ratio301023003->GetZaxis()->SetTitleSize(21);
   Graph_Graph_Graph_from_h_ratio301023003->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_Graph_from_h_ratio301023003->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_Graph_from_h_ratio301023003);
   
   grae->Draw("Z");
   
   TH1D *h_blindratio__20__2 = new TH1D("h_blindratio__20__2","h",4,-0.5,3.5);
   h_blindratio__20__2->SetBinError(1,609.4456);
   h_blindratio__20__2->SetBinError(2,405.5613);
   h_blindratio__20__2->SetBinError(3,194.3193);
   h_blindratio__20__2->SetBinError(4,48);
   h_blindratio__20__2->SetEntries(36058);
   h_blindratio__20__2->SetDirectory(0);
   h_blindratio__20__2->SetStats(0);
   h_blindratio__20__2->SetFillColor(17);
   h_blindratio__20__2->SetFillStyle(3345);
   h_blindratio__20__2->SetLineColor(17);
   h_blindratio__20__2->SetLineWidth(0);
   h_blindratio__20__2->SetMarkerStyle(20);
   h_blindratio__20__2->SetMarkerSize(1.2);
   h_blindratio__20__2->GetXaxis()->SetLabelFont(43);
   h_blindratio__20__2->GetXaxis()->SetLabelSize(21);
   h_blindratio__20__2->GetXaxis()->SetTitleSize(21);
   h_blindratio__20__2->GetXaxis()->SetTitleOffset(1.4);
   h_blindratio__20__2->GetXaxis()->SetTitleFont(43);
   h_blindratio__20__2->GetYaxis()->SetLabelFont(43);
   h_blindratio__20__2->GetYaxis()->SetLabelSize(21);
   h_blindratio__20__2->GetYaxis()->SetTitleSize(21);
   h_blindratio__20__2->GetYaxis()->SetTitleOffset(2.2);
   h_blindratio__20__2->GetYaxis()->SetTitleFont(43);
   h_blindratio__20__2->GetZaxis()->SetLabelFont(43);
   h_blindratio__20__2->GetZaxis()->SetLabelSize(21);
   h_blindratio__20__2->GetZaxis()->SetTitleSize(21);
   h_blindratio__20__2->GetZaxis()->SetTitleOffset(1);
   h_blindratio__20__2->GetZaxis()->SetTitleFont(43);
   h_blindratio__20__2->Draw("HIST same");
   
   TH1D *h_dummy2_copy__21__3 = new TH1D("h_dummy2_copy__21__3","h",4,-0.5,3.5);
   h_dummy2_copy__21__3->SetMinimum(0.5);
   h_dummy2_copy__21__3->SetMaximum(1.5);
   h_dummy2_copy__21__3->SetEntries(3310481);
   h_dummy2_copy__21__3->SetDirectory(0);
   h_dummy2_copy__21__3->SetStats(0);
   h_dummy2_copy__21__3->SetFillColor(2);
   h_dummy2_copy__21__3->SetLineColor(2);
   h_dummy2_copy__21__3->SetMarkerStyle(20);
   h_dummy2_copy__21__3->SetMarkerSize(1.2);
   h_dummy2_copy__21__3->GetXaxis()->SetTitle("Number of RC jets");
   h_dummy2_copy__21__3->GetXaxis()->SetBinLabel(1,"0");
   h_dummy2_copy__21__3->GetXaxis()->SetBinLabel(2,"1");
   h_dummy2_copy__21__3->GetXaxis()->SetBinLabel(3,"2");
   h_dummy2_copy__21__3->GetXaxis()->SetBinLabel(4,"#geq3");
   h_dummy2_copy__21__3->GetXaxis()->SetLabelFont(43);
   h_dummy2_copy__21__3->GetXaxis()->SetLabelOffset(0.045);
   h_dummy2_copy__21__3->GetXaxis()->SetLabelSize(21);
   h_dummy2_copy__21__3->GetXaxis()->SetTitleSize(21);
   h_dummy2_copy__21__3->GetXaxis()->SetTitleOffset(5);
   h_dummy2_copy__21__3->GetXaxis()->SetTitleFont(43);
   h_dummy2_copy__21__3->GetYaxis()->SetTitle("Data / Bkg.");
   h_dummy2_copy__21__3->GetYaxis()->SetNdivisions(-504);
   h_dummy2_copy__21__3->GetYaxis()->SetLabelFont(43);
   h_dummy2_copy__21__3->GetYaxis()->SetLabelSize(21);
   h_dummy2_copy__21__3->GetYaxis()->SetTitleSize(21);
   h_dummy2_copy__21__3->GetYaxis()->SetTitleOffset(2.255033);
   h_dummy2_copy__21__3->GetYaxis()->SetTitleFont(43);
   h_dummy2_copy__21__3->GetZaxis()->SetLabelFont(43);
   h_dummy2_copy__21__3->GetZaxis()->SetLabelSize(21);
   h_dummy2_copy__21__3->GetZaxis()->SetTitleSize(21);
   h_dummy2_copy__21__3->GetZaxis()->SetTitleOffset(1);
   h_dummy2_copy__21__3->GetZaxis()->SetTitleFont(43);
   h_dummy2_copy__21__3->Draw("sameaxis");
   
   pad->Modified();
   c1_n13->cd();
  
// ------------>Primitives in pad: 
   TPad *pad2 = new TPad("", "",0,0.2,1,1);
   pad2->Draw();
   pad2->cd();
   pad2->Range(-1.191358,-2480.767,3.746914,22326.9);
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
   
   TH1D *h_dummy__22__4 = new TH1D("h_dummy__22__4","h",4,-0.5,3.5);
   h_dummy__22__4->SetMinimum(0);
   h_dummy__22__4->SetMaximum(21086.52);
   h_dummy__22__4->SetMaximum(h_dummy__22__4->GetMaximum()*1.1);
   h_dummy__22__4->SetEntries(3310481);
   h_dummy__22__4->SetDirectory(0);
   h_dummy__22__4->SetStats(0);
   h_dummy__22__4->SetFillColor(2);
   h_dummy__22__4->SetLineColor(2);
   h_dummy__22__4->SetMarkerStyle(20);
   h_dummy__22__4->SetMarkerSize(1.2);
   h_dummy__22__4->GetXaxis()->SetBinLabel(1,"0");
   h_dummy__22__4->GetXaxis()->SetBinLabel(2,"1");
   h_dummy__22__4->GetXaxis()->SetBinLabel(3,"2");
   h_dummy__22__4->GetXaxis()->SetBinLabel(4,"#geq3");
   h_dummy__22__4->GetXaxis()->SetLabelFont(43);
   h_dummy__22__4->GetXaxis()->SetLabelSize(0);
   h_dummy__22__4->GetXaxis()->SetTitleSize(28);
   h_dummy__22__4->GetXaxis()->SetTitleOffset(2);
   h_dummy__22__4->GetXaxis()->SetTitleFont(43);
   h_dummy__22__4->GetYaxis()->SetTitle("Events");
   h_dummy__22__4->GetYaxis()->SetLabelFont(43);
   h_dummy__22__4->GetYaxis()->SetLabelSize(28);
   h_dummy__22__4->GetYaxis()->SetTitleSize(28);
   h_dummy__22__4->GetYaxis()->SetTitleOffset(2.2);
   h_dummy__22__4->GetYaxis()->SetTitleFont(43);
   h_dummy__22__4->GetYaxis()->SetNdivisions(505);
   h_dummy__22__4->GetZaxis()->SetLabelFont(43);
   h_dummy__22__4->GetZaxis()->SetLabelSize(21);
   h_dummy__22__4->GetZaxis()->SetTitleSize(21);
   h_dummy__22__4->GetZaxis()->SetTitleOffset(1);
   h_dummy__22__4->GetZaxis()->SetTitleFont(43);
   h_dummy__22__4->Draw("HIST");
   
   THStack * myStack= new THStack();
   myStack->SetName("");
   myStack->SetTitle("");
   
   TH1F *_stack_3_stack_1 = new TH1F("_stack_3_stack_1","",4,-0.5,3.5);
   _stack_3_stack_1->SetMinimum(0);
   _stack_3_stack_1->SetMaximum(11875.01);
   _stack_3_stack_1->SetDirectory(0);
   _stack_3_stack_1->SetStats(0);

   ci = TColor::GetColor("#000099");
   _stack_3_stack_1->SetLineColor(ci);
   _stack_3_stack_1->SetLineWidth(2);
   _stack_3_stack_1->SetMarkerStyle(20);
   _stack_3_stack_1->SetMarkerSize(1.2);
   _stack_3_stack_1->GetXaxis()->SetLabelFont(43);
   _stack_3_stack_1->GetXaxis()->SetLabelSize(21);
   _stack_3_stack_1->GetXaxis()->SetTitleSize(21);
   _stack_3_stack_1->GetXaxis()->SetTitleOffset(1.4);
   _stack_3_stack_1->GetXaxis()->SetTitleFont(43);
   _stack_3_stack_1->GetYaxis()->SetLabelFont(43);
   _stack_3_stack_1->GetYaxis()->SetLabelSize(21);
   _stack_3_stack_1->GetYaxis()->SetTitleSize(21);
   _stack_3_stack_1->GetYaxis()->SetTitleOffset(2.2);
   _stack_3_stack_1->GetYaxis()->SetTitleFont(43);
   _stack_3_stack_1->GetZaxis()->SetLabelFont(43);
   _stack_3_stack_1->GetZaxis()->SetLabelSize(21);
   _stack_3_stack_1->GetZaxis()->SetTitleSize(21);
   _stack_3_stack_1->GetZaxis()->SetTitleOffset(1);
   _stack_3_stack_1->GetZaxis()->SetTitleFont(43);
   myStack->SetHistogram(_stack_3_stack_1);
   
   
   TH1D *val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1 = new TH1D("val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1","h",4,-0.5,3.5);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->SetBinContent(1,752.3799+3.436163+47.45247);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->SetBinContent(2,432.787+3.564273+48.89877);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->SetBinContent(3,119.745+1.787096+25.56207);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->SetBinContent(4,7.803201+0.2092588+2.671813);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->SetBinError(1,7.227011);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->SetBinError(2,5.028226);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->SetBinError(3,2.358767);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->SetBinError(4,0.6068862);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->SetEntries(454843);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->SetDirectory(0);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->SetStats(0);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->SetFillColor(17);

   ci = TColor::GetColor("#000099");
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->SetLineColor(ci);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->SetMarkerStyle(20);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->SetMarkerSize(1.2);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->GetXaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->GetXaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->GetXaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->GetXaxis()->SetTitleOffset(1.4);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->GetXaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->GetYaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->GetYaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->GetYaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->GetYaxis()->SetTitleOffset(2.2);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->GetYaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->GetZaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->GetZaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->GetZaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->GetZaxis()->SetTitleOffset(1);
   val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1,"");
   
   TH1D *val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2 = new TH1D("val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2","h",4,-0.5,3.5);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->SetBinContent(1,5970.211);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->SetBinContent(2,2537.543);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->SetBinContent(3,616.2296);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->SetBinContent(4,31.71329);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->SetBinError(1,9.959341);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->SetBinError(2,6.250832);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->SetBinError(3,2.987845);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->SetBinError(4,0.6021825);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->SetEntries(1233447);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->SetDirectory(0);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->SetStats(0);

   ci = TColor::GetColor("#6666cc");
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->SetFillColor(ci);

   ci = TColor::GetColor("#000099");
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->SetLineColor(ci);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->SetMarkerStyle(20);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->SetMarkerSize(1.2);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->GetXaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->GetXaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->GetXaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->GetXaxis()->SetTitleOffset(1.4);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->GetXaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->GetYaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->GetYaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->GetYaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->GetYaxis()->SetTitleOffset(2.2);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->GetYaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->GetZaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->GetZaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->GetZaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->GetZaxis()->SetTitleOffset(1);
   val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2,"");
   
   TH1D *val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3 = new TH1D("val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3","h",4,-0.5,3.5);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->SetBinContent(1,3078.508);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->SetBinContent(2,1239.422);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->SetBinContent(3,274.2086);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->SetBinContent(4,13.75323);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->SetBinError(1,15.28768);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->SetBinError(2,8.473916);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->SetBinError(3,2.806265);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->SetBinError(4,0.4887228);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->SetEntries(277152);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->SetDirectory(0);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->SetStats(0);

   ci = TColor::GetColor("#ccccff");
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->SetFillColor(ci);

   ci = TColor::GetColor("#000099");
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->SetLineColor(ci);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->SetMarkerStyle(20);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->SetMarkerSize(1.2);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->GetXaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->GetXaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->GetXaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->GetXaxis()->SetTitleOffset(1.4);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->GetXaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->GetYaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->GetYaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->GetYaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->GetYaxis()->SetTitleOffset(2.2);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->GetYaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->GetZaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->GetZaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->GetZaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->GetZaxis()->SetTitleOffset(1);
   val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3,"");
   
   TH1D *val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4 = new TH1D("val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4","h",4,-0.5,3.5);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->SetBinContent(1,1457.545);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->SetBinContent(2,521.7615);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->SetBinContent(3,95.34982);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->SetBinContent(4,3.524636);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->SetBinError(1,13.59802);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->SetBinError(2,7.588699);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->SetBinError(3,2.299786);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->SetBinError(4,0.3332231);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->SetEntries(96065);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->SetDirectory(0);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->SetStats(0);

   ci = TColor::GetColor("#000099");
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->SetLineColor(ci);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->SetMarkerStyle(20);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->SetMarkerSize(1.2);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->GetXaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->GetXaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->GetXaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->GetXaxis()->SetTitleOffset(1.4);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->GetXaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->GetYaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->GetYaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->GetYaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->GetYaxis()->SetTitleOffset(2.2);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->GetYaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->GetZaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->GetZaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->GetZaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->GetZaxis()->SetTitleOffset(1);
   val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4,"");
      

   myStack->Draw("hist same");
   
   Double_t g_totErr_fx3004[4] = {
   0,
   1,
   2,
   3};
   Double_t g_totErr_fy3004[4] = {
   11309.5,
   4784,
   1132.9,
   59.7};
   Double_t g_totErr_felx3004[4] = {
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t g_totErr_fely3004[4] = {
   4147.29,
   1678.644,
   396.6663,
   21.57311};
   Double_t g_totErr_fehx3004[4] = {
   0.5,
   0.5,
   0.5,
   0.5};
   Double_t g_totErr_fehy3004[4] = {
   4147.29,
   1678.644,
   396.6663,
   21.57311};
   grae = new TGraphAsymmErrors(4,g_totErr_fx3004,g_totErr_fy3004,g_totErr_felx3004,g_totErr_fehx3004,g_totErr_fely3004,g_totErr_fehy3004);
   grae->SetName("g_totErr");
   grae->SetTitle("h");

   ci = TColor::GetColor("#6666ff");
   grae->SetFillColor(ci);
   grae->SetFillStyle(3354);
   grae->SetLineColor(0);
   grae->SetLineWidth(0);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(0);
   
   TH1F *Graph_Graph_g_totErr30113004 = new TH1F("Graph_Graph_g_totErr30113004","h",100,-0.9,3.9);
   Graph_Graph_g_totErr30113004->SetMinimum(35.82191);
   Graph_Graph_g_totErr30113004->SetMaximum(17064.92);
   Graph_Graph_g_totErr30113004->SetDirectory(0);
   Graph_Graph_g_totErr30113004->SetStats(0);

   ci = TColor::GetColor("#000099");
   Graph_Graph_g_totErr30113004->SetLineColor(ci);
   Graph_Graph_g_totErr30113004->SetLineWidth(2);
   Graph_Graph_g_totErr30113004->SetMarkerStyle(20);
   Graph_Graph_g_totErr30113004->SetMarkerSize(1.2);
   Graph_Graph_g_totErr30113004->GetXaxis()->SetLabelFont(43);
   Graph_Graph_g_totErr30113004->GetXaxis()->SetLabelSize(21);
   Graph_Graph_g_totErr30113004->GetXaxis()->SetTitleSize(21);
   Graph_Graph_g_totErr30113004->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_g_totErr30113004->GetXaxis()->SetTitleFont(43);
   Graph_Graph_g_totErr30113004->GetYaxis()->SetLabelFont(43);
   Graph_Graph_g_totErr30113004->GetYaxis()->SetLabelSize(21);
   Graph_Graph_g_totErr30113004->GetYaxis()->SetTitleSize(21);
   Graph_Graph_g_totErr30113004->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_g_totErr30113004->GetYaxis()->SetTitleFont(43);
   Graph_Graph_g_totErr30113004->GetZaxis()->SetLabelFont(43);
   Graph_Graph_g_totErr30113004->GetZaxis()->SetLabelSize(21);
   Graph_Graph_g_totErr30113004->GetZaxis()->SetTitleSize(21);
   Graph_Graph_g_totErr30113004->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_g_totErr30113004->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_g_totErr30113004);
   
   grae->Draw("e2");
   
   TH1D *val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5 = new TH1D("val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5","h",4,-0.5,3.5);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->SetBinContent(1,9439.98);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->SetBinContent(2,4294.41);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->SetBinContent(3,1071.61);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->SetBinContent(4,61.61);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->SetEntries(41085);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->SetDirectory(0);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->SetStats(0);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->SetFillStyle(0);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->SetLineColor(2);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->SetLineStyle(2);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->SetLineWidth(2);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->SetMarkerStyle(20);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->SetMarkerSize(1.2);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->GetXaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->GetXaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->GetXaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->GetXaxis()->SetTitleOffset(1.4);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->GetXaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->GetYaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->GetYaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->GetYaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->GetYaxis()->SetTitleOffset(2.2);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->GetYaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->GetZaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->GetZaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->GetZaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->GetZaxis()->SetTitleOffset(1);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->GetZaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23__5->Draw("HISTsame");
   
   Double_t Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data_fx3005[4] = {
   0,
   1,
   2,
   3};
   Double_t Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data_fy3005[4] = {
   11607,
   5140,
   1180,
   72};
   Double_t Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data_felx3005[4] = {
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data_fely3005[4] = {
   107.7358,
   71.69379,
   34.35113,
   8.485281};
   Double_t Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data_fehx3005[4] = {
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data_fehy3005[4] = {
   107.7358,
   71.69379,
   34.35113,
   8.485281};
   grae = new TGraphAsymmErrors(4,Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data_fx3005,Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data_fy3005,Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data_felx3005,Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data_fehx3005,Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data_fely3005,Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data_fehy3005);
   grae->SetName("Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data");
   grae->SetTitle("h");
   grae->SetFillStyle(1000);
   grae->SetLineWidth(2);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(1.4);
   
   TH1F *Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005 = new TH1F("Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005","h",100,-0.8989,3.8999);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->SetMinimum(57.16325);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->SetMaximum(12879.86);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->SetDirectory(0);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->SetStats(0);

   ci = TColor::GetColor("#000099");
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->SetLineColor(ci);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->SetLineWidth(2);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->SetMarkerStyle(20);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->SetMarkerSize(1.2);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->GetXaxis()->SetLabelFont(43);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->GetXaxis()->SetLabelSize(21);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->GetXaxis()->SetTitleSize(21);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->GetXaxis()->SetTitleFont(43);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->GetYaxis()->SetLabelFont(43);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->GetYaxis()->SetLabelSize(21);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->GetYaxis()->SetTitleSize(21);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->GetYaxis()->SetTitleFont(43);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->GetZaxis()->SetLabelFont(43);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->GetZaxis()->SetLabelSize(21);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->GetZaxis()->SetTitleSize(21);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_Graph_from_val_ljets_ge8jge3b_nRCJetsM100_data30123005);
   
   grae->Draw("PZ");
   
   TH1D *h_blind__25__6 = new TH1D("h_blind__25__6","h",4,-0.5,3.5);
   h_blind__25__6->SetBinError(1,6425545);
   h_blind__25__6->SetBinError(2,4275940);
   h_blind__25__6->SetBinError(3,2048760);
   h_blind__25__6->SetBinError(4,506076.6);
   h_blind__25__6->SetEntries(36058);
   h_blind__25__6->SetDirectory(0);
   h_blind__25__6->SetStats(0);
   h_blind__25__6->SetFillColor(17);
   h_blind__25__6->SetFillStyle(3345);
   h_blind__25__6->SetLineColor(17);
   h_blind__25__6->SetLineWidth(0);
   h_blind__25__6->SetMarkerStyle(20);
   h_blind__25__6->SetMarkerSize(1.2);
   h_blind__25__6->GetXaxis()->SetLabelFont(43);
   h_blind__25__6->GetXaxis()->SetLabelSize(21);
   h_blind__25__6->GetXaxis()->SetTitleSize(21);
   h_blind__25__6->GetXaxis()->SetTitleOffset(1.4);
   h_blind__25__6->GetXaxis()->SetTitleFont(43);
   h_blind__25__6->GetYaxis()->SetLabelFont(43);
   h_blind__25__6->GetYaxis()->SetLabelSize(21);
   h_blind__25__6->GetYaxis()->SetTitleSize(21);
   h_blind__25__6->GetYaxis()->SetTitleOffset(2.2);
   h_blind__25__6->GetYaxis()->SetTitleFont(43);
   h_blind__25__6->GetZaxis()->SetLabelFont(43);
   h_blind__25__6->GetZaxis()->SetLabelSize(21);
   h_blind__25__6->GetZaxis()->SetTitleSize(21);
   h_blind__25__6->GetZaxis()->SetTitleOffset(1);
   h_blind__25__6->GetZaxis()->SetTitleFont(43);
   h_blind__25__6->Draw("same HIST");
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
   TLegendEntry *entry=leg->AddEntry("NULL","Data","ep");

   entry->SetFillColor(92);
   entry->SetFillStyle(1001);

   entry->SetFillColor(62);
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#000099");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(20);
   entry->SetMarkerSize(1.4);
   entry->SetTextFont(43);
   entry=leg->AddEntry("val_ljets_ge8jge3b_nRCJetsM100_TTL_stack_4_stack_4","t#bar{t}+light","f");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#000099");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   entry=leg->AddEntry("val_ljets_ge8jge3b_nRCJetsM100_TTC_stack_3_stack_3","t#bar{t}+#geq1c","f");

   ci = TColor::GetColor("#ccccff");
   entry->SetFillColor(ci);
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#000099");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   entry=leg->AddEntry("val_ljets_ge8jge3b_nRCJetsM100_TTB_stack_2_stack_2","t#bar{t}+#geq1b","f");

   ci = TColor::GetColor("#6666cc");
   entry->SetFillColor(ci);
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#000099");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   entry=leg->AddEntry("val_ljets_ge8jge3b_nRCJetsM100_ttW_stack_1_stack_1","Others","f");
   entry->SetFillColor(17);
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#000099");
   entry->SetLineColor(ci);
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
   entry=leg->AddEntry("val_ljets_ge8jge3b_nRCJetsM100_BSMtttt400__23","Bkg. before corr.","l");
   entry->SetLineColor(2);
   entry->SetLineStyle(2);
   entry->SetLineWidth(2);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   leg->Draw();
   
   TH1D *h_dummy_copy__26__7 = new TH1D("h_dummy_copy__26__7","h",4,-0.5,3.5);
   h_dummy_copy__26__7->SetMinimum(0);
   h_dummy_copy__26__7->SetMaximum(21086.52);
   h_dummy_copy__26__7->SetEntries(3310481);
   h_dummy_copy__26__7->SetDirectory(0);
   h_dummy_copy__26__7->SetStats(0);
   h_dummy_copy__26__7->SetFillColor(2);
   h_dummy_copy__26__7->SetLineColor(2);
   h_dummy_copy__26__7->SetMarkerStyle(20);
   h_dummy_copy__26__7->SetMarkerSize(1.2);
   h_dummy_copy__26__7->GetXaxis()->SetBinLabel(1,"0");
   h_dummy_copy__26__7->GetXaxis()->SetBinLabel(2,"1");
   h_dummy_copy__26__7->GetXaxis()->SetBinLabel(3,"2");
   h_dummy_copy__26__7->GetXaxis()->SetBinLabel(4,"#geq3");
   h_dummy_copy__26__7->GetXaxis()->SetLabelFont(43);
   h_dummy_copy__26__7->GetXaxis()->SetLabelSize(0);
   h_dummy_copy__26__7->GetXaxis()->SetTitleSize(21);
   h_dummy_copy__26__7->GetXaxis()->SetTitleOffset(2);
   h_dummy_copy__26__7->GetXaxis()->SetTitleFont(43);
   h_dummy_copy__26__7->GetYaxis()->SetTitle("Events");
   h_dummy_copy__26__7->GetYaxis()->SetLabelFont(43);
   h_dummy_copy__26__7->GetYaxis()->SetLabelSize(21);
   h_dummy_copy__26__7->GetYaxis()->SetTitleSize(21);
   h_dummy_copy__26__7->GetYaxis()->SetTitleOffset(2.255033);
   h_dummy_copy__26__7->GetYaxis()->SetTitleFont(43);
   h_dummy_copy__26__7->GetZaxis()->SetLabelFont(43);
   h_dummy_copy__26__7->GetZaxis()->SetLabelSize(21);
   h_dummy_copy__26__7->GetZaxis()->SetTitleSize(21);
   h_dummy_copy__26__7->GetZaxis()->SetTitleOffset(1);
   h_dummy_copy__26__7->GetZaxis()->SetTitleFont(43);
   h_dummy_copy__26__7->Draw("sameaxis");
   pad->Modified();
   c1_n13->cd();
   c1_n13->Modified();
   c1_n13->cd();
   c1_n13->SetSelected(c1_n13);

   c1_n13->SaveAs("val_ljets_ge8jge3b_nRCJetsM100.pdf");
}
