In the example I provided, we used a simple «Model-View-Controller» (MVC) architecture, where «WeatherRepository» is the model, «Application» is the controller and «WeatherWidget» is the view.

## Layers of our architecture:

### Model:

```
«WeatherRepository» is the class that makes requests to the OpenWeatherMap API,
and returns weather data in JSON-format. It is responsible for retrieving the data, and is not
aware of how to show it in the interface.
This makes it independent of the user interface.
```

### View:

```
«WeatherWidget» is the class that displays weather data. It gets the data
from «Application» via the «Data» property, and displays it in the UI.
```

### Controller:

```
«Application» is the class that links the model, and the view.
It creates an instance of «WeatherApiClient» and uses it to retrieve weather data. When the data is received,
the controller uses «State» to update the user interface.
```

This architecture is simple and can be extended as needed.
