CC := gcc
CFLAGS := -Wall -Wextra -Wpedantic -std=c11 -O2
DBGFLAGS := -g -O0

SRC := main.c tp.c
OBJ := $(SRC:.c=.o)
BIN := graphe

.PHONY: all clean run debug

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c tp.h
	$(CC) $(CFLAGS) -c $< -o $@

run: $(BIN)
	./$(BIN)

debug: CFLAGS += $(DBGFLAGS)
debug: clean $(BIN)

clean:
	rm -f $(OBJ) $(BIN)
