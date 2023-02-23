part of 'form_bloc.dart';

abstract class FormUserState extends Equatable {
  final User user;
  const FormUserState(this.user);

  @override
  List<Object> get props => [user];
}

class FormUserInitial extends FormUserState {
  const FormUserInitial(User user) : super(user);
}

class FormUserLoaded extends FormUserState {
  const FormUserLoaded(User user) : super(user);
}

class FormUserSaved extends FormUserState {
  const FormUserSaved(User user) : super(user);
}

class FormUserFailed extends FormUserState {
  const FormUserFailed(User user) : super(user);
}
