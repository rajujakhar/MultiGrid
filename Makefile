CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -Wshadow -Werror  -Winline -O3


TARGET1 = main
TARGET2 = Grid
TARGET3 = MultiGridSolver

OBJS = $(TARGET1).o $(TARGET2).o $(TARGET3).o 
EXEC = mgsolve

$(EXEC): $(OBJS) 
	$(CXX) $(CXXFLAGS)  -o $(EXEC) $(OBJS)

$(TARGET1).o: $(TARGET1).cpp 
	$(CXX) -c $(CXXFLAGS)  $(TARGET1).cpp
	
$(TARGET2).o: $(TARGET2).cpp 
	$(CXX) -c $(CXXFLAGS)  $(TARGET2).cpp
	
$(TARGET3).o: $(TARGET3).cpp 
	$(CXX) -c $(CXXFLAGS)  $(TARGET3).cpp			

clean:
	@$(RM) -rf *.o $(EXEC)

run:
	 ./$(EXEC) 3 2
