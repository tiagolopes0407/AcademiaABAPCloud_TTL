CLASS zcl_fabap_jul2025_exer02_ttl4 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_TTL4 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
* Variáveis
    DATA o_func TYPE REF TO zcl_fabap_jul2025_exer02_ttl1.
    DATA o_funci TYPE REF TO zcl_fabap_jul2025_exer02_ttl2.
    DATA o_funch TYPE REF TO zcl_fabap_jul2025_exer02_ttl3.

    o_funci = NEW #( i_idfunc = '01'
                    i_nomefunc = 'João'
                    i_salariofunc = 1500
                    i_bunosfunc = 500 ).

    out->write( 'Salário do Funcionário Integral:' ).
    out->write( o_funci->calcular_salario(  ) ).

    out->write( 'Dados do Funcionário Integral:' ).
    out->write( o_funci->exibir_dados(  ) ).

    o_funch = NEW #( i_idfunc = '02'
                    i_nomefunc = 'Pedro'
                    i_salariofunc = 1500
                    i_horas = 1 ).

    out->write( 'Salário do Funcionário Horista:' ).
    out->write( o_funch->calcular_salario(  ) ).

    out->write( 'Dados do Funcionário Horista:' ).
    out->write( o_funch->exibir_dados(  ) ).
  ENDMETHOD.
ENDCLASS.
