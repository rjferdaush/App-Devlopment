// =============================================================================
//  oop_advanced_practice.dart
//  Module 6 – Advanced OOP Concepts in Dart
//  Covers: Encapsulation, Static, Factory, Singleton, Mixins, Extensions,
//          Operator Overloading, Copy Constructor, Composition, Bank System
// =============================================================================

// ─────────────────────────────────────────────────────────────────────────────
// STEP 2 – Encapsulation with Private Fields
// ─────────────────────────────────────────────────────────────────────────────

/// A [Person] class that hides its data behind private fields.
/// Direct access is blocked; only validated getters/setters are exposed.
class Person {
  // Private fields – cannot be accessed outside this file (Dart privacy = file-level)
  String _name;
  int _age;

  Person(this._name, this._age);

  // ── Getters ──────────────────────────────────────────────────────────────
  String get name => _name;
  int get age => _age;

  // ── Setters with validation ───────────────────────────────────────────────
  set name(String value) {
    if (value.trim().isEmpty) {
      print('  ✘ Name cannot be empty.');
      return;
    }
    _name = value.trim();
  }

  set age(int value) {
    if (value < 0 || value > 150) {
      print('  ✘ Invalid age: $value. Age must be between 0 and 150.');
      return;
    }
    _age = value;
  }

  @override
  String toString() => 'Person(name: $_name, age: $_age)';
}

void demoEncapsulation() {
  print('\n══════════════════════════════════════════');
  print(' STEP 2 – Encapsulation with Private Fields');
  print('══════════════════════════════════════════');

  var p = Person('Ferdaush', 25);
  print('Created: $p');

  // Valid update
  p.name = 'Jhumur';
  p.age  = 30;
  print('After valid update: $p');

  // Invalid updates – setters reject bad values
  p.name = '';       // empty name
  p.age  = -5;       // negative age
  print('After invalid attempts (unchanged): $p');
}

// ─────────────────────────────────────────────────────────────────────────────
// STEP 3 – Static Variables and Methods
// ─────────────────────────────────────────────────────────────────────────────

/// [Counter] demonstrates a static variable shared by ALL instances,
/// and a static method callable without creating any object.
class Counter {
  // Shared across every instance of Counter
  static int _totalCreated = 0;

  final int id;

  Counter() : id = ++_totalCreated {
    print('  Counter #$id created.');
  }

  // Static method – no instance needed
  static int get totalCreated => _totalCreated;

  static void resetCount() {
    _totalCreated = 0;
    print('  Counter reset to 0.');
  }
}

void demoStatic() {
  print('\n══════════════════════════════════════════');
  print(' STEP 3 – Static Variables and Methods');
  print('══════════════════════════════════════════');

  var c1 = Counter();
  var c2 = Counter();
  var c3 = Counter();

  // Call static method without any instance
  print('Total Counters created: ${Counter.totalCreated}');

  Counter.resetCount();
  print('Total after reset: ${Counter.totalCreated}');

  // Suppress unused-variable warning
  print('IDs: ${c1.id}, ${c2.id}, ${c3.id}');
}

// ─────────────────────────────────────────────────────────────────────────────
// STEP 4 – Factory Constructors
// ─────────────────────────────────────────────────────────────────────────────

/// A [Shape] class that uses a factory constructor to return the correct
/// subclass based on a string name.
///
/// Why factory constructors?
///   • They let YOU control what object is actually returned.
///   • Useful for caching, polymorphic creation, or returning subclasses.
///   • Unlike normal constructors, they can return an existing instance.
abstract class Shape {
  String get shapeName;
  double area();

  // Factory constructor – decides which concrete Shape to build
  factory Shape(String type, {double size = 1.0}) {
    switch (type.toLowerCase()) {
      case 'circle':
        return Circle(size);
      case 'square':
        return Square(size);
      default:
        throw ArgumentError('Unknown shape: $type');
    }
  }
}

class Circle implements Shape {
  final double radius;
  Circle(this.radius);

  @override
  String get shapeName => 'Circle';

  @override
  double area() => 3.14159 * radius * radius;

  @override
  String toString() => '$shapeName(radius: $radius, area: ${area().toStringAsFixed(2)})';
}

class Square implements Shape {
  final double side;
  Square(this.side);

  @override
  String get shapeName => 'Square';

  @override
  double area() => side * side;

