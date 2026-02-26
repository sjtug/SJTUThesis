void HT_all()
{
//=========Macro generated from canvas: c1_n13/
//=========  (Fri Dec  8 08:47:13 2023) by ROOT version 6.24/06
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
   
   TH1D *h_dummy2__3 = new TH1D("h_dummy2__3","h",9,200,2000);
   h_dummy2__3->SetMinimum(0.2);
   h_dummy2__3->SetMaximum(1.8);
   h_dummy2__3->SetEntries(3310481);
   h_dummy2__3->SetDirectory(0);
   h_dummy2__3->SetStats(0);
   h_dummy2__3->SetFillColor(2);
   h_dummy2__3->SetLineColor(2);
   h_dummy2__3->SetMarkerStyle(20);
   h_dummy2__3->SetMarkerSize(1.2);
   h_dummy2__3->GetXaxis()->SetTitle("H_{T}^{all} [GeV]");
   h_dummy2__3->GetXaxis()->SetLabelFont(43);
   h_dummy2__3->GetXaxis()->SetLabelOffset(0.025);
   h_dummy2__3->GetXaxis()->SetLabelSize(28);
   h_dummy2__3->GetXaxis()->SetTitleSize(28);
   h_dummy2__3->GetXaxis()->SetTitleOffset(1.1);
   h_dummy2__3->GetXaxis()->SetTitleFont(43);
   h_dummy2__3->GetYaxis()->SetTitle("Data / Bkg. ");
   // h_dummy2__3->GetYaxis()->SetNdivisions(-504);
   h_dummy2__3->GetYaxis()->SetTickLength(0);
   h_dummy2__3->GetYaxis()->SetLabelFont(43);
   h_dummy2__3->GetYaxis()->SetLabelSize(28);
   h_dummy2__3->GetYaxis()->SetTitleSize(28);
   h_dummy2__3->GetYaxis()->SetTitleOffset(2.2);
   h_dummy2__3->GetYaxis()->SetTitleFont(43);
   h_dummy2__3->GetYaxis()->SetNdivisions(504);
   h_dummy2__3->GetZaxis()->SetLabelFont(43);
   h_dummy2__3->GetZaxis()->SetLabelSize(21);
   h_dummy2__3->GetZaxis()->SetTitleSize(21);
   h_dummy2__3->GetZaxis()->SetTitleOffset(1);
   h_dummy2__3->GetZaxis()->SetTitleFont(43);
   h_dummy2__3->Draw("HIST");
   TLine *line = new TLine(200,1,2000,1);
   line->SetLineStyle(2);
   line->SetLineWidth(2);
   line->Draw();
   
   Double_t g_ratio2_fx3001[9] = {
   300,
   500,
   700,
   900,
   1100,
   1300,
   1500,
   1700,
   1900};
   Double_t g_ratio2_fy3001[9] = {
   1,
   1,
   1,
   1,
   1,
   1,
   1,
   1,
   1};
   Double_t g_ratio2_felx3001[9] = {
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100};
   Double_t g_ratio2_fely3001[9] = {
   0.3771801,
   0.3734713,
   0.3634679,
   0.3526597,
   0.3452184,
   0.3444792,
   0.3399057,
   0.3437009,
   0.3501044};
   Double_t g_ratio2_fehx3001[9] = {
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100};
   Double_t g_ratio2_fehy3001[9] = {
   0.3771801,
   0.3734713,
   0.3634679,
   0.3526597,
   0.3452184,
   0.3444792,
   0.3399057,
   0.3437009,
   0.3501044};
   TGraphAsymmErrors *grae = new TGraphAsymmErrors(9,g_ratio2_fx3001,g_ratio2_fy3001,g_ratio2_felx3001,g_ratio2_fehx3001,g_ratio2_fely3001,g_ratio2_fehy3001);
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
   
   TH1F *Graph_g_ratio23001 = new TH1F("Graph_g_ratio23001","h",100,20,2180);
   Graph_g_ratio23001->SetMinimum(0.5473839);
   Graph_g_ratio23001->SetMaximum(1.452616);
   Graph_g_ratio23001->SetDirectory(0);
   Graph_g_ratio23001->SetStats(0);
   Graph_g_ratio23001->SetLineWidth(2);
   Graph_g_ratio23001->SetMarkerStyle(20);
   Graph_g_ratio23001->SetMarkerSize(1.2);
   Graph_g_ratio23001->GetXaxis()->SetLabelFont(43);
   Graph_g_ratio23001->GetXaxis()->SetLabelSize(21);
   Graph_g_ratio23001->GetXaxis()->SetTitleSize(21);
   Graph_g_ratio23001->GetXaxis()->SetTitleOffset(1.4);
   Graph_g_ratio23001->GetXaxis()->SetTitleFont(43);
   Graph_g_ratio23001->GetYaxis()->SetLabelFont(43);
   Graph_g_ratio23001->GetYaxis()->SetLabelSize(21);
   Graph_g_ratio23001->GetYaxis()->SetTitleSize(21);
   Graph_g_ratio23001->GetYaxis()->SetTitleOffset(2.2);
   Graph_g_ratio23001->GetYaxis()->SetTitleFont(43);
   Graph_g_ratio23001->GetZaxis()->SetLabelFont(43);
   Graph_g_ratio23001->GetZaxis()->SetLabelSize(21);
   Graph_g_ratio23001->GetZaxis()->SetTitleSize(21);
   Graph_g_ratio23001->GetZaxis()->SetTitleOffset(1);
   Graph_g_ratio23001->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_g_ratio23001);
   
   grae->Draw("e2");
   
   Double_t Graph_from_h_ratio_fx3002[9] = {
   300,
   500,
   700,
   900,
   1100,
   1300,
   1500,
   1700,
   1900};
   Double_t Graph_from_h_ratio_fy3002[9] = {
   1.18974,
   1.0083,
   1.03564,
   1.07077,
   1.03966,
   1.0664,
   1.0149,
   1.11386,
   1.16555};
   Double_t Graph_from_h_ratio_felx3002[9] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fely3002[9] = {
   0.06878013,
   0.01468081,
   0.01350144,
   0.01761899,
   0.02417343,
   0.03510406,
   0.04905862,
   0.07400994,
   0.0749843};
   Double_t Graph_from_h_ratio_fehx3002[9] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fehy3002[9] = {
   0.06878013,
   0.01468081,
   0.01350144,
   0.01761899,
   0.02417343,
   0.03510406,
   0.04905862,
   0.07400994,
   0.0749843};
   grae = new TGraphAsymmErrors(9,Graph_from_h_ratio_fx3002,Graph_from_h_ratio_fy3002,Graph_from_h_ratio_felx3002,Graph_from_h_ratio_fehx3002,Graph_from_h_ratio_fely3002,Graph_from_h_ratio_fehy3002);
   grae->SetName("Graph_from_h_ratio");
   grae->SetTitle("h");
   grae->SetLineWidth(2);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(1.4);
   
   TH1F *Graph_Graph_from_h_ratio3002 = new TH1F("Graph_Graph_from_h_ratio3002","h",100,20.22,2179.98);
   Graph_Graph_from_h_ratio3002->SetMinimum(0.923532);
   Graph_Graph_from_h_ratio3002->SetMaximum(1.288515);
   Graph_Graph_from_h_ratio3002->SetDirectory(0);
   Graph_Graph_from_h_ratio3002->SetStats(0);
   Graph_Graph_from_h_ratio3002->SetLineWidth(2);
   Graph_Graph_from_h_ratio3002->SetMarkerStyle(20);
   Graph_Graph_from_h_ratio3002->SetMarkerSize(1.2);
   Graph_Graph_from_h_ratio3002->GetXaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3002->GetXaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3002->GetXaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3002->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_h_ratio3002->GetXaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio3002->GetYaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3002->GetYaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3002->GetYaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3002->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_from_h_ratio3002->GetYaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio3002->GetZaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3002->GetZaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3002->GetZaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3002->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_from_h_ratio3002->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_from_h_ratio3002);
   
   grae->Draw("pe0");
   
   //////New Ratio
   Double_t Graph_from_h_ratio_fx30022[9] = {
   300,
   500,
   700,
   900,
   1100,
   1300,
   1500,
   1700,
   1900};
   Double_t Graph_from_h_ratio_fy30022[9] = {
   1.78547,
   1.35132,
   1.23067,
   1.18462,
   1.08224,
   1.04413,
   0.938246,
   0.975622,
   0.946367};
   Double_t Graph_from_h_ratio_felx30022[9] = {
   99.8,
   99.8,
   99.8,
   99.8,
   99.8,
   99.8,
   99.8,
   99.8,
   99.8};
   Double_t Graph_from_h_ratio_fely30022[9] = {
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0};
   Double_t Graph_from_h_ratio_fehx30022[9] = {
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100};
   Double_t Graph_from_h_ratio_fehy30022[9] = {
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0};
   grae = new TGraphAsymmErrors(9,Graph_from_h_ratio_fx30022,Graph_from_h_ratio_fy30022,Graph_from_h_ratio_felx30022,Graph_from_h_ratio_fehx30022,Graph_from_h_ratio_fely30022,Graph_from_h_ratio_fehy30022);
   grae->SetName("Graph_from_h_ratio");
   grae->SetTitle("h");
   grae->SetLineColor(kRed);
   grae->SetMarkerColor(kRed);
   grae->SetLineWidth(2);
   grae->SetLineStyle(2);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(0.5);
   
   TH1F *Graph_Graph_from_h_ratio30022 = new TH1F("Graph_Graph_from_h_ratio30022","h",100,20.22,2179.98);
   Graph_Graph_from_h_ratio30022->SetMinimum(0.923532);
   Graph_Graph_from_h_ratio30022->SetMaximum(1.288515);
   Graph_Graph_from_h_ratio30022->SetDirectory(0);
   Graph_Graph_from_h_ratio30022->SetStats(0);
   Graph_Graph_from_h_ratio30022->SetLineWidth(2);
   Graph_Graph_from_h_ratio30022->SetMarkerStyle(20);
   Graph_Graph_from_h_ratio30022->SetMarkerSize(1.2);
   Graph_Graph_from_h_ratio30022->GetXaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio30022->GetXaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio30022->GetXaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio30022->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_h_ratio30022->GetXaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio30022->GetYaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio30022->GetYaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio30022->GetYaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio30022->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_from_h_ratio30022->GetYaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio30022->GetZaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio30022->GetZaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio30022->GetZaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio30022->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_from_h_ratio30022->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_from_h_ratio30022);
   
   grae->Draw("Z");
   //////////////


   TH1D *h_blindratio__4 = new TH1D("h_blindratio__4","h",9,200,2000);
   h_blindratio__4->SetBinError(1,97.81615);
   h_blindratio__4->SetBinError(2,387.2777);
   h_blindratio__4->SetBinError(3,430.8132);
   h_blindratio__4->SetBinError(4,340.5407);
   h_blindratio__4->SetBinError(5,240.7987);
   h_blindratio__4->SetBinError(6,169.8941);
   h_blindratio__4->SetBinError(7,115.6547);
   h_blindratio__4->SetBinError(8,84.09518);
   h_blindratio__4->SetBinError(9,86.90224);
   h_blindratio__4->SetEntries(36068);
   h_blindratio__4->SetDirectory(0);
   h_blindratio__4->SetStats(0);

   ci = TColor::GetColor("#cccccc");
   h_blindratio__4->SetFillColor(ci);
   h_blindratio__4->SetFillStyle(3345);

   ci = TColor::GetColor("#cccccc");
   h_blindratio__4->SetLineColor(ci);
   h_blindratio__4->SetLineWidth(0);
   h_blindratio__4->SetMarkerStyle(20);
   h_blindratio__4->SetMarkerSize(1.2);
   h_blindratio__4->GetXaxis()->SetLabelFont(43);
   h_blindratio__4->GetXaxis()->SetLabelSize(21);
   h_blindratio__4->GetXaxis()->SetTitleSize(21);
   h_blindratio__4->GetXaxis()->SetTitleOffset(1.4);
   h_blindratio__4->GetXaxis()->SetTitleFont(43);
   h_blindratio__4->GetYaxis()->SetLabelFont(43);
   h_blindratio__4->GetYaxis()->SetLabelSize(21);
   h_blindratio__4->GetYaxis()->SetTitleSize(21);
   h_blindratio__4->GetYaxis()->SetTitleOffset(2.2);
   h_blindratio__4->GetYaxis()->SetTitleFont(43);
   h_blindratio__4->GetZaxis()->SetLabelFont(43);
   h_blindratio__4->GetZaxis()->SetLabelSize(21);
   h_blindratio__4->GetZaxis()->SetTitleSize(21);
   h_blindratio__4->GetZaxis()->SetTitleOffset(1);
   h_blindratio__4->GetZaxis()->SetTitleFont(43);
   h_blindratio__4->Draw("HIST same");
   
   TH1D *h_dummy2_copy__5 = new TH1D("h_dummy2_copy__5","h",9,200,2000);
   h_dummy2_copy__5->SetMinimum(0.5);
   h_dummy2_copy__5->SetMaximum(1.5);
   h_dummy2_copy__5->SetEntries(3310481);
   h_dummy2_copy__5->SetDirectory(0);
   h_dummy2_copy__5->SetStats(0);
   h_dummy2_copy__5->SetFillColor(2);
   h_dummy2_copy__5->SetLineColor(2);
   h_dummy2_copy__5->SetMarkerStyle(20);
   h_dummy2_copy__5->SetMarkerSize(1.2);
   h_dummy2_copy__5->GetXaxis()->SetTitle("H_{T}^{all} [GeV]");
   h_dummy2_copy__5->GetXaxis()->SetLabelFont(43);
   h_dummy2_copy__5->GetXaxis()->SetLabelOffset(0.025);
   h_dummy2_copy__5->GetXaxis()->SetLabelSize(21);
   h_dummy2_copy__5->GetXaxis()->SetTitleSize(21);
   h_dummy2_copy__5->GetXaxis()->SetTitleOffset(5);
   h_dummy2_copy__5->GetXaxis()->SetTitleFont(43);
   h_dummy2_copy__5->GetYaxis()->SetTitle("Data / Bkg.");
   h_dummy2_copy__5->GetYaxis()->SetNdivisions(-504);
   h_dummy2_copy__5->GetYaxis()->SetLabelFont(43);
   h_dummy2_copy__5->GetYaxis()->SetLabelSize(21);
   h_dummy2_copy__5->GetYaxis()->SetTitleSize(21);
   h_dummy2_copy__5->GetYaxis()->SetTitleOffset(2.255033);
   h_dummy2_copy__5->GetYaxis()->SetTitleFont(43);
   h_dummy2_copy__5->GetZaxis()->SetLabelFont(43);
   h_dummy2_copy__5->GetZaxis()->SetLabelSize(21);
   h_dummy2_copy__5->GetZaxis()->SetTitleSize(21);
   h_dummy2_copy__5->GetZaxis()->SetTitleOffset(1);
   h_dummy2_copy__5->GetZaxis()->SetTitleFont(43);
   h_dummy2_copy__5->Draw("sameaxis");

   pad->Modified();
   c1_n13->cd();
  
