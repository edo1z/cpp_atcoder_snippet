CPPFLAGS += -I$(CPPUTEST_HOME)/include -I src/headers
LDFLAGS = -L$(CPPUTEST_HOME)/lib -lCppUTest -lCppUTestExt

bin/test: bin/test.o bin/number.o
	clang++ -o $@ $(CPPFLAGS) $(LDFLAGS) $^ 

bin/test.o: test/test.cpp  
	clang++ -c -o $@ $(CPPFLAGS) $^

bin/number.o: src/number.cpp
	clang++ -c -o $@ $^ 

t:
	bin/test

clean:
	rm -rf bin
	mkdir bin

