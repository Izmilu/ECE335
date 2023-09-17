all: Homework1
 
$.o: %.c %.h
	$(CXX) $(CXXFLAGS) -c $^

Homework1: show_bytes.c
	$(CXX) $(CXXFLAGS) -o $@ $^

clean:
	rm *.o Homework1


