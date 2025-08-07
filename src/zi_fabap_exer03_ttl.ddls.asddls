@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View de Exercício 03'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_FABAP_EXER03_TTL
  as select from /dmo/customer as Customer
{
  key Customer.customer_id as CustomerId,
      Customer.first_name  as FirstName,
      Customer.last_name   as LastName,
      concat_with_space(
        concat_with_space(
        concat( Customer.street, ','), Customer.city, 1 ),
        concat_with_space( '-', Customer.country_code, 1 ) , 1
      )                    as FullAddress
}
