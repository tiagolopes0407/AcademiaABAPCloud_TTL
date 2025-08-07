CLASS zcl_fabap_jul2025_exer02_ttl3 DEFINITION
  PUBLIC
  INHERITING FROM zcl_fabap_jul2025_exer02_ttl1
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS calcular_salario REDEFINITION.
    METHODS constructor
      IMPORTING
        i_idfunc      TYPE string
        i_nomefunc    TYPE string
        i_salariofunc TYPE decfloat16
        i_horas       TYPE i.
    METHODS exibir_dados REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA gv_horas TYPE i.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_TTL3 IMPLEMENTATION.


  METHOD calcular_salario.
    r_sal = gv_salariofunc * gv_horas.
  ENDMETHOD.


  METHOD constructor.
    super->constructor( i_nomefunc = i_nomefunc i_idfunc = i_idfunc i_salariofunc = i_salariofunc ).
    gv_horas = i_horas.
  ENDMETHOD. "CONSTRUCTOR


  METHOD exibir_dados.
    DATA(lv_salario) = CONV string( gv_salariofunc ).
    DATA(lv_horas) = CONV string( gv_horas ).
    CONCATENATE gv_idfunc gv_nomefunc lv_salario lv_horas INTO r_dados SEPARATED BY ' '.
  ENDMETHOD.
ENDCLASS.
