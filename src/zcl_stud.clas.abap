CLASS zcl_stud DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-DATA: gv_student_counter TYPE i VALUE 200000.

    METHODS: create_student


      IMPORTING iv_student_name   TYPE string
                iv_student_age    TYPE i
                iv_major          TYPE string
                iv_email          TYPE string
      RETURNING VALUE(rv_student) TYPE zcl_uni=>ty_student.

    METHODS: get_student
      IMPORTING
                iv_student_id     TYPE i
                it_students       TYPE zcl_uni=>ty_student_tab
      RETURNING VALUE(rs_student) TYPE zcl_uni=>ty_student.


    METHODS: update_student
      IMPORTING iv_name    TYPE string
                iv_age     TYPE i
                iv_major   TYPE string
                iv_email   TYPE string
      CHANGING  cs_student TYPE zcl_uni=>ty_student.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_stud IMPLEMENTATION.

  METHOD create_student.
    rv_student-student_id = gv_student_counter.
    gv_student_counter += 1.

    rv_student-name       = iv_student_name.
    rv_student-age        = iv_student_age.
    rv_student-major      = iv_major.
    rv_student-email      = iv_email.
  ENDMETHOD.

  METHOD get_student.

    CLEAR rs_student.

    LOOP AT it_students INTO DATA(ls_student)
         WHERE student_id = iv_student_id.
      rs_student = ls_student.
      EXIT.
    ENDLOOP.

  ENDMETHOD.


  METHOD update_student.
    cs_student-name  = iv_name.
    cs_student-age   = iv_age.
    cs_student-major = iv_major.
    cs_student-email = iv_email.
  ENDMETHOD.


ENDCLASS.
