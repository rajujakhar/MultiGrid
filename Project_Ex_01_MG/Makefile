CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -Wshadow -Werror  -Winline -O3


TARGET1 = main
TARGET2 = Grid
TARGET3 = MultiGridSolver

OBJS = $(TARGET1).o $(TARGET2).o $(TARGET3).o 
INCL = ./include/$(TARGET3).h
EXEC = mgsolve

$(EXEC): $(OBJS)
	$(CXX) $(CXXFLAGS) ./test/$(TARGET1).o ./src/$(TARGET2).o ./src/$(TARGET3).o -o $(EXEC)  
	

$(TARGET1).o: ./test/$(TARGET1).cpp ./include/$(TARGET3).h
	$(CXX) -c $(CXXFLAGS)  ./test/$(TARGET1).cpp -I ./include/ -o ./test/$(TARGET1).o

	
$(TARGET2).o: ./src/$(TARGET2).cpp ./include/$(TARGET2).h
	$(CXX) -c $(CXXFLAGS)  ./src/$(TARGET2).cpp -I ./include/ -o ./src/$(TARGET2).o 

$(TARGET3).o: ./src/$(TARGET3).cpp ./include/$(TARGET3).h 
	$(CXX) -c $(CXXFLAGS)  ./src/$(TARGET3).cpp -I ./include/ -o ./src/$(TARGET3).o
	


clean:
	@$(RM) -rf ./src/*.o ./test/*.o *.o $(EXEC)

run:
	 ./$(EXEC) 3 2
