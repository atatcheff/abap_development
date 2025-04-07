CLASS zcl_internaltableopensql_angel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
       INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_internaltableopensql_angel IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

  "Travels for agency '070001' "
    DATA: lt_agency_travels TYPE STANDARD TABLE OF ztravel_angel.

    SELECT * FROM ztravel_angel

      WHERE agency_id     = '070001'
        AND booking_fee   = 20
        AND currency_code = 'JPY'
        INTO TABLE @lt_agency_travels.

    out->write( 'Filtered JPY agency travels:' ).
    out->write( lt_agency_travels ).

    "Travels total_price > 2000 USD "
    DATA: lt_expensive_usd TYPE STANDARD TABLE OF ztravel_angel.

    SELECT * FROM ztravel_angel

      WHERE currency_code = 'USD'
        AND total_price > 2000
         INTO TABLE @lt_expensive_usd.

    out->write( 'Expensive USD travels:' ).
    out->write( lt_expensive_usd ).

    "JPY entries check "
    DATA: lv_jpy_exists TYPE abap_bool VALUE abap_false.

    SELECT SINGLE travel_id FROM ztravel_angel
      WHERE currency_code = 'JPY'
      INTO @DATA(dummy_id).

    IF sy-subrc = 0.
      lv_jpy_exists = abap_true.
    ENDIF.

    IF lv_jpy_exists = abap_true.
      out->write( 'Found JPY entries!' ).
    ELSE.
      out->write( 'No JPY entries found in the table.' ).
    ENDIF.

    "Top 10 EUR entries  "
    DATA: lt_top10_ids TYPE STANDARD TABLE OF ztravel_angel-travel_id.

    SELECT travel_id FROM ztravel_angel
      WHERE currency_code = 'EUR'
      ORDER BY total_price ASCENDING, begin_date ASCENDING
      INTO TABLE @lt_top10_ids
      UP TO 10 ROWS.

    out->write( 'Top 10 EUR travel_ids:' ).
    out->write( lt_top10_ids ).


ENDMETHOD.

ENDCLASS.
