OUTDIR := html
DATADIR := ~/.config/notes
MD := $(shell ls *.md)
HTML := $(MD:%.md=$(OUTDIR)/%.html)
STATIC_FILES := html/notes.css

all: $(OUTDIR) $(HTML) $(STATIC_FILES)

$(OUTDIR)/list.json: $(MD) $(OUTDIR)
	(basename $(shell pwd); ls $(MD)) | jq -Rs '(split("\n") - [""]) | {title:.[0], files: .[1:] | map({title: rtrimstr(".md"), name: (rtrimstr(".md") + ".html")})}' > $(OUTDIR)/list.json

$(OUTDIR)/%.html: %.md $(OUTDIR)/list.json
	@echo " - Building $@"
	tmpl -data $(OUTDIR)/list.json -template $(DATADIR)/header.tmpl -output $@
	mad $< | cmark --unsafe >> $@
	cat $(DATADIR)/footer.tmpl >> $@
	@echo ""

$(OUTDIR):
	mkdir -p $(OUTDIR)
$(DATADIR):
	mkdir -p $(DATADIR)

$(OUTDIR)/%: $(DATADIR)/%
	cp $< $@

clean:
	rm -rf $(OUTDIR)
