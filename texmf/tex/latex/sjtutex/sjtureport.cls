%%
%% This is file `sjtureport.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% sjtutex.dtx  (with options: `class,report')
%% 
%%     Copyright (C) SJTUG
%%       2018--2024 Weijian Wu   <alexarawu@outlook.com>
%%       2022--2024 Zilong Li    <logcreative@outlook.com>
%% 
%%     This work may be distributed and/or modified under the
%%     conditions of the LaTeX Project Public License, either
%%     version 1.3c of this license or (at your option) any later
%%     version. The latest version of this license is in:
%% 
%%       http://www.latex-project.org/lppl.txt
%% 
%%     and version 1.3 or later is part of all distributions of
%%     LaTeX version 2005/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[2020/10/01]
\providecommand\IfFormatAtLeastTF{\@ifl@t@r\fmtversion}
\IfFormatAtLeastTF{2020/10/01}{}
 {\PackageError{sjtutex}
   {Your LaTeX format is outdated!\MessageBreak\MessageBreak
    Release `2020/10/01' or newer is required to\MessageBreak
    compile this document.\MessageBreak\MessageBreak
    Please update your TeX distribution}{}}
\GetIdInfo$Id: sjtutex.dtx 879eea9 2024-11-06 19:54:03 +0800 Alexara Wu <alexarawu@outlook.com> $
  {Report document class for Shanghai Jiao Tong University (SJTUTeX)}
\ProvidesExplClass{sjtureport}
  {\ExplFileDate}{2.1.5}{\ExplFileDescription}
\dim_new:N \l__sjtu_tmp_dim
\skip_new:N \l__sjtu_tmp_skip
\box_new:N \l__sjtu_tmp_box
\tl_new:N \g__sjtu_lang_tl
\tl_const:Nn \c__sjtu_lang_de_tl { de }
\tl_const:Nn \c__sjtu_lang_ja_tl { ja }
\tl_new:N \g__sjtu_zihao_tl
\int_new:N \g__sjtu_font_size_int
\dim_new:N \g__sjtu_font_size_dim
\dim_new:N \g__sjtu_baseline_skip_dim
\bool_new:N \g__sjtu_fixed_baselineskip_bool
\fp_new:N \g__sjtu_line_spread_fp
\tl_new:N \g__sjtu_text_font_tl
\tl_new:N \g__sjtu_math_font_tl
\tl_new:N \g__sjtu_cjk_font_tl
\bool_new:N \g__sjtu_slanted_uppercase_greek_bool
\bool_new:N \g__sjtu_upright_integral_bool
\bool_new:N \g__sjtu_integral_limits_bool
\clist_new:N \g__sjtu_math_font_options_clist
\clist_set:Nn \g__sjtu_options_to_ctex_class_clist
  { a4paper, UTF8, scheme = plain, fontset = none }
\clist_new:N \g__sjtu_options_to_packages_clist
\bool_new:N \g__sjtu_twoside_bool
\bool_set_false:N \g__sjtu_twoside_bool
\bool_new:N \g__sjtu_openright_bool
\bool_set_false:N \g__sjtu_openright_bool
\bool_new:N \g__sjtu_titlepage_bool
\bool_set_true:N \g__sjtu_titlepage_bool
\bool_new:N \g__sjtu_draft_bool
\cs_new_protected:Npn \__sjtu_deprecated_option:n
  { \msg_warning:nnn { sjtutex } { deprecated-option } }
\cs_new_protected:Npn \__sjtu_set_deprecated_option:n #1
  {
    \__sjtu_deprecated_option:n { Option~ `#1'~ is~ set. }
    \keys_set:nn { sjtu / option } {#1}
  }
\msg_new:nnn { sjtutex } { deprecated-option }
  { Option~ `\l_keys_key_tl'~ is~ deprecated. \\ #1 }
\keys_define:nn { sjtu / option }
  {
    lang .choice: ,
    lang .value_required:n = true ,
    lang .choices:nn =
      { zh, en, de, ja }
      {
        \tl_gset_eq:NN \g__sjtu_lang_tl \l_keys_choice_tl
      } ,
    lang .initial:n = { zh } ,
    zihao .choice: ,
    zihao .value_required:n = true ,
    zihao /  5 .code:n =
      {
        \tl_gset:Nn  \g__sjtu_zihao_tl {#1}
        \int_gset:Nn \g__sjtu_font_size_int { 1 }
        \dim_gset:Nn \g__sjtu_font_size_dim { 10.5 bp }
      } ,
    zihao / -4 .code:n =
      {
        \tl_gset:Nn  \g__sjtu_zihao_tl {#1}
        \int_gset:Nn \g__sjtu_font_size_int { 2 }
        \dim_gset:Nn \g__sjtu_font_size_dim { 12   bp }
      } ,
    zihao .initial:n = { -4 } ,
    linespread .fp_gset:N = \g__sjtu_line_spread_fp ,
    linespread .initial:n = { \c_nan_fp } ,
    linespread .value_required:n = true ,
    baselineskip .choice: ,
    baselineskip .value_required:n = true ,
    baselineskip / false   .code:n =
      { \bool_gset_false:N \g__sjtu_fixed_baselineskip_bool } ,
    baselineskip / unknown .code:n =
      {
        \bool_gset_true:N  \g__sjtu_fixed_baselineskip_bool
        \dim_gset:Nn \g__sjtu_baseline_skip_dim {#1}
      } ,
    baselineskip .initial:n = { false } ,
    text-font .tl_gset:N = \g__sjtu_text_font_tl ,
    text-font .initial:n = { newtx } ,
    math-font .tl_gset:N = \g__sjtu_math_font_tl ,
    cjk-font  .tl_gset:N = \g__sjtu_cjk_font_tl ,
    fontset .code:n = { \__sjtu_set_deprecated_option:n { cjk-font = #1 } } ,
    math-style .choice: ,
    math-style .value_required:n = true,
    math-style / TeX .code:n =
      {
        \bool_gset_false:N \g__sjtu_slanted_uppercase_greek_bool
        \bool_gset_false:N \g__sjtu_upright_integral_bool
        \bool_gset_false:N \g__sjtu_integral_limits_bool
      } ,
    math-style / ISO .code:n =
      {
        \bool_gset_true:N \g__sjtu_slanted_uppercase_greek_bool
        \bool_gset_true:N \g__sjtu_upright_integral_bool
        \bool_gset_true:N \g__sjtu_integral_limits_bool
      } ,
    math-style .initial:n = { ISO } ,
    uppercase-greek .choice: ,
    uppercase-greek .value_required:n = true ,
    uppercase-greek / slanted .code:n =
      { \bool_gset_true:N  \g__sjtu_slanted_uppercase_greek_bool } ,
    uppercase-greek / upright .code:n =
      { \bool_gset_false:N \g__sjtu_slanted_uppercase_greek_bool } ,
    integral .choice: ,
    integral .value_required:n = true ,
    integral / slanted .code:n =
      { \bool_gset_false:N \g__sjtu_upright_integral_bool } ,
    integral / upright .code:n =
      { \bool_gset_true:N  \g__sjtu_upright_integral_bool } ,
    integral-limits .choice: ,
    integral-limits .value_required:n = true ,
    integral-limits / false .code:n =
      { \bool_gset_false:N \g__sjtu_integral_limits_bool } ,
    integral-limits / true  .code:n =
      { \bool_gset_true:N  \g__sjtu_integral_limits_bool } ,
    oneside .value_forbidden:n = true,
    twoside .value_forbidden:n = true,
    oneside .code:n =
      { \bool_gset_false:N \g__sjtu_twoside_bool } ,
    twoside .code:n =
      { \bool_gset_true:N  \g__sjtu_twoside_bool } ,
    openany   .value_forbidden:n = true,
    openright .value_forbidden:n = true,
    openany   .code:n =
      { \bool_gset_false:N \g__sjtu_openright_bool } ,
    openright .code:n =
      { \bool_gset_true:N  \g__sjtu_openright_bool } ,
    titlepage   .value_forbidden:n = true,
    notitlepage .value_forbidden:n = true,
    titlepage   .code:n =
      { \bool_gset_true:N  \g__sjtu_titlepage_bool } ,
    notitlepage .code:n =
      { \bool_gset_false:N \g__sjtu_titlepage_bool } ,
    draft .value_forbidden:n = true,
    final .value_forbidden:n = true,
    draft .code:n =
      { \bool_gset_true:N  \g__sjtu_draft_bool } ,
    final .code:n =
      { \bool_gset_false:N \g__sjtu_draft_bool } ,
    unknown .code:n = { \msg_error:nn { sjtutex } { unknown-option } }
  }
\msg_new:nnn { sjtutex } { unknown-option }
  { Class~ option~ "\l_keys_key_tl"~ is~ unknown. }
\cs_if_exist:NTF \ProcessKeyOptions
  { \ProcessKeyOptions [ sjtu / option ] }
  {
    \RequirePackage { l3keys2e }
    \ProcessKeysOptions { sjtu / option }
  }
\bool_if:NF \g__sjtu_fixed_baselineskip_bool
  {
    \fp_if_nan:nT { \g__sjtu_line_spread_fp }
      { \fp_set:Nn \g__sjtu_line_spread_fp { 1.3 } }
  }
\clist_set:Nx \g__sjtu_math_font_options_clist
  {
    \bool_if:NT \g__sjtu_slanted_uppercase_greek_bool
      { slantedGreek } ,
    \bool_if:NT \g__sjtu_upright_integral_bool
      { upint }
  }
\clist_put_right:Nx \@classoptionslist
  {
    a4paper ,
    \tl_if_eq:NNT \g__sjtu_lang_tl \c__sjtu_lang_de_tl
      { german, ngerman } ,
    \bool_if:NT \g__sjtu_integral_limits_bool
      { intlimits } ,
    \g__sjtu_math_font_options_clist
  }
\clist_put_right:Nx \g__sjtu_options_to_ctex_class_clist
  {
    zihao      = \g__sjtu_zihao_tl ,
    \fp_if_nan:nF { \g__sjtu_line_spread_fp }
      { linespread = \fp_use:N \g__sjtu_line_spread_fp } ,
    \bool_if:NTF \g__sjtu_twoside_bool
      { twoside   } { oneside     } ,
    \bool_if:NTF \g__sjtu_openright_bool
      { openright } { openany     } ,
    \bool_if:NTF \g__sjtu_titlepage_bool
      { titlepage } { notitlepage } ,
    \bool_if:NTF \g__sjtu_draft_bool
      { draft     } { final       }
  }
\exp_args:No \PassOptionsToClass
  { \g__sjtu_options_to_ctex_class_clist }
  { ctexrep }
\clist_set:Nx \g__sjtu_options_to_packages_clist
  {
    { no-math           } { fontspec     } ,
    { list = off        } { bicaption    } ,
    { warnings-off =
      {
        mathtools-overbracket,
        mathtools-colon
      }
    }                     { unicode-math } ,
    { amsmath, thmmarks } { ntheorem     } ,
    { chapter           } { algorithm    } ,
    { algochapter       } { algorithm2e  } ,
    {
      \bool_if:NTF \g__sjtu_integral_limits_bool
        { displaylimits } { nolimits }
    }                     { cmupint      }
  }
\clist_map_inline:Nn \g__sjtu_options_to_packages_clist
  { \PassOptionsToPackage #1 }
\LoadClass { ctexrep }
\RequirePackage
  {
    mathtools,
    geometry,
    fancyhdr,
    titletoc,
    caption,
    bicaption,
    subcaption,
    xcolor,
    graphicx,
    enumitem
  }
\cs_generate_variant:Nn \cs_gset:Npn { cpo }
\cs_generate_variant:Nn \tl_const:Nn { Nv }
\cs_generate_variant:Nn \clist_use:Nn { NV, cv }
\exp_args_generate:n { Nnv }
\cs_generate_variant:Nn \exp_last_unbraced:Ne { ce }
\prg_generate_conditional_variant:Nnn \regex_match:nn { ne } { T, TF }
\cs_new:Npx \__sjtu_engine_case:nn #1#2
  {
    \bool_lazy_or:nnTF
      { \sys_if_engine_xetex_p:  }
      { \sys_if_engine_luatex_p: }
      {#2}
      { \sys_if_engine_pdftex:T {#1} }
  }
\cs_new:Npx \__sjtu_engine_case:nnn #1#2#3
  {
    \sys_if_engine_xetex:TF
      {#2}
      {
        \sys_if_engine_luatex:TF
          {#3}
          { \sys_if_engine_pdftex:T {#1} }
      }
  }
\cs_new:Npx \__sjtu_unicode_engine_case:nn #1#2
  {
    \sys_if_engine_xetex:TF
      {#1}
      { \sys_if_engine_luatex:T {#2} }
  }
\__sjtu_engine_case:nn
  {
    \cs_new:Npn \__sjtu_unicode_char:n #1
      {
        \exp_not:N \Unicode
          { \int_div_truncate:nn {#1} { 256 } }
          { \int_mod:nn          {#1} { 256 } }
      }
  }
  { \cs_new:Npn \__sjtu_unicode_char:n #1 { \tex_Uchar:D #1 \scan_stop: } }
\cs_new_protected:Npn \__sjtu_preto_cmd:Nn #1#2
  {
    \ctex_preto_cmd:NnnTF #1 { } {#2}
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new_protected:Npn \__sjtu_appto_cmd:Nn #1#2
  {
    \ctex_appto_cmd:NnnTF #1 { } {#2}
      { } { \ctex_patch_failure:N #1 }
  }
\cs_new:Npn \__sjtu_skip_add_to_wd:Nn #1#2
  {
    \hbox_set:Nn \l__sjtu_tmp_box {#2}
    \skip_add:Nn #1 { \box_wd:N \l__sjtu_tmp_box }
  }
\cs_generate_variant:Nn \__sjtu_skip_add_to_wd:Nn { cv }
\cs_new:Npn \__sjtu_cs_provide_eq:NN #1#2
  { \cs_if_exist:NF #1 { \cs_set_eq:NN #1 #2 } }
\cs_generate_variant:Nn \__sjtu_cs_provide_eq:NN { cc }
\cs_new_protected:Npn \__sjtu_define_name:nn #1#2
  { \tl_const:cn { c__sjtu_name_ #1 _tl } {#2} }
\cs_new_protected:Npn \__sjtu_define_name:nnn #1#2#3
  { \tl_const:cn { c__sjtu_name_ #2 _ #1 _tl } {#3} }
\cs_new_protected:Npn \__sjtu_define_symbol:nn #1#2
  { \tl_const:cx { c__sjtu_symbol_ #1 _tl } { \__sjtu_unicode_char:n {#2} } }
\cs_new_protected:Npn \__sjtu_set_font_size:nnNn #1#2#3#4
  { \cs_set_protected:Npn #3 { \@setfontsize #3 {#1} {#2} #4 } }
\tl_set:Nx \l__sjtu_font_size_tl
  {
    { \dim_to_decimal:n { \g__sjtu_font_size_dim     } }
    { \dim_to_decimal:n { \g__sjtu_baseline_skip_dim } }
  }
\bool_if:NT \g__sjtu_fixed_baselineskip_bool
  {
    \int_case:nn { \g__sjtu_font_size_int }
      {
        { 1 } {
                \exp_after:wN \__sjtu_set_font_size:nnNn \l__sjtu_font_size_tl
                  \normalsize
                  {
                    \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
                    \abovedisplayshortskip \z@ \@plus3\p@
                    \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
                    \belowdisplayskip \abovedisplayskip
                    \let\@listi\@listI
                  }
              }
        { 2 } {
                \exp_after:wN \__sjtu_set_font_size:nnNn \l__sjtu_font_size_tl
                  \normalsize
                  {
                    \abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
                    \abovedisplayshortskip \z@ \@plus3\p@
                    \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
                    \belowdisplayskip \abovedisplayskip
                    \let\@listi\@listI
                  }
              }
      }
    \normalsize
  }
\NewDocumentCommand \setbaselineskip { m }
  { \fontsize { \f@size } {#1} \selectfont }
\cs_new_protected:Npn \__sjtu_fontset_error:nn #1#2
  { \msg_error:nnnn { sjtutex } { font-unavailable } {#1} {#2} }
\msg_new:nnn { sjtutex } { font-unavailable }
  { `#1-font~ =~ #2'~ is~ unavailable~ in~ current~ mode. }
\cs_new_eq:NN \__sjtu_fontset_case:nn \__sjtu_engine_case:nn
\cs_new:Npx \__sjtu_fontset_case:nnn #1#2#3
  {
    \__sjtu_engine_case:nn
      { \sys_if_output_pdf:TF {#1} {#2} }
      {#3}
  }
\cs_new_protected:Nn \__sjtu_declare_math_symbol:nnNn
  {
    \cs_undefine:N #3
    \DeclareMathSymbol {#3} {#1} {#2} {#4}
  }
\cs_new_protected:Nn \__sjtu_set_slanted_greek:
  {
    \clist_const:Nn \c__sjtu_uppercase_greek_clist
      { Gamma, Delta, Theta, Lambda, Xi, Pi, Sigma, Upsilon, Phi, Psi, Omega }
    \clist_map_inline:Nn \c__sjtu_uppercase_greek_clist
      {
        \cs_set_eq:cc { up ##1 } {     ##1 }
        \cs_set_eq:cc { it ##1 } { var ##1 }
      }
    \bool_if:NT \g__sjtu_slanted_uppercase_greek_bool
      {
        \clist_map_inline:Nn \c__sjtu_uppercase_greek_clist
          { \cs_set_eq:cc { ##1 } { it ##1 } }
      }
  }
\cs_new_protected:Nn \__sjtu_set_unimath_symbol:
  {
    \clist_map_inline:nn
      {
        { increment } { upDelta     } ,
        { QED       } { blacksquare }
      }
      { \__sjtu_cs_provide_eq:cc ##1 }
  }
\tl_if_empty:NT \g__sjtu_math_font_tl
  { \tl_gset_eq:NN \g__sjtu_math_font_tl \g__sjtu_text_font_tl }
\tl_if_empty:NT \g__sjtu_cjk_font_tl
  {
    \sys_if_platform_windows:TF
      { \tl_gset:Nn \g__sjtu_cjk_font_tl { windows } }
      {
        \ctex_if_platform_macos:TF
          { \tl_gset:Nn \g__sjtu_cjk_font_tl { mac    } }
          { \tl_gset:Nn \g__sjtu_cjk_font_tl { fandol } }
      }
  }
\cs_new_protected:Npn \__sjtu_load_font:nn #1#2
  {
    \str_if_eq:eeF { \tl_use:c { g__sjtu_ #1 _font_tl } } { none }
      {
        \file_if_exist:nF
          { sjtu- #1 -font- \tl_use:c { g__sjtu_ #1 _font_tl } .def }
          {
            \msg_warning:nnnn { sjtutex } { invalid-font } {#1} {#2}
            \tl_gset:cn { g__sjtu_ #1 _font_tl } {#2}
          }
        \ctex_file_input:n
          { sjtu- #1 -font- \tl_use:c { g__sjtu_ #1 _font_tl } .def }
      }
  }
\msg_new:nnn { sjtutex } { invalid-font }
  {
    Invalid~ value~ `#1-font~ =~ \tl_use:c { g__sjtu_ #1 _font_tl }~ '! \\\\
    Using~ `#2'~ instead.
  }
\cs_new_protected:Nn \__sjtu_load_fontset:
  {
    \clist_map_inline:nn
      {
        { math } { newtx  },
        { text } { newtx  },
        { cjk  } { fandol }
      }
      { \__sjtu_load_font:nn ##1 }
  }
\@onlypreamble \__sjtu_load_font:nn
\@onlypreamble \__sjtu_load_fontset:
\ctex_at_end_package:nn { unicode-math }
  {
    \DeclareDocumentCommand \bm { m }
      { { \symbf {#1} } }
    \DeclareDocumentCommand \boldsymbol { m }
      { { \symbf {#1} } }
    \bool_if:NTF \g__sjtu_slanted_uppercase_greek_bool
      { \keys_set:nn { unicode-math } { math-style = ISO } }
      { \keys_set:nn { unicode-math } { math-style = TeX } }
    \bool_if:NTF \g__sjtu_integral_limits_bool
      { \removenolimits } { \addnolimits }
      {
        \int\iint\iiint\iiiint\oint\oiint\oiiint
        \intclockwise\varointclockwise\ointctrclockwise\sumint
        \intbar\intBar\fint\cirfnint\awint\rppolint
        \scpolint\npolint\pointint\sqint\intlarhk\intx
        \intcap\intcup\upint\lowint
      }
  }
\ctex_at_end_preamble:n
  {
    \@ifpackageloaded { unicode-math }
      { } { \RequirePackage { bm } }
  }
\NewDocumentCommand \CJKrmfamily { } { \CJKfamily { \CJKrmdefault } }
\NewDocumentCommand \CJKsffamily { } { \CJKfamily { \CJKsfdefault } }
\NewDocumentCommand \CJKttfamily { } { \CJKfamily { \CJKttdefault } }
\__sjtu_unicode_engine_case:nn
  {
    \xeCJK_declare_char_class:nn { CJK }
      { "24EA, "2460->"2473, "3251->"32BF, "25A1 }
  }
  {
    \ltjdefcharrange { 99 }
      { "24EA, "2460-"2473, "3251-"32BF, "25A1 }
    \ltjsetparameter { jacharrange = { +99 } }
  }
\__sjtu_load_fontset:
\keys_define:nn { sjtu / name }
  {
    contents        .meta:nn = { ctex } { contentsname   = {#1} } ,
    listfigure      .meta:nn = { ctex } { listfigurename = {#1} } ,
    listtable       .meta:nn = { ctex } { listtablename  = {#1} } ,
    figure          .meta:nn = { ctex } { figurename     = {#1} } ,
    table           .meta:nn = { ctex } { tablename      = {#1} } ,
    abstract        .meta:nn = { ctex } { abstractname   = {#1} } ,
    index           .meta:nn = { ctex } { indexname      = {#1} } ,
    appendix        .meta:nn = { ctex } { appendixname   = {#1} } ,
    proof           .meta:nn = { ctex } { proofname      = {#1} } ,
    bib             .meta:nn = { ctex } { bibname        = {#1} } ,
    part           .tl_set:N = \partname ,
    chapter        .tl_set:N = \chaptername ,
    figure*        .tl_set:N = \SJTU@figurename@bi@second ,
    figure*       .initial:n = { 图 } ,
    table*         .tl_set:N = \SJTU@tablename@bi@second ,
    table*        .initial:n = { 表 } ,
    algorithm      .tl_set:N = \SJTU@algorithmname ,
    algorithm     .initial:n = { Algorithm } ,
    listalgorithm  .tl_set:N = \SJTU@listalgorithmname ,
    listalgorithm .initial:n = { List~of~Algorithms } ,
  }
\file_input:n { sjtu-name-generic- \g__sjtu_lang_tl .def }
\geometry
  {
    top           = 3.5 cm,
    bottom        = 4.0 cm,
    left          = 2.5 cm,
    right         = 2.5 cm,
    headheight    = 1.5 cm,
    headsep       = 0.5 cm,
    footskip      = 1.0 cm
  }
\pagestyle { fancy }
\fancyhf { }
\keys_define:nn { sjtu / style }
  {
    header-font  .tl_set:N = \l__sjtu_style_header_font_tl ,
    header-font .initial:n = \zihao { -5 } \sffamily ,
    footer-font  .tl_set:N = \l__sjtu_style_footer_font_tl ,
    footer-font .initial:n = \zihao { -5 }
  }
\fancyheadinit { \l__sjtu_style_header_font_tl }
\fancyfootinit { \l__sjtu_style_footer_font_tl }
\keys_define:nn { sjtu / style }
  {
    header-uppercase       .choice: ,
    header-uppercase / true  .code:n =
      { \cs_set_eq:NN \__sjtu_nouppercase:n \use:n                 } ,
    header-uppercase / false .code:n =
      { \cs_set:Nn    \__sjtu_nouppercase:n { \nouppercase {##1} } } ,
    header-uppercase      .default:n = { true  } ,
    header-uppercase      .initial:n = { false }
  }
\cs_generate_variant:Nn \__sjtu_nouppercase:n { V }
\cs_new:Nn \__sjtu_thepage: { \thepage }
\keys_define:nn { sjtu / style }
  {
    page-number .cs_set:Np = \__sjtu_page:n #1 ,
    page-number .initial:n = { {#1} }
  }
\tl_set:Nn \l__sjtu_header_tl
  {
    \includegraphics [ height = 1.2 cm ]
      { sjtu-vi-logo-small-red.pdf }
  }
\tl_set:Nn \l__sjtu_leftmark_tl  { \l__sjtu_info_subject_tl }
\tl_set:Nn \l__sjtu_rightmark_tl { \leftmark }
\bool_if:NTF \g__sjtu_twoside_bool
  {
    \fancyhead [ LO, RE ] { \l__sjtu_header_tl }
    \fancyhead [ LE ]     { \__sjtu_nouppercase:V \l__sjtu_leftmark_tl  }
    \fancyhead [ RO ]     { \__sjtu_nouppercase:V \l__sjtu_rightmark_tl }
  }
  {
    \fancyhead [ L ] { \l__sjtu_header_tl }
    \fancyhead [ R ] { \__sjtu_nouppercase:V \l__sjtu_rightmark_tl }
  }
\fancyfoot [ C ] { \__sjtu_page:n { \__sjtu_thepage: } }
\bool_if:NTF \g__sjtu_twoside_bool
  {
    \fancypagestyle { plain }
      {
        \fancyhead [ LE, RO ] { }
        \tl_set:Nn \headrulewidth { 0 pt }
      }
  }
  {
    \fancypagestyle { plain }
      {
        \fancyhead [ R ] { }
        \tl_set:Nn \headrulewidth { 0 pt }
      }
  }
\cs_new_eq:NN \ps@SJTU@null \prg_do_nothing:
\RenewDocumentCommand \cleardoublepage { }
  {
    \clearpage
    \bool_if:NT \g__sjtu_twoside_bool
      {
        \int_if_odd:nF \c@page
          { \hbox:n { } \thispagestyle { empty } \newpage }
      }
  }
\ctex_set:nn { chapter }
  {
    pagestyle   = SJTU@null ,
    fixskip     = true ,
    beforeskip  = 30 pt ,
    afterskip   = 24 pt ,
    format      = \Large \bfseries \CJKsffamily \centering ,
    nameformat  = ,
    titleformat = ,
    lofskip     = \c_zero_skip ,
    lotskip     = \c_zero_skip ,
    aftername   = \quad
  }
\ctex_set:nn { section }
  { format = \large \bfseries \CJKsffamily }
\ctex_set:nn { subsection }
  { format = \normalsize \bfseries \CJKsffamily }
\ctex_set:nn { subsubsection }
  { format = \normalsize \normalfont }
\ctex_set:n { secnumdepth = 3 }
\keys_define:nn { sjtu / style }
  {
    indent-first    .choice: ,
    indent-first   .choices:nn =
      { true, false }
      {
        \clist_map_inline:nn
          {
            chapter,
            section, subsection, subsubsection,
            paragraph, subparagraph
          }
          { \ctex_set:nn {####1} { afterindent = #1 } }
      } ,
    indent-first   .default:n = { true } ,
    indent-first   .initial:n = { true }
  }
\NewDocumentCommand \SJTU@head { s O{#3} m O{#2} }
  {
    \CTEX@chapter@break
    \IfBooleanTF {#1}
      { \tl_if_empty:nF {#4} { \__sjtu_pdf_bookmark:nn { 0 } {#4} } }
      {
        \__sjtu_phantom_section:
        \addcontentsline { toc } { chapter } {#4}
      }
    \cs_set_eq:NN \__sjtu_orig_ctex_gettitle:n \CTEX@gettitle
    \cs_set:Npn \CTEX@gettitle ##1 { \__sjtu_orig_ctex_gettitle:n {#2} }
    \chapter* {#3}
    \cs_set_eq:NN \CTEX@gettitle \__sjtu_orig_ctex_gettitle:n
    \@mkboth { \MakeUppercase {#2} } { \MakeUppercase {#2} }
  }
\cs_new_eq:NN \__sjtu_pdf_bookmark:nn \use_none:nn
\cs_new_eq:NN \__sjtu_phantom_section: \prg_do_nothing:
\setlist { nosep }
\keys_define:nn { sjtu / style }
  {
    equation-font  .tl_set:N = \SJTU@style@equation@font ,
    equation-font .initial:V = \c_empty_tl
  }
\clist_map_inline:nn
  {
    array, matrix, pmatrix, bmatrix, Bmatrix, vmatrix, Vmatrix,
    matrix*, pmatrix*, bmatrix*, Bmatrix*, vmatrix*, Vmatrix*,
    cases, cases*, dcases, dcases*, rcases, rcases*, drcases, drcases*,
    aligned, alignedat, gathered, multlined, lgathered, rgathered
  }
  { \AtBeginEnvironment {#1} { \SJTU@style@equation@font } }
\clist_map_inline:nn
  { \start@gather, \start@align, \start@multline }
  {
    \ctex_patch_cmd:Nnn #1
      { \collect@body }
      {
        \SJTU@style@equation@font
        \collect@body
      }
  }
\ctex_patch_cmd:Nnn \gather@split
  { \spread@equation }
  {
    \SJTU@style@equation@font
    \spread@equation
  }
\keys_define:nn { sjtu / style }
  {
    theorem-header-font  .tl_set:N = \SJTU@style@thm@header@font ,
    theorem-header-font .initial:n = \bfseries \CJKsffamily ,
    theorem-body-font    .tl_set:N = \SJTU@style@thm@body@font ,
    theorem-body-font   .initial:n = \normalfont ,
  }
\tl_set:Nn \textfraction      { 0.15 }
\tl_set:Nn \topfraction       { 0.85 }
\tl_set:Nn \bottomfraction    { 0.65 }
\tl_set:Nn \floatpagefraction { 0.60 }
\keys_define:nn { sjtu / style }
  {
    float-font  .tl_set:N = \SJTU@style@float@font ,
    float-font .initial:n = \zihao { 5 }
  }
\ctex_patch_cmd:Nnn \@floatboxreset
  { \normalsize } { \SJTU@style@float@font }
\keys_define:nn { sjtu / style }
  {
    caption-font       .code:n =
      { \DeclareCaptionFont { normalsize    } {#1} } ,
    caption-font    .initial:n = \zihao { 5 } \bfseries ,
    subcaption-font    .code:n =
      { \DeclareCaptionFont { SJTU@sub@font } {#1} } ,
    subcaption-font .initial:n = \zihao { 5 } \normalfont
  }
\captionsetup
  {
    bi-slc   = off ,
    labelsep = quad ,
  }
\captionsetup [ sub ]
  {
    bi-slc   = on ,
    font     = SJTU@sub@font ,
    format   = hang
  }
\DeclareCaptionOption { bi-second-names } [ ]
  {
    \tl_set:Nn \figurename { \SJTU@figurename@bi@second }
    \tl_set:Nn \tablename  { \SJTU@tablename@bi@second  }
  }
\captionsetup [ bi-second ] { bi-second-names }
\keys_define:nn { sjtu / style }
  {
    num-sep            .code:n =
      {
        \tl_set:Nn \SJTU@style@fl@num@sep {#1}
        \tl_set:Nn \SJTU@style@eq@num@sep {#1}
        \tl_set:Nn \@thmcountersep        {#1}
      } ,
    num-sep         .initial:n = { . } ,
    float-num-sep    .tl_set:N = \SJTU@style@fl@num@sep ,
    equation-num-sep .tl_set:N = \SJTU@style@eq@num@sep ,
    theorem-num-sep  .tl_set:N = \@thmcountersep
  }
\NewDocumentCommand \SJTU@counterwithin
  { s O{ \SJTU@style@fl@num@sep } O{ \arabic } m m }
  {
    \@ifbothcounters {#4} {#5}
      {
        \@addtoreset {#4} {#5}
        \IfBooleanF {#1}
          {
            \cs_gset:cpo { the #4 }
              { \cs:w the #5 \cs_end: #2 #3 {#4} }
          }
      }
  }
\SJTU@counterwithin { figure } { chapter }
\SJTU@counterwithin { table  } { chapter }
\SJTU@counterwithin [ \SJTU@style@eq@num@sep ] { equation } { chapter }
\cs_set_eq:NN \__sjtu_makefnmark_plain: \@makefnmark
\cs_set_eq:NN \__sjtu_thefootnote_plain: \thefootnote
\cs_set_eq:NN \__sjtu_thempfootnote_plain: \thempfootnote
\cs_new:Npn \__sjtu_footnote_number:N #1
  {
    \int_compare:nNnTF {#1} < { 21 }
      { \__sjtu_unicode_char:n { \int_eval:n { "2460 - 1 + #1 } } }
      {
        \int_compare:nNnTF {#1} < { 36 }
          { \__sjtu_unicode_char:n { \int_eval:n { "3251 - 21 + #1 } } }
          {
            \int_compare:nNnTF {#1} < { 51 }
              { \__sjtu_unicode_char:n { \int_eval:n { "32B1 - 36 + #1 } } }
              { \msg_warning:nn { sjtutex } { too-many-footnotes } }
          }
      }
  }
\msg_new:nnn { sjtutex } { too-many-footnotes }
  { Too~ many~ footnotes. }
\cs_new:Nn \__sjtu_makefnmark_circled: { \hbox:n { \@thefnmark } }
\keys_define:nn { sjtu / style }
  {
    fnmark-font           .choice: ,
    fnmark-font / haranoaji .code:n =
      {
        \__sjtu_engine_case:nn
          { \tl_set_eq:NN \l__sjtu_style_fnmark_font_tl \c_empty_tl }
          {
            \tl_set:Nn \l__sjtu_style_fnmark_font_tl
              {
                \CJKfontspec { HaranoAjiMincho }
                  [
                    Extension   = .otf ,
                    UprightFont = *-Regular ,
                    BoldFont    = *-Bold
                  ]
              }
          }
      } ,
    fnmark-font / unknown .tl_set:N = \l__sjtu_style_fnmark_font_tl ,
    fnmark-font          .initial:V = \c_empty_tl
  }
\cs_new:Nn \__sjtu_thefootnote_circled:
  { { \l__sjtu_style_fnmark_font_tl \__sjtu_footnote_number:N \c@footnote } }
\cs_new:Nn \__sjtu_thempfootnote_circled:
  { { \l__sjtu_style_fnmark_font_tl \__sjtu_footnote_number:N \c@mpfootnote } }
\keys_define:nn { sjtu / style }
  {
    fnmark-style           .choice: ,
    fnmark-style / plain   .code:n =
      {
        \cs_set_eq:NN \__sjtu_makefnmark: \__sjtu_makefnmark_plain:
        \cs_set_eq:NN \thefootnote \__sjtu_thefootnote_plain:
        \cs_set_eq:NN \thempfootnote \__sjtu_thempfootnote_plain:
      } ,
    fnmark-style / circled .code:n =
      {
        \cs_set_eq:NN \__sjtu_makefnmark: \__sjtu_makefnmark_circled:
        \cs_set_eq:NN \thefootnote \__sjtu_thefootnote_circled:
        \cs_set_eq:NN \thempfootnote \__sjtu_thempfootnote_circled:
      }
  }
\ctex_at_end_preamble:n {
  \cs_set_eq:NN \__sjtu_orig_make_fntext:n \@makefntext
  \cs_set:Npn \@makefntext #1
    {
      \group_begin:
        \cs_set_eq:NN \@makefnmark \__sjtu_makefnmark:
        \__sjtu_orig_make_fntext:n {#1}
      \group_end:
    }
}
\tl_new:N \l__sjtu_info_subject_tl
\clist_new:N \l__sjtu_info_keywords_clist
\keys_define:nn { sjtu / info }
  {
    title             .tl_set:N = \@title ,
    author            .tl_set:N = \@author ,
    display-date      .tl_set:N = \@date ,
    subject           .tl_set:N = \l__sjtu_info_subject_tl ,
    keywords       .clist_set:N = \l__sjtu_info_keywords_clist ,
  }
\file_input:n { sjtu-lang-generic- \g__sjtu_lang_tl .def }
\file_input:n { sjtu-scheme- \g__sjtu_lang_tl .def }
\keys_define:nn { sjtu / info }
  {
    date    .code:n =
      {
        \regex_match:neTF { \d+-\d+-\d+ } {#1}
          {
            \tl_set:Nx \@date
              {
                \exp_last_unbraced:ce
                  { __sjtu_date_aux_ \g__sjtu_lang_tl :w } #1 \q_stop
              }
          }
          {
            \regex_match:neT { \d+-\d+ } {#1}
              {
                \tl_set:Nx \@date
                  {
                    \exp_last_unbraced:ce
                      { __sjtu_date_aux_short_ \g__sjtu_lang_tl :w } #1 \q_stop
                  }
              }
          }
      } ,
    date .initial:x =
      {
        \int_to_arabic:n { \c_sys_year_int  } -
        \int_to_arabic:n { \c_sys_month_int } -
        \int_to_arabic:n { \c_sys_day_int   }
      }
  }
\tl_set:NV \today \@date
\keys_define:nn { sjtu / style }
  {
    keywords-format       .choice: ,
    keywords-format / plain .code:n =
      { \cs_set:Nn \__sjtu_keywords_format:n { \noindent  { \bfseries ##1 } } } ,
    keywords-format / hang  .code:n =
      { \cs_set:Nn \__sjtu_keywords_format:n { \@hangfrom { \bfseries ##1 } } } ,
    keywords-format      .initial:n = { plain }
  }
\bool_if:NT \g__sjtu_titlepage_bool
  { \__sjtu_appto_cmd:Nn \abstract { \par } }
\__sjtu_preto_cmd:Nn \endabstract
  {
    \clist_if_empty:NF \l__sjtu_info_keywords_clist
      {
        \par \mode_leave_vertical: \par
        \__sjtu_keywords_format:n
          {
            \c__sjtu_name_keywords_tl
            \c__sjtu_name_info_sep_tl
          }
        \clist_use:NV \l__sjtu_info_keywords_clist \c__sjtu_name_item_sep_tl
        \par
      }
  }
\DeclareDocumentCommand \tableofcontents { s }
  {
    \IfBooleanTF {#1}
      { \SJTU@head* { \contentsname } }
      { \SJTU@head  { \contentsname } }
    \@starttoc { toc }
  }
\tl_set:Nn \SJTU@leaders { \titlerule* [ 4bp ] { . } }
\contentsmargin [ 2.55 em ] { 0 pt }
\titlecontents { chapter }
  [ 0 pt ] { \addvspace { 6 bp } \bfseries }
  { \contentspush { \thecontentslabel \enskip } } { }
  { \SJTU@leaders \thecontentspage }
\titlecontents { section }
  [ 2 em ] { }
  { \contentspush { \thecontentslabel \enskip } } { }
  { \SJTU@leaders \thecontentspage }
\titlecontents { subsection }
  [ 4 em ] { }
  { \contentspush { \thecontentslabel \enskip } } { }
  { \SJTU@leaders \thecontentspage }
\NewDocumentCommand \SJTU@listof { m m s }
  {
    \IfBooleanTF {#3}
      { \SJTU@head* {#1} }
      { \SJTU@head  {#1} }
    \exp_args:Nv \@starttoc { ext@ #2 }
  }
\cs_new_protected:Npn \__sjtu_new_list_of:Nnnn #1#2#3#4
  {
    \DeclareDocumentCommand #1 { }
      { \SJTU@listof {#4} {#2} }
    \titlecontents {#2}
      [ 0 pt ] { }
      { \contentspush { #3 \space \thecontentslabel \enskip } } { }
      { \SJTU@leaders \thecontentspage }
    \exp_args:Nnv \contentsuse {#2} { ext@ #2 }
  }
\__sjtu_new_list_of:Nnnn \listoffigures { figure }
  { \figurename } { \listfigurename }
\__sjtu_new_list_of:Nnnn \listoftables  { table  }
  { \tablename  } { \listtablename  }
\NewDocumentCommand \sjtusetup { } { \keys_set:nn { sjtu } }
\keys_define:nn { sjtu }
  {
    style .meta:nn = { sjtu / style } {#1} ,
    info  .meta:nn = { sjtu / info  } {#1} ,
    name  .meta:nn = { sjtu / name  } {#1}
  }
\NewDocumentCommand \subject  { m }
  { \keys_set:nn { sjtu / info } { subject  = {#1} } }
\NewDocumentCommand \keywords { m }
  { \keys_set:nn { sjtu / info } { keywords = {#1} } }
\ctex_at_end_package:nn { hyperref }
  {
    \hypersetup
      {
        linktoc            = all,
        bookmarksdepth     = 2,
        bookmarksnumbered  = true,
        bookmarksopen      = true,
        bookmarksopenlevel = 1,
        unicode            = true,
        psdextra           = true,
        breaklinks         = true,
        pdfdisplaydoctitle = true
      }
    \int_new:N \g__sjtu_bookmark_int
    \cs_gset_protected:Npn \__sjtu_pdf_bookmark:nn #1#2
      {
        \phantomsection
        \int_gincr:N \g__sjtu_bookmark_int
        \pdfbookmark [#1] {#2}
          { sjtubookmark. \int_use:N \g__sjtu_bookmark_int }
      }
    \cs_gset_eq:NN \__sjtu_phantom_section: \phantomsection
    \pdfstringdefDisableCommands
      {
        \cs_set_eq:NN \\       \prg_do_nothing:
        \cs_set_eq:NN \quad    \c_empty_tl
        \cs_set_eq:NN \qquad   \c_empty_tl
        \cs_set_eq:NN \hspace  \use_none:n
      }
    \ctex_after_end_preamble:n
      {
        \hypersetup
          {
            pdftitle    = \@title ,
            pdfauthor   = \@author ,
            pdfsubject  = \l__sjtu_info_subject_tl ,
            pdfkeywords = \l__sjtu_info_keywords_clist
          }
      }
  }
\ctex_at_end_package:nn { threeparttable }
  { \tl_put_right:Nn \TPTnoteSettings { \footnotesize } }
\ctex_at_end_package:nn { longtable }
  { \AtBeginEnvironment { longtable } { \SJTU@style@float@font } }
\cs_new_protected:Nn \__sjtu_new_theorems:
  {
    \clist_map_inline:nn
      {
        assumption, axiom, conjecture, corollary, definition, example,
        exercise, lemma, problem, proposition, theorem
      }
      {
        \cs_if_exist:cF {##1}
          {
            \exp_args:Nnv  \newtheorem  {##1} { c__sjtu_name_ ##1 _tl }
              [ chapter ]
          }
      }
    \clist_map_inline:nn
      { remark, solution }
      {
        \cs_if_exist:cF {##1}
          { \exp_args:NNnv \newtheorem* {##1} { c__sjtu_name_ ##1 _tl } }
      }
  }
\ctex_at_begin_package:nn { amsthm }
  {
    \cs_if_exist:NT \openbox
      {
        \cs_new_eq:NN \__sjtu_save_openbox: \openbox
        \cs_undefine:N \openbox
      }
  }
\ctex_at_end_package:nn { amsthm }
  {
    \__sjtu_cs_provide_eq:NN \QED \openbox
    \cs_if_exist:NT \__sjtu_save_openbox:
      { \cs_set_eq:NN \openbox \__sjtu_save_openbox: }
    \tl_set:Nn \qedsymbol { \ensuremath { \QED } }
    \RenewDocumentEnvironment { proof } { O{ \proofname } }
      {
        \par \pushQED { \qed }
        \SJTU@style@thm@body@font \dim_zero:N \topsep
        \trivlist
        \item
          [
            \skip_horizontal:N \labelsep
            \SJTU@style@thm@header@font #1 \@addpunct { \enskip }
          ]
        \ignorespaces
      }
      { \popQED \endtrivlist \@endpefalse }
    \newtheoremstyle { sjtu }
      { } { } { \SJTU@style@thm@body@font } { }
      { \SJTU@style@thm@header@font } { } { \ccwd } { }
  }
\ctex_at_end_preamble:n
  {
    \@ifpackageloaded { amsthm }
      {
        \theoremstyle { sjtu }
        \__sjtu_new_theorems:
      }
      {
        \@ifpackageloaded { ntheorem }
          {
            \__sjtu_cs_provide_eq:NN \QED \c_empty_tl
            \theoremheaderfont { \SJTU@style@thm@header@font }
            \theorembodyfont   { \SJTU@style@thm@body@font   }
            \theoremseparator  { \enskip }
            \theoremsymbol { \ensuremath { \QED } }
            \qedsymbol     { \ensuremath { \QED } }
            \cs_if_exist:NF \proof
              { \newtheorem* { proof } { \proofname } }
            \theoremsymbol { }
            \__sjtu_new_theorems:
          } { }
      }
  }
\ctex_at_end_package:nn { thmtools }
  {
    \cs_set:Npn \thmtlo@newentry
      {
        \exp_args:NV \titlecontents \thmt@envname
          [ \thmt@listnumwidth ] { }
          { \contentslabel { \thmt@listnumwidth } }
          { \hspace* { - \thmt@listnumwidth } }
          { \SJTU@leaders \thecontentspage }
        \exp_args:NV \contentsuse \thmt@envname { loe }
      }
    \cs_set:Npn \thmtlo@chaptervspacehack { }
    \RenewDocumentCommand \listoftheorems { s O{ } }
      {
        \group_begin:
          \setlisttheoremstyle {#2}
          \IfBooleanTF {#1}
            { \SJTU@head* { \listtheoremname } }
            { \SJTU@head  { \listtheoremname } }
          \cs_set:Npn \contentsline ##1
            { \use:c { thmt@contentsline@ ##1 } {##1} }
          \clist_map_inline:Nn \thmt@allenvs
            {
              \tl_set:Nn \thmt@envname {##1}
              \thmtlo@newentry
            }
          \@fileswfalse
          \AddToHook { enddocument / afterlastpage }
            {
              \if@filesw
                \@ifundefined { tf@loe }
                  {
                    \expandafter\newwrite\csname tf@loe\endcsname
                    \immediate\openout \csname tf@loe\endcsname \jobname.loe\relax
                  } { }
              \fi
            }
          \@starttoc { loe }
        \group_end:
      }
  }
\ctex_at_end_package:nn { algorithm }
  {
    \tl_set:Nn \fname@algorithm   { \SJTU@algorithmname     }
    \tl_set:Nn \listalgorithmname { \SJTU@listalgorithmname }
    \SJTU@counterwithin { algorithm } { chapter }
    \__sjtu_new_list_of:Nnnn \listofalgorithms { algorithm }
      { \fname@algorithm } { \listalgorithmname }
  }
\ctex_at_begin_package:nn { algorithm2e }
  { \cs_set_eq:NN \__sjtu_save_chapter:w \@chapter }
\ctex_at_end_package:nn { algorithm2e }
  {
    \cs_set_eq:NN \@chapter \__sjtu_save_chapter:w
    \SetAlgorithmName { \SJTU@algorithmname     }
                      { \SJTU@algorithmname     }
                      { \SJTU@listalgorithmname }
    \SetAlgoCaptionSeparator { \enskip }
    \SJTU@counterwithin { algocf } { chapter }
    \__sjtu_new_list_of:Nnnn \listofalgorithms { algocf }
      { \algorithmcfname } { \listalgorithmcfname }
    \ctex_patch_cmd:Nnn \algocf@latexcaption
      { \addcontentsline }
      { \caption@iflist { \addcontentsline } { \@gobblethree } }
  }
\ctex_at_end_package:nn { nomencl }
  { \tl_set:Nn \nomname { \SJTU@nomname } }
\ctex_at_end_package:nn { translations }
  {
    \DeclareLanguage { chinese }
    \DeclareLanguageAlias { Chinese } { chinese }
  }
\ctex_at_end_package:nn { siunitx }
  {
    \RequirePackage { translations }
    \DeclareTranslation { Chinese  } { and } { 和 }
    \DeclareTranslation { Japanese } { and } { と }
    \DeclareTranslation { Chinese  }
      { to~(numerical~range) } { \textasciitilde }
    \DeclareTranslation { Japanese }
      { to~(numerical~range) } { \textasciitilde }
    \IfPackageAtLeastTF { siunitx } { 2021/05/17 } { }
      {
        \DeclareTranslation { English } { to~(numerical~range) } { to  }
        \DeclareTranslation { German }  { to~(numerical~range) } { bis }
        \keys_set:nn { siunitx }
          {
            list-final-separator =
              {
                \ifmmode \  \else \space \fi
                \text { \GetTranslation { and } }
                \ifmmode \  \else \space \fi
              } ,
            list-pair-separator  =
              {
                \ifmmode \  \else \space \fi
                \text { \GetTranslation { and } }
                \ifmmode \  \else \space \fi
              } ,
            range-phrase         =
              {
                \ifmmode \  \else \space \fi
                \text { \GetTranslation { to~(numerical~range) } }
                \ifmmode \  \else \space \fi
              }
          }
      }
  }
\endinput
%%
%% End of file `sjtureport.cls'.
