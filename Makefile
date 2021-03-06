CFLAGS=-I/usr/local/include/lua5.2 -I/usr/local/include -Wall
LUA_LIBDIR=/usr/local/lib/lua/5.2
OBJ=htmltidy.o tdoc.o tnode.o support.o tconst.o

htmltidy.so: $(OBJ)
	$(CC) -L/usr/local/Cellar/lua/5.2.4_4/lib -L/usr/local/lib -ltidy -rdynamic -shared -llua -o htmltidy.so $(OBJ)

install:
	mkdir -p $(LUA_LIBDIR)
	cp htmltidy.so $(LUA_LIBDIR)

clean:
	rm *.o
	rm *.so