// ------------>Primitives in pad: 
   TPad *pad2 = new TPad("", "",0,0.2,1,1);
   pad2->Draw();
   pad2->cd();
   pad2->Range(-111.1111,-1244.363,2111.111,11199.27);
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
   
   TH1D *h_dummy__6 = new TH1D("h_dummy__6","h",9,200,2000);
   h_dummy__6->SetMinimum(0);
   h_dummy__6->SetMaximum(10577.08);
   //h_dummy__6->SetMaximum(h_dummy__6->GetMaximum()*1.1);   
   h_dummy__6->SetEntries(3310481);
   h_dummy__6->SetDirectory(0);
   h_dummy__6->SetStats(0);
   h_dummy__6->SetFillColor(2);
   h_dummy__6->SetLineColor(2);
   h_dummy__6->SetMarkerStyle(20);
   h_dummy__6->SetMarkerSize(1.2);
   h_dummy__6->GetXaxis()->SetLabelFont(43);
   h_dummy__6->GetXaxis()->SetLabelSize(0);
   h_dummy__6->GetXaxis()->SetTitleSize(21);
   h_dummy__6->GetXaxis()->SetTitleOffset(2);
   h_dummy__6->GetXaxis()->SetTitleFont(43);
   h_dummy__6->GetYaxis()->SetTitle("Events / 200 GeV");
   h_dummy__6->GetYaxis()->SetLabelFont(43);
   h_dummy__6->GetYaxis()->SetLabelSize(28);
   h_dummy__6->GetYaxis()->SetTitleSize(28);
   h_dummy__6->GetYaxis()->SetTitleOffset(2.2);
   h_dummy__6->GetYaxis()->SetTitleFont(43);
   h_dummy__6->GetZaxis()->SetLabelFont(43);
   h_dummy__6->GetZaxis()->SetLabelSize(21);
   h_dummy__6->GetZaxis()->SetTitleSize(21);
   h_dummy__6->GetZaxis()->SetTitleOffset(1);
   h_dummy__6->GetZaxis()->SetTitleFont(43);
   h_dummy__6->Draw("HIST");
   
   THStack * myStack= new THStack();
   myStack->SetName("");
   myStack->SetTitle("");
   
   TH1F *_stack_1 = new TH1F("_stack_1","",9,200,2000);
   _stack_1->SetMinimum(0);
   _stack_1->SetMaximum(5922.749);
   _stack_1->SetDirectory(0);
   _stack_1->SetStats(0);
   _stack_1->SetLineWidth(2);
   _stack_1->SetMarkerStyle(20);
   _stack_1->SetMarkerSize(1.2);
   _stack_1->GetXaxis()->SetLabelFont(43);
   _stack_1->GetXaxis()->SetLabelSize(21);
   _stack_1->GetXaxis()->SetTitleSize(21);
   _stack_1->GetXaxis()->SetTitleOffset(1.4);
   _stack_1->GetXaxis()->SetTitleFont(43);
   _stack_1->GetYaxis()->SetLabelFont(43);
   _stack_1->GetYaxis()->SetLabelSize(21);
   _stack_1->GetYaxis()->SetTitleSize(21);
   _stack_1->GetYaxis()->SetTitleOffset(2.2);
   _stack_1->GetYaxis()->SetTitleFont(43);
   _stack_1->GetZaxis()->SetLabelFont(43);
   _stack_1->GetZaxis()->SetLabelSize(21);
   _stack_1->GetZaxis()->SetTitleSize(21);
   _stack_1->GetZaxis()->SetTitleOffset(1);
   _stack_1->GetZaxis()->SetTitleFont(43);
   myStack->SetHistogram(_stack_1);
   
   
   TH1D *val_ljets_ge8jge3b_HT_all_ttW_stack_1 = new TH1D("val_ljets_ge8jge3b_HT_all_ttW_stack_1","h",9,200,2000);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetBinContent(1,11.42558+0.004239386+0.04475286);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetBinContent(2,238.7316+0.5491239+7.288928);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetBinContent(3,386.0123+1.929508+29.58504);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetBinContent(4,288.9888+2.094368+33.5739);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetBinContent(5,173.0952+1.665998+23.96759);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetBinContent(6,92.14709+1.097911+14.04489);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetBinContent(7,54.3629+0.6636191+7.696417);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetBinContent(8,29.62709+0.4019141+4.026961);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetBinContent(9,38.32462+0.5901101+4.356645);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetBinError(1,1.143712);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetBinError(2,4.426982);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetBinError(3,4.604456);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetBinError(4,4.24492);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetBinError(5,3.288129);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetBinError(6,2.310354);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetBinError(7,1.748026);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetBinError(8,1.371814);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetBinError(9,1.529185);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetEntries(454838);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetDirectory(0);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetStats(0);

   ci = TColor::GetColor("#cccccc");
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetFillColor(ci);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetMarkerStyle(20);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->SetMarkerSize(1.2);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->GetXaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->GetXaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->GetXaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->GetXaxis()->SetTitleOffset(1.4);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->GetXaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->GetYaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->GetYaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->GetYaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->GetYaxis()->SetTitleOffset(2.2);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->GetYaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->GetZaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->GetZaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->GetZaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->GetZaxis()->SetTitleOffset(1);
   val_ljets_ge8jge3b_HT_all_ttW_stack_1->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_ljets_ge8jge3b_HT_all_ttW_stack_1,"");
   
   TH1D *val_ljets_ge8jge3b_HT_all_TTB_stack_2 = new TH1D("val_ljets_ge8jge3b_HT_all_TTB_stack_2","h",9,200,2000);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetBinContent(1,116.171);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetBinContent(2,2384.271);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetBinContent(3,3003.582);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetBinContent(4,1828.806);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetBinContent(5,939.3083);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetBinContent(6,459.5416);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetBinContent(7,216.9696);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetBinContent(8,104.4546);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetBinContent(9,102.593);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetBinError(1,1.658719);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetBinError(2,6.75323);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetBinError(3,6.906148);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetBinError(4,5.079403);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetBinError(5,3.838483);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetBinError(6,2.645609);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetBinError(7,1.57595);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetBinError(8,0.8893612);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetBinError(9,0.8311199);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetEntries(1233447);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetDirectory(0);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetStats(0);

   ci = TColor::GetColor("#6666cc");
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetFillColor(ci);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetMarkerStyle(20);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->SetMarkerSize(1.2);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->GetXaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->GetXaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->GetXaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->GetXaxis()->SetTitleOffset(1.4);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->GetXaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->GetYaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->GetYaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->GetYaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->GetYaxis()->SetTitleOffset(2.2);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->GetYaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->GetZaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->GetZaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->GetZaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->GetZaxis()->SetTitleOffset(1);
   val_ljets_ge8jge3b_HT_all_TTB_stack_2->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_ljets_ge8jge3b_HT_all_TTB_stack_2,"");
   
   TH1D *val_ljets_ge8jge3b_HT_all_TTC_stack_3 = new TH1D("val_ljets_ge8jge3b_HT_all_TTC_stack_3","h",9,200,2000);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetBinContent(1,72.55681);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetBinContent(2,1323.995);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetBinContent(3,1499.199);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetBinContent(4,879.0409);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetBinContent(5,437.8515);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetBinContent(6,205.3004);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetBinContent(7,98.9531);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetBinContent(8,45.21101);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetBinContent(9,43.78408);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetBinError(1,2.993882);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetBinError(2,10.80295);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetBinError(3,10.54173);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetBinError(4,7.469968);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetBinError(5,3.723684);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetBinError(6,2.132053);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetBinError(7,1.31521);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetBinError(8,0.6929587);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetBinError(9,0.6460267);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetEntries(277152);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetDirectory(0);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetStats(0);

   ci = TColor::GetColor("#ccccff");
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetFillColor(ci);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetMarkerStyle(20);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->SetMarkerSize(1.2);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->GetXaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->GetXaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->GetXaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->GetXaxis()->SetTitleOffset(1.4);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->GetXaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->GetYaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->GetYaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->GetYaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->GetYaxis()->SetTitleOffset(2.2);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->GetYaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->GetZaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->GetZaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->GetZaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->GetZaxis()->SetTitleOffset(1);
   val_ljets_ge8jge3b_HT_all_TTC_stack_3->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_ljets_ge8jge3b_HT_all_TTC_stack_3,"");
   
   TH1D *val_ljets_ge8jge3b_HT_all_TTL_stack_4 = new TH1D("val_ljets_ge8jge3b_HT_all_TTL_stack_4","h",9,200,2000);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetBinContent(1,51.11294);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetBinContent(2,693.5974);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetBinContent(3,680.0783);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetBinContent(4,351.9702);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetBinContent(5,166.9807);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetBinContent(6,73.70383);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetBinContent(7,33.2194);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetBinContent(8,14.68717);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetBinContent(9,12.83058);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetBinError(1,2.682937);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetBinError(2,9.419607);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetBinError(3,9.7606);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetBinError(4,6.91362);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetBinError(5,2.745826);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetBinError(6,0.9520468);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetBinError(7,0.5414253);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetBinError(8,0.2853399);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetBinError(9,0.2817531);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetEntries(96065);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetDirectory(0);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetStats(0);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetMarkerStyle(20);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->SetMarkerSize(1.2);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->GetXaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->GetXaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->GetXaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->GetXaxis()->SetTitleOffset(1.4);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->GetXaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->GetYaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->GetYaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->GetYaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->GetYaxis()->SetTitleOffset(2.2);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->GetYaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->GetZaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->GetZaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->GetZaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->GetZaxis()->SetTitleOffset(1);
   val_ljets_ge8jge3b_HT_all_TTL_stack_4->GetZaxis()->SetTitleFont(43);
   myStack->Add(val_ljets_ge8jge3b_HT_all_TTL_stack_4,"");
   

   
   myStack->Draw("hist same");
   
   Double_t g_totErr_fx3003[9] = {
   300,
   500,
   700,
   900,
   1100,
   1300,
   1500,
   1700,
   1900};
   Double_t g_totErr_fy3003[9] = {
   251.315,
   4648.43,
   5600.39,
   3384.47,
   1742.87,
   845.836,
   411.865,
   198.409,
   202.479};
   Double_t g_totErr_felx3003[9] = {
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100};
   Double_t g_totErr_fely3003[9] = {
   94.82468,
   1741.626,
   2050.218,
   1204.95,
   607.9037,
   294.7195,
   141.6548,
   69.03777,
   71.7271};
   Double_t g_totErr_fehx3003[9] = {
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100,
   100};
   Double_t g_totErr_fehy3003[9] = {
   94.82468,
   1741.626,
   2050.218,
   1204.95,
   607.9037,
   294.7195,
   141.6548,
   69.03777,
   71.7271};
   grae = new TGraphAsymmErrors(9,g_totErr_fx3003,g_totErr_fy3003,g_totErr_felx3003,g_totErr_fehx3003,g_totErr_fely3003,g_totErr_fehy3003);
   grae->SetName("g_totErr");
   grae->SetTitle("h");

   ci = TColor::GetColor("#6666ff");
   grae->SetFillColor(ci);
   grae->SetFillStyle(3354);
   grae->SetLineColor(0);
   grae->SetLineWidth(0);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(0);
   
   TH1F *Graph_g_totErr3003 = new TH1F("Graph_g_totErr3003","h",100,20,2180);
   Graph_g_totErr3003->SetMinimum(118.6453);
   Graph_g_totErr3003->SetMaximum(8446.842);
   Graph_g_totErr3003->SetDirectory(0);
   Graph_g_totErr3003->SetStats(0);
   Graph_g_totErr3003->SetLineWidth(2);
   Graph_g_totErr3003->SetMarkerStyle(20);
   Graph_g_totErr3003->SetMarkerSize(1.2);
   Graph_g_totErr3003->GetXaxis()->SetLabelFont(43);
   Graph_g_totErr3003->GetXaxis()->SetLabelSize(21);
   Graph_g_totErr3003->GetXaxis()->SetTitleSize(21);
   Graph_g_totErr3003->GetXaxis()->SetTitleOffset(1.4);
   Graph_g_totErr3003->GetXaxis()->SetTitleFont(43);
   Graph_g_totErr3003->GetYaxis()->SetLabelFont(43);
   Graph_g_totErr3003->GetYaxis()->SetLabelSize(21);
   Graph_g_totErr3003->GetYaxis()->SetTitleSize(21);
   Graph_g_totErr3003->GetYaxis()->SetTitleOffset(2.2);
   Graph_g_totErr3003->GetYaxis()->SetTitleFont(43);
   Graph_g_totErr3003->GetZaxis()->SetLabelFont(43);
   Graph_g_totErr3003->GetZaxis()->SetLabelSize(21);
   Graph_g_totErr3003->GetZaxis()->SetTitleSize(21);
   Graph_g_totErr3003->GetZaxis()->SetTitleOffset(1);
   Graph_g_totErr3003->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_g_totErr3003);
   
   grae->Draw("e2");
   
   TH1D *val_ljets_ge8jge3b_HT_all_BSMtttt400__7 = new TH1D("val_ljets_ge8jge3b_HT_all_BSMtttt400__7","h",9,200,2000);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->SetBinContent(1,167.463);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->SetBinContent(2,3468.46);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->SetBinContent(3,4712.87);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->SetBinContent(4,3059.21);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->SetBinContent(5,1674.30);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->SetBinContent(6,863.881);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->SetBinContent(7,445.512);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->SetBinContent(8,226.522);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->SetBinContent(9,249.375);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->SetEntries(41085);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->SetDirectory(0);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->SetStats(0);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->SetFillStyle(0);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->SetLineColor(2);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->SetLineStyle(2);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->SetLineWidth(2);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->SetMarkerStyle(20);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->SetMarkerSize(1.2);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->GetXaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->GetXaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->GetXaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->GetXaxis()->SetTitleOffset(1.4);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->GetXaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->GetYaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->GetYaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->GetYaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->GetYaxis()->SetTitleOffset(2.2);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->GetYaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->GetZaxis()->SetLabelFont(43);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->GetZaxis()->SetLabelSize(21);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->GetZaxis()->SetTitleSize(21);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->GetZaxis()->SetTitleOffset(1);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->GetZaxis()->SetTitleFont(43);
   val_ljets_ge8jge3b_HT_all_BSMtttt400__7->Draw("HISTsame");
   
   Double_t Graph_from_val_ljets_ge8jge3b_HT_all_data_fx3004[9] = {
   300,
   500,
   700,
   900,
   1100,
   1300,
   1500,
   1700,
   1900};
   Double_t Graph_from_val_ljets_ge8jge3b_HT_all_data_fy3004[9] = {
   299,
   4687,
   5800,
   3624,
   1812,
   902,
   418,
   221,
   236};
   Double_t Graph_from_val_ljets_ge8jge3b_HT_all_data_felx3004[9] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_val_ljets_ge8jge3b_HT_all_data_fely3004[9] = {
   17.29162,
   68.46167,
   76.15773,
   60.19967,
   42.56759,
   30.03331,
   20.44505,
   14.86607,
   15.36229};
   Double_t Graph_from_val_ljets_ge8jge3b_HT_all_data_fehx3004[9] = {
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_val_ljets_ge8jge3b_HT_all_data_fehy3004[9] = {
   17.29162,
   68.46167,
   76.15773,
   60.19967,
   42.56759,
   30.03331,
   20.44505,
   14.86607,
   15.36229};
   grae = new TGraphAsymmErrors(9,Graph_from_val_ljets_ge8jge3b_HT_all_data_fx3004,Graph_from_val_ljets_ge8jge3b_HT_all_data_fy3004,Graph_from_val_ljets_ge8jge3b_HT_all_data_felx3004,Graph_from_val_ljets_ge8jge3b_HT_all_data_fehx3004,Graph_from_val_ljets_ge8jge3b_HT_all_data_fely3004,Graph_from_val_ljets_ge8jge3b_HT_all_data_fehy3004);
   grae->SetName("Graph_from_val_ljets_ge8jge3b_HT_all_data");
   grae->SetTitle("h");
   grae->SetLineWidth(2);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(1.4);
   
   TH1F *Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004 = new TH1F("Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004","h",100,20.22,2179.98);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->SetMinimum(185.5205);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->SetMaximum(6443.16);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->SetDirectory(0);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->SetStats(0);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->SetLineWidth(2);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->SetMarkerStyle(20);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->SetMarkerSize(1.2);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->GetXaxis()->SetLabelFont(43);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->GetXaxis()->SetLabelSize(21);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->GetXaxis()->SetTitleSize(21);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->GetXaxis()->SetTitleFont(43);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->GetYaxis()->SetLabelFont(43);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->GetYaxis()->SetLabelSize(21);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->GetYaxis()->SetTitleSize(21);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->GetYaxis()->SetTitleOffset(2.2);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->GetYaxis()->SetTitleFont(43);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->GetZaxis()->SetLabelFont(43);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->GetZaxis()->SetLabelSize(21);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->GetZaxis()->SetTitleSize(21);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_from_val_ljets_ge8jge3b_HT_all_data3004);
   
   grae->Draw("PZ");
   
   TH1D *h_blind__9 = new TH1D("h_blind__9","h",9,200,2000);
   h_blind__9->SetBinError(1,517304.8);
   h_blind__9->SetBinError(2,2048134);
   h_blind__9->SetBinError(3,2278374);
   h_blind__9->SetBinError(4,1800964);
   h_blind__9->SetBinError(5,1273474);
   h_blind__9->SetBinError(6,898492);
   h_blind__9->SetBinError(7,611644.5);
   h_blind__9->SetBinError(8,444740.9);
   h_blind__9->SetBinError(9,459586.2);
   h_blind__9->SetEntries(36068);
   h_blind__9->SetDirectory(0);
   h_blind__9->SetStats(0);

   ci = TColor::GetColor("#cccccc");
   h_blind__9->SetFillColor(ci);
   h_blind__9->SetFillStyle(3345);

   ci = TColor::GetColor("#cccccc");
   h_blind__9->SetLineColor(ci);
   h_blind__9->SetLineWidth(0);
   h_blind__9->SetMarkerStyle(20);
   h_blind__9->SetMarkerSize(1.2);
   h_blind__9->GetXaxis()->SetLabelFont(43);
   h_blind__9->GetXaxis()->SetLabelSize(21);
   h_blind__9->GetXaxis()->SetTitleSize(21);
   h_blind__9->GetXaxis()->SetTitleOffset(1.4);
   h_blind__9->GetXaxis()->SetTitleFont(43);
   h_blind__9->GetYaxis()->SetLabelFont(43);
   h_blind__9->GetYaxis()->SetLabelSize(21);
   h_blind__9->GetYaxis()->SetTitleSize(21);
   h_blind__9->GetYaxis()->SetTitleOffset(2.2);
   h_blind__9->GetYaxis()->SetTitleFont(43);
   h_blind__9->GetZaxis()->SetLabelFont(43);
   h_blind__9->GetZaxis()->SetLabelSize(21);
   h_blind__9->GetZaxis()->SetTitleSize(21);
   h_blind__9->GetZaxis()->SetTitleOffset(1);
   h_blind__9->GetZaxis()->SetTitleFont(43);
   h_blind__9->Draw("same HIST");
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
   leg->SetLineColor(0);
   leg->SetLineStyle(1);
   leg->SetLineWidth(1);
   leg->SetFillColor(0);
   leg->SetFillStyle(0);
   TLegendEntry *entry=leg->AddEntry("val_ljets_ge8jge3b_HT_all_data","Data","ep");

   entry->SetFillColor(62);
   entry->SetFillStyle(1001);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(20);
   entry->SetMarkerSize(1.4);
   entry->SetTextFont(43);
   entry=leg->AddEntry("val_ljets_ge8jge3b_HT_all_TTL_stack_4","t#bar{t}+light","f");
   entry->SetFillStyle(1001);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   entry=leg->AddEntry("val_ljets_ge8jge3b_HT_all_TTC_stack_3","t#bar{t}+#geq1c","f");

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
   entry=leg->AddEntry("val_ljets_ge8jge3b_HT_all_TTB_stack_2","t#bar{t}+#geq1b","f");

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
   entry=leg->AddEntry("val_ljets_ge8jge3b_HT_all_ttW_stack_1","Others","f");

   ci = TColor::GetColor("#cccccc");
   entry->SetFillColor(ci);
   entry->SetFillStyle(1001);

   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(2);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(20);
   entry->SetMarkerSize(1.4);
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
   entry=leg->AddEntry("val_ljets_ge8jge3b_HT_all_BSMtttt400__7","Bkg. before corr.","l");
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   leg->Draw();
   
   
   TH1D *h_dummy_copy__10 = new TH1D("h_dummy_copy__10","h",9,200,2000);
   h_dummy_copy__10->SetMinimum(0);
   h_dummy_copy__10->SetMaximum(10577.08);
   h_dummy_copy__10->SetEntries(3310481);
   h_dummy_copy__10->SetDirectory(0);
   h_dummy_copy__10->SetStats(0);
   h_dummy_copy__10->SetFillColor(2);
   h_dummy_copy__10->SetLineColor(2);
   h_dummy_copy__10->SetMarkerStyle(20);
   h_dummy_copy__10->SetMarkerSize(1.2);
   h_dummy_copy__10->GetXaxis()->SetLabelFont(43);
   h_dummy_copy__10->GetXaxis()->SetLabelSize(0);
   h_dummy_copy__10->GetXaxis()->SetTitleSize(21);
   h_dummy_copy__10->GetXaxis()->SetTitleOffset(2);
   h_dummy_copy__10->GetXaxis()->SetTitleFont(43);
   h_dummy_copy__10->GetYaxis()->SetTitle("Events");
   h_dummy_copy__10->GetYaxis()->SetLabelFont(43);
   h_dummy_copy__10->GetYaxis()->SetLabelSize(21);
   h_dummy_copy__10->GetYaxis()->SetTitleSize(21);
   h_dummy_copy__10->GetYaxis()->SetTitleOffset(2.255033);
   h_dummy_copy__10->GetYaxis()->SetTitleFont(43);
   h_dummy_copy__10->GetZaxis()->SetLabelFont(43);
   h_dummy_copy__10->GetZaxis()->SetLabelSize(21);
   h_dummy_copy__10->GetZaxis()->SetTitleSize(21);
   h_dummy_copy__10->GetZaxis()->SetTitleOffset(1);
   h_dummy_copy__10->GetZaxis()->SetTitleFont(43);
   h_dummy_copy__10->Draw("sameaxis");
   pad->Modified();
   c1_n13->cd();
   c1_n13->Modified();
   c1_n13->cd();
   c1_n13->SetSelected(c1_n13);

   c1_n13->SaveAs("val_ljets_ge8jge3b_HT_all.pdf");
}
