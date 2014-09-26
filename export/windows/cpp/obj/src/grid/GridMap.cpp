#include <hxcpp.h>

#ifndef INCLUDED_flixel_FlxBasic
#include <flixel/FlxBasic.h>
#endif
#ifndef INCLUDED_flixel_FlxG
#include <flixel/FlxG.h>
#endif
#ifndef INCLUDED_flixel_FlxObject
#include <flixel/FlxObject.h>
#endif
#ifndef INCLUDED_flixel_FlxSprite
#include <flixel/FlxSprite.h>
#endif
#ifndef INCLUDED_flixel_group_FlxGroup
#include <flixel/group/FlxGroup.h>
#endif
#ifndef INCLUDED_flixel_group_FlxTypedGroup
#include <flixel/group/FlxTypedGroup.h>
#endif
#ifndef INCLUDED_flixel_interfaces_IFlxDestroyable
#include <flixel/interfaces/IFlxDestroyable.h>
#endif
#ifndef INCLUDED_flixel_interfaces_IFlxPooled
#include <flixel/interfaces/IFlxPooled.h>
#endif
#ifndef INCLUDED_flixel_util_FlxPoint
#include <flixel/util/FlxPoint.h>
#endif
#ifndef INCLUDED_grid_BaseGrid
#include <grid/BaseGrid.h>
#endif
#ifndef INCLUDED_grid_GridMap
#include <grid/GridMap.h>
#endif
#ifndef INCLUDED_haxe_Log
#include <haxe/Log.h>
#endif
#ifndef INCLUDED_hxMath
#include <hxMath.h>
#endif
namespace grid{

Void GridMap_obj::__construct()
{
HX_STACK_FRAME("grid.GridMap","new",0x86dcb1a0,"grid.GridMap.new","grid/GridMap.hx",17,0x7bbbcd11)
HX_STACK_THIS(this)
{
	HX_STACK_LINE(22)
	this->_posCorrection = null();
	HX_STACK_LINE(21)
	this->_initPos = null();
	HX_STACK_LINE(20)
	this->_grids = null();
	HX_STACK_LINE(25)
	super::__construct(null());
}
;
	return null();
}

//GridMap_obj::~GridMap_obj() { }

Dynamic GridMap_obj::__CreateEmpty() { return  new GridMap_obj; }
hx::ObjectPtr< GridMap_obj > GridMap_obj::__new()
{  hx::ObjectPtr< GridMap_obj > result = new GridMap_obj();
	result->__construct();
	return result;}

Dynamic GridMap_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< GridMap_obj > result = new GridMap_obj();
	result->__construct();
	return result;}

Void GridMap_obj::update( ){
{
		HX_STACK_FRAME("grid.GridMap","update",0xa8ccecc9,"grid.GridMap.update","grid/GridMap.hx",32,0x7bbbcd11)
		HX_STACK_THIS(this)
		HX_STACK_LINE(32)
		this->super::update();
	}
return null();
}


Void GridMap_obj::destroy( ){
{
		HX_STACK_FRAME("grid.GridMap","destroy",0x9138ae3a,"grid.GridMap.destroy","grid/GridMap.hx",37,0x7bbbcd11)
		HX_STACK_THIS(this)
		HX_STACK_LINE(37)
		this->super::destroy();
	}
return null();
}


