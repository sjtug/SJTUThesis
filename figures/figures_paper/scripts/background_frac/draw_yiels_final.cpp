#include<vector>
#include<iostream>


void draw_yiels_final() {

  gStyle->SetOptStat(0);

  string location = "./Histograms/";

  vector<pair<string,string>> regions_1l {
    {"ljets_8j3bL","8j,3bL"},
    {"ljets_9j3bL","9j,3bL"},
    {"ljets_ge10j3bL","#geq10j,3bL"},
    {"ljets_8j3bV","8j,3bV"},
    {"ljets_9j3bV","9j,3bV"},
    {"ljets_ge10j3bV","#geq10j,3bV"},
    {"ljets_8j3bH","8j,3bH"},
    {"ljets_9j3bH","9j,3bH"},
    {"ljets_ge10j3bH","#geq10j,3bH"},
    {"ljets_8j4b","8j,4b"},
    {"ljets_9j4b","9j,4b"},
    {"ljets_ge10j4b","#geq10j,4b"},
    {"ljets_8jge5b","8j,#geq5b"},
    {"ljets_9jge5b","9j,#geq5b"},
    {"ljets_ge10jge5b","#geq10j,#geq5b"},
  };

  vector<pair<string,string>> regions_2l {
    {"os2l_6j3bL","6j,3bL"},
    {"os2l_7j3bL","7j,3bL"},
    {"os2l_ge8j3bL","#geq8j,3bL"},
    {"os2l_6j3bV","6j,3bV"},
    {"os2l_7j3bV","7j,3bV"},
    {"os2l_ge8j3bV","#geq8j,3bV"},
    {"os2l_6j3bH","6j,3bH"},
    {"os2l_7j3bH","7j,3bH"},
    {"os2l_ge8j3bH","#geq8j,3bH"},
    {"os2l_6jge4b","6j,#geq4b"},
    {"os2l_7jge4b","7j,#geq4b"},
    {"os2l_ge8jge4b","#geq8j,#geq4b"}
  };

  vector<pair<string,string>> samples {
    {"other","Other"},
    {"tttt","t#bar{t}t#bar{t}"},
    {"ttbbb","t#bar{t}+#geq3b"},
    {"ttbb","t#bar{t}+b#bar{b}"},
    {"ttB","t#bar{t}+B"},
    {"ttb","t#bar{t}+b"},
    {"TTC","t#bar{t}+#geq1c"},
    {"TTL","t#bar{t}+light"}
  };

  vector<unsigned> color_code {
    0,
    422,
    860-9,
    860-4,
    860-5,
    860-6,
    813,
    812
  };

  unsigned n_samples = samples.size();
  unsigned n_regions_1l = regions_1l.size();
  unsigned n_regions_2l = regions_2l.size();

  map<string,TH1F*> hists_1l;
  map<string,TH1F*> hists_2l;
  for (const auto &sample: samples) {
    hists_1l[sample.first] = new TH1F((sample.first+"_1l").c_str(),"",n_regions_1l,0,n_regions_1l);
    hists_2l[sample.first] = new TH1F((sample.first+"_2l").c_str(),"",n_regions_2l,0,n_regions_2l);
  }
  unsigned n_bin;

  
  gStyle->SetPadTopMargin(0.165);
  gStyle->SetPadBottomMargin(0.19);
  gStyle->SetPadLeftMargin(0.13);
  gStyle->SetPadRightMargin(0.01);
  gStyle->SetLabelSize(0.065,"X");
  gStyle->SetLabelSize(0.045,"Y");
  gStyle->SetTitleSize(0.055,"Y");

  // 1L -----------------------------

  n_bin = 1;
  for (const auto &region : regions_1l) {
    float yield = 0.0;
    map<string,float> yields;
    for (const auto &sample : samples) {
      string file = location+"yields_"+region.first+"_histos.root";
      string hist_name = region.first+"/"+sample.first+"/nominal/"+region.first+"_"+sample.first;
      TFile *f = new TFile(file.c_str());
      TH1F* htmp = (TH1F*)f->Get(hist_name.c_str());
      yield += htmp->Integral();
      yields[sample.first] = yield;
      delete htmp;
      f->Close();
    }

    for (const auto &y : yields) {
      hists_1l[y.first]->SetBinContent(n_bin,y.second/yield);
    }
    n_bin++;
  }

  TCanvas *c_1l = new TCanvas("c_1l","",1700,1300);
  c_1l->SetTickx(); c_1l->SetTicky();

  TH2F *hcan_1l = new TH2F("hcan_1l","",n_regions_1l,0,n_regions_1l,100,0,1.0);
  hcan_1l->GetYaxis()->SetTitle("Relative contribution");
  n_bin=1;
  for (auto &region : regions_1l) {hcan_1l->GetXaxis()->SetBinLabel(n_bin++,region.second.c_str());}

  hcan_1l->Draw("");
  hcan_1l->LabelsOption("v");

  TLegend *leg_1l = new TLegend(0.55,0.845,1.0,0.99);
  leg_1l->SetLineWidth(0);
  leg_1l->SetNColumns(3);

  unsigned n_reg = 0;
  for (unsigned it=n_samples;it>0;it--) {
    hists_1l[samples[it-1].first]->SetFillColor(color_code[n_reg]);
    int linecolor = color_code[n_reg];
    if(color_code[n_reg] == 0) linecolor = 1;
    hists_1l[samples[it-1].first]->SetLineColor(linecolor);
    hists_1l[samples[it-1].first]->SetFillStyle(1001);
    hists_1l[samples[it-1].first]->Draw("same");
    leg_1l->AddEntry(hists_1l[samples[it-1].first],samples[it-1].second.c_str(),"f");
    n_reg++;
  }

  TLatex latex_1l;
  latex_1l.SetTextSize(0.043);
  latex_1l.SetTextAlign(13);  //align at top
  latex_1l.DrawLatex(0.2,1.23,"#it{ATLAS} #bf{Simulation}");
  latex_1l.DrawLatex(0.2,1.165,"#bf{#sqrt{s}=13 TeV, 139 fb^{-1}}");
  latex_1l.DrawLatex(0.2,1.075,"#bf{1L}");

  leg_1l->Draw();
  //hcan_1l->GetXaxis()->DrawClone();
  hcan_1l->Draw("same AXIS");

  c_1l->SaveAs("./1l_bkg_frac.pdf");

 
  // 2L -----------------------------

  n_bin = 1;
  for (const auto &region : regions_2l) {
    float yield = 0.0;
    map<string,float> yields;
    for (const auto &sample : samples) {
      string file = location+"yields_"+region.first+"_histos.root";
      string hist_name = region.first+"/"+sample.first+"/nominal/"+region.first+"_"+sample.first;
      cout << file << endl;
      cout << hist_name << endl;
      TFile *f = new TFile(file.c_str());
      TH1F* htmp = (TH1F*)f->Get(hist_name.c_str());
      yield += htmp->Integral();
      yields[sample.first] = yield;
      delete htmp;
      f->Close();
    }

    for (const auto &y : yields) {
      hists_2l[y.first]->SetBinContent(n_bin,y.second/yield);
    }
    n_bin++;
  }

  TCanvas *c_2l = new TCanvas("c_2l","",1500,1300);
  c_2l->SetTickx(); c_2l->SetTicky();

  TH2F *hcan_2l = new TH2F("hcan_2l","",n_regions_2l,0,n_regions_2l,100,0,1.0);
  hcan_2l->GetYaxis()->SetTitle("Relative contribution");
  n_bin=1;
  for (auto &region : regions_2l) {hcan_2l->GetXaxis()->SetBinLabel(n_bin++,region.second.c_str());}

  hcan_2l->Draw();
  hcan_2l->LabelsOption("v");

  TLegend *leg_2l = new TLegend(0.54,0.845,1.0,0.99);
  leg_2l->SetLineWidth(0);
  leg_2l->SetNColumns(3);

  n_reg = 0;
  for (unsigned it=n_samples;it>0;it--) {
    hists_2l[samples[it-1].first]->SetFillColor(color_code[n_reg]);
    int linecolor = color_code[n_reg];
    if(color_code[n_reg] == 0) linecolor = 1;
    hists_2l[samples[it-1].first]->SetLineColor(linecolor);
    hists_2l[samples[it-1].first]->SetFillStyle(1001);
    hists_2l[samples[it-1].first]->Draw("same");
    leg_2l->AddEntry(hists_2l[samples[it-1].first],samples[it-1].second.c_str(),"f");
    n_reg++;
  }
  
  TLatex latex_2l;
  latex_2l.SetTextSize(0.043);
  latex_2l.SetTextAlign(13);  //align at top
  latex_2l.DrawLatex(0.1,1.23,"#it{ATLAS} #bf{Simulation}");
  latex_2l.DrawLatex(0.1,1.165,"#bf{#sqrt{s}=13 TeV, 139 fb^{-1}}");
  latex_2l.DrawLatex(0.1,1.075,"#bf{2LOS}");

  leg_2l->Draw();
  hcan_2l->Draw("same AXIS");

  c_2l->SaveAs("./2los_bkg_frac.pdf");
 
}
