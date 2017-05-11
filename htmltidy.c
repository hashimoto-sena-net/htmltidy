/* HTML Tidy Lua 5.0 Bindings
   Copyright (c) 2006 Promixis, LLC
   Author: Ron Bessems
   Date: Oct 26, 2006

   Licensed under MIT License.
*/

// return values according to HTMLTidy.
// 0 = ok
// 1 = warning
// 2 = error
// < 0 = severe error

#include "htmltidy.h"

// create a new html tidy object.
int lua_tidy_new ( lua_State *L )
{
  //printf("---lua_tidy_new\n");

  pTidy t = (pTidy)lua_newuserdata(L, sizeof(sTidy));
  t->tdoc = tidyCreate();
  t->nodeList = NULL;
  tidyBufInit(&t->errbuf);
  tidySetErrorBuffer( t->tdoc, &t->errbuf );
  luaL_getmetatable(L, LUATIDY_HANDLE);
  lua_setmetatable(L,-2);

	return 1;
}

static const struct luaL_Reg luatidy_funcs[] =
{
  {"new", lua_tidy_new},
  {NULL, NULL},
};

LUATIDY_API int luaopen_htmltidy (lua_State *L)
{
  //printf("---luaopen_htmltidy\n");

  createDocMetaTable(L);
  createNodeMetaTable(L);

  luaL_newlib(L, luatidy_funcs);

  export_tidy_options(L);
  export_tidy_nodeType(L);
  export_tidy_info(L);

	return 1;
}

LUATIDY_API int luaopen_luatidy (lua_State *L)
{
  //printf("---luaopen_htmltidy\n");

  createDocMetaTable(L);
  createNodeMetaTable(L);

  luaL_newlib(L, luatidy_funcs);

  export_tidy_options(L);
  export_tidy_nodeType(L);
  export_tidy_info(L);

  return 1;
}
