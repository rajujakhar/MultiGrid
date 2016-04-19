CXX = g++
CXXFLAGS = -std=c++0x -Wall -Wextra -Wshadow -Werror -O3 -DNDEBUG


TARGET = main
OBJS = $(TARGET).o
EXEC = mgsolve

all: $(TARGET)

$(TARGET): $(OBJS) 
	$(CXX) $(CXXFLAGS) -o $(EXEC) $(OBJS) 

$(TARGET).o: $(TARGET).cpp 
	$(CXX) -c $(CXXFLAGS)  $(TARGET).cpp

clean:
	@$(RM) -rf *.o $(EXEC)

run:
	 ./$(EXEC)	