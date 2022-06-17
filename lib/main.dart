import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trando_assignment/bloc/appointment_bloc/appointment_bloc.dart';
import 'package:trando_assignment/models/appointment.dart';
import 'package:trando_assignment/service/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
        create: (context) => Api(),
        child: BlocProvider(
          create: (context) => AppointmentBloc(RepositoryProvider.of<Api>(context))..add(LoadAppointmentEvent()),
          child: const MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppointmentBloc, AppointmentState>(
        builder: (context, state) {
          if (state is AppointmentLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AppointmentLoadedState) {
            return ListView.builder(
              itemCount: state.appointments.length,
              itemBuilder: (context, index) => AppointmentCard(appointment: state.appointments[index]),
            );
          }
          if (state is AppointmentErrorState) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          if (state is AppointmentPostState) {
            return Center(
              child: Text(state.response),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<AppointmentBloc>(context).add(LoadAppointmentEvent());
          },
          child: const Text("Get Appointments"),
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<AppointmentBloc>(context).add(PostAppointmentEvent());
          },
          child: const Text("Post Apponitment"),
        ),
      ]),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  const AppointmentCard({Key? key, required this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(appointment.userId),
          const SizedBox(height: 5),
          Text(appointment.mentorId),
          const SizedBox(height: 5),
          Text(appointment.mentorPlanId),
          const SizedBox(height: 5),
          Text(appointment.meetingDatetime),
          const SizedBox(height: 5),
          Text(appointment.meetingPuspose),
          const SizedBox(height: 5),
          Text(appointment.duration),
        ],
      ),
    );
  }
}
