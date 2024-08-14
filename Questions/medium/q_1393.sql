select
    s.stock_name as stock_name
  , sum(if(operation="Buy", -1 * price, price)) as capital_gain_loss
from
  stocks as s
group by
  s.stock_name;