#ifndef INCLUDED_flixel_system_debug_StatsGraph
#define INCLUDED_flixel_system_debug_StatsGraph

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <openfl/display/Sprite.h>
HX_DECLARE_CLASS3(flixel,system,debug,StatsGraph)
HX_DECLARE_CLASS2(openfl,display,DisplayObject)
HX_DECLARE_CLASS2(openfl,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(openfl,display,IBitmapDrawable)
HX_DECLARE_CLASS2(openfl,display,InteractiveObject)
HX_DECLARE_CLASS2(openfl,display,Shape)
HX_DECLARE_CLASS2(openfl,display,Sprite)
HX_DECLARE_CLASS2(openfl,events,EventDispatcher)
HX_DECLARE_CLASS2(openfl,events,IEventDispatcher)
HX_DECLARE_CLASS2(openfl,text,TextField)
namespace flixel{
namespace system{
namespace debug{


class HXCPP_CLASS_ATTRIBUTES  StatsGraph_obj : public ::openfl::display::Sprite_obj{
	public:
		typedef ::openfl::display::Sprite_obj super;
		typedef StatsGraph_obj OBJ_;
		StatsGraph_obj();
		Void __construct(int X,int Y,int Width,int Height,int GraphColor,::String Unit,hx::Null< int >  __o_LabelWidth,::String Label);

	public:
		inline void *operator new( size_t inSize, bool inContainer=true)
			{ return hx::Object::operator new(inSize,inContainer); }
		static hx::ObjectPtr< StatsGraph_obj > __new(int X,int Y,int Width,int Height,int GraphColor,::String Unit,hx::Null< int >  __o_LabelWidth,::String Label);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~StatsGraph_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("StatsGraph"); }

		::openfl::text::TextField minLabel;
		::openfl::text::TextField curLabel;
		::openfl::text::TextField maxLabel;
		::openfl::text::TextField avgLabel;
		Float minValue;
		Float maxValue;
		int graphColor;
		Array< Float > history;
		::openfl::display::Shape _axis;
		int _width;
		int _height;
		::String _unit;
		int _labelWidth;
		::String _label;
		virtual Void drawAxis( );
		Dynamic drawAxis_dyn();

		virtual Void drawGraph( );
		Dynamic drawGraph_dyn();

		virtual Void update( Float Value,Dynamic Average);
		Dynamic update_dyn();

		virtual Float average( );
		Dynamic average_dyn();

		virtual Void destroy( );
		Dynamic destroy_dyn();

		static int AXIS_COLOR;
		static Float AXIS_ALPHA;
		static int HISTORY_MAX;
};

} // end namespace flixel
} // end namespace system
} // end namespace debug

#endif /* INCLUDED_flixel_system_debug_StatsGraph */ 
