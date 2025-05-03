CLASS zcl_uni DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-DATA: gv_uni_counter TYPE i VALUE 100000.


    TYPES: BEGIN OF ty_university,
             id       TYPE i,
             name     TYPE string,
             location TYPE string,
           END OF ty_university.

    METHODS: get_university
      RETURNING VALUE(rs_university) TYPE ty_university.


    TYPES:BEGIN OF ty_student,
            student_id TYPE i,
            name       TYPE string,
            age        TYPE i,
            major      TYPE string,
            email      TYPE string,
          END OF ty_student.

    TYPES: ty_student_tab TYPE STANDARD TABLE OF ty_student WITH DEFAULT KEY.


    DATA: gv_id       TYPE i,
          gv_name     TYPE string,
          gv_location TYPE string,
          gt_students TYPE STANDARD TABLE OF ty_student WITH DEFAULT KEY.


    METHODS: create_university
      IMPORTING iv_university_name      TYPE string
                iv_university_location  TYPE string
      RETURNING VALUE(rv_university_id) TYPE i,

      add_student
        IMPORTING iv_student_id    TYPE i
                  iv_university_id TYPE i
                  iv_name          TYPE string
                  iv_age           TYPE i
                  iv_major         TYPE string
                  iv_email         TYPE string,

      delete_student
        IMPORTING iv_student_id TYPE i,

      list_students
        RETURNING VALUE(rt_students) TYPE ty_student_tab.



  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_uni IMPLEMENTATION.

  METHOD create_university.
    rv_university_id = gv_uni_counter.
    gv_uni_counter += 1.

    gv_id       = rv_university_id.
    gv_name = iv_university_name.
    gv_location = iv_university_location.







  ENDMETHOD.

  METHOD get_university.
    rs_university-id       = gv_id.
    rs_university-name     = gv_name.
    rs_university-location = gv_location.
  ENDMETHOD.


  METHOD add_student.
    DATA(ls_student) = VALUE ty_student(
                        student_id = iv_student_id
                        name       = iv_name
                        age        = iv_age
                        major      = iv_major
                        email      = iv_email
                      ).

    APPEND ls_student TO gt_students.
  ENDMETHOD.

  METHOD delete_student.
    DELETE gt_students WHERE student_id = iv_student_id.
  ENDMETHOD.


  METHOD list_students.
    rt_students = gt_students.
  ENDMETHOD.


ENDCLASS.
