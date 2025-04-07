CLASS zcl_calculator_angel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_abap_course_basics.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_calculator_angel IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

* Declarations
**********************************************************************

    " comment/uncomment these line for different result types
    TYPES t_result TYPE p LENGTH 8 DECIMALS 2.
*    TYPES t_result TYPE p LENGTH 8 DECIMALS 0.
*    TYPES t_result TYPE i.

    DATA result TYPE t_result.

* Calculations
**********************************************************************
    " comment/uncomment these lines for different calculations

*result = 26 + 9.
*result = 26 - 9.
*result = 26 * 9.
*result = 26 / 9.

*result = ( ( 26 + 9 ) - 10 * 3 ) + 4.


*
*  result = sqrt( 2 ).
*  result = ipow( base = 2 exp = 3 ).
*
*    result = ( 9 * 7 - 6 ) / ( 5 + 4 ).
*   result = 10 * 6 - 3 / 5 + 4.

* Output
**********************************************************************

*out->write( result ).



  " Create instance of your implementation class
  DATA(lo_calculator) = NEW zcl_calculator_angel( ).

  " Define input and result variables
  DATA: lv_result TYPE i,
        lv_first  TYPE i VALUE 20,
        lv_second TYPE i VALUE 2,
        lv_op     TYPE c LENGTH 1 VALUE '/'.


      " Call the calculator method
      lv_result = lo_calculator->zif_abap_course_basics~calculator(
                    iv_first_number  = lv_first
                    iv_second_number = lv_second
                    iv_operator      = lv_op ).

      " Output result to console
      out->write( |Result of { lv_first } { lv_op } { lv_second } = { lv_result }| ).




ENDMETHOD.





  METHOD zif_abap_course_basics~calculator.
  CASE iv_operator.
    WHEN '+'.
      rv_result = iv_first_number + iv_second_number.
    WHEN '-'.
      rv_result = iv_first_number - iv_second_number.
    WHEN '*'.
      rv_result = iv_first_number * iv_second_number.
    WHEN '/'.
      IF iv_second_number = 0.
        RAISE EXCEPTION TYPE cx_sy_zerodivide.
      ELSE.
        rv_result = iv_first_number / iv_second_number.
      ENDIF.
      ENDCASE.
  ENDMETHOD.



ENDCLASS.
