SHELL:= /bin/bash
OCAMLC= ocamlfind ocamlc -package ppx_deriving.std -package sedlex.ppx -package sedlex -package MenhirLib
OCAMLYACC=      $(OCAMLPREFIX)menhir -v
OCAMLLEX=       $(OCAMLPREFIX)ocamllex -ml

%.ml %.mli: %.mly
	$(OCAMLYACC) $*.mly
%.ml: %.mll
	$(OCAMLLEX) $*.mll
%.cmi: %.mli
	$(OCAMLC) $(OCAMLFLAGS) -c $*.mli
%.cmo: %.ml
	$(OCAMLC) $(OCAMLFLAGS) -c $*.ml

ML_DOMAIN_MAIN=	syntax.ml \
		parser.ml \
		lexer.ml \
		calc.ml
CMO_DOMAIN_MAIN=$(ML_DOMAIN_MAIN:%.ml=%.cmo)

calc:	$(CMO_DOMAIN_MAIN)
		$(OCAMLC) -g -linkpkg -o $@ $+

clean:
	rm -rf calc *.o *.cm[oixa] *.annot *~ *.log *.output *.out