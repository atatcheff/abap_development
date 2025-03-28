CLASS zcl_fizzbuzz_angel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  DATA result TYPE string.
      INTERFACES zif_abap_course_basics.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fizzbuzz_angel IMPLEMENTATION.
  METHOD zif_abap_course_basics~fizz_buzz.


  DATA lv_result TYPE string.
  DATA lv_temp TYPE string.


    DO 100 TIMES.
    IF sy-index MOD 3 = 0 AND sy-index MOD 5 = 0.
       lv_temp = 'FizzBuzz'.

        ELSEIF sy-index MOD 3 = 0.
        lv_temp = 'Fizz'.

         ELSEIF sy-index MOD 5 = 0.
           lv_temp = 'Buzz'.

          ELSE.
          lv_temp = |{ sy-index }|.

          ENDIF.
          result = result && lv_temp && cl_abap_char_utilities=>newline.

          ENDDO.
  ENDMETHOD.




  METHOD if_oo_adt_classrun~main.


  DATA(lo_fizzbuzz) = NEW zcl_fizzbuzz_angel( ).
  lo_fizzbuzz->zif_abap_course_basics~fizz_buzz( ).
  out->write( lo_fizzbuzz->result ).

    ENDMETHOD.
ENDCLASS.
