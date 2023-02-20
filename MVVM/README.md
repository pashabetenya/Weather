The architecture we used is called «Model-View-ViewModel» (MVVM). It allows us to divide the application into three main components:

The «Model» represents the data and business logic of the application. In our case, the model contains the «Weather» and «WeatherApiClient» classes, which are responsible for retrieving weather data from the OpenWeatherMap server.

The «View» displays the data and reacts to user actions. In our case, the view is represented by the «WeatherWidget», which displays weather data and allows the user to enter a city name.

A «ViewModel» links the model and the view. It contains the application's business logic and provides the data for the view. In our case, the «ViewModel» contains the «WeatherViewModel» class, which is responsible for retrieving weather data from the «WeatherApiClient» and provides that data to the «WeatherWidget».

The «MVVM architecture» allows us to divide responsibility between the different components of the application and simplify code testing and maintenance. It also makes it easy to add new features and functionality to the application without affecting the code already written.
