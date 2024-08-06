select
    d.id
  , sum(if(d.month= "Jan", d.revenue, null)) as "Jan_Revenue"
  , sum(if(d.month= "Feb", d.revenue, null)) as "Feb_Revenue"
  , sum(if(d.month= "Mar", d.revenue, null)) as "Mar_Revenue"
  , sum(if(d.month= "Apr", d.revenue, null)) as "Apr_Revenue"
  , sum(if(d.month= "May", d.revenue, null)) as "May_Revenue"
  , sum(if(d.month= "Jun", d.revenue, null)) as "Jun_Revenue"
  , sum(if(d.month= "Jul", d.revenue, null)) as "Jul_Revenue"
  , sum(if(d.month= "Aug", d.revenue, null)) as "Aug_Revenue"
  , sum(if(d.month= "Sep", d.revenue, null)) as "Sep_Revenue"
  , sum(if(d.month= "Oct", d.revenue, null)) as "Oct_Revenue"
  , sum(if(d.month= "Nov", d.revenue, null)) as "Nov_Revenue"
  , sum(if(d.month= "Dec", d.revenue, null)) as "Dec_Revenue"
from
  department as d
group by
  d.id;