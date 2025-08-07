CLASS zcl_fabap_jul2025_exer01_e_ttl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER01_E_TTL IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
* Variáveis
    DATA o_prd1 TYPE REF TO zcl_fabap_jul2025_exer01_ttl1.

    o_prd1 = NEW #( i_codprod = '001'
                    i_nomeprod = 'Pão'
                    i_precoprod = '0.20').

    out->write( 'Código do produto: ' ).
    out->write( o_prd1->get_codigo( ) ).
    out->write( 'Nome do produto: ' ).
    out->write( o_prd1->get_nome(  ) ).
    out->write( 'Preço do produto: ' ).
    out->write( o_prd1->get_preco(  ) ).
    out->write( 'Estoque do produto: ' ).
    out->write( o_prd1->get_estoque(  ) ).

    CALL METHOD o_prd1->adicionar_estoque
      EXPORTING
        i_quantadicionar = 300.

    out->write( 'Estoque do produto: ' ).
    out->write( o_prd1->get_estoque(  ) ).

    out->write( 'Valor do produto: ' ).
    out->write( o_prd1->calcula_valor(  ) ).

    CALL METHOD o_prd1->remover_estoque
      EXPORTING
        i_quantremover  = 50
      EXCEPTIONS
        ex_remove_error = 1
        OTHERS          = 2.

    IF sy-subrc = 0.
      out->write( 'Quantidade removida com sucesso!' ).
    ELSE.
      out->write( 'Erro a remover, quantidade inválida' ).
      RETURN.
    ENDIF.

    out->write( 'Estoque do produto: ' ).
    out->write( o_prd1->get_estoque(  ) ).

    out->write( 'Valor do produto: ' ).
    out->write( o_prd1->calcula_valor(  ) ).

    CALL METHOD o_prd1->remover_estoque
      EXPORTING
        i_quantremover  = 500
      EXCEPTIONS
        ex_remove_error = 1
        OTHERS          = 2.

    IF sy-subrc = 0.
      out->write( 'Quantidade removida com sucesso!' ).
    ELSE.
      out->write( 'Erro a remover, quantidade inválida' ).
      RETURN.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
