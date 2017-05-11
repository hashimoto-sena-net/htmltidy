#OBJ=compat-5.1.o htmltidy.o tdoc.o tnode.o support.o tconst.o
CFLAGS=-I/usr/local/Cellar/lua/5.2.4_4/include -I/usr/local/Cellar/tidy-html5/5.4.0/include -Wall
LUA_LIBDIR=/usr/local/lib/lua/5.2
OBJ=htmltidy.o tdoc.o tnode.o support.o tconst.o

htmltidy.so: $(OBJ)
	$(CC) -L/usr/local/Cellar/lua/5.2.4_4/lib -L/usr/local/Cellar/tidy-html5/5.4.0/lib -ltidy -rdynamic -shared -llua -o htmltidy.so $(OBJ)

install:
	mkdir -p $(LUA_LIBDIR)
	cp htmltidy.so $(LUA_LIBDIR)