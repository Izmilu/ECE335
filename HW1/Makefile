all: Hex_Converter

$.o: %.c %.h
	$(CXX) $(CXXFLAGS) -c $^

Hex_Converter: show_bytes.c
	$(CXX) $(CXXFLAGS) -o $@ $^

clean:
	rm *.o Hex_Converter


