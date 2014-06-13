#include <hxcpp.h>

#ifndef INCLUDED_flixel_FlxBasic
#include <flixel/FlxBasic.h>
#endif
#ifndef INCLUDED_flixel_FlxObject
#include <flixel/FlxObject.h>
#endif
#ifndef INCLUDED_flixel_FlxSprite
#include <flixel/FlxSprite.h>
#endif
#ifndef INCLUDED_flixel_interfaces_IFlxDestroyable
#include <flixel/interfaces/IFlxDestroyable.h>
#endif
#ifndef INCLUDED_grid_BaseGrid
#include <grid/BaseGrid.h>
#endif
#ifndef INCLUDED_grid_GridData
#include <grid/GridData.h>
#endif
namespace grid{

Void BaseGrid_obj::__construct(hx::Null< Float >  __o_X,hx::Null< Float >  __o_Y,Dynamic SimpleGraphic)
{
HX_STACK_FRAME("grid.BaseGrid","new",0x8531aeb1,"grid.BaseGrid.new","grid/BaseGrid.hx",14,0xe435df7e)
HX_STACK_THIS(this)
HX_STACK_ARG(__o_X,"X")
HX_STACK_ARG(__o_Y,"Y")
HX_STACK_ARG(SimpleGraphic,"SimpleGraphic")
Float X = __o_X.Default(0);
Float Y = __o_Y.Default(0);
{
	HX_STACK_LINE(15)
	super::__construct(X,Y,SimpleGraphic);
	HX_STACK_LINE(16)
	this->makeGraphic((int)96,(int)96,(int)1426128784,null(),null());
}
;
	return null();
}

//BaseGrid_obj::~BaseGrid_obj() { }

Dynamic BaseGrid_obj::__CreateEmpty() { return  new BaseGrid_obj; }
hx::ObjectPtr< BaseGrid_obj > BaseGrid_obj::__new(hx::Null< Float >  __o_X,hx::Null< Float >  __o_Y,Dynamic SimpleGraphic)
{  hx::ObjectPtr< BaseGrid_obj > result = new BaseGrid_obj();
	result->__construct(__o_X,__o_Y,SimpleGraphic);
	return result;}

Dynamic BaseGrid_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< BaseGrid_obj > result = new BaseGrid_obj();
	result->__construct(inArgs[0],inArgs[1],inArgs[2]);
	return result;}

Void BaseGrid_obj::setData( ::grid::GridData value){
{
		HX_STACK_FRAME("grid.BaseGrid","setData",0x578171bd,"grid.BaseGrid.setData","grid/BaseGrid.hx",21,0xe435df7e)
		HX_STACK_THIS(this)
		HX_STACK_ARG(value,"value")
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC1(BaseGrid_obj,setData,(void))

Void BaseGrid_obj::update( ){
{
		HX_STACK_FRAME("grid.BaseGrid","update",0x9d30b058,"grid.BaseGrid.update","grid/BaseGrid.hx",27,0xe435df7e)
		HX_STACK_THIS(this)
		HX_STACK_LINE(27)
		this->super::update();
	}
return null();
}


Void BaseGrid_obj::destroy( ){
{
		HX_STACK_FRAME("grid.BaseGrid","destroy",0x742007cb,"grid.BaseGrid.destroy","grid/BaseGrid.hx",32,0xe435df7e)
		HX_STACK_THIS(this)
		HX_STACK_LINE(32)
		this->super::destroy();
	}
return null();
}



BaseGrid_obj::BaseGrid_obj()
{
}

Dynamic BaseGrid_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"update") ) { return update_dyn(); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"setData") ) { return setData_dyn(); }
		if (HX_FIELD_EQ(inName,"destroy") ) { return destroy_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic BaseGrid_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	return super::__SetField(inName,inValue,inCallProp);
}

void BaseGrid_obj::__GetFields(Array< ::String> &outFields)
{
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

#if HXCPP_SCRIPTABLE
static hx::StorageInfo *sMemberStorageInfo = 0;
#endif

static ::String sMemberFields[] = {
	HX_CSTRING("setData"),
	HX_CSTRING("update"),
	HX_CSTRING("destroy"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(BaseGrid_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(BaseGrid_obj::__mClass,"__mClass");
};

#endif

Class BaseGrid_obj::__mClass;

void BaseGrid_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("grid.BaseGrid"), hx::TCanCast< BaseGrid_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics
#ifdef HXCPP_VISIT_ALLOCS
    , sVisitStatics
#endif
#ifdef HXCPP_SCRIPTABLE
    , sMemberStorageInfo
#endif
);
}

void BaseGrid_obj::__boot()
{
}

} // end namespace grid
