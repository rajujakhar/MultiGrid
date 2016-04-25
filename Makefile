CXX = g++
CXXFLAGS = -std=c++0x -Wall -Wextra -Wshadow -Werror # -Winline -O3 -DNDEBUG


TARGET1 = main
TARGET2 = gridUtil
OBJS = $(TARGET1).o $(TARGET2).o 
EXEC = mgsolve

$(EXEC): $(OBJS) 
	$(CXX) $(CXXFLAGS)  -o $(EXEC) $(OBJS)

$(TARGET1).o: $(TARGET1).cpp 
	$(CXX) -c $(CXXFLAGS)  $(TARGET1).cpp
	
$(TARGET2).o: $(TARGET2).cpp 
	$(CXX) -c $(CXXFLAGS)  $(TARGET2).cpp	

clean:
	@$(RM) -rf *.o $(EXEC)

run:
	 ./$(EXEC)	
