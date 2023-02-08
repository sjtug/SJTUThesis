%%
%% This is file `sjtuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% sjtutex.dtx  (with options: `class,thesis')
%% 
%%     Copyright (C) SJTUG
%%       2018--2023 Alexara Wu   <alexarawu@outlook.com>
%%       2022--2023 Log Creative <logcreative@outlook.com>
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
%%     This work has the LPPL maintenance status `maintained'.
%% 
%%     The Current Maintainers of this work are Alexara Wu and Log Creative.
%% 
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\GetIdInfo $Id: sjtutex.dtx 2.0-beta 2023-01-06 17:30:00Z Alexara Wu <alexarawu@outlook.com> $
  {Thesis template for Shanghai Jiao Tong University}
\ProvidesExplClass{sjtuthesis}
  {\ExplFileDate}{\ExplFileVersion}{\ExplFileDescription}
\RequirePackage { xparse, xtemplate }
\msg_new:nnn { sjtutex } { l3-too-old }
  {
    Package~ "#1"~ is~ too~ old. \\\\
    Please~ update~ an~ up-to-date~ version~ of~ the~ bundles \\
    "l3kernel"~ and~ "l3packages"~ using~ your~ TeX~ package \\
    manager~ or~ from~ CTAN.
  }
\@ifpackagelater { expl3 } { 2020/04/06 } { }
  { \msg_error:nnn { sjtutex } { l3-too-old } { expl3 } }
\bool_new:N \l__sjtu_tmpa_bool
\int_new:N \l__sjtu_tmpa_int
\tl_new:N \l__sjtu_tmpa_tl
\tl_new:N \l__sjtu_tmpb_tl
\clist_new:N \l__sjtu_tmpa_clist
\clist_new:N \l__sjtu_tmpb_clist
\dim_new:N \l__sjtu_tmpa_dim
\dim_new:N \l__sjtu_tmpb_dim
\skip_new:N \l__sjtu_tmpa_skip
\box_new:N \l__sjtu_tmpa_box
\int_new:N \g__sjtu_thesis_type_int
\tl_new:N \g__sjtu_lang_tl
\tl_new:N \g__sjtu_lang_aux_tl
\tl_set:Nn \g__sjtu_lang_aux_tl { zh }
\tl_new:N \g__sjtu_zihao_tl
\dim_new:N \g__sjtu_font_size_dim
\dim_new:N \g__sjtu_line_skip_dim
\dim_new:N \g__sjtu_default_line_skip_dim
\fp_new:N \g__sjtu_line_spread_fp
\tl_new:N \g__sjtu_text_font_tl
\tl_new:N \g__sjtu_math_font_tl
\tl_new:N \g__sjtu_cjk_font_tl
\tl_new:N \g__sjtu_save_encodingdefault_tl
\tl_new:N \g__sjtu_save_rmdefault_tl
\tl_new:N \g__sjtu_save_sfdefault_tl
\tl_new:N \g__sjtu_save_ttdefault_tl
\bool_new:N \g__sjtu_slanted_uppercase_greek_bool
\bool_new:N \g__sjtu_upright_integral_bool
\bool_new:N \g__sjtu_integral_limits_bool
\bool_new:N \g__sjtu_review_bool
\clist_new:N \g__sjtu_options_to_ctex_class_clist
\clist_set:Nn \g__sjtu_options_to_ctex_class_clist
  { a4paper, UTF8, scheme = plain, fontset = none }
\clist_new:N \g__sjtu_options_to_packages_clist
\bool_new:N \g__sjtu_twoside_bool
\bool_set_true:N \g__sjtu_twoside_bool
\bool_new:N \g__sjtu_openright_bool
\bool_set_true:N \g__sjtu_openright_bool
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
    type .choice: ,
    type .value_required:n = true ,
    type .choices:nn =
      { bachelor, master, doctor }
      { \int_gset_eq:NN \g__sjtu_thesis_type_int \l_keys_choice_int } ,
    type .initial:n = { master } ,
    lang .choice: ,
    lang .value_required:n = true ,
    lang .choices:nn =
      { zh, en }
      {
        \tl_gset_eq:NN \g__sjtu_lang_tl \l_keys_choice_tl
        \int_compare:nNnT { \l_keys_choice_int } = { 1 }
          { \tl_gset:Nn \g__sjtu_lang_aux_tl { en } }
      } ,
    lang .initial:n = { zh } ,
    zihao .choice: ,
    zihao .value_required:n = true ,
    zihao / -4 .code:n =
      {
        \tl_gset:Nn  \g__sjtu_zihao_tl { -4 }
        \dim_gset:Nn \g__sjtu_font_size_dim         { 12   bp }
        \dim_gset:Nn \g__sjtu_default_line_skip_dim { 20   bp }
      } ,
    zihao /  5 .code:n =
      {
        \tl_gset:Nn  \g__sjtu_zihao_tl {  5 }
        \dim_gset:Nn \g__sjtu_font_size_dim         { 10.5 bp }
        \dim_gset:Nn \g__sjtu_default_line_skip_dim { 15.6 bp }
      } ,
    zihao .initial:n = { -4 } ,
    lineskip .dim_gset:N = \g__sjtu_line_skip_dim ,
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
    draft .value_forbidden:n = true,
    final .value_forbidden:n = true,
    draft .code:n =
      { \bool_gset_true:N  \g__sjtu_draft_bool } ,
    final .code:n =
      { \bool_gset_false:N \g__sjtu_draft_bool } ,
    review .bool_gset:N = \g__sjtu_review_bool ,
    review .initial:n = false ,
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
\dim_compare:nNnT \g__sjtu_line_skip_dim < \g__sjtu_font_size_dim
  { \dim_set_eq:NN \g__sjtu_line_skip_dim \g__sjtu_default_line_skip_dim }
\fp_set:Nn \g__sjtu_line_spread_fp
  { \dim_ratio:nn { \g__sjtu_line_skip_dim } { \g__sjtu_font_size_dim } / 1.2 }
\clist_put_right:Nx \@classoptionslist
  {
    a4paper ,
    \bool_if:NT \g__sjtu_slanted_uppercase_greek_bool
      { slantedGreek } ,
    \bool_if:NT \g__sjtu_upright_integral_bool
      { upint } ,
    \bool_if:NT \g__sjtu_integral_limits_bool
      { intlimits }
  }
\clist_put_right:Nx \g__sjtu_options_to_ctex_class_clist
  {
    zihao      = \g__sjtu_zihao_tl ,
    linespread = \fp_use:N \g__sjtu_line_spread_fp ,
    \bool_if:NTF \g__sjtu_twoside_bool
      { twoside   } { oneside     } ,
    \bool_if:NTF \g__sjtu_openright_bool
      { openright } { openany     } ,
    \bool_if:NTF \g__sjtu_draft_bool
      { draft     } { final       }
  }
\exp_args:No \PassOptionsToClass
  { \g__sjtu_options_to_ctex_class_clist }
  { ctexbook }
\clist_set:Nx \g__sjtu_options_to_packages_clist
  {
    { no-math           } { fontspec     } ,
    { titles            } { tocloft      } ,
    { perpage, bottom   } { footmisc     } ,
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
\LoadClass { ctexbook }
\RequirePackage
  {
    mathtools,
    geometry,
    fancyhdr,
    tocloft,
    caption,
    bicaption,
    subcaption,
    xcolor,
    graphicx,
    enumitem
  }
\cs_generate_variant:Nn \tl_const:Nn { co, Nv }
\cs_generate_variant:Nn \cs_gset:Npn { cpo }
\prg_generate_conditional_variant:Nnn \regex_match:nn { ne } { T }
\exp_args_generate:n { Nnv }
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
        \Unicode
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
\cs_new:Npn \__sjtu_fixed_line_skip:n #1
  {
    \exp_args:Nx \linespread
      { \fp_to_decimal:n { \dim_ratio:nn { #1 } { \f@size pt } / 1.2 } }
    \selectfont
  }
\NewDocumentCommand \fixedlineskip { m }
  { \exp_args:Nx \__sjtu_fixed_line_skip:n {#1} \tex_ignorespaces:D }
\cs_new:Npn \__sjtu_dim_set_to_wd:Nn #1#2
  {
    \hbox_set:Nn \l__sjtu_tmpa_box {#2}
    \dim_set:Nn #1 { \box_wd:N \l__sjtu_tmpa_box }
  }
\cs_new:Npn \__sjtu_dim_add_to_wd:Nn #1#2
  {
    \hbox_set:Nn \l__sjtu_tmpa_box {#2}
    \dim_add:Nn #1 { \box_wd:N \l__sjtu_tmpa_box }
  }
\cs_generate_variant:Nn \__sjtu_dim_set_to_wd:Nn { Nv }
\cs_generate_variant:Nn \__sjtu_dim_add_to_wd:Nn { cv }
\cs_new_protected:Npn \__sjtu_vspace:N #1
  {
    \skip_vertical:N #1
    \skip_vertical:N \c_zero_skip
  }
\cs_new_protected:Npn \__sjtu_vspace:n #1
  {
    \skip_set:Nn \l__sjtu_tmpa_skip {#1}
    \__sjtu_vspace:N \l__sjtu_tmpa_skip
  }
\cs_new_protected:Npn \__sjtu_vspace_r:N #1
  {
    \dim_set_eq:NN \l__sjtu_tmpa_dim \prevdepth
    \hrule height \c_zero_dim
    \nobreak
    \skip_vertical:N #1
    \skip_vertical:N \c_zero_skip
    \dim_set_eq:NN \prevdepth \l__sjtu_tmpa_dim
  }
\cs_new_protected:Npn \__sjtu_vspace_r:n #1
  {
    \skip_set:Nn   \l__sjtu_tmpa_skip {#1}
    \__sjtu_vspace_r:N \l__sjtu_tmpa_skip
  }
\__sjtu_engine_case:nnn
  {
    \cs_new_protected:Npn \__sjtu_cjk_spread_box:nn #1#2
      {
        \mode_leave_vertical:
        \group_begin:
          \bool_set_false:N \l__sjtu_tmpa_bool
          \cs_set_eq:NN \SJTU@CJK@filltwosidesSymbol \CJKsymbol
          \cs_set:Npn \CJKsymbol ##1
            {
              \bool_if:NTF \l__sjtu_tmpa_bool
                { \hfil \SJTU@CJK@filltwosidesSymbol { ##1 } }
                {
                  \SJTU@CJK@filltwosidesSymbol { ##1 }
                  \bool_set_true:N \l__sjtu_tmpa_bool
                }
            }
          \hbox_to_wd:nn {#1} {#2}
        \group_end:
      }
  }
  {
    \cs_new_protected:Npn \__sjtu_cjk_spread_box:nn #1#2
      {
        \mode_leave_vertical:
        \group_begin:
          \cs_set:Npn \CJKglue
            { \skip_horizontal:n { \c_zero_dim plus 1 filll } }
          \hbox_to_wd:nn {#1} {#2}
        \group_end:
      }
  }
  {
    \cs_new_protected:Npn \__sjtu_cjk_spread_box:nn #1#2
      {
        \mode_leave_vertical:
        \group_begin:
          \ltjsetparameter { kanjiskip = { \c_zero_dim plus 1 filll } }
          \hbox_to_wd:nn {#1} {#2}
        \group_end:
      }
  }
\cs_new_protected:Npn \__sjtu_left_aligned_box:nn #1#2
  {
    \mode_leave_vertical:
    \hbox_to_wd:nn {#1} { #2 \hfil }
  }
\cs_new_protected:Npn \__sjtu_define_name:nn #1#2
  { \tl_const:cn { c__sjtu_name_ #1 _zh_tl } {#2} }
\cs_new_protected:Npn \__sjtu_define_name:nnn #1#2#3
  {
    \tl_const:cn { c__sjtu_name_ #1 _zh_tl } {#2}
    \tl_const:cn { c__sjtu_name_ #1 _en_tl } {#3}
  }
\cs_new_protected:Npn \__sjtu_define_name_g:nn #1#2
  { \tl_const:cn { c__sjtu_name_ #1 _tl } {#2} }
\cs_new_protected:Npn \__sjtu_define_name_g:nnn #1#2#3
  {
    \tl_const:cn { c__sjtu_name_ #1 _zh_tl } {#2}
    \tl_const:cn { c__sjtu_name_ #1 _en_tl } {#3}
    \tl_gset_eq:cc
      { c__sjtu_name_ #1 _tl }
      { c__sjtu_name_ #1 _ \g__sjtu_lang_tl _tl }
  }
\cs_new_protected:Npn \__sjtu_define_name_from_clist:nNnn #1#2#3#4
  {
    \tl_const:cx { c__sjtu_name_ #1 _zh_tl }
      { \clist_item:nn {#3} {#2} }
    \tl_const:cx { c__sjtu_name_ #1 _en_tl }
      { \clist_item:nn {#4} {#2} }
  }
\cs_new_protected:Npn \__sjtu_define_symbol:nn #1#2
  { \tl_const:co { c__sjtu_symbol_ #1 _tl } { \__sjtu_unicode_char:n {#2} } }
\cs_new:Npn \__sjtu_date_aux_zh:nnn #1#2#3
  { \__zhnum_date_aux:Nnnnn \int_to_arabic:n { ~ } {#1} {#2} {#3} }
\cs_new:Npn \__sjtu_date_aux_zh:w #1-#2-#3 \q_stop
  { \__sjtu_date_aux_zh:nnn {#1} {#2} {#3} }
\clist_const:Nn \c__sjtu_name_month_en_clist
  {
    January, February, March, April, May, June,
    July, August, September, October, November, December
  }
\cs_new:Npn \__sjtu_ordinal_en:n #1
  {
    \int_to_arabic:n {#1}
    \exp_not:N \textsuperscript
      {
        \int_case:nnF { \int_mod:nn {#1} { 100 } }
          {
            { 11 } { th }
            { 12 } { th }
            { 13 } { th }
          }
          {
            \int_case:nnF { \int_mod:nn {#1} { 10 } }
              {
                { 1 } { st }
                { 2 } { nd }
                { 3 } { rd }
              }
              { th }
          }
      }
  }
\cs_new:Npn \__sjtu_date_aux_en:nnn #1#2#3
  { \clist_item:Nn \c__sjtu_name_month_en_clist {#2}~ \__sjtu_ordinal_en:n {#3},~ #1 }
\cs_new:Npn \__sjtu_date_aux_en:w #1-#2-#3 \q_stop
  { \__sjtu_date_aux_en:nnn {#1} {#2} {#3} }
\clist_map_inline:nn
  { zh, en }
  {
    \tl_const:cx { c__sjtu_today_ #1 _tl }
      {
        \use:c { __sjtu_date_aux_ #1 :nnn }
          { \int_value:w \tex_year:D }
          { \tex_month:D }
          { \tex_day:D }
      }
  }
\tl_const:Nv \c__sjtu_today_tl { c__sjtu_today_ \g__sjtu_lang_tl _tl }
\file_input:n { sjtu-name-thesis.cfg }
\NewDocumentCommand \sjtusetup { } { \keys_set:nn { sjtu } }
\keys_define:nn { sjtu }
  {
    info  .meta:nn = { sjtu / info  } {#1} ,
    style .meta:nn = { sjtu / style } {#1} ,
    name  .meta:nn = { sjtu / name  } {#1}
  }
\clist_map_inline:nn
  {
    title, display_title, running_title, subject, author, date,
    supervisor, assoc_supervisor, department,
    co_supervisor, major, degree
  }
  {
    \tl_new:c { l__sjtu_info_ #1 _zh_tl }
    \tl_new:c { l__sjtu_info_ #1 _en_tl }
  }
\tl_set:co { l__sjtu_info_title_aux_tl }
  { \cs:w l__sjtu_info_title_ \g__sjtu_lang_aux_tl _tl \cs_end: }
\tl_new:N \l__sjtu_info_id_zh_tl
\clist_map_inline:nn
  { keywords, fund }
  {
    \clist_new:c { l__sjtu_info_ #1 _zh_clist }
    \clist_new:c { l__sjtu_info_ #1 _en_clist }
  }
\keys_define:nn { sjtu / info }
  {
    title               .code:n =
      {
        \tl_set:Nn \l__sjtu_info_title_zh_tl {#1}
        \clist_map_inline:nn
          {
            \l__sjtu_info_display_title_zh_tl ,
            \l__sjtu_info_running_title_zh_tl
          }
          { \tl_if_empty:NT ##1 { \tl_set:Nn ##1 {#1} } }
      } ,
    title*              .code:n =
      {
        \tl_set:Nn \l__sjtu_info_title_en_tl {#1}
        \clist_map_inline:nn
          {
            \l__sjtu_info_display_title_en_tl ,
            \l__sjtu_info_running_title_en_tl
          }
          { \tl_if_empty:NT ##1 { \tl_set:Nn ##1 {#1} } }
      } ,
    display-title     .tl_set:N = \l__sjtu_info_display_title_zh_tl ,
    display-title*    .tl_set:N = \l__sjtu_info_display_title_en_tl ,
    running-title     .tl_set:N = \l__sjtu_info_running_title_zh_tl ,
    running-title*    .tl_set:N = \l__sjtu_info_running_title_en_tl ,
    subject           .tl_set:N = \l__sjtu_info_subject_zh_tl ,
    subject          .initial:n =
      {
        \c__sjtu_name_univ_zh_tl
        \c__sjtu_name_degree_level_zh_tl
        \c__sjtu_name_thesis_zh_tl
      } ,
    subject*          .tl_set:N = \l__sjtu_info_subject_en_tl ,
    subject*         .initial:n =
      {
        A~ Dissertation~ Submitted~ to \\
        { \c__sjtu_name_univ_en_tl }~ for~
        { \c__sjtu_name_degree_level_en_tl }~ Degree
      } ,
    keywords       .clist_set:N = \l__sjtu_info_keywords_zh_clist ,
    keywords*      .clist_set:N = \l__sjtu_info_keywords_en_clist ,
    author            .tl_set:N = \l__sjtu_info_author_zh_tl ,
    author*           .tl_set:N = \l__sjtu_info_author_en_tl ,
    id                .tl_set:N = \l__sjtu_info_id_zh_tl ,
    supervisor        .tl_set:N = \l__sjtu_info_supervisor_zh_tl ,
    supervisor*       .tl_set:N = \l__sjtu_info_supervisor_en_tl ,
    assoc-supervisor  .tl_set:N = \l__sjtu_info_assoc_supervisor_zh_tl ,
    assoc-supervisor* .tl_set:N = \l__sjtu_info_assoc_supervisor_en_tl ,
    co-supervisor     .tl_set:N = \l__sjtu_info_co_supervisor_zh_tl ,
    co-supervisor*    .tl_set:N = \l__sjtu_info_co_supervisor_en_tl ,
    degree            .tl_set:N = \l__sjtu_info_degree_zh_tl ,
    degree*           .tl_set:N = \l__sjtu_info_degree_en_tl ,
    department        .tl_set:N = \l__sjtu_info_department_zh_tl ,
    department*       .tl_set:N = \l__sjtu_info_department_en_tl ,
    major             .tl_set:N = \l__sjtu_info_major_zh_tl ,
    major*            .tl_set:N = \l__sjtu_info_major_en_tl ,
    fund           .clist_set:N = \l__sjtu_info_fund_zh_clist ,
    fund*          .clist_set:N = \l__sjtu_info_fund_en_clist ,
    date                .code:n =
      {
        \regex_match:neT { \d{4}-\d{2}-\d{2} } {#1}
          {
            \tl_set:Nx \l__sjtu_info_date_zh_tl
              { \exp_last_unbraced:Ne \__sjtu_date_aux_zh:w #1 \q_stop }
            \tl_set:Nx \l__sjtu_info_date_en_tl
              { \exp_last_unbraced:Ne \__sjtu_date_aux_en:w #1 \q_stop }
          }
      } ,
    display-date      .tl_set:N = \l__sjtu_info_date_zh_tl ,
    display-date     .initial:V = \c__sjtu_today_zh_tl ,
    display-date*     .tl_set:N = \l__sjtu_info_date_en_tl ,
    display-date*    .initial:V = \c__sjtu_today_en_tl
  }
\RenewDocumentCommand \title { s +m }
  {
    \IfBooleanTF {#1}
      { \keys_set_known:nn { sjtu / info } { title* = {#2} } }
      { \keys_set_known:nn { sjtu / info } { title  = {#2} } }
  }
\tl_set:Nn \@title { \l__sjtu_info_title_zh_tl }
\RenewDocumentCommand \author { s m }
  {
    \IfBooleanTF {#1}
      { \keys_set_known:nn { sjtu / info } { author* = {#2} } }
      { \keys_set_known:nn { sjtu / info } { author  = {#2} } }
  }
\tl_set:Nn \@author { \l__sjtu_info_author_zh_tl }
\RenewDocumentCommand \date { s m }
  {
    \IfBooleanTF {#1}
      { \keys_set_known:nn { sjtu / info } { display-date* = {#2} } }
      { \keys_set_known:nn { sjtu / info } { display-date  = {#2} } }
  }
\tl_set:Nn \@date { \l__sjtu_info_date_zh_tl }
\tl_set:Nv \today { c__sjtu_today_ \g__sjtu_lang_tl _tl }
\ctex_at_end_preamble:n
  {
    \bool_if:NT \g__sjtu_review_bool
      {
        \clist_map_inline:nn
          { author, supervisor, assoc_supervisor, co_supervisor }
          {
            \tl_clear:c { l__sjtu_info_ #1 _zh_tl }
            \tl_clear:c { l__sjtu_info_ #1 _en_tl }
          }
        \tl_clear:N \l__sjtu_info_id_zh_tl
        \clist_clear:N \l__sjtu_info_fund_zh_clist
        \clist_clear:N \l__sjtu_info_fund_en_clist
      }
  }
\keys_define:nn { sjtu / style }
  {
    float-font              .tl_set:N = \SJTU@style@float@font ,
    float-font             .initial:n = \zihao { 5 } \fixedlineskip { 15.6 bp } ,
    caption-font              .code:n =
      { \DeclareCaptionFont { SJTU@font     } {#1} } ,
    caption-font           .initial:n = \zihao { 5 } \bfseries ,
    subcaption-font           .code:n =
      { \DeclareCaptionFont { SJTU@sub@font } {#1} } ,
    subcaption-font        .initial:n = \zihao { 5 } \normalfont ,
    fnmark-font             .tl_set:N = \l__sjtu_style_fnmark_font_tl ,
    fnmark-font            .initial:n = ,
    float-num-sep           .tl_set:N = \l__sjtu_style_fl_num_sep_tl ,
    float-num-sep          .initial:n = { -- } ,
    equation-num-sep        .tl_set:N = \l__sjtu_style_eq_num_sep_tl ,
    equation-num-sep       .initial:n = { -- } ,
    title-logo-color       .choice: ,
    title-logo-color      .choices:nn =
      { red, blue, black }
      { \tl_set_eq:NN \l__sjtu_style_title_logo_color_tl \l_keys_choice_tl } ,
    title-logo-color       .initial:n = { red } ,
    header-logo-color       .choice: ,
    header-logo-color     .choices:nn =
      { red, blue, black }
      { \tl_set_eq:NN \l__sjtu_style_header_logo_color_tl \l_keys_choice_tl } ,
    header-logo-color      .initial:n = { red } ,
    header-uppercase       .choice: ,
    header-uppercase / true   .code:n =
      { \cs_gset_eq:NN \__sjtu_nouppercase:n \use:n } ,
    header-uppercase / false  .code:n =
      { \cs_gset:Nn \__sjtu_nouppercase:n { \nouppercase {##1} } } ,
    header-uppercase       .default:n = { true } ,
    header-uppercase       .initial:n = { false } ,
    header-font             .tl_set:N = \l__sjtu_style_header_font_tl ,
    header-font            .initial:n = \zihao { -5 } ,
    footer-font             .tl_set:N = \l__sjtu_style_footer_font_tl ,
    footer-font            .initial:n = \zihao { -5 } ,
    page-number            .cs_set:Np = \__sjtu_page:n #1 ,
    page-number            .initial:n = { {#1} }
  }
\keys_define:nn { sjtu / name }
  {
    contents       .tl_set:N = \contentsname ,
    listfigure     .tl_set:N = \listfigurename ,
    listtable      .tl_set:N = \listtablename ,
    figure         .tl_set:N = \figurename ,
    table          .tl_set:N = \tablename ,
    index          .tl_set:N = \indexname ,
    appendix       .tl_set:N = \appendixname ,
    proof          .tl_set:N = \proofname ,
    bib            .tl_set:N = \bibname ,
    figure*        .tl_set:N = \l__sjtu_name_figure_aux_tl ,
    figure*       .initial:n = { 图 } ,
    table*         .tl_set:N = \l__sjtu_name_table_aux_tl ,
    table*        .initial:n = { 表 } ,
    algorithm      .tl_set:N = \l__sjtu_name_algorithm_tl ,
    algorithm     .initial:n = { Algorithm } ,
    listalgorithm  .tl_set:N = \l__sjtu_name_listalgorithm_tl ,
    listalgorithm .initial:n = { List~of~Algorithms } ,
    abbr           .tl_set:N = \l__sjtu_name_abbr_tl ,
    abbr          .initial:n = { Abbreviations } ,
    nom            .tl_set:N = \l__sjtu_name_nom_tl ,
    nom           .initial:n = { Nomenclature } ,
    summary        .tl_set:N = \l__sjtu_name_summary_tl ,
    summary       .initial:n = { Summary } ,
    ack            .tl_set:N = \l__sjtu_name_ack_tl ,
    ack           .initial:n = { Acknowledgements } ,
    resume         .tl_set:N = \l__sjtu_name_resume_tl ,
    resume        .initial:n = { Resume } ,
    digest         .tl_set:N = \l__sjtu_name_digest_tl ,
    digest        .initial:n = { Digest } ,
    achv           .tl_set:N = \l__sjtu_name_achv_tl ,
    achv          .initial:n = { List~of~Research~Achievements },
  }
\file_input:n { sjtu-lang-thesis- \g__sjtu_lang_tl .cfg }
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
    \cs_set_eq:NN \increment \upDelta
    \cs_set_eq:NN \QED \blacksquare
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
\__sjtu_load_fontset:
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
\geometry
  {
    top           = 3.5 cm,
    bottom        = 4.0 cm,
    left          = 2.5 cm,
    right         = 2.5 cm,
    bindingoffset = 0.5 cm,
    headheight    = 1.5 cm,
    headsep       = 0.5 cm,
    footskip      = 1.0 cm
  }
\pagestyle { fancy }
\cs_new:Nn \__sjtu_thepage: { \thepage }
\fancyhf { }
\bool_if:NTF \g__sjtu_twoside_bool
  {
    \fancyhead [ RE, LO ]
      { \l__sjtu_style_header_font_tl \l__sjtu_info_subject_zh_tl   }
    \fancyhead [ RO, LE ]
      { \l__sjtu_style_header_font_tl \__sjtu_nouppercase:n { \leftmark } }
  }
  {
    \fancyhead [ L ]
      { \l__sjtu_style_header_font_tl \l__sjtu_info_subject_zh_tl   }
    \fancyhead [ R ]
      {
        \l__sjtu_style_header_font_tl
        \__sjtu_nouppercase:n { \leftmark }
      }
  }
\fancyfoot [ C ]
  {
    \l__sjtu_style_footer_font_tl
    \__sjtu_page:n { \__sjtu_thepage: }
  }
\cs_set:Npn \headrule
  {
    \hrule height 2.25 pt width \headwidth
    \skip_vertical:n {  0.75 pt }
    \hrule height 0.75 pt width \headwidth
    \skip_vertical:n { -3.75 pt }
  }
\cs_new_eq:NN \ps@SJTU@null \prg_do_nothing:
\clist_map_inline:nn
  { zh, en }
  {
    \cs_new:cpn { ps@SJTU@fund@ #1 }
      {
        \ps@empty
        \cs_set:Npn \@oddfoot
          {
            \begin{minipage} { \textwidth }
              \centering \zihao { - 5 }
              \clist_use:cn { l__sjtu_info_fund_ #1 _clist } { \par }
            \end{minipage}
          }
        \cs_set_eq:NN \@evenfoot \@oddfoot
      }
  }
\RenewDocumentCommand \cleardoublepage { }
  {
    \clearpage
    \bool_if:NT \g__sjtu_twoside_bool
      {
        \int_if_odd:nF \c@page
          { \hbox:n { } \thispagestyle { empty } \newpage }
      }
  }
\pagenumbering { Alph }
\RenewDocumentCommand \frontmatter { }
  {
    \cleardoublepage
    \@mainmatterfalse
    \pagenumbering { Roman }
  }
\ctex_set:nn { chapter }
  {
    pagestyle   = SJTU@null ,
    fixskip     = true ,
    beforeskip  = 24 bp ,
    afterskip   = 18 bp ,
    lofskip     = \c_zero_skip ,
    lotskip     = \c_zero_skip ,
    format      = \zihao { 3 } \bfseries \heiti \centering ,
    nameformat  = ,
    titleformat = ,
    aftername   = \quad ,
    afterindent = true
  }
\ctex_set:nn { section }
  {
    beforeskip  = 24 bp ,
    afterskip   =  6 bp ,
    format      = \zihao { 4 } \bfseries \heiti ,
    afterindent = true
  }
\ctex_set:nn { subsection }
  {
    beforeskip  = 12 bp ,
    afterskip   =  6 bp ,
    format      = \zihao { -4 } \bfseries \heiti ,
    afterindent = true
  }
\ctex_set:nn { subsubsection }
  {
    beforeskip  =  6 bp ,
    afterskip   =  6 bp ,
    format      = \zihao { -4 } \normalfont ,
    afterindent = true
  }
\ctex_set:nn { paragraph }
  { afterindent = true }
\ctex_set:nn { subparagraph }
  { afterindent = true }
\ctex_set:n { secnumdepth = 3 }
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
\cs_new:Npn \__sjtu_head_aux:n   #1
  { \SJTU@head  {#1} }
\cs_new:Npn \__sjtu_head_aux_s:n #1
  { \SJTU@head* {#1} }
\cs_new:Npn \__sjtu_head_auxa_s:nn #1#2
  { \SJTU@head* {#1} [#2] }
\cs_new:Npn \__sjtu_head_auxb_s:nn #1#2
  { \SJTU@head* [#1] {#2} }
\cs_generate_variant:Nn \__sjtu_head_aux:n   { V }
\cs_generate_variant:Nn \__sjtu_head_aux_s:n { V }
\cs_generate_variant:Nn \__sjtu_head_auxa_s:nn { Vn, VV }
\cs_generate_variant:Nn \__sjtu_head_auxb_s:nn { Vo }
\cs_new_eq:NN \__sjtu_pdf_bookmark:nn \use_none:nn
\cs_new_eq:NN \__sjtu_phantom_section: \prg_do_nothing:
\ctex_if_autoindent_touched:F
  { \ctex_set:n { autoindent = true } }
\ctex_patch_cmd:Nnn \verse { -1.5em } { -2 \ccwd }
\ctex_patch_cmd:Nnn \verse {  1.5em } {  2 \ccwd }
\ctex_patch_cmd:Nnn \quotation { 1.5em } { 2 \ccwd }
\setlist { nosep }
\tl_set:Nn \textfraction      { 0.15 }
\tl_set:Nn \topfraction       { 0.85 }
\tl_set:Nn \bottomfraction    { 0.65 }
\tl_set:Nn \floatpagefraction { 0.60 }
\ctex_patch_cmd:Nnn \@floatboxreset
  { \normalsize } { \SJTU@style@float@font }
\DeclareCaptionLabelSeparator { enskip } { \enskip }
\captionsetup
  {
    labelsep      = enskip ,
    justification = centering ,
    font          = SJTU@font
  }
\captionsetup [ sub ]
  {
    format        = hang ,
    justification = justified ,
    font          = SJTU@sub@font
  }
\DeclareCaptionOption { aux-names } [ ]
  {
    \tl_set:Nn \figurename { \l__sjtu_name_figure_aux_tl }
    \tl_set:Nn \tablename  { \l__sjtu_name_table_aux_tl  }
  }
\captionsetup [ bi-second ] { aux-names }
\NewDocumentCommand \SJTUcounterwithin
  { s O{ \l__sjtu_style_fl_num_sep_tl } O{ \arabic } m m }
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
\cs_set:Npn \thefigure
  { \thechapter \l__sjtu_style_fl_num_sep_tl \arabic { figure   } }
\cs_set:Npn \thetable
  { \thechapter \l__sjtu_style_fl_num_sep_tl \arabic { table    } }
\cs_set:Npn \theequation
  { \thechapter \l__sjtu_style_eq_num_sep_tl \arabic { equation } }
\cs_new_protected:Nn \__sjtu_counter_without_chapter:
  {
    \counterwithout { section } { chapter }
    \setcounter     { section } { 0 }
    \counterwithout { figure  } { chapter }
    \setcounter     { figure  } { 0 }
    \counterwithout { table   } { chapter }
    \setcounter     { table   } { 0 }
  }
\cs_new_protected:Nn \__sjtu_make_fnmark:
  { \hbox:n { \@thefnmark } }
\ctex_at_end_preamble:n {
  \cs_set_eq:NN \__sjtu_orig_make_fntext:n \@makefntext
  \cs_set:Npn \@makefntext #1
    {
      \group_begin:
        \cs_set_eq:NN \@makefnmark \__sjtu_make_fnmark:
        \__sjtu_orig_make_fntext:n {#1}
      \group_end:
    }
}
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
\cs_set:Npn \thefootnote
  {
    \hbox:n { }
    { \l__sjtu_style_fnmark_font_tl \__sjtu_footnote_number:N \c@footnote   }
  }
\cs_set:Npn \thempfootnote
  {
    \hbox:n { }
    { \l__sjtu_style_fnmark_font_tl \__sjtu_footnote_number:N \c@mpfootnote }
  }
\DeclareObjectType { sjtu } { 0 }
\DeclareTemplateInterface { sjtu } { component } { 0 }
  {
    format      : tokenlist = \c_empty_tl ,
    content     : tokenlist = \c_empty_tl ,
    bottom-skip : skip      = \c_zero_skip ,
    align       : choice { left, right, center, normal } = center
  }
\DeclareTemplateCode { sjtu } { component } { 0 }
  {
    format      = \l__sjtu_component_format_tl ,
    content     = \l__sjtu_component_content_tl ,
    bottom-skip = \l__sjtu_component_bottom_skip ,
    align       =
      {
        left    =
          \cs_set_eq:NN \l__sjtu_component_align: \raggedright ,
        right   =
          \cs_set_eq:NN \l__sjtu_component_align: \raggedleft ,
        center  =
          \cs_set_eq:NN \l__sjtu_component_align: \centering ,
        normal  =
          \cs_set_eq:NN \l__sjtu_component_align: \prg_do_nothing:
      }
  }
  {
    \AssignTemplateKeys
    \group_begin:
      \l__sjtu_component_align:
      \l__sjtu_component_format_tl
      \l__sjtu_component_content_tl
      \par
    \group_end:
    \__sjtu_vspace:N \l__sjtu_component_bottom_skip
  }
\DeclareTemplateInterface { sjtu } { page } { 0 }
  {
    bookmark      : boolean   = false ,
    bookmark-text : tokenlist = \c_empty_tl ,
    style         : tokenlist = empty ,
    format        : tokenlist = \linespread { 1 } \selectfont ,
    prefix        : tokenlist ,
    components    : commalist ,
    top-skip      : skip      = \c_zero_skip ,
    bottom-skip   : skip      = \c_zero_skip
  }
\DeclareTemplateCode { sjtu } { page } { 0 }
  {
    bookmark      = \l__sjtu_page_bookmark_bool ,
    bookmark-text = \l__sjtu_page_bookmark_text_tl ,
    style         = \l__sjtu_page_style_tl ,
    format        = \l__sjtu_page_format_tl ,
    prefix        = \l__sjtu_page_prefix_tl ,
    components    = \l__sjtu_page_components_clist ,
    top-skip      = \l__sjtu_page_top_skip ,
    bottom-skip   = \l__sjtu_page_bottom_skip
  }
  {
    \AssignTemplateKeys
    \bool_if:NTF \g__sjtu_openright_bool
      { \cleardoublepage } { \clearpage }
    \bool_if:NT \l__sjtu_page_bookmark_bool
      { \__sjtu_pdf_bookmark:nn { 0 } { \l__sjtu_page_bookmark_text_tl } }
    \exp_args:No \thispagestyle { \l__sjtu_page_style_tl }
    \__sjtu_vspace_r:N \l__sjtu_page_top_skip
    \__sjtu_vspace:n { - \tex_parskip:D      }
    \__sjtu_vspace:n { - \tex_baselineskip:D }
    \group_begin:
      \l__sjtu_page_format_tl
      \clist_map_inline:Nn \l__sjtu_page_components_clist
        { \UseInstance { sjtu } { \l__sjtu_page_prefix_tl / ##1 } }
    \group_end:
    \__sjtu_vspace:N \l__sjtu_page_bottom_skip
    \clearpage
  }
\cs_new:Npn \__sjtu_declare_component:nnn #1#2#3
  { \DeclareInstance { sjtu } {#1/#2} { component } {#3} }
\cs_new:Npn \__sjtu_declare_page:nn #1#2
  { \DeclareInstance { sjtu } {#1} { page } {#2} }
\cs_new:Npn \__sjtu_title_page_info:nnn #1#2#3
  {
    \group_begin:
      \cs_set:Npn \l__sjtu_info_output_format:NNN ##1##2##3 {#3}
      \clist_clear:N \l__sjtu_tmpa_clist
      \clist_clear:N \l__sjtu_tmpb_clist
      \dim_set:Nn \l__sjtu_tmpb_dim { 5 em }
      \clist_map_inline:nn {#2}
        {
          \clist_put_right:No \l__sjtu_tmpa_clist
            { \cs:w c__sjtu_name_ ##1 _ #1 _tl \cs_end: }
          \clist_put_right:No \l__sjtu_tmpb_clist
            { \cs:w l__sjtu_info_ ##1 _ #1 _tl \cs_end: }
          \__sjtu_dim_set_to_wd:Nv \l__sjtu_tmpa_dim { l__sjtu_info_ ##1 _ #1 _tl }
          \dim_set:Nn \l__sjtu_tmpb_dim
            { \dim_max:nn { \l__sjtu_tmpa_dim } { \l__sjtu_tmpb_dim } }
        }
      \bool_until_do:nn
        { \clist_if_empty_p:N \l__sjtu_tmpa_clist }
        {
          \clist_pop:NN \l__sjtu_tmpa_clist \l__sjtu_tmpa_tl
          \clist_pop:NN \l__sjtu_tmpb_clist \l__sjtu_tmpb_tl
          \l__sjtu_info_output_format:NNN
            \l__sjtu_tmpa_tl \l__sjtu_tmpb_dim \l__sjtu_tmpb_tl
          \skip_vertical:N \c_zero_dim
        }
    \group_end:
  }
\cs_generate_variant:Nn \__sjtu_title_page_info:nnn { nxn }
\clist_map_inline:nn
  {
    { logo    }
      {
        content     =
          {
            \includegraphics [ width = 3 cm ]
              { sjtu-vi-badge- \l__sjtu_style_title_logo_color_tl .pdf }
          }
      },
    { subject }
      {
        format      = \zihao { -2 } \fixedlineskip { 31.2 bp } ,
        content     = \l__sjtu_info_subject_zh_tl ,
        bottom-skip = \c_zero_dim plus 2 fill
      },
    { title   }
      {
        format      = \zihao { 2 } \bfseries \fixedlineskip { 31.2 bp } ,
        content     = \l__sjtu_info_display_title_zh_tl ,
        bottom-skip = \c_zero_dim plus 3 fill
      },
    { info    }
      {
        format      = \zihao { 4 } \fixedlineskip { 31.2 bp } ,
        content     =
          {
            \__sjtu_title_page_info:nxn { zh }
              {
                author,
                id,
                supervisor,
                \tl_if_empty:NF \l__sjtu_info_assoc_supervisor_zh_tl
                  { assoc_supervisor },
                \tl_if_empty:NF \l__sjtu_info_co_supervisor_zh_tl
                  { co_supervisor },
                department,
                major,
                \int_compare:nNnF { \g__sjtu_thesis_type_int } = { 1 }
                  { degree }
              }
              {
                \__sjtu_cjk_spread_box:nn { 5 em } { \heiti #1 }
                \c__sjtu_name_info_sep_zh_tl
                \__sjtu_left_aligned_box:nn {#2} {#3}
              }
          } ,
        bottom-skip = 31.2 bp
      },
    { date    }
      {
        format      = \zihao { 4 } \bfseries \fixedlineskip { 31.2 bp } ,
        content     = \l__sjtu_info_date_zh_tl
      }
  }
  {
    \__sjtu_declare_component:nnn { title / zh } #1
  }
\__sjtu_declare_page:nn { title / zh }
  {
    bookmark      = true ,
    bookmark-text = \c__sjtu_name_title_page_tl ,
    style         = SJTU@fund@zh ,
    prefix        = title / zh ,
    components    = { logo, subject, title, info, date }
  }
\clist_map_inline:nn
  {
    { subject }
      {
        format      = \zihao { 4 } \bfseries \fixedlineskip { 31.2 bp } ,
        content     = \l__sjtu_info_subject_en_tl ,
        bottom-skip = \c_zero_dim plus 2 fill
      },
    { title   }
      {
        format      = \zihao { -2 } \bfseries \fixedlineskip { 31.2 bp } ,
        content     = \MakeUppercase \l__sjtu_info_display_title_en_tl ,
        bottom-skip = \c_zero_dim plus 2 fill
      },
    { info    }
      {
        format      = \zihao { 3 } \fixedlineskip { 31.2 bp } ,
        content     =
          {
            \__sjtu_title_page_info:nxn { en }
              {
                author, supervisor,
                \tl_if_empty:NF \l__sjtu_info_assoc_supervisor_en_tl
                  { assoc_supervisor },
                \tl_if_empty:NF \l__sjtu_info_co_supervisor_en_tl
                  { co_supervisor }
              }
              { { \bfseries #1 \c__sjtu_name_info_sep_en_tl } {#3} }
          } ,
        bottom-skip = \c_zero_dim plus 3 fill
      },
    { date    }
      {
        format      = \zihao { 3 } \fixedlineskip { 31.2 bp } ,
        content     =
          {
            \l__sjtu_info_department_en_tl
            \skip_vertical:N \c_zero_skip
            \c__sjtu_name_univ_en_tl
            \skip_vertical:N \c_zero_skip
            \c__sjtu_name_address_en_tl
            \skip_vertical:N \c_zero_skip
            \l__sjtu_info_date_en_tl
          }
      },
  }
  {
    \__sjtu_declare_component:nnn { title / en } #1
  }
\__sjtu_declare_page:nn { title / en }
  {
    style       = SJTU@fund@en ,
    prefix      = title / en ,
    components  = { subject, title, info, date }
  }
\RenewDocumentCommand \maketitle { }
  {
    \UseInstance { sjtu } { title / zh }
    \UseInstance { sjtu } { title / en }
  }
\cs_new_protected:Npn \__sjtu_signature:N #1
  {
    \parbox [ t ] { 12 em }
      { #1 \c__sjtu_signature_text_zh_tl }
  }
\clist_map_inline:nn
  {
    { orig / title }
      {
        format      = \zihao { 3 } \heiti \fixedlineskip { 31.2 bp } ,
        content     =
          {
            \c__sjtu_name_univ_zh_tl
            \skip_vertical:N \c_zero_skip
            \c__sjtu_name_thesis_zh_tl
            \c__sjtu_name_orig_decl_zh_tl
          } ,
        bottom-skip = 15.6 bp
      },
    { orig / text  }
      {
        format      = \zihao { -4 } \fixedlineskip { 23.4 bp } ,
        content     = \c__sjtu_orig_decl_text_zh_tl ,
        bottom-skip = 15.6 bp ,
        align       = normal
      },
    { orig / sign  }
      {
        format      = \zihao { 4 } \fixedlineskip { 31.2 bp } ,
        content     =
          {
            \__sjtu_signature:N \c__sjtu_name_decl_author_zh_tl
            \skip_horizontal:n { 4 em } \hbox:n { }
          } ,
        bottom-skip = \c_zero_dim plus 2 fill ,
        align       = right
      },
    { auth / title }
      {
        format      = \zihao { 3 } \heiti \fixedlineskip { 31.2 bp } ,
        content     =
          {
            \c__sjtu_name_univ_zh_tl
            \skip_vertical:N \c_zero_skip
            \c__sjtu_name_thesis_zh_tl
            \c__sjtu_name_auth_decl_zh_tl
          } ,
        bottom-skip = 15.6 bp
      },
    { auth / text  }
      {
        format      = \zihao { -4 } \fixedlineskip { 23.4 bp } ,
        content     = \c__sjtu_auth_decl_text_zh_tl ,
        bottom-skip = 15.6 bp ,
        align       = normal
      },
    { auth / sign  }
      {
        format      = \zihao { 4 } \fixedlineskip { 31.2 bp } ,
        content     =
          {
            \__sjtu_signature:N \c__sjtu_name_decl_author_zh_tl
            \hfill
            \__sjtu_signature:N \c__sjtu_name_decl_supervisor_zh_tl
          } ,
        bottom-skip = \c_zero_dim plus 1 fill ,
        align       = normal
      }
  }
  {
    \__sjtu_declare_component:nnn { copyright } #1
  }
\__sjtu_declare_page:nn { copyright }
  {
    bookmark      = true ,
    bookmark-text = \c__sjtu_name_decl_tl ,
    prefix        = copyright ,
    components    =
      {
        orig / title, orig / text, orig / sign,
        auth / title, auth / text, auth / sign
      }
  }
\msg_new:nnn { sjtutex } { require-pdfpages }
  {
    Add~"\token_to_str:N \usepackage{pdfpages}"~ in~ your~ preamble \\
    before~ inserting~ pages~ of~ external~ PDF.
  }
\NewDocumentCommand \copyrightpage { O{ } }
  {
    \bool_if:NF \g__sjtu_review_bool
      {
        \tl_if_blank:nTF {#1}
          { \UseInstance { sjtu } { copyright } }
          {
            \cs_if_exist:NTF \includepdf
              {
                \bool_if:NTF \g__sjtu_openright_bool
                  { \cleardoublepage } { \clearpage }
                \__sjtu_pdf_bookmark:nn { 0 } { \c__sjtu_name_decl_tl }
                \includepdf {#1}
              }
              {
                \msg_warning:nn { sjtutex } { require-pdfpages }
                \UseInstance { sjtu } { copyright }
              }
          }
      }
  }
\cs_new:Nn \__sjtu_output_keywords:Nnn
  {
    \clist_if_empty:NF #1
      {
        \par \mode_leave_vertical: \par \noindent
        { \bfseries #2 } \clist_use:Nn #1 {#3}
      }
  }
\DeclareDocumentEnvironment { abstract  } { }
  { \__sjtu_head_auxa_s:VV \c__sjtu_name_abstract_zh_tl \c__sjtu_name_abstract_tl }
  {
    \__sjtu_output_keywords:Nnn \l__sjtu_info_keywords_zh_clist
      { \c__sjtu_name_keywords_zh_tl } { \c__sjtu_name_item_sep_zh_tl }
  }
\DeclareDocumentEnvironment { abstract* } { }
  { \__sjtu_head_auxa_s:Vn \c__sjtu_name_abstract_en_tl { } }
  {
    \__sjtu_output_keywords:Nnn \l__sjtu_info_keywords_en_clist
      { \c__sjtu_name_keywords_en_tl } { \c__sjtu_name_item_sep_en_tl }
  }
\DeclareDocumentCommand \tableofcontents { }
  {
    \__sjtu_head_aux_s:n { \contentsname }
    \@starttoc { toc }
  }
\NewDocumentCommand \SJTU@listof { m m s }
  {
    \IfBooleanTF {#3}
      { \__sjtu_head_aux_s:n {#1} }
      { \__sjtu_head_aux:n   {#1} }
    \exp_args:Nv \@starttoc { ext@ #2 }
  }
\DeclareDocumentCommand \listoffigures { }
  { \SJTU@listof { \listfigurename } { figure } }
\DeclareDocumentCommand \listoftables  { }
  { \SJTU@listof { \listtablename  } { table  } }
\tl_set:Nn \cftdotsep { 1 }
\tl_set:Nn \cftchapleader { \normalfont \cftdotfill { \cftdotsep } }
\cs_new_protected:Nn \__sjtu_update_cft_presnum:
  {
    \tl_set:Nn \cftfigpresnum { \figurename \c_space_tl }
    \__sjtu_dim_add_to_wd:Nn \cftfignumwidth { \cftfigpresnum }
    \tl_set:Nn \cfttabpresnum { \tablename  \c_space_tl }
    \__sjtu_dim_add_to_wd:Nn \cfttabnumwidth { \cftfigpresnum }
  }
\ctex_at_end_preamble:n
  { \__sjtu_update_cft_presnum: }
\NewDocumentEnvironment { abbreviation  } { }
  {
    \__sjtu_head_aux:V   \l__sjtu_name_abbr_tl
    \tl_clear:N \SJTU@style@float@font
  } { }
\NewDocumentEnvironment { abbreviation* } { }
  {
    \__sjtu_head_aux_s:V \l__sjtu_name_abbr_tl
    \tl_clear:N \SJTU@style@float@font
  } { }
\NewDocumentEnvironment { nomenclature  } { }
  {
    \__sjtu_head_aux:V   \l__sjtu_name_nom_tl
    \tl_clear:N \SJTU@style@float@font
  } { }
\NewDocumentEnvironment { nomenclature* } { }
  {
    \__sjtu_head_aux_s:V \l__sjtu_name_nom_tl
    \tl_clear:N \SJTU@style@float@font
  } { }
\NewDocumentEnvironment { summary } { }
  { \__sjtu_head_aux:V \l__sjtu_name_summary_tl } { }
\NewDocumentEnvironment { acknowledgements } { +b }
  {
    \bool_if:NF \g__sjtu_review_bool
      {
        \__sjtu_head_aux:V \l__sjtu_name_ack_tl
        #1
      }
  } { }
\newcounter { SJTU@bib }
\NewDocumentEnvironment { @bibliolist } { m }
  {
    \cs_if_exist_use:N \bibfont
    \list
      { \@biblabel { \arabic{ SJTU@bib } } }
      {
        \__sjtu_dim_set_to_wd:Nn \labelwidth { \@biblabel {#1} }
        \dim_set_eq:NN \leftmargin \labelwidth
        \dim_add:Nn    \leftmargin { \labelsep }
        \dim_if_exist:NTF \bibitemsep
          {
            \dim_set_eq:NN \itemsep \bibitemsep
            \dim_if_exist:NT \bibparsep
              { \dim_set_eq:NN \parsep \bibparsep }
          }
          {
            \dim_if_exist:NT \bibsep
              {
                \dim_set_eq:NN \itemsep \bibsep
                \dim_zero:N    \parsep
              }
          }
        \@nmbrlisttrue
        \tl_set:Nn  \@listctr    { SJTU@bib }
        \cs_set:Npn \p@SJTU@bib  { }
        \cs_set:Npn \theSJTU@bib { \arabic { SJTU@bib } }
      }
      \sloppy
      \int_set:Nn \clubpenalty  { 4000 }
      \int_set_eq:NN \@clubpenalty \clubpenalty
      \int_set:Nn \widowpenalty { 4000 }
      \char_set_sfcode:nn { `\. } { 1000 }
  }
  {
    \cs_set:Npn \@noitemerr
      { \msg_warning:nnn { sjtutex } { empty-environment } { bibliolist } }
    \endlist
  }
