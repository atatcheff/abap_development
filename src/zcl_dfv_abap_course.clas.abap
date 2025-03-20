CLASS zcl_dfv_abap_course DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_abap_course_basics.  "
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS zcl_dfv_abap_course IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.
out->write( 'HELLO WORLD' ) . "
ENDMETHOD.

METHOD zif_abap_course_basics~get_current_date_time.

ENDMETHOD.

  METHOD zif_abap_course_basics~calculator.
  ENDMETHOD.


  METHOD zif_abap_course_basics~date_parsing.
  ENDMETHOD.


  METHOD zif_abap_course_basics~fizz_buzz.
  ENDMETHOD.



  METHOD zif_abap_course_basics~hello_world.
  ENDMETHOD.


  METHOD zif_abap_course_basics~internal_tables.
  ENDMETHOD.


  METHOD zif_abap_course_basics~open_sql.
  ENDMETHOD.


  METHOD zif_abap_course_basics~scrabble_score.
  ENDMETHOD.
  ENDCLASS.

