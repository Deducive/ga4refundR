# ga4refundR

## R function for ecommerce refunds in Google Analytics 4.
Google documentation isn't great for ecommerce refunds.
There's a lot of trial and error in figuring out exactly how refunds work and the limitations they have.

This package essentially automates the refund as specified in the [GA event builder](https://ga-dev-tools.google/ga4/event-builder/)


## Functions
There is just 1 function at present, `simple_refundR_fun`.

This function will add a financial credit against the entire transaction amount.

This credit will appear against the specified transaction id, but will appear time-wise in the present. This is an important consideration as the refund may appear in a different reporting window from when the transaction was first recorded. Events can only be backdated 3 calendar days.

### Function arguments
* `api.secret` generated within the GA4 web console
* `measurement.id` the GA4 measurement ID for the property recording ecommerce transactions
* `client.id` GA client_id - you can find your GA client id in [this article](https://www.owox.com/blog/use-cases/google-analytics-client-id/#how-find) 
* `t.order.id` the id of the order you want to refund
* `t.value` the previously recorded transaction value but expressed as a negative numeric value eg. -29.99
* `t.currency`the ISO currency the transaction was in eg. "USD"


## Pre-requisites
The `httr` package. Run `install.packages("httr")` to install or follow the prompts in RStudio if / when asked.


## Future development
* Wrap into an R package - near-term
* Add support for products - long-term
