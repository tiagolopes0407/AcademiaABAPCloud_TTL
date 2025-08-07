CLASS zcl_fabap_jul2025_exe4_cds_ttl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXE4_CDS_TTL IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    SELECT * FROM zi_fabap_exer01_ttl
      INTO TABLE @DATA(t_tablaex1).

    out->write( t_tablaex1 ).

    SELECT * FROM zi_fabap_exer02_ttl
  INTO TABLE @DATA(t_tablaex2).

    out->write( '|---------------------------------------------------------------|' ).
    out->write( t_tablaex2 ).

    SELECT * FROM zi_fabap_exer03_ttl
  INTO TABLE @DATA(t_tablaex3).

    out->write( '|---------------------------------------------------------------|' ).
    out->write( t_tablaex3 ).
  ENDMETHOD.
ENDCLASS.
