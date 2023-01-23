import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';

class FirebaseMock extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

class UserMock extends Mock implements User {}
