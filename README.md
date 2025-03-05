# Descubriendo_la_Base_de_Datos_de_Fast_Food
Trabajar con la base de datos FastFood con el objetivo de dar respuesta a preguntas sobre el funcionamiento, composición y ventas de esta empresa

<h3 align="center">¿Qué se hizo?</h3>
Se trabajó con el programa SQL Server utilizando los sublenguajes DDL y DML. El primero de ellos se empleó para crear la base de “FastFood_DB” como también las tablas contenidas en la misma definiendo las relaciones entre dichas tablas y los campos que estaban incluidos en las mismas. Mientras que, el sublenguaje DML, se utilizó para poblar con datos las tablas y, con las tablas ya listas, permitió resolver las diversas consultas solicitadas. Con las respuestas a las queries, se realizaron hallazgos claves para el funcionamiento de la institución y se proporcionaron recomendaciones estratégicas. A su vez, se adicionaron detalles de cómo se optimizó la base de datos y/o las queries. 

<h3 align="center">¿Cuáles son los objetivos?</h3>
1. Crear la base de datos y las tablas; 
2. Definir las realciones entre las tablas; 
3. Ingresar datos a las tablas;
4. Realizar queries para obtener hallazgos claves.

## <h2 align="center"> Tecnologías usadas </h2>
<p align="center">
  <img src="https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white" />
</p>

<h3 align="center">Hallazgos clave</h3>

1. Si bien el equipo de mensajería entrega la orden en un tiempo promedio de 30 minutos desde su despacho debería indagarse qué equipos se utilizan para la entrega y si una mejora en los mismos podría reducir este tiempo promedio..
2. El Canal de venta Presencial es el que genera más ingresos, por lo que el desarrollo de un plan de beneficios para los demás canales de venta podría incrementar su uso.
3. Evaluar la distribución de ingresos entre las posiciones de los empleados y analizar motivos de las diferencias halladas para entender las preferencias de los clientes por ciertos empleados y/o posiciones.
4. Considerando que la mañana es el horario con una mayor demanda respecto a ventas podría implementarse una modificación de los horarios de apertura y cierre del local para aprovechar esta situación. Si el objetivo es incrementar las ventas en los horarios tarde y noche, la aplicación de promociones y beneficios para estos momentos del día podría atraer más clientes y aumentar las ventas.
5. La tendencia de ingresos por mes varía siendo Septiembre el mes con mayores ingresos y Octubre el que posee menos. Aprovechar fechas festivas y/o especiales en los cinco meses con menos ingresos mediante el desarrollo de promociones atractivas para los clientes podría aumentar considerablemente los ingresos en dichos meses.
6. Desarrollo e implementación de un programa de beneficios para clientes previos con el objetivo de lograr que vuelvan a consumir en las sucursales, ya que hasta el momento solo se registran nuevos clientes cada mes. 

<h3 align="center">Recomendaciones</h3>  

1. Conocer las estrategias empleadas por las sucursales Lago, Central, Montaña, Valle y Norte que son las que presentan una mayor cantidad de ventas optimizando los recursos que disponen (minimización de km recorridos por entrega), con el objetivo de implementarlas en las demás sucursales, cuando fuese posible, buscando mejorar el rendimiento de las mismas en estos puntos clave.  

2. Teniendo en cuenta que la Facturación Total de la organización según los métodos de pago se distribuye de la siguiente manera (solo mencionando los tres primeros métodos con más facturación): Cupón de Descuento, Vale de comida y Tarjeta de Crédito, sería de utilidad diseñarse alguna promoción vinculada a estos medios de pago buscando aumentar aún más su uso. Además, ofrecer algún beneficio para otros métodos de pago sería de gran interés si la institución desea incrementar el uso de los mismos.

3. Considerando que la Sucursal Lago (SucursalID: 9) es aquella con el ingreso promedio más alto, sería indispensable comprender los motivos de esta situación teniendo en cuenta cuáles son sus estrategias de captación de clientes, los beneficios que brindan a los mismos, las promociones en vigencia y la atención brindada a los clientes, ya que toda esta información podría ser aplicada en las demás sucursales aumentando también sus ingresos.

4. Recomendaría actualizar la base de datos incorporando los registros, si están disponibles, correspondientes a los empleados de todas las sucursales exceptuando la Central (la cual ya están ingresados en la base de datos), y también los productos en las categorías sin registros aún. De este modo, la base de datos posee toda la información útil para realizar cualquier análisis que nos interese.

5. Observando que en la Sucursal Central las categorías de productos más vendidas son Comida Rápida y Pizzas, considero que desarrollar y ofrecer promociones o descuentos para las demás categorías sería una buena estrategia para incrementar sus ventas en esta sucursal.

