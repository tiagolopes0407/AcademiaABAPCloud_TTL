CLASS zcl_fabap_jul2025_exer13_ttl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fabap_jul2025_exer13_ttl IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA(v_transportadora) = 'AA'.
    out->write( |New Version - Carrier ID: { v_transportadora }| ).

    TYPES: BEGIN OF ty_voo,
             carrid      TYPE /dmo/carrier_id,
             connid      TYPE /dmo/connection_id,
             flight_date TYPE /dmo/flight_date,
           END OF ty_voo.

    DATA: t_voos TYPE STANDARD TABLE OF ty_voo WITH EMPTY KEY.

    t_voos = VALUE #( ( carrid = 'LH'
                        connid = '0400'
                        flight_date = '20250725' ) ).

    LOOP AT t_voos INTO DATA(s_voo).
      out->write( |New Version - Flight: { s_voo-carrid }-{ s_voo-connid }| ).
    ENDLOOP.

    SELECT * FROM /dmo/flight INTO TABLE @DATA(t_voos_selecionados) UP TO 2 ROWS.
    out->write( |New Version - Flights found (SELECT): { lines( t_voos_selecionados ) }| ).

    TRY.
        DATA(s_voo_expr) = t_voos[ 1 ].
        out->write( |New Version - First Flight: { s_voo_expr-carrid }-{ s_voo_expr-connid }| ).
      CATCH cx_sy_itab_line_not_found.
        out->write( |New Version - No first flight found.| ).
    ENDTRY.

    TRY.
        DATA(s_voo_chave) = t_voos[ carrid = 'LH' connid = '0400' ].
        out->write( |New Version - Flight LH-0400: { s_voo_chave-carrid }-{ s_voo_chave-connid }| ).
      CATCH cx_sy_itab_line_not_found.
        out->write( |New Version - Flight LH-0400 not found.| ).
    ENDTRY.

    DATA(v_char) = '12345'.
    DATA(v_int) = CONV i( v_char ).
    out->write( |New Version - Converted to INT: { v_int }| ).

    TYPES t_flight_tt TYPE STANDARD TABLE OF ty_voo WITH EMPTY KEY.

    DATA(s_conexao) = VALUE /dmo/connection(
      airport_from_id = 'FRA'
      airport_to_id   = 'JFK'
    ).

    out->write( |New Version - Connection: { s_conexao-airport_from_id }-{ s_conexao-airport_to_id }| ).

    DATA(t_voos_valor) = VALUE t_flight_tt(
      ( carrid = 'UA' connid = '0001' flight_date = '20250725' )
      ( carrid = 'DL' connid = '0002' flight_date = '20250726' )
    ).

    out->write( |New Version - Flights count (VALUE): { lines( t_voos_valor ) }| ).

    DATA(t_voos_for) =
     VALUE t_flight_tt( FOR s_voo2 IN t_voos_valor WHERE ( carrid = 'UA' )
                     ( carrid = s_voo2-carrid connid = s_voo2-connid ) ).

    out->write( |New Version - Flights for UA (FOR): { lines( t_voos_for ) }| ).

    TYPES t_numero TYPE STANDARD TABLE OF i WITH EMPTY KEY.

    DATA(t_numeros) = VALUE t_numero( ( 1 ) ( 2 ) ( 3 ) ).

    DATA(v_soma) = REDUCE i( INIT s = 0 FOR n IN t_numeros NEXT s = s + n ).

    out->write( |New Version - Sum: { v_soma }| ).

    DATA(v_codigo_cond) = 1.
    DATA(v_status_cond) = COND string(
      WHEN v_codigo_cond = 1 THEN 'Success'
      WHEN v_codigo_cond = 2 THEN 'Warning'
      ELSE 'Error'
    ).
    out->write( |New Version - Status (COND): { v_status_cond }| ).

    DATA(v_codigo_switch) = 2.
    DATA(v_status_switch) = SWITCH string( v_codigo_switch
      WHEN 1 THEN 'Success'
      WHEN 2 THEN 'Warning'
      ELSE 'Error'
    ).
    out->write( |New Version - Status (SWITCH): { v_status_switch }| ).

    TYPES: BEGIN OF ty_s1,
             field1 TYPE string,
             field2 TYPE string,
           END OF ty_s1.

    TYPES: BEGIN OF ty_s2,
             field1 TYPE string,
             field3 TYPE string,
           END OF ty_s2.

    DATA: s_s1 TYPE ty_s1.

    s_s1-field1 = 'Value1'.
    s_s1-field2 = 'Value2'.

    DATA(s_s2) = CORRESPONDING ty_s2( s_s1 ).

    out->write( |New Version - S2 Field1 (CORRESPONDING): { s_s2-field1 }| ).

    DATA(v_var1_str) = 'Hello'.
    DATA(v_var2_str) = 'World'.
    DATA(v_resultado_str) = v_var1_str && ' ' && v_var2_str.
    out->write( |New Version - Chaining Operator (Strings): { v_resultado_str }| ).

    DATA(v_nome_str) = 'ABAP'.
    DATA(v_versao_str) = '7.40'.
    DATA(v_template_string) = |Welcome to { v_nome_str } { v_versao_str }!|.
    out->write( |New Version - String Template (Strings): { v_template_string }| ).

    DATA(v_numero_entrega) = '0080003371'.
    DATA(v_entrega_formatada) = |{ v_numero_entrega ALPHA = OUT }|.
    out->write( |New Version - Embedded Expression (ALPHA) (Strings): { v_entrega_formatada }| ).

    TYPES: BEGIN OF ty_flight_group,
             carrid      TYPE /dmo/carrier_id,
             connid      TYPE /dmo/connection_id,
             price       TYPE /dmo/flight_price,
           END OF ty_flight_group.

    DATA: t_voos_grupo TYPE STANDARD TABLE OF ty_flight_group WITH EMPTY KEY.

    t_voos_grupo = VALUE #( ( carrid = 'LH' connid = '0400' price = '100' )
                            ( carrid = 'LH' connid = '0401' price = '150' )
                            ( carrid = 'UA' connid = '0001' price = '200' ) ).

    LOOP AT t_voos_grupo INTO DATA(s_voo_grupo) GROUP BY s_voo_grupo-carrid.
      DATA(v_preco_total_grupo) = REDUCE /dmo/flight_price( INIT s = 0 FOR membro IN GROUP s_voo_grupo NEXT s = s + membro-price ).
      out->write( |New Version - Carrier { s_voo_grupo-carrid } Total Price (Group By): { v_preco_total_grupo }| ).
    ENDLOOP.

    DATA t_voos_ordenados TYPE SORTED TABLE OF ty_voo WITH UNIQUE KEY carrid connid.

    DATA(t_voos_filtrados) = FILTER #( t_voos_ordenados WHERE carrid = CONV #( 'AA' ) ).

    out->write( |New Version - Filtered flights (LH): { lines( t_voos_filtrados ) }| ).

  ENDMETHOD.
ENDCLASS.
