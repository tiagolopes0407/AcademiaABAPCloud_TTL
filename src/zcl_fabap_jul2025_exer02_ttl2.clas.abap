CLASS zcl_fabap_jul2025_exer02_ttl2 DEFINITION
  PUBLIC
  INHERITING FROM zcl_fabap_jul2025_exer02_ttl1
  FINAL

  CREATE PUBLIC .


  PUBLIC SECTION.
    METHODS calcular_salario
        REDEFINITION.
    METHODS constructor
      IMPORTING
        i_idfunc      TYPE string
        i_nomefunc    TYPE string
        i_salariofunc TYPE decfloat16
        i_bunosfunc   TYPE decfloat16.
    METHODS exibir_dados REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA gv_bonus TYPE decfloat16.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_TTL2 IMPLEMENTATION.


  METHOD calcular_salario .
    r_sal = gv_salariofunc + gv_bonus.
  ENDMETHOD. " CALCULAR_SALARIO


  METHOD constructor.
    super->constructor( i_nomefunc = i_nomefunc i_idfunc = i_idfunc i_salariofunc = i_salariofunc ).
    gv_bonus = i_bunosfunc.
  ENDMETHOD. "CONSTRUCTOR


  METHOD exibir_dados.
    DATA(lv_salario) = CONV string( gv_salariofunc ).
    DATA(lv_bonus) = CONV string( gv_bonus ).
    CONCATENATE gv_idfunc gv_nomefunc lv_salario lv_bonus INTO r_dados SEPARATED BY ' '.
  ENDMETHOD.
ENDCLASS.