  @override
  String toString() => '$shapeName(side: $side, area: ${area().toStringAsFixed(2)})';
}

void demoFactory() {
  print('\n══════════════════════════════════════════');
  print(' STEP 4 – Factory Constructors');
  print('══════════════════════════════════════════');

  Shape s1 = Shape('circle', size: 5.0);
  Shape s2 = Shape('square', size: 4.0);

  print('  $s1');
  print('  $s2');

  try {
    Shape('triangle'); // Should throw
  } catch (e) {
    print('  Exception caught: $e');
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// STEP 5 – Singleton Pattern
// ─────────────────────────────────────────────────────────────────────────────

/// [AppConfig] is a Singleton – only ONE instance ever exists.
///
/// How it works:
///   1. Private constructor prevents `AppConfig()` from outside.
///   2. Static `_instance` holds the single object.
///   3. Factory constructor returns the cached instance every time.
class AppConfig {
  static AppConfig? _instance;

  String appName;
  String version;

  // Private constructor
  AppConfig._internal({required this.appName, required this.version});

  // Factory returns the same instance every call
  factory AppConfig({String appName = 'MyApp', String version = '1.0.0'}) {
    _instance ??= AppConfig._internal(appName: appName, version: version);
    return _instance!;
  }

  @override
  String toString() => 'AppConfig(appName: $appName, version: $version)';
}

void demoSingleton() {
  print('\n══════════════════════════════════════════');
  print(' STEP 5 – Singleton Pattern');
  print('══════════════════════════════════════════');

  var config1 = AppConfig(appName: 'BankApp', version: '2.0');
  var config2 = AppConfig(appName: 'OtherApp', version: '9.9'); // ignored

  print('  config1: $config1');
  print('  config2: $config2');

  // Both variables point to the EXACT same object
  print('  config1 == config2? ${identical(config1, config2)}');
  print('  Same hashCode? ${config1.hashCode == config2.hashCode}');
}

// ─────────────────────────────────────────────────────────────────────────────
// STEP 6 – Mixins for Code Reuse
// ─────────────────────────────────────────────────────────────────────────────

/// A [Logger] mixin – adds logging behaviour to any class without inheritance.
mixin Logger {
  void log(String message) {
    print('  [LOG] ${DateTime.now().toIso8601String().substring(11, 19)} – $message');
  }
}

/// A [Validator] mixin – adds input validation helpers.
mixin Validator {
  bool isPositive(double value) => value > 0;
  bool isNonEmpty(String value) => value.trim().isNotEmpty;
}

/// [UserService] reuses both mixins without duplicating any code.
class UserService with Logger, Validator {
  void createUser(String name, double salary) {
    if (!isNonEmpty(name)) {
      log('Create user FAILED – name is empty.');
      return;
    }
    if (!isPositive(salary)) {
      log('Create user FAILED – salary must be positive.');
      return;
    }
    log('User "$name" created with salary \$${salary.toStringAsFixed(2)}.');
  }
}

/// [PaymentService] also reuses the same mixins independently.
class PaymentService with Logger, Validator {
  void processPayment(double amount) {
    if (!isPositive(amount)) {
      log('Payment FAILED – amount must be positive.');
      return;
    }
    log('Payment of \$${amount.toStringAsFixed(2)} processed.');
  }
}

void demoMixins() {
  print('\n══════════════════════════════════════════');
  print(' STEP 6 – Mixins for Code Reuse');
  print('══════════════════════════════════════════');

  var userSvc = UserService();
  userSvc.createUser('Ferdaush', 5000.0);
  userSvc.createUser('', 3000.0);     // invalid name
  userSvc.createUser('Jhumur', -100.0);  // invalid salary

  var paymentSvc = PaymentService();
  paymentSvc.processPayment(250.75);
  paymentSvc.processPayment(-10.0);   // invalid amount
}

// ─────────────────────────────────────────────────────────────────────────────
// STEP 7 – Extensions
// ─────────────────────────────────────────────────────────────────────────────

/// Extension on [int] – adds useful helpers without modifying the class.
extension IntExtensions on int {
  bool get isEven => this % 2 == 0;
  bool get isOdd  => !isEven;
  bool get isPrime {
    if (this < 2) return false;
    for (int i = 2; i <= (this / 2).ceil(); i++) {
      if (this % i == 0) return false;
    }
    return true;
  }
  String repeat(int times) => ('$this ' * times).trim();
}

/// Extension on [String] – adds formatting helpers.
extension StringExtensions on String {
  String get titleCase => split(' ')
      .map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1).toLowerCase()}')
      .join(' ');

  String get reversed => split('').reversed.join();

  bool get isPalindrome => toLowerCase() == toLowerCase().reversed;
}

