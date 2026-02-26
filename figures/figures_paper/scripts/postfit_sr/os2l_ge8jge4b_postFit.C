void os2l_ge8jge4b_postFit()
{
//=========Macro generated from canvas: c1_n18/
//=========  (Mon Feb 19 22:00:07 2024) by ROOT version 6.24/06
   TCanvas *c1_n18 = new TCanvas("c1_n18", "",0,0,600,700);
   gStyle->SetOptStat(0);
   gStyle->SetOptTitle(0);
   c1_n18->SetHighLightColor(2);
   c1_n18->Range(0,0,1,1);
   c1_n18->SetFillColor(0);
   c1_n18->SetBorderMode(0);
   c1_n18->SetBorderSize(2);
   c1_n18->SetTickx(1);
   c1_n18->SetTicky(1);
   c1_n18->SetLeftMargin(0.16);
   c1_n18->SetRightMargin(0.05);
   c1_n18->SetTopMargin(0.05);
   c1_n18->SetBottomMargin(0.16);
   c1_n18->SetFrameBorderMode(0);
  
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
   Double_t xAxis121[5] = {0, 0.4607, 0.7272, 0.8897, 1}; 
   
   TH1D *h_dummy2__88 = new TH1D("h_dummy2__88","h",4, xAxis121);
   h_dummy2__88->SetMinimum(0.5);
   h_dummy2__88->SetMaximum(1.499);
   h_dummy2__88->SetEntries(84331);
   h_dummy2__88->SetDirectory(0);
   h_dummy2__88->SetStats(0);
   h_dummy2__88->SetFillColor(2);
   h_dummy2__88->SetLineColor(2);
   h_dummy2__88->SetMarkerStyle(20);
   h_dummy2__88->SetMarkerSize(1.2);
   h_dummy2__88->GetXaxis()->SetTitle("GNN Score");
   h_dummy2__88->GetXaxis()->SetLabelFont(43);
   h_dummy2__88->GetXaxis()->SetLabelOffset(0.025);
   h_dummy2__88->GetXaxis()->SetLabelSize(21);
   h_dummy2__88->GetXaxis()->SetTitleSize(21);
   h_dummy2__88->GetXaxis()->SetTitleOffset(5);
   h_dummy2__88->GetXaxis()->SetTitleFont(43);
   h_dummy2__88->GetYaxis()->SetTitle("Data / Pred.  ");
   // h_dummy2__88->GetYaxis()->SetNdivisions(-504);
   h_dummy2__88->GetYaxis()->SetLabelFont(43);
   h_dummy2__88->GetYaxis()->SetLabelSize(21);
   h_dummy2__88->GetYaxis()->SetTitleSize(21);
   h_dummy2__88->GetYaxis()->SetTitleOffset(2.1);
   h_dummy2__88->GetYaxis()->SetTitleFont(43);
   h_dummy2__88->GetYaxis()->SetNdivisions(504);
   h_dummy2__88->GetZaxis()->SetLabelFont(43);
   h_dummy2__88->GetZaxis()->SetLabelSize(21);
   h_dummy2__88->GetZaxis()->SetTitleSize(21);
   h_dummy2__88->GetZaxis()->SetTitleOffset(1);
   h_dummy2__88->GetZaxis()->SetTitleFont(43);
   h_dummy2__88->Draw("HIST");
   TLine *line = new TLine(0,1,1,1);
   line->SetLineStyle(2);
   line->SetLineWidth(2);
   line->Draw();
   
   Double_t g_ratio2_fx3033[4] = {
   0.23035,
   0.59395,
   0.80845,
   0.94485};
   Double_t g_ratio2_fy3033[4] = {
   1,
   1,
   1,
   1};
   Double_t g_ratio2_felx3033[4] = {
   0.23035,
   0.13325,
   0.08125,
   0.05515};
   Double_t g_ratio2_fely3033[4] = {
   0.09003003,
   0.07552754,
   0.08908645,
   0.1752937};
   Double_t g_ratio2_fehx3033[4] = {
   0.23035,
   0.13325,
   0.08125,
   0.05515};
   Double_t g_ratio2_fehy3033[4] = {
   0.09003003,
   0.07552754,
   0.08908645,
   0.1752937};
   TGraphAsymmErrors *grae = new TGraphAsymmErrors(4,g_ratio2_fx3033,g_ratio2_fy3033,g_ratio2_felx3033,g_ratio2_fehx3033,g_ratio2_fely3033,g_ratio2_fehy3033);
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
   
   TH1F *Graph_g_ratio23033 = new TH1F("Graph_g_ratio23033","h",100,0,1.1);
   Graph_g_ratio23033->SetMinimum(0.7896475);
   Graph_g_ratio23033->SetMaximum(1.210352);
   Graph_g_ratio23033->SetDirectory(0);
   Graph_g_ratio23033->SetStats(0);
   Graph_g_ratio23033->SetLineWidth(2);
   Graph_g_ratio23033->SetMarkerStyle(20);
   Graph_g_ratio23033->SetMarkerSize(1.2);
   Graph_g_ratio23033->GetXaxis()->SetLabelFont(43);
   Graph_g_ratio23033->GetXaxis()->SetLabelSize(21);
   Graph_g_ratio23033->GetXaxis()->SetTitleSize(21);
   Graph_g_ratio23033->GetXaxis()->SetTitleOffset(1.4);
   Graph_g_ratio23033->GetXaxis()->SetTitleFont(43);
   Graph_g_ratio23033->GetYaxis()->SetLabelFont(43);
   Graph_g_ratio23033->GetYaxis()->SetLabelSize(21);
   Graph_g_ratio23033->GetYaxis()->SetTitleSize(21);
   Graph_g_ratio23033->GetYaxis()->SetTitleOffset(1.4);
   Graph_g_ratio23033->GetYaxis()->SetTitleFont(43);
   Graph_g_ratio23033->GetZaxis()->SetLabelFont(43);
   Graph_g_ratio23033->GetZaxis()->SetLabelSize(21);
   Graph_g_ratio23033->GetZaxis()->SetTitleSize(21);
   Graph_g_ratio23033->GetZaxis()->SetTitleOffset(1);
   Graph_g_ratio23033->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_g_ratio23033);
   
   grae->Draw("e2");
   
   Double_t Graph_from_h_ratio_fx3034[4] = {
   0.23035,
   0.59395,
   0.80845,
   0.94485};
   Double_t Graph_from_h_ratio_fy3034[4] = {
   0.8741953,
   0.9515228,
   1.208958,
   0.8089567};
   Double_t Graph_from_h_ratio_felx3034[4] = {
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fely3034[4] = {
   0.1545374,
   0.186609,
   0.2703311,
   0.2860094};
   Double_t Graph_from_h_ratio_fehx3034[4] = {
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_h_ratio_fehy3034[4] = {
   0.1545374,
   0.186609,
   0.2703311,
   0.2860094};
   grae = new TGraphAsymmErrors(4,Graph_from_h_ratio_fx3034,Graph_from_h_ratio_fy3034,Graph_from_h_ratio_felx3034,Graph_from_h_ratio_fehx3034,Graph_from_h_ratio_fely3034,Graph_from_h_ratio_fehy3034);
   grae->SetName("Graph_from_h_ratio");
   grae->SetTitle("h");
   grae->SetLineWidth(2);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(1.4);
   
   TH1F *Graph_Graph_from_h_ratio3034 = new TH1F("Graph_Graph_from_h_ratio3034","h",100,0,1.099954);
   Graph_Graph_from_h_ratio3034->SetMinimum(0.4273132);
   Graph_Graph_from_h_ratio3034->SetMaximum(1.574923);
   Graph_Graph_from_h_ratio3034->SetDirectory(0);
   Graph_Graph_from_h_ratio3034->SetStats(0);
   Graph_Graph_from_h_ratio3034->SetLineWidth(2);
   Graph_Graph_from_h_ratio3034->SetMarkerStyle(20);
   Graph_Graph_from_h_ratio3034->SetMarkerSize(1.2);
   Graph_Graph_from_h_ratio3034->GetXaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3034->GetXaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3034->GetXaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3034->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_h_ratio3034->GetXaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio3034->GetYaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3034->GetYaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3034->GetYaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3034->GetYaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_h_ratio3034->GetYaxis()->SetTitleFont(43);
   Graph_Graph_from_h_ratio3034->GetZaxis()->SetLabelFont(43);
   Graph_Graph_from_h_ratio3034->GetZaxis()->SetLabelSize(21);
   Graph_Graph_from_h_ratio3034->GetZaxis()->SetTitleSize(21);
   Graph_Graph_from_h_ratio3034->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_from_h_ratio3034->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_from_h_ratio3034);
   
   grae->Draw("PZ");
   Double_t xAxis122[5] = {0, 0.4607, 0.7272, 0.8897, 1}; 
   
   TH1D *h_blindratio__89 = new TH1D("h_blindratio__89","h",4, xAxis122);
   h_blindratio__89->SetBinError(1,32);
   h_blindratio__89->SetBinError(2,28.84441);
   h_blindratio__89->SetBinError(3,25.29822);
   h_blindratio__89->SetBinError(4,16);
   h_blindratio__89->SetEntries(200);
   h_blindratio__89->SetDirectory(0);
   h_blindratio__89->SetStats(0);

   ci = TColor::GetColor("#cccccc");
   h_blindratio__89->SetFillColor(ci);
   h_blindratio__89->SetFillStyle(3345);

   ci = TColor::GetColor("#cccccc");
   h_blindratio__89->SetLineColor(ci);
   h_blindratio__89->SetLineWidth(0);
   h_blindratio__89->SetMarkerStyle(20);
   h_blindratio__89->SetMarkerSize(1.2);
   h_blindratio__89->GetXaxis()->SetLabelFont(43);
   h_blindratio__89->GetXaxis()->SetLabelSize(21);
   h_blindratio__89->GetXaxis()->SetTitleSize(21);
   h_blindratio__89->GetXaxis()->SetTitleOffset(1.4);
   h_blindratio__89->GetXaxis()->SetTitleFont(43);
   h_blindratio__89->GetYaxis()->SetLabelFont(43);
   h_blindratio__89->GetYaxis()->SetLabelSize(21);
   h_blindratio__89->GetYaxis()->SetTitleSize(21);
   h_blindratio__89->GetYaxis()->SetTitleOffset(1.4);
   h_blindratio__89->GetYaxis()->SetTitleFont(43);
   h_blindratio__89->GetZaxis()->SetLabelFont(43);
   h_blindratio__89->GetZaxis()->SetLabelSize(21);
   h_blindratio__89->GetZaxis()->SetTitleSize(21);
   h_blindratio__89->GetZaxis()->SetTitleOffset(1);
   h_blindratio__89->GetZaxis()->SetTitleFont(43);
   h_blindratio__89->Draw("HIST same");
   Double_t xAxis123[5] = {0, 0.4607, 0.7272, 0.8897, 1}; 
   
   TH1D *h_dummy2_copy__90 = new TH1D("h_dummy2_copy__90","h",4, xAxis123);
   h_dummy2_copy__90->SetMinimum(0.5);
   h_dummy2_copy__90->SetMaximum(1.5);
   h_dummy2_copy__90->SetEntries(84331);
   h_dummy2_copy__90->SetDirectory(0);
   h_dummy2_copy__90->SetStats(0);
   h_dummy2_copy__90->SetFillColor(2);
   h_dummy2_copy__90->SetLineColor(2);
   h_dummy2_copy__90->SetMarkerStyle(20);
   h_dummy2_copy__90->SetMarkerSize(1.2);
   h_dummy2_copy__90->GetXaxis()->SetTitle("GNN Score");
   h_dummy2_copy__90->GetXaxis()->SetLabelFont(43);
   h_dummy2_copy__90->GetXaxis()->SetLabelOffset(0.025);
   h_dummy2_copy__90->GetXaxis()->SetLabelSize(21);
   h_dummy2_copy__90->GetXaxis()->SetTitleSize(21);
   h_dummy2_copy__90->GetXaxis()->SetTitleOffset(5);
   h_dummy2_copy__90->GetXaxis()->SetTitleFont(43);
   h_dummy2_copy__90->GetYaxis()->SetTitle("Data / Pred.");
   h_dummy2_copy__90->GetYaxis()->SetNdivisions(-504);
   h_dummy2_copy__90->GetYaxis()->SetLabelFont(43);
   h_dummy2_copy__90->GetYaxis()->SetLabelSize(21);
   h_dummy2_copy__90->GetYaxis()->SetTitleSize(21);
   h_dummy2_copy__90->GetYaxis()->SetTitleOffset(2.255033);
   h_dummy2_copy__90->GetYaxis()->SetTitleFont(43);
   h_dummy2_copy__90->GetZaxis()->SetLabelFont(43);
   h_dummy2_copy__90->GetZaxis()->SetLabelSize(21);
   h_dummy2_copy__90->GetZaxis()->SetTitleSize(21);
   h_dummy2_copy__90->GetZaxis()->SetTitleOffset(1);
   h_dummy2_copy__90->GetZaxis()->SetTitleFont(43);
   h_dummy2_copy__90->Draw("sameaxis");
//    TLatex *   tex = new TLatex(0.15,0.9,"   #chi^{2}/ndf = 1.5 / 4  #chi^{2}prob = 0.82");
// tex->SetNDC();
//    tex->SetTextFont(42);
//    tex->SetTextSize(0.1);
//    tex->SetLineWidth(2);
//    tex->Draw();
   pad->Modified();
   c1_n18->cd();
  
// ------------>Primitives in pad: 
   TPad *pad1 = new TPad("", "",0,0.2,1,1);
   pad1->Draw();
   pad1->cd();
   pad1->Range(-0.1728395,-7.974393,1.061728,71.76953);
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
   Double_t xAxis124[5] = {0, 0.4607, 0.7272, 0.8897, 1}; 
   
   TH1D *h_dummy__91 = new TH1D("h_dummy__91","h",4, xAxis124);
   h_dummy__91->SetMinimum(0);
   h_dummy__91->SetMaximum(90);
   h_dummy__91->SetEntries(84331);
   h_dummy__91->SetDirectory(0);
   h_dummy__91->SetStats(0);
   h_dummy__91->SetFillColor(2);
   h_dummy__91->SetLineColor(2);
   h_dummy__91->SetMarkerStyle(20);
   h_dummy__91->SetMarkerSize(1.2);
   h_dummy__91->GetXaxis()->SetLabelFont(43);
   h_dummy__91->GetXaxis()->SetLabelSize(0);
   h_dummy__91->GetXaxis()->SetTitleSize(21);
   h_dummy__91->GetXaxis()->SetTitleOffset(2);
   h_dummy__91->GetXaxis()->SetTitleFont(43);
   h_dummy__91->GetYaxis()->SetTitle("Events");
   h_dummy__91->GetYaxis()->SetLabelFont(43);
   h_dummy__91->GetYaxis()->SetLabelSize(21);
   h_dummy__91->GetYaxis()->SetTitleSize(21);
   h_dummy__91->GetYaxis()->SetTitleOffset(2.1);
   h_dummy__91->GetYaxis()->SetTitleFont(43);
   h_dummy__91->GetZaxis()->SetLabelFont(43);
   h_dummy__91->GetZaxis()->SetLabelSize(21);
   h_dummy__91->GetZaxis()->SetTitleSize(21);
   h_dummy__91->GetZaxis()->SetTitleOffset(1);
   h_dummy__91->GetZaxis()->SetTitleFont(43);
   h_dummy__91->Draw("HIST");
   
   THStack *__stack__ = new THStack();
   __stack__->SetName("");
   __stack__->SetTitle("");
   Double_t xAxis125[5] = {0, 0.4607, 0.7272, 0.8897, 1}; 
   
   TH1F *_stack_9 = new TH1F("_stack_9","",4, xAxis125);
   _stack_9->SetMinimum(0);
   _stack_9->SetMaximum(38.43535);
   _stack_9->SetDirectory(0);
   _stack_9->SetStats(0);
   _stack_9->SetLineWidth(2);
   _stack_9->SetMarkerStyle(20);
   _stack_9->SetMarkerSize(1.2);
   _stack_9->GetXaxis()->SetLabelFont(43);
   _stack_9->GetXaxis()->SetLabelSize(21);
   _stack_9->GetXaxis()->SetTitleSize(21);
   _stack_9->GetXaxis()->SetTitleOffset(1.4);
   _stack_9->GetXaxis()->SetTitleFont(43);
   _stack_9->GetYaxis()->SetLabelFont(43);
   _stack_9->GetYaxis()->SetLabelSize(21);
   _stack_9->GetYaxis()->SetTitleSize(21);
   _stack_9->GetYaxis()->SetTitleOffset(1.4);
   _stack_9->GetYaxis()->SetTitleFont(43);
   _stack_9->GetZaxis()->SetLabelFont(43);
   _stack_9->GetZaxis()->SetLabelSize(21);
   _stack_9->GetZaxis()->SetTitleSize(21);
   _stack_9->GetZaxis()->SetTitleOffset(1);
   _stack_9->GetZaxis()->SetTitleFont(43);
   __stack__->SetHistogram(_stack_9);
   
   Double_t xAxis129[5] = {0, 0.4607, 0.7272, 0.8897, 1}; 
   
   TH1D *os2l_ge8jge4b_ttt_stack_4 = new TH1D("os2l_ge8jge4b_ttt_stack_4","h",4, xAxis129);
   os2l_ge8jge4b_ttt_stack_4->SetBinContent(1,2.922513);
   os2l_ge8jge4b_ttt_stack_4->SetBinContent(2,2.50444);
   os2l_ge8jge4b_ttt_stack_4->SetBinContent(3,1.79421);
   os2l_ge8jge4b_ttt_stack_4->SetBinContent(4,0.7361241);
   os2l_ge8jge4b_ttt_stack_4->SetEntries(14291);
   os2l_ge8jge4b_ttt_stack_4->SetDirectory(0);
   os2l_ge8jge4b_ttt_stack_4->SetStats(0);
   os2l_ge8jge4b_ttt_stack_4->SetFillColor(kGray);
   os2l_ge8jge4b_ttt_stack_4->SetMarkerStyle(20);
   os2l_ge8jge4b_ttt_stack_4->SetMarkerSize(1.2);
   os2l_ge8jge4b_ttt_stack_4->GetXaxis()->SetLabelFont(43);
   os2l_ge8jge4b_ttt_stack_4->GetXaxis()->SetLabelSize(21);
   os2l_ge8jge4b_ttt_stack_4->GetXaxis()->SetTitleSize(21);
   os2l_ge8jge4b_ttt_stack_4->GetXaxis()->SetTitleOffset(1.4);
   os2l_ge8jge4b_ttt_stack_4->GetXaxis()->SetTitleFont(43);
   os2l_ge8jge4b_ttt_stack_4->GetYaxis()->SetLabelFont(43);
   os2l_ge8jge4b_ttt_stack_4->GetYaxis()->SetLabelSize(21);
   os2l_ge8jge4b_ttt_stack_4->GetYaxis()->SetTitleSize(21);
   os2l_ge8jge4b_ttt_stack_4->GetYaxis()->SetTitleOffset(1.4);
   os2l_ge8jge4b_ttt_stack_4->GetYaxis()->SetTitleFont(43);
   os2l_ge8jge4b_ttt_stack_4->GetZaxis()->SetLabelFont(43);
   os2l_ge8jge4b_ttt_stack_4->GetZaxis()->SetLabelSize(21);
   os2l_ge8jge4b_ttt_stack_4->GetZaxis()->SetTitleSize(21);
   os2l_ge8jge4b_ttt_stack_4->GetZaxis()->SetTitleOffset(1);
   os2l_ge8jge4b_ttt_stack_4->GetZaxis()->SetTitleFont(43);
   __stack__->Add(os2l_ge8jge4b_ttt_stack_4,"");
   Double_t xAxis126[5] = {0, 0.4607, 0.7272, 0.8897, 1}; 
   
   TH1D *os2l_ge8jge4b_TTB_stack_1 = new TH1D("os2l_ge8jge4b_TTB_stack_1","h",4, xAxis126);
   os2l_ge8jge4b_TTB_stack_1->SetBinContent(1,30.69803);
   os2l_ge8jge4b_TTB_stack_1->SetBinContent(2,20.79294);
   os2l_ge8jge4b_TTB_stack_1->SetBinContent(3,9.691281);
   os2l_ge8jge4b_TTB_stack_1->SetBinContent(4,3.584663);
   os2l_ge8jge4b_TTB_stack_1->SetEntries(8981);
   os2l_ge8jge4b_TTB_stack_1->SetDirectory(0);
   os2l_ge8jge4b_TTB_stack_1->SetStats(0);

   ci = TColor::GetColor("#6666cc");
   os2l_ge8jge4b_TTB_stack_1->SetFillColor(ci);
   os2l_ge8jge4b_TTB_stack_1->SetMarkerStyle(20);
   os2l_ge8jge4b_TTB_stack_1->SetMarkerSize(1.2);
   os2l_ge8jge4b_TTB_stack_1->GetXaxis()->SetLabelFont(43);
   os2l_ge8jge4b_TTB_stack_1->GetXaxis()->SetLabelSize(21);
   os2l_ge8jge4b_TTB_stack_1->GetXaxis()->SetTitleSize(21);
   os2l_ge8jge4b_TTB_stack_1->GetXaxis()->SetTitleOffset(1.4);
   os2l_ge8jge4b_TTB_stack_1->GetXaxis()->SetTitleFont(43);
   os2l_ge8jge4b_TTB_stack_1->GetYaxis()->SetLabelFont(43);
   os2l_ge8jge4b_TTB_stack_1->GetYaxis()->SetLabelSize(21);
   os2l_ge8jge4b_TTB_stack_1->GetYaxis()->SetTitleSize(21);
   os2l_ge8jge4b_TTB_stack_1->GetYaxis()->SetTitleOffset(1.4);
   os2l_ge8jge4b_TTB_stack_1->GetYaxis()->SetTitleFont(43);
   os2l_ge8jge4b_TTB_stack_1->GetZaxis()->SetLabelFont(43);
   os2l_ge8jge4b_TTB_stack_1->GetZaxis()->SetLabelSize(21);
   os2l_ge8jge4b_TTB_stack_1->GetZaxis()->SetTitleSize(21);
   os2l_ge8jge4b_TTB_stack_1->GetZaxis()->SetTitleOffset(1);
   os2l_ge8jge4b_TTB_stack_1->GetZaxis()->SetTitleFont(43);
   __stack__->Add(os2l_ge8jge4b_TTB_stack_1,"");
   Double_t xAxis127[5] = {0, 0.4607, 0.7272, 0.8897, 1}; 
   
   TH1D *os2l_ge8jge4b_TTC_stack_2 = new TH1D("os2l_ge8jge4b_TTC_stack_2","h",4, xAxis127);
   os2l_ge8jge4b_TTC_stack_2->SetBinContent(1,1.926414);
   os2l_ge8jge4b_TTC_stack_2->SetBinContent(2,1.135441);
   os2l_ge8jge4b_TTC_stack_2->SetBinContent(3,0.5200039);
   os2l_ge8jge4b_TTC_stack_2->SetBinContent(4,0.1712473);
   os2l_ge8jge4b_TTC_stack_2->SetEntries(365);
   os2l_ge8jge4b_TTC_stack_2->SetDirectory(0);
   os2l_ge8jge4b_TTC_stack_2->SetStats(0);

   ci = TColor::GetColor("#ccccff");
   os2l_ge8jge4b_TTC_stack_2->SetFillColor(ci);
   os2l_ge8jge4b_TTC_stack_2->SetMarkerStyle(20);
   os2l_ge8jge4b_TTC_stack_2->SetMarkerSize(1.2);
   os2l_ge8jge4b_TTC_stack_2->GetXaxis()->SetLabelFont(43);
   os2l_ge8jge4b_TTC_stack_2->GetXaxis()->SetLabelSize(21);
   os2l_ge8jge4b_TTC_stack_2->GetXaxis()->SetTitleSize(21);
   os2l_ge8jge4b_TTC_stack_2->GetXaxis()->SetTitleOffset(1.4);
   os2l_ge8jge4b_TTC_stack_2->GetXaxis()->SetTitleFont(43);
   os2l_ge8jge4b_TTC_stack_2->GetYaxis()->SetLabelFont(43);
   os2l_ge8jge4b_TTC_stack_2->GetYaxis()->SetLabelSize(21);
   os2l_ge8jge4b_TTC_stack_2->GetYaxis()->SetTitleSize(21);
   os2l_ge8jge4b_TTC_stack_2->GetYaxis()->SetTitleOffset(1.4);
   os2l_ge8jge4b_TTC_stack_2->GetYaxis()->SetTitleFont(43);
   os2l_ge8jge4b_TTC_stack_2->GetZaxis()->SetLabelFont(43);
   os2l_ge8jge4b_TTC_stack_2->GetZaxis()->SetLabelSize(21);
   os2l_ge8jge4b_TTC_stack_2->GetZaxis()->SetTitleSize(21);
   os2l_ge8jge4b_TTC_stack_2->GetZaxis()->SetTitleOffset(1);
   os2l_ge8jge4b_TTC_stack_2->GetZaxis()->SetTitleFont(43);
   __stack__->Add(os2l_ge8jge4b_TTC_stack_2,"");
   Double_t xAxis128[5] = {0, 0.4607, 0.7272, 0.8897, 1}; 
   
   TH1D *os2l_ge8jge4b_TTL_stack_3 = new TH1D("os2l_ge8jge4b_TTL_stack_3","h",4, xAxis128);
   os2l_ge8jge4b_TTL_stack_3->SetBinContent(1,0.0514706);
   os2l_ge8jge4b_TTL_stack_3->SetBinContent(2,0.01768459);
   os2l_ge8jge4b_TTL_stack_3->SetBinContent(3,0.003008527);
   os2l_ge8jge4b_TTL_stack_3->SetBinContent(4,4.903753e-07);
   os2l_ge8jge4b_TTL_stack_3->SetEntries(25);
   os2l_ge8jge4b_TTL_stack_3->SetDirectory(0);
   os2l_ge8jge4b_TTL_stack_3->SetStats(0);
   os2l_ge8jge4b_TTL_stack_3->SetMarkerStyle(20);
   os2l_ge8jge4b_TTL_stack_3->SetMarkerSize(1.2);
   os2l_ge8jge4b_TTL_stack_3->GetXaxis()->SetLabelFont(43);
   os2l_ge8jge4b_TTL_stack_3->GetXaxis()->SetLabelSize(21);
   os2l_ge8jge4b_TTL_stack_3->GetXaxis()->SetTitleSize(21);
   os2l_ge8jge4b_TTL_stack_3->GetXaxis()->SetTitleOffset(1.4);
   os2l_ge8jge4b_TTL_stack_3->GetXaxis()->SetTitleFont(43);
   os2l_ge8jge4b_TTL_stack_3->GetYaxis()->SetLabelFont(43);
   os2l_ge8jge4b_TTL_stack_3->GetYaxis()->SetLabelSize(21);
   os2l_ge8jge4b_TTL_stack_3->GetYaxis()->SetTitleSize(21);
   os2l_ge8jge4b_TTL_stack_3->GetYaxis()->SetTitleOffset(1.4);
   os2l_ge8jge4b_TTL_stack_3->GetYaxis()->SetTitleFont(43);
   os2l_ge8jge4b_TTL_stack_3->GetZaxis()->SetLabelFont(43);
   os2l_ge8jge4b_TTL_stack_3->GetZaxis()->SetLabelSize(21);
   os2l_ge8jge4b_TTL_stack_3->GetZaxis()->SetTitleSize(21);
   os2l_ge8jge4b_TTL_stack_3->GetZaxis()->SetTitleOffset(1);
   os2l_ge8jge4b_TTL_stack_3->GetZaxis()->SetTitleFont(43);
   __stack__->Add(os2l_ge8jge4b_TTL_stack_3,"");
   Double_t xAxis130[5] = {0, 0.4607, 0.7272, 0.8897, 1}; 
   
   TH1D *os2l_ge8jge4b_tttt_stack_5 = new TH1D("os2l_ge8jge4b_tttt_stack_5","h",4, xAxis130);
   os2l_ge8jge4b_tttt_stack_5->SetBinContent(1,0.510959);
   os2l_ge8jge4b_tttt_stack_5->SetBinContent(2,1.366456);
   os2l_ge8jge4b_tttt_stack_5->SetBinContent(3,1.907463);
   os2l_ge8jge4b_tttt_stack_5->SetBinContent(4,2.101984);
   os2l_ge8jge4b_tttt_stack_5->SetEntries(58841);
   os2l_ge8jge4b_tttt_stack_5->SetDirectory(0);
   os2l_ge8jge4b_tttt_stack_5->SetStats(0);
   os2l_ge8jge4b_tttt_stack_5->SetFillColor(92);
   os2l_ge8jge4b_tttt_stack_5->SetMarkerStyle(20);
   os2l_ge8jge4b_tttt_stack_5->SetMarkerSize(1.2);
   os2l_ge8jge4b_tttt_stack_5->GetXaxis()->SetLabelFont(43);
   os2l_ge8jge4b_tttt_stack_5->GetXaxis()->SetLabelSize(21);
   os2l_ge8jge4b_tttt_stack_5->GetXaxis()->SetTitleSize(21);
   os2l_ge8jge4b_tttt_stack_5->GetXaxis()->SetTitleOffset(1.4);
   os2l_ge8jge4b_tttt_stack_5->GetXaxis()->SetTitleFont(43);
   os2l_ge8jge4b_tttt_stack_5->GetYaxis()->SetLabelFont(43);
   os2l_ge8jge4b_tttt_stack_5->GetYaxis()->SetLabelSize(21);
   os2l_ge8jge4b_tttt_stack_5->GetYaxis()->SetTitleSize(21);
   os2l_ge8jge4b_tttt_stack_5->GetYaxis()->SetTitleOffset(1.4);
   os2l_ge8jge4b_tttt_stack_5->GetYaxis()->SetTitleFont(43);
   os2l_ge8jge4b_tttt_stack_5->GetZaxis()->SetLabelFont(43);
   os2l_ge8jge4b_tttt_stack_5->GetZaxis()->SetLabelSize(21);
   os2l_ge8jge4b_tttt_stack_5->GetZaxis()->SetTitleSize(21);
   os2l_ge8jge4b_tttt_stack_5->GetZaxis()->SetTitleOffset(1);
   os2l_ge8jge4b_tttt_stack_5->GetZaxis()->SetTitleFont(43);
   __stack__->Add(os2l_ge8jge4b_tttt_stack_5,"");
   Double_t xAxis131[5] = {0, 0.4607, 0.7272, 0.8897, 1}; 
   
   TH1D *os2l_ge8jge4b_BSMtttt400_stack_6 = new TH1D("os2l_ge8jge4b_BSMtttt400_stack_6","h",4, xAxis131);
   os2l_ge8jge4b_BSMtttt400_stack_6->SetBinContent(1,0.4957026);
   os2l_ge8jge4b_BSMtttt400_stack_6->SetBinContent(2,1.507659);
   os2l_ge8jge4b_BSMtttt400_stack_6->SetBinContent(3,2.627211);
   os2l_ge8jge4b_BSMtttt400_stack_6->SetBinContent(4,3.295262);
   os2l_ge8jge4b_BSMtttt400_stack_6->SetEntries(1824);
   os2l_ge8jge4b_BSMtttt400_stack_6->SetDirectory(0);
   os2l_ge8jge4b_BSMtttt400_stack_6->SetStats(0);
   os2l_ge8jge4b_BSMtttt400_stack_6->SetFillColor(2);
   os2l_ge8jge4b_BSMtttt400_stack_6->SetLineColor(2);
   os2l_ge8jge4b_BSMtttt400_stack_6->SetMarkerStyle(20);
   os2l_ge8jge4b_BSMtttt400_stack_6->SetMarkerSize(1.2);
   os2l_ge8jge4b_BSMtttt400_stack_6->GetXaxis()->SetLabelFont(43);
   os2l_ge8jge4b_BSMtttt400_stack_6->GetXaxis()->SetLabelSize(21);
   os2l_ge8jge4b_BSMtttt400_stack_6->GetXaxis()->SetTitleSize(21);
   os2l_ge8jge4b_BSMtttt400_stack_6->GetXaxis()->SetTitleOffset(1.4);
   os2l_ge8jge4b_BSMtttt400_stack_6->GetXaxis()->SetTitleFont(43);
   os2l_ge8jge4b_BSMtttt400_stack_6->GetYaxis()->SetLabelFont(43);
   os2l_ge8jge4b_BSMtttt400_stack_6->GetYaxis()->SetLabelSize(21);
   os2l_ge8jge4b_BSMtttt400_stack_6->GetYaxis()->SetTitleSize(21);
   os2l_ge8jge4b_BSMtttt400_stack_6->GetYaxis()->SetTitleOffset(1.4);
   os2l_ge8jge4b_BSMtttt400_stack_6->GetYaxis()->SetTitleFont(43);
   os2l_ge8jge4b_BSMtttt400_stack_6->GetZaxis()->SetLabelFont(43);
   os2l_ge8jge4b_BSMtttt400_stack_6->GetZaxis()->SetLabelSize(21);
   os2l_ge8jge4b_BSMtttt400_stack_6->GetZaxis()->SetTitleSize(21);
   os2l_ge8jge4b_BSMtttt400_stack_6->GetZaxis()->SetTitleOffset(1);
   os2l_ge8jge4b_BSMtttt400_stack_6->GetZaxis()->SetTitleFont(43);
   __stack__->Add(os2l_ge8jge4b_BSMtttt400_stack_6,"");
   __stack__->Draw("hist same");
   
   Double_t g_totErr_postFit_fx3035[4] = {
   0.23035,
   0.59395,
   0.80845,
   0.94485};
   Double_t g_totErr_postFit_fy3035[4] = {
   36.60509,
   27.32462,
   16.54318,
   9.88928};
   Double_t g_totErr_postFit_felx3035[4] = {
   0.23035,
   0.13325,
   0.08125,
   0.05515};
   Double_t g_totErr_postFit_fely3035[4] = {
   3.295558,
   2.063762,
   1.473773,
   1.733529};
   Double_t g_totErr_postFit_fehx3035[4] = {
   0.23035,
   0.13325,
   0.08125,
   0.05515};
   Double_t g_totErr_postFit_fehy3035[4] = {
   3.295558,
   2.063762,
   1.473773,
   1.733529};
   grae = new TGraphAsymmErrors(4,g_totErr_postFit_fx3035,g_totErr_postFit_fy3035,g_totErr_postFit_felx3035,g_totErr_postFit_fehx3035,g_totErr_postFit_fely3035,g_totErr_postFit_fehy3035);
   grae->SetName("g_totErr_postFit");
   grae->SetTitle("h");

   ci = TColor::GetColor("#6666ff");
   grae->SetFillColor(ci);
   grae->SetFillStyle(3354);
   grae->SetLineColor(0);
   grae->SetLineWidth(0);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(0);
   
   TH1F *Graph_g_totErr_postFit3035 = new TH1F("Graph_g_totErr_postFit3035","h",100,0,1.1);
   Graph_g_totErr_postFit3035->SetMinimum(4.981262);
   Graph_g_totErr_postFit3035->SetMaximum(43.07514);
   Graph_g_totErr_postFit3035->SetDirectory(0);
   Graph_g_totErr_postFit3035->SetStats(0);
   Graph_g_totErr_postFit3035->SetLineWidth(2);
   Graph_g_totErr_postFit3035->SetMarkerStyle(20);
   Graph_g_totErr_postFit3035->SetMarkerSize(1.2);
   Graph_g_totErr_postFit3035->GetXaxis()->SetLabelFont(43);
   Graph_g_totErr_postFit3035->GetXaxis()->SetLabelSize(21);
   Graph_g_totErr_postFit3035->GetXaxis()->SetTitleSize(21);
   Graph_g_totErr_postFit3035->GetXaxis()->SetTitleOffset(1.4);
   Graph_g_totErr_postFit3035->GetXaxis()->SetTitleFont(43);
   Graph_g_totErr_postFit3035->GetYaxis()->SetLabelFont(43);
   Graph_g_totErr_postFit3035->GetYaxis()->SetLabelSize(21);
   Graph_g_totErr_postFit3035->GetYaxis()->SetTitleSize(21);
   Graph_g_totErr_postFit3035->GetYaxis()->SetTitleOffset(1.4);
   Graph_g_totErr_postFit3035->GetYaxis()->SetTitleFont(43);
   Graph_g_totErr_postFit3035->GetZaxis()->SetLabelFont(43);
   Graph_g_totErr_postFit3035->GetZaxis()->SetLabelSize(21);
   Graph_g_totErr_postFit3035->GetZaxis()->SetTitleSize(21);
   Graph_g_totErr_postFit3035->GetZaxis()->SetTitleOffset(1);
   Graph_g_totErr_postFit3035->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_g_totErr_postFit3035);
   
   grae->Draw("e2");
   Double_t xAxis132[5] = {0, 0.4607, 0.7272, 0.8897, 1}; 
   
   TH1D *os2l_ge8jge4b_BSMtttt400__92 = new TH1D("os2l_ge8jge4b_BSMtttt400__92","h",4, xAxis132);
   os2l_ge8jge4b_BSMtttt400__92->SetBinContent(1,5.651489);
   os2l_ge8jge4b_BSMtttt400__92->SetBinContent(2,17.18877);
   os2l_ge8jge4b_BSMtttt400__92->SetBinContent(3,29.95275);
   os2l_ge8jge4b_BSMtttt400__92->SetBinContent(4,37.56917);
   os2l_ge8jge4b_BSMtttt400__92->SetEntries(1824);
   os2l_ge8jge4b_BSMtttt400__92->SetDirectory(0);
   os2l_ge8jge4b_BSMtttt400__92->SetStats(0);
   os2l_ge8jge4b_BSMtttt400__92->SetFillStyle(0);
   os2l_ge8jge4b_BSMtttt400__92->SetLineColor(2);
   os2l_ge8jge4b_BSMtttt400__92->SetLineStyle(2);
   os2l_ge8jge4b_BSMtttt400__92->SetLineWidth(2);
   os2l_ge8jge4b_BSMtttt400__92->SetMarkerStyle(20);
   os2l_ge8jge4b_BSMtttt400__92->SetMarkerSize(1.2);
   os2l_ge8jge4b_BSMtttt400__92->GetXaxis()->SetLabelFont(43);
   os2l_ge8jge4b_BSMtttt400__92->GetXaxis()->SetLabelSize(21);
   os2l_ge8jge4b_BSMtttt400__92->GetXaxis()->SetTitleSize(21);
   os2l_ge8jge4b_BSMtttt400__92->GetXaxis()->SetTitleOffset(1.4);
   os2l_ge8jge4b_BSMtttt400__92->GetXaxis()->SetTitleFont(43);
   os2l_ge8jge4b_BSMtttt400__92->GetYaxis()->SetLabelFont(43);
   os2l_ge8jge4b_BSMtttt400__92->GetYaxis()->SetLabelSize(21);
   os2l_ge8jge4b_BSMtttt400__92->GetYaxis()->SetTitleSize(21);
   os2l_ge8jge4b_BSMtttt400__92->GetYaxis()->SetTitleOffset(1.4);
   os2l_ge8jge4b_BSMtttt400__92->GetYaxis()->SetTitleFont(43);
   os2l_ge8jge4b_BSMtttt400__92->GetZaxis()->SetLabelFont(43);
   os2l_ge8jge4b_BSMtttt400__92->GetZaxis()->SetLabelSize(21);
   os2l_ge8jge4b_BSMtttt400__92->GetZaxis()->SetTitleSize(21);
   os2l_ge8jge4b_BSMtttt400__92->GetZaxis()->SetTitleOffset(1);
   os2l_ge8jge4b_BSMtttt400__92->GetZaxis()->SetTitleFont(43);
   os2l_ge8jge4b_BSMtttt400__92->Draw("HISTsame");
   Double_t xAxis133[5] = {0, 0.4607, 0.7272, 0.8897, 1}; 
   
   TH1D *os2l_ge8jge4b_BSMtttt400__93 = new TH1D("os2l_ge8jge4b_BSMtttt400__93","h",4, xAxis133);
   os2l_ge8jge4b_BSMtttt400__93->SetBinContent(1,0.4957026);
   os2l_ge8jge4b_BSMtttt400__93->SetBinContent(2,1.507659);
   os2l_ge8jge4b_BSMtttt400__93->SetBinContent(3,2.627211);
   os2l_ge8jge4b_BSMtttt400__93->SetBinContent(4,3.295262);
   os2l_ge8jge4b_BSMtttt400__93->SetEntries(1824);
   os2l_ge8jge4b_BSMtttt400__93->SetDirectory(0);
   os2l_ge8jge4b_BSMtttt400__93->SetStats(0);
   os2l_ge8jge4b_BSMtttt400__93->SetFillStyle(0);
   os2l_ge8jge4b_BSMtttt400__93->SetLineColor(2);
   os2l_ge8jge4b_BSMtttt400__93->SetLineStyle(2);
   os2l_ge8jge4b_BSMtttt400__93->SetLineWidth(2);
   os2l_ge8jge4b_BSMtttt400__93->SetMarkerStyle(20);
   os2l_ge8jge4b_BSMtttt400__93->SetMarkerSize(1.2);
   os2l_ge8jge4b_BSMtttt400__93->GetXaxis()->SetLabelFont(43);
   os2l_ge8jge4b_BSMtttt400__93->GetXaxis()->SetLabelSize(21);
   os2l_ge8jge4b_BSMtttt400__93->GetXaxis()->SetTitleSize(21);
   os2l_ge8jge4b_BSMtttt400__93->GetXaxis()->SetTitleOffset(1.4);
   os2l_ge8jge4b_BSMtttt400__93->GetXaxis()->SetTitleFont(43);
   os2l_ge8jge4b_BSMtttt400__93->GetYaxis()->SetLabelFont(43);
   os2l_ge8jge4b_BSMtttt400__93->GetYaxis()->SetLabelSize(21);
   os2l_ge8jge4b_BSMtttt400__93->GetYaxis()->SetTitleSize(21);
   os2l_ge8jge4b_BSMtttt400__93->GetYaxis()->SetTitleOffset(1.4);
   os2l_ge8jge4b_BSMtttt400__93->GetYaxis()->SetTitleFont(43);
   os2l_ge8jge4b_BSMtttt400__93->GetZaxis()->SetLabelFont(43);
   os2l_ge8jge4b_BSMtttt400__93->GetZaxis()->SetLabelSize(21);
   os2l_ge8jge4b_BSMtttt400__93->GetZaxis()->SetTitleSize(21);
   os2l_ge8jge4b_BSMtttt400__93->GetZaxis()->SetTitleOffset(1);
   os2l_ge8jge4b_BSMtttt400__93->GetZaxis()->SetTitleFont(43);
   // os2l_ge8jge4b_BSMtttt400__93->Draw("HISTsame");
   
   Double_t Graph_from_os2l_ge8jge4b_data_fx3036[4] = {
   0.23035,
   0.59395,
   0.80845,
   0.94485};
   Double_t Graph_from_os2l_ge8jge4b_data_fy3036[4] = {
   32,
   26,
   20,
   8};
   Double_t Graph_from_os2l_ge8jge4b_data_felx3036[4] = {
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_os2l_ge8jge4b_data_fely3036[4] = {
   5.656854,
   5.09902,
   4.472136,
   2.828427};
   Double_t Graph_from_os2l_ge8jge4b_data_fehx3036[4] = {
   0.,
   0.,
   0.,
   0.};
   Double_t Graph_from_os2l_ge8jge4b_data_fehy3036[4] = {
   5.656854,
   5.09902,
   4.472136,
   2.828427};
   grae = new TGraphAsymmErrors(4,Graph_from_os2l_ge8jge4b_data_fx3036,Graph_from_os2l_ge8jge4b_data_fy3036,Graph_from_os2l_ge8jge4b_data_felx3036,Graph_from_os2l_ge8jge4b_data_fehx3036,Graph_from_os2l_ge8jge4b_data_fely3036,Graph_from_os2l_ge8jge4b_data_fehy3036);
   grae->SetName("Graph_from_os2l_ge8jge4b_data");
   grae->SetTitle("h");
   grae->SetLineWidth(2);
   grae->SetMarkerStyle(20);
   grae->SetMarkerSize(1.4);
   
   TH1F *Graph_Graph_from_os2l_ge8jge4b_data3036 = new TH1F("Graph_Graph_from_os2l_ge8jge4b_data3036","h",100,0,1.099954);
   Graph_Graph_from_os2l_ge8jge4b_data3036->SetMinimum(1.923045);
   Graph_Graph_from_os2l_ge8jge4b_data3036->SetMaximum(40.90538);
   Graph_Graph_from_os2l_ge8jge4b_data3036->SetDirectory(0);
   Graph_Graph_from_os2l_ge8jge4b_data3036->SetStats(0);
   Graph_Graph_from_os2l_ge8jge4b_data3036->SetLineWidth(2);
   Graph_Graph_from_os2l_ge8jge4b_data3036->SetMarkerStyle(20);
   Graph_Graph_from_os2l_ge8jge4b_data3036->SetMarkerSize(1.2);
   Graph_Graph_from_os2l_ge8jge4b_data3036->GetXaxis()->SetLabelFont(43);
   Graph_Graph_from_os2l_ge8jge4b_data3036->GetXaxis()->SetLabelSize(21);
   Graph_Graph_from_os2l_ge8jge4b_data3036->GetXaxis()->SetTitleSize(21);
   Graph_Graph_from_os2l_ge8jge4b_data3036->GetXaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_os2l_ge8jge4b_data3036->GetXaxis()->SetTitleFont(43);
   Graph_Graph_from_os2l_ge8jge4b_data3036->GetYaxis()->SetLabelFont(43);
   Graph_Graph_from_os2l_ge8jge4b_data3036->GetYaxis()->SetLabelSize(21);
   Graph_Graph_from_os2l_ge8jge4b_data3036->GetYaxis()->SetTitleSize(21);
   Graph_Graph_from_os2l_ge8jge4b_data3036->GetYaxis()->SetTitleOffset(1.4);
   Graph_Graph_from_os2l_ge8jge4b_data3036->GetYaxis()->SetTitleFont(43);
   Graph_Graph_from_os2l_ge8jge4b_data3036->GetZaxis()->SetLabelFont(43);
   Graph_Graph_from_os2l_ge8jge4b_data3036->GetZaxis()->SetLabelSize(21);
   Graph_Graph_from_os2l_ge8jge4b_data3036->GetZaxis()->SetTitleSize(21);
   Graph_Graph_from_os2l_ge8jge4b_data3036->GetZaxis()->SetTitleOffset(1);
   Graph_Graph_from_os2l_ge8jge4b_data3036->GetZaxis()->SetTitleFont(43);
   grae->SetHistogram(Graph_Graph_from_os2l_ge8jge4b_data3036);
   
   grae->Draw("PZ");
   Double_t xAxis134[5] = {0, 0.4607, 0.7272, 0.8897, 1}; 
   
   TH1D *h_blind__94 = new TH1D("h_blind__94","h",4, xAxis134);
   h_blind__94->SetBinError(1,1084.517);
   h_blind__94->SetBinError(2,977.5708);
   h_blind__94->SetBinError(3,857.3863);
   h_blind__94->SetBinError(4,542.2587);
   h_blind__94->SetEntries(200);
   h_blind__94->SetDirectory(0);
   h_blind__94->SetStats(0);

   ci = TColor::GetColor("#cccccc");
   h_blind__94->SetFillColor(ci);
   h_blind__94->SetFillStyle(3345);

   ci = TColor::GetColor("#cccccc");
   h_blind__94->SetLineColor(ci);
   h_blind__94->SetLineWidth(0);
   h_blind__94->SetMarkerStyle(20);
   h_blind__94->SetMarkerSize(1.2);
   h_blind__94->GetXaxis()->SetLabelFont(43);
   h_blind__94->GetXaxis()->SetLabelSize(21);
   h_blind__94->GetXaxis()->SetTitleSize(21);
   h_blind__94->GetXaxis()->SetTitleOffset(1.4);
   h_blind__94->GetXaxis()->SetTitleFont(43);
   h_blind__94->GetYaxis()->SetLabelFont(43);
   h_blind__94->GetYaxis()->SetLabelSize(21);
   h_blind__94->GetYaxis()->SetTitleSize(21);
   h_blind__94->GetYaxis()->SetTitleOffset(1.4);
   h_blind__94->GetYaxis()->SetTitleFont(43);
   h_blind__94->GetZaxis()->SetLabelFont(43);
   h_blind__94->GetZaxis()->SetLabelSize(21);
   h_blind__94->GetZaxis()->SetTitleSize(21);
   h_blind__94->GetZaxis()->SetTitleOffset(1);
   h_blind__94->GetZaxis()->SetTitleFont(43);
   h_blind__94->Draw("same HIST");
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
      tex = new TLatex(0.1812081,0.7816667,"2LOS,#geq8j,#geq4b");
      // tex = new TLatex(0.1812081,0.7316667,"2LOS,#geq8j,#geq4b");
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
   TLegendEntry *entry=leg->AddEntry("os2l_ge8jge4b_data","Data","ep");
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(2);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(20);
   entry->SetMarkerSize(1.4);
   entry->SetTextFont(43);
   entry=leg->AddEntry("os2l_ge8jge4b_BSMtttt400_stack_6","t#bar{t}H #rightarrow t#bar{t}t#bar{t} m_{H} = 400 GeV","f");
   entry->SetFillColor(2);
   entry->SetFillStyle(1001);
   entry->SetLineColor(2);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   entry=leg->AddEntry("os2l_ge8jge4b_BSMtttt400","t#bar{t}H #rightarrow t#bar{t}t#bar{t} m_{H} = 400 GeV *","l");
   entry->SetLineColor(2);
   entry->SetLineStyle(2);
   entry->SetLineWidth(2);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   // entry=leg->AddEntry("os2l_ge8jge4b_BSMtttt400","t#bar{t}t#bar{t}400","l");
   // entry->SetLineColor(2);
   // entry->SetLineStyle(2);
   // entry->SetLineWidth(2);
   // entry->SetMarkerColor(1);
   // entry->SetMarkerStyle(21);
   // entry->SetMarkerSize(1);
   // entry->SetTextFont(43);
   entry=leg->AddEntry("os2l_ge8jge4b_tttt_stack_5","t#bar{t}t#bar{t}","f");
   entry->SetFillColor(92);
   entry->SetFillStyle(1001);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   entry=leg->AddEntry("os2l_ge8jge4b_TTL_stack_3","t#bar{t}+light","f");
   entry->SetFillStyle(1001);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetLineWidth(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(43);
   entry=leg->AddEntry("os2l_ge8jge4b_TTC_stack_2","t#bar{t}+#geq1c","f");

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
   entry=leg->AddEntry("os2l_ge8jge4b_TTB_stack_1","t#bar{t}+#geq1b","f");

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

   entry=leg->AddEntry("os2l_ge8jge4b_ttt_stack_4","Others","f");
   entry->SetFillColor(62);
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
   Double_t xAxis135[5] = {0, 0.4607, 0.7272, 0.8897, 1}; 
   
   TH1D *h_dummy_copy__95 = new TH1D("h_dummy_copy__95","h",4, xAxis135);
   h_dummy_copy__95->SetMinimum(0);
   h_dummy_copy__95->SetMaximum(67.78234);
   h_dummy_copy__95->SetEntries(84331);
   h_dummy_copy__95->SetDirectory(0);
   h_dummy_copy__95->SetStats(0);
   h_dummy_copy__95->SetFillColor(2);
   h_dummy_copy__95->SetLineColor(2);
   h_dummy_copy__95->SetMarkerStyle(20);
   h_dummy_copy__95->SetMarkerSize(1.2);
   h_dummy_copy__95->GetXaxis()->SetLabelFont(43);
   h_dummy_copy__95->GetXaxis()->SetLabelSize(0);
   h_dummy_copy__95->GetXaxis()->SetTitleSize(21);
   h_dummy_copy__95->GetXaxis()->SetTitleOffset(2);
   h_dummy_copy__95->GetXaxis()->SetTitleFont(43);
   h_dummy_copy__95->GetYaxis()->SetTitle("Events");
   h_dummy_copy__95->GetYaxis()->SetLabelFont(43);
   h_dummy_copy__95->GetYaxis()->SetLabelSize(21);
   h_dummy_copy__95->GetYaxis()->SetTitleSize(21);
   h_dummy_copy__95->GetYaxis()->SetTitleOffset(2.255033);
   h_dummy_copy__95->GetYaxis()->SetTitleFont(43);
   h_dummy_copy__95->GetZaxis()->SetLabelFont(43);
   h_dummy_copy__95->GetZaxis()->SetLabelSize(21);
   h_dummy_copy__95->GetZaxis()->SetTitleSize(21);
   h_dummy_copy__95->GetZaxis()->SetTitleOffset(1);
   h_dummy_copy__95->GetZaxis()->SetTitleFont(43);
   h_dummy_copy__95->Draw("sameaxis");
   pad1->Modified();
   c1_n18->cd();
   c1_n18->Modified();
   c1_n18->cd();
   c1_n18->SetSelected(c1_n18);

   c1_n18->SaveAs("os2l_ge8jge4b_postFit.pdf");
}