Void GridMap_obj::initMap( int gridCount){
{
		HX_STACK_FRAME("grid.GridMap","initMap",0x383c52ac,"grid.GridMap.initMap","grid/GridMap.hx",41,0x7bbbcd11)
		HX_STACK_THIS(this)
		HX_STACK_ARG(gridCount,"gridCount")
		HX_STACK_LINE(42)
		if (((this->_grids == null()))){
			HX_STACK_LINE(44)
			Array< ::Dynamic > _g = Array_obj< ::Dynamic >::__new();		HX_STACK_VAR(_g,"_g");
			HX_STACK_LINE(44)
			this->_grids = _g;
		}
		HX_STACK_LINE(48)
		Float maxGrids = ::Math_obj::sqrt(gridCount);		HX_STACK_VAR(maxGrids,"maxGrids");
		HX_STACK_LINE(49)
		int col = (int)0;		HX_STACK_VAR(col,"col");
		HX_STACK_LINE(50)
		int row = (int)0;		HX_STACK_VAR(row,"row");
		HX_STACK_LINE(52)
		while((true)){
			HX_STACK_LINE(52)
			if ((!(((row < maxGrids))))){
				HX_STACK_LINE(52)
				break;
			}
			HX_STACK_LINE(54)
			::grid::BaseGrid g = ::grid::BaseGrid_obj::__new(((int)32 + (col * 120.)),((int)32 + (row * 120.)),null());		HX_STACK_VAR(g,"g");
			HX_STACK_LINE(55)
			this->_grids->push(g);
			HX_STACK_LINE(56)
			g->set_visible(false);
			HX_STACK_LINE(57)
			(col)++;
			HX_STACK_LINE(58)
			if (((col >= maxGrids))){
				HX_STACK_LINE(60)
				col = (int)0;
				HX_STACK_LINE(61)
				(row)++;
			}
			HX_STACK_LINE(64)
			this->add(g);
		}
		HX_STACK_LINE(66)
		::flixel::util::FlxPoint _g1 = ::flixel::util::FlxPoint_obj::__new(this->_grids->__get((int)0).StaticCast< ::grid::BaseGrid >()->x,this->_grids->__get((int)0).StaticCast< ::grid::BaseGrid >()->y);		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(66)
		this->_initPos = _g1;
		HX_STACK_LINE(67)
		this->scaleToGrowth();
		HX_STACK_LINE(68)
		this->unlockAreas();
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC1(GridMap_obj,initMap,(void))

Void GridMap_obj::scaleToGrowth( ){
{
		HX_STACK_FRAME("grid.GridMap","scaleToGrowth",0xc0f06a0c,"grid.GridMap.scaleToGrowth","grid/GridMap.hx",72,0x7bbbcd11)
		HX_STACK_THIS(this)
		HX_STACK_LINE(73)
		Float maxGrids = ::Math_obj::sqrt(this->_grids->length);		HX_STACK_VAR(maxGrids,"maxGrids");
		HX_STACK_LINE(74)
		Float gridsTotalSize = (120. * maxGrids);		HX_STACK_VAR(gridsTotalSize,"gridsTotalSize");
		HX_STACK_LINE(76)
		Float maxHeightScale = (::flixel::FlxG_obj::height * .85);		HX_STACK_VAR(maxHeightScale,"maxHeightScale");
		HX_STACK_LINE(77)
		::haxe::Log_obj::trace(this->_grids->length,hx::SourceInfo(HX_CSTRING("GridMap.hx"),77,HX_CSTRING("grid.GridMap"),HX_CSTRING("scaleToGrowth")));
		HX_STACK_LINE(78)
		Float newScale = (Float(maxHeightScale) / Float(gridsTotalSize));		HX_STACK_VAR(newScale,"newScale");
		HX_STACK_LINE(79)
		if (((gridsTotalSize >= maxHeightScale))){
			HX_STACK_LINE(83)
			{
				HX_STACK_LINE(83)
				int _g1 = (int)0;		HX_STACK_VAR(_g1,"_g1");
				HX_STACK_LINE(83)
				int _g = this->_grids->length;		HX_STACK_VAR(_g,"_g");
				HX_STACK_LINE(83)
				while((true)){
					HX_STACK_LINE(83)
					if ((!(((_g1 < _g))))){
						HX_STACK_LINE(83)
						break;
					}
					HX_STACK_LINE(83)
					int i = (_g1)++;		HX_STACK_VAR(i,"i");
					HX_STACK_LINE(85)
					Float _g2 = this->_grids->__get(i).StaticCast< ::grid::BaseGrid >()->get_width();		HX_STACK_VAR(_g2,"_g2");
					HX_STACK_LINE(85)
					Float _g11 = (_g2 * this->_grids->__get(i).StaticCast< ::grid::BaseGrid >()->scale->x);		HX_STACK_VAR(_g11,"_g11");
					HX_STACK_LINE(85)
					Float _g21 = (_g11 * 1.25);		HX_STACK_VAR(_g21,"_g21");
					HX_STACK_LINE(85)
					Float oldWidth = (((int)32 * this->_grids->__get(i).StaticCast< ::grid::BaseGrid >()->scale->x) + _g21);		HX_STACK_VAR(oldWidth,"oldWidth");
					HX_STACK_LINE(86)
					Float _g3 = this->_grids->__get(i).StaticCast< ::grid::BaseGrid >()->get_width();		HX_STACK_VAR(_g3,"_g3");
					HX_STACK_LINE(86)
					Float _g4 = (_g3 * newScale);		HX_STACK_VAR(_g4,"_g4");
					HX_STACK_LINE(86)
					Float _g5 = (_g4 * 1.25);		HX_STACK_VAR(_g5,"_g5");
					HX_STACK_LINE(86)
					Float newWidth = (((int)32 * newScale) + _g5);		HX_STACK_VAR(newWidth,"newWidth");
					HX_STACK_LINE(88)
					{
						HX_STACK_LINE(88)
						::grid::BaseGrid _g22 = this->_grids->__get(i).StaticCast< ::grid::BaseGrid >();		HX_STACK_VAR(_g22,"_g22");
						HX_STACK_LINE(88)
						_g22->set_x((Float(_g22->x) / Float(oldWidth)));
					}
					HX_STACK_LINE(89)
					{
						HX_STACK_LINE(89)
						::grid::BaseGrid _g22 = this->_grids->__get(i).StaticCast< ::grid::BaseGrid >();		HX_STACK_VAR(_g22,"_g22");
						HX_STACK_LINE(89)
						_g22->set_x((_g22->x * newWidth));
					}
					HX_STACK_LINE(90)
					Float _g6 = this->_grids->__get(i).StaticCast< ::grid::BaseGrid >()->get_height();		HX_STACK_VAR(_g6,"_g6");
					HX_STACK_LINE(90)
					Float _g7 = (_g6 * this->_grids->__get(i).StaticCast< ::grid::BaseGrid >()->scale->y);		HX_STACK_VAR(_g7,"_g7");
					HX_STACK_LINE(90)
					Float _g8 = (_g7 * 1.25);		HX_STACK_VAR(_g8,"_g8");
					HX_STACK_LINE(90)
					Float oldHeight = (((int)32 * this->_grids->__get(i).StaticCast< ::grid::BaseGrid >()->scale->y) + _g8);		HX_STACK_VAR(oldHeight,"oldHeight");
					HX_STACK_LINE(91)
					Float _g9 = this->_grids->__get(i).StaticCast< ::grid::BaseGrid >()->get_height();		HX_STACK_VAR(_g9,"_g9");
					HX_STACK_LINE(91)
					Float _g10 = (_g9 * newScale);		HX_STACK_VAR(_g10,"_g10");
					HX_STACK_LINE(91)
					Float _g111 = (_g10 * 1.25);		HX_STACK_VAR(_g111,"_g111");
					HX_STACK_LINE(91)
					Float newHeight = (((int)32 * newScale) + _g111);		HX_STACK_VAR(newHeight,"newHeight");
					HX_STACK_LINE(92)
					{
						HX_STACK_LINE(92)
						::grid::BaseGrid _g22 = this->_grids->__get(i).StaticCast< ::grid::BaseGrid >();		HX_STACK_VAR(_g22,"_g22");
						HX_STACK_LINE(92)
						_g22->set_y((Float(_g22->y) / Float(oldHeight)));
					}
					HX_STACK_LINE(93)
					{
						HX_STACK_LINE(93)
						::grid::BaseGrid _g22 = this->_grids->__get(i).StaticCast< ::grid::BaseGrid >();		HX_STACK_VAR(_g22,"_g22");
						HX_STACK_LINE(93)
						_g22->set_y((_g22->y * newHeight));
					}
					HX_STACK_LINE(95)
					::flixel::util::FlxPoint _g12 = ::flixel::util::FlxPoint_obj::__new(null(),null());		HX_STACK_VAR(_g12,"_g12");
					HX_STACK_LINE(95)
					this->_grids->__get(i).StaticCast< ::grid::BaseGrid >()->__FieldRef(HX_CSTRING("origin")) = _g12;
				}
			}
			HX_STACK_LINE(98)
			::flixel::util::FlxPoint _g13 = ::flixel::util::FlxPoint_obj::__new(newScale,newScale);		HX_STACK_VAR(_g13,"_g13");
			HX_STACK_LINE(98)
			this->setAll(HX_CSTRING("scale"),_g13,true);
		}
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(GridMap_obj,scaleToGrowth,(void))

Void GridMap_obj::unlockAreas( ){
{
		HX_STACK_FRAME("grid.GridMap","unlockAreas",0x1e39f822,"grid.GridMap.unlockAreas","grid/GridMap.hx",104,0x7bbbcd11)
		HX_STACK_THIS(this)
		HX_STACK_LINE(106)
		int maxGrids = ::Math_obj::sqrt(this->_grids->length);		HX_STACK_VAR(maxGrids,"maxGrids");
		HX_STACK_LINE(108)
		Float clusterCount = ((int)1 + hx::Mod(maxGrids,(int)5));		HX_STACK_VAR(clusterCount,"clusterCount");
		HX_STACK_LINE(110)
		int halfSize = ::Math_obj::floor(this->_grids->length);		HX_STACK_VAR(halfSize,"halfSize");
		HX_STACK_LINE(111)
		while((true)){
			HX_STACK_LINE(111)
			if ((!(((clusterCount != (int)0))))){
				HX_STACK_LINE(111)
				break;
			}
			HX_STACK_LINE(115)
			if ((!(this->_grids->__get(halfSize).StaticCast< ::grid::BaseGrid >()->visible))){
				HX_STACK_LINE(117)
				this->_grids->__get(halfSize).StaticCast< ::grid::BaseGrid >()->set_visible(true);
				HX_STACK_LINE(118)
				this->_grids->__get((halfSize + (int)1)).StaticCast< ::grid::BaseGrid >()->set_visible(true);
				HX_STACK_LINE(120)
				this->_grids->__get((halfSize + maxGrids)).StaticCast< ::grid::BaseGrid >()->set_visible(true);
				HX_STACK_LINE(121)
				this->_grids->__get(((halfSize + maxGrids) + (int)1)).StaticCast< ::grid::BaseGrid >()->set_visible(true);
			}
			HX_STACK_LINE(124)
			(clusterCount)--;
		}
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(GridMap_obj,unlockAreas,(void))

Void GridMap_obj::addGrids( Float colrowToAdd){
{
		HX_STACK_FRAME("grid.GridMap","addGrids",0xc2cbd3cc,"grid.GridMap.addGrids","grid/GridMap.hx",129,0x7bbbcd11)
		HX_STACK_THIS(this)
		HX_STACK_ARG(colrowToAdd,"colrowToAdd")
		HX_STACK_LINE(130)
		Float initGrids = ::Math_obj::sqrt(this->_grids->length);		HX_STACK_VAR(initGrids,"initGrids");
		HX_STACK_LINE(131)
		Float maxRow = (int)0;		HX_STACK_VAR(maxRow,"maxRow");
		HX_STACK_LINE(132)
		Float maxCol = initGrids;		HX_STACK_VAR(maxCol,"maxCol");
		HX_STACK_LINE(134)
		Float maxGridsToAdd = (initGrids + colrowToAdd);		HX_STACK_VAR(maxGridsToAdd,"maxGridsToAdd");
		HX_STACK_LINE(136)
		while((true)){
			HX_STACK_LINE(136)
			if ((!(((maxRow < maxGridsToAdd))))){
				HX_STACK_LINE(136)
				break;
			}
			HX_STACK_LINE(138)
			::grid::BaseGrid g = ::grid::BaseGrid_obj::__new(((int)32 + (maxCol * 120.)),((int)32 + (maxRow * 120.)),null());		HX_STACK_VAR(g,"g");
			HX_STACK_LINE(139)
			this->_grids->push(g);
			HX_STACK_LINE(140)
			g->set_visible(false);
			HX_STACK_LINE(141)
			(maxCol)++;
			HX_STACK_LINE(142)
			if (((maxCol >= maxGridsToAdd))){
				HX_STACK_LINE(145)
				maxCol = initGrids;
				HX_STACK_LINE(146)
				(maxRow)++;
				HX_STACK_LINE(147)
				if (((maxRow == (maxGridsToAdd - (int)1)))){
					HX_STACK_LINE(149)
					maxCol = (int)0;
				}
			}
			HX_STACK_LINE(153)
			this->add(g);
		}
		HX_STACK_LINE(157)
		this->scaleToGrowth();
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC1(GridMap_obj,addGrids,(void))


GridMap_obj::GridMap_obj()
{
}

void GridMap_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(GridMap);
	HX_MARK_MEMBER_NAME(_grids,"_grids");
	HX_MARK_MEMBER_NAME(_initPos,"_initPos");
	HX_MARK_MEMBER_NAME(_posCorrection,"_posCorrection");
	::flixel::group::FlxTypedGroup_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void GridMap_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(_grids,"_grids");
	HX_VISIT_MEMBER_NAME(_initPos,"_initPos");
	HX_VISIT_MEMBER_NAME(_posCorrection,"_posCorrection");
	::flixel::group::FlxTypedGroup_obj::__Visit(HX_VISIT_ARG);
}

Dynamic GridMap_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"_grids") ) { return _grids; }
		if (HX_FIELD_EQ(inName,"update") ) { return update_dyn(); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"destroy") ) { return destroy_dyn(); }
		if (HX_FIELD_EQ(inName,"initMap") ) { return initMap_dyn(); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"_initPos") ) { return _initPos; }
		if (HX_FIELD_EQ(inName,"addGrids") ) { return addGrids_dyn(); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"unlockAreas") ) { return unlockAreas_dyn(); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"scaleToGrowth") ) { return scaleToGrowth_dyn(); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"_posCorrection") ) { return _posCorrection; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic GridMap_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"_grids") ) { _grids=inValue.Cast< Array< ::Dynamic > >(); return inValue; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"_initPos") ) { _initPos=inValue.Cast< ::flixel::util::FlxPoint >(); return inValue; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"_posCorrection") ) { _posCorrection=inValue.Cast< ::flixel::util::FlxPoint >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void GridMap_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("_grids"));
	outFields->push(HX_CSTRING("_initPos"));
	outFields->push(HX_CSTRING("_posCorrection"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

#if HXCPP_SCRIPTABLE
static hx::StorageInfo sMemberStorageInfo[] = {
	{hx::fsObject /*Array< ::Dynamic >*/ ,(int)offsetof(GridMap_obj,_grids),HX_CSTRING("_grids")},
	{hx::fsObject /*::flixel::util::FlxPoint*/ ,(int)offsetof(GridMap_obj,_initPos),HX_CSTRING("_initPos")},
	{hx::fsObject /*::flixel::util::FlxPoint*/ ,(int)offsetof(GridMap_obj,_posCorrection),HX_CSTRING("_posCorrection")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static ::String sMemberFields[] = {
	HX_CSTRING("_grids"),
	HX_CSTRING("_initPos"),
	HX_CSTRING("_posCorrection"),
	HX_CSTRING("update"),
	HX_CSTRING("destroy"),
	HX_CSTRING("initMap"),
	HX_CSTRING("scaleToGrowth"),
	HX_CSTRING("unlockAreas"),
	HX_CSTRING("addGrids"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(GridMap_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(GridMap_obj::__mClass,"__mClass");
};

#endif

Class GridMap_obj::__mClass;

void GridMap_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("grid.GridMap"), hx::TCanCast< GridMap_obj> ,sStaticFields,sMemberFields,
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

void GridMap_obj::__boot()
{
}

} // end namespace grid
