OUTPUT = main
CXX = g++ -std=c++11 
SFML = -lsfml-graphics -lsfml-window -lsfml-system
OPENGL = -lGL
INCLUDE = ./include
OBJS = main.o imgui.o imgui_draw.o imgui-SFML.o imgui_tables.o imgui_widgets.o imgui_demo.o
ALLFLAGS = $(SFML) $(OPENGL) 

all: $(OBJS)
	$(CXX) -o $(OUTPUT) -I $(INCLUDE) $(OBJS) $(ALLFLAGS)  

main.o: main.cpp
	$(CXX) -c $(ALLFLAGS) main.cpp -o main.o

imgui.o: ./include/imgui.cpp
	$(CXX) -c $(INCLUDE)/imgui.cpp -o imgui.o
	
imgui_draw.o: $(INCLUDE)/imgui_draw.cpp 
	$(CXX) -c $(INCLUDE)/imgui_draw.cpp -o imgui_draw.o

imgui-SFML.o: $(INCLUDE)/imgui-SFML.cpp 
	$(CXX) -c $(INCLUDE)/imgui-SFML.cpp -o imgui-SFML.o

imgui_tables.o: $(INCLUDE)/imgui_tables.cpp
	$(CXX) -c $(INCLUDE)/imgui_tables.cpp -o imgui_tables.o

imgui_widgets.o: $(INCLUDE)/imgui_widgets.cpp
	$(CXX) -c $(INCLUDE)/imgui_widgets.cpp -o imgui_widgets.o

imgui_demo.o: $(INCLUDE)/imgui_demo.cpp
	$(CXX) -c $(INCLUDE)/imgui_demo.cpp -o imgui_demo.o



run:
	./main

clean:
	rm -rf ./*.o