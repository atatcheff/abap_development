CLASS ztest_uni_system DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS ztest_uni_system IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lo_uni      TYPE REF TO zcl_uni,
          lo_stud     TYPE REF TO zcl_stud,
          lt_students TYPE zcl_uni=>ty_student_tab,
          lv_id       TYPE i.

    DATA: ls_student1 TYPE zcl_uni=>ty_student,
          ls_student2 TYPE zcl_uni=>ty_student,
          ls_student3 TYPE zcl_uni=>ty_student.

    " Create uni and student
    lo_uni  = NEW zcl_uni( ).
    DATA(lo_uni1) = NEW zcl_uni( ).
    lo_stud = NEW zcl_stud( ).


    lv_id = lo_uni->create_university(
                    iv_university_name     = 'Test Uni'
                    iv_university_location = 'Sofia' ).

    " Create other uni
    DATA(lv_id1) = lo_uni1->create_university(
                     iv_university_name     = 'Test Uni2'
                     iv_university_location = 'Plovdiv' ).


    DATA(ls_university) = lo_uni->get_university( ).
    DATA(ls_university1) = lo_uni1->get_university( ).
    out->write( 'UNIVERSITY INFO:' ).
    out->write( ls_university ).
    out->write( ls_university1 ).

    " student 1
    ls_student1 = lo_stud->create_student(
                    iv_student_name = 'Elena'
                    iv_student_age  = 21
                    iv_major        = 'Economics'
                    iv_email        = 'elena@uni.com' ).

    lo_uni->add_student(
      iv_student_id    = ls_student1-student_id
      iv_university_id = lv_id
      iv_name          = ls_student1-name
      iv_age           = ls_student1-age
      iv_major         = ls_student1-major
      iv_email         = ls_student1-email ).

    "student 2
    ls_student2 = lo_stud->create_student(
                    iv_student_name = 'Angel Tatcheff'
                    iv_student_age  = 21
                    iv_major        = 'IT'
                    iv_email        = 'a.tatcheff@uni.com' ).

    lo_uni->add_student(
      iv_student_id    = ls_student2-student_id
      iv_university_id = lv_id
      iv_name          = ls_student2-name
      iv_age           = ls_student2-age
      iv_major         = ls_student2-major
      iv_email         = ls_student2-email ).

    "student 3
    ls_student3 = lo_stud->create_student(
                    iv_student_name = 'Elena Petrova'
                    iv_student_age  = 22
                    iv_major        = 'Finance'
                    iv_email        = 'elena.petrova@uni.com' ).

    lo_uni->add_student(
      iv_student_id    = ls_student3-student_id
      iv_university_id = lv_id
      iv_name          = ls_student3-name
      iv_age           = ls_student3-age
      iv_major         = ls_student3-major
      iv_email         = ls_student3-email ).

    "after adding
    lt_students = lo_uni->list_students( ).
    out->write( 'STUDENT LIST AFTER ADD:' ).
    out->write( lt_students ).

    " Update stud. 3
    lo_stud->update_student(
      EXPORTING
        iv_name  = 'Elena Petrova Updated'
        iv_age   = 23
        iv_major = 'Accounting'
        iv_email = 'elena.updated@uni.com'
      CHANGING
        cs_student = ls_student3 ).

    " print newly upd. student
    lo_uni->delete_student( iv_student_id = ls_student3-student_id ).
    lo_uni->add_student(
      iv_student_id    = ls_student3-student_id
      iv_university_id = lv_id
      iv_name          = ls_student3-name
      iv_age           = ls_student3-age
      iv_major         = ls_student3-major
      iv_email         = ls_student3-email ).


    lt_students = lo_uni->list_students( ).
    out->write( 'STUDENT LIST AFTER UPDATE:' ).
    out->write( lt_students ).

    " Delete student
    lo_uni->delete_student( iv_student_id = ls_student3-student_id ).

    " after delete
    lt_students = lo_uni->list_students( ).
    out->write( 'STUDENT LIST AFTER DELETE:' ).
    out->write( lt_students ).

  ENDMETHOD.

ENDCLASS.

