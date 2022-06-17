part of 'appointment_bloc.dart';

@immutable
abstract class AppointmentEvent extends Equatable {
  const AppointmentEvent();
}

class LoadAppointmentEvent extends AppointmentEvent {
  @override
  List<Object?> get props => [];
}

class PostAppointmentEvent extends AppointmentEvent {
  @override
  List<Object?> get props => [];
}
