#ifndef INCLUDED_grid_GridMap
#define INCLUDED_grid_GridMap

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <flixel/group/FlxGroup.h>
HX_DECLARE_CLASS1(flixel,FlxBasic)
HX_DECLARE_CLASS1(flixel,FlxObject)
HX_DECLARE_CLASS1(flixel,FlxSprite)
HX_DECLARE_CLASS2(flixel,group,FlxGroup)
HX_DECLARE_CLASS2(flixel,group,FlxTypedGroup)
HX_DECLARE_CLASS2(flixel,interfaces,IFlxDestroyable)
HX_DECLARE_CLASS1(grid,BaseGrid)
HX_DECLARE_CLASS1(grid,GridMap)
namespace grid{


class HXCPP_CLASS_ATTRIBUTES  GridMap_obj : public ::flixel::group::FlxGroup_obj{
	public:
		typedef ::flixel::group::FlxGroup_obj super;
		typedef GridMap_obj OBJ_;
		GridMap_obj();
		Void __construct();

	public:
		inline void *operator new( size_t inSize, bool inContainer=true)
			{ return hx::Object::operator new(inSize,inContainer); }
		static hx::ObjectPtr< GridMap_obj > __new();
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~GridMap_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("GridMap"); }

		Array< ::Dynamic > _grids;
		virtual Void update( );

		virtual Void destroy( );

		virtual Void initMap( int gridCount);
		Dynamic initMap_dyn();

		virtual Void scaleToGrowth( );
		Dynamic scaleToGrowth_dyn();

		virtual Void addGrids( Float colrowToAdd);
		Dynamic addGrids_dyn();

};

} // end namespace grid

#endif /* INCLUDED_grid_GridMap */ 
