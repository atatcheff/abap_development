CLASS zcl_scrabble_angel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS scrabble_score
    IMPORTING iv_word          TYPE string
    RETURNING VALUE(rv_result) TYPE i.
  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_scrabble_angel IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

  DATA: lv_word TYPE string, " word inputed "
        lv_result TYPE i. "score"

  lv_word = ' hello world' .
  "scoring method"
  lv_result = scrabble_score( iv_word = lv_word ).

  out->write( lv_result ).
ENDMETHOD.


METHOD scrabble_score.
  DATA: string_sum    TYPE i VALUE 0, "total score"
        current_char  TYPE c LENGTH 1,
        upper_text    TYPE string," word input to capital letters"
        abc_index     TYPE i," alphabet position "
        offset        TYPE i, " extracts input character"
        abc_offset    TYPE i, "extract from alphabet"
        abc_char      TYPE c LENGTH 1.

  upper_text = to_upper( iv_word ).

"loop each char in the word"
  DO strlen( upper_text ) TIMES.
    offset = sy-index - 1.
    " extract current char"
    current_char = upper_text+offset(1).

    " Loop  A-Z "
    DO 26 TIMES.
      abc_offset = sy-index - 1. " loop the letters"
      abc_char = sy-abcde+abc_offset(1). " get current letter from abcde"
        IF current_char = abc_char.
        abc_index = sy-index. " store letter position"
        string_sum = string_sum + abc_index. "add letter to score"
        EXIT.
      ENDIF.
    ENDDO.

  ENDDO.


  rv_result = string_sum.
ENDMETHOD.









ENDCLASS.
