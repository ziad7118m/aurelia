import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/profile_cubit.dart';
import '../../logic/cubit/profile_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    context.read<ProfileCubit>().GetCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ProfileSuccess) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${state.user.fullName}'),
                  const SizedBox(height: 12),
                  Text('Email: ${state.user.email}'),
                ],
              ),
            );
          }

          if (state is ProfileFailure) {
            return Center(
              child: Text(state.message),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}