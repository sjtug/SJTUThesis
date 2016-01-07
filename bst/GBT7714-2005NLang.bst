%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% ====================================================================
%%%  Copyright (C) 2006 Wu Kai
%%%  @BibTeX-style-file{
%%%     author          = "吴凯",
%%%     version         = "1 Beta 2 测试版",
%%%     date            = "2006/5/25 21:17"
%%%     filename        = "GBT7714-2005N.bst",
%%%     address         = "上海财经大学，公共经济与管理学院，200433",
%%%     email           = "solomonkwu@gmail.com",
%%%     docstring       = "本文件改编自Sake J. Hogeveen的authordate1.bst文件。
%%%                        产生符合《GB/T 7714-2005文后参考文献著录规则》
%%%                        顺序编码制格式的文后参考文献。
%%%                        使用方法:
%%%                        \usepackage[numbers,sort&compress]{natbib} 
%%%                        \usepackage{hypernat} 
%%%                        \bibliographystyle{GBT7714-2005N}"
%%%      copyright      = "使用前请核对最新的版本。您可以免费使用和传播本文件（GBT7714-2005N.bst）。
%%%                        作者保留修改的权利，以保证不同版本GBT7714-2005N.bst的一致性。
%%%                        如您需要对本文件进行修改，请另存为其他名字。"
%%% ====================================================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
    url
    TypeofLit                %新加入：文献类型和标志代码
    normalauthor             %不改变大小写的作者
    normaleditor             %不改变大小写的编者
    translator               %新加入：翻译者
    date                     %日期，公告日期，公开日期
    modifydate               %修改日期
    citedate                 %引用日期
    patentid                 %专利号
    country                  %国家（主要用于专利中）
    miscyear                 %其它类中用于输出年份
    startyear                %起始年
    startvolume              %起始卷
    startnumber              %起始期
    endyear                  %终止年
    endvolume                %终止卷
    endnumber                %终止期
    language                 %默认是英文文献，非空则表明是中文文献
  }
  {}
  { label extra.label sort.label short.list }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

STRINGS { s t }



FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
    { add.period$ write$
      newline$
      "\newblock " write$
    }
    { output.state before.all =
        'write$
        { add.period$ " " * write$ }
      if$
    }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}