void demoExtensions() {
  print('\n══════════════════════════════════════════');
  print(' STEP 7 – Extensions');
  print('══════════════════════════════════════════');

  // int extensions
  for (var n in [2, 3, 7, 10, 13]) {
    print('  $n → even: ${n.isEven}, prime: ${n.isPrime}');
  }
  print('  5.repeat(3) → ${5.repeat(3)}');

  // String extensions
  print('  "hello world".titleCase → ${"hello world".titleCase}');
  print('  "racecar".isPalindrome → ${"racecar".isPalindrome}');
  print('  "flutter".reversed → ${"flutter".reversed}');
}

// ─────────────────────────────────────────────────────────────────────────────
// STEP 8 – Operator Overloading
// ─────────────────────────────────────────────────────────────────────────────

/// A [Vector2D] class that supports +, -, *, ==, and toString() operators.
class Vector2D {
  final double x;
  final double y;

  const Vector2D(this.x, this.y);

  // Addition
  Vector2D operator +(Vector2D other) => Vector2D(x + other.x, y + other.y);

  // Subtraction
  Vector2D operator -(Vector2D other) => Vector2D(x - other.x, y - other.y);

  // Scalar multiplication
  Vector2D operator *(double scalar) => Vector2D(x * scalar, y * scalar);

  // Equality – compare field values, not reference
  @override
  bool operator ==(Object other) =>
      other is Vector2D && x == other.x && y == other.y;

  @override
  int get hashCode => Object.hash(x, y);

  double get magnitude => (x * x + y * y);  // squared magnitude for simplicity

  @override
  String toString() => 'Vector2D($x, $y)';
}

void demoOperatorOverloading() {
  print('\n══════════════════════════════════════════');
  print(' STEP 8 – Operator Overloading');
  print('══════════════════════════════════════════');

  var v1 = Vector2D(3, 4);
  var v2 = Vector2D(1, 2);

  print('  v1 = $v1');
  print('  v2 = $v2');
  print('  v1 + v2 = ${v1 + v2}');
  print('  v1 - v2 = ${v1 - v2}');
  print('  v1 * 2  = ${v1 * 2}');
  print('  v1 == v2? ${v1 == v2}');
  print('  v1 == Vector2D(3, 4)? ${v1 == Vector2D(3, 4)}');
}

// ─────────────────────────────────────────────────────────────────────────────
// STEP 9 – Copy Constructor Concept
// ─────────────────────────────────────────────────────────────────────────────

/// [Product] uses a named constructor `Product.copy()` to create
/// an independent clone of an existing object.
class Product {
  String name;
  double price;
  int stock;

  Product(this.name, this.price, this.stock);

  /// Copy constructor – deep copy of all fields into a new, independent object.
  Product.copy(Product source)
      : name  = source.name,
        price = source.price,
        stock = source.stock;

  @override
  String toString() => 'Product(name: $name, price: \$$price, stock: $stock)';
}

void demoCopyConstructor() {
  print('\n══════════════════════════════════════════');
  print(' STEP 9 – Copy Constructor');
  print('══════════════════════════════════════════');

  var original = Product('Laptop', 999.99, 10);
  var clone    = Product.copy(original);

  print('  Original : $original');
  print('  Clone    : $clone');

  // Modify clone – original stays untouched
  clone.name  = 'Gaming Laptop';
  clone.price = 1299.99;

  print('\n  After modifying clone:');
  print('  Original : $original');  // unchanged
  print('  Clone    : $clone');
  print('  Same object? ${identical(original, clone)}');
}

// ─────────────────────────────────────────────────────────────────────────────
// STEP 10 – Class Composition ("has-a" relationship)
// ─────────────────────────────────────────────────────────────────────────────

/// [Address] is a simple value object embedded inside [Customer].
class Address {
  final String street;
  final String city;
  final String country;

  Address(this.street, this.city, this.country);

  @override
  String toString() => '$street, $city, $country';
}

