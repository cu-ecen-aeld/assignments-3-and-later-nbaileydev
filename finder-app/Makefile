CROSS_COMPILE=
CC=$(CROSS_COMPILE)gcc
CXXFLAGS+= -Wall -Wextra -Wpedantic -std=c17
.PHONY: all clean

all: writer

clean:
	rm -f writer *.o

%.o: %.c
	$(CC) -c $(CXXFLAGS) $< -o $@

%: %.o
	$(CC) -c $(LDFLAGS) $< -o $@
