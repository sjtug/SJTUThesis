void lim_combined_with_individual_exp()
{
//=========Macro generated from canvas: c/c
//=========  (Sat May  4 15:34:21 2024) by ROOT version 6.22/02
   TCanvas *c = new TCanvas("c", "c",242,265,650,500);
   c->Range(0,0,1,1);
   c->SetFillColor(0);
   c->SetBorderMode(0);
   c->SetBorderSize(2);
   c->SetFrameBorderMode(0);
  
// ------------>Primitives in pad: pad
   TPad *pad = new TPad("pad", "",0,0.0,1,1);
   pad->Draw();
   pad->cd();
   pad->Range(0.05617284,-4.895903,2.154938,1.076786);
   pad->SetFillColor(0);
   pad->SetBorderMode(0);
   pad->SetBorderSize(2);
   pad->SetLogy();
   pad->SetTickx(1);
   pad->SetTicky(1);
   pad->SetLeftMargin(0.14);
   pad->SetRightMargin(0.05);
   pad->SetTopMargin(0.05);
   pad->SetBottomMargin(0.15);
   pad->SetFrameBorderMode(0);
   pad->SetFrameBorderMode(0);
   
   TH2F *hcan__1 = new TH2F("hcan__1","",100,0.35,2.05,100,0.0003,9);
   hcan__1->SetStats(0);

   Int_t ci;      // for color index setting
   TColor *color; // for color definition with alpha
   ci = TColor::GetColor("#000099");
   hcan__1->SetLineColor(ci);
   hcan__1->GetXaxis()->SetTitle("m_{S_{8}} [TeV]");
   hcan__1->GetXaxis()->SetLabelFont(42);
   hcan__1->GetXaxis()->SetLabelSize(0.05);
   hcan__1->GetXaxis()->SetTitleSize(0.06);
   hcan__1->GetXaxis()->SetTitleOffset(1.15);
   hcan__1->GetXaxis()->SetTitleFont(42);
   hcan__1->GetYaxis()->SetTitle("#sigma(pp#rightarrow S_{8}S_{8}) #times B(S_{8}#rightarrowt#bar{t}) [pb]");
   hcan__1->GetYaxis()->SetLabelFont(42);
   hcan__1->GetYaxis()->SetLabelSize(0.05);
   hcan__1->GetYaxis()->SetTitleSize(0.06);
   hcan__1->GetYaxis()->SetTitleOffset(1.2);
   hcan__1->GetYaxis()->SetTitleFont(42);
   hcan__1->GetZaxis()->SetLabelFont(42);
   hcan__1->GetZaxis()->SetTitleOffset(1);
   hcan__1->GetZaxis()->SetTitleFont(42);
   hcan__1->Draw("");
   
   Double_t Graph0_fx3001[14] = {
   0.4,
   0.5,
   0.6,
   0.7,
   0.8,
   0.9,
   1,
   1.1,
   1.2,
   1.3,
   1.4,
   1.5,
   1.75,
   2};
   Double_t Graph0_fy3001[14] = {
   0.009467528,
   0.006355329,
   0.004507264,
   0.003379156,
   0.002548269,
   0.002042117,
   0.001741136,
   0.001696035,
   0.001711723,
   0.001764869,
   0.001850532,
   0.001889219,
   0.002510788,
   0.002861503};
   Double_t Graph0_felx3001[14] = {
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0};
   Double_t Graph0_fely3001[14] = {
   0.004386062,
   0.00294426,
   0.002088099,
   0.001565476,
   0.001180548,
   0.0009460604,
   0.0008066236,
   0.0007857293,
   0.0007929974,
   0.0008176182,
   0.0008573037,
   0.0008752265,
   0.001163184,
   0.001325661};
   Double_t Graph0_fehx3001[14] = {
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0};
   Double_t Graph0_fehy3001[14] = {
   0.009598991,
   0.006233039,
   0.004392768,
   0.003216928,
   0.002457931,
   0.001968693,
   0.001708457,
   0.001674609,
   0.001691632,
   0.001751529,
   0.001840129,
   0.00189292,
   0.002511603,
   0.002890453};
   TGraphAsymmErrors *grae = new TGraphAsymmErrors(14,Graph0_fx3001,Graph0_fy3001,Graph0_felx3001,Graph0_fehx3001,Graph0_fely3001,Graph0_fehy3001);
   grae->SetName("Graph0");
   grae->SetTitle("Graph");
   grae->SetFillColor(5);
   grae->SetFillStyle(1000);
   grae->SetLineWidth(0);
   
   TH1F *Graph_Graph03001 = new TH1F("Graph_Graph03001","Graph",100,0.24,2.16);
   Graph_Graph03001->SetMinimum(0.000819275);
   Graph_Graph03001->SetMaximum(0.02088214);
   Graph_Graph03001->SetDirectory(0);
   Graph_Graph03001->SetStats(0);

   ci = TColor::GetColor("#000099");
   Graph_Graph03001->SetLineColor(ci);
   Graph_Graph03001->GetXaxis()->SetLabelFont(42);
   Graph_Graph03001->GetXaxis()->SetTitleOffset(1);
   Graph_Graph03001->GetXaxis()->SetTitleFont(42);
   Graph_Graph03001->GetYaxis()->SetLabelFont(42);
   Graph_Graph03001->GetYaxis()->SetTitleFont(42);
   Graph_Graph03001->GetZaxis()->SetLabelFont(42);
   Graph_Graph03001->GetZaxis()->SetTitleOffset(1);
   Graph_Graph03001->GetZaxis()->SetTitleFont(42);
   grae->SetHistogram(Graph_Graph03001);
   
   grae->Draw("3");
   
   Double_t Graph1_fx3002[14] = {
   0.4,
   0.5,
   0.6,
   0.7,
   0.8,
   0.9,
   1,
   1.1,
   1.2,
   1.3,
   1.4,
   1.5,
   1.75,
   2};
   Double_t Graph1_fy3002[14] = {
   0.009467528,
   0.006355329,
   0.004507264,
   0.003379156,
   0.002548269,
   0.002042117,
   0.001741136,
   0.001696035,
   0.001711723,
   0.001764869,
   0.001850532,
   0.001889219,
   0.002510788,
   0.002861503};
   Double_t Graph1_felx3002[14] = {
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0};
   Double_t Graph1_fely3002[14] = {
   0.00264565,
   0.001775963,
   0.001259531,
   0.0009442872,
   0.0007121002,
   0.0005706588,
   0.0004865513,
   0.0004739478,
   0.000478332,
   0.0004931831,
   0.0005171212,
   0.0005279322,
   0.0007016264,
   0.0007996318};
   Double_t Graph1_fehx3002[14] = {
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0};
   Double_t Graph1_fehy3002[14] = {
   0.004096097,
   0.002689261,
   0.001905423,
   0.001405465,
   0.001062552,
   0.0008527325,
   0.0007356381,
   0.0007189786,
   0.0007258063,
   0.0007502988,
   0.0007872611,
   0.0008073397,
   0.001071697,
   0.001228551};
   grae = new TGraphAsymmErrors(14,Graph1_fx3002,Graph1_fy3002,Graph1_felx3002,Graph1_fehx3002,Graph1_fely3002,Graph1_fehy3002);
   grae->SetName("Graph1");
   grae->SetTitle("Graph");
   grae->SetFillColor(3);
   grae->SetFillStyle(1000);
   grae->SetLineWidth(0);
   
   TH1F *Graph_Graph13002 = new TH1F("Graph_Graph13002","Graph",100,0.24,2.16);
   Graph_Graph13002->SetMinimum(0.001099878);
   Graph_Graph13002->SetMaximum(0.01479778);
   Graph_Graph13002->SetDirectory(0);
   Graph_Graph13002->SetStats(0);

   ci = TColor::GetColor("#000099");
   Graph_Graph13002->SetLineColor(ci);
   Graph_Graph13002->GetXaxis()->SetLabelFont(42);
   Graph_Graph13002->GetXaxis()->SetTitleOffset(1);
   Graph_Graph13002->GetXaxis()->SetTitleFont(42);
   Graph_Graph13002->GetYaxis()->SetLabelFont(42);
   Graph_Graph13002->GetYaxis()->SetTitleFont(42);
   Graph_Graph13002->GetZaxis()->SetLabelFont(42);
   Graph_Graph13002->GetZaxis()->SetTitleOffset(1);
   Graph_Graph13002->GetZaxis()->SetTitleFont(42);
   grae->SetHistogram(Graph_Graph13002);
   
   grae->Draw("3");
   
   Double_t Graph2_fx1[14] = {
   0.4,
   0.5,
   0.6,
   0.7,
   0.8,
   0.9,
   1,
   1.1,
   1.2,
   1.3,
   1.4,
   1.5,
   1.75,
   2};
   Double_t Graph2_fy1[14] = {
   0.009467528,
   0.006355329,
   0.004507264,
   0.003379156,
   0.002548269,
   0.002042117,
   0.001741136,
   0.001696035,
   0.001711723,
   0.001764869,
   0.001850532,
   0.001889219,
   0.002510788,
   0.002861503};
   TGraph *graph = new TGraph(14,Graph2_fx1,Graph2_fy1);
   graph->SetName("Graph2");
   graph->SetTitle("Graph");
   graph->SetFillStyle(1000);

   ci = TColor::GetColor("#333333");
   graph->SetLineColor(ci);
   graph->SetLineStyle(9);
   graph->SetLineWidth(3);
   
   TH1F *Graph_Graph21 = new TH1F("Graph_Graph21","Graph",100,0.24,2.16);
   Graph_Graph21->SetMinimum(0.0009188855);
   Graph_Graph21->SetMaximum(0.01024468);
   Graph_Graph21->SetDirectory(0);
   Graph_Graph21->SetStats(0);

   ci = TColor::GetColor("#000099");
   Graph_Graph21->SetLineColor(ci);
   Graph_Graph21->GetXaxis()->SetLabelFont(42);
   Graph_Graph21->GetXaxis()->SetTitleOffset(1);
   Graph_Graph21->GetXaxis()->SetTitleFont(42);
   Graph_Graph21->GetYaxis()->SetLabelFont(42);
   Graph_Graph21->GetYaxis()->SetTitleFont(42);
   Graph_Graph21->GetZaxis()->SetLabelFont(42);
   Graph_Graph21->GetZaxis()->SetTitleOffset(1);
   Graph_Graph21->GetZaxis()->SetTitleFont(42);
   graph->SetHistogram(Graph_Graph21);
   
   graph->Draw("l");
   
   Double_t Graph3_fx2[14] = {
   0.4,
   0.5,
   0.6,
   0.7,
   0.8,
   0.9,
   1,
   1.1,
   1.2,
   1.3,
   1.4,
   1.5,
   1.75,
   2};
   Double_t Graph3_fy2[14] = {
   0.02106961,
   0.01207575,
   0.007612472,
   0.005310021,
   0.004092079,
   0.003171629,
   0.002709386,
   0.002724404,
   0.002774023,
   0.002928956,
   0.003169361,
   0.003345797,
   0.004418209,
   0.005338126};
   graph = new TGraph(14,Graph3_fx2,Graph3_fy2);
   graph->SetName("Graph3");
   graph->SetTitle("Graph");
   graph->SetFillStyle(1000);

   ci = TColor::GetColor("#0099ff");
   graph->SetLineColor(ci);
   graph->SetLineStyle(8);
   graph->SetLineWidth(3);
   
   TH1F *Graph_Graph32 = new TH1F("Graph_Graph32","Graph",100,0.24,2.16);
   Graph_Graph32->SetMinimum(0.0008733636);
   Graph_Graph32->SetMaximum(0.02290563);
   Graph_Graph32->SetDirectory(0);
   Graph_Graph32->SetStats(0);

   ci = TColor::GetColor("#000099");
   Graph_Graph32->SetLineColor(ci);
   Graph_Graph32->GetXaxis()->SetLabelFont(42);
   Graph_Graph32->GetXaxis()->SetTitleOffset(1);
   Graph_Graph32->GetXaxis()->SetTitleFont(42);
   Graph_Graph32->GetYaxis()->SetLabelFont(42);
   Graph_Graph32->GetYaxis()->SetTitleFont(42);
   Graph_Graph32->GetZaxis()->SetLabelFont(42);
   Graph_Graph32->GetZaxis()->SetTitleOffset(1);
   Graph_Graph32->GetZaxis()->SetTitleFont(42);
   graph->SetHistogram(Graph_Graph32);
   
   graph->Draw("l");
   
   Double_t Graph4_fx3[14] = {
   0.4,
   0.5,
   0.6,
   0.7,
   0.8,
   0.9,
   1,
   1.1,
   1.2,
   1.3,
   1.4,
   1.5,
   1.75,
   2};
   Double_t Graph4_fy3[14] = {
   0.01058183,
   0.007239066,
   0.005357391,
   0.004180218,
   0.003225999,
   0.002628702,
   0.002284862,
   0.002180783,
   0.002215254,
   0.00222025,
   0.002282517,
   0.00228563,
   0.00308525,
   0.003373356};
   graph = new TGraph(14,Graph4_fx3,Graph4_fy3);
   graph->SetName("Graph4");
   graph->SetTitle("Graph");
   graph->SetFillStyle(1000);

   ci = TColor::GetColor("#ff3333");
   graph->SetLineColor(ci);
   graph->SetLineStyle(8);
   graph->SetLineWidth(3);
   
   TH1F *Graph_Graph43 = new TH1F("Graph_Graph43","Graph",100,0.24,2.16);
   Graph_Graph43->SetMinimum(0.001340678);
   Graph_Graph43->SetMaximum(0.01142193);
   Graph_Graph43->SetDirectory(0);
   Graph_Graph43->SetStats(0);

   ci = TColor::GetColor("#000099");
   Graph_Graph43->SetLineColor(ci);
   Graph_Graph43->GetXaxis()->SetLabelFont(42);
   Graph_Graph43->GetXaxis()->SetTitleOffset(1);
   Graph_Graph43->GetXaxis()->SetTitleFont(42);
   Graph_Graph43->GetYaxis()->SetLabelFont(42);
   Graph_Graph43->GetYaxis()->SetTitleFont(42);
   Graph_Graph43->GetZaxis()->SetLabelFont(42);
   Graph_Graph43->GetZaxis()->SetTitleOffset(1);
   Graph_Graph43->GetZaxis()->SetTitleFont(42);
   graph->SetHistogram(Graph_Graph43);
   
   graph->Draw("l");
   
   Double_t Graph5_fx4[14] = {
   0.4,
   0.5,
   0.6,
   0.7,
   0.8,
   0.9,
   1,
   1.1,
   1.2,
   1.3,
   1.4,
   1.5,
   1.75,
   2};
   Double_t Graph5_fy4[14] = {
   0.01413686,
   0.0110763,
   0.006980499,
   0.004701607,
   0.004096683,
   0.002372605,
   0.002183384,
   0.002183208,
   0.002159301,
   0.002255638,
   0.002398127,
   0.002435278,
   0.003328693,
   0.003863794};
   graph = new TGraph(14,Graph5_fx4,Graph5_fy4);
   graph->SetName("Graph5");
   graph->SetTitle("Graph");
   graph->SetFillStyle(1000);

   ci = TColor::GetColor("#333333");
   graph->SetLineColor(ci);
   graph->SetLineWidth(3);

   ci = TColor::GetColor("#333333");
   graph->SetMarkerColor(ci);
   graph->SetMarkerStyle(20);
   
   TH1F *Graph_Graph54 = new TH1F("Graph_Graph54","Graph",100,0.24,2.16);
   Graph_Graph54->SetMinimum(0.0009615447);
   Graph_Graph54->SetMaximum(0.01533462);
   Graph_Graph54->SetDirectory(0);
   Graph_Graph54->SetStats(0);

   ci = TColor::GetColor("#000099");
   Graph_Graph54->SetLineColor(ci);
   Graph_Graph54->GetXaxis()->SetLabelFont(42);
   Graph_Graph54->GetXaxis()->SetTitleOffset(1);
   Graph_Graph54->GetXaxis()->SetTitleFont(42);
   Graph_Graph54->GetYaxis()->SetLabelFont(42);
   Graph_Graph54->GetYaxis()->SetTitleFont(42);
   Graph_Graph54->GetZaxis()->SetLabelFont(42);
   Graph_Graph54->GetZaxis()->SetTitleOffset(1);
   Graph_Graph54->GetZaxis()->SetTitleFont(42);
   graph->SetHistogram(Graph_Graph54);
   
   graph->Draw("lp");
   
   Double_t Graph6_fx5[11] = {
   //0.4,
   //0.5,
   //0.6,
   0.7,
   0.8,
   0.9,
   1,
   1.1,
   1.2,
   1.3,
   1.4,
   1.5,
   1.75,
   2};
   Double_t Graph6_fy5[11] = {
   //8.597127,
   //2.395643,
   //0.793404,
   0.295855,
   0.12055,
   0.052475,
   0.024082,
   0.011558,
   0.005725,
   0.002917,
   0.001523,
   0.000806,
   0.00022,
   5.1e-05};
   graph = new TGraph(11,Graph6_fx5,Graph6_fy5);
   graph->SetName("Graph6");
   graph->SetTitle("/home/maolining/sgluon_combined/limit/xsec_sgluon_theory.txt");
   graph->SetFillStyle(1000);

   ci = TColor::GetColor("#0066ff");
   graph->SetLineColor(ci);
   graph->SetLineWidth(2);
   
   TH1F *Graph_Graph65 = new TH1F("Graph_Graph65","/home/maolining/sgluon_combined/limit/xsec_sgluon_theory.txt",100,0.24,2.16);
   Graph_Graph65->SetMinimum(4.59e-05);
   Graph_Graph65->SetMaximum(9.456835);
   Graph_Graph65->SetDirectory(0);
   Graph_Graph65->SetStats(0);

   ci = TColor::GetColor("#000099");
   Graph_Graph65->SetLineColor(ci);
   Graph_Graph65->GetXaxis()->SetLabelFont(42);
   Graph_Graph65->GetXaxis()->SetTitleOffset(1);
   Graph_Graph65->GetXaxis()->SetTitleFont(42);
   Graph_Graph65->GetYaxis()->SetLabelFont(42);
   Graph_Graph65->GetYaxis()->SetTitleFont(42);
   Graph_Graph65->GetZaxis()->SetLabelFont(42);
   Graph_Graph65->GetZaxis()->SetTitleOffset(1);
   Graph_Graph65->GetZaxis()->SetTitleFont(42);
   graph->SetHistogram(Graph_Graph65);
   
   graph->Draw("l");
   
   TLegend *leg = new TLegend(0.5,0.46,0.92,0.922,NULL,"brNDC");
   leg->SetBorderSize(1);
   leg->SetLineColor(1);
   leg->SetLineStyle(1);
   leg->SetLineWidth(0);
   leg->SetFillColor(0);
   leg->SetFillStyle(0);
   TLegendEntry *entry=leg->AddEntry("Graph5","Observed (combined)","lp");

   ci = TColor::GetColor("#333333");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);

   ci = TColor::GetColor("#333333");
   entry->SetMarkerColor(ci);
   entry->SetMarkerStyle(20);
   entry->SetMarkerSize(1);
   entry->SetTextFont(42);
   entry=leg->AddEntry("Graph2","Expected (combined)","l");

   ci = TColor::GetColor("#333333");
   entry->SetLineColor(ci);
   entry->SetLineStyle(9);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(42);
   entry=leg->AddEntry("Graph1","Expected #pm1#sigma (combined)","f");
   entry->SetFillColor(3);
   entry->SetFillStyle(1000);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(42);
   entry=leg->AddEntry("Graph0","Expected #pm2#sigma (combined)","f");
   entry->SetFillColor(5);
   entry->SetFillStyle(1000);
   entry->SetLineColor(1);
   entry->SetLineStyle(1);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(42);
   entry=leg->AddEntry("Graph3","Expected (1L/2LOS)","l");

   ci = TColor::GetColor("#0099ff");
   entry->SetLineColor(ci);
   entry->SetLineStyle(8);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(42);
   entry=leg->AddEntry("Graph4","Expected (2LSS/ML)","l");

   ci = TColor::GetColor("#ff3333");
   entry->SetLineColor(ci);
   entry->SetLineStyle(8);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(42);
   entry=leg->AddEntry("Graph6","Theory (LO)","l");

   ci = TColor::GetColor("#0066ff");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(2);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(21);
   entry->SetMarkerSize(1);
   entry->SetTextFont(42);
   leg->Draw();
   TLatex *   tex = new TLatex(0.18,0.867,"#it{ATLAS}");
tex->SetNDC();
   tex->SetTextSize(0.045);
   tex->SetLineWidth(2);
   tex->Draw();
      tex = new TLatex(0.18,0.807,"#bf{#sqrt{s} = 13 TeV, 139 fb^{-1}}");
tex->SetNDC();
   tex->SetTextSize(0.045);
   tex->SetLineWidth(2);
   tex->Draw();
      tex = new TLatex(0.18,0.747,"#bf{1L/2LOS+2LSS/ML}");
tex->SetNDC();
   tex->SetTextSize(0.045);
   tex->SetLineWidth(2);
   tex->Draw();
      tex = new TLatex(0.18,0.69,"#bf{#it{All limits at 95% CL}}");
tex->SetNDC();
   tex->SetTextSize(0.045);
   tex->SetLineWidth(2);
   tex->Draw();
      tex = new TLatex(0,0,"");
tex->SetNDC();
   tex->SetTextSize(0.045);
   tex->SetLineWidth(2);
   tex->Draw();
   pad->Modified();
   c->cd();
   c->Modified();
   c->cd();
   c->SetSelected(c);

   c->SaveAs("sgluon_lim_combined_with_individual_exp.pdf");
}