FUNCTION {coutput.nonnull}                                   %wk
{ 's :=
  output.state mid.sentence =
    { "，" * write$ }                                       %
    { output.state after.block =
    { add.period$ write$
      newline$
      "\newblock " write$
    }
    { output.state before.all =
        'write$
        { add.period$ " " * write$ }
      if$
    }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}
 
FUNCTION {coutput}                                           %wk
{ duplicate$ empty$
    'pop$
    'coutput.nonnull
  if$
}

STRINGS {z}
FUNCTION {remove.dots}
{ 'z :=
  ""
  { z empty$ not}
  { z #1 #1 substring$
    z #2 global.max$ substring$ 'z :=
    duplicate$ "." = 'pop$
      { * }
    if$
  }
  while$
  %z
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {coutput.check}                                     %wk
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'coutput.nonnull
  if$
}

FUNCTION {output.year.month.check}
{ year empty$
    { "empty year in " cite$ * warning$ }
    { add.period$ write$
      month empty$
        { " " year * extra.label * "." *
          after.sentence 'output.state :=
        }
        { " " year * extra.label * " (" * month * ")." *
          after.sentence 'output.state :=
        }
      if$
    }
  if$
}

FUNCTION {output.cyear.month.check}                            %wk
{ year empty$
    { "empty year in " cite$ * warning$ }
    {write$
      month empty$
        {year                      %wk
          after.sentence 'output.state :=
        }
        { "" year * extra.label * "(" * month * ")" *     %wk
          after.sentence 'output.state :=
        }
      if$
    }
  if$
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {output.modifydate.check}
{modifydate
}

FUNCTION {output.citedate.check}
{ year empty$
    { "" }
    { write$
      "[" citedate * extra.label * "]" *
      after.sentence 'output.state :=
    }
  if$
}


FUNCTION {output.year.check}
{ year empty$
    { "empty year in " cite$ * warning$ }
    {miscyear empty$
        {year}
         {miscyear}
     if$                     %wk
    }
  if$
  extra.label *
}

FUNCTION {output.cyear.check}                           %wk
{ year empty$
    { "empty year in " cite$ * warning$ }
    {miscyear empty$
        {year}
         {miscyear}
     if$                     %wk
    }
  if$
  extra.label *
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.continue.year.check}                           %wk
{ 
endyear empty$
   {startyear empty$
      {year empty$
         { "empty year in " cite$ * warning$ }
         {"" year * "" * }
       if$
       }
      {"" startyear * "-" * }
    if$
    }
{startyear empty$
    {year empty$
        { "empty year in " cite$ * warning$ }
        {"" year * "" * }
    if$
    }
    {"" startyear * "-" * 
    "" endyear * "" * *
    }
 if$
}
if$  
}


FUNCTION {output.continue.cyear.check}                           %wk
{ 
endyear empty$
   {startyear empty$
      {year empty$
         { "empty year in " cite$ * warning$ }
         {"" year * "" * }
       if$
       }
      {"" startyear * "-" * }
    if$
    }
{startyear empty$
    {year empty$
        { "empty year in " cite$ * warning$ }
        {"" year * "" * }
    if$
    }
    {"" startyear * "-" * 
    "" endyear * "" * *
    }
 if$
}
if$  
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {output.article.year.check}
{month empty$
{
year empty$
    { "empty year in " cite$ * warning$ }
    {year                 %wk
    }
  if$
}
{
TypeofLit empty$
       {year empty$
    { "empty year in " cite$ * warning$ }
    {year                 %wk
    }
  if$} 
  
{year empty$
    { "empty year in " cite$ * warning$ }
    {year                 %wk
       "-"  month * "" * * 
    }
  if$
}
if$
}
if$  
}

FUNCTION {output.carticle.year.check}                           %wk
{month empty$
{
year empty$
    { "empty year in " cite$ * warning$ }
    {year                 %wk
    }
  if$
}
{
TypeofLit empty$
       {year empty$
    { "empty year in " cite$ * warning$ }
    {year                 %wk
    }
  if$} 
  
{year empty$
    { "empty year in " cite$ * warning$ }
    {year                 %wk
       "-"  month * "" * * 
    }
  if$
}
if$
}
if$  
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.bibitem}
{ newline$
  "\bibitem[" write$
  label write$
  "]{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {boldface}
{ duplicate$ empty$
    { pop$ "" }
    { "{\bf " swap$ * "}" * }
  if$
}

%FUNCTION {emphasize}
%{ duplicate$ empty$
%    { pop$ "" }
%    { "{\em " swap$ * "}" * }
%  if$
%}


%%%%%%%%%%%%%%%%%%%
Function{upcase}
{ duplicate$ empty$
    { pop$ "" }
    { "\textsc{" swap$ * "}" * }
  if$
}
FUNCTION {bib.name.font}
{ upcase }
FUNCTION {bib.fname.font}
{ bib.name.font }
%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%

INTEGERS { nameptr namesleft numnames }

FUNCTION {capitalize}
{ "u" change.case$ "t" change.case$ }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv~}{ll}{ f{~}}{, jj}"
    format.name$
    remove.dots
     't :=
      nameptr #1 >
        { 
          nameptr #3
          #1 + =
          numnames #3
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
            { ", " * t * }
            { numnames #2 >
              { "" * }
              'skip$
              if$
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              t "others" =
                 {bib.name.font    %改为大写
                  ", et al" * 
                }
                {", " * t * } 
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
%%%%%%%%%%%
  t "others" =                   %改为大写 
    'skip$                       %改为大写 
    { bib.name.font }            %改为大写 
  if$                            %改为大写 
%%%%%%%%%%%
}


FUNCTION {format.cnames}                                     %wk
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv~}{ll}{ f{~}}{ jj}" format.name$ 
    remove.dots
    't :=
      nameptr #1 >
        {
          nameptr #3
          #1 + =
          numnames #3
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
            { ", " * t * }
            { numnames #2 >
              { "" * }
              'skip$
              if$
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              t "others" =
                 { ",等" * 
                bib.name.font    %改为大写
                }
                {", " * t * } 
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
%%%%%%%%%%%
  t "others" =                   %改为大写 
    'skip$                       %改为大写 
    { bib.name.font }            %改为大写 
  if$                            %改为大写 
%%%%%%%%%%%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%不加大写的名字
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.normal.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv~}{ll}{ f{~}}{, jj}"
    format.name$
    remove.dots
     't :=
      nameptr #1 >
        { 
          nameptr #3
          #1 + =
          numnames #3
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
            { ", " * t * }
            { numnames #2 >
              { "" * }
              'skip$
              if$
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              t "others" =
                 { ", et al" * }
                {", " * t * } 
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}


FUNCTION {format.normal.cnames}                                    %wk
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv~}{ll}{ f{~}}{ jj}" format.name$ 
    remove.dots
    't :=
      nameptr #1 >
        {
          nameptr #3
          #1 + =
          numnames #3
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
            { ", " * t * }
            { numnames #2 >
              { "" * }
              'skip$
              if$
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              t "others" =
                 { ",等" * }
                {", " * t * } 
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.authors}
{ author empty$
    { "" }
    {normalauthor empty$
         {author format.names }
         {normalauthor format.normal.names}
    if$ 
}
  if$
}

FUNCTION {format.cauthors}                                   %wk
{ author empty$
    { "" }
    {normalauthor empty$
         {author format.cnames }
         {normalauthor format.normal.cnames}
    if$ 
}
  if$
}

FUNCTION {format.key}
{ empty$
    { key field.or.null }
    { "" }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    {normaleditor empty$
         {editor format.names }
         {normaleditor format.normal.names}
    if$    
      editor num.names$ #1 >                                %  Use ODWE abbrevs.
        { "" * }                                      %  to avoid
        { "" * }                                       %  ambiguity between
      if$                                                   %  "editor" and
    }                                                       %  "edition".
  if$
}

FUNCTION {format.ceditors}                                 %wk   本函数
{ editor empty$
    { "" }
    {
    normaleditor empty$
         {editor * "" * format.cnames }
         {normaleditor * "" * format.normal.cnames}
    if$    
    }                                                   
  if$
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {format.title}                                     %  Nothing needs
{ title empty$                                              %  doing here in
    { "" }                                                  %  authordate1.bst
    { title }                                               %  or
  if$                                                       %  authordate3.bst.
}

FUNCTION {format.ctitle}                %wk                 %  Nothing needs
{ title empty$                                              %  doing here in
    { "" }                                                  %  authordate1.bst
    {title}                                               %  or
  if$                                                       %  authordate3.bst.
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


FUNCTION {format.article.title}                                     %  Nothing needs
{title empty$                                              %  doing here in
    { "" }                                                  %  authordate1.bst
    {
    typeoflit empty$
       {format.title "[J]" * title output.check}   
       {format.title title output.check}
    if$
    }
if$
TypeofLit empty$
       {""}   
       { "["  TypeofLit * "]" * * }
if$
                                                    %  authordate3.bst.
}


FUNCTION {format.carticle.title}                                     %  Nothing needs
{title empty$                                              %  doing here in
    { "" }                                                  %  authordate1.bst
    {
    typeoflit empty$
       {format.title "[J]" * title output.check}   
       {format.title title output.check}
    if$
    }
if$

TypeofLit empty$
       {""}   
       { "[" TypeofLit * "]" * *  }
if$
                                                     %  authordate3.bst.
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {format.book.title}                                     %  Nothing needs
{title empty$                                              %  doing here in
    { "" }                                                  %  authordate1.bst
    {
    typeoflit empty$
       {format.title "[M]" * title output.check}   
       {format.title title output.check}
    if$
    }
if$
TypeofLit empty$
       {""}   
       { "["  TypeofLit * "]" * * }
if$
                                                    %  authordate3.bst.
}


FUNCTION {format.cbook.title}                %wk                 %  Nothing needs
{title empty$                                              %  doing here in
    { "" }                                                  %  authordate1.bst
    {
    typeoflit empty$
       {format.title "[M]" * title output.check}   
       {format.title title output.check}
    if$
    }
if$
TypeofLit empty$
       {""}   
       { "["  TypeofLit * "]" * * }
if$
                                                    %  authordate3.bst.
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {format.misc.title}                %wk                 %  Nothing needs
{
patentid empty$
       {%没有专利号应该是其它类型文献，直接标准输出
title empty$                                              %  doing here in
    { "" }                                                  %  authordate1.bst
    {
    typeoflit empty$
       {format.title "[缺文献类型标志代码]." * title output.check}   
       {format.title title output.check}
    if$
    }
if$
TypeofLit empty$
       {""}   
       { "["  TypeofLit * "]." * * }
if$
       }
       {%有专利号
          country empty$
             {
title empty$                                              %  doing here in
    { "" }                                                  %  authordate1.bst
    {
    typeoflit empty$
       {format.title "[缺文献类型标志代码]." * title output.check}   
       {format.title title output.check}
    if$
    }
if$
TypeofLit empty$
       {""}   
       { "["  TypeofLit * "]." * * }
if$             
""  patentid * "" * *              
             }   
             {%有专利号，有国家
title empty$                                              %  doing here in
    { "" }                                                  %  authordate1.bst
    {
    typeoflit empty$
       {format.title "[缺文献类型标志代码]." * title output.check}   
       {format.title title output.check}
    if$
    }
if$
             
              "："  country * "，" * * 
              ""  patentid * "" * * 
TypeofLit empty$
       {""}   
       { "["  TypeofLit * "]." * * }
if$             

              }
             if$ 
}
if$

}


FUNCTION {format.cmisc.title}                %wk                 %  Nothing needs
{
patentid empty$
       {%没有专利号应该是其它类型文献，直接标准输出
title empty$                                              %  doing here in
    { "" }                                                  %  authordate1.bst
    {
    typeoflit empty$
       {format.title "[缺文献类型标志代码]." * title output.check}   
       {format.title title output.check}
    if$
    }
if$
TypeofLit empty$
       {""}   
       { "["  TypeofLit * "]." * * }
if$
       }
       {%有专利号
          country empty$
             {
title empty$                                              %  doing here in
    { "" }                                                  %  authordate1.bst
    {
    typeoflit empty$
       {format.title "[缺文献类型标志代码]." * title output.check}   
       {format.title title output.check}
    if$
    }
if$
TypeofLit empty$
       {""}   
       { "["  TypeofLit * "]." * * }
if$             
""  patentid * "" * *              
             }   
             {%有专利号，有国家
title empty$                                              %  doing here in
    { "" }                                                  %  authordate1.bst
    {
    typeoflit empty$
       {format.title "[缺文献类型标志代码]." * title output.check}   
       {format.title title output.check}
    if$
    }
if$
             
              "："  country * "，" * * 
              ""  patentid * "" * * 
TypeofLit empty$
       {""}   
       { "["  TypeofLit * "]." * * }
if$             

              }
             if$ 
}
if$

}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.proceedings.title}                                     %  Nothing needs
{title empty$                                              %  doing here in
    { "" }                                                  %  authordate1.bst
    {
    typeoflit empty$
       {format.title "[C]" * title output.check}   
       {format.title title output.check}
    if$
    }
if$

TypeofLit empty$
       {""}   
       { "[" TypeofLit * "]" * *  }
if$
                                                     %  authordate3.bst.
}


FUNCTION {format.cproceedings.title}                                     %  Nothing needs
{title empty$                                              %  doing here in
    { "" }                                                  %  authordate1.bst
    {
    typeoflit empty$
       {format.title "[C]" * title output.check}   
       {format.title title output.check}
    if$
    }
if$

TypeofLit empty$
       {""}   
       { "[" TypeofLit * "]" * *  }
if$
                                                     %  authordate3.bst.
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {format.incollection.title}                                     %  Nothing needs
{title empty$                                              %  doing here in
    { "" }                                                  %  authordate1.bst
    {
    typeoflit empty$
       {format.title "[M]//" * title output.check}   
       {format.title "" * title output.check}
    if$
    }
if$

TypeofLit empty$
       {""}   
       { "[" TypeofLit * "]//" * * }
if$
                                                     %  authordate3.bst.
}


FUNCTION {format.cincollection.title}                                     %  Nothing needs
{title empty$                                              %  doing here in
    { "" }                                                  %  authordate1.bst
    {
    typeoflit empty$
       {format.title "[M]//" * title output.check}   
       {format.title "" * title output.check}
    if$
    }
if$

TypeofLit empty$
       {""}   
       { "[" TypeofLit * "]//" * * }
if$
                                                     %  authordate3.bst.
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {format.inproceedings.title}                                     %  Nothing needs
{title empty$                                              %  doing here in
    { "" }                                                  %  authordate1.bst
    {
    typeoflit empty$
       {format.title "[C]//" * title output.check}   
       {format.title "" * title output.check}
    if$
    }
if$

TypeofLit empty$
       {""}   
       { "[" TypeofLit * "]//" * * }
if$
                                                     %  authordate3.bst.
}


FUNCTION {format.cinproceedings.title}                                     %  Nothing needs
{title empty$                                              %  doing here in
    { "" }                                                  %  authordate1.bst
    {
    typeoflit empty$
       {format.title "[C]//" * title output.check}   
       {format.title "" * title output.check}
    if$
    }
if$

TypeofLit empty$
       {""}   
       { "[" TypeofLit * "]//" * * }
if$
                                                     %  authordate3.bst.
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
               { "-" *
                 t #2 global.max$ substring$ 't :=
               }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
        if$
    }
  while$
}

FUNCTION {format.btitle}
{ title empty$
   { "" }                                                   %  Don't change case
   {booktitle}                                      %  in
   if$                                                      %  authordate1.bst
}                                                           %  or

FUNCTION {format.cbtitle}                  %wk                 %  Nothing needs
{ title empty$                                              %  doing here in
    { "" }                                                  %  authordate1.bst
    {booktitle}                                               %  or
  if$                                                       %  authordate3.bst.
}
                                                            %  authordate3.bst.
FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.numberinseries}
{ number empty$
    { "" }
    { number multi.page.check
        { ", nos. " number n.dashify tie.or.space.connect }
        { ", no. "  number tie.or.space.connect }
      if$
    }
  if$
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
        { ":" pages n.dashify tie.or.space.connect * }
        { ":" pages tie.or.space.connect  * }
      if$
    }
  if$
}


FUNCTION {format.cnumberinseries}                           %wk
{ number empty$
    { "" }
    { number multi.page.check
        { ", 第" number n.dashify tie.or.space.connect * "期"}  %wk
        { ", 第"  number tie.or.space.connect * "期"}           %wk
      if$
    }
  if$
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {booklike.series.volume.number}                    %  Chicago, pages
{ series empty$                                             %  450-451.
    { volume empty$
      { " " }
      { " Vol. " volume * }
      if$
    }
    {
      volume empty$
        { number empty$
            { series }
            { series format.numberinseries * }
          if$
        }
        { number empty$
            { series ", vol. " volume * * }
            { series ", vol. " * volume * format.numberinseries * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {cbooklike.series.volume.number.pages}           %wk加入页码 ？？？        %  Chicago, pages           %wk
{ series empty$                                             %  450-451.
    { volume empty$
      {  pages empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.pages }
        { ":" * pages n.dashify * "" *}                                   %wk 改为第页
      if$
    }
  if$}
      { "卷" volume * }
      if$
    }
    {
      volume empty$
        { number empty$
            { series }
            { series format.numberinseries * }
          if$
        }
        { number empty$
            { series "，第" volume * "卷" * * }
            { series "卷" * volume * format.cnumberinseries * }
          if$
        }
      if$
    }
  if$
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {incollectionlike.series.volume.number.pages}             %wk           
{ series empty$
    { volume empty$
      {  pages empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.pages }
        { ":" * pages n.dashify * "" *}                                   %wk 改为第页
      if$
    }
  if$}
      { "，" volume * ""  * *
        pages empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.pages }
        { ":" * pages n.dashify * "" *}                                   %wk 改为第页
      if$
    }
  if$}
      if$
    }
    { new.block
      volume empty$
        { number empty$
            { series }
            { series format.numberinseries * }
          if$
        }
        { number empty$
            { series ", vol. " volume * * }
            { series ", vol. " * volume * format.numberinseries * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {cincollectionlike.series.volume.number.pages}             %wk           
{ series empty$
    { volume empty$
      {  pages empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.pages }
        { ":" * pages n.dashify * "" *}                                   %wk 改为第页
      if$
    }
  if$}
      { "，第" volume * "卷"  * *
        pages empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.pages }
        { ":" * pages n.dashify * "" *}                                   %wk 改为第页
      if$
    }
  if$}
      if$
    }
    { new.block
      volume empty$
        { number empty$
            { series }
            { series format.numberinseries * }
          if$
        }
        { number empty$
            { series ", vol. " volume * * }
            { series ", vol. " * volume * format.numberinseries * }
          if$
        }
      if$
    }
  if$
}


FUNCTION {format.TypeofLit}                                  %wk  完全改写
{ TypeofLit empty$
    { "" }
    {"[" TypeofLit * "]" *}
    if$
}


FUNCTION {format.edition}
{ edition empty$
    {
      translator empty$
        { "" }
        {"" translator * "，translation" * }
        if$
    }
    {
      translator empty$
         {edition}
         {translator output
          "，translation." edition * "" * *}
         if$
    }     
if$
}

FUNCTION {format.url}
{ url empty$
    { "" }
    { new.block 
    "\url{" url * "}" * }
  if$
}

FUNCTION {format.cedition}                                  %wk  完全改写
{ edition empty$
    {
      translator empty$
        { "" }
        {"" translator format.cnames * "，译" *}
        if$
    }
    {
      translator empty$
         {edition}
         {translator format.cnames output
          "，译." edition * "" * *}
         if$
    }     
if$
}




FUNCTION {format.ctranslator}                                  %wk  完全改写
{ translator empty$
    { "" }
    {format.cnames "，译" * "translator" output.check}
    if$
}
    
FUNCTION {format.pagesinbook}                               %  By the time the
{ pages empty$                                              %  reader has read
    { "" }                                                  %  address, pub'r,
    { pages multi.page.check                                %  note (where the
        { ":" pages n.dashify tie.or.space.connect }   %  note may end with
        { ":" pages tie.or.space.connect }              %  numbers), s/he
      if$                                                   %  may not recognise
    }                                                       %  a number-range as
  if$                                                       %  meaning pages.
}                                                           %  Avoid ambiguity
                                                            %  (Butcher, p.181).
                                                            
FUNCTION {format.cpagesinbook}                              %  By the time the         %wk
{ pages empty$                                              %  reader has read
    { "" }                                                  %  address, pub'r,
    { pages multi.page.check                                %  note (where the
        { ":" * pages n.dashify tie.or.space.connect * "" }   %  note may end with
        { ":" * "Page " pages tie.or.space.connect * ""}              %  numbers), s/he
      if$                                                   %  may not recognise
    }                                                       %  a number-range as
  if$                                                       %  meaning pages.
}                                                           %  Avoid ambiguity
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {format.vol.num.date.pages}                       %wk  
{volume empty$                                                        %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    {volume                                         %wk  被重新改过
    }                                                                 %wk  被重新改过
  if$                                                                 %wk  被重新改过
  number empty$                                                       %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    { "(" number * ")" * *                                          %wk  被重新改过
      volume empty$                                                   %wk  被重新改过
        { "there's a number but no volume in " cite$ * warning$ }     %wk  被重新改过
        'skip$                                                        %wk  被重新改过
      if$                                                             %wk  被重新改过
    }                                                                 %wk  被重新改过
  if$                                                                 %wk  被重新改过
  pages empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.pages }
        { ":" * pages n.dashify * "" *}                                   %wk 改为第页
      if$
    }
  if$
}


FUNCTION {format.cvol.num.date.pages}                       %wk  
{volume empty$                                                        %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    {volume                                         %wk  被重新改过
    }                                                                 %wk  被重新改过
  if$                                                                 %wk  被重新改过
  number empty$                                                       %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    { "(" number * ")" * *                                          %wk  被重新改过
      volume empty$                                                   %wk  被重新改过
        { "there's a number but no volume in " cite$ * warning$ }     %wk  被重新改过
        'skip$                                                        %wk  被重新改过
      if$                                                             %wk  被重新改过
    }                                                                 %wk  被重新改过
  if$                                                                 %wk  被重新改过
  pages empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.pages }
        { ":" * pages n.dashify * "" *}                                   %wk 改为第页
      if$
    }
  if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {format.article.vol.num.date.pages}                       %wk  
{
volume empty$                                                        %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    {volume                                         %wk  被重新改过
    }                                                                 %wk  被重新改过
  if$                                                                 %wk  被重新改过
number empty$                                                       %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    { "(" number * ")" * *                                          %wk  被重新改过
      volume empty$                                                   %wk  被重新改过
        { "there's a number but no volume in " cite$ * warning$ }     %wk  被重新改过
        'skip$                                                        %wk  被重新改过
      if$                                                             %wk  被重新改过
    }                                                                 %wk  被重新改过
  if$                                                                 %wk  被重新改过
  pages empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.pages }
        { ":" * pages n.dashify * "" *}                                   %wk 改为第页
      if$
    }
  if$       
}



FUNCTION {format.carticle.vol.num.date.pages}                       %wk  
{
volume empty$                                                        %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    {volume                                         %wk  被重新改过
    }                                                                 %wk  被重新改过
  if$                                                                 %wk  被重新改过
number empty$                                                       %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    { "(" number * ")" * *                                          %wk  被重新改过
      volume empty$                                                   %wk  被重新改过
        { "there's a number but no volume in " cite$ * warning$ }     %wk  被重新改过
        'skip$                                                        %wk  被重新改过
      if$                                                             %wk  被重新改过
    }                                                                 %wk  被重新改过
  if$                                                                 %wk  被重新改过
  pages empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.pages }
        { ":" * pages n.dashify * "" *}                                   %wk 改为第页
      if$
    }
  if$       
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {format.book.continue.vol.num}                       %wk  
{
startyear empty$
    'skip$
    {"." startyear * "" * *
    startvolume empty$                                                        %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    {"," startvolume * "" *  *}                                                                 %wk  被重新改过
     if$         
                                                             %wk  被重新改过
    startnumber empty$                                                       %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    { "(" startnumber * ")-" * *  }                                        %wk  被重新改过
      if$                                                             %wk  被重新改过
    }                                                                 %wk  被重新改过
if$    
                                                             %wk  被重新改过
endyear empty$
    'skip$
    {"" endyear * "" * *
    endvolume empty$                                                        %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    {"," endvolume * "" *  *}                                                                 %wk  被重新改过
     if$         
                                                             %wk  被重新改过
    endnumber empty$                                                       %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    { "(" endnumber * ")" * *  }                                        %wk  被重新改过
      if$                                                             %wk  被重新改过
    }                                                                 %wk  被重新改过
if$  
}




FUNCTION {format.cbook.continue.vol.num}                       %wk  
{
startyear empty$
    'skip$
    {"." startyear * "" * *
    startvolume empty$                                                        %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    {"," startvolume * "" *  *}                                                                 %wk  被重新改过
     if$         
                                                             %wk  被重新改过
    startnumber empty$                                                       %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    { "(" startnumber * ")-" * *  }                                        %wk  被重新改过
      if$                                                             %wk  被重新改过
    }                                                                 %wk  被重新改过
if$    
                                                             %wk  被重新改过
endyear empty$
    'skip$
    {"" endyear * "" * *
    endvolume empty$                                                        %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    {"," endvolume * "" *  *}                                                                 %wk  被重新改过
     if$         
                                                             %wk  被重新改过
    endnumber empty$                                                       %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    { "(" endnumber * ")" * *  }                                        %wk  被重新改过
      if$                                                             %wk  被重新改过
    }                                                                 %wk  被重新改过
if$  
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {format.date.modifydate.citedate}                       %wk  
{
date empty$                                                        %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    {date                                         %wk  被重新改过
    }                                                                 %wk  被重新改过
  if$                                                                 %wk  被重新改过

modifydate empty$                                                       %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    { "(" modifydate * ")" * *                                          %wk  被重新改过
      date empty$                                                   %wk  被重新改过
        { "" cite$ * warning$ }     %wk  被重新改过
        'skip$                                                        %wk  被重新改过
      if$                                                             %wk  被重新改过
    }                                                                 %wk  被重新改过
  if$
  
citedate empty$                                                       %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    { "[" citedate * "]" * *                                         %wk  被重新改过
      date empty$                                                   %wk  被重新改过
        { "" cite$ * warning$ }     %wk  被重新改过
        'skip$                                                        %wk  被重新改过
      if$                                                             %wk  被重新改过
    }                                                                 %wk  被重新改过
  if$ 
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {format.chapter.pages.inbook}
{ chapter empty$
    'format.pagesinbook
    { type empty$
        { "Chap." }
        { type }
      if$
      chapter tie.or.space.connect
      pages empty$
        'skip$
        { ", " * format.pagesinbook "l" change.case$ * }
      if$
    }
  if$
}

FUNCTION {format.cchapter.pages.inbook} 
{chapter empty$                                                        %wk  被重新改过
    'skip$                                                            %wk  被重新改过
    { "，第" chapter * "章" * *                                          %wk  被重新改过
    }                                                                 %wk  被重新改过
  if$                                                                 %wk  被重新改过
  pages empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.pages }
        { ":" * pages n.dashify * "" *}                                   %wk 改为第页
      if$
    }
  if$
}
  
  

FUNCTION {format.chapter.pages.incoll}
{ chapter empty$
    { pages empty$
        { "In " }
        { "{\em " format.pagesinbook " of:} " * * }
      if$
    }
    { type empty$
        { "{\em Chap. " chapter * }
        { "{\em " type * " " * chapter * }
      if$
      pages empty$
        { " of:} " * }
        { ", " * format.pagesinbook "l" change.case$ " of:} " * * }
      if$
    }
  if$
}

FUNCTION {format.cchapter.pages.incoll}                       %wk
{ chapter empty$
    { pages empty$
        { "" }
        { "第" format.pagesinbook "章" * * }
      if$
    }
    { type empty$
        { "第" chapter * "章" * * }
        { "" type * "" * chapter * }
      if$
      pages empty$
        { "" * }
        { ":" * format.pagesinbook "l" change.case$ "" * * }
      if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle}                           %  Achieves effect         %wk
{ booktitle empty$                                          %  shown in 16.51
    { "" }                                                  %  of Chicago, at
    { editor empty$                                         %  expense of not
         {"" * booktitle * "" *
          new.block
         }
        {new.block
    normalauthor empty$                           %用于正常显示
         {
    normaleditor empty$                           %用于正常显示
         {      format.editors  "author and editor" output.check}       %用于正常显示,
         {      format.editors  "author and normaleditor" output.check} %用于正常显示
    if$                                           %用于正常显示            
         }                   %用于正常显示
         {
    normaleditor empty$                           %用于正常显示
         {format.editors  "normalauthor and editor" output.check}                   %用于正常显示
         {format.editors  "normalauthor and normaleditor" output.check}       %用于正常显示
    if$                                           %用于正常显示   
         
         }       %用于正常显示
    if$                                           %用于正常显示
      editor format.key output
      new.block
      format.btitle "booktitle" output.check  
      }
      if$                                                   %  4.4 of BS 1629.
    }
  if$                                                       %  Don't change
}                                                           %  case.
 

FUNCTION {format.in.ced.booktitle}                           %  Achieves effect         %wk
{ booktitle empty$                                          %  shown in 16.51
    { "" }                                                  %  of Chicago, at
    { editor empty$                                         %  expense of not
         {"" * booktitle * "" *
          new.block
         }
        {new.block
    normalauthor empty$                           %用于正常显示
         {
    normaleditor empty$                           %用于正常显示
         {format.ceditors  "author and editor" output.check}       %用于正常显示,
         {format.ceditors  "author and normaleditor" output.check} %用于正常显示
    if$                                           %用于正常显示            
         }                   %用于正常显示
         {
    normaleditor empty$                           %用于正常显示
         {format.ceditors  "normalauthor and editor" output.check}                   %用于正常显示
         {format.ceditors  "normalauthor and normaleditor" output.check}       %用于正常显示
    if$                                           %用于正常显示   
         
         }       %用于正常显示
    if$                                           %用于正常显示
      editor format.key output
      new.block
      format.cbtitle "booktitle" output.check  
      }
      if$                                                   %  4.4 of BS 1629.
    }
  if$                                                       %  Don't change
}                                                           %  case.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
FUNCTION {format.in.proceedings.booktitle}                           %  Achieves effect         %wk
{ booktitle empty$                                          %  shown in 16.51
    { "" }                                                  %  of Chicago, at
    {format.btitle "booktitle" output.check   }
  if$                                                       %  Don't change
}                                                           %  case.
 

FUNCTION {format.in.cproceedings.booktitle}                           %  Achieves effect         %wk
{ booktitle empty$                                          %  shown in 16.51
    { "" }                                                  %  of Chicago, at
    { format.cbtitle "booktitle" output.check   }
      if$                                                   %  4.4 of BS 1629.
                                                     %  Don't change
}   


FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type                                                  %  Don't change
    }                                                       %  case.
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { "Tech. rept."  }                                      %  ODWE abbrevs.
    'type
  if$
  number empty$
    {                  }                                    %  Whatever was
    { number tie.or.space.connect }                         %  having its case
  if$                                                       %  changed, leave
}                                                           %  it alone.

