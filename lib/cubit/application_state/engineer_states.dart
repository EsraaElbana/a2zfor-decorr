import 'dart:io';
abstract class EngineerStates{}

class InitialState extends EngineerStates{}


class SliderLoading extends EngineerStates{}
class SliderSuccess extends EngineerStates{}
class SliderError extends EngineerStates{}



class ServerErrorEngineer extends EngineerStates{}




class EngineerLoading extends EngineerStates {}



class EngineerIImgLoading extends EngineerStates {}

class EngineerImageSelected extends EngineerStates {
  final File image;

  EngineerImageSelected(this.image);
}

class ProfilePicSuccessState extends EngineerStates {}

class ProfilePicFailedState extends EngineerStates {
  final String error;

  ProfilePicFailedState(this.error);
}

class EditEngineerSuccess extends EngineerStates{}
class ServerErrorClient extends EngineerStates{}
class EditEngineerError extends EngineerStates{}
class EditEngineerLoading extends EngineerStates{}
//
// class EdgineerError extends EngineerStates{
//   String error;
//
//   EdgineerError(this.error);
// }


