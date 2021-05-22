/* 1 */


select * from sales.Orders
where shipcity = 'Resende'

/* 2 */

select * from sales.Orders
where shipregion = 'SP' or shipregion = 'RJ'


/* 3 */

select	count(orderid) as Quantidade_Pedidos
from	sales.Orders
where	shipregion = 'SP' or shipregion = 'RJ'



/* 4 */

select	count(orderid) as Quantidade_Pedidos,SUM(freight) as Soma_Fretes, min(freight) as Valor_Minimo,max(freight) as Valor_Maximo, AVG(freight) as Media_Preco
from	sales.Orders
where	shipregion = 'SP' or shipregion = 'RJ'


/* 5 */

select	sum(unitprice) as Soma_Precos
from	sales.orders as pd inner join sales.OrderDetails as pd_det
on		pd.orderid = pd_det.orderid
where	pd.shipcountry = 'Brazil'


/* 6 */


select		sum(pd_det.unitprice * pd_det.qty) as Valor_Total_Pedidos
from		sales.orders as pd inner join sales.OrderDetails as pd_det
on			pd.orderid = pd_det.orderid
where		pd.shipcountry = 'Brazil'



