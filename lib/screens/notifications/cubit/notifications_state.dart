part of 'notifications_cubit.dart';

@immutable
abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}
class NotificationsLoading extends NotificationsState {}
class NotificationsSuccess extends NotificationsState {
  final AllNotifications allNotifications;

  NotificationsSuccess({required this.allNotifications});
}
class NotificationsError extends NotificationsState {
  final String msg;

  NotificationsError({required this.msg});
}
