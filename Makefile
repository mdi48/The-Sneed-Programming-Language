CC = gcc
CFLAGS = -std=c17 -Wall
ADDITIONAL_FLAGS = -Ilib/mpc
SRC_V1 = src/main.c lib/mpc/mpc.c
OUTPUT_V1 = bin/sneed_external
LDFLAGS = -lreadline

external:
	$(CC) $(CFLAGS) $(ADDITIONAL_FLAGS) $(SRC_V1) -o $(OUTPUT_V1) $(LDFLAGS)