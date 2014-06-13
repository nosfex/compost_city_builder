#include <hxcpp.h>

#ifndef INCLUDED_grid_GridData
#include <grid/GridData.h>
#endif
namespace grid{

Void GridData_obj::__construct()
{
HX_STACK_FRAME("grid.GridData","new",0x440edbca,"grid.GridData.new","grid/GridData.hx",14,0xc17a9885)
HX_STACK_THIS(this)
{
}
;
	return null();
}

//GridData_obj::~GridData_obj() { }

Dynamic GridData_obj::__CreateEmpty() { return  new GridData_obj; }
hx::ObjectPtr< GridData_obj > GridData_obj::__new()
{  hx::ObjectPtr< GridData_obj > result = new GridData_obj();
	result->__construct();
	return result;}

Dynamic GridData_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< GridData_obj > result = new GridData_obj();
	result->__construct();
	return result;}


GridData_obj::GridData_obj()
{
}

Dynamic GridData_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 12:
		if (HX_FIELD_EQ(inName,"productionCD") ) { return productionCD; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic GridData_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 12:
		if (HX_FIELD_EQ(inName,"productionCD") ) { productionCD=inValue.Cast< Float >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void GridData_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("productionCD"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

#if HXCPP_SCRIPTABLE
static hx::StorageInfo sMemberStorageInfo[] = {
	{hx::fsFloat,(int)offsetof(GridData_obj,productionCD),HX_CSTRING("productionCD")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static ::String sMemberFields[] = {
	HX_CSTRING("productionCD"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(GridData_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(GridData_obj::__mClass,"__mClass");
};

#endif

Class GridData_obj::__mClass;

void GridData_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("grid.GridData"), hx::TCanCast< GridData_obj> ,sStaticFields,sMemberFields,
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

void GridData_obj::__boot()
{
}

} // end namespace grid
