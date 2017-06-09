CC = gcc 
CFLAGS =-I thirdparty -I src -c -Wall -Werror
EXECUTABLE = file 
SOURCES = main.c func.c 
DIR = build/src
DAR = src
DUR = bin/func

EXECUTABLE_TEST = test
SOURCES_TEST = calc_test.c main.c validation_test.c
DIT = build/test
DAT = test
DUT = bin/test

all: Prog Testpr
Prog: $(DUR)/$(EXECUTABLE)
$(DIR)/main.o: $(DAR)/main.c 
	@if [ ! -d $(DIR) ] ; then echo "creating $(DIR)" ; mkdir build ; mkdir build/src; fi
	$(CC) $(CFLAGS) -c $(DAR)/main.c -o $(DIR)/main.o 

$(DIR)/func.o: $(DAR)/func.c
	@if [ ! -d $(DIR) ] ; then echo "creating $(DIR)" ; mkdir build ; mkdir build/src; fi
	$(CC) $(CFLAGS) -c $(DAR)/func.c -o $(DIR)/func.o 

$(DUR)/$(EXECUTABLE): $(DIR)/main.o $(DIR)/func.o
	@if [ ! -d $(DUR) ] ; then echo "creating $(DUR)" ; mkdir bin ; mkdir bin/func; fi
	$(CC) $(DIR)/main.o $(DIR)/func.o -o $(DUR)/$(EXECUTABLE) -lm

Testpr: $(DUT)/$(EXECUTABLE_TEST)
$(DIT)/main.o: $(DAT)/main.c 
	@if [ ! -d $(DIT) ] ; then echo "creating $(DIT)" ; mkdir build; mkdir build/test; fi
	$(CC) $(CFLAGS) -c $(DAT)/main.c -o $(DIT)/main.o 

$(DIT)/calc_test.o: $(DAT)/calc_test.c
	@if [ ! -d $(DIT) ] ; then echo "creating $(DIT)" ; mkdir build; mkdir build/test; fi
	$(CC) $(CFLAGS) -c $(DAT)/calc_test.c -o $(DIT)/calc_test.o 

$(DIT)/validation_test.o: $(DAT)/validation_test.c
	@if [ ! -d $(DIT) ] ; then echo "creating $(DIT)" ; mkdir build; mkdir build/test; fi
	$(CC) $(CFLAGS) -c $(DAT)/validation_test.c -o $(DIT)/validation_test.o

$(DUT)/$(EXECUTABLE_TEST): $(DIT)/main.o $(DIT)/calc_test.o $(DIT)/validation_test.o $(DIR)/func.o
	@if [ ! -d $(DUT) ] ; then echo "creating $(DUT)" ; mkdir bin; mkdir bin/test; fi
	$(CC) $(DIT)/main.o $(DIT)/calc_test.o $(DIT)/validation_test.o $(DIR)/func.o -o $(DUT)/$(EXECUTABLE_TEST) -lm

.PHONY : clean
clean:
	rm -rf build/src/*.o build/test/*.o bin/func/* bin/test/*