# GA4 Refund Function
library(httr)

## Simple Refund Function
## Refunds entire transaction amount with no items specified
simple_refundR_fun <- function(api.secret,
                               measurement.id,
                               client.id,
                               t.order.id,
                               t.value,
                               t.currency) {
  POST(
    url   = "https://www.google-analytics.com/mp/collect",
    query = list(api_secret     = api.secret,
                 measurement_id = measurement.id),
    body  = list(
      client_id            = client.id,
      timestamp_micros     = as.numeric(Sys.time()) * 1000000,
      non_personalized_ads = "false",
      events = list(
        name = "refund",
        params = list(
          items = list(),
          transaction_id = t.order.id,
          value          = t.value,
          currency       = t.currency
        )
      )
    ),
    config(http_version = 1.1),
    verbose(),
    encode = "json"
  )
}
