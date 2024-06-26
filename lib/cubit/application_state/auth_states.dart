abstract class AuthStates {}

class InitialState extends AuthStates {}




class RegisterLoadingClient extends AuthStates {}
class RegisterSuccessClient extends AuthStates {}
class RegisterErrorClient extends AuthStates {}


class RegisterLoadingEngineer extends AuthStates {}
class RegisterSuccessEngineer extends AuthStates {}
class RegisterErrorEngineer extends AuthStates {}



class LoginErrorClient extends AuthStates{}
class LoginLoadingClient extends AuthStates{}
class LoginSuccessClient extends AuthStates{}



class LoginErrorEngineer extends AuthStates{}
class LoginLoadingEngineer extends AuthStates{}
class LoginSuccessEngineer extends AuthStates{}


class ServerErrorAuth extends AuthStates {}

