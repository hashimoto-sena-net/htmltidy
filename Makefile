#OBJ=compat-5.1.o htmltidy.o tdoc.o tnode.o support.o tconst.o
OBJ=htmltidy.o tdoc.o tnode.o support.o tconst.o
CFLAGS=-I/usr/local/Cellar/lua/5.2.4_4/include -I/usr/local/Cellar/tidy-html5/5.4.0/include -Wall

all: htmltidy.so

clean:
	rm *.o
	rm *.so

htmltidy.so: $(OBJ)
	#$(CC) -L/Users/m-hashimoto/Downloads/lua-5.1/src -rdynamic -shared -ltidy -llua -W1,-soname,htmltidy.so.1 -o htmltidy.so $(OBJ)
	$(CC) -L/usr/local/Cellar/lua/5.2.4_4/lib -L/usr/local/Cellar/tidy-html5/5.4.0/lib -ltidy -rdynamic -shared -llua -o htmltidy.so $(OBJ)

