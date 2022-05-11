//API CONFIGURATION
const String apiHost = "localhost";
const String apiPort = "3000";
const String api = "/api";
const String type = "http://";

//CURRENT API LOCATION
const String currentAPILocation = type + apiHost + ":" + apiPort + api;
const String currentStaticLocation = type + apiHost + ":" + apiPort + "/public";

//API MPDULES
const auth = "/auth";
const content = "/content";

//API MODULE SUBDIRECTORIES
const String loginEnpoint = auth + "/login";
const String registerEndpoint = auth + "/register";
const String volunteerSetEndPoint = auth + "/setAsVolunteer";

const String contentAllEndPoint = content;
const String imagesEndPoint = "/images/";
