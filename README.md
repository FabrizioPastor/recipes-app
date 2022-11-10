### <div align="center">Recipes App 🥘📲</div>  
  

**Elección de arquitectura MVVM**  
  

Decidí utilizar MVVM en lugar de VIPER u otra alternativa debido a los siguientes factores:  
  

- ⏰ **Tiempo**: Al contar con un plazo de 5 días decidí utilizar MVVM ya que me permite desarrollar con una mayor agilidad al no tener la complegidad que supone usar VIPER.  
  

- ❓ **Escalabilidad**:  apoyandome en el punto anterior MVVM sigue siendo una buena alternativa por si esta app desea escalar en algún punto agregando o extendiendo funcionalidad.  
  

- ⚡ **Experiencia**: He trabajado en varios proyectos que utilizaban MVVM, por lo que al conocer esta arquitectura, me sentía con más soltura al momento de picar código. Teniendo en cuenta el tiempo y la complegidad MVVM me pareció la mejor opción.  
  

**Librerías utilizadas**  
  

- 🚀 **RxSwift**: Esta librería es muy conocida cuando se habla de programación reactiva. Decidí utilizar esta librería para poder trabajar con los datos recibidos desde una API Rest de manera asincronra.  
  

- 🌄 **SDWebImage**: Esta libtería es utilizada para obtener imágenes y mostrarlas en una UIImageView, esto de forma asincrona y también posee un sistema de caché de imágenes. Utilizar este tipo de librerías que tienen soporte de caché resulta muy útil. Sobre todo cuando estamos trayendo constantemente imágenes de un servidor; lo cual consume datos.  
  

- 💀 **SkeletonView**: Esta librería es una de mis libterías favoritas. Y viene a solventar de manera elegante un problema bastante común; el cual es: Indicar al usuario que la app está solicitando datos a un servidor. Esta librería muestra una maquetación similar a la de app como twiter, facebook, youtube, cuando estas están pidiendo datos a un servidor.  
  

**Patrones utilizados**  
  

- **Observer**: Este patrón es indispensable si lo que deseas es trabajar con programación reactiva. Debido a que es el mecanismo más común para alertar a los observers que ha ocurrido un cambio.  
  

- **Singleton**: Cuando necesitas utilizar una clase común la cual va a ser llamada multiples veces ¿Para qué crear una instancia por cada llamada?. El patrón singleton viene a solventar esto, entregando una misma instancia de una clase cada vez que se necesite, ahorrando memoria al no crear una instancia de la clase por cada llamada a la misma.  

<br />

Tuve que mandar la prueba antes debido a que tengo que viajar el fin de semana. Espero poder complir sus expectativas. Saludos ! 😃

----
<div align="center">Generated using <a href="https://profilinator.rishav.dev/" target="_blank">Github Profilinator</a></div>