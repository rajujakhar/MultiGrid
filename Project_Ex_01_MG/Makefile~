CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -Wshadow -Werror  -Winline -O3

TARGET1 = main
TARGET2 = Grid
TARGET3 = MultiGridSolver
TARGET4 = GridUtil
TARGET5 = TwoDimArr
TARGET6 = Stencil

OBJS =  $(TARGET1).o $(TARGET2).o $(TARGET3).o $(TARGET4).o $(TARGET5).o $(TARGET6).o
EXEC = mgsolve

$(EXEC): $(OBJS)
	$(CXX) $(CXXFLAGS) ./test/$(TARGET1).o ./src/$(TARGET2).o ./src/$(TARGET3).o ./src/$(TARGET4).o ./src/$(TARGET5).o ./src/$(TARGET6).o -o $(EXEC)  

$(TARGET1).o: ./test/$(TARGET1).cpp
	$(CXX) -c $(CXXFLAGS)  ./test/$(TARGET1).cpp -I ./include/ -o ./test/$(TARGET1).o
	
$(TARGET2).o: ./src/$(TARGET2).cpp
	$(CXX) -c $(CXXFLAGS)  ./src/$(TARGET2).cpp -I ./include/ -o ./src/$(TARGET2).o 

$(TARGET3).o: ./src/$(TARGET3).cpp
	$(CXX) -c $(CXXFLAGS)  ./src/$(TARGET3).cpp -I ./include/ -o ./src/$(TARGET3).o

$(TARGET4).o: ./src/$(TARGET4).cpp
	$(CXX) -c $(CXXFLAGS)  ./src/$(TARGET4).cpp -I ./include/ -o ./src/$(TARGET4).o

$(TARGET5).o: ./src/$(TARGET5).cpp
	$(CXX) -c $(CXXFLAGS)  ./src/$(TARGET5).cpp -I ./include/ -o ./src/$(TARGET5).o	
	
$(TARGET6).o: ./src/$(TARGET6).cpp
	$(CXX) -c $(CXXFLAGS)  ./src/$(TARGET6).cpp -I ./include/ -o ./src/$(TARGET6).o				
	
clean:
	@$(RM) -rf ./src/*.o ./test/*.o *.o *.txt $(EXEC) 

run:
	 ./$(EXEC) 3 1
