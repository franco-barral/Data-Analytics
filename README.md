En la tabla de creacion de DAX se encuentra el archivo actualizado donde:

En primer lugar, se creó una tabla calendario (Dim_Fechas), indispensable para realizar análisis temporales.
Esta tabla centraliza la información de fechas e incorpora atributos como año, trimestre, semestre, número de mes y nombre del mes,
permitiendo organizar y filtrar la información cronológicamente.

Posteriormente, se implementó una tabla de medidas, 
utilizada para almacenar de manera ordenada todas las medidas DAX del modelo. 
Esta práctica mejora la organización del proyecto, 
facilita el mantenimiento y permite localizar rápidamente los cálculos utilizados en el informe.

A continuación, 
se desarrollaron distintas medidas en DAX, entre ellas ventas totales, ventas acumuladas (YTD), ventas del año anterior (LY)
y otros indicadores necesarios para el análisis.
Estas medidas permiten obtener métricas dinámicas que se recalculan automáticamente según los filtros y el contexto aplicado por el usuario.

Finalmente, se diseñó un informe interactivo compuesto por tarjetas, gráficos y matrices,
incorporando segmentadores para facilitar la exploración de la información.
El resultado es un dashboard que permite analizar el comportamiento de las ventas desde distintas perspectivas,
ofreciendo una visualización clara y dinámica para la toma de decisiones.
