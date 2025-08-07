CLASS zcl_fabap_jul2025_exer02_ttl1 DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        i_idfunc      TYPE string
        i_nomefunc    TYPE string
        i_salariofunc TYPE decfloat16.
    METHODS calcular_salario
        ABSTRACT
        RETURNING VALUE(r_sal) type decfloat16
        .
    METHODS exibir_dados
        RETURNING VALUE(r_dados) type string.
  PROTECTED SECTION.
    DATA gv_idfunc TYPE string.
    DATA gv_nomefunc TYPE string.
    DATA gv_salariofunc TYPE decfloat16.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_TTL1 IMPLEMENTATION.


  METHOD constructor.
    gv_idfunc = i_idfunc.
    gv_nomefunc = i_nomefunc.
    gv_salariofunc = i_salariofunc.
  ENDMETHOD.    "constructor


  METHOD exibir_dados.
  DATA(lv_string) = CONV string( gv_salariofunc ).
    CONCATENATE gv_idfunc gv_nomefunc lv_string into r_dados SEPARATED BY ' '.
  ENDMETHOD.    "exibir_dados
ENDCLASS.
