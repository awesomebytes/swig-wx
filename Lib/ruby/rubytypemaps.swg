/* ------------------------------------------------------------
 *  Typemap specializations for Ruby
 * ------------------------------------------------------------ */
/* ------------------------------------------------------------
 *  Fragment section
 * ------------------------------------------------------------ */

/* Include fundamental fragemt definitions */
%include <typemaps/fragments.swg>

/* Look for user fragments file. */
%include <rubyfragments.swg>

/* Ruby fragments for primitive types */
%include <rubyprimtypes.swg>

/* Ruby fragments for char* strings */
%include <rubystrings.swg>

/* Backward compatibility output helper */
%fragment("output_helper","header") %{
#define output_helper SWIG_Ruby_AppendOutput
%}

/* ------------------------------------------------------------
 *  Unified typemap section
 * ------------------------------------------------------------ */

/* Directors are supported in Ruby */
#ifndef SWIG_DIRECTOR_TYPEMAPS
#define SWIG_DIRECTOR_TYPEMAPS
#endif


/* Ruby types */
#define SWIG_Object                      VALUE
#define VOID_Object                      Qnil

/* Overload of the output/constant/exception handling */

/* append output */
#define SWIG_AppendOutput(result,obj)    SWIG_Ruby_AppendOutput(result, obj)

/* set constant */
#define SWIG_SetConstant(name, obj)      rb_define_const($module, name, obj)

/* raise */
#define SWIG_Raise(obj, type, desc)      rb_exc_raise(SWIG_Ruby_ExceptionType(desc, obj)) 

/* Include the unified typemap library */
%include <typemaps/swigtypemaps.swg>


