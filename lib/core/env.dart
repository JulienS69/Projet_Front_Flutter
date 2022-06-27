class EnvConfig {
  static const BASE_URL = String.fromEnvironment('BASE_URL',
      defaultValue: "http://127.0.0.1:8000/api");
  static const USER = String.fromEnvironment('USER');
  static const MDP = String.fromEnvironment('MDP');
  static const String ENV_TYPE = String.fromEnvironment('ENV_TYPE');
}