\msg_new:nnn { sjtutex } { empty-environment }
  { Empty~ `#1'~ environment. }
\NewDocumentEnvironment { achievements } { }
  { \__sjtu_head_aux:V \l__sjtu_name_achv_tl } { }
\NewDocumentEnvironment { bibliolist  } { m +b }
  {
    \bool_if:NF \g__sjtu_review_bool
      {
        \cs_set:Npn \@noitemerr { }
        \begin { @bibliolist } {#1}
        #2
        \end { @bibliolist }
      }
  } { }
\NewDocumentEnvironment { bibliolist* } { m +b }
  {
    \bool_if:NT \g__sjtu_review_bool
      {
        \cs_set:Npn \@noitemerr { }
        \begin { @bibliolist } {#1}
        #2
        \end { @bibliolist }
      }
  } { }
\NewDocumentEnvironment { resume } { +b }
  {
    \bool_if:NF \g__sjtu_review_bool
      {
        \__sjtu_head_aux:V \l__sjtu_name_resume_tl
        #1
      }
  } { }
\NewDocumentEnvironment { digest } { +b }
  {
    \AtEndDocument
      {
        \bool_if:NTF \g__sjtu_openright_bool
          { \cleardoublepage } { \clearpage }
        \pagenumbering { roman }
        \cs_gset:Nn \__sjtu_thepage: { \arabic { page } }
        \cs_gset_eq:NN \addcontentsline \use_none:nnn
        \__sjtu_counter_without_chapter:
        \__sjtu_head_auxb_s:Vo \l__sjtu_name_digest_tl
          { \exp_args:NV \MakeUppercase \l__sjtu_info_title_aux_tl }
        #1
      }
  } { }
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
            pdftitle    = \l__sjtu_info_title_zh_tl,
            pdfsubject  = \l__sjtu_info_subject_zh_tl,
            pdfkeywords = \l__sjtu_info_keywords_zh_clist,
            pdfauthor   = \l__sjtu_info_author_zh_tl
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
      { \exp_args:Nnv  \newtheorem  {##1} { c__sjtu_name_ ##1 _tl } [ chapter ] }
    \clist_map_inline:nn
      { remark, solution }
      { \exp_args:NNnv \newtheorem* {##1} { c__sjtu_name_ ##1 _tl } }
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
    \cs_if_exist:NT \__sjtu_save_openbox:
      { \cs_set_eq:NN \openbox \__sjtu_save_openbox: }
    \tl_set:Nn \qedsymbol { \ensuremath { \QED } }
    \RenewDocumentEnvironment { proof } { O{ \proofname } }
      {
        \par \pushQED { \qed }
        \normalfont \dim_zero:N \topsep
        \trivlist
        \item
          [
            \skip_horizontal:N \labelsep
            \bfseries \heiti #1 \@addpunct { \enskip }
          ]
        \ignorespaces
      }
      { \popQED \endtrivlist \legacy_if_set_false:n { @endpe } }
    \newtheoremstyle { sjtu }
      { } { } { \normalfont } { } { \bfseries \heiti } { } { \ccwd } { }
    \theoremstyle { sjtu }
    \__sjtu_new_theorems:
  }
\ctex_at_end_package:nn { ntheorem }
  {
    \theoremheaderfont { \bfseries \heiti }
    \theorembodyfont   { \normalfont      }
    \theoremseparator  { \enskip          }
    \theoremsymbol { \ensuremath { \QED } }
    \qedsymbol     { \ensuremath { \QED } }
    \newtheorem* { proof } { \proofname }
    \theoremsymbol { }
    \__sjtu_new_theorems:
  }
\cs_new_protected:Npn \__sjtu_newlistof:nnnnn #1#2#3#4#5
  {
    \exp_args:Nnv \newlistentry {#2} { ext@ #3 } { 0 }
    \exp_args:Ne \newcounter { \tl_use:c { ext@ #3 } depth }
    \exp_args:Ne \setcounter { \tl_use:c { ext@ #3 } depth } { 1 }
    \dim_set:cn { cft #2 indent   } { 1.5 em }
    \dim_set:cn { cft #2 numwidth } { 2.3 em }
    \cs_set_eq:cc { l@ #3 } { l@ #2 }
    \__sjtu_appto_cmd:Nn \__sjtu_update_cft_presnum:
      {
        \tl_set:cn { cft #2 presnum } { #4 \c_space_tl }
        \__sjtu_dim_add_to_wd:cv { cft #2 numwidth } { cft #2 presnum }
      }
    \exp_args:Nc \DeclareDocumentCommand { listof #1 s } { }
      { \SJTU@listof {#5} {#3} }
    \cs_set:cpn { the #3 }
      { \thechapter \l__sjtu_style_fl_num_sep_tl \arabic {#3} }
    \__sjtu_appto_cmd:Nn \__sjtu_counter_without_chapter:
      {
        \counterwithout {#3} { chapter }
        \setcounter     {#3} { 0 }
      }
  }
\ctex_at_end_package:nn { algorithm }
  {
    \tl_set:Nn \fname@algorithm   { \l__sjtu_name_algorithm_tl     }
    \tl_set:Nn \listalgorithmname { \l__sjtu_name_listalgorithm_tl }
    \__sjtu_newlistof:nnnnn { algorithm } { alg } { algorithm }
      { \fname@algorithm } { \listalgorithmname }
  }
\ctex_at_begin_package:nn { algorithm2e }
  { \cs_set_eq:NN \__sjtu_save_chapter:w \@chapter }
\ctex_at_end_package:nn { algorithm2e }
  {
    \cs_set_eq:NN \@chapter \__sjtu_save_chapter:w
    \SetAlgorithmName { \l__sjtu_name_algorithm_tl     }
                      { \l__sjtu_name_algorithm_tl     }
                      { \l__sjtu_name_listalgorithm_tl }
    \SetAlgoCaptionSeparator { \enskip }
    \__sjtu_newlistof:nnnnn { algorithm } { alg } { algocf }
      { \algorithmcfname } { \listalgorithmcfname }
    \ctex_patch_cmd:Nnn \algocf@latexcaption
      { \addcontentsline }
      { \caption@iflist { \addcontentsline } { \@gobblethree } }
  }
\ctex_at_end_package:nn { listings }
  {
    \lstdefinestyle { lstStyleCode }
      {
        aboveskip         = \medskipamount ,
        belowskip         = \medskipamount ,
        basicstyle        = \ttfamily \zihao { 6 } ,
        commentstyle      = \slshape \color { black!60 } ,
        stringstyle       = \color { green!40!black!100 } ,
        keywordstyle      = \bfseries \color { blue!50!black } ,
        extendedchars     = false ,
        upquote           = true ,
        tabsize           = 2 ,
        showstringspaces  = false ,
        xleftmargin       = 1 em ,
        xrightmargin      = 1 em ,
        breaklines        = false ,
        framexleftmargin  = 1 em ,
        framexrightmargin = 1 em ,
        backgroundcolor   = \color { gray!10 } ,
        columns           = flexible ,
        keepspaces        = true ,
        texcl             = true ,
        mathescape        = true
      }
  }
\ctex_at_end_package:nn { nomencl }
  { \tl_set:Nn \nomname { \l__sjtu_name_nom_tl } }
\endinput
%%
%% End of file `sjtuthesis.cls'.