/// [Customer] HAS-A [BankAccount] (defined in Step 12) and HAS-A [Address].
/// This is composition: Customer is built from other objects.
class Customer {
  final String customerId;
  final String fullName;
  final Address address;       // has-a Address
  final BankAccount account;   // has-a BankAccount (defined below)

  Customer({
    required this.customerId,
    required this.fullName,
    required this.address,
    required this.account,
  });

  void printProfile() {
    print('  ┌─ Customer Profile ─────────────────────');
    print('  │  ID      : $customerId');
    print('  │  Name    : $fullName');
    print('  │  Address : $address');
    print('  │  Account : ${account.accountNumber}');
    print('  │  Balance : \$${account.balance.toStringAsFixed(2)}');
    print('  └────────────────────────────────────────');
  }
}

void demoComposition() {
  print('\n══════════════════════════════════════════');
  print(' STEP 10 – Class Composition');
  print('══════════════════════════════════════════');

  var addr    = Address('123 Main Street', 'Dhaka', 'Bangladesh');
  var account = BankAccount(accountNumber: 'BD-001', ownerName: 'Ferdaush');
  account.deposit(5000);

  var customer = Customer(
    customerId: 'CUST-0001',
    fullName  : 'Ferdaush Rahman',
    address   : addr,
    account   : account,
  );

  customer.printProfile();
}

// ─────────────────────────────────────────────────────────────────────────────
// STEPS 11–14 – Bank Account System (Mini Project)
// ─────────────────────────────────────────────────────────────────────────────

/// Transaction record stored in the account history.
class Transaction {
  final String type;    // 'deposit' | 'withdraw'
  final double amount;
  final DateTime timestamp;

  Transaction(this.type, this.amount) : timestamp = DateTime.now();

  @override
  String toString() {
    final sign = type == 'deposit' ? '+' : '-';
    final ts   = timestamp.toIso8601String().substring(0, 19).replaceFirst('T', ' ');
    return '  [$ts] ${type.toUpperCase().padRight(8)} $sign\$${amount.toStringAsFixed(2)}';
  }
}

/// Core [BankAccount] class demonstrating:
///   • Encapsulation  – _balance is private, exposed via getter
///   • Validation     – deposit/withdraw check for invalid amounts
///   • Mixin          – Logger for operation logging
///   • History        – tracks every transaction
class BankAccount with Logger {
  final String accountNumber;
  final String ownerName;
  double _balance;
  final List<Transaction> _history = [];

  // Track total accounts (static)
  static int _totalAccounts = 0;

  BankAccount({
    required this.accountNumber,
    required this.ownerName,
    double initialBalance = 0.0,
  }) : _balance = initialBalance {
    _totalAccounts++;
    log('Account $accountNumber opened for $ownerName.');
  }

  // ── Getter (read-only access to balance) ─────────────────────────────────
  double get balance => _balance;

  // ── Static info ───────────────────────────────────────────────────────────
  static int get totalAccounts => _totalAccounts;

  // ── Deposit ───────────────────────────────────────────────────────────────
  bool deposit(double amount) {
    if (amount <= 0) {
      log('Deposit FAILED – amount must be positive (got $amount).');
      return false;
    }
    _balance += amount;
    _history.add(Transaction('deposit', amount));
    log('Deposited \$${amount.toStringAsFixed(2)}. New balance: \$${_balance.toStringAsFixed(2)}');
    return true;
  }

  // ── Withdraw ──────────────────────────────────────────────────────────────
  bool withdraw(double amount) {
    if (amount <= 0) {
      log('Withdrawal FAILED – amount must be positive (got $amount).');
      return false;
    }
    if (amount > _balance) {
      log('Withdrawal FAILED – insufficient funds '
          '(requested \$${amount.toStringAsFixed(2)}, '
          'available \$${_balance.toStringAsFixed(2)}).');
      return false;
    }
    _balance -= amount;
    _history.add(Transaction('withdraw', amount));
    log('Withdrew \$${amount.toStringAsFixed(2)}. New balance: \$${_balance.toStringAsFixed(2)}');
    return true;
  }

  // ── Check Balance ─────────────────────────────────────────────────────────
  void checkBalance() {
    print('  Account  : $accountNumber  |  Owner: $ownerName');
    print('  Balance  : \$${_balance.toStringAsFixed(2)}');
  }

