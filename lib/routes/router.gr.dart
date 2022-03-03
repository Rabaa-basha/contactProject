// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i7;

import '../contact.dart' as _i4;
import '../contacts_list.dart' as _i3;
import '../create_contact.dart' as _i5;
import '../sign_in.dart' as _i2;
import '../update_contact.dart' as _i6;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    EmptyRouterRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    SignInRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInPage());
    },
    ListRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ListPage());
    },
    ContactRoute.name: (routeData) {
      final args = routeData.argsAs<ContactRouteArgs>();
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ContactPage(
              key: args.key, Snapshot: args.Snapshot, docID: args.docID));
    },
    CreateContactRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.CreateContactPage());
    },
    UpdateContactRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateContactRouteArgs>();
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.UpdateContactPage(
              key: args.key, Snapshot: args.Snapshot, docID: args.docID));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(EmptyRouterRoute.name, path: '/', children: [
          _i1.RouteConfig(SignInRoute.name,
              path: '', parent: EmptyRouterRoute.name),
          _i1.RouteConfig(ListRoute.name,
              path: '', parent: EmptyRouterRoute.name),
          _i1.RouteConfig(ContactRoute.name,
              path: '', parent: EmptyRouterRoute.name),
          _i1.RouteConfig(CreateContactRoute.name,
              path: '', parent: EmptyRouterRoute.name),
          _i1.RouteConfig(UpdateContactRoute.name,
              path: '', parent: EmptyRouterRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouterRoute extends _i1.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i1.PageRouteInfo>? children})
      : super(EmptyRouterRoute.name, path: '/', initialChildren: children);

  static const String name = 'EmptyRouterRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i1.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i3.ListPage]
class ListRoute extends _i1.PageRouteInfo<void> {
  const ListRoute() : super(ListRoute.name, path: '');

  static const String name = 'ListRoute';
}

/// generated route for
/// [_i4.ContactPage]
class ContactRoute extends _i1.PageRouteInfo<ContactRouteArgs> {
  ContactRoute(
      {_i7.Key? key, required dynamic Snapshot, required dynamic docID})
      : super(ContactRoute.name,
            path: '',
            args: ContactRouteArgs(key: key, Snapshot: Snapshot, docID: docID));

  static const String name = 'ContactRoute';
}

class ContactRouteArgs {
  const ContactRouteArgs(
      {this.key, required this.Snapshot, required this.docID});

  final _i7.Key? key;

  final dynamic Snapshot;

  final dynamic docID;

  @override
  String toString() {
    return 'ContactRouteArgs{key: $key, Snapshot: $Snapshot, docID: $docID}';
  }
}

/// generated route for
/// [_i5.CreateContactPage]
class CreateContactRoute extends _i1.PageRouteInfo<void> {
  const CreateContactRoute() : super(CreateContactRoute.name, path: '');

  static const String name = 'CreateContactRoute';
}

/// generated route for
/// [_i6.UpdateContactPage]
class UpdateContactRoute extends _i1.PageRouteInfo<UpdateContactRouteArgs> {
  UpdateContactRoute(
      {_i7.Key? key, required dynamic Snapshot, required dynamic docID})
      : super(UpdateContactRoute.name,
            path: '',
            args: UpdateContactRouteArgs(
                key: key, Snapshot: Snapshot, docID: docID));

  static const String name = 'UpdateContactRoute';
}

class UpdateContactRouteArgs {
  const UpdateContactRouteArgs(
      {this.key, required this.Snapshot, required this.docID});

  final _i7.Key? key;

  final dynamic Snapshot;

  final dynamic docID;

  @override
  String toString() {
    return 'UpdateContactRouteArgs{key: $key, Snapshot: $Snapshot, docID: $docID}';
  }
}
