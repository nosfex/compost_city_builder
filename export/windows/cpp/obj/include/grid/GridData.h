#ifndef INCLUDED_grid_GridData
#define INCLUDED_grid_GridData

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(grid,GridData)
namespace grid{


class HXCPP_CLASS_ATTRIBUTES  GridData_obj : public hx::Object{
	public:
		typedef hx::Object super;
		typedef GridData_obj OBJ_;
		GridData_obj();
		Void __construct();

	public:
		inline void *operator new( size_t inSize, bool inContainer=false)
			{ return hx::Object::operator new(inSize,inContainer); }
		static hx::ObjectPtr< GridData_obj > __new();
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~GridData_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		::String __ToString() const { return HX_CSTRING("GridData"); }

		Float productionCD;
};

} // end namespace grid

#endif /* INCLUDED_grid_GridData */ 
