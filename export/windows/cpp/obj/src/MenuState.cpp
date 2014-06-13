#include <hxcpp.h>

#ifndef INCLUDED_MenuState
#include <MenuState.h>
#endif
#ifndef INCLUDED_PlayState
#include <PlayState.h>
#endif
#ifndef INCLUDED_flixel_FlxBasic
#include <flixel/FlxBasic.h>
#endif
#ifndef INCLUDED_flixel_FlxG
#include <flixel/FlxG.h>
#endif
#ifndef INCLUDED_flixel_FlxGame
#include <flixel/FlxGame.h>
#endif
#ifndef INCLUDED_flixel_FlxObject
#include <flixel/FlxObject.h>
#endif
#ifndef INCLUDED_flixel_FlxSprite
#include <flixel/FlxSprite.h>
#endif
#ifndef INCLUDED_flixel_FlxState
#include <flixel/FlxState.h>
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
#ifndef INCLUDED_flixel_text_FlxText
#include <flixel/text/FlxText.h>
#endif
#ifndef INCLUDED_flixel_ui_FlxButton
#include <flixel/ui/FlxButton.h>
#endif
#ifndef INCLUDED_flixel_ui_FlxTypedButton
#include <flixel/ui/FlxTypedButton.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObject
#include <openfl/display/DisplayObject.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObjectContainer
#include <openfl/display/DisplayObjectContainer.h>
#endif
#ifndef INCLUDED_openfl_display_IBitmapDrawable
#include <openfl/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl_display_InteractiveObject
#include <openfl/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_openfl_display_Sprite
#include <openfl/display/Sprite.h>
#endif
#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_IEventDispatcher
#include <openfl/events/IEventDispatcher.h>
#endif

Void MenuState_obj::__construct(Dynamic MaxSize)
{
HX_STACK_FRAME("MenuState","new",0xe563b1c4,"MenuState.new","MenuState.hx",13,0xdfbcb22c)
HX_STACK_THIS(this)
HX_STACK_ARG(MaxSize,"MaxSize")
{
	HX_STACK_LINE(13)
	super::__construct(MaxSize);
}
;
	return null();
}

//MenuState_obj::~MenuState_obj() { }

Dynamic MenuState_obj::__CreateEmpty() { return  new MenuState_obj; }
hx::ObjectPtr< MenuState_obj > MenuState_obj::__new(Dynamic MaxSize)
{  hx::ObjectPtr< MenuState_obj > result = new MenuState_obj();
	result->__construct(MaxSize);
	return result;}

Dynamic MenuState_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< MenuState_obj > result = new MenuState_obj();
	result->__construct(inArgs[0]);
	return result;}

Void MenuState_obj::create( ){
{
		HX_STACK_FRAME("MenuState","create",0xe57b7c18,"MenuState.create","MenuState.hx",22,0xdfbcb22c)
		HX_STACK_THIS(this)
		HX_STACK_LINE(23)
		this->super::create();
		HX_STACK_LINE(25)
		::flixel::text::FlxText _g = ::flixel::text::FlxText_obj::__new((::flixel::FlxG_obj::width * 0.5),(::flixel::FlxG_obj::height * 0.2),(int)0,HX_CSTRING("COMPOST CITY BUILDER"),(int)20,null());		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(25)
		this->titleField = _g;
		HX_STACK_LINE(26)
		{
			HX_STACK_LINE(26)
			::flixel::text::FlxText _g1 = this->titleField;		HX_STACK_VAR(_g1,"_g1");
			HX_STACK_LINE(26)
			Float _g11 = this->titleField->get_width();		HX_STACK_VAR(_g11,"_g11");
			HX_STACK_LINE(26)
			Float _g2 = (_g11 * 0.5);		HX_STACK_VAR(_g2,"_g2");
			HX_STACK_LINE(26)
			Float _g3 = (_g1->x - _g2);		HX_STACK_VAR(_g3,"_g3");
			HX_STACK_LINE(26)
			_g1->set_x(_g3);
		}
		HX_STACK_LINE(27)
		this->add(this->titleField);
		HX_STACK_LINE(29)
		::flixel::ui::FlxButton _g4 = ::flixel::ui::FlxButton_obj::__new((::flixel::FlxG_obj::width * 0.5),(::flixel::FlxG_obj::height * 0.7),HX_CSTRING("PLAY"),this->onPlay_dyn());		HX_STACK_VAR(_g4,"_g4");
		HX_STACK_LINE(29)
		this->playBtn = _g4;
		HX_STACK_LINE(30)
		{
			HX_STACK_LINE(30)
			::flixel::ui::FlxButton _g1 = this->playBtn;		HX_STACK_VAR(_g1,"_g1");
			HX_STACK_LINE(30)
			Float _g5 = this->playBtn->get_width();		HX_STACK_VAR(_g5,"_g5");
			HX_STACK_LINE(30)
			Float _g6 = (_g5 * 0.5);		HX_STACK_VAR(_g6,"_g6");
			HX_STACK_LINE(30)
			Float _g7 = (_g1->x - _g6);		HX_STACK_VAR(_g7,"_g7");
			HX_STACK_LINE(30)
			_g1->set_x(_g7);
		}
		HX_STACK_LINE(31)
		this->add(this->playBtn);
	}
return null();
}