  // ── Print mini statement ──────────────────────────────────────────────────
  void printStatement() {
    print('\n  ╔══════════════ BANK STATEMENT ══════════════╗');
    print('  ║  Account : $accountNumber   Owner: $ownerName');
    if (_history.isEmpty) {
      print('  ║  No transactions yet.');
    } else {
      for (var tx in _history) {
        print('  ║$tx');
      }
    }
    print('  ║  ─────────────────────────────────────────');
    print('  ║  Current Balance : \$${_balance.toStringAsFixed(2)}');
    print('  ╚════════════════════════════════════════════╝');
  }

  // ── Operator overloading – compare accounts by balance ───────────────────
  @override
  bool operator ==(Object other) =>
      other is BankAccount && accountNumber == other.accountNumber;

  @override
  int get hashCode => accountNumber.hashCode;

  @override
  String toString() =>
      'BankAccount(#$accountNumber, owner: $ownerName, balance: \$${_balance.toStringAsFixed(2)})';
}

void demoBankAccountSystem() {
  print('\n══════════════════════════════════════════════════════');
  print(' STEPS 11–14 – Bank Account System (Mini Project)');
  print('══════════════════════════════════════════════════════');

  // Create accounts
  var ferdaushAcc = BankAccount(accountNumber: 'BD-101', ownerName: 'Ferdaush', initialBalance: 1000.0);
  var jhumurAcc   = BankAccount(accountNumber: 'BD-102', ownerName: 'Jhumur');

  print('\n  ── FERDAUSH\'S ACCOUNT ──────────────────────────');
  ferdaushAcc.checkBalance();

  // Valid deposits
  ferdaushAcc.deposit(500.0);
  ferdaushAcc.deposit(250.75);

  // Valid withdrawal
  ferdaushAcc.withdraw(200.0);

  // Invalid operations
  ferdaushAcc.withdraw(9999.0);  // insufficient funds
  ferdaushAcc.deposit(-50.0);    // negative deposit
  ferdaushAcc.withdraw(0);       // zero withdrawal

  // Print statement
  ferdaushAcc.printStatement();

  print('\n  ── JHUMUR\'S ACCOUNT ────────────────────────────');
  jhumurAcc.deposit(300.0);
  jhumurAcc.withdraw(100.0);
  jhumurAcc.printStatement();

  print('\n  ── SYSTEM INFO ─────────────────────────────────');
  print('  Total accounts opened: ${BankAccount.totalAccounts}');
  print('  ferdaush == ferdaush? ${ferdaushAcc == ferdaushAcc}');
  print('  ferdaush == jhumur?   ${ferdaushAcc == jhumurAcc}');
}

// ─────────────────────────────────────────────────────────────────────────────
// MAIN – Runs all demos in order
// ─────────────────────────────────────────────────────────────────────────────
void main() {
  print('╔══════════════════════════════════════════════════╗');
  print('║  MODULE 6 – Advanced OOP Concepts in Dart        ║');
  print('╚══════════════════════════════════════════════════╝');

  demoEncapsulation();        // Step 2
  demoStatic();               // Step 3
  demoFactory();              // Step 4
  demoSingleton();            // Step 5
  demoMixins();               // Step 6
  demoExtensions();           // Step 7
  demoOperatorOverloading();  // Step 8
  demoCopyConstructor();      // Step 9
  demoComposition();          // Step 10
  demoBankAccountSystem();    // Steps 11–14

  print('\n══════════════════════════════════════════');
  print('  All demos complete!');
  print('══════════════════════════════════════════');
}

// =============================================================================
// STEP 15 – Concepts Summary (for your submission explanation)
// =============================================================================
//
//  Concept               Class / Feature Used
//  ─────────────────── ──────────────────────────────────────────────────────
//  Encapsulation         Person   – _name, _age with validated setters
//  Static members        Counter  – _totalCreated, totalCreated getter
//  Factory constructor   Shape    – returns Circle or Square by string type
//  Singleton pattern     AppConfig – private constructor + cached _instance
//  Mixins                Logger, Validator used by UserService, PaymentService
//  Extensions            IntExtensions (isEven, isPrime), StringExtensions
//  Operator overloading  Vector2D – +, -, *, ==, toString()
//  Copy constructor      Product.copy() – independent clone of an object
//  Class composition     Customer has-a Address + BankAccount
//  Bank Account System   BankAccount – encapsulation, deposit/withdraw/history
// =============================================================================