FUNCTION {format.addr.pub}
{ publisher empty$
    {address empty$
        { ".[S.l.]: [s.n.] " *}
        { address ": [s.n.] " * }
      if$
    }
    { address empty$
        { ".[S.l.]: " * }
        { address ": " * }
      if$
      publisher *
    }
    
  if$
}

FUNCTION {format.caddr.pub}
{publisher empty$
    {address empty$
        { ".[出版地不详]：[出版者不详]" *}
        { address ":[出版者不详]" * }
      if$
    }
    { address empty$
        { ".[出版地不详]：" * }
        { address ": " * }
      if$
     publisher * 
    }
    
  if$
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {format.addr.institution}
{ institution empty$
    {address empty$
        { ".[S.l.]: [s.n.] " *}
        { address ": [s.n.] " * }
      if$
    }
    { address empty$
        { ".[S.l.]: " * }
        { address ": " * }
      if$
      institution *
    }
    
  if$
}

FUNCTION {format.caddr.institution}
{institution empty$
    {address empty$
        { ".[地址不详]：[机构不详]" *}
        { address ":[机构不详]" * }
      if$
    }
    { address empty$
        { ".[地址不详]：" * }
        { address ": " * }
      if$
     institution * 
    }
    
  if$
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {format.school.pub}
{ school empty$
    {address empty$
        { "[S.l.]: [s.n.] " }
        { address ": [s.n.] " * }
      if$
    }
    { address empty$
        { ".[S.l.]: " * }
        { address ": " * }
      if$
      school *
    }
    
  if$
}

FUNCTION {format.cschool.pub}
{school empty$
    {address empty$
        { "[地址不详]：[学校不详]" }
        { address ":[学校不详]" * }
      if$
    }
    { address empty$
        { ".[学校不详]：" * }
        { address ": " * }
      if$
      school *
    }
    
  if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {format.inproceedings.addr.pub}
{ 
TypeofLit empty$
       {publisher empty$
    {address empty$
        { ".[S.l.]: [s.n.] " }
        { address ": [s.n.] " * }
      if$
    }
    { address empty$
        { ".[S.l.]: " * }
        { address ": " * }
      if$
      publisher *
    }
    
  if$}   
       { "" }
if$
}

FUNCTION {format.cinproceedings.addr.pub}
{
TypeofLit empty$
       {publisher empty$
    {address empty$
        { ".[出版地不详]：[出版者不详]" }
        { address ":[出版者不详]" * }
      if$
    }
    { address empty$
        { ".[出版地不详]：" * }
        { address ": " * }
      if$
      publisher *
    }
    
  if$}   
       { ""}
if$
 
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {format.misc.addr.pub}
{ publisher empty$
    {address empty$
        { "" }
        { address ": [s.n.] " * }
      if$
    }
    { address empty$
        { "[S.l.]: " * }
        { address ": " * }
      if$
      publisher *
    }
    
  if$
}

FUNCTION {format.cmisc.addr.pub}
{publisher empty$
    {address empty$
        { "" }
        { address ":[出版者不详]" * }
      if$
    }
    { address empty$
        { "[出版地不详]：" * }
        { address ": " * }
      if$
      publisher *
    }
    
  if$
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


FUNCTION {format.addr.pub.org}                              %  If there's an
{ address empty$                                            %  an organization
  { "[S.l.]:" * publisher * ", for " * organization * }                 %  and a publisher
  { address ": " * publisher * ", for " * organization * }  %  too.
  if$
}

FUNCTION {format.addr.inst}
{ address empty$
  { institution empty$
    { "[S.l.]" }
    { "[S.l.]" * institution * }
    if$
  }
  { institution empty$
    { "" }
    { institution ", " * }
    if$
    address *
  }
  if$
}

FUNCTION {format.addr.org}
{ address empty$
  { organization empty$
    { "" }
    { organization }
    if$
  }
  { organization empty$
    { "" }
    { organization ", " * }
    if$
    address *
  }
  if$
}

FUNCTION {format.article.crossref}
{ "In "
  " \cite{" * crossref * "}" *
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      "In "
    }
    { " Vol." volume tie.or.space.connect
      " of " *
    }
  if$
  "\cite{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{ "In "
  " \cite{" * crossref * "}" *
}

FUNCTION {format.address.publisher}
{ address empty$
    { publisher empty$
    { "" }
    { "there's a publisher but no address in " cite$ * warning$
      publisher
    }
      if$
    }
    { publisher empty$
    'address
    { address ": " * publisher * }
      if$
    }
  if$
}

FUNCTION {format.address.school}
{ address empty$
    { school empty$
    { "" }
    { "there's a school but no address in " cite$ * warning$
      school
    }
      if$
    }
    { school empty$
    'address
    { address ": " * school * }
      if$
    }
  if$
}


FUNCTION {article}
{language empty$   
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  new.block  
  format.article.title output 
  new.block
  crossref missing$
    { journal                           %  Don't change
      "journal" output.check                                %  case.
      output.article.year.check   output
      format.article.vol.num.date.pages output
      format.date.modifydate.citedate output
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  new.block
  format.url output
  new.block
  note output

  fin.entry
}

%FUNCTION {carticle}                                         %wk  本函数
{ output.bibitem
  format.cauthors "author" output.check
  author format.key output
  new.block
  format.carticle.title output 
  new.block
  crossref missing$
    {journal                               % Don't change    %wk 
     "journal" output.check                                %  case.
      output.carticle.year.check   output                                      %wk
      format.carticle.vol.num.date.pages output                      %wk
      format.date.modifydate.citedate output
      new.block
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  new.block
  format.url output
  new.block
  note output
  fin.entry
}
if$
}

FUNCTION {book}
{language empty$   
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.book.title output  
  new.block
  crossref missing$
    { format.edition output
      new.block
      format.book.continue.vol.num output
      booklike.series.volume.number output
      new.block
      format.addr.pub "publisher" output.check
      output.continue.year.check  output   
      format.date.modifydate.citedate output
      format.pages output
    }
    { format.book.crossref output.nonnull
    }
  if$
  new.block
  format.url output
  new.block
  note output
  fin.entry
}

%FUNCTION {cbook}                                             %wk                
{ output.bibitem
  author empty$
    { format.ceditors  "author and editor" output.check       %wk    format.editors->format.ceditors
      editor format.key output
    }
    { format.cauthors output.nonnull
      crossref missing$
        {"author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.cbook.title output                       %wk
  new.block
  crossref missing$
    {
     format.cedition output                                 %wk   edition->cedition
      new.block
      format.cbook.continue.vol.num output
      new.block
      format.caddr.pub "publisher" output.check
      output.continue.cyear.check  output                                     %wk
      cbooklike.series.volume.number.pages output
      format.date.modifydate.citedate output
     }
    {  format.book.crossref output.nonnull
    }
  if$
  new.block
  format.url output
  new.block
  note output
  fin.entry
}
if$
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%未处理
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {booklet}
{language empty$   
{ output.bibitem
  format.authors output
  author format.key output
  output.year.month.check
  new.block
  format.btitle "title" output.check
  new.block
  howpublished output
  address output
  output.year.check
  new.block
  format.url output
  new.block
  note output
  fin.entry
}

%FUNCTION {cbooklet}                                           %wk
{ output.bibitem
  format.cauthors output                                      %wk  
  author  format.key output
  format.btitle "title" output.check                         %wk
  new.block
  howpublished output
  address output
  output.cyear.month.check                                    %wk
  new.block
  format.url output
  new.block
  note output
  fin.entry
}
if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {inbook}
{language empty$   
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.book.title output  
  new.block
  crossref missing$
    { format.edition output
      booklike.series.volume.number output
      new.block
      format.addr.pub "publisher" output.check
      output.year.check output
      format.date.modifydate.citedate output
      format.pages output
    }
    { format.book.crossref output.nonnull
    }
  if$
  new.block
  format.url output
  new.block
  note output
  fin.entry
}

%FUNCTION {cinbook}                                             %wk                
{ output.bibitem
  author empty$
    { format.ceditors  "author and editor" output.check       %wk    format.editors->format.ceditors
      editor format.key output
    }
    { format.cauthors output.nonnull
      crossref missing$
        {"author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.cbook.title output                       %wk
  new.block
  crossref missing$
    {
     format.cedition output                                 %wk   edition->cedition
      new.block
      format.caddr.pub "publisher" output.check
      output.cyear.check                                       %wk
      cbooklike.series.volume.number.pages output
      format.date.modifydate.citedate output
     }
    {  format.book.crossref output.nonnull
    }
  if$
  new.block
  format.url output
  new.block
  note output
  fin.entry
}
if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {incollection}                                     %wk
{language empty$   
{ output.bibitem
  author empty$
    { format.editors "editor" output.check                  %wk    format.editors->format.ceditors
      editor format.key output             }
    { format.authors "author" output.check                   %wk
      author format.key output             }
  if$
  new.block
  format.incollection.title output  
  crossref missing$                                         %  Chapter and/or
    {
    format.in.ed.booktitle output                         %  page numbers can
      format.edition output                                 %  come out via this         %wk  edition->cedition
      new.block
      format.addr.pub "publisher" output.check
      output.year.check 
      incollectionlike.series.volume.number.pages output          %  route, too.
      format.date.modifydate.citedate output 
    }
    { format.incoll.inproc.crossref output.nonnull
      new.block
    }
  if$

  format.url output
  new.block
  note output
  fin.entry
}

%FUNCTION {cincollection}                                     %wk
{ output.bibitem
  author empty$
    { format.ceditors "editor" output.check                  %wk    format.editors->format.ceditors
      editor format.key output             }
    { format.cauthors "author" output.check                   %wk
      author format.key output             }
  if$
  new.block
  format.cincollection.title output
  crossref missing$                                         %  Chapter and/or
    { format.in.ced.booktitle output                         %  page numbers can
      format.cedition output                                 %  come out via this         %wk  edition->cedition
      new.block
      format.caddr.pub "publisher" output.check
      output.cyear.check   output
      cincollectionlike.series.volume.number.pages output          %  route, too.
      format.date.modifydate.citedate output 
    }
    { format.incoll.inproc.crossref output.nonnull
      new.block
    }
  if$
  new.block
  format.url output
  new.block
  note output
  fin.entry
}
if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%图书book和
%会议录inproceedings(会议conference与inproceedings一样)，         
%文献类型代码[C]
%硕士学位论文mastersthesis，
%文献类型代码[D]
%博士学位论文phdthesis，
%文献类型代码[D]
%技术报告techreport的类型是一样的，
%文献类型代码[R]
%
%因此我们直接拷贝book的相关内容即可。
%原始部分可以参考authordate1.bst。
%
%利用misc作为电子文献［EB/OL］所使用的类型
%存在的问题：无法正常调用url，只能利用note来生成。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {inproceedings}                                    %wk 改自incollection类型
{language empty$   
{ output.bibitem
  author empty$
    { format.editors "editor" output.check                  %wk    format.editors->format.ceditors
      editor format.key output             }
    { format.authors "author" output.check                   %wk
      author format.key output             }
  if$
  new.block
  format.inproceedings.title output  
  crossref missing$                                         %  Chapter and/or
    {
    format.in.ed.booktitle output                         %  page numbers can
      format.edition output                                 %  come out via this         %wk  edition->cedition
      new.block
      format.inproceedings.addr.pub "publisher" output.check
      output.year.check 
      incollectionlike.series.volume.number.pages output          %  route, too.
      format.date.modifydate.citedate output 
    }
    { format.incoll.inproc.crossref output.nonnull
      new.block
    }
  if$
  format.url output
  new.block
  note output
  fin.entry
}

%FUNCTION {cinproceedings}                                           %wk 改自incollection类型
{ output.bibitem
  author empty$
    { format.ceditors "editor" output.check                  %wk    format.editors->format.ceditors
      editor format.key output             }
    { format.cauthors "author" output.check                   %wk
      author format.key output             }
  if$
  new.block
  format.cinproceedings.title output
  crossref missing$                                         %  Chapter and/or
    { format.in.ced.booktitle output                         %  page numbers can
      format.cedition output                                 %  come out via this         %wk  edition->cedition
      new.block
      format.cinproceedings.addr.pub "publisher" output.check
      output.cyear.check 
      cincollectionlike.series.volume.number.pages output          %  route, too.
      format.date.modifydate.citedate output 
    }
    { format.incoll.inproc.crossref output.nonnull
      new.block
    }
  if$
  new.block
  format.url output
  new.block
  note output
  fin.entry
}
if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {conference} { inproceedings }
%FUNCTION {cconference} { cinproceedings }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {TECHREPORT}                             %wk   改自book类型
{language empty$   
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.title "[R]" *  "title" output.check
  new.block
  crossref missing$
    { format.edition output
      booklike.series.volume.number output
      new.block
      format.addr.institution "publisher" output.check
      output.year.check output
      format.pages output
    }
    { format.book.crossref output.nonnull
    }
  if$
  new.block
  format.url output
  new.block
  note output
  fin.entry
}

%FUNCTION {cTECHREPORT}                                    %wk   改自book类型
{ output.bibitem
  author empty$
    { format.ceditors  "author and editor" output.check       %wk    format.editors->format.ceditors
      editor format.key output
    }
    { format.cauthors output.nonnull
      crossref missing$
        {"author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.ctitle  "[R]" * "title" output.check                        %wk
  new.block
  crossref missing$
    {
     format.cedition output                                 %wk   edition->cedition
      new.block
      format.caddr.institution "publisher" output.check
      output.cyear.check                                       %wk
      cbooklike.series.volume.number.pages output
    }
    {  format.book.crossref output.nonnull
    }
  if$
  new.block
  format.url output
  new.block
  note output
  fin.entry
}
if$
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {mastersthesis}                                %wk   改自book类型
{language empty$   
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.title "[D]" *  "title" output.check
  new.block
  crossref missing$
    { format.edition output
      booklike.series.volume.number output
      new.block
%      format.addr.pub "publisher" output.check
      format.school.pub "publisher" output.check
      output.year.check output
      format.pages output
    }
    { format.book.crossref output.nonnull
    }
  if$
  new.block
  format.url output
  new.block
  note output
  fin.entry
}

%FUNCTION {cmastersthesis}                                %wk   改自book类型
{ output.bibitem
  author empty$
    { format.ceditors  "author and editor" output.check       %wk    format.editors->format.ceditors
      editor format.key output
    }
    { format.cauthors output.nonnull
      crossref missing$
        {"author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.ctitle  "[D]" * "title" output.check                      %wk
  new.block
  crossref missing$
    {
     format.cedition output                                 %wk   edition->cedition
      new.block
%      format.caddr.pub "publisher" output.check
      format.cschool.pub "publisher" output.check
      output.cyear.check                                       %wk
      cbooklike.series.volume.number.pages output
    }
    {  format.book.crossref output.nonnull
    }
  if$
  new.block
  format.url output
  new.block
  note output
  fin.entry
}
if$
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {phdthesis}                        %wk  改自book类型
{language empty$   
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.title "[D]" *  "title" output.check
  new.block
  crossref missing$
    { format.edition output
      booklike.series.volume.number output
      new.block
%      format.addr.pub "publisher" output.check
      format.school.pub "publisher" output.check
      output.year.check output
      format.pages output
    }
    { format.book.crossref output.nonnull
    }
  if$
  new.block
  format.url output
  new.block
  note output
  fin.entry
}

%FUNCTION {cphdthesis}                        %wk  改自book类型        
{ output.bibitem
  author empty$
    { format.ceditors  "author and editor" output.check       %wk    format.editors->format.ceditors
      editor format.key output
    }
    { format.cauthors output.nonnull
      crossref missing$
        {"author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.ctitle  "[D]" * "title" output.check                        %wk
  new.block
  crossref missing$
    {
     format.cedition output                                 %wk   edition->cedition
      new.block
%      format.caddr.pub "publisher" output.check
      format.cschool.pub "publisher" output.check
      output.cyear.check                                       %wk
      cbooklike.series.volume.number.pages output
    }
    {  format.book.crossref output.nonnull
    }
  if$
  new.block
  format.url output
  new.block
  note output
  fin.entry
}
if$
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {format.conference.title}
{
	% empty shit
}

FUNCTION {proceedings}            %改自book类型
{language empty$   
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.conference.title output  
  new.block
  crossref missing$
    { format.edition output
      booklike.series.volume.number output
      new.block
      format.addr.pub "publisher" output.check
      output.year.check output
      format.date.modifydate.citedate output
      format.pages output
    }
    { format.book.crossref output.nonnull
    }
  if$
  new.block
  format.url output
  new.block
  note output
  fin.entry
}

%FUNCTION {cproceedings}            %改自book类型             
{ output.bibitem
  author empty$
    { format.ceditors  "author and editor" output.check       %wk    format.editors->format.ceditors
      editor format.key output
    }
    { format.cauthors output.nonnull
      crossref missing$
        {"author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.conference.title output                       %wk
  new.block
  crossref missing$
    {
     format.cedition output                                 %wk   edition->cedition
      new.block
      format.caddr.pub "publisher" output.check
      output.cyear.check                                       %wk
      cbooklike.series.volume.number.pages output
      format.date.modifydate.citedate output
     }
    {  format.book.crossref output.nonnull
    }
  if$
  new.block
  format.url output
  new.block
  note output
  fin.entry
}
if$
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {manual}             %改自book类型
{language empty$   
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.btitle "[H]" *  "title" output.check
  new.block
  crossref missing$
    { format.edition output
      booklike.series.volume.number output
      new.block
      format.addr.pub "publisher" output.check
      output.year.check output
      format.pages output
    }
    { format.book.crossref output.nonnull
    }
  if$
  new.block
  format.url output
  new.block
  note output
  fin.entry
}

%FUNCTION {cmanual}                                             %wk                
{ output.bibitem
  author empty$
    { format.ceditors  "author and editor" output.check       %wk    format.editors->format.ceditors
      editor format.key output
    }
    { format.cauthors output.nonnull
      crossref missing$
        {"author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.ctitle  "[H]" * "title" output.check                        %wk
  new.block
  crossref missing$
    { format.cedition output                                 %wk   edition->cedition
      new.block
      format.caddr.pub "publisher" output.check
      output.cyear.check                                       %wk
      cbooklike.series.volume.number.pages output
    }
    {  format.book.crossref output.nonnull
    }
  if$
  new.block
  note output
  fin.entry
}
if$
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {misc}              %作为非常规文献的格式，可靠性低，应该仔细检查，改自book类型
{language empty$   
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.misc.title output  
  new.block
  crossref missing$
    { format.edition output
      booklike.series.volume.number output
      new.block
      format.misc.addr.pub "publisher" output.check
%      output.year.check output
      format.date.modifydate.citedate output
%      format.pages output
    }
    { format.book.crossref output.nonnull
    }
  if$
  new.block
  format.url output
  new.block
  note output
  fin.entry
}

%FUNCTION {cmisc}              %作为非常规文献的格式，可靠性低，应该仔细检查，改自book类型        
{ output.bibitem
  author empty$
    { format.ceditors  "author and editor" output.check       %wk    format.editors->format.ceditors
      editor format.key output
    }
    { format.cauthors output.nonnull
      crossref missing$
        {"author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.cmisc.title output                       %wk

  new.block
  crossref missing$
    {
     format.cedition output                                 %wk   edition->cedition
      new.block
      format.cmisc.addr.pub "publisher" output.check
%      output.cyear.check                                       %wk
%      cbooklike.series.volume.number.pages output
      format.date.modifydate.citedate output
     }
    {  format.book.crossref output.nonnull
    }
  if$
  new.block
  format.url output
  new.block
  note output
  fin.entry
}
if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {unpublished}
{language empty$   
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  output.year.month.check
  new.block
  format.btitle "title" output.check
  new.block
  note "note" output.check
  fin.entry
}

%FUNCTION {cunpublished}                                     %wk  
{ output.bibitem
  format.cauthors "author" output.check                      %wk
  author format.key output
  output.cyear.month.check                                  %wk
  new.block
  format.ctitle "title" output.check                          %wk
  new.block
  note "note" output.check
  fin.entry
}
if$
}

FUNCTION {default.type} { book }    %wk 因为主要是基于book类型,因此将缺省类型由misc改为book

MACRO {jan} {"Jan."}                                        %  ODWE, "months", &
                                                            %  Chicago, p. 383.
MACRO {feb} {"Feb."}

MACRO {mar} {"Mar."}

MACRO {apr} {"Apr."}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"Aug."}

MACRO {sep} {"Sept."}

MACRO {oct} {"Oct."}

MACRO {nov} {"Nov."}

MACRO {dec} {"Dec."}

MACRO {acmcs} {"ACM Computing Surveys"}

MACRO {acta} {"Acta Informatica"}

MACRO {cacm} {"Communications of the ACM"}

MACRO {ibmjrd} {"IBM Journal of Research and Development"}

MACRO {ibmsj} {"IBM Systems Journal"}

MACRO {ieeese} {"IEEE Transactions on Software Engineering"}

MACRO {ieeetc} {"IEEE Transactions on Computers"}

MACRO {ieeetcad}
 {"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}

MACRO {ipl} {"Information Processing Letters"}

MACRO {jacm} {"Journal of the ACM"}

MACRO {jcss} {"Journal of Computer and System Sciences"}

MACRO {scp} {"Science of Computer Programming"}

MACRO {sicomp} {"SIAM Journal on Computing"}

MACRO {tocs} {"ACM Transactions on Computer Systems"}

MACRO {tods} {"ACM Transactions on Database Systems"}

MACRO {tog} {"ACM Transactions on Graphics"}

MACRO {toms} {"ACM Transactions on Mathematical Software"}

MACRO {toois} {"ACM Transactions on Office Information Systems"}

MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}

MACRO {tcs} {"Theoretical Computer Science"}

READ

%FUNCTION {sortify}
%{ purify$
%  "l" change.case$
%}
%
%INTEGERS { len }
%
%FUNCTION {chop.word}
%{ 's :=
%  'len :=
%  s #1 len substring$ =
%    { s len #1 + global.max$ substring$ }
%    's
%  if$
%}
%
%FUNCTION {format.lab.names}                                      %wk
%{ 's :=
%  s #1 "{vv~}{ll}" format.name$
%  s num.names$ duplicate$
%  #2 >
%    { pop$ " {\em et~al.}" * }
%    { #2 <
%        'skip$
%        { s #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
%            { " {\em et~al.}" * }
%            { " and " * s #2 "{vv~}{ll}" format.name$ * }           %wk
%          if$
%        }
%      if$
%    }
%  if$
%}
%
%FUNCTION {author.key.label}
%{ author empty$
%    { key empty$
%        { cite$ #1 #3 substring$ }
%        'key
%      if$
%    }
%    { author format.lab.names }
%  if$
%}
%
%FUNCTION {author.editor.key.label}
%{ author empty$
%    { editor empty$
%        { key empty$
%            { cite$ #1 #3 substring$ }
%            'key
%          if$
%        }
%        { editor format.lab.names }
%      if$
%    }
%    { author format.lab.names }
%  if$
%}
%
%FUNCTION {editor.key.label}
%{ editor empty$
%    { key empty$
%        { cite$ #1 #3 substring$ }
%        'key
%      if$
%    }
%    { editor format.lab.names }
%  if$
%}
%
%FUNCTION {calc.label}                                       %wk修改
%  { type$ "book" =
%    type$ "cbook" = 
%    type$ "inbook" =
%    type$ "cinbook" =
%    type$ "incollection" =                                  %  For sensible
%    type$ "cincollection" = 
%  or or  or or or                                                  %  treatment of
%    'author.editor.key.label                                %  Singer in
%    { type$ "proceedings" =                                 %  BS 1629.
%        'editor.key.label
%        'author.key.label
%      if$
% type$ "cproceedings" =                                 %  BS 1629.
%        'editor.key.label
%        'author.key.label
%      if$
%
%    }
%  if$
%  duplicate$
%  year empty$
%  {
%    "\protect\citename{" swap$ * ", }" *
%    "n.d." * 'label :=                                      %  Chicago,
%  }                                                         %  page 457.
%  {
%    "\protect\citename{" swap$ * ", }" *
%    year
%    *
%    'label :=
%  }
%  if$
%  year field.or.null purify$ *
%  sortify 'sort.label :=
%}
%
%
%FUNCTION {sort.format.names}                                %  To produce the
%{ 's :=                                                     %  order of entries
%  #1 'nameptr :=                                            %  specified in item
%  ""                                                        %  (3) on page 187
%  s num.names$ 'numnames :=                                 %  of Butcher.
%  numnames 'namesleft :=
%    { namesleft #0 > nameptr #3 < and }                     %  Only 1st 2 names
%    { nameptr #1 >                                          %  matter for
%        {
%         "   " * }                                         %  sorting.
%        'skip$
%      if$                                                   %  Anything that's
%      nameptr #2 = numnames #2 > and                        %  "et al" goes
%      { "zzzzz" * }                                         %  after works by 2
%      {                                                     %  authors.
%        s nameptr "{vv{ } }{ll{ }}{  f{ }}{  jj{ }}" format.name$ 't :=
%        nameptr numnames = t "others" = and
%          { "zzzzz" * }
%          { t sortify * }
%        if$
%      }
%      if$
%      nameptr #1 + 'nameptr :=
%      namesleft #1 - 'namesleft :=
%    }
%  while$
%}
%
%FUNCTION {sort.format.title}
%{ 't :=
%  "A " #2
%    "An " #3
%      "The " #4 t chop.word
%    chop.word
%  chop.word
%  sortify
%  #1 global.max$ substring$
%}
%
%FUNCTION {author.sort}
%{ author empty$
%    { key empty$
%        { "to sort, need author or key in " cite$ * warning$
%          ""
%        }
%        { key sortify }
%      if$
%    }
%    { author sort.format.names }
%  if$
%}
%
%FUNCTION {author.editor.sort}
%{ author empty$
%    { editor empty$
%        { key empty$
%            { "to sort, need author, editor, or key in " cite$ * warning$
%              ""
%            }
%            { key sortify }
%          if$
%        }
%        { editor sort.format.names }
%      if$
%    }
%    { author sort.format.names }
%  if$
%}
%
%FUNCTION {editor.sort}
%{ editor empty$
%    { key empty$
%        { "to sort, need editor or key in " cite$ * warning$
%          ""
%        }
%        { key sortify }
%      if$
%    }
%    { editor sort.format.names }
%  if$
%}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%->
%INTEGERS { seq.num }
%
%FUNCTION {init.seq}
%{ #0 'seq.num :=}
%
%EXECUTE {init.seq}
%
%FUNCTION {int.to.fix}
%{ "000000000" swap$ int.to.str$ *
%  #-1 #10 substring$
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%<-
%
%FUNCTION {presort}
%{ calc.label
%  label sortify
%  "    "
%  *
%  seq.num #1 + 'seq.num :=
%  seq.num  int.to.fix
%  'sort.label :=
%  sort.label *
%  #1 entry.max$ substring$
%  'sort.key$ :=
%}
%
%
%%FUNCTION {presort}                                          %  Two sorting
%%{ calc.label                                                %  passes, from
%%  label sortify                                             %  apalike.bst.
%%  "    "
%%  *
%%  type$ "book" =
%%  type$ "inbook" =
%%  type$ "incollection" =                                    %  For Singer
%%  or or                                                     %  in BS 1629.
%%    'author.editor.sort
%%    { type$ "proceedings" =
%%        'editor.sort
%%        'author.sort
%%      if$
%%    }
%%  if$
%%  #1 entry.max$ substring$
%%  'sort.label :=
%%  sort.label
%%  *
%%  "    "
%%  *
%%  title field.or.null
%%  sort.format.title
%%  *
%%  #1 entry.max$ substring$
%%  'sort.key$ :=
%%}
%
%ITERATE {presort}
%
%SORT
%
%STRINGS { last.label next.extra }
%
%INTEGERS { last.extra.num }
%
%FUNCTION {initialize.extra.label.stuff}
%{ #0 int.to.chr$ 'last.label :=
%  "" 'next.extra :=
%  #0 'last.extra.num :=
%}
%
%FUNCTION {forward.pass}
%{ last.label label =
%    { last.extra.num #1 + 'last.extra.num :=
%      last.extra.num int.to.chr$ 'extra.label :=
%    }
%    { "a" chr.to.int$ 'last.extra.num :=
%      "" 'extra.label :=
%      label 'last.label :=
%    }
%  if$
%}
%
%FUNCTION {reverse.pass}
%{ next.extra "b" =
%    { "a" 'extra.label := }
%    'skip$
%  if$                                                       %  Code needed here
%                                                            %  if \citeauthor
%                                                            %  and \citeyear
%  label extra.label * 'label :=                             %  were supported.
%  extra.label 'next.extra :=
%}
%
%EXECUTE {initialize.extra.label.stuff}
%
%ITERATE {forward.pass}
%
%REVERSE {reverse.pass}
%
%FUNCTION {bib.sort.order}
%{ sort.label
%  "    "
%  *
%  year field.or.null sortify
%  *
%  "    "
%  *
%  title field.or.null
%  sort.format.title
%  *
%  #1 entry.max$ substring$
%  'sort.key$ :=
%}
%
%ITERATE {bib.sort.order}
%
%SORT
%
%FUNCTION {begin.bib}
%{ preamble$ empty$
%    'skip$
%    { preamble$ write$ newline$ }
%  if$
%  "\begin{thebibliography}{}" write$ newline$
%  
%%开始
%  "\providecommand{\url}[1]{\texttt{#1}}"
%  write$ newline$
%  "\expandafter\ifx\csname urlstyle\endcsname\relax"
%  write$ newline$
%  "  \providecommand{\doi}[1]{doi: #1}\else"
%  write$ newline$
%  "  \providecommand{\doi}{doi: \begingroup \urlstyle{rm}\Url}\fi"
%  write$ newline$
%%结束  
%  
%}
%
%EXECUTE {begin.bib}
%
%EXECUTE {init.state.consts}
%
%ITERATE {call.type$}
%
%FUNCTION {end.bib}
%{ newline$
%  "\end{thebibliography}" write$ newline$
%}
%
%EXECUTE {end.bib}








FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}




FUNCTION {format.lab.names}                                      %wk
{ 's :=
  s #1 "{vv~}{ll}" format.name$
  s num.names$ duplicate$
  #2 >
    { pop$ " et al." * }
    { #2 <
        'skip$
        { s #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
            { " {\em et~al.}" * }
            { " and " * s #2 "{vv~}{ll}" format.name$ * }           %wk
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.lab.cnames}                                      %wk
{ 's :=
  s #1 "{vv~}{ll}" format.name$
  s num.names$ duplicate$
  #2 >
    { pop$ "~等" * }
    { #2 <
        'skip$
        { s #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
            { " {\em et~al.}" * }
            { "和" * s #2 "{vv~}{ll}" format.name$ * }           %wk
          if$
        }
      if$
    }
  if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key
      if$
    }
%    {author format.lab.names }
     {language empty$
      {author format.lab.names}
      {author format.lab.cnames}
      if$}

  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
        { key empty$
            { cite$ #1 #3 substring$ }
            'key
          if$
        }
%        { editor format.lab.names }
     {language empty$
      {editor format.lab.names}
      {editor format.lab.cnames}
      if$}
 
      if$
    }
%    { author format.lab.names }
     {language empty$
      {author format.lab.names}
      {author format.lab.cnames}
      if$}

  if$
}

FUNCTION {editor.key.label}
{ editor empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key
      if$
    }
%    { editor format.lab.names }
     {language empty$
      {editor format.lab.names}
      {editor format.lab.cnames}
      if$}

  if$
}

FUNCTION {author.key.organization.label}
{ author empty$
    { key empty$
        { organization empty$
            { cite$ #1 #3 substring$ }
            { "The " #4 organization chop.word #3 text.prefix$ }
          if$
        }
        'key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.organization.label}
{ editor empty$
    { key empty$
        { organization empty$
            { cite$ #1 #3 substring$ }
            { "The " #4 organization chop.word #3 text.prefix$ }
          if$
        }
        'key
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.short.authors}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
        'editor.key.organization.label
        { type$ "manual" =
            'author.key.organization.label
            'author.key.label
          if$
        }
      if$
    }
  if$
  'short.list :=
}

FUNCTION {calc.label}
{ calc.short.authors
  short.list
  "("
  *
  year duplicate$ empty$
  short.list key field.or.null = or
     { pop$ ""}
     'skip$
  if$
  * ")" * 
  'label :=
}

INTEGERS { seq.num }

FUNCTION {init.seq}
{ #0 'seq.num :=}

EXECUTE {init.seq}

FUNCTION {int.to.fix}
{ "000000000" swap$ int.to.str$ *
  #-1 #10 substring$
}


FUNCTION {presort}
{ calc.label
  label sortify
  "    "
  *
  seq.num #1 + 'seq.num :=
  seq.num  int.to.fix
  'sort.label :=
  sort.label *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}

SORT

STRINGS { longest.label last.label next.extra }

INTEGERS { longest.label.width last.extra.num number.label }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #0 int.to.chr$ 'last.label :=
  "" 'next.extra :=
  #0 'longest.label.width :=
  #0 'last.extra.num :=
  #0 'number.label :=
}

FUNCTION {forward.pass}
{ last.label label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      label 'last.label :=
    }
  if$
  number.label #1 + 'number.label :=
}

FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  extra.label 'next.extra :=
  extra.label
  duplicate$ empty$
    'skip$
    { "{\natexlab{" swap$ * "}}" * }
  if$
  'extra.label :=
  label extra.label * 'label :=
}

EXECUTE {initialize.longest.label}

ITERATE {forward.pass}

REVERSE {reverse.pass}

FUNCTION {bib.sort.order}
{ sort.label  'sort.key$ :=
}

ITERATE {bib.sort.order}

SORT

FUNCTION {begin.bib}
{   preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{" number.label int.to.str$ * "}" *
  write$ newline$
  "\providecommand{\natexlab}[1]{#1}"
  write$ newline$
  "\providecommand{\url}[1]{\texttt{#1}}"
  write$ newline$
  "\expandafter\ifx\csname urlstyle\endcsname\relax"
  write$ newline$
  "  \providecommand{\doi}[1]{doi: #1}\else"
  write$ newline$
  "  \providecommand{\doi}{doi: \begingroup \urlstyle{rm}\Url}\fi"
  write$ newline$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}





