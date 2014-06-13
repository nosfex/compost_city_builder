#include <hxcpp.h>

#ifndef INCLUDED_hxMath
#include <hxMath.h>
#endif
#ifndef INCLUDED_openfl_geom_Matrix3D
#include <openfl/geom/Matrix3D.h>
#endif
#ifndef INCLUDED_openfl_geom_Vector3D
#include <openfl/geom/Vector3D.h>
#endif
namespace openfl{
namespace geom{

Void Matrix3D_obj::__construct(Array< Float > v)
{
HX_STACK_FRAME("openfl.geom.Matrix3D","new",0xe0591fd8,"openfl.geom.Matrix3D.new","openfl/geom/Matrix3D.hx",17,0x3acce238)
HX_STACK_THIS(this)
HX_STACK_ARG(v,"v")
{
	HX_STACK_LINE(17)
	if (((bool((v != null())) && bool((v->length == (int)16))))){
		HX_STACK_LINE(19)
		this->rawData = v;
	}
	else{
		HX_STACK_LINE(23)
		this->rawData = Array_obj< Float >::__new().Add(1.0).Add(0.0).Add(0.0).Add(0.0).Add(0.0).Add(1.0).Add(0.0).Add(0.0).Add(0.0).Add(0.0).Add(1.0).Add(0.0).Add(0.0).Add(0.0).Add(0.0).Add(1.0);
	}
}
;
	return null();
}

//Matrix3D_obj::~Matrix3D_obj() { }

Dynamic Matrix3D_obj::__CreateEmpty() { return  new Matrix3D_obj; }
hx::ObjectPtr< Matrix3D_obj > Matrix3D_obj::__new(Array< Float > v)
{  hx::ObjectPtr< Matrix3D_obj > result = new Matrix3D_obj();
	result->__construct(v);
	return result;}

Dynamic Matrix3D_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Matrix3D_obj > result = new Matrix3D_obj();
	result->__construct(inArgs[0]);
	return result;}

Void Matrix3D_obj::append( ::openfl::geom::Matrix3D lhs){
{
		HX_STACK_FRAME("openfl.geom.Matrix3D","append",0x481b8d62,"openfl.geom.Matrix3D.append","openfl/geom/Matrix3D.hx",30,0x3acce238)
		HX_STACK_THIS(this)
		HX_STACK_ARG(lhs,"lhs")
		HX_STACK_LINE(32)
		Float m111 = this->rawData->__unsafe_get((int)0);		HX_STACK_VAR(m111,"m111");
		HX_STACK_LINE(32)
		Float m121 = this->rawData->__unsafe_get((int)4);		HX_STACK_VAR(m121,"m121");
		HX_STACK_LINE(32)
		Float m131 = this->rawData->__unsafe_get((int)8);		HX_STACK_VAR(m131,"m131");
		HX_STACK_LINE(32)
		Float m141 = this->rawData->__unsafe_get((int)12);		HX_STACK_VAR(m141,"m141");
		HX_STACK_LINE(33)
		Float m112 = this->rawData->__unsafe_get((int)1);		HX_STACK_VAR(m112,"m112");
		HX_STACK_LINE(33)
		Float m122 = this->rawData->__unsafe_get((int)5);		HX_STACK_VAR(m122,"m122");
		HX_STACK_LINE(33)
		Float m132 = this->rawData->__unsafe_get((int)9);		HX_STACK_VAR(m132,"m132");
		HX_STACK_LINE(33)
		Float m142 = this->rawData->__unsafe_get((int)13);		HX_STACK_VAR(m142,"m142");
		HX_STACK_LINE(34)
		Float m113 = this->rawData->__unsafe_get((int)2);		HX_STACK_VAR(m113,"m113");
		HX_STACK_LINE(34)
		Float m123 = this->rawData->__unsafe_get((int)6);		HX_STACK_VAR(m123,"m123");
		HX_STACK_LINE(34)
		Float m133 = this->rawData->__unsafe_get((int)10);		HX_STACK_VAR(m133,"m133");
		HX_STACK_LINE(34)
		Float m143 = this->rawData->__unsafe_get((int)14);		HX_STACK_VAR(m143,"m143");
		HX_STACK_LINE(35)
		Float m114 = this->rawData->__unsafe_get((int)3);		HX_STACK_VAR(m114,"m114");
		HX_STACK_LINE(35)
		Float m124 = this->rawData->__unsafe_get((int)7);		HX_STACK_VAR(m124,"m124");
		HX_STACK_LINE(35)
		Float m134 = this->rawData->__unsafe_get((int)11);		HX_STACK_VAR(m134,"m134");
		HX_STACK_LINE(35)
		Float m144 = this->rawData->__unsafe_get((int)15);		HX_STACK_VAR(m144,"m144");
		HX_STACK_LINE(36)
		Float m211 = lhs->rawData->__unsafe_get((int)0);		HX_STACK_VAR(m211,"m211");
		HX_STACK_LINE(36)
		Float m221 = lhs->rawData->__unsafe_get((int)4);		HX_STACK_VAR(m221,"m221");
		HX_STACK_LINE(36)
		Float m231 = lhs->rawData->__unsafe_get((int)8);		HX_STACK_VAR(m231,"m231");
		HX_STACK_LINE(36)
		Float m241 = lhs->rawData->__unsafe_get((int)12);		HX_STACK_VAR(m241,"m241");
		HX_STACK_LINE(37)
		Float m212 = lhs->rawData->__unsafe_get((int)1);		HX_STACK_VAR(m212,"m212");
		HX_STACK_LINE(37)
		Float m222 = lhs->rawData->__unsafe_get((int)5);		HX_STACK_VAR(m222,"m222");
		HX_STACK_LINE(37)
		Float m232 = lhs->rawData->__unsafe_get((int)9);		HX_STACK_VAR(m232,"m232");
		HX_STACK_LINE(37)
		Float m242 = lhs->rawData->__unsafe_get((int)13);		HX_STACK_VAR(m242,"m242");
		HX_STACK_LINE(38)
		Float m213 = lhs->rawData->__unsafe_get((int)2);		HX_STACK_VAR(m213,"m213");
		HX_STACK_LINE(38)
		Float m223 = lhs->rawData->__unsafe_get((int)6);		HX_STACK_VAR(m223,"m223");
		HX_STACK_LINE(38)
		Float m233 = lhs->rawData->__unsafe_get((int)10);		HX_STACK_VAR(m233,"m233");
		HX_STACK_LINE(38)
		Float m243 = lhs->rawData->__unsafe_get((int)14);		HX_STACK_VAR(m243,"m243");
		HX_STACK_LINE(39)
		Float m214 = lhs->rawData->__unsafe_get((int)3);		HX_STACK_VAR(m214,"m214");
		HX_STACK_LINE(39)
		Float m224 = lhs->rawData->__unsafe_get((int)7);		HX_STACK_VAR(m224,"m224");
		HX_STACK_LINE(39)
		Float m234 = lhs->rawData->__unsafe_get((int)11);		HX_STACK_VAR(m234,"m234");
		HX_STACK_LINE(39)
		Float m244 = lhs->rawData->__unsafe_get((int)15);		HX_STACK_VAR(m244,"m244");
		HX_STACK_LINE(41)
		this->rawData->__unsafe_set((int)0,((((m111 * m211) + (m112 * m221)) + (m113 * m231)) + (m114 * m241)));
		HX_STACK_LINE(42)
		this->rawData->__unsafe_set((int)1,((((m111 * m212) + (m112 * m222)) + (m113 * m232)) + (m114 * m242)));
		HX_STACK_LINE(43)
		this->rawData->__unsafe_set((int)2,((((m111 * m213) + (m112 * m223)) + (m113 * m233)) + (m114 * m243)));
		HX_STACK_LINE(44)
		this->rawData->__unsafe_set((int)3,((((m111 * m214) + (m112 * m224)) + (m113 * m234)) + (m114 * m244)));
		HX_STACK_LINE(46)
		this->rawData->__unsafe_set((int)4,((((m121 * m211) + (m122 * m221)) + (m123 * m231)) + (m124 * m241)));
		HX_STACK_LINE(47)
		this->rawData->__unsafe_set((int)5,((((m121 * m212) + (m122 * m222)) + (m123 * m232)) + (m124 * m242)));
		HX_STACK_LINE(48)
		this->rawData->__unsafe_set((int)6,((((m121 * m213) + (m122 * m223)) + (m123 * m233)) + (m124 * m243)));
		HX_STACK_LINE(49)
		this->rawData->__unsafe_set((int)7,((((m121 * m214) + (m122 * m224)) + (m123 * m234)) + (m124 * m244)));
		HX_STACK_LINE(51)
		this->rawData->__unsafe_set((int)8,((((m131 * m211) + (m132 * m221)) + (m133 * m231)) + (m134 * m241)));
		HX_STACK_LINE(52)
		this->rawData->__unsafe_set((int)9,((((m131 * m212) + (m132 * m222)) + (m133 * m232)) + (m134 * m242)));
		HX_STACK_LINE(53)
		this->rawData->__unsafe_set((int)10,((((m131 * m213) + (m132 * m223)) + (m133 * m233)) + (m134 * m243)));
		HX_STACK_LINE(54)
		this->rawData->__unsafe_set((int)11,((((m131 * m214) + (m132 * m224)) + (m133 * m234)) + (m134 * m244)));
		HX_STACK_LINE(56)
		this->rawData->__unsafe_set((int)12,((((m141 * m211) + (m142 * m221)) + (m143 * m231)) + (m144 * m241)));
		HX_STACK_LINE(57)
		this->rawData->__unsafe_set((int)13,((((m141 * m212) + (m142 * m222)) + (m143 * m232)) + (m144 * m242)));
		HX_STACK_LINE(58)
		this->rawData->__unsafe_set((int)14,((((m141 * m213) + (m142 * m223)) + (m143 * m233)) + (m144 * m243)));
		HX_STACK_LINE(59)
		this->rawData->__unsafe_set((int)15,((((m141 * m214) + (m142 * m224)) + (m143 * m234)) + (m144 * m244)));
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC1(Matrix3D_obj,append,(void))

Void Matrix3D_obj::appendRotation( Float degrees,::openfl::geom::Vector3D axis,::openfl::geom::Vector3D pivotPoint){
{
		HX_STACK_FRAME("openfl.geom.Matrix3D","appendRotation",0xf492b8c0,"openfl.geom.Matrix3D.appendRotation","openfl/geom/Matrix3D.hx",64,0x3acce238)
		HX_STACK_THIS(this)
		HX_STACK_ARG(degrees,"degrees")
		HX_STACK_ARG(axis,"axis")
		HX_STACK_ARG(pivotPoint,"pivotPoint")
		HX_STACK_LINE(66)
		::openfl::geom::Matrix3D m = ::openfl::geom::Matrix3D_obj::getAxisRotation(axis->x,axis->y,axis->z,degrees);		HX_STACK_VAR(m,"m");
		HX_STACK_LINE(68)
		if (((pivotPoint != null()))){
			HX_STACK_LINE(70)
			::openfl::geom::Vector3D p = pivotPoint;		HX_STACK_VAR(p,"p");
			HX_STACK_LINE(71)
			m->appendTranslation(p->x,p->y,p->z);
		}
		HX_STACK_LINE(75)
		this->append(m);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC3(Matrix3D_obj,appendRotation,(void))

Void Matrix3D_obj::appendScale( Float xScale,Float yScale,Float zScale){
{
		HX_STACK_FRAME("openfl.geom.Matrix3D","appendScale",0x02daedc8,"openfl.geom.Matrix3D.appendScale","openfl/geom/Matrix3D.hx",80,0x3acce238)
		HX_STACK_THIS(this)
		HX_STACK_ARG(xScale,"xScale")
		HX_STACK_ARG(yScale,"yScale")
		HX_STACK_ARG(zScale,"zScale")
		HX_STACK_LINE(82)
		::openfl::geom::Matrix3D _g = ::openfl::geom::Matrix3D_obj::__new(Array_obj< Float >::__new().Add(xScale).Add(0.0).Add(0.0).Add(0.0).Add(0.0).Add(yScale).Add(0.0).Add(0.0).Add(0.0).Add(0.0).Add(zScale).Add(0.0).Add(0.0).Add(0.0).Add(0.0).Add(1.0));		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(82)
		this->append(_g);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC3(Matrix3D_obj,appendScale,(void))

Void Matrix3D_obj::appendTranslation( Float x,Float y,Float z){
{
		HX_STACK_FRAME("openfl.geom.Matrix3D","appendTranslation",0x514252af,"openfl.geom.Matrix3D.appendTranslation","openfl/geom/Matrix3D.hx",87,0x3acce238)
		HX_STACK_THIS(this)
		HX_STACK_ARG(x,"x")
		HX_STACK_ARG(y,"y")
		HX_STACK_ARG(z,"z")
		HX_STACK_LINE(89)
		{
			HX_STACK_LINE(89)
			Float _g = this->rawData->__unsafe_get((int)12);		HX_STACK_VAR(_g,"_g");
			HX_STACK_LINE(89)
			Float value = (_g + x);		HX_STACK_VAR(value,"value");
			HX_STACK_LINE(89)
			this->rawData->__unsafe_set((int)12,value);
		}
		HX_STACK_LINE(90)
		{
			HX_STACK_LINE(90)
			Float _g1 = this->rawData->__unsafe_get((int)13);		HX_STACK_VAR(_g1,"_g1");
			HX_STACK_LINE(90)
			Float value = (_g1 + y);		HX_STACK_VAR(value,"value");
			HX_STACK_LINE(90)
			this->rawData->__unsafe_set((int)13,value);
		}
		HX_STACK_LINE(91)
		{
			HX_STACK_LINE(91)
			Float _g2 = this->rawData->__unsafe_get((int)14);		HX_STACK_VAR(_g2,"_g2");
			HX_STACK_LINE(91)
			Float value = (_g2 + z);		HX_STACK_VAR(value,"value");
			HX_STACK_LINE(91)
			this->rawData->__unsafe_set((int)14,value);
		}
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC3(Matrix3D_obj,appendTranslation,(void))

::openfl::geom::Matrix3D Matrix3D_obj::clone( ){
	HX_STACK_FRAME("openfl.geom.Matrix3D","clone",0x2ff530d5,"openfl.geom.Matrix3D.clone","openfl/geom/Matrix3D.hx",96,0x3acce238)
	HX_STACK_THIS(this)
	HX_STACK_LINE(98)
	Array< Float > _g = this->rawData->copy();		HX_STACK_VAR(_g,"_g");
	HX_STACK_LINE(98)
	return ::openfl::geom::Matrix3D_obj::__new(_g);
}


HX_DEFINE_DYNAMIC_FUNC0(Matrix3D_obj,clone,return )

Void Matrix3D_obj::copyColumnFrom( int column,::openfl::geom::Vector3D vector3D){
{
		HX_STACK_FRAME("openfl.geom.Matrix3D","copyColumnFrom",0x63600afd,"openfl.geom.Matrix3D.copyColumnFrom","openfl/geom/Matrix3D.hx",103,0x3acce238)
		HX_STACK_THIS(this)
		HX_STACK_ARG(column,"column")
		HX_STACK_ARG(vector3D,"vector3D")
		HX_STACK_LINE(105)
		if (((column > (int)3))){
			HX_STACK_LINE(107)
			HX_STACK_DO_THROW(((HX_CSTRING("Column ") + column) + HX_CSTRING(" out of bounds (3)")));
		}
		HX_STACK_LINE(111)
		this->rawData->__unsafe_set(column,vector3D->x);
		HX_STACK_LINE(112)
		this->rawData->__unsafe_set(((int)4 + column),vector3D->y);
		HX_STACK_LINE(113)
		this->rawData->__unsafe_set(((int)8 + column),vector3D->z);
		HX_STACK_LINE(114)
		this->rawData->__unsafe_set(((int)12 + column),vector3D->w);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC2(Matrix3D_obj,copyColumnFrom,(void))

Void Matrix3D_obj::copyColumnTo( int column,::openfl::geom::Vector3D vector3D){
{
		HX_STACK_FRAME("openfl.geom.Matrix3D","copyColumnTo",0x8c37304e,"openfl.geom.Matrix3D.copyColumnTo","openfl/geom/Matrix3D.hx",119,0x3acce238)
		HX_STACK_THIS(this)
		HX_STACK_ARG(column,"column")
		HX_STACK_ARG(vector3D,"vector3D")
		HX_STACK_LINE(121)
		if (((column > (int)3))){
			HX_STACK_LINE(123)
			HX_STACK_DO_THROW(((HX_CSTRING("Column ") + column) + HX_CSTRING(" out of bounds (3)")));
		}
		HX_STACK_LINE(127)
		Float _g = this->rawData->__unsafe_get(column);		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(127)
		vector3D->x = _g;
		HX_STACK_LINE(128)
		Float _g1 = this->rawData->__unsafe_get(((int)4 + column));		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(128)
		vector3D->y = _g1;
		HX_STACK_LINE(129)
		Float _g2 = this->rawData->__unsafe_get(((int)8 + column));		HX_STACK_VAR(_g2,"_g2");
		HX_STACK_LINE(129)
		vector3D->z = _g2;
		HX_STACK_LINE(130)
		Float _g3 = this->rawData->__unsafe_get(((int)12 + column));		HX_STACK_VAR(_g3,"_g3");
		HX_STACK_LINE(130)
		vector3D->w = _g3;
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC2(Matrix3D_obj,copyColumnTo,(void))

Void Matrix3D_obj::copyFrom( ::openfl::geom::Matrix3D other){
{
		HX_STACK_FRAME("openfl.geom.Matrix3D","copyFrom",0xe290a947,"openfl.geom.Matrix3D.copyFrom","openfl/geom/Matrix3D.hx",137,0x3acce238)
		HX_STACK_THIS(this)
		HX_STACK_ARG(other,"other")
		HX_STACK_LINE(137)
		int _g = (int)0;		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(137)
		while((true)){
			HX_STACK_LINE(137)
			if ((!(((_g < (int)16))))){
				HX_STACK_LINE(137)
				break;
			}
			HX_STACK_LINE(137)
			int i = (_g)++;		HX_STACK_VAR(i,"i");
			HX_STACK_LINE(139)
			{
				HX_STACK_LINE(139)
				Float value = other->rawData->__unsafe_get(i);		HX_STACK_VAR(value,"value");
				HX_STACK_LINE(139)
				this->rawData->__unsafe_set(i,value);
			}
		}
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC1(Matrix3D_obj,copyFrom,(void))

Void Matrix3D_obj::copyRowFrom( int row,::openfl::geom::Vector3D vector3D){
{
		HX_STACK_FRAME("openfl.geom.Matrix3D","copyRowFrom",0x3d20cce7,"openfl.geom.Matrix3D.copyRowFrom","openfl/geom/Matrix3D.hx",146,0x3acce238)
		HX_STACK_THIS(this)
		HX_STACK_ARG(row,"row")
		HX_STACK_ARG(vector3D,"vector3D")
		HX_STACK_LINE(148)
		if (((row > (int)3))){
			HX_STACK_LINE(150)
			HX_STACK_DO_THROW(((HX_CSTRING("Row ") + row) + HX_CSTRING(" out of bounds (3)")));
		}
		HX_STACK_LINE(154)
		int i = ((int)4 * row);		HX_STACK_VAR(i,"i");
		HX_STACK_LINE(155)
		this->rawData->__unsafe_set(i,vector3D->x);
		HX_STACK_LINE(156)
		this->rawData->__unsafe_set((i + (int)1),vector3D->y);
		HX_STACK_LINE(157)
		this->rawData->__unsafe_set((i + (int)2),vector3D->z);
		HX_STACK_LINE(158)
		this->rawData->__unsafe_set((i + (int)3),vector3D->w);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC2(Matrix3D_obj,copyRowFrom,(void))

Void Matrix3D_obj::copyRowTo( int row,::openfl::geom::Vector3D vector3D){
{
		HX_STACK_FRAME("openfl.geom.Matrix3D","copyRowTo",0x42dcc3b8,"openfl.geom.Matrix3D.copyRowTo","openfl/geom/Matrix3D.hx",163,0x3acce238)
		HX_STACK_THIS(this)
		HX_STACK_ARG(row,"row")
		HX_STACK_ARG(vector3D,"vector3D")
		HX_STACK_LINE(165)
		if (((row > (int)3))){
			HX_STACK_LINE(167)
			HX_STACK_DO_THROW(((HX_CSTRING("Row ") + row) + HX_CSTRING(" out of bounds (3)")));
		}
		HX_STACK_LINE(171)
		int i = ((int)4 * row);		HX_STACK_VAR(i,"i");
		HX_STACK_LINE(172)
		Float _g = this->rawData->__unsafe_get(i);		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(172)
		vector3D->x = _g;
		HX_STACK_LINE(173)
		Float _g1 = this->rawData->__unsafe_get((i + (int)1));		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(173)
		vector3D->y = _g1;
		HX_STACK_LINE(174)
		Float _g2 = this->rawData->__unsafe_get((i + (int)2));		HX_STACK_VAR(_g2,"_g2");
		HX_STACK_LINE(174)
		vector3D->z = _g2;
		HX_STACK_LINE(175)
		Float _g3 = this->rawData->__unsafe_get((i + (int)3));		HX_STACK_VAR(_g3,"_g3");
		HX_STACK_LINE(175)
		vector3D->w = _g3;
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC2(Matrix3D_obj,copyRowTo,(void))

Void Matrix3D_obj::copyToMatrix3D( ::openfl::geom::Matrix3D other){
{
		HX_STACK_FRAME("openfl.geom.Matrix3D","copyToMatrix3D",0x2cc9916a,"openfl.geom.Matrix3D.copyToMatrix3D","openfl/geom/Matrix3D.hx",182,0x3acce238)
		HX_STACK_THIS(this)
		HX_STACK_ARG(other,"other")
		HX_STACK_LINE(182)
		int _g = (int)0;		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(182)
		while((true)){
			HX_STACK_LINE(182)
			if ((!(((_g < (int)16))))){
				HX_STACK_LINE(182)
				break;
			}
			HX_STACK_LINE(182)
			int i = (_g)++;		HX_STACK_VAR(i,"i");
			HX_STACK_LINE(184)
			{
				HX_STACK_LINE(184)
				Float value = this->rawData->__unsafe_get(i);		HX_STACK_VAR(value,"value");
				HX_STACK_LINE(184)
				other->rawData->__unsafe_set(i,value);
			}
		}
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC1(Matrix3D_obj,copyToMatrix3D,(void))

Array< ::Dynamic > Matrix3D_obj::decompose( ){
	HX_STACK_FRAME("openfl.geom.Matrix3D","decompose",0x4a21fd29,"openfl.geom.Matrix3D.decompose","openfl/geom/Matrix3D.hx",235,0x3acce238)
	HX_STACK_THIS(this)
	HX_STACK_LINE(237)
	Array< ::Dynamic > vec;		HX_STACK_VAR(vec,"vec");
	struct _Function_1_1{
		inline static Array< ::Dynamic > Block( ){
			HX_STACK_FRAME("*","closure",0x5bdab937,"*.closure","openfl/geom/Matrix3D.hx",237,0x3acce238)
			{
				HX_STACK_LINE(237)
				Array< ::Dynamic > this1;		HX_STACK_VAR(this1,"this1");
				HX_STACK_LINE(237)
				Array< ::Dynamic > _g = Array_obj< ::Dynamic >::__new()->__SetSizeExact(null());		HX_STACK_VAR(_g,"_g");
				HX_STACK_LINE(237)
				this1 = _g;
				HX_STACK_LINE(237)
				return this1;
			}
			return null();
		}
	};
	HX_STACK_LINE(237)
	vec = _Function_1_1::Block();
	HX_STACK_LINE(238)
	::openfl::geom::Matrix3D m = this->clone();		HX_STACK_VAR(m,"m");
	HX_STACK_LINE(239)
	Array< Float > mr = m->rawData;		HX_STACK_VAR(mr,"mr");
	HX_STACK_LINE(241)
	Float _g1 = mr->__unsafe_get((int)12);		HX_STACK_VAR(_g1,"_g1");
	HX_STACK_LINE(241)
	Float _g2 = mr->__unsafe_get((int)13);		HX_STACK_VAR(_g2,"_g2");
	HX_STACK_LINE(241)
	Float _g3 = mr->__unsafe_get((int)14);		HX_STACK_VAR(_g3,"_g3");
	HX_STACK_LINE(241)
	::openfl::geom::Vector3D pos = ::openfl::geom::Vector3D_obj::__new(_g1,_g2,_g3,null());		HX_STACK_VAR(pos,"pos");
	HX_STACK_LINE(242)
	mr->__unsafe_set((int)12,(int)0);
	HX_STACK_LINE(243)
	mr->__unsafe_set((int)13,(int)0);
	HX_STACK_LINE(244)
	mr->__unsafe_set((int)14,(int)0);
	HX_STACK_LINE(246)
	::openfl::geom::Vector3D scale = ::openfl::geom::Vector3D_obj::__new(null(),null(),null(),null());		HX_STACK_VAR(scale,"scale");
	HX_STACK_LINE(248)
	Float _g4 = mr->__unsafe_get((int)0);		HX_STACK_VAR(_g4,"_g4");
	HX_STACK_LINE(248)
	Float _g5 = mr->__unsafe_get((int)0);		HX_STACK_VAR(_g5,"_g5");
	HX_STACK_LINE(248)
	Float _g6 = (_g4 * _g5);		HX_STACK_VAR(_g6,"_g6");
	HX_STACK_LINE(248)
	Float _g7 = mr->__unsafe_get((int)1);		HX_STACK_VAR(_g7,"_g7");
	HX_STACK_LINE(248)
	Float _g8 = mr->__unsafe_get((int)1);		HX_STACK_VAR(_g8,"_g8");
	HX_STACK_LINE(248)
	Float _g9 = (_g7 * _g8);		HX_STACK_VAR(_g9,"_g9");
	HX_STACK_LINE(248)
	Float _g10 = (_g6 + _g9);		HX_STACK_VAR(_g10,"_g10");
	HX_STACK_LINE(248)
	Float _g11 = mr->__unsafe_get((int)2);		HX_STACK_VAR(_g11,"_g11");
	HX_STACK_LINE(248)
	Float _g12 = mr->__unsafe_get((int)2);		HX_STACK_VAR(_g12,"_g12");
	HX_STACK_LINE(248)
	Float _g13 = (_g11 * _g12);		HX_STACK_VAR(_g13,"_g13");
	HX_STACK_LINE(248)
	Float _g14 = (_g10 + _g13);		HX_STACK_VAR(_g14,"_g14");
	HX_STACK_LINE(248)
	Float _g15 = ::Math_obj::sqrt(_g14);		HX_STACK_VAR(_g15,"_g15");
	HX_STACK_LINE(248)
	scale->x = _g15;
	HX_STACK_LINE(249)
	Float _g16 = mr->__unsafe_get((int)4);		HX_STACK_VAR(_g16,"_g16");
	HX_STACK_LINE(249)
	Float _g17 = mr->__unsafe_get((int)4);		HX_STACK_VAR(_g17,"_g17");
	HX_STACK_LINE(249)
	Float _g18 = (_g16 * _g17);		HX_STACK_VAR(_g18,"_g18");
	HX_STACK_LINE(249)
	Float _g19 = mr->__unsafe_get((int)5);		HX_STACK_VAR(_g19,"_g19");
	HX_STACK_LINE(249)
	Float _g20 = mr->__unsafe_get((int)5);		HX_STACK_VAR(_g20,"_g20");
	HX_STACK_LINE(249)
	Float _g21 = (_g19 * _g20);		HX_STACK_VAR(_g21,"_g21");
	HX_STACK_LINE(249)
	Float _g22 = (_g18 + _g21);		HX_STACK_VAR(_g22,"_g22");
	HX_STACK_LINE(249)
	Float _g23 = mr->__unsafe_get((int)6);		HX_STACK_VAR(_g23,"_g23");
	HX_STACK_LINE(249)
	Float _g24 = mr->__unsafe_get((int)6);		HX_STACK_VAR(_g24,"_g24");
	HX_STACK_LINE(249)
	Float _g25 = (_g23 * _g24);		HX_STACK_VAR(_g25,"_g25");
	HX_STACK_LINE(249)
	Float _g26 = (_g22 + _g25);		HX_STACK_VAR(_g26,"_g26");
	HX_STACK_LINE(249)
	Float _g27 = ::Math_obj::sqrt(_g26);		HX_STACK_VAR(_g27,"_g27");
	HX_STACK_LINE(249)
	scale->y = _g27;
	HX_STACK_LINE(250)
	Float _g28 = mr->__unsafe_get((int)8);		HX_STACK_VAR(_g28,"_g28");
	HX_STACK_LINE(250)
	Float _g29 = mr->__unsafe_get((int)8);		HX_STACK_VAR(_g29,"_g29");
	HX_STACK_LINE(250)
	Float _g30 = (_g28 * _g29);		HX_STACK_VAR(_g30,"_g30");
	HX_STACK_LINE(250)
	Float _g31 = mr->__unsafe_get((int)9);		HX_STACK_VAR(_g31,"_g31");
	HX_STACK_LINE(250)
	Float _g32 = mr->__unsafe_get((int)9);		HX_STACK_VAR(_g32,"_g32");
	HX_STACK_LINE(250)
	Float _g33 = (_g31 * _g32);		HX_STACK_VAR(_g33,"_g33");
	HX_STACK_LINE(250)
	Float _g34 = (_g30 + _g33);		HX_STACK_VAR(_g34,"_g34");
	HX_STACK_LINE(250)
	Float _g35 = mr->__unsafe_get((int)10);		HX_STACK_VAR(_g35,"_g35");
	HX_STACK_LINE(250)
	Float _g36 = mr->__unsafe_get((int)10);		HX_STACK_VAR(_g36,"_g36");
	HX_STACK_LINE(250)
	Float _g37 = (_g35 * _g36);		HX_STACK_VAR(_g37,"_g37");
	HX_STACK_LINE(250)
	Float _g38 = (_g34 + _g37);		HX_STACK_VAR(_g38,"_g38");
	HX_STACK_LINE(250)
	Float _g39 = ::Math_obj::sqrt(_g38);		HX_STACK_VAR(_g39,"_g39");
	HX_STACK_LINE(250)
	scale->z = _g39;
	HX_STACK_LINE(252)
	Float _g40 = mr->__unsafe_get((int)0);		HX_STACK_VAR(_g40,"_g40");
	HX_STACK_LINE(252)
	Float _g41 = mr->__unsafe_get((int)5);		HX_STACK_VAR(_g41,"_g41");
	HX_STACK_LINE(252)
	Float _g42 = mr->__unsafe_get((int)10);		HX_STACK_VAR(_g42,"_g42");
	HX_STACK_LINE(252)
	Float _g43 = (_g41 * _g42);		HX_STACK_VAR(_g43,"_g43");
	HX_STACK_LINE(252)
	Float _g44 = mr->__unsafe_get((int)6);		HX_STACK_VAR(_g44,"_g44");
	HX_STACK_LINE(252)
	Float _g45 = mr->__unsafe_get((int)9);		HX_STACK_VAR(_g45,"_g45");
	HX_STACK_LINE(252)
	Float _g46 = (_g44 * _g45);		HX_STACK_VAR(_g46,"_g46");
	HX_STACK_LINE(252)
	Float _g47 = (_g43 - _g46);		HX_STACK_VAR(_g47,"_g47");
	HX_STACK_LINE(252)
	Float _g48 = (_g40 * _g47);		HX_STACK_VAR(_g48,"_g48");
	HX_STACK_LINE(252)
	Float _g49 = mr->__unsafe_get((int)1);		HX_STACK_VAR(_g49,"_g49");
	HX_STACK_LINE(252)
	Float _g50 = mr->__unsafe_get((int)4);		HX_STACK_VAR(_g50,"_g50");
	HX_STACK_LINE(252)
	Float _g51 = mr->__unsafe_get((int)10);		HX_STACK_VAR(_g51,"_g51");
	HX_STACK_LINE(252)
	Float _g52 = (_g50 * _g51);		HX_STACK_VAR(_g52,"_g52");
	HX_STACK_LINE(252)
	Float _g53 = mr->__unsafe_get((int)6);		HX_STACK_VAR(_g53,"_g53");
	HX_STACK_LINE(252)
	Float _g54 = mr->__unsafe_get((int)8);		HX_STACK_VAR(_g54,"_g54");
	HX_STACK_LINE(252)
	Float _g55 = (_g53 * _g54);		HX_STACK_VAR(_g55,"_g55");
	HX_STACK_LINE(252)
	Float _g56 = (_g52 - _g55);		HX_STACK_VAR(_g56,"_g56");
	HX_STACK_LINE(252)
	Float _g57 = (_g49 * _g56);		HX_STACK_VAR(_g57,"_g57");
	HX_STACK_LINE(252)
	Float _g58 = (_g48 - _g57);		HX_STACK_VAR(_g58,"_g58");
	HX_STACK_LINE(252)
	Float _g59 = mr->__unsafe_get((int)2);		HX_STACK_VAR(_g59,"_g59");
	HX_STACK_LINE(252)
	Float _g60 = mr->__unsafe_get((int)4);		HX_STACK_VAR(_g60,"_g60");
	HX_STACK_LINE(252)
	Float _g61 = mr->__unsafe_get((int)9);		HX_STACK_VAR(_g61,"_g61");
	HX_STACK_LINE(252)
	Float _g62 = (_g60 * _g61);		HX_STACK_VAR(_g62,"_g62");
	HX_STACK_LINE(252)
	Float _g63 = mr->__unsafe_get((int)5);		HX_STACK_VAR(_g63,"_g63");
	HX_STACK_LINE(252)
	Float _g64 = mr->__unsafe_get((int)8);		HX_STACK_VAR(_g64,"_g64");
	HX_STACK_LINE(252)
	Float _g65 = (_g63 * _g64);		HX_STACK_VAR(_g65,"_g65");
	HX_STACK_LINE(252)
	Float _g66 = (_g62 - _g65);		HX_STACK_VAR(_g66,"_g66");
	HX_STACK_LINE(252)
	Float _g67 = (_g59 * _g66);		HX_STACK_VAR(_g67,"_g67");
	HX_STACK_LINE(252)
	Float _g68 = (_g58 + _g67);		HX_STACK_VAR(_g68,"_g68");
	HX_STACK_LINE(252)
	if (((_g68 < (int)0))){
		HX_STACK_LINE(254)
		scale->z = -(scale->z);
	}
	HX_STACK_LINE(258)
	{
		HX_STACK_LINE(258)
		Float _g69 = mr->__unsafe_get((int)0);		HX_STACK_VAR(_g69,"_g69");
		HX_STACK_LINE(258)
		Float value = (Float(_g69) / Float(scale->x));		HX_STACK_VAR(value,"value");
		HX_STACK_LINE(258)
		mr->__unsafe_set((int)0,value);
	}
	HX_STACK_LINE(259)
	{
		HX_STACK_LINE(259)
		Float _g70 = mr->__unsafe_get((int)1);		HX_STACK_VAR(_g70,"_g70");
		HX_STACK_LINE(259)
		Float value = (Float(_g70) / Float(scale->x));		HX_STACK_VAR(value,"value");
		HX_STACK_LINE(259)
		mr->__unsafe_set((int)1,value);
	}
	HX_STACK_LINE(260)
	{
		HX_STACK_LINE(260)
		Float _g71 = mr->__unsafe_get((int)2);		HX_STACK_VAR(_g71,"_g71");
		HX_STACK_LINE(260)
		Float value = (Float(_g71) / Float(scale->x));		HX_STACK_VAR(value,"value");
		HX_STACK_LINE(260)
		mr->__unsafe_set((int)2,value);
	}
	HX_STACK_LINE(261)
	{
		HX_STACK_LINE(261)
		Float _g72 = mr->__unsafe_get((int)4);		HX_STACK_VAR(_g72,"_g72");
		HX_STACK_LINE(261)
		Float value = (Float(_g72) / Float(scale->y));		HX_STACK_VAR(value,"value");
		HX_STACK_LINE(261)
		mr->__unsafe_set((int)4,value);
	}
	HX_STACK_LINE(262)
	{
		HX_STACK_LINE(262)
		Float _g73 = mr->__unsafe_get((int)5);		HX_STACK_VAR(_g73,"_g73");
		HX_STACK_LINE(262)
		Float value = (Float(_g73) / Float(scale->y));		HX_STACK_VAR(value,"value");
		HX_STACK_LINE(262)
		mr->__unsafe_set((int)5,value);
	}
	HX_STACK_LINE(263)
	{
		HX_STACK_LINE(263)
		Float _g74 = mr->__unsafe_get((int)6);		HX_STACK_VAR(_g74,"_g74");
		HX_STACK_LINE(263)
		Float value = (Float(_g74) / Float(scale->y));		HX_STACK_VAR(value,"value");
		HX_STACK_LINE(263)
		mr->__unsafe_set((int)6,value);
	}
	HX_STACK_LINE(264)
	{
		HX_STACK_LINE(264)
		Float _g75 = mr->__unsafe_get((int)8);		HX_STACK_VAR(_g75,"_g75");
		HX_STACK_LINE(264)
		Float value = (Float(_g75) / Float(scale->z));		HX_STACK_VAR(value,"value");
		HX_STACK_LINE(264)
		mr->__unsafe_set((int)8,value);
	}
	HX_STACK_LINE(265)
	{
		HX_STACK_LINE(265)
		Float _g76 = mr->__unsafe_get((int)9);		HX_STACK_VAR(_g76,"_g76");
		HX_STACK_LINE(265)
		Float value = (Float(_g76) / Float(scale->z));		HX_STACK_VAR(value,"value");
		HX_STACK_LINE(265)
		mr->__unsafe_set((int)9,value);
	}
	HX_STACK_LINE(266)
	{
		HX_STACK_LINE(266)
		Float _g77 = mr->__unsafe_get((int)10);		HX_STACK_VAR(_g77,"_g77");
		HX_STACK_LINE(266)
		Float value = (Float(_g77) / Float(scale->z));		HX_STACK_VAR(value,"value");
		HX_STACK_LINE(266)
		mr->__unsafe_set((int)10,value);
	}
	HX_STACK_LINE(268)
	::openfl::geom::Vector3D rot = ::openfl::geom::Vector3D_obj::__new(null(),null(),null(),null());		HX_STACK_VAR(rot,"rot");
	HX_STACK_LINE(269)
	Float _g78 = -(mr->__unsafe_get((int)2));		HX_STACK_VAR(_g78,"_g78");
	HX_STACK_LINE(269)
	Float _g79 = ::Math_obj::asin(_g78);		HX_STACK_VAR(_g79,"_g79");
	HX_STACK_LINE(269)
	rot->y = _g79;
	HX_STACK_LINE(270)
	Float C = ::Math_obj::cos(rot->y);		HX_STACK_VAR(C,"C");
	HX_STACK_LINE(272)
	if (((C > (int)0))){
		HX_STACK_LINE(274)
		Float _g80 = mr->__unsafe_get((int)6);		HX_STACK_VAR(_g80,"_g80");
		HX_STACK_LINE(274)
		Float _g81 = mr->__unsafe_get((int)10);		HX_STACK_VAR(_g81,"_g81");
		HX_STACK_LINE(274)
		Float _g82 = ::Math_obj::atan2(_g80,_g81);		HX_STACK_VAR(_g82,"_g82");
		HX_STACK_LINE(274)
		rot->x = _g82;
		HX_STACK_LINE(275)
		Float _g83 = mr->__unsafe_get((int)1);		HX_STACK_VAR(_g83,"_g83");
		HX_STACK_LINE(275)
		Float _g84 = mr->__unsafe_get((int)0);		HX_STACK_VAR(_g84,"_g84");
		HX_STACK_LINE(275)
		Float _g85 = ::Math_obj::atan2(_g83,_g84);		HX_STACK_VAR(_g85,"_g85");
		HX_STACK_LINE(275)
		rot->z = _g85;
	}
	else{
		HX_STACK_LINE(279)
		rot->z = (int)0;
		HX_STACK_LINE(280)
		Float _g86 = mr->__unsafe_get((int)4);		HX_STACK_VAR(_g86,"_g86");
		HX_STACK_LINE(280)
		Float _g87 = mr->__unsafe_get((int)5);		HX_STACK_VAR(_g87,"_g87");
		HX_STACK_LINE(280)
		Float _g88 = ::Math_obj::atan2(_g86,_g87);		HX_STACK_VAR(_g88,"_g88");
		HX_STACK_LINE(280)
		rot->x = _g88;
	}
	HX_STACK_LINE(284)
	vec->push(pos);
	HX_STACK_LINE(285)
	vec->push(rot);
	HX_STACK_LINE(286)
	vec->push(scale);
	HX_STACK_LINE(288)
	return vec;
}


HX_DEFINE_DYNAMIC_FUNC0(Matrix3D_obj,decompose,return )

::openfl::geom::Vector3D Matrix3D_obj::deltaTransformVector( ::openfl::geom::Vector3D v){
	HX_STACK_FRAME("openfl.geom.Matrix3D","deltaTransformVector",0x0285cbbf,"openfl.geom.Matrix3D.deltaTransformVector","openfl/geom/Matrix3D.hx",293,0x3acce238)
	HX_STACK_THIS(this)
	HX_STACK_ARG(v,"v")
	HX_STACK_LINE(295)
	Float x = v->x;		HX_STACK_VAR(x,"x");
	HX_STACK_LINE(295)
	Float y = v->y;		HX_STACK_VAR(y,"y");
	HX_STACK_LINE(295)
	Float z = v->z;		HX_STACK_VAR(z,"z");
	HX_STACK_LINE(298)
	Float _g = this->rawData->__unsafe_get((int)0);		HX_STACK_VAR(_g,"_g");
	HX_STACK_LINE(298)
	Float _g1 = (x * _g);		HX_STACK_VAR(_g1,"_g1");
	HX_STACK_LINE(298)
	Float _g2 = this->rawData->__unsafe_get((int)1);		HX_STACK_VAR(_g2,"_g2");
	HX_STACK_LINE(298)
	Float _g3 = (y * _g2);		HX_STACK_VAR(_g3,"_g3");
	HX_STACK_LINE(298)
	Float _g4 = (_g1 + _g3);		HX_STACK_VAR(_g4,"_g4");
	HX_STACK_LINE(298)
	Float _g5 = this->rawData->__unsafe_get((int)2);		HX_STACK_VAR(_g5,"_g5");
	HX_STACK_LINE(298)
	Float _g6 = (z * _g5);		HX_STACK_VAR(_g6,"_g6");
	HX_STACK_LINE(298)
	Float _g7 = (_g4 + _g6);		HX_STACK_VAR(_g7,"_g7");
	HX_STACK_LINE(298)
	Float _g8 = this->rawData->__unsafe_get((int)3);		HX_STACK_VAR(_g8,"_g8");
	HX_STACK_LINE(298)
	Float _g9 = (_g7 + _g8);		HX_STACK_VAR(_g9,"_g9");
	HX_STACK_LINE(299)
	Float _g10 = this->rawData->__unsafe_get((int)4);		HX_STACK_VAR(_g10,"_g10");
	HX_STACK_LINE(299)
	Float _g11 = (x * _g10);		HX_STACK_VAR(_g11,"_g11");
	HX_STACK_LINE(299)
	Float _g12 = this->rawData->__unsafe_get((int)5);		HX_STACK_VAR(_g12,"_g12");
	HX_STACK_LINE(299)
	Float _g13 = (y * _g12);		HX_STACK_VAR(_g13,"_g13");
	HX_STACK_LINE(299)
	Float _g14 = (_g11 + _g13);		HX_STACK_VAR(_g14,"_g14");
	HX_STACK_LINE(299)
	Float _g15 = this->rawData->__unsafe_get((int)6);		HX_STACK_VAR(_g15,"_g15");
	HX_STACK_LINE(299)
	Float _g16 = (z * _g15);		HX_STACK_VAR(_g16,"_g16");
	HX_STACK_LINE(299)
	Float _g17 = (_g14 + _g16);		HX_STACK_VAR(_g17,"_g17");
	HX_STACK_LINE(299)
	Float _g18 = this->rawData->__unsafe_get((int)7);		HX_STACK_VAR(_g18,"_g18");
	HX_STACK_LINE(299)
	Float _g19 = (_g17 + _g18);		HX_STACK_VAR(_g19,"_g19");
	HX_STACK_LINE(300)
	Float _g20 = this->rawData->__unsafe_get((int)8);		HX_STACK_VAR(_g20,"_g20");
	HX_STACK_LINE(300)
	Float _g21 = (x * _g20);		HX_STACK_VAR(_g21,"_g21");
	HX_STACK_LINE(300)
	Float _g22 = this->rawData->__unsafe_get((int)9);		HX_STACK_VAR(_g22,"_g22");
	HX_STACK_LINE(300)
	Float _g23 = (y * _g22);		HX_STACK_VAR(_g23,"_g23");
	HX_STACK_LINE(300)
	Float _g24 = (_g21 + _g23);		HX_STACK_VAR(_g24,"_g24");
	HX_STACK_LINE(300)
	Float _g25 = this->rawData->__unsafe_get((int)10);		HX_STACK_VAR(_g25,"_g25");
	HX_STACK_LINE(300)
	Float _g26 = (z * _g25);		HX_STACK_VAR(_g26,"_g26");
	HX_STACK_LINE(300)
	Float _g27 = (_g24 + _g26);		HX_STACK_VAR(_g27,"_g27");
	HX_STACK_LINE(300)
	Float _g28 = this->rawData->__unsafe_get((int)11);		HX_STACK_VAR(_g28,"_g28");
	HX_STACK_LINE(300)
	Float _g29 = (_g27 + _g28);		HX_STACK_VAR(_g29,"_g29");
	HX_STACK_LINE(297)
	return ::openfl::geom::Vector3D_obj::__new(_g9,_g19,_g29,(int)0);
}


HX_DEFINE_DYNAMIC_FUNC1(Matrix3D_obj,deltaTransformVector,return )

Void Matrix3D_obj::identity( ){
{
		HX_STACK_FRAME("openfl.geom.Matrix3D","identity",0xd35ee2c6,"openfl.geom.Matrix3D.identity","openfl/geom/Matrix3D.hx",338,0x3acce238)
		HX_STACK_THIS(this)
		HX_STACK_LINE(340)
		this->rawData->__unsafe_set((int)0,(int)1);
		HX_STACK_LINE(341)
		this->rawData->__unsafe_set((int)1,(int)0);
		HX_STACK_LINE(342)
		this->rawData->__unsafe_set((int)2,(int)0);
		HX_STACK_LINE(343)
		this->rawData->__unsafe_set((int)3,(int)0);
		HX_STACK_LINE(344)
		this->rawData->__unsafe_set((int)4,(int)0);
		HX_STACK_LINE(345)
		this->rawData->__unsafe_set((int)5,(int)1);
		HX_STACK_LINE(346)
		this->rawData->__unsafe_set((int)6,(int)0);
		HX_STACK_LINE(347)
		this->rawData->__unsafe_set((int)7,(int)0);
		HX_STACK_LINE(348)
		this->rawData->__unsafe_set((int)8,(int)0);
		HX_STACK_LINE(349)
		this->rawData->__unsafe_set((int)9,(int)0);
		HX_STACK_LINE(350)
		this->rawData->__unsafe_set((int)10,(int)1);
		HX_STACK_LINE(351)
		this->rawData->__unsafe_set((int)11,(int)0);
		HX_STACK_LINE(352)
		this->rawData->__unsafe_set((int)12,(int)0);
		HX_STACK_LINE(353)
		this->rawData->__unsafe_set((int)13,(int)0);
		HX_STACK_LINE(354)
		this->rawData->__unsafe_set((int)14,(int)0);
		HX_STACK_LINE(355)
		this->rawData->__unsafe_set((int)15,(int)1);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Matrix3D_obj,identity,(void))

Void Matrix3D_obj::interpolateTo( ::openfl::geom::Matrix3D toMat,Float percent){
{
		HX_STACK_FRAME("openfl.geom.Matrix3D","interpolateTo",0x74c2e614,"openfl.geom.Matrix3D.interpolateTo","openfl/geom/Matrix3D.hx",377,0x3acce238)
		HX_STACK_THIS(this)
		HX_STACK_ARG(toMat,"toMat")
		HX_STACK_ARG(percent,"percent")
		HX_STACK_LINE(377)
		int _g = (int)0;		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(377)
		while((true)){
			HX_STACK_LINE(377)
			if ((!(((_g < (int)16))))){
				HX_STACK_LINE(377)
				break;
			}
			HX_STACK_LINE(377)
			int i = (_g)++;		HX_STACK_VAR(i,"i");
			HX_STACK_LINE(379)
			{
				HX_STACK_LINE(379)
				Float _g1 = this->rawData->__unsafe_get(i);		HX_STACK_VAR(_g1,"_g1");
				HX_STACK_LINE(379)
				Float _g11 = toMat->rawData->__unsafe_get(i);		HX_STACK_VAR(_g11,"_g11");
				HX_STACK_LINE(379)
				Float _g2 = this->rawData->__unsafe_get(i);		HX_STACK_VAR(_g2,"_g2");
				HX_STACK_LINE(379)
				Float _g3 = (_g11 - _g2);		HX_STACK_VAR(_g3,"_g3");
				HX_STACK_LINE(379)
				Float _g4 = (_g3 * percent);		HX_STACK_VAR(_g4,"_g4");
				HX_STACK_LINE(379)
				Float value = (_g1 + _g4);		HX_STACK_VAR(value,"value");
				HX_STACK_LINE(379)
				this->rawData->__unsafe_set(i,value);
			}
		}
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC2(Matrix3D_obj,interpolateTo,(void))

bool Matrix3D_obj::invert( ){
	HX_STACK_FRAME("openfl.geom.Matrix3D","invert",0x5820929e,"openfl.geom.Matrix3D.invert","openfl/geom/Matrix3D.hx",386,0x3acce238)
	HX_STACK_THIS(this)
	HX_STACK_LINE(388)
	Float d = this->get_determinant();		HX_STACK_VAR(d,"d");
	HX_STACK_LINE(389)
	Float _g = ::Math_obj::abs(d);		HX_STACK_VAR(_g,"_g");
	HX_STACK_LINE(389)
	bool invertable = (_g > 0.00000000001);		HX_STACK_VAR(invertable,"invertable");
	HX_STACK_LINE(391)
	if ((invertable)){
		HX_STACK_LINE(393)
		d = (Float((int)-1) / Float(d));
		HX_STACK_LINE(394)
		Float m11 = this->rawData->__unsafe_get((int)0);		HX_STACK_VAR(m11,"m11");
		HX_STACK_LINE(394)
		Float m21 = this->rawData->__unsafe_get((int)4);		HX_STACK_VAR(m21,"m21");
		HX_STACK_LINE(394)
		Float m31 = this->rawData->__unsafe_get((int)8);		HX_STACK_VAR(m31,"m31");
		HX_STACK_LINE(394)
		Float m41 = this->rawData->__unsafe_get((int)12);		HX_STACK_VAR(m41,"m41");
		HX_STACK_LINE(395)
		Float m12 = this->rawData->__unsafe_get((int)1);		HX_STACK_VAR(m12,"m12");
		HX_STACK_LINE(395)
		Float m22 = this->rawData->__unsafe_get((int)5);		HX_STACK_VAR(m22,"m22");
		HX_STACK_LINE(395)
		Float m32 = this->rawData->__unsafe_get((int)9);		HX_STACK_VAR(m32,"m32");
		HX_STACK_LINE(395)
		Float m42 = this->rawData->__unsafe_get((int)13);		HX_STACK_VAR(m42,"m42");
		HX_STACK_LINE(396)
		Float m13 = this->rawData->__unsafe_get((int)2);		HX_STACK_VAR(m13,"m13");
		HX_STACK_LINE(396)
		Float m23 = this->rawData->__unsafe_get((int)6);		HX_STACK_VAR(m23,"m23");
		HX_STACK_LINE(396)
		Float m33 = this->rawData->__unsafe_get((int)10);		HX_STACK_VAR(m33,"m33");
		HX_STACK_LINE(396)
		Float m43 = this->rawData->__unsafe_get((int)14);		HX_STACK_VAR(m43,"m43");
		HX_STACK_LINE(397)
		Float m14 = this->rawData->__unsafe_get((int)3);		HX_STACK_VAR(m14,"m14");
		HX_STACK_LINE(397)
		Float m24 = this->rawData->__unsafe_get((int)7);		HX_STACK_VAR(m24,"m24");
		HX_STACK_LINE(397)
		Float m34 = this->rawData->__unsafe_get((int)11);		HX_STACK_VAR(m34,"m34");
		HX_STACK_LINE(397)
		Float m44 = this->rawData->__unsafe_get((int)15);		HX_STACK_VAR(m44,"m44");
		HX_STACK_LINE(399)
		this->rawData->__unsafe_set((int)0,(d * ((((m22 * (((m33 * m44) - (m43 * m34)))) - (m32 * (((m23 * m44) - (m43 * m24))))) + (m42 * (((m23 * m34) - (m33 * m24))))))));
		HX_STACK_LINE(400)
		this->rawData->__unsafe_set((int)1,(-(d) * ((((m12 * (((m33 * m44) - (m43 * m34)))) - (m32 * (((m13 * m44) - (m43 * m14))))) + (m42 * (((m13 * m34) - (m33 * m14))))))));
		HX_STACK_LINE(401)
		this->rawData->__unsafe_set((int)2,(d * ((((m12 * (((m23 * m44) - (m43 * m24)))) - (m22 * (((m13 * m44) - (m43 * m14))))) + (m42 * (((m13 * m24) - (m23 * m14))))))));
		HX_STACK_LINE(402)
		this->rawData->__unsafe_set((int)3,(-(d) * ((((m12 * (((m23 * m34) - (m33 * m24)))) - (m22 * (((m13 * m34) - (m33 * m14))))) + (m32 * (((m13 * m24) - (m23 * m14))))))));
		HX_STACK_LINE(403)
		this->rawData->__unsafe_set((int)4,(-(d) * ((((m21 * (((m33 * m44) - (m43 * m34)))) - (m31 * (((m23 * m44) - (m43 * m24))))) + (m41 * (((m23 * m34) - (m33 * m24))))))));
		HX_STACK_LINE(404)
		this->rawData->__unsafe_set((int)5,(d * ((((m11 * (((m33 * m44) - (m43 * m34)))) - (m31 * (((m13 * m44) - (m43 * m14))))) + (m41 * (((m13 * m34) - (m33 * m14))))))));
		HX_STACK_LINE(405)
		this->rawData->__unsafe_set((int)6,(-(d) * ((((m11 * (((m23 * m44) - (m43 * m24)))) - (m21 * (((m13 * m44) - (m43 * m14))))) + (m41 * (((m13 * m24) - (m23 * m14))))))));
		HX_STACK_LINE(406)
		this->rawData->__unsafe_set((int)7,(d * ((((m11 * (((m23 * m34) - (m33 * m24)))) - (m21 * (((m13 * m34) - (m33 * m14))))) + (m31 * (((m13 * m24) - (m23 * m14))))))));
		HX_STACK_LINE(407)
		this->rawData->__unsafe_set((int)8,(d * ((((m21 * (((m32 * m44) - (m42 * m34)))) - (m31 * (((m22 * m44) - (m42 * m24))))) + (m41 * (((m22 * m34) - (m32 * m24))))))));
		HX_STACK_LINE(408)
		this->rawData->__unsafe_set((int)9,(-(d) * ((((m11 * (((m32 * m44) - (m42 * m34)))) - (m31 * (((m12 * m44) - (m42 * m14))))) + (m41 * (((m12 * m34) - (m32 * m14))))))));
		HX_STACK_LINE(409)
		this->rawData->__unsafe_set((int)10,(d * ((((m11 * (((m22 * m44) - (m42 * m24)))) - (m21 * (((m12 * m44) - (m42 * m14))))) + (m41 * (((m12 * m24) - (m22 * m14))))))));
		HX_STACK_LINE(410)
		this->rawData->__unsafe_set((int)11,(-(d) * ((((m11 * (((m22 * m34) - (m32 * m24)))) - (m21 * (((m12 * m34) - (m32 * m14))))) + (m31 * (((m12 * m24) - (m22 * m14))))))));
		HX_STACK_LINE(411)
		this->rawData->__unsafe_set((int)12,(-(d) * ((((m21 * (((m32 * m43) - (m42 * m33)))) - (m31 * (((m22 * m43) - (m42 * m23))))) + (m41 * (((m22 * m33) - (m32 * m23))))))));
		HX_STACK_LINE(412)
		this->rawData->__unsafe_set((int)13,(d * ((((m11 * (((m32 * m43) - (m42 * m33)))) - (m31 * (((m12 * m43) - (m42 * m13))))) + (m41 * (((m12 * m33) - (m32 * m13))))))));
		HX_STACK_LINE(413)
		this->rawData->__unsafe_set((int)14,(-(d) * ((((m11 * (((m22 * m43) - (m42 * m23)))) - (m21 * (((m12 * m43) - (m42 * m13))))) + (m41 * (((m12 * m23) - (m22 * m13))))))));
		HX_STACK_LINE(414)
		this->rawData->__unsafe_set((int)15,(d * ((((m11 * (((m22 * m33) - (m32 * m23)))) - (m21 * (((m12 * m33) - (m32 * m13))))) + (m31 * (((m12 * m23) - (m22 * m13))))))));
	}
	HX_STACK_LINE(418)
	return invertable;
}


HX_DEFINE_DYNAMIC_FUNC0(Matrix3D_obj,invert,return )

Void Matrix3D_obj::pointAt( ::openfl::geom::Vector3D pos,::openfl::geom::Vector3D at,::openfl::geom::Vector3D up){
{
		HX_STACK_FRAME("openfl.geom.Matrix3D","pointAt",0xd7900cdb,"openfl.geom.Matrix3D.pointAt","openfl/geom/Matrix3D.hx",423,0x3acce238)
		HX_STACK_THIS(this)
		HX_STACK_ARG(pos,"pos")
		HX_STACK_ARG(at,"at")
		HX_STACK_ARG(up,"up")
		HX_STACK_LINE(425)
		if (((at == null()))){
			HX_STACK_LINE(427)
			::openfl::geom::Vector3D _g = ::openfl::geom::Vector3D_obj::__new((int)0,(int)0,(int)-1,null());		HX_STACK_VAR(_g,"_g");
			HX_STACK_LINE(427)
			at = _g;
		}
		HX_STACK_LINE(431)
		if (((up == null()))){
			HX_STACK_LINE(433)
			::openfl::geom::Vector3D _g1 = ::openfl::geom::Vector3D_obj::__new((int)0,(int)-1,(int)0,null());		HX_STACK_VAR(_g1,"_g1");
			HX_STACK_LINE(433)
			up = _g1;
		}
		HX_STACK_LINE(437)
		::openfl::geom::Vector3D dir = ::openfl::geom::Vector3D_obj::__new((at->x - pos->x),(at->y - pos->y),(at->z - pos->z),null());		HX_STACK_VAR(dir,"dir");
		HX_STACK_LINE(438)
		::openfl::geom::Vector3D vup = ::openfl::geom::Vector3D_obj::__new(up->x,up->y,up->z,up->w);		HX_STACK_VAR(vup,"vup");
		HX_STACK_LINE(439)
		::openfl::geom::Vector3D right;		HX_STACK_VAR(right,"right");
		HX_STACK_LINE(441)
		{
			HX_STACK_LINE(441)
			Float l = ::Math_obj::sqrt((((dir->x * dir->x) + (dir->y * dir->y)) + (dir->z * dir->z)));		HX_STACK_VAR(l,"l");
			HX_STACK_LINE(441)
			if (((l != (int)0))){
				HX_STACK_LINE(441)
				hx::DivEq(dir->x,l);
				HX_STACK_LINE(441)
				hx::DivEq(dir->y,l);
				HX_STACK_LINE(441)
				hx::DivEq(dir->z,l);
			}
			HX_STACK_LINE(441)
			l;
		}
		HX_STACK_LINE(442)
		{
			HX_STACK_LINE(442)
			Float l = ::Math_obj::sqrt((((vup->x * vup->x) + (vup->y * vup->y)) + (vup->z * vup->z)));		HX_STACK_VAR(l,"l");
			HX_STACK_LINE(442)
			if (((l != (int)0))){
				HX_STACK_LINE(442)
				hx::DivEq(vup->x,l);
				HX_STACK_LINE(442)
				hx::DivEq(vup->y,l);
				HX_STACK_LINE(442)
				hx::DivEq(vup->z,l);
			}
			HX_STACK_LINE(442)
			l;
		}
		HX_STACK_LINE(444)
		::openfl::geom::Vector3D dir2 = ::openfl::geom::Vector3D_obj::__new(dir->x,dir->y,dir->z,dir->w);		HX_STACK_VAR(dir2,"dir2");
		HX_STACK_LINE(445)
		{
			HX_STACK_LINE(445)
			Float s = (((vup->x * dir->x) + (vup->y * dir->y)) + (vup->z * dir->z));		HX_STACK_VAR(s,"s");
			HX_STACK_LINE(445)
			hx::MultEq(dir2->x,s);
			HX_STACK_LINE(445)
			hx::MultEq(dir2->y,s);
			HX_STACK_LINE(445)
			hx::MultEq(dir2->z,s);
		}
		HX_STACK_LINE(447)
		::openfl::geom::Vector3D _g2 = ::openfl::geom::Vector3D_obj::__new((vup->x - dir2->x),(vup->y - dir2->y),(vup->z - dir2->z),null());		HX_STACK_VAR(_g2,"_g2");
		HX_STACK_LINE(447)
		vup = _g2;
		HX_STACK_LINE(449)
		Float _g3 = ::Math_obj::sqrt((((vup->x * vup->x) + (vup->y * vup->y)) + (vup->z * vup->z)));		HX_STACK_VAR(_g3,"_g3");
		HX_STACK_LINE(449)
		if (((_g3 > (int)0))){
			HX_STACK_LINE(451)
			Float l = ::Math_obj::sqrt((((vup->x * vup->x) + (vup->y * vup->y)) + (vup->z * vup->z)));		HX_STACK_VAR(l,"l");
			HX_STACK_LINE(451)
			if (((l != (int)0))){
				HX_STACK_LINE(451)
				hx::DivEq(vup->x,l);
				HX_STACK_LINE(451)
				hx::DivEq(vup->y,l);
				HX_STACK_LINE(451)
				hx::DivEq(vup->z,l);
			}
			HX_STACK_LINE(451)
			l;
		}
		else{
			HX_STACK_LINE(455)
			if (((dir->x != (int)0))){
				HX_STACK_LINE(457)
				::openfl::geom::Vector3D _g4 = ::openfl::geom::Vector3D_obj::__new(-(dir->y),dir->x,(int)0,null());		HX_STACK_VAR(_g4,"_g4");
				HX_STACK_LINE(457)
				vup = _g4;
			}
			else{
				HX_STACK_LINE(461)
				::openfl::geom::Vector3D _g5 = ::openfl::geom::Vector3D_obj::__new((int)1,(int)0,(int)0,null());		HX_STACK_VAR(_g5,"_g5");
				HX_STACK_LINE(461)
				vup = _g5;
			}
		}
		HX_STACK_LINE(467)
		::openfl::geom::Vector3D _g6 = ::openfl::geom::Vector3D_obj::__new(((vup->y * dir->z) - (vup->z * dir->y)),((vup->z * dir->x) - (vup->x * dir->z)),((vup->x * dir->y) - (vup->y * dir->x)),(int)1);		HX_STACK_VAR(_g6,"_g6");
		HX_STACK_LINE(467)
		right = _g6;
		HX_STACK_LINE(468)
		{
			HX_STACK_LINE(468)
			Float l = ::Math_obj::sqrt((((right->x * right->x) + (right->y * right->y)) + (right->z * right->z)));		HX_STACK_VAR(l,"l");
			HX_STACK_LINE(468)
			if (((l != (int)0))){
				HX_STACK_LINE(468)
				hx::DivEq(right->x,l);
				HX_STACK_LINE(468)
				hx::DivEq(right->y,l);
				HX_STACK_LINE(468)
				hx::DivEq(right->z,l);
			}
			HX_STACK_LINE(468)
			l;
		}
		HX_STACK_LINE(470)
		this->rawData->__unsafe_set((int)0,right->x);
		HX_STACK_LINE(471)
		this->rawData->__unsafe_set((int)4,right->y);
		HX_STACK_LINE(472)
		this->rawData->__unsafe_set((int)8,right->z);
		HX_STACK_LINE(473)
		this->rawData->__unsafe_set((int)12,0.0);
		HX_STACK_LINE(474)
		this->rawData->__unsafe_set((int)1,vup->x);
		HX_STACK_LINE(475)
		this->rawData->__unsafe_set((int)5,vup->y);
		HX_STACK_LINE(476)
		this->rawData->__unsafe_set((int)9,vup->z);
		HX_STACK_LINE(477)
		this->rawData->__unsafe_set((int)13,0.0);
		HX_STACK_LINE(478)
		this->rawData->__unsafe_set((int)2,dir->x);
		HX_STACK_LINE(479)
		this->rawData->__unsafe_set((int)6,dir->y);
		HX_STACK_LINE(480)
		this->rawData->__unsafe_set((int)10,dir->z);
		HX_STACK_LINE(481)
		this->rawData->__unsafe_set((int)14,0.0);
		HX_STACK_LINE(482)
		this->rawData->__unsafe_set((int)3,pos->x);
		HX_STACK_LINE(483)
		this->rawData->__unsafe_set((int)7,pos->y);
		HX_STACK_LINE(484)
		this->rawData->__unsafe_set((int)11,pos->z);
		HX_STACK_LINE(485)
		this->rawData->__unsafe_set((int)15,1.0);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC3(Matrix3D_obj,pointAt,(void))

Void Matrix3D_obj::prepend( ::openfl::geom::Matrix3D rhs){
{
		HX_STACK_FRAME("openfl.geom.Matrix3D","prepend",0xbe4f0286,"openfl.geom.Matrix3D.prepend","openfl/geom/Matrix3D.hx",490,0x3acce238)
		HX_STACK_THIS(this)
		HX_STACK_ARG(rhs,"rhs")
		HX_STACK_LINE(492)
		Float m111 = rhs->rawData->__unsafe_get((int)0);		HX_STACK_VAR(m111,"m111");
		HX_STACK_LINE(492)
		Float m121 = rhs->rawData->__unsafe_get((int)4);		HX_STACK_VAR(m121,"m121");
		HX_STACK_LINE(492)
		Float m131 = rhs->rawData->__unsafe_get((int)8);		HX_STACK_VAR(m131,"m131");
		HX_STACK_LINE(492)
		Float m141 = rhs->rawData->__unsafe_get((int)12);		HX_STACK_VAR(m141,"m141");
		HX_STACK_LINE(493)
		Float m112 = rhs->rawData->__unsafe_get((int)1);		HX_STACK_VAR(m112,"m112");
		HX_STACK_LINE(493)
		Float m122 = rhs->rawData->__unsafe_get((int)5);		HX_STACK_VAR(m122,"m122");
		HX_STACK_LINE(493)
		Float m132 = rhs->rawData->__unsafe_get((int)9);		HX_STACK_VAR(m132,"m132");
		HX_STACK_LINE(493)
		Float m142 = rhs->rawData->__unsafe_get((int)13);		HX_STACK_VAR(m142,"m142");
		HX_STACK_LINE(494)
		Float m113 = rhs->rawData->__unsafe_get((int)2);		HX_STACK_VAR(m113,"m113");
		HX_STACK_LINE(494)
		Float m123 = rhs->rawData->__unsafe_get((int)6);		HX_STACK_VAR(m123,"m123");
		HX_STACK_LINE(494)
		Float m133 = rhs->rawData->__unsafe_get((int)10);		HX_STACK_VAR(m133,"m133");
		HX_STACK_LINE(494)
		Float m143 = rhs->rawData->__unsafe_get((int)14);		HX_STACK_VAR(m143,"m143");
		HX_STACK_LINE(495)
		Float m114 = rhs->rawData->__unsafe_get((int)3);		HX_STACK_VAR(m114,"m114");
		HX_STACK_LINE(495)
		Float m124 = rhs->rawData->__unsafe_get((int)7);		HX_STACK_VAR(m124,"m124");
		HX_STACK_LINE(495)
		Float m134 = rhs->rawData->__unsafe_get((int)11);		HX_STACK_VAR(m134,"m134");
		HX_STACK_LINE(495)
		Float m144 = rhs->rawData->__unsafe_get((int)15);		HX_STACK_VAR(m144,"m144");
		HX_STACK_LINE(496)
		Float m211 = this->rawData->__unsafe_get((int)0);		HX_STACK_VAR(m211,"m211");
		HX_STACK_LINE(496)
		Float m221 = this->rawData->__unsafe_get((int)4);		HX_STACK_VAR(m221,"m221");
		HX_STACK_LINE(496)
		Float m231 = this->rawData->__unsafe_get((int)8);		HX_STACK_VAR(m231,"m231");
		HX_STACK_LINE(496)
		Float m241 = this->rawData->__unsafe_get((int)12);		HX_STACK_VAR(m241,"m241");
		HX_STACK_LINE(497)
		Float m212 = this->rawData->__unsafe_get((int)1);		HX_STACK_VAR(m212,"m212");
		HX_STACK_LINE(497)
		Float m222 = this->rawData->__unsafe_get((int)5);		HX_STACK_VAR(m222,"m222");
		HX_STACK_LINE(497)
		Float m232 = this->rawData->__unsafe_get((int)9);		HX_STACK_VAR(m232,"m232");
		HX_STACK_LINE(497)
		Float m242 = this->rawData->__unsafe_get((int)13);		HX_STACK_VAR(m242,"m242");
		HX_STACK_LINE(498)
		Float m213 = this->rawData->__unsafe_get((int)2);		HX_STACK_VAR(m213,"m213");
		HX_STACK_LINE(498)
		Float m223 = this->rawData->__unsafe_get((int)6);		HX_STACK_VAR(m223,"m223");
		HX_STACK_LINE(498)
		Float m233 = this->rawData->__unsafe_get((int)10);		HX_STACK_VAR(m233,"m233");
		HX_STACK_LINE(498)
		Float m243 = this->rawData->__unsafe_get((int)14);		HX_STACK_VAR(m243,"m243");
		HX_STACK_LINE(499)
		Float m214 = this->rawData->__unsafe_get((int)3);		HX_STACK_VAR(m214,"m214");
		HX_STACK_LINE(499)
		Float m224 = this->rawData->__unsafe_get((int)7);		HX_STACK_VAR(m224,"m224");
		HX_STACK_LINE(499)
		Float m234 = this->rawData->__unsafe_get((int)11);		HX_STACK_VAR(m234,"m234");
		HX_STACK_LINE(499)
		Float m244 = this->rawData->__unsafe_get((int)15);		HX_STACK_VAR(m244,"m244");
		HX_STACK_LINE(501)
		this->rawData->__unsafe_set((int)0,((((m111 * m211) + (m112 * m221)) + (m113 * m231)) + (m114 * m241)));
		HX_STACK_LINE(502)
		this->rawData->__unsafe_set((int)1,((((m111 * m212) + (m112 * m222)) + (m113 * m232)) + (m114 * m242)));
		HX_STACK_LINE(503)
		this->rawData->__unsafe_set((int)2,((((m111 * m213) + (m112 * m223)) + (m113 * m233)) + (m114 * m243)));
		HX_STACK_LINE(504)
		this->rawData->__unsafe_set((int)3,((((m111 * m214) + (m112 * m224)) + (m113 * m234)) + (m114 * m244)));
		HX_STACK_LINE(506)
		this->rawData->__unsafe_set((int)4,((((m121 * m211) + (m122 * m221)) + (m123 * m231)) + (m124 * m241)));
		HX_STACK_LINE(507)
		this->rawData->__unsafe_set((int)5,((((m121 * m212) + (m122 * m222)) + (m123 * m232)) + (m124 * m242)));
		HX_STACK_LINE(508)
		this->rawData->__unsafe_set((int)6,((((m121 * m213) + (m122 * m223)) + (m123 * m233)) + (m124 * m243)));
		HX_STACK_LINE(509)
		this->rawData->__unsafe_set((int)7,((((m121 * m214) + (m122 * m224)) + (m123 * m234)) + (m124 * m244)));
		HX_STACK_LINE(511)
		this->rawData->__unsafe_set((int)8,((((m131 * m211) + (m132 * m221)) + (m133 * m231)) + (m134 * m241)));
		HX_STACK_LINE(512)
		this->rawData->__unsafe_set((int)9,((((m131 * m212) + (m132 * m222)) + (m133 * m232)) + (m134 * m242)));
		HX_STACK_LINE(513)
		this->rawData->__unsafe_set((int)10,((((m131 * m213) + (m132 * m223)) + (m133 * m233)) + (m134 * m243)));
		HX_STACK_LINE(514)
		this->rawData->__unsafe_set((int)11,((((m131 * m214) + (m132 * m224)) + (m133 * m234)) + (m134 * m244)));
		HX_STACK_LINE(516)
		this->rawData->__unsafe_set((int)12,((((m141 * m211) + (m142 * m221)) + (m143 * m231)) + (m144 * m241)));
		HX_STACK_LINE(517)
		this->rawData->__unsafe_set((int)13,((((m141 * m212) + (m142 * m222)) + (m143 * m232)) + (m144 * m242)));
		HX_STACK_LINE(518)
		this->rawData->__unsafe_set((int)14,((((m141 * m213) + (m142 * m223)) + (m143 * m233)) + (m144 * m243)));
		HX_STACK_LINE(519)
		this->rawData->__unsafe_set((int)15,((((m141 * m214) + (m142 * m224)) + (m143 * m234)) + (m144 * m244)));
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC1(Matrix3D_obj,prepend,(void))

Void Matrix3D_obj::prependRotation( Float degrees,::openfl::geom::Vector3D axis,::openfl::geom::Vector3D pivotPoint){
{
		HX_STACK_FRAME("openfl.geom.Matrix3D","prependRotation",0x54b5f1e4,"openfl.geom.Matrix3D.prependRotation","openfl/geom/Matrix3D.hx",524,0x3acce238)
		HX_STACK_THIS(this)
		HX_STACK_ARG(degrees,"degrees")
		HX_STACK_ARG(axis,"axis")
		HX_STACK_ARG(pivotPoint,"pivotPoint")
		HX_STACK_LINE(526)
		::openfl::geom::Matrix3D m = ::openfl::geom::Matrix3D_obj::getAxisRotation(axis->x,axis->y,axis->z,degrees);		HX_STACK_VAR(m,"m");
		HX_STACK_LINE(528)
		if (((pivotPoint != null()))){
			HX_STACK_LINE(530)
			::openfl::geom::Vector3D p = pivotPoint;		HX_STACK_VAR(p,"p");
			HX_STACK_LINE(531)
			m->appendTranslation(p->x,p->y,p->z);
		}
		HX_STACK_LINE(535)
		this->prepend(m);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC3(Matrix3D_obj,prependRotation,(void))

Void Matrix3D_obj::prependScale( Float xScale,Float yScale,Float zScale){
{
		HX_STACK_FRAME("openfl.geom.Matrix3D","prependScale",0x59d85624,"openfl.geom.Matrix3D.prependScale","openfl/geom/Matrix3D.hx",540,0x3acce238)
		HX_STACK_THIS(this)
		HX_STACK_ARG(xScale,"xScale")
		HX_STACK_ARG(yScale,"yScale")
		HX_STACK_ARG(zScale,"zScale")
		HX_STACK_LINE(542)
		::openfl::geom::Matrix3D _g = ::openfl::geom::Matrix3D_obj::__new(Array_obj< Float >::__new().Add(xScale).Add(0.0).Add(0.0).Add(0.0).Add(0.0).Add(yScale).Add(0.0).Add(0.0).Add(0.0).Add(0.0).Add(zScale).Add(0.0).Add(0.0).Add(0.0).Add(0.0).Add(1.0));		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(542)
		this->prepend(_g);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC3(Matrix3D_obj,prependScale,(void))

Void Matrix3D_obj::prependTranslation( Float x,Float y,Float z){
{
		HX_STACK_FRAME("openfl.geom.Matrix3D","prependTranslation",0x2df4680b,"openfl.geom.Matrix3D.prependTranslation","openfl/geom/Matrix3D.hx",547,0x3acce238)
		HX_STACK_THIS(this)
		HX_STACK_ARG(x,"x")
		HX_STACK_ARG(y,"y")
		HX_STACK_ARG(z,"z")
		HX_STACK_LINE(549)
		::openfl::geom::Matrix3D m = ::openfl::geom::Matrix3D_obj::__new(null());		HX_STACK_VAR(m,"m");
		HX_STACK_LINE(550)
		::openfl::geom::Vector3D _g = ::openfl::geom::Vector3D_obj::__new(x,y,z,null());		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(550)
		m->set_position(_g);
		HX_STACK_LINE(551)
		this->prepend(m);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC3(Matrix3D_obj,prependTranslation,(void))

bool Matrix3D_obj::recompose( Array< ::Dynamic > components){
	HX_STACK_FRAME("openfl.geom.Matrix3D","recompose",0xd355bb37,"openfl.geom.Matrix3D.recompose","openfl/geom/Matrix3D.hx",556,0x3acce238)
	HX_STACK_THIS(this)
	HX_STACK_ARG(components,"components")
	HX_STACK_LINE(558)
	if (((bool((bool((bool((components->length < (int)3)) || bool((components->__unsafe_get((int)2)->__Field(HX_CSTRING("x"),true) == (int)0)))) || bool((components->__unsafe_get((int)2)->__Field(HX_CSTRING("y"),true) == (int)0)))) || bool((components->__unsafe_get((int)2)->__Field(HX_CSTRING("z"),true) == (int)0))))){
		HX_STACK_LINE(558)
		return false;
	}
	HX_STACK_LINE(560)
	this->identity();
	HX_STACK_LINE(561)
	this->appendScale(components->__unsafe_get((int)2)->__Field(HX_CSTRING("x"),true),components->__unsafe_get((int)2)->__Field(HX_CSTRING("y"),true),components->__unsafe_get((int)2)->__Field(HX_CSTRING("z"),true));
	HX_STACK_LINE(563)
	Float angle;		HX_STACK_VAR(angle,"angle");
	HX_STACK_LINE(564)
	angle = -(components->__unsafe_get((int)1)->__Field(HX_CSTRING("x"),true));
	HX_STACK_LINE(565)
	Float _g = ::Math_obj::cos(angle);		HX_STACK_VAR(_g,"_g");
	HX_STACK_LINE(565)
	Float _g1 = -(::Math_obj::sin(angle));		HX_STACK_VAR(_g1,"_g1");
	HX_STACK_LINE(565)
	Float _g2 = ::Math_obj::sin(angle);		HX_STACK_VAR(_g2,"_g2");
	HX_STACK_LINE(565)
	Float _g3 = ::Math_obj::cos(angle);		HX_STACK_VAR(_g3,"_g3");
	HX_STACK_LINE(565)
	Array< Float > _g4 = Array_obj< Float >::__new().Add((int)1).Add((int)0).Add((int)0).Add((int)0).Add((int)0).Add(_g).Add(_g1).Add((int)0).Add((int)0).Add(_g2).Add(_g3).Add((int)0).Add((int)0).Add((int)0).Add((int)0).Add((int)0);		HX_STACK_VAR(_g4,"_g4");
	HX_STACK_LINE(565)
	::openfl::geom::Matrix3D _g5 = ::openfl::geom::Matrix3D_obj::__new(_g4);		HX_STACK_VAR(_g5,"_g5");
	HX_STACK_LINE(565)
	this->append(_g5);
	HX_STACK_LINE(566)
	angle = -(components->__unsafe_get((int)1)->__Field(HX_CSTRING("y"),true));
	HX_STACK_LINE(567)
	Float _g6 = ::Math_obj::cos(angle);		HX_STACK_VAR(_g6,"_g6");
	HX_STACK_LINE(567)
	Float _g7 = ::Math_obj::sin(angle);		HX_STACK_VAR(_g7,"_g7");
	HX_STACK_LINE(567)
	Float _g8 = -(::Math_obj::sin(angle));		HX_STACK_VAR(_g8,"_g8");
	HX_STACK_LINE(567)
	Float _g9 = ::Math_obj::cos(angle);		HX_STACK_VAR(_g9,"_g9");
	HX_STACK_LINE(567)
	Array< Float > _g10 = Array_obj< Float >::__new().Add(_g6).Add((int)0).Add(_g7).Add((int)0).Add((int)0).Add((int)1).Add((int)0).Add((int)0).Add(_g8).Add((int)0).Add(_g9).Add((int)0).Add((int)0).Add((int)0).Add((int)0).Add((int)0);		HX_STACK_VAR(_g10,"_g10");
	HX_STACK_LINE(567)
	::openfl::geom::Matrix3D _g11 = ::openfl::geom::Matrix3D_obj::__new(_g10);		HX_STACK_VAR(_g11,"_g11");
	HX_STACK_LINE(567)
	this->append(_g11);
	HX_STACK_LINE(568)
	angle = -(components->__unsafe_get((int)1)->__Field(HX_CSTRING("z"),true));
	HX_STACK_LINE(569)
	Float _g12 = ::Math_obj::cos(angle);		HX_STACK_VAR(_g12,"_g12");
	HX_STACK_LINE(569)
	Float _g13 = -(::Math_obj::sin(angle));		HX_STACK_VAR(_g13,"_g13");
	HX_STACK_LINE(569)
	Float _g14 = ::Math_obj::sin(angle);		HX_STACK_VAR(_g14,"_g14");
	HX_STACK_LINE(569)
	Float _g15 = ::Math_obj::cos(angle);		HX_STACK_VAR(_g15,"_g15");
	HX_STACK_LINE(569)
	Array< Float > _g16 = Array_obj< Float >::__new().Add(_g12).Add(_g13).Add((int)0).Add((int)0).Add(_g14).Add(_g15).Add((int)0).Add((int)0).Add((int)0).Add((int)0).Add((int)1).Add((int)0).Add((int)0).Add((int)0).Add((int)0).Add((int)0);		HX_STACK_VAR(_g16,"_g16");
	HX_STACK_LINE(569)
	::openfl::geom::Matrix3D _g17 = ::openfl::geom::Matrix3D_obj::__new(_g16);		HX_STACK_VAR(_g17,"_g17");
	HX_STACK_LINE(569)
	this->append(_g17);
	HX_STACK_LINE(571)
	::openfl::geom::Vector3D _g18 = components->__unsafe_get((int)0);		HX_STACK_VAR(_g18,"_g18");
	HX_STACK_LINE(571)
	this->set_position(_g18);
	HX_STACK_LINE(572)
	this->rawData->__unsafe_set((int)15,(int)1);
	HX_STACK_LINE(574)
	return true;
}


HX_DEFINE_DYNAMIC_FUNC1(Matrix3D_obj,recompose,return )

::openfl::geom::Vector3D Matrix3D_obj::transformVector( ::openfl::geom::Vector3D v){
	HX_STACK_FRAME("openfl.geom.Matrix3D","transformVector",0x3f2dcec7,"openfl.geom.Matrix3D.transformVector","openfl/geom/Matrix3D.hx",579,0x3acce238)
	HX_STACK_THIS(this)
	HX_STACK_ARG(v,"v")
	HX_STACK_LINE(581)
	Float x = v->x;		HX_STACK_VAR(x,"x");
	HX_STACK_LINE(581)
	Float y = v->y;		HX_STACK_VAR(y,"y");
	HX_STACK_LINE(581)
	Float z = v->z;		HX_STACK_VAR(z,"z");
	HX_STACK_LINE(584)
	Float _g = this->rawData->__unsafe_get((int)0);		HX_STACK_VAR(_g,"_g");
	HX_STACK_LINE(584)
	Float _g1 = (x * _g);		HX_STACK_VAR(_g1,"_g1");
	HX_STACK_LINE(584)
	Float _g2 = this->rawData->__unsafe_get((int)4);		HX_STACK_VAR(_g2,"_g2");
	HX_STACK_LINE(584)
	Float _g3 = (y * _g2);		HX_STACK_VAR(_g3,"_g3");
	HX_STACK_LINE(584)
	Float _g4 = (_g1 + _g3);		HX_STACK_VAR(_g4,"_g4");
	HX_STACK_LINE(584)
	Float _g5 = this->rawData->__unsafe_get((int)8);		HX_STACK_VAR(_g5,"_g5");
	HX_STACK_LINE(584)
	Float _g6 = (z * _g5);		HX_STACK_VAR(_g6,"_g6");
	HX_STACK_LINE(584)
	Float _g7 = (_g4 + _g6);		HX_STACK_VAR(_g7,"_g7");
	HX_STACK_LINE(584)
	Float _g8 = this->rawData->__unsafe_get((int)12);		HX_STACK_VAR(_g8,"_g8");
	HX_STACK_LINE(584)
	Float _g9 = (_g7 + _g8);		HX_STACK_VAR(_g9,"_g9");
	HX_STACK_LINE(585)
	Float _g10 = this->rawData->__unsafe_get((int)1);		HX_STACK_VAR(_g10,"_g10");
	HX_STACK_LINE(585)
	Float _g11 = (x * _g10);		HX_STACK_VAR(_g11,"_g11");
	HX_STACK_LINE(585)
	Float _g12 = this->rawData->__unsafe_get((int)5);		HX_STACK_VAR(_g12,"_g12");
	HX_STACK_LINE(585)
	Float _g13 = (y * _g12);		HX_STACK_VAR(_g13,"_g13");
	HX_STACK_LINE(585)
	Float _g14 = (_g11 + _g13);		HX_STACK_VAR(_g14,"_g14");
	HX_STACK_LINE(585)
	Float _g15 = this->rawData->__unsafe_get((int)9);		HX_STACK_VAR(_g15,"_g15");
	HX_STACK_LINE(585)
	Float _g16 = (z * _g15);		HX_STACK_VAR(_g16,"_g16");
	HX_STACK_LINE(585)
	Float _g17 = (_g14 + _g16);		HX_STACK_VAR(_g17,"_g17");
	HX_STACK_LINE(585)
	Float _g18 = this->rawData->__unsafe_get((int)13);		HX_STACK_VAR(_g18,"_g18");
	HX_STACK_LINE(585)
	Float _g19 = (_g17 + _g18);		HX_STACK_VAR(_g19,"_g19");
	HX_STACK_LINE(586)
	Float _g20 = this->rawData->__unsafe_get((int)2);		HX_STACK_VAR(_g20,"_g20");
	HX_STACK_LINE(586)
	Float _g21 = (x * _g20);		HX_STACK_VAR(_g21,"_g21");
	HX_STACK_LINE(586)
	Float _g22 = this->rawData->__unsafe_get((int)6);		HX_STACK_VAR(_g22,"_g22");
	HX_STACK_LINE(586)
	Float _g23 = (y * _g22);		HX_STACK_VAR(_g23,"_g23");
	HX_STACK_LINE(586)
	Float _g24 = (_g21 + _g23);		HX_STACK_VAR(_g24,"_g24");
	HX_STACK_LINE(586)
	Float _g25 = this->rawData->__unsafe_get((int)10);		HX_STACK_VAR(_g25,"_g25");
	HX_STACK_LINE(586)
	Float _g26 = (z * _g25);		HX_STACK_VAR(_g26,"_g26");
	HX_STACK_LINE(586)
	Float _g27 = (_g24 + _g26);		HX_STACK_VAR(_g27,"_g27");
	HX_STACK_LINE(586)
	Float _g28 = this->rawData->__unsafe_get((int)14);		HX_STACK_VAR(_g28,"_g28");
	HX_STACK_LINE(586)
	Float _g29 = (_g27 + _g28);		HX_STACK_VAR(_g29,"_g29");
	HX_STACK_LINE(583)
	return ::openfl::geom::Vector3D_obj::__new(_g9,_g19,_g29,(int)1);
}


HX_DEFINE_DYNAMIC_FUNC1(Matrix3D_obj,transformVector,return )

Void Matrix3D_obj::transformVectors( Array< Float > vin,Array< Float > vout){
{
		HX_STACK_FRAME("openfl.geom.Matrix3D","transformVectors",0x08e71fcc,"openfl.geom.Matrix3D.transformVectors","openfl/geom/Matrix3D.hx",592,0x3acce238)
		HX_STACK_THIS(this)
		HX_STACK_ARG(vin,"vin")
		HX_STACK_ARG(vout,"vout")
		HX_STACK_LINE(594)
		int i = (int)0;		HX_STACK_VAR(i,"i");
		HX_STACK_LINE(595)
		Float x;		HX_STACK_VAR(x,"x");
		HX_STACK_LINE(595)
		Float y;		HX_STACK_VAR(y,"y");
		HX_STACK_LINE(595)
		Float z;		HX_STACK_VAR(z,"z");
		HX_STACK_LINE(597)
		while((true)){
			HX_STACK_LINE(597)
			if ((!((((i + (int)3) <= vin->length))))){
				HX_STACK_LINE(597)
				break;
			}
			HX_STACK_LINE(599)
			Float _g = vin->__unsafe_get(i);		HX_STACK_VAR(_g,"_g");
			HX_STACK_LINE(599)
			x = _g;
			HX_STACK_LINE(600)
			Float _g1 = vin->__unsafe_get((i + (int)1));		HX_STACK_VAR(_g1,"_g1");
			HX_STACK_LINE(600)
			y = _g1;
			HX_STACK_LINE(601)
			Float _g2 = vin->__unsafe_get((i + (int)2));		HX_STACK_VAR(_g2,"_g2");
			HX_STACK_LINE(601)
			z = _g2;
			HX_STACK_LINE(602)
			{
				HX_STACK_LINE(602)
				Float _g3 = this->rawData->__unsafe_get((int)0);		HX_STACK_VAR(_g3,"_g3");
				HX_STACK_LINE(602)
				Float _g4 = (x * _g3);		HX_STACK_VAR(_g4,"_g4");
				HX_STACK_LINE(602)
				Float _g5 = this->rawData->__unsafe_get((int)4);		HX_STACK_VAR(_g5,"_g5");
				HX_STACK_LINE(602)
				Float _g6 = (y * _g5);		HX_STACK_VAR(_g6,"_g6");
				HX_STACK_LINE(602)
				Float _g7 = (_g4 + _g6);		HX_STACK_VAR(_g7,"_g7");
				HX_STACK_LINE(602)
				Float _g8 = this->rawData->__unsafe_get((int)8);		HX_STACK_VAR(_g8,"_g8");
				HX_STACK_LINE(602)
				Float _g9 = (z * _g8);		HX_STACK_VAR(_g9,"_g9");
				HX_STACK_LINE(602)
				Float _g10 = (_g7 + _g9);		HX_STACK_VAR(_g10,"_g10");
				HX_STACK_LINE(602)
				Float _g11 = this->rawData->__unsafe_get((int)12);		HX_STACK_VAR(_g11,"_g11");
				HX_STACK_LINE(602)
				Float value = (_g10 + _g11);		HX_STACK_VAR(value,"value");
				HX_STACK_LINE(602)
				vout->__unsafe_set(i,value);
			}
			HX_STACK_LINE(603)
			{
				HX_STACK_LINE(603)
				Float _g12 = this->rawData->__unsafe_get((int)1);		HX_STACK_VAR(_g12,"_g12");
				HX_STACK_LINE(603)
				Float _g13 = (x * _g12);		HX_STACK_VAR(_g13,"_g13");
				HX_STACK_LINE(603)
				Float _g14 = this->rawData->__unsafe_get((int)5);		HX_STACK_VAR(_g14,"_g14");
				HX_STACK_LINE(603)
				Float _g15 = (y * _g14);		HX_STACK_VAR(_g15,"_g15");
				HX_STACK_LINE(603)
				Float _g16 = (_g13 + _g15);		HX_STACK_VAR(_g16,"_g16");
				HX_STACK_LINE(603)
				Float _g17 = this->rawData->__unsafe_get((int)9);		HX_STACK_VAR(_g17,"_g17");
				HX_STACK_LINE(603)
				Float _g18 = (z * _g17);		HX_STACK_VAR(_g18,"_g18");
				HX_STACK_LINE(603)
				Float _g19 = (_g16 + _g18);		HX_STACK_VAR(_g19,"_g19");
				HX_STACK_LINE(603)
				Float _g20 = this->rawData->__unsafe_get((int)13);		HX_STACK_VAR(_g20,"_g20");
				HX_STACK_LINE(603)
				Float value = (_g19 + _g20);		HX_STACK_VAR(value,"value");
				HX_STACK_LINE(603)
				vout->__unsafe_set((i + (int)1),value);
			}
			HX_STACK_LINE(604)
			{
				HX_STACK_LINE(604)
				Float _g21 = this->rawData->__unsafe_get((int)2);		HX_STACK_VAR(_g21,"_g21");
				HX_STACK_LINE(604)
				Float _g22 = (x * _g21);		HX_STACK_VAR(_g22,"_g22");
				HX_STACK_LINE(604)
				Float _g23 = this->rawData->__unsafe_get((int)6);		HX_STACK_VAR(_g23,"_g23");
				HX_STACK_LINE(604)
				Float _g24 = (y * _g23);		HX_STACK_VAR(_g24,"_g24");
				HX_STACK_LINE(604)
				Float _g25 = (_g22 + _g24);		HX_STACK_VAR(_g25,"_g25");
				HX_STACK_LINE(604)
				Float _g26 = this->rawData->__unsafe_get((int)10);		HX_STACK_VAR(_g26,"_g26");
				HX_STACK_LINE(604)
				Float _g27 = (z * _g26);		HX_STACK_VAR(_g27,"_g27");
				HX_STACK_LINE(604)
				Float _g28 = (_g25 + _g27);		HX_STACK_VAR(_g28,"_g28");
				HX_STACK_LINE(604)
				Float _g29 = this->rawData->__unsafe_get((int)14);		HX_STACK_VAR(_g29,"_g29");
				HX_STACK_LINE(604)
				Float value = (_g28 + _g29);		HX_STACK_VAR(value,"value");
				HX_STACK_LINE(604)
				vout->__unsafe_set((i + (int)2),value);
			}
			HX_STACK_LINE(605)
			hx::AddEq(i,(int)3);
		}
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC2(Matrix3D_obj,transformVectors,(void))

Void Matrix3D_obj::transpose( ){
{
		HX_STACK_FRAME("openfl.geom.Matrix3D","transpose",0x1ba989f1,"openfl.geom.Matrix3D.transpose","openfl/geom/Matrix3D.hx",612,0x3acce238)
		HX_STACK_THIS(this)
		HX_STACK_LINE(614)
		Array< Float > oRawData = this->rawData->copy();		HX_STACK_VAR(oRawData,"oRawData");
		HX_STACK_LINE(615)
		{
			HX_STACK_LINE(615)
			Float value = oRawData->__unsafe_get((int)4);		HX_STACK_VAR(value,"value");
			HX_STACK_LINE(615)
			this->rawData->__unsafe_set((int)1,value);
		}
		HX_STACK_LINE(616)
		{
			HX_STACK_LINE(616)
			Float value = oRawData->__unsafe_get((int)8);		HX_STACK_VAR(value,"value");
			HX_STACK_LINE(616)
			this->rawData->__unsafe_set((int)2,value);
		}
		HX_STACK_LINE(617)
		{
			HX_STACK_LINE(617)
			Float value = oRawData->__unsafe_get((int)12);		HX_STACK_VAR(value,"value");
			HX_STACK_LINE(617)
			this->rawData->__unsafe_set((int)3,value);
		}
		HX_STACK_LINE(618)
		{
			HX_STACK_LINE(618)
			Float value = oRawData->__unsafe_get((int)1);		HX_STACK_VAR(value,"value");
			HX_STACK_LINE(618)
			this->rawData->__unsafe_set((int)4,value);
		}
		HX_STACK_LINE(619)
		{
			HX_STACK_LINE(619)
			Float value = oRawData->__unsafe_get((int)9);		HX_STACK_VAR(value,"value");
			HX_STACK_LINE(619)
			this->rawData->__unsafe_set((int)6,value);
		}
		HX_STACK_LINE(620)
		{
			HX_STACK_LINE(620)
			Float value = oRawData->__unsafe_get((int)13);		HX_STACK_VAR(value,"value");
			HX_STACK_LINE(620)
			this->rawData->__unsafe_set((int)7,value);
		}
		HX_STACK_LINE(621)
		{
			HX_STACK_LINE(621)
			Float value = oRawData->__unsafe_get((int)2);		HX_STACK_VAR(value,"value");
			HX_STACK_LINE(621)
			this->rawData->__unsafe_set((int)8,value);
		}
		HX_STACK_LINE(622)
		{
			HX_STACK_LINE(622)
			Float value = oRawData->__unsafe_get((int)6);		HX_STACK_VAR(value,"value");
			HX_STACK_LINE(622)
			this->rawData->__unsafe_set((int)9,value);
		}
		HX_STACK_LINE(623)
		{
			HX_STACK_LINE(623)
			Float value = oRawData->__unsafe_get((int)14);		HX_STACK_VAR(value,"value");
			HX_STACK_LINE(623)
			this->rawData->__unsafe_set((int)11,value);
		}
		HX_STACK_LINE(624)
		{
			HX_STACK_LINE(624)
			Float value = oRawData->__unsafe_get((int)3);		HX_STACK_VAR(value,"value");
			HX_STACK_LINE(624)
			this->rawData->__unsafe_set((int)12,value);
		}
		HX_STACK_LINE(625)
		{
			HX_STACK_LINE(625)
			Float value = oRawData->__unsafe_get((int)7);		HX_STACK_VAR(value,"value");
			HX_STACK_LINE(625)
			this->rawData->__unsafe_set((int)13,value);
		}
		HX_STACK_LINE(626)
		{
			HX_STACK_LINE(626)
			Float value = oRawData->__unsafe_get((int)11);		HX_STACK_VAR(value,"value");
			HX_STACK_LINE(626)
			this->rawData->__unsafe_set((int)14,value);
		}
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Matrix3D_obj,transpose,(void))

Float Matrix3D_obj::get_determinant( ){
	HX_STACK_FRAME("openfl.geom.Matrix3D","get_determinant",0x5f71b8a4,"openfl.geom.Matrix3D.get_determinant","openfl/geom/Matrix3D.hx",638,0x3acce238)
	HX_STACK_THIS(this)
	HX_STACK_LINE(640)
	Float _g = this->rawData->__unsafe_get((int)0);		HX_STACK_VAR(_g,"_g");
	HX_STACK_LINE(640)
	Float _g1 = this->rawData->__unsafe_get((int)5);		HX_STACK_VAR(_g1,"_g1");
	HX_STACK_LINE(640)
	Float _g2 = (_g * _g1);		HX_STACK_VAR(_g2,"_g2");
	HX_STACK_LINE(640)
	Float _g3 = this->rawData->__unsafe_get((int)4);		HX_STACK_VAR(_g3,"_g3");
	HX_STACK_LINE(640)
	Float _g4 = this->rawData->__unsafe_get((int)1);		HX_STACK_VAR(_g4,"_g4");
	HX_STACK_LINE(640)
	Float _g5 = (_g3 * _g4);		HX_STACK_VAR(_g5,"_g5");
	HX_STACK_LINE(640)
	Float _g6 = (_g2 - _g5);		HX_STACK_VAR(_g6,"_g6");
	HX_STACK_LINE(640)
	Float _g7 = this->rawData->__unsafe_get((int)10);		HX_STACK_VAR(_g7,"_g7");
	HX_STACK_LINE(640)
	Float _g8 = this->rawData->__unsafe_get((int)15);		HX_STACK_VAR(_g8,"_g8");
	HX_STACK_LINE(640)
	Float _g9 = (_g7 * _g8);		HX_STACK_VAR(_g9,"_g9");
	HX_STACK_LINE(640)
	Float _g10 = this->rawData->__unsafe_get((int)14);		HX_STACK_VAR(_g10,"_g10");
	HX_STACK_LINE(640)
	Float _g11 = this->rawData->__unsafe_get((int)11);		HX_STACK_VAR(_g11,"_g11");
	HX_STACK_LINE(640)
	Float _g12 = (_g10 * _g11);		HX_STACK_VAR(_g12,"_g12");
	HX_STACK_LINE(640)
	Float _g13 = (_g9 - _g12);		HX_STACK_VAR(_g13,"_g13");
	HX_STACK_LINE(640)
	Float _g14 = (_g6 * _g13);		HX_STACK_VAR(_g14,"_g14");
	HX_STACK_LINE(641)
	Float _g15 = this->rawData->__unsafe_get((int)0);		HX_STACK_VAR(_g15,"_g15");
	HX_STACK_LINE(641)
	Float _g16 = this->rawData->__unsafe_get((int)9);		HX_STACK_VAR(_g16,"_g16");
	HX_STACK_LINE(641)
	Float _g17 = (_g15 * _g16);		HX_STACK_VAR(_g17,"_g17");
	HX_STACK_LINE(641)
	Float _g18 = this->rawData->__unsafe_get((int)8);		HX_STACK_VAR(_g18,"_g18");
	HX_STACK_LINE(641)
	Float _g19 = this->rawData->__unsafe_get((int)1);		HX_STACK_VAR(_g19,"_g19");
	HX_STACK_LINE(641)
	Float _g20 = (_g18 * _g19);		HX_STACK_VAR(_g20,"_g20");
	HX_STACK_LINE(641)
	Float _g21 = (_g17 - _g20);		HX_STACK_VAR(_g21,"_g21");
	HX_STACK_LINE(641)
	Float _g22 = this->rawData->__unsafe_get((int)6);		HX_STACK_VAR(_g22,"_g22");
	HX_STACK_LINE(641)
	Float _g23 = this->rawData->__unsafe_get((int)15);		HX_STACK_VAR(_g23,"_g23");
	HX_STACK_LINE(641)
	Float _g24 = (_g22 * _g23);		HX_STACK_VAR(_g24,"_g24");
	HX_STACK_LINE(641)
	Float _g25 = this->rawData->__unsafe_get((int)14);		HX_STACK_VAR(_g25,"_g25");
	HX_STACK_LINE(641)
	Float _g26 = this->rawData->__unsafe_get((int)7);		HX_STACK_VAR(_g26,"_g26");
	HX_STACK_LINE(641)
	Float _g27 = (_g25 * _g26);		HX_STACK_VAR(_g27,"_g27");
	HX_STACK_LINE(641)
	Float _g28 = (_g24 - _g27);		HX_STACK_VAR(_g28,"_g28");
	HX_STACK_LINE(641)
	Float _g29 = (_g21 * _g28);		HX_STACK_VAR(_g29,"_g29");
	HX_STACK_LINE(640)
	Float _g30 = (_g14 - _g29);		HX_STACK_VAR(_g30,"_g30");
	HX_STACK_LINE(642)
	Float _g31 = this->rawData->__unsafe_get((int)0);		HX_STACK_VAR(_g31,"_g31");
	HX_STACK_LINE(642)
	Float _g32 = this->rawData->__unsafe_get((int)13);		HX_STACK_VAR(_g32,"_g32");
	HX_STACK_LINE(642)
	Float _g33 = (_g31 * _g32);		HX_STACK_VAR(_g33,"_g33");
	HX_STACK_LINE(642)
	Float _g34 = this->rawData->__unsafe_get((int)12);		HX_STACK_VAR(_g34,"_g34");
	HX_STACK_LINE(642)
	Float _g35 = this->rawData->__unsafe_get((int)1);		HX_STACK_VAR(_g35,"_g35");
	HX_STACK_LINE(642)
	Float _g36 = (_g34 * _g35);		HX_STACK_VAR(_g36,"_g36");
	HX_STACK_LINE(642)
	Float _g37 = (_g33 - _g36);		HX_STACK_VAR(_g37,"_g37");
	HX_STACK_LINE(642)
	Float _g38 = this->rawData->__unsafe_get((int)6);		HX_STACK_VAR(_g38,"_g38");
	HX_STACK_LINE(642)
	Float _g39 = this->rawData->__unsafe_get((int)11);		HX_STACK_VAR(_g39,"_g39");
	HX_STACK_LINE(642)
	Float _g40 = (_g38 * _g39);		HX_STACK_VAR(_g40,"_g40");
	HX_STACK_LINE(642)
	Float _g41 = this->rawData->__unsafe_get((int)10);		HX_STACK_VAR(_g41,"_g41");
	HX_STACK_LINE(642)
	Float _g42 = this->rawData->__unsafe_get((int)7);		HX_STACK_VAR(_g42,"_g42");
	HX_STACK_LINE(642)
	Float _g43 = (_g41 * _g42);		HX_STACK_VAR(_g43,"_g43");
	HX_STACK_LINE(642)
	Float _g44 = (_g40 - _g43);		HX_STACK_VAR(_g44,"_g44");
	HX_STACK_LINE(642)
	Float _g45 = (_g37 * _g44);		HX_STACK_VAR(_g45,"_g45");
	HX_STACK_LINE(640)
	Float _g46 = (_g30 + _g45);		HX_STACK_VAR(_g46,"_g46");
	HX_STACK_LINE(643)
	Float _g47 = this->rawData->__unsafe_get((int)4);		HX_STACK_VAR(_g47,"_g47");
	HX_STACK_LINE(643)
	Float _g48 = this->rawData->__unsafe_get((int)9);		HX_STACK_VAR(_g48,"_g48");
	HX_STACK_LINE(643)
	Float _g49 = (_g47 * _g48);		HX_STACK_VAR(_g49,"_g49");
	HX_STACK_LINE(643)
	Float _g50 = this->rawData->__unsafe_get((int)8);		HX_STACK_VAR(_g50,"_g50");
	HX_STACK_LINE(643)
	Float _g51 = this->rawData->__unsafe_get((int)5);		HX_STACK_VAR(_g51,"_g51");
	HX_STACK_LINE(643)
	Float _g52 = (_g50 * _g51);		HX_STACK_VAR(_g52,"_g52");
	HX_STACK_LINE(643)
	Float _g53 = (_g49 - _g52);		HX_STACK_VAR(_g53,"_g53");
	HX_STACK_LINE(643)
	Float _g54 = this->rawData->__unsafe_get((int)2);		HX_STACK_VAR(_g54,"_g54");
	HX_STACK_LINE(643)
	Float _g55 = this->rawData->__unsafe_get((int)15);		HX_STACK_VAR(_g55,"_g55");
	HX_STACK_LINE(643)
	Float _g56 = (_g54 * _g55);		HX_STACK_VAR(_g56,"_g56");
	HX_STACK_LINE(643)
	Float _g57 = this->rawData->__unsafe_get((int)14);		HX_STACK_VAR(_g57,"_g57");
	HX_STACK_LINE(643)
	Float _g58 = this->rawData->__unsafe_get((int)3);		HX_STACK_VAR(_g58,"_g58");
	HX_STACK_LINE(643)
	Float _g59 = (_g57 * _g58);		HX_STACK_VAR(_g59,"_g59");
	HX_STACK_LINE(643)
	Float _g60 = (_g56 - _g59);		HX_STACK_VAR(_g60,"_g60");
	HX_STACK_LINE(643)
	Float _g61 = (_g53 * _g60);		HX_STACK_VAR(_g61,"_g61");
	HX_STACK_LINE(640)
	Float _g62 = (_g46 + _g61);		HX_STACK_VAR(_g62,"_g62");
	HX_STACK_LINE(644)
	Float _g63 = this->rawData->__unsafe_get((int)4);		HX_STACK_VAR(_g63,"_g63");
	HX_STACK_LINE(644)
	Float _g64 = this->rawData->__unsafe_get((int)13);		HX_STACK_VAR(_g64,"_g64");
	HX_STACK_LINE(644)
	Float _g65 = (_g63 * _g64);		HX_STACK_VAR(_g65,"_g65");
	HX_STACK_LINE(644)
	Float _g66 = this->rawData->__unsafe_get((int)12);		HX_STACK_VAR(_g66,"_g66");
	HX_STACK_LINE(644)
	Float _g67 = this->rawData->__unsafe_get((int)5);		HX_STACK_VAR(_g67,"_g67");
	HX_STACK_LINE(644)
	Float _g68 = (_g66 * _g67);		HX_STACK_VAR(_g68,"_g68");
	HX_STACK_LINE(644)
	Float _g69 = (_g65 - _g68);		HX_STACK_VAR(_g69,"_g69");
	HX_STACK_LINE(644)
	Float _g70 = this->rawData->__unsafe_get((int)2);		HX_STACK_VAR(_g70,"_g70");
	HX_STACK_LINE(644)
	Float _g71 = this->rawData->__unsafe_get((int)11);		HX_STACK_VAR(_g71,"_g71");
	HX_STACK_LINE(644)
	Float _g72 = (_g70 * _g71);		HX_STACK_VAR(_g72,"_g72");
	HX_STACK_LINE(644)
	Float _g73 = this->rawData->__unsafe_get((int)10);		HX_STACK_VAR(_g73,"_g73");
	HX_STACK_LINE(644)
	Float _g74 = this->rawData->__unsafe_get((int)3);		HX_STACK_VAR(_g74,"_g74");
	HX_STACK_LINE(644)
	Float _g75 = (_g73 * _g74);		HX_STACK_VAR(_g75,"_g75");
	HX_STACK_LINE(644)
	Float _g76 = (_g72 - _g75);		HX_STACK_VAR(_g76,"_g76");
	HX_STACK_LINE(644)
	Float _g77 = (_g69 * _g76);		HX_STACK_VAR(_g77,"_g77");
	HX_STACK_LINE(640)
	Float _g78 = (_g62 - _g77);		HX_STACK_VAR(_g78,"_g78");
	HX_STACK_LINE(645)
	Float _g79 = this->rawData->__unsafe_get((int)8);		HX_STACK_VAR(_g79,"_g79");
	HX_STACK_LINE(645)
	Float _g80 = this->rawData->__unsafe_get((int)13);		HX_STACK_VAR(_g80,"_g80");
	HX_STACK_LINE(645)
	Float _g81 = (_g79 * _g80);		HX_STACK_VAR(_g81,"_g81");
	HX_STACK_LINE(645)
	Float _g82 = this->rawData->__unsafe_get((int)12);		HX_STACK_VAR(_g82,"_g82");
	HX_STACK_LINE(645)
	Float _g83 = this->rawData->__unsafe_get((int)9);		HX_STACK_VAR(_g83,"_g83");
	HX_STACK_LINE(645)
	Float _g84 = (_g82 * _g83);		HX_STACK_VAR(_g84,"_g84");
	HX_STACK_LINE(645)
	Float _g85 = (_g81 - _g84);		HX_STACK_VAR(_g85,"_g85");
	HX_STACK_LINE(645)
	Float _g86 = this->rawData->__unsafe_get((int)2);		HX_STACK_VAR(_g86,"_g86");
	HX_STACK_LINE(645)
	Float _g87 = this->rawData->__unsafe_get((int)7);		HX_STACK_VAR(_g87,"_g87");
	HX_STACK_LINE(645)
	Float _g88 = (_g86 * _g87);		HX_STACK_VAR(_g88,"_g88");
	HX_STACK_LINE(645)
	Float _g89 = this->rawData->__unsafe_get((int)6);		HX_STACK_VAR(_g89,"_g89");
	HX_STACK_LINE(645)
	Float _g90 = this->rawData->__unsafe_get((int)3);		HX_STACK_VAR(_g90,"_g90");
	HX_STACK_LINE(645)
	Float _g91 = (_g89 * _g90);		HX_STACK_VAR(_g91,"_g91");
	HX_STACK_LINE(645)
	Float _g92 = (_g88 - _g91);		HX_STACK_VAR(_g92,"_g92");
	HX_STACK_LINE(645)
	Float _g93 = (_g85 * _g92);		HX_STACK_VAR(_g93,"_g93");
	HX_STACK_LINE(640)
	Float _g94 = (_g78 + _g93);		HX_STACK_VAR(_g94,"_g94");
	HX_STACK_LINE(640)
	return ((int)-1 * _g94);
}


HX_DEFINE_DYNAMIC_FUNC0(Matrix3D_obj,get_determinant,return )

::openfl::geom::Vector3D Matrix3D_obj::get_position( ){
	HX_STACK_FRAME("openfl.geom.Matrix3D","get_position",0x1555563a,"openfl.geom.Matrix3D.get_position","openfl/geom/Matrix3D.hx",650,0x3acce238)
	HX_STACK_THIS(this)
	HX_STACK_LINE(652)
	Float _g = this->rawData->__unsafe_get((int)12);		HX_STACK_VAR(_g,"_g");
	HX_STACK_LINE(652)
	Float _g1 = this->rawData->__unsafe_get((int)13);		HX_STACK_VAR(_g1,"_g1");
	HX_STACK_LINE(652)
	Float _g2 = this->rawData->__unsafe_get((int)14);		HX_STACK_VAR(_g2,"_g2");
	HX_STACK_LINE(652)
	return ::openfl::geom::Vector3D_obj::__new(_g,_g1,_g2,null());
}


HX_DEFINE_DYNAMIC_FUNC0(Matrix3D_obj,get_position,return )

::openfl::geom::Vector3D Matrix3D_obj::set_position( ::openfl::geom::Vector3D value){
	HX_STACK_FRAME("openfl.geom.Matrix3D","set_position",0x2a4e79ae,"openfl.geom.Matrix3D.set_position","openfl/geom/Matrix3D.hx",657,0x3acce238)
	HX_STACK_THIS(this)
	HX_STACK_ARG(value,"value")
	HX_STACK_LINE(659)
	this->rawData->__unsafe_set((int)12,value->x);
	HX_STACK_LINE(660)
	this->rawData->__unsafe_set((int)13,value->y);
	HX_STACK_LINE(661)
	this->rawData->__unsafe_set((int)14,value->z);
	HX_STACK_LINE(662)
	return value;
}


HX_DEFINE_DYNAMIC_FUNC1(Matrix3D_obj,set_position,return )

::openfl::geom::Matrix3D Matrix3D_obj::create2D( Float x,Float y,hx::Null< Float >  __o_scale,hx::Null< Float >  __o_rotation){
Float scale = __o_scale.Default(1);
Float rotation = __o_rotation.Default(0);
	HX_STACK_FRAME("openfl.geom.Matrix3D","create2D",0x4623e756,"openfl.geom.Matrix3D.create2D","openfl/geom/Matrix3D.hx",191,0x3acce238)
	HX_STACK_ARG(x,"x")
	HX_STACK_ARG(y,"y")
	HX_STACK_ARG(scale,"scale")
	HX_STACK_ARG(rotation,"rotation")
{
		HX_STACK_LINE(193)
		Float theta = (Float((rotation * ::Math_obj::PI)) / Float(180.0));		HX_STACK_VAR(theta,"theta");
		HX_STACK_LINE(194)
		Float c = ::Math_obj::cos(theta);		HX_STACK_VAR(c,"c");
		HX_STACK_LINE(195)
		Float s = ::Math_obj::sin(theta);		HX_STACK_VAR(s,"s");
		HX_STACK_LINE(197)
		return ::openfl::geom::Matrix3D_obj::__new(Array_obj< Float >::__new().Add((c * scale)).Add((-(s) * scale)).Add((int)0).Add((int)0).Add((s * scale)).Add((c * scale)).Add((int)0).Add((int)0).Add((int)0).Add((int)0).Add((int)1).Add((int)0).Add(x).Add(y).Add((int)0).Add((int)1));
	}
}


STATIC_HX_DEFINE_DYNAMIC_FUNC4(Matrix3D_obj,create2D,return )

::openfl::geom::Matrix3D Matrix3D_obj::createABCD( Float a,Float b,Float c,Float d,Float tx,Float ty){
	HX_STACK_FRAME("openfl.geom.Matrix3D","createABCD",0x0e55d246,"openfl.geom.Matrix3D.createABCD","openfl/geom/Matrix3D.hx",209,0x3acce238)
	HX_STACK_ARG(a,"a")
	HX_STACK_ARG(b,"b")
	HX_STACK_ARG(c,"c")
	HX_STACK_ARG(d,"d")
	HX_STACK_ARG(tx,"tx")
	HX_STACK_ARG(ty,"ty")
	HX_STACK_LINE(209)
	return ::openfl::geom::Matrix3D_obj::__new(Array_obj< Float >::__new().Add(a).Add(b).Add((int)0).Add((int)0).Add(c).Add(d).Add((int)0).Add((int)0).Add((int)0).Add((int)0).Add((int)1).Add((int)0).Add(tx).Add(ty).Add((int)0).Add((int)1));
}


STATIC_HX_DEFINE_DYNAMIC_FUNC6(Matrix3D_obj,createABCD,return )

::openfl::geom::Matrix3D Matrix3D_obj::createOrtho( Float x0,Float x1,Float y0,Float y1,Float zNear,Float zFar){
	HX_STACK_FRAME("openfl.geom.Matrix3D","createOrtho",0xac3dd614,"openfl.geom.Matrix3D.createOrtho","openfl/geom/Matrix3D.hx",219,0x3acce238)
	HX_STACK_ARG(x0,"x0")
	HX_STACK_ARG(x1,"x1")
	HX_STACK_ARG(y0,"y0")
	HX_STACK_ARG(y1,"y1")
	HX_STACK_ARG(zNear,"zNear")
	HX_STACK_ARG(zFar,"zFar")
	HX_STACK_LINE(221)
	Float sx = (Float(1.0) / Float(((x1 - x0))));		HX_STACK_VAR(sx,"sx");
	HX_STACK_LINE(222)
	Float sy = (Float(1.0) / Float(((y1 - y0))));		HX_STACK_VAR(sy,"sy");
	HX_STACK_LINE(223)
	Float sz = (Float(1.0) / Float(((zFar - zNear))));		HX_STACK_VAR(sz,"sz");
	HX_STACK_LINE(225)
	return ::openfl::geom::Matrix3D_obj::__new(Array_obj< Float >::__new().Add((2.0 * sx)).Add((int)0).Add((int)0).Add((int)0).Add((int)0).Add((2.0 * sy)).Add((int)0).Add((int)0).Add((int)0).Add((int)0).Add((-2. * sz)).Add((int)0).Add((-(((x0 + x1))) * sx)).Add((-(((y0 + y1))) * sy)).Add((-(((zNear + zFar))) * sz)).Add((int)1));
}


STATIC_HX_DEFINE_DYNAMIC_FUNC6(Matrix3D_obj,createOrtho,return )

::openfl::geom::Matrix3D Matrix3D_obj::getAxisRotation( Float x,Float y,Float z,Float degrees){
	HX_STACK_FRAME("openfl.geom.Matrix3D","getAxisRotation",0x6465182d,"openfl.geom.Matrix3D.getAxisRotation","openfl/geom/Matrix3D.hx",306,0x3acce238)
	HX_STACK_ARG(x,"x")
	HX_STACK_ARG(y,"y")
	HX_STACK_ARG(z,"z")
	HX_STACK_ARG(degrees,"degrees")
	HX_STACK_LINE(308)
	::openfl::geom::Matrix3D m = ::openfl::geom::Matrix3D_obj::__new(null());		HX_STACK_VAR(m,"m");
	HX_STACK_LINE(310)
	::openfl::geom::Vector3D a1 = ::openfl::geom::Vector3D_obj::__new(x,y,z,null());		HX_STACK_VAR(a1,"a1");
	HX_STACK_LINE(311)
	Float rad = (-(degrees) * ((Float(::Math_obj::PI) / Float((int)180))));		HX_STACK_VAR(rad,"rad");
	HX_STACK_LINE(312)
	Float c = ::Math_obj::cos(rad);		HX_STACK_VAR(c,"c");
	HX_STACK_LINE(313)
	Float s = ::Math_obj::sin(rad);		HX_STACK_VAR(s,"s");
	HX_STACK_LINE(314)
	Float t = (1.0 - c);		HX_STACK_VAR(t,"t");
	HX_STACK_LINE(316)
	m->rawData->__unsafe_set((int)0,(c + ((a1->x * a1->x) * t)));
	HX_STACK_LINE(317)
	m->rawData->__unsafe_set((int)5,(c + ((a1->y * a1->y) * t)));
	HX_STACK_LINE(318)
	m->rawData->__unsafe_set((int)10,(c + ((a1->z * a1->z) * t)));
	HX_STACK_LINE(320)
	Float tmp1 = ((a1->x * a1->y) * t);		HX_STACK_VAR(tmp1,"tmp1");
	HX_STACK_LINE(321)
	Float tmp2 = (a1->z * s);		HX_STACK_VAR(tmp2,"tmp2");
	HX_STACK_LINE(322)
	m->rawData->__unsafe_set((int)4,(tmp1 + tmp2));
	HX_STACK_LINE(323)
	m->rawData->__unsafe_set((int)1,(tmp1 - tmp2));
	HX_STACK_LINE(324)
	tmp1 = ((a1->x * a1->z) * t);
	HX_STACK_LINE(325)
	tmp2 = (a1->y * s);
	HX_STACK_LINE(326)
	m->rawData->__unsafe_set((int)8,(tmp1 - tmp2));
	HX_STACK_LINE(327)
	m->rawData->__unsafe_set((int)2,(tmp1 + tmp2));
	HX_STACK_LINE(328)
	tmp1 = ((a1->y * a1->z) * t);
	HX_STACK_LINE(329)
	tmp2 = (a1->x * s);
	HX_STACK_LINE(330)
	m->rawData->__unsafe_set((int)9,(tmp1 + tmp2));
	HX_STACK_LINE(331)
	m->rawData->__unsafe_set((int)6,(tmp1 - tmp2));
	HX_STACK_LINE(333)
	return m;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC4(Matrix3D_obj,getAxisRotation,return )

::openfl::geom::Matrix3D Matrix3D_obj::interpolate( ::openfl::geom::Matrix3D thisMat,::openfl::geom::Matrix3D toMat,Float percent){
	HX_STACK_FRAME("openfl.geom.Matrix3D","interpolate",0x6cc85c39,"openfl.geom.Matrix3D.interpolate","openfl/geom/Matrix3D.hx",360,0x3acce238)
	HX_STACK_ARG(thisMat,"thisMat")
	HX_STACK_ARG(toMat,"toMat")
	HX_STACK_ARG(percent,"percent")
	HX_STACK_LINE(362)
	::openfl::geom::Matrix3D m = ::openfl::geom::Matrix3D_obj::__new(null());		HX_STACK_VAR(m,"m");
	HX_STACK_LINE(364)
	{
		HX_STACK_LINE(364)
		int _g = (int)0;		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(364)
		while((true)){
			HX_STACK_LINE(364)
			if ((!(((_g < (int)16))))){
				HX_STACK_LINE(364)
				break;
			}
			HX_STACK_LINE(364)
			int i = (_g)++;		HX_STACK_VAR(i,"i");
			HX_STACK_LINE(366)
			{
				HX_STACK_LINE(366)
				Float _g1 = thisMat->rawData->__unsafe_get(i);		HX_STACK_VAR(_g1,"_g1");
				HX_STACK_LINE(366)
				Float _g11 = toMat->rawData->__unsafe_get(i);		HX_STACK_VAR(_g11,"_g11");
				HX_STACK_LINE(366)
				Float _g2 = thisMat->rawData->__unsafe_get(i);		HX_STACK_VAR(_g2,"_g2");
				HX_STACK_LINE(366)
				Float _g3 = (_g11 - _g2);		HX_STACK_VAR(_g3,"_g3");
				HX_STACK_LINE(366)
				Float _g4 = (_g3 * percent);		HX_STACK_VAR(_g4,"_g4");
				HX_STACK_LINE(366)
				Float value = (_g1 + _g4);		HX_STACK_VAR(value,"value");
				HX_STACK_LINE(366)
				m->rawData->__unsafe_set(i,value);
			}
		}
	}
	HX_STACK_LINE(370)
	return m;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(Matrix3D_obj,interpolate,return )


Matrix3D_obj::Matrix3D_obj()
{
}

void Matrix3D_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Matrix3D);
	HX_MARK_MEMBER_NAME(determinant,"determinant");
	HX_MARK_MEMBER_NAME(rawData,"rawData");
	HX_MARK_END_CLASS();
}

void Matrix3D_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(determinant,"determinant");
	HX_VISIT_MEMBER_NAME(rawData,"rawData");
}

Dynamic Matrix3D_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"clone") ) { return clone_dyn(); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"append") ) { return append_dyn(); }
		if (HX_FIELD_EQ(inName,"invert") ) { return invert_dyn(); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"rawData") ) { return rawData; }
		if (HX_FIELD_EQ(inName,"pointAt") ) { return pointAt_dyn(); }
		if (HX_FIELD_EQ(inName,"prepend") ) { return prepend_dyn(); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"create2D") ) { return create2D_dyn(); }
		if (HX_FIELD_EQ(inName,"position") ) { return get_position(); }
		if (HX_FIELD_EQ(inName,"copyFrom") ) { return copyFrom_dyn(); }
		if (HX_FIELD_EQ(inName,"identity") ) { return identity_dyn(); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"copyRowTo") ) { return copyRowTo_dyn(); }
		if (HX_FIELD_EQ(inName,"decompose") ) { return decompose_dyn(); }
		if (HX_FIELD_EQ(inName,"recompose") ) { return recompose_dyn(); }
		if (HX_FIELD_EQ(inName,"transpose") ) { return transpose_dyn(); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"createABCD") ) { return createABCD_dyn(); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"createOrtho") ) { return createOrtho_dyn(); }
		if (HX_FIELD_EQ(inName,"interpolate") ) { return interpolate_dyn(); }
		if (HX_FIELD_EQ(inName,"determinant") ) { return inCallProp ? get_determinant() : determinant; }
		if (HX_FIELD_EQ(inName,"appendScale") ) { return appendScale_dyn(); }
		if (HX_FIELD_EQ(inName,"copyRowFrom") ) { return copyRowFrom_dyn(); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"copyColumnTo") ) { return copyColumnTo_dyn(); }
		if (HX_FIELD_EQ(inName,"prependScale") ) { return prependScale_dyn(); }
		if (HX_FIELD_EQ(inName,"get_position") ) { return get_position_dyn(); }
		if (HX_FIELD_EQ(inName,"set_position") ) { return set_position_dyn(); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"interpolateTo") ) { return interpolateTo_dyn(); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"appendRotation") ) { return appendRotation_dyn(); }
		if (HX_FIELD_EQ(inName,"copyColumnFrom") ) { return copyColumnFrom_dyn(); }
		if (HX_FIELD_EQ(inName,"copyToMatrix3D") ) { return copyToMatrix3D_dyn(); }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"getAxisRotation") ) { return getAxisRotation_dyn(); }
		if (HX_FIELD_EQ(inName,"prependRotation") ) { return prependRotation_dyn(); }
		if (HX_FIELD_EQ(inName,"transformVector") ) { return transformVector_dyn(); }
		if (HX_FIELD_EQ(inName,"get_determinant") ) { return get_determinant_dyn(); }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"transformVectors") ) { return transformVectors_dyn(); }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"appendTranslation") ) { return appendTranslation_dyn(); }
		break;
	case 18:
		if (HX_FIELD_EQ(inName,"prependTranslation") ) { return prependTranslation_dyn(); }
		break;
	case 20:
		if (HX_FIELD_EQ(inName,"deltaTransformVector") ) { return deltaTransformVector_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic Matrix3D_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"rawData") ) { rawData=inValue.Cast< Array< Float > >(); return inValue; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"position") ) { return set_position(inValue); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"determinant") ) { determinant=inValue.Cast< Float >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Matrix3D_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("determinant"));
	outFields->push(HX_CSTRING("position"));
	outFields->push(HX_CSTRING("rawData"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	HX_CSTRING("create2D"),
	HX_CSTRING("createABCD"),
	HX_CSTRING("createOrtho"),
	HX_CSTRING("getAxisRotation"),
	HX_CSTRING("interpolate"),
	String(null()) };

#if HXCPP_SCRIPTABLE
static hx::StorageInfo sMemberStorageInfo[] = {
	{hx::fsFloat,(int)offsetof(Matrix3D_obj,determinant),HX_CSTRING("determinant")},
	{hx::fsObject /*Array< Float >*/ ,(int)offsetof(Matrix3D_obj,rawData),HX_CSTRING("rawData")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static ::String sMemberFields[] = {
	HX_CSTRING("determinant"),
	HX_CSTRING("rawData"),
	HX_CSTRING("append"),
	HX_CSTRING("appendRotation"),
	HX_CSTRING("appendScale"),
	HX_CSTRING("appendTranslation"),
	HX_CSTRING("clone"),
	HX_CSTRING("copyColumnFrom"),
	HX_CSTRING("copyColumnTo"),
	HX_CSTRING("copyFrom"),
	HX_CSTRING("copyRowFrom"),
	HX_CSTRING("copyRowTo"),
	HX_CSTRING("copyToMatrix3D"),
	HX_CSTRING("decompose"),
	HX_CSTRING("deltaTransformVector"),
	HX_CSTRING("identity"),
	HX_CSTRING("interpolateTo"),
	HX_CSTRING("invert"),
	HX_CSTRING("pointAt"),
	HX_CSTRING("prepend"),
	HX_CSTRING("prependRotation"),
	HX_CSTRING("prependScale"),
	HX_CSTRING("prependTranslation"),
	HX_CSTRING("recompose"),
	HX_CSTRING("transformVector"),
	HX_CSTRING("transformVectors"),
	HX_CSTRING("transpose"),
	HX_CSTRING("get_determinant"),
	HX_CSTRING("get_position"),
	HX_CSTRING("set_position"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Matrix3D_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Matrix3D_obj::__mClass,"__mClass");
};

#endif

Class Matrix3D_obj::__mClass;

void Matrix3D_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("openfl.geom.Matrix3D"), hx::TCanCast< Matrix3D_obj> ,sStaticFields,sMemberFields,
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

void Matrix3D_obj::__boot()
{
}

} // end namespace openfl
} // end namespace geom
