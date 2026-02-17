source setup_lxplus.sh

if [ -f ANA-EXOT-2022-13-INT1.tex_backup_for_fast_compilation ]; then
  mv ANA-EXOT-2022-13-INT1.tex_backup_for_fast_compilation ANA-EXOT-2022-13-INT1.tex
fi

cp ANA-EXOT-2022-13-INT1.tex ANA-EXOT-2022-13-INT1.tex_backup_for_fast_compilation
sed -i "s#.*\include{sections/app_TTB_modeling_systematics}.*##" ANA-EXOT-2022-13-INT1.tex

make

mv ANA-EXOT-2022-13-INT1.tex_backup_for_fast_compilation ANA-EXOT-2022-13-INT1.tex
