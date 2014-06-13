#ifndef INCLUDED_grid_BaseGrid
#define INCLUDED_grid_BaseGrid

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <flixel/FlxSprite.h>
HX_DECLARE_CLASS1(flixel,FlxBasic)
HX_DECLARE_CLASS1(flixel,FlxObject)
HX_DECLARE_CLASS1(flixel,FlxSprite)
HX_DECLARE_CLASS2(flixel,interfaces,IFlxDestroyable)
HX_DECLARE_CLASS1(grid,BaseGrid)
HX_DECLARE_CLASS1(grid,GridData)
namespace grid{


class HXCPP_CLASS_ATTRIBUTES  BaseGrid_obj : public ::flixel::FlxSprite_obj{
	public:
		typedef ::flixel::FlxSprite_obj super;
		typedef BaseGrid_obj OBJ_;
		BaseGrid_obj();
		Void __construct(hx::Null< Float >  __o_X,hx::Null< Float >  __o_Y,Dynamic SimpleGraphic);

	public:
		inline void *operator new( size_t inSize, bool inContainer=true)
			{ return hx::Object::operator new(inSize,inContainer); }
		static hx::ObjectPtr< BaseGrid_obj > __new(hx::Null< Float >  __o_X,hx::Null< Float >  __o_Y,Dynamic SimpleGraphic);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~BaseGrid_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		::String __ToString() const { return HX_CSTRING("BaseGrid"); }

		virtual Void setData( ::grid::GridData value);
		Dynamic setData_dyn();

		virtual Void update( );

		virtual Void destroy( );

};

} // end namespace grid

#endif /* INCLUDED_grid_BaseGrid */ 
