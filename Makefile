COSMO?=$(HOME)/.cosmo
CC=$(COSMO)/bin/cosmocc
AR=$(COSMO)/bin/cosmoar
CFLAGS=-I$(PWD)/fakeinclude -I$(PWD)/src

C_SRC := $(wildcard src/*.c)
M_SRC := $(wildcard src/*.m)
SRCS := $(C_SRC) $(M_SRC)
OBJ := $(C_SRC:.c=.o) $(M_SRC:.m=.o)

libobjc.a: $(OBJ)
	$(AR) rcs $@ $^

%.o: %.c
	@echo $(CC) -c $< -o $@
	@$(CC) -c $< -o $@ $(CFLAGS)

%.o: %.m
	@echo $(CC) -c $< -o $@
	@$(CC) -c $< -o $@ $(CFLAGS)