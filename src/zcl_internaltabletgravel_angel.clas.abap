CLASS zcl_internaltabletgravel_angel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_internaltabletgravel_angel IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.



    " Load data from ZTRAVEL_ANGEL "
    DATA: lt_ztravel TYPE STANDARD TABLE OF ztravel_angel.

    SELECT * FROM ztravel_angel INTO TABLE @lt_ztravel.

    IF lt_ztravel IS INITIAL.

      INSERT ztravel_angel FROM (
        SELECT FROM /dmo/travel
          FIELDS
            travel_id,
            agency_id,
            customer_id,
            begin_date,
            end_date,
            booking_fee,
            total_price,
            currency_code,
            description,
            CASE status
              WHEN 'B' THEN 'A'
              WHEN 'X' THEN 'X'
              ELSE 'O'
            END AS overall_status,
            createdby,
            createdat,
            lastchangedby,
            lastchangedat
          ORDER BY travel_id
      ).

      COMMIT WORK AND WAIT.

      SELECT * FROM ztravel_angel INTO TABLE @lt_ztravel.
    ENDIF.

    " travels for 070001, booking_fee = 20, JPY "
    DATA: lt_agency_travels TYPE STANDARD TABLE OF ztravel_angel.

    LOOP AT lt_ztravel INTO DATA(ls_travel).
      IF ls_travel-agency_id = '070001'
         AND ls_travel-booking_fee = 20
         AND ls_travel-currency_code = 'JPY'.
        APPEND ls_travel TO lt_agency_travels.
      ENDIF.
    ENDLOOP.

  out->write( lt_agency_travels ).


    " Travels price > 2000 USD"
    DATA: lt_expensive_usd TYPE STANDARD TABLE OF ztravel_angel.

    LOOP AT lt_ztravel INTO ls_travel.
      IF ls_travel-currency_code = 'USD'
         AND ls_travel-total_price > 2000.
        APPEND ls_travel TO lt_expensive_usd.
      ENDIF.
    ENDLOOP.

" Check for JPY entries"
DATA jpy_exists TYPE abap_bool VALUE abap_false.

LOOP AT lt_ztravel INTO ls_travel.
  IF ls_travel-currency_code = 'JPY'.
    jpy_exists = abap_true.
    EXIT.
  ENDIF.
ENDLOOP.


IF jpy_exists = abap_true.
  out->write( 'Found JPY entries!' ).
ELSE.
  out->write( 'No JPY entries found in the table.' ).
ENDIF.


    "Keep only EUR entries, sort price + date"
    DELETE lt_ztravel WHERE currency_code <> 'EUR'.

    SORT lt_ztravel BY total_price begin_date.

    "Export first 10 travel_ids"
    DATA: lt_top10_ids TYPE STANDARD TABLE OF ztravel_angel-travel_id.

    LOOP AT lt_ztravel INTO ls_travel FROM 1 TO 10.
      APPEND ls_travel-travel_id TO lt_top10_ids.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

