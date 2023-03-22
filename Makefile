PANDOC_PARAMS := --markdown-headings=atx --number-sections

convert:
#	pandoc -f docx -t markdown _includes/docx/K2023_yleiset_maaraykset_ja\ _ohjeet_FI+tod.docx $(PANDOC_PARAMS) -o - | perl -pe 's/^(#+) /$${1}1. /g' >docs/fi-yleiset_maaraykset_ja_ohjeet.md.tmp
	pandoc -f docx -t markdown _includes/docx/K2023_yleiset_maaraykset_ja\ _ohjeet_FI+tod.docx $(PANDOC_PARAMS) -o - | python3 tools/meb-markdown-filter.py >docs/fi-yleiset_maaraykset_ja_ohjeet.md.tmp
	cat _includes/heading/fi-yleiset_maaraykset_ja_ohjeet.md >docs/fi-yleiset_maaraykset_ja_ohjeet.md
	cat docs/fi-yleiset_maaraykset_ja_ohjeet.md.tmp >>docs/fi-yleiset_maaraykset_ja_ohjeet.md

	pandoc -f docx -t markdown _includes/docx/K2023_yleiset_maaraykset_ja\ _ohjeet_SV+tod.docx $(PANDOC_PARAMS) -o - | python3 tools/meb-markdown-filter.py >docs/sv-yleiset_maaraykset_ja_ohjeet.md.tmp
	cat _includes/heading/sv-yleiset_maaraykset_ja_ohjeet.md >docs/sv-yleiset_maaraykset_ja_ohjeet.md
	cat docs/sv-yleiset_maaraykset_ja_ohjeet.md.tmp >>docs/sv-yleiset_maaraykset_ja_ohjeet.md

	rm docs/*.tmp
