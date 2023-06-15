CC = gcc
CFLAGS = -Wall -Wextra -std=c99

SRCS = cordic_main.c cordic_TB.c cordic_V_fixed_point.c
OBJS = $(SRCS:.c=.o)

all: cordic

cordic: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) cordic