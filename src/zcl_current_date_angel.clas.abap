CLASS zcl_current_date_angel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
        INTERFACES zif_abap_course_basics.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_current_date_angel IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.
  DATA(result) = zif_abap_course_basics~get_current_date_time( ).
    out->write( result ).

ENDMETHOD.
METHOD zif_abap_course_basics~get_current_date_time.
    GET TIME STAMP FIELD rv_result.
    ENDMETHOD.

ENDCLASS.