Void MenuState_obj::onPlay( ){
{
		HX_STACK_FRAME("MenuState","onPlay",0x56504bcf,"MenuState.onPlay","MenuState.hx",37,0xdfbcb22c)
		HX_STACK_THIS(this)
		HX_STACK_LINE(37)
		::flixel::FlxState State = ::PlayState_obj::__new(null());		HX_STACK_VAR(State,"State");
		HX_STACK_LINE(37)
		::flixel::FlxG_obj::game->_requestedState = State;
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(MenuState_obj,onPlay,(void))

Void MenuState_obj::destroy( ){
{
		HX_STACK_FRAME("MenuState","destroy",0xf9ac905e,"MenuState.destroy","MenuState.hx",45,0xdfbcb22c)
		HX_STACK_THIS(this)
		HX_STACK_LINE(45)
		this->super::destroy();
	}
return null();
}


Void MenuState_obj::update( ){
{
		HX_STACK_FRAME("MenuState","update",0xf0719b25,"MenuState.update","MenuState.hx",53,0xdfbcb22c)
		HX_STACK_THIS(this)
		HX_STACK_LINE(53)
		this->super::update();
	}
return null();
}



MenuState_obj::MenuState_obj()
{
}

void MenuState_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(MenuState);
	HX_MARK_MEMBER_NAME(titleField,"titleField");
	HX_MARK_MEMBER_NAME(playBtn,"playBtn");
	::flixel::FlxState_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void MenuState_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(titleField,"titleField");
	HX_VISIT_MEMBER_NAME(playBtn,"playBtn");
	::flixel::FlxState_obj::__Visit(HX_VISIT_ARG);
}

Dynamic MenuState_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"create") ) { return create_dyn(); }
		if (HX_FIELD_EQ(inName,"onPlay") ) { return onPlay_dyn(); }
		if (HX_FIELD_EQ(inName,"update") ) { return update_dyn(); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"playBtn") ) { return playBtn; }
		if (HX_FIELD_EQ(inName,"destroy") ) { return destroy_dyn(); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"titleField") ) { return titleField; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic MenuState_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"playBtn") ) { playBtn=inValue.Cast< ::flixel::ui::FlxButton >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"titleField") ) { titleField=inValue.Cast< ::flixel::text::FlxText >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void MenuState_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("titleField"));
	outFields->push(HX_CSTRING("playBtn"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

#if HXCPP_SCRIPTABLE
static hx::StorageInfo sMemberStorageInfo[] = {
	{hx::fsObject /*::flixel::text::FlxText*/ ,(int)offsetof(MenuState_obj,titleField),HX_CSTRING("titleField")},
	{hx::fsObject /*::flixel::ui::FlxButton*/ ,(int)offsetof(MenuState_obj,playBtn),HX_CSTRING("playBtn")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static ::String sMemberFields[] = {
	HX_CSTRING("titleField"),
	HX_CSTRING("playBtn"),
	HX_CSTRING("create"),
	HX_CSTRING("onPlay"),
	HX_CSTRING("destroy"),
	HX_CSTRING("update"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(MenuState_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(MenuState_obj::__mClass,"__mClass");
};

#endif

Class MenuState_obj::__mClass;

void MenuState_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("MenuState"), hx::TCanCast< MenuState_obj> ,sStaticFields,sMemberFields,
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

void MenuState_obj::__boot()
{
}

