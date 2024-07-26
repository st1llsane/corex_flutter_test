// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
return _User.fromJson(json);
}

/// @nodoc
mixin _$User {

 int get id => throw _privateConstructorUsedError; String get name => throw _privateConstructorUsedError; String get username => throw _privateConstructorUsedError; String get email => throw _privateConstructorUsedError; Map<String, dynamic> get address => throw _privateConstructorUsedError; String get phone => throw _privateConstructorUsedError; String get website => throw _privateConstructorUsedError; Map<String, dynamic> get company => throw _privateConstructorUsedError;



@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}) => throw _privateConstructorUsedError;
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

}









/// @nodoc
@JsonSerializable()

class _$UserImpl  implements _User {
  const _$UserImpl({required this.id, required this.name, required this.username, required this.email, required final  Map<String, dynamic> address, required this.phone, required this.website, required final  Map<String, dynamic> company}): _address = address,_company = company;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) => _$$UserImplFromJson(json);

@override final  int id;
@override final  String name;
@override final  String username;
@override final  String email;
 final  Map<String, dynamic> _address;
@override Map<String, dynamic> get address {
  if (_address is EqualUnmodifiableMapView) return _address;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_address);
}

@override final  String phone;
@override final  String website;
 final  Map<String, dynamic> _company;
@override Map<String, dynamic> get company {
  if (_company is EqualUnmodifiableMapView) return _company;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_company);
}


@override
String toString() {
  return 'User(id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$UserImpl&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other._address, _address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.website, website) || other.website == website)&&const DeepCollectionEquality().equals(other._company, _company));
}

@JsonKey(ignore: true)
@override
int get hashCode => Object.hash(runtimeType,id,name,username,email,const DeepCollectionEquality().hash(_address),phone,website,const DeepCollectionEquality().hash(_company));





@override
@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,) {
  return $default(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,) {
  return $default?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}) {
  if ($default != null) {
    return $default(this);
  }
  return orElse();
}
@override
Map<String, dynamic> toJson() {
  return _$$UserImplToJson(this, );
}
}


abstract class _User implements User {
  const factory _User({required final  int id, required final  String name, required final  String username, required final  String email, required final  Map<String, dynamic> address, required final  String phone, required final  String website, required final  Map<String, dynamic> company}) = _$UserImpl;
  

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

@override  int get id;@override  String get name;@override  String get username;@override  String get email;@override  Map<String, dynamic> get address;@override  String get phone;@override  String get website;@override  Map<String, dynamic> get company;

}
