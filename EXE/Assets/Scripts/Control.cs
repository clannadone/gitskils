using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LuaInterface;

public class Control : MonoBehaviour
{
    LuaState lua = null;
    LuaFunction luaFunc = null;
    public GameObject shell;
    // Use this for initialization
    void Start()
    {
        new LuaResLoader();
        lua = new LuaState();//初始化lua 虚拟机
        lua.Start();//lua虚拟机开启
        LuaBinder.Bind(lua);//注册Wrap类
        string luaPath = Application.dataPath + "/Scripts/Lua";
        lua.AddSearchPath(luaPath);
        lua.DoFile("Control.lua");
        CallFunc("Control.Start", this.gameObject);

    }

    // Update is called once per frame
    void Update()
    {
        CallFunc("Control.Update", gameObject);
    }

    void CallFunc(string func, GameObject obj)
    {
        luaFunc = lua.GetFunction(func);//获取到lua方法
        luaFunc.Call(obj);//调用lua方法
        luaFunc.Dispose();//这两步清空缓存
        luaFunc = null;
    }
}

