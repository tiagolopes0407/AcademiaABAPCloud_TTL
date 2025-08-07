CLASS zcl_fabap_jul2025_exer15_ttl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_fabap_jul2025_exer15_ttl IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TYPES: BEGIN OF ty_dados_voo,
             carrier_id    TYPE /dmo/carrier_id,
             connection_id TYPE /dmo/connection_id,
             price         TYPE /dmo/flight_price,
             distance      TYPE /dmo/flight_distance,
           END OF ty_dados_voo.

    DATA t_dados_voo TYPE SORTED TABLE OF ty_dados_voo
     WITH NON-UNIQUE KEY carrier_id connection_id.

    SELECT v~carrier_id,
           v~connection_id,
           v~price,
           c~distance
      FROM /dmo/flight AS v
             INNER JOIN
               /dmo/connection AS c ON v~carrier_id = c~carrier_id
                                     AND v~connection_id = c~connection_id
      WHERE c~distance > 1000
        AND v~carrier_id = 'UA'
        AND v~connection_id IN ('0058', '0059', '1537')
      INTO TABLE @t_dados_voo.

    LOOP AT t_dados_voo ASSIGNING FIELD-SYMBOL(<dados_voo>).
      <dados_voo>-price *= '1.10'.
      out->write( |Preço atualizado para voo { <dados_voo>-carrier_id }-{ <dados_voo>-connection_id }| ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
