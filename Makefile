CC = gcc
CFLAGS = -std=c17 -Wall
ADDITIONAL_FLAGS = -Ilib/mpc
SRC_V1 = src/main.c lib/mpc/mpc.c

external:
	$(CC) $(CFLAGS) $(ADDITIONAL_FLAGS) -o bin/sneed_external $(SRC_V1)