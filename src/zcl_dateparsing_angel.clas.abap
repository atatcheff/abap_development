CLASS zcl_dateparsing_angel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  METHODS date_parsing
    IMPORTING iv_date          TYPE string
    RETURNING VALUE(rv_result) TYPE dats.


INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_dateparsing_angel IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
  DATA: lo_dateparsing TYPE REF TO zcl_dateparsing_angel,
        lv_result      TYPE dats.

  lo_dateparsing = NEW zcl_dateparsing_angel( ).

  " Text month
  lv_result = lo_dateparsing->date_parsing( '12 April 2017' ).
  out->write( |Parsed (text month): { lv_result }| ).

  " Numeric month
  lv_result = lo_dateparsing->date_parsing( '12 4 2017' ).
  out->write( |Parsed (numeric month): { lv_result }| ).

ENDMETHOD.

METHOD date_parsing.

   DATA: lt_parts  TYPE STANDARD TABLE OF string,
        lv_day    TYPE i,
        lv_month  TYPE i,
        lv_year   TYPE i,
        lv_month_text TYPE string.

  SPLIT iv_date AT space INTO TABLE lt_parts.

  lv_day        = lt_parts[ 1 ].
  lv_month_text = lt_parts[ 2 ].
  lv_year       = lt_parts[ 3 ].

  TRANSLATE lv_month_text TO UPPER CASE.

  " Try to convert month text to number
  lv_month = SWITCH i( lv_month_text
    WHEN `JANUARY`     THEN 1
    WHEN `FEBRUARY`    THEN 2
    WHEN `MARCH`       THEN 3
    WHEN `APRIL`       THEN 4
    WHEN `MAY`         THEN 5
    WHEN `JUNE`        THEN 6
    WHEN `JULY`        THEN 7
    WHEN `AUGUST`      THEN 8
    WHEN `SEPTEMBER`   THEN 9
    WHEN `OCTOBER`     THEN 10
    WHEN `NOVEMBER`    THEN 11
    WHEN `DECEMBER`    THEN 12
    ELSE lv_month_text  " Assume it's already a number string
  ).

  rv_result = |{ lv_year WIDTH = 4  ALIGN = RIGHT PAD = '0' }{ lv_month WIDTH = 2  ALIGN = RIGHT PAD = '0' }{ lv_day WIDTH = 2   ALIGN = RIGHT PAD = '0' }|.
ENDMETHOD.




ENDCLASS.
