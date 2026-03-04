// plot_eff_acc.C
// Read selection efficiency and acceptance histograms from a ROOT file and save PDFs.
// Run with:  root -l -b -q plot_eff_acc.C

#include <iostream>
#include <string>

void DrawAndSave(TH1D* h,
                 const std::string& yTitle,
                 const std::string& xTitle,
                 const std::string& outPath,
                 double yMin, double yMax)
{
    TCanvas* c = new TCanvas("c_tmp", "", 800, 600);
    c->SetLeftMargin(0.12);
    c->SetBottomMargin(0.12);
    c->SetTopMargin(0.08);
    c->SetRightMargin(0.05);

    // ── histogram style ───────────────────────────────────────────────────
    h->SetLineColor(kBlue+1);
    h->SetMarkerColor(kBlue+1);
    h->SetMarkerStyle(20);
    h->SetMarkerSize(0.9);
    h->SetLineWidth(2);

    h->GetYaxis()->SetTitle(yTitle.c_str());
    h->GetXaxis()->SetTitle(xTitle.c_str());
    h->GetYaxis()->SetTitleSize(0.05);
    h->GetXaxis()->SetTitleSize(0.05);
    h->GetYaxis()->SetLabelSize(0.04);
    h->GetXaxis()->SetLabelSize(0.04);
    h->GetYaxis()->SetTitleOffset(1.1);
    h->GetXaxis()->SetTitleOffset(1.0);

    h->SetMaximum(yMax);
    h->SetMinimum(yMin);

    h->Draw("E1");   // draw with error bars

    // ── ATLAS-style text in top-left ──────────────────────────────────────
    TLatex latex;
    latex.SetNDC();
    // latex.SetTextFont(72);  // ATLAS italic bold
    // latex.SetTextSize(0.04);
    // latex.DrawLatex(0.14, 0.88, "ATLAS");

    // latex.SetTextFont(42);
    // latex.SetTextSize(0.04);
    // latex.DrawLatex(0.27, 0.88, "Internal");

    latex.SetTextFont(42);
    latex.SetTextSize(0.038);
    latex.DrawLatex(0.17, 0.83, "#sqrt{s} = 13.6 TeV,  165 fb^{-1}");

    c->SaveAs(outPath.c_str());
    delete c;
}

void plot_eff_acc()
{
    gROOT->SetBatch(kTRUE);
    gStyle->SetOptStat(0);
    gStyle->SetOptTitle(0);

    // ── input file ────────────────────────────────────────────────────────
    const std::string inFile = "/eos/user/l/lmao/SM4tops/reco_studies/FF_workflow/"
                               "histos_fullbackground_equalyields/tttt.root";

    TFile* f = TFile::Open(inFile.c_str(), "READ");
    if (!f || f->IsZombie()) {
        std::cerr << "[ERROR] Cannot open file: " << inFile << "\n";
        return;
    }

    // ── output directory ──────────────────────────────────────────────────
    const std::string outDir = "/afs/cern.ch/user/l/lmao/MyWorkingDir/SM4tops/test/Unfolding_plots/";

    // ── selection efficiency ──────────────────────────────────────────────
    TH1D* hEff = dynamic_cast<TH1D*>(
        f->Get("NOSYS/selection_eff_parton_4tops_mass_SR_inclusive"));
    if (!hEff) {
        std::cerr << "[ERROR] Histogram 'NOSYS/selection_eff_parton_4tops_mass_SR_inclusive' not found.\n";
        f->Close(); delete f;
        return;
    }
    hEff = dynamic_cast<TH1D*>(hEff->Clone("hEff_clone"));
    hEff->SetDirectory(0);

    // ── acceptance ────────────────────────────────────────────────────────
    TH1D* hAcc = dynamic_cast<TH1D*>(
        f->Get("NOSYS/acceptance_parton_4tops_mass_SR_inclusive"));
    if (!hAcc) {
        std::cerr << "[ERROR] Histogram 'NOSYS/acceptance_parton_4tops_mass_SR_inclusive' not found.\n";
        f->Close(); delete f;
        return;
    }
    hAcc = dynamic_cast<TH1D*>(hAcc->Clone("hAcc_clone"));
    hAcc->SetDirectory(0);

    f->Close(); delete f;

    // ── draw and save ─────────────────────────────────────────────────────
    DrawAndSave(hEff,
                "Efficiency",
                "Parton-level m_{tttt} [GeV]",
                outDir + "selection_eff_parton_4tops_mass_SR_inclusive.pdf",
                0.22, 0.32);

    DrawAndSave(hAcc,
                "Acceptance",
                "Reco-level m_{tttt} [GeV]",
                outDir + "acceptance_parton_4tops_mass_SR_inclusive.pdf",
                0.9, 1.1);

    delete hEff;
    delete hAcc;

    std::cout << "[INFO] Plots saved to " << outDir << "\n";
}
