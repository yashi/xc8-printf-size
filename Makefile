# Design Parameter
DEVICE := pic18lf8723
CLIB := -mc90lib
OPTIMIZE := -Os
WARNING := -w
OUTDIR := outdir

# Command variables
CC     := xc8-cc -mcpu=$(DEVICE) $(WARNING) $(CLIB) $(OPTIMIZE)

MODULES := int uint uintx uinto str char pointer float double
SRC := $(MODULES:=.c)

all: version $(MODULES)

%: src/%.c
	@mkdir -p $(OUTDIR)/
	$(CC) -o $(OUTDIR)/$@ $^

.PHONY: version
version:
	@echo "Executed on" $(shell date -u) "using:"
	@$(CC) --version
	@echo


.PHONY: clean
clean:
	$(RM) -r $(OUTDIR)
