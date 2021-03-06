void _noop<T>(T t) {}

typedef Union1<A> = void Function(
  void Function(A value),
  Object? _b,
  Object? _c,
  Object? _d,
  Object? _e,
  Object? _f,
  Object? _g,
  Object? _h,
  Object? _i,
);

/// {@macro union}
typedef Union2<A, B> = void Function(
  void Function(A value),
  void Function(B value),
  Object? _c,
  Object? _d,
  Object? _e,
  Object? _f,
  Object? _g,
  Object? _h,
  Object? _i,
);

/// {@macro union}
typedef Union3<A, B, C> = void Function(
  void Function(A value),
  void Function(B value),
  void Function(C value),
  Object? _d,
  Object? _e,
  Object? _f,
  Object? _g,
  Object? _h,
  Object? _i,
);

/// {@macro union}
typedef Union4<A, B, C, D> = void Function(
  void Function(A value),
  void Function(B value),
  void Function(C value),
  void Function(D value),
  Object? _e,
  Object? _f,
  Object? _g,
  Object? _h,
  Object? _i,
);

/// {@macro union}
typedef Union5<A, B, C, D, E> = void Function(
  void Function(A value),
  void Function(B value),
  void Function(C value),
  void Function(D value),
  void Function(E value),
  Object? _f,
  Object? _g,
  Object? _h,
  Object? _i,
);

/// {@macro union}
typedef Union6<A, B, C, D, E, F> = void Function(
  void Function(A value),
  void Function(B value),
  void Function(C value),
  void Function(D value),
  void Function(E value),
  void Function(F value),
  Object? _g,
  Object? _h,
  Object? _i,
);

/// {@macro union}
typedef Union7<A, B, C, D, E, F, G> = void Function(
  void Function(A value),
  void Function(B value),
  void Function(C value),
  void Function(D value),
  void Function(E value),
  void Function(F value),
  void Function(G value),
  Object? _h,
  Object? _i,
);

/// {@macro union}
typedef Union8<A, B, C, D, E, F, G, H> = void Function(
  void Function(A value),
  void Function(B value),
  void Function(C value),
  void Function(D value),
  void Function(E value),
  void Function(F value),
  void Function(G value),
  void Function(H value),
  Object? _i,
);

/// {@macro union}
typedef Union9<A, B, C, D, E, F, G, H, I> = void Function(
  void Function(A value),
  void Function(B value),
  void Function(C value),
  void Function(D value),
  void Function(E value),
  void Function(F value),
  void Function(G value),
  void Function(H value),
  void Function(I value),
);

/// Extensions that transform a value of any type into an union that contains
/// this type.
extension AsUnion<T> on T {
  /// Transform the object in a union where the object type is the first type
  /// the union can take.
  ///
  /// ```dart
  /// Union1<int> a = 42.asFirst();
  /// Union2<int, String> b = 42.asFirst();
  /// ```
  Union1<T> asFirst() => (f, _b, _c, _d, _e, _f, _g, _h, _i) => f(this);

  /// Transform the object in a union where the object type is the second type
  /// the union can take.
  ///
  /// ```dart
  /// Union2<String, int> a = 42.asFirst();
  /// Union3<String, int, double> b = 42.asFirst();
  /// ```
  Union2<A, T> asSecond<A>() {
    return (_a, f, _c, _d, _e, _f, _g, _h, _i) => f(this);
  }

  /// Transform the object in a union where the object type is the third type
  /// the union can take.
  Union3<A, B, T> asThird<A, B>() {
    return (_a, _b, f, _d, _e, _f, _g, _h, _i) => f(this);
  }

  /// Transform the object in a union where the object type is the forth type
  /// the union can take.
  Union4<A, B, C, T> asForth<A, B, C>() {
    return (_a, _b, _c, f, _e, _f, _g, _h, _i) => f(this);
  }

  /// Transform the object in a union where the object type is the fifth type
  /// the union can take.
  Union5<A, B, C, D, T> asFifth<A, B, C, D>() {
    return (_a, _b, _c, _d, f, _f, _g, _h, _i) => f(this);
  }

  /// Transform the object in a union where the object type is the sixth type
  /// the union can take.
  Union6<A, B, C, D, E, T> asSixth<A, B, C, D, E>() {
    return (_a, _b, _c, _d, _e, f, _g, _h, _i) => f(this);
  }

  /// Transform the object in a union where the object type is the seventh type
  /// the union can take.
  Union7<A, B, C, D, E, F, T> asSeventh<A, B, C, D, E, F>() {
    return (_a, _b, _c, _d, _e, _f, f, _h, _i) => f(this);
  }

  /// Transform the object in a union where the object type is the eighth type
  /// the union can take.
  Union8<A, B, C, D, E, F, G, T> asEighth<A, B, C, D, E, G, F>() {
    return (_a, _b, _c, _d, _e, _f, _g, f, _i) => f(this);
  }

  /// Transform the object in a union where the object type is the ninth type
  /// the union can take.
  Union9<A, B, C, D, E, F, G, H, T> asNinth<A, B, C, D, E, G, F, H>() {
    return (_a, _b, _c, _d, _e, _f, _g, _h, f) => f(this);
  }
}

/// An extension that expose the current value.
extension Union1Value<A> on Union1<A> {
  /// {@template union.value}
  /// The current value of the union.
  ///
  /// Its type is based the nearest common interface of all the types
  /// that the value can take.
  ///
  /// See [Union2] for examples on how `value` works.
  /// {@endtemplate}
  A get value {
    late A res;
    void f(A a) => res = a;
    final assign = f;
    this(assign, null, null, null, null, null, null, null, null);
    return res;
  }
}

/// An extension that expose the current value.
extension Union2Value<A> on Union2<A, A> {
  /// {@macro union.value}
  A get value {
    late A res;
    void f(A a) => res = a;
    final assign = f;
    this(assign, assign, null, null, null, null, null, null, null);
    return res;
  }
}

/// An extension that expose the current value.
extension Union3Value<A> on Union3<A, A, A> {
  /// {@macro union.value}
  A get value {
    late A res;
    void f(A a) => res = a;
    final assign = f;
    this(assign, assign, assign, null, null, null, null, null, null);
    return res;
  }
}

/// An extension that expose the current value.
extension Union4Value<A> on Union4<A, A, A, A> {
  /// {@macro union.value}
  A get value {
    late A res;
    void f(A a) => res = a;
    final assign = f;
    this(assign, assign, assign, assign, null, null, null, null, null);
    return res;
  }
}

/// An extension that expose the current value.
extension Union5Value<A> on Union5<A, A, A, A, A> {
  /// {@macro union.value}
  A get value {
    late A res;
    void d(A a) => res = a;
    final assign = d;
    this(assign, assign, assign, assign, assign, null, null, null, null);
    return res;
  }
}

/// An extension that expose the current value.
extension Union6Value<A> on Union6<A, A, A, A, A, A> {
  /// {@macro union.value}
  A get value {
    late A res;
    void f(A a) => res = a;
    final assign = f;
    this(assign, assign, assign, assign, assign, assign, null, null, null);
    return res;
  }
}

/// An extension that expose the current value.
extension Union7Value<A> on Union7<A, A, A, A, A, A, A> {
  /// {@macro union.value}
  A get value {
    late A res;
    void f(A a) => res = a;
    final assign = f;
    this(assign, assign, assign, assign, assign, assign, assign, null, null);
    return res;
  }
}

/// An extension that expose the current value.
extension Union8Value<A> on Union8<A, A, A, A, A, A, A, A> {
  /// {@macro union.value}
  A get value {
    late A res;
    void f(A a) => res = a;
    final assign = f;
    this(assign, assign, assign, assign, assign, assign, assign, assign, null);
    return res;
  }
}

/// An extension that expose the current value.
extension Union9Value<A> on Union9<A, A, A, A, A, A, A, A, A> {
  /// {@macro union.value}
  A get value {
    late A res;
    void f(A a) => res = a;
    final assign = f;
    this(
        assign, assign, assign, assign, assign, assign, assign, assign, assign);
    return res;
  }
}

/// The methods on Union2.
extension Union2Methods<A, B> on Union2<A, B> {
  /// {@template union.switchCase}
  /// Allow executing custom logic based on the value type in a type safe way.
  ///
  /// Prefer using this method over the `is` operator.
  ///
  /// The [switchCase] method voluntarily forces the code to handle all types
  /// that the value can take, whereas `is` doesn't.
  ///
  /// As such, while we can do:
  ///
  /// ```dart
  /// Union2<String, int> union;
  ///
  /// if (union.value is int) {
  ///   final value = union.value as int;
  ///   print(value);
  /// }
  /// // Voluntarily do nothing with String
  /// ```
  ///
  /// This code has a few issues:
  /// - it requires a cast
  /// - it is implicit instead of explicit that `String` is not handled.
  ///   This makes the code harder to read: is it a mistake or desired?
  /// - if in the future the union changes (a type changed or a new type is
  ///   added), then we may forget to update this specific piece of code.
  ///
  /// Instead, we can use [switchCase] like so:
  ///
  /// ```dart
  /// Union2<String, int> union;
  ///
  /// union.switchCase(
  ///   null, // we explicitly don't handle String
  ///   (value) => print(value),
  /// );
  /// ```
  ///
  /// This is equivalent to the previous code with a few benefits:
  /// - no cast
  /// - not handling a specific type is now explicit: we now know for sure
  ///   that it's _desired_.
  /// - if we later refactor `Union2<String, int>` into
  ///   `Union2<String, num>` or `Union3<String, int, Whatever>`, than we may
  ///   have a compile error.
  ///
  ///   This ensures that there's no invalid/dead code that we forgot to update.
  /// {@endtemplate}
  /// Callbacks can be `null`, but all callbacks are required.
  void switchCase(
    void first(A value)?,
    void second(B value)?,
  ) {
    return this(
      first ?? _noop,
      second ?? _noop,
      _noop,
      _noop,
      _noop,
      _noop,
      _noop,
      _noop,
      _noop,
    );
  }

  /// {@template union.join}
  /// Transform all the potential types that `value` can take into a single
  /// unique type.
  ///
  /// For example, we can use [join] to convert a `Union2<String, int>` into
  /// an [int]:
  ///
  /// ```dart
  /// Union2<String, int> union2;
  ///
  /// int result = union2.join(
  ///   (value) => int.tryParse(value) ?? 0,
  ///   (value) => value,
  /// );
  /// ```
  ///
  /// Alternatively, [join] can return unions too, for more advanced cases that
  /// [map] cannot handle.
  ///
  /// For example, we could use [join] to transform `Union2<String, int>` into
  /// `Union2<int, FormatException>`, to have a clean error handling on parse
  /// errors:
  ///
  /// ```dart
  /// Union2<String, int> union2;
  ///
  /// Union2<int, FormatException> res = union2.join(
  ///   (value) {
  ///     final parsed = int.tryParse(value);
  ///     return parsed != null
  ///         ? parsed.asFirst()
  ///         : FormatException().asSecond();
  ///   },
  ///   (value) => value.asFirst(),
  /// );
  /// ```
  /// {@endtemplate}
  // ignore: missing_return, the switch always returns
  T join<T>(
    T first(A value),
    T second(B value),
  ) {
    late T res;
    this(
      (a) => res = first(a),
      (a) => res = second(a),
      _noop,
      _noop,
      _noop,
      _noop,
      _noop,
      _noop,
      _noop,
    );
    return res;
  }

  /// {@template union.map}
  /// Transforms a union into another union of potentially different types.
  ///
  /// The [map] function is useful when we want to modify the current value,
  /// and the result is still a union.
  ///
  /// Example:
  ///
  /// ```dart
  /// Union2<String, int> union;
  ///
  /// Union2<String, int> modifiedValue = union.map(
  ///   (value) => 'Hello $value',
  ///   (value) => value * 2,
  /// );
  /// ```
  ///
  /// This previous snippet will do two things:
  /// - if the value is a [String], it'll prefix the value by `Hello `.
  /// - if it's an [int] instead, the value will be multiplied by 2.
  ///
  /// So original union is not modified, and a new union is created instead.
  ///
  /// The result of a callback doesn't have to be of the same type than the
  /// value type.
  ///
  /// See also:
  ///  - [join], similar to map but with more freedom on the result.
  /// {@endtemplate}
  // ignore: missing_return, the switch always return
  Union2<A2, B2> map<A2, B2>(
    A2 first(A value),
    B2 second(B value),
  ) {
    late Union2<A2, B2> res;
    this(
      (a) {
        final value = first(a);
        res = (f, _b, _c, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = second(a);
        res = (_, f, _c, _d, _e, _f, _g, _h, _i) => f(value);
      },
      _noop,
      _noop,
      _noop,
      _noop,
      _noop,
      _noop,
      _noop,
    );
    return res;
  }
}

/// The methods on Union3.
extension Union3Methods<A, B, C> on Union3<A, B, C> {
  /// {@macro union.switchCase}
  void switchCase(
    void first(A value)?,
    void second(B value)?,
    void third(C value)?,
  ) {
    return this(
      first ?? _noop,
      second ?? _noop,
      third ?? _noop,
      _noop,
      _noop,
      _noop,
      _noop,
      _noop,
      _noop,
    );
  }

  /// {@macro union.join}
  // ignore: missing_return, the switch always returns
  T join<T>(
    T first(A value),
    T second(B value),
    T third(C value),
  ) {
    late T res;
    this(
      (a) => res = first(a),
      (a) => res = second(a),
      (a) => res = third(a),
      _noop,
      _noop,
      _noop,
      _noop,
      _noop,
      _noop,
    );
    return res;
  }

  /// {@macro union.map}
  // ignore: missing_return, the switch always returns
  Union3<A2, B2, C2> map<A2, B2, C2>(
    A2 first(A value),
    B2 second(B value),
    C2 third(C value),
  ) {
    late Union3<A2, B2, C2> res;
    this(
      (a) {
        final value = first(a);
        res = (f, _b, _c, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = second(a);
        res = (_, f, _c, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = third(a);
        res = (_, _b, f, _d, _e, _f, _g, _h, _i) => f(value);
      },
      _noop,
      _noop,
      _noop,
      _noop,
      _noop,
      _noop,
    );
    return res;
  }
}

/// The methods on Union3.
extension Union4Methods<A, B, C, D> on Union4<A, B, C, D> {
  /// {@macro union.switchCase}
  void switchCase(
    void first(A value)?,
    void second(B value)?,
    void third(C value)?,
    void forth(D value)?,
  ) {
    return this(
      first ?? _noop,
      second ?? _noop,
      third ?? _noop,
      forth ?? _noop,
      _noop,
      _noop,
      _noop,
      _noop,
      _noop,
    );
  }

  /// {@macro union.join}
  // ignore: missing_return, the switch always returns
  T join<T>(
    T first(A value),
    T second(B value),
    T third(C value),
    T forth(D value),
  ) {
    late T res;
    this(
      (a) => res = first(a),
      (a) => res = second(a),
      (a) => res = third(a),
      (a) => res = forth(a),
      _noop,
      _noop,
      _noop,
      _noop,
      _noop,
    );
    return res;
  }

  /// {@macro union.map}
  // ignore: missing_return, the switch always returns
  Union4<A2, B2, C2, D2> map<A2, B2, C2, D2>(
    A2 first(A value),
    B2 second(B value),
    C2 third(C value),
    D2 forth(D value),
  ) {
    late Union4<A2, B2, C2, D2> res;
    this(
      (a) {
        final value = first(a);
        res = (f, _b, _c, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = second(a);
        res = (_, f, _c, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = third(a);
        res = (_, _b, f, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = forth(a);
        res = (_, _b, _c, f, _e, _f, _g, _h, _i) => f(value);
      },
      _noop,
      _noop,
      _noop,
      _noop,
      _noop,
    );
    return res;
  }
}

/// The methods on Union3.
extension Union5Methods<A, B, C, D, E> on Union5<A, B, C, D, E> {
  /// {@macro union.switchCase}
  void switchCase(
    void first(A value)?,
    void second(B value)?,
    void third(C value)?,
    void forth(D value)?,
    void fifth(E value)?,
  ) {
    return this(
      first ?? _noop,
      second ?? _noop,
      third ?? _noop,
      forth ?? _noop,
      fifth ?? _noop,
      _noop,
      _noop,
      _noop,
      _noop,
    );
  }

  /// {@macro union.join}
  // ignore: missing_return, the switch always returns
  T join<T>(
    T first(A value),
    T second(B value),
    T third(C value),
    T forth(D value),
    T fifth(E value),
  ) {
    late T res;
    this(
      (a) => res = first(a),
      (a) => res = second(a),
      (a) => res = third(a),
      (a) => res = forth(a),
      (a) => res = fifth(a),
      _noop,
      _noop,
      _noop,
      _noop,
    );
    return res;
  }

  /// {@macro union.map}
  // ignore: missing_return, the switch always returns
  Union5<A2, B2, C2, D2, E2> map<A2, B2, C2, D2, E2>(
    A2 first(A value),
    B2 second(B value),
    C2 third(C value),
    D2 forth(D value),
    E2 fifth(E value),
  ) {
    late Union5<A2, B2, C2, D2, E2> res;
    this(
      (a) {
        final value = first(a);
        res = (f, _b, _c, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = second(a);
        res = (_, f, _c, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = third(a);
        res = (_, _b, f, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = forth(a);
        res = (_, _b, _c, f, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = fifth(a);
        res = (_, _b, _c, _d, f, _f, _g, _h, _i) => f(value);
      },
      _noop,
      _noop,
      _noop,
      _noop,
    );
    return res;
  }
}

/// The methods on Union3.
extension Union6Methods<A, B, C, D, E, F> on Union6<A, B, C, D, E, F> {
  /// {@macro union.switchCase}
  void switchCase(
    void first(A value)?,
    void second(B value)?,
    void third(C value)?,
    void forth(D value)?,
    void fifth(E value)?,
    void sixth(F value)?,
  ) {
    return this(
      first ?? _noop,
      second ?? _noop,
      third ?? _noop,
      forth ?? _noop,
      fifth ?? _noop,
      sixth ?? _noop,
      _noop,
      _noop,
      _noop,
    );
  }

  /// {@macro union.join}
  // ignore: missing_return, the switch always returns
  T join<T>(
    T first(A value),
    T second(B value),
    T third(C value),
    T forth(D value),
    T fifth(E value),
    T sixth(F value),
  ) {
    late T res;
    this(
      (a) => res = first(a),
      (a) => res = second(a),
      (a) => res = third(a),
      (a) => res = forth(a),
      (a) => res = fifth(a),
      (a) => res = sixth(a),
      _noop,
      _noop,
      _noop,
    );
    return res;
  }

  /// {@macro union.map}
  // ignore: missing_return, the switch always returns
  Union6<A2, B2, C2, D2, E2, F2> map<A2, B2, C2, D2, E2, F2>(
    A2 first(A value),
    B2 second(B value),
    C2 third(C value),
    D2 forth(D value),
    E2 fifth(E value),
    F2 sixth(F value),
  ) {
    late Union6<A2, B2, C2, D2, E2, F2> res;
    this(
      (a) {
        final value = first(a);
        res = (f, _b, _c, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = second(a);
        res = (_, f, _c, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = third(a);
        res = (_, _b, f, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = forth(a);
        res = (_, _b, _c, f, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = fifth(a);
        res = (_, _b, _c, _d, f, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = sixth(a);
        res = (_, _b, _c, _d, _e, f, _g, _h, _i) => f(value);
      },
      _noop,
      _noop,
      _noop,
    );
    return res;
  }
}

/// The methods on Union3.
extension Union7Methods<A, B, C, D, E, F, G> on Union7<A, B, C, D, E, F, G> {
  /// {@macro union.switchCase}
  void switchCase(
    void first(A value)?,
    void second(B value)?,
    void third(C value)?,
    void forth(D value)?,
    void fifth(E value)?,
    void sixth(F value)?,
    void seventh(G value)?,
  ) {
    return this(
      first ?? _noop,
      second ?? _noop,
      third ?? _noop,
      forth ?? _noop,
      fifth ?? _noop,
      sixth ?? _noop,
      seventh ?? _noop,
      _noop,
      _noop,
    );
  }

  /// {@macro union.join}
  // ignore: missing_return, the switch always returns
  T join<T>(
    T first(A value),
    T second(B value),
    T third(C value),
    T forth(D value),
    T fifth(E value),
    T sixth(F value),
    T seventh(G value),
  ) {
    late T res;
    this(
      (a) => res = first(a),
      (a) => res = second(a),
      (a) => res = third(a),
      (a) => res = forth(a),
      (a) => res = fifth(a),
      (a) => res = sixth(a),
      (a) => res = seventh(a),
      _noop,
      _noop,
    );
    return res;
  }

  /// {@macro union.map}
  // ignore: missing_return, the switch always returns
  Union7<A2, B2, C2, D2, E2, F2, G2> map<A2, B2, C2, D2, E2, F2, G2>(
    A2 first(A value),
    B2 second(B value),
    C2 third(C value),
    D2 forth(D value),
    E2 fifth(E value),
    F2 sixth(F value),
    G2 seventh(G value),
  ) {
    late Union7<A2, B2, C2, D2, E2, F2, G2> res;
    this(
      (a) {
        final value = first(a);
        res = (f, _b, _c, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = second(a);
        res = (_, f, _c, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = third(a);
        res = (_, _b, f, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = forth(a);
        res = (_, _b, _c, f, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = fifth(a);
        res = (_, _b, _c, _d, f, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = sixth(a);
        res = (_, _b, _c, _d, _e, f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = seventh(a);
        res = (_, _b, _c, _d, _e, _f, f, _h, _i) => f(value);
      },
      _noop,
      _noop,
    );
    return res;
  }
}

/// The methods on Union3.
extension Union8Methods<A, B, C, D, E, F, G, H>
    on Union8<A, B, C, D, E, F, G, H> {
  /// {@macro union.switchCase}
  void switchCase(
    void first(A value)?,
    void second(B value)?,
    void third(C value)?,
    void forth(D value)?,
    void fifth(E value)?,
    void sixth(F value)?,
    void seventh(G value)?,
    void eighth(H value)?,
  ) {
    return this(
      first ?? _noop,
      second ?? _noop,
      third ?? _noop,
      forth ?? _noop,
      fifth ?? _noop,
      sixth ?? _noop,
      seventh ?? _noop,
      eighth ?? _noop,
      _noop,
    );
  }

  /// {@macro union.join}
  // ignore: missing_return, the switch always returns
  T join<T>(
    T first(A value),
    T second(B value),
    T third(C value),
    T forth(D value),
    T fifth(E value),
    T sixth(F value),
    T seventh(G value),
    T eighth(H value),
  ) {
    late T res;
    this(
      (a) => res = first(a),
      (a) => res = second(a),
      (a) => res = third(a),
      (a) => res = forth(a),
      (a) => res = fifth(a),
      (a) => res = sixth(a),
      (a) => res = seventh(a),
      (a) => res = eighth(a),
      _noop,
    );
    return res;
  }

  /// {@macro union.map}
  // ignore: missing_return, the switch always returns
  Union8<A2, B2, C2, D2, E2, F2, G2, H2> map<A2, B2, C2, D2, E2, F2, G2, H2>(
    A2 first(A value),
    B2 second(B value),
    C2 third(C value),
    D2 forth(D value),
    E2 fifth(E value),
    F2 sixth(F value),
    G2 seventh(G value),
    H2 eighth(H value),
  ) {
    late Union8<A2, B2, C2, D2, E2, F2, G2, H2> res;
    this(
      (a) {
        final value = first(a);
        res = (f, _b, _c, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = second(a);
        res = (_, f, _c, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = third(a);
        res = (_, _b, f, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = forth(a);
        res = (_, _b, _c, f, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = fifth(a);
        res = (_, _b, _c, _d, f, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = sixth(a);
        res = (_, _b, _c, _d, _e, f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = seventh(a);
        res = (_, _b, _c, _d, _e, _f, f, _h, _i) => f(value);
      },
      (a) {
        final value = eighth(a);
        res = (_, _b, _c, _d, _e, _f, _g, f, _i) => f(value);
      },
      _noop,
    );
    return res;
  }
}

/// The methods on Union3.
extension Union9Methods<A, B, C, D, E, F, G, H, I>
    on Union9<A, B, C, D, E, F, G, H, I> {
  /// {@macro union.switchCase}
  void switchCase(
    void first(A value)?,
    void second(B value)?,
    void third(C value)?,
    void forth(D value)?,
    void fifth(E value)?,
    void sixth(F value)?,
    void seventh(G value)?,
    void eighth(H value)?,
    void ninth(I value)?,
  ) {
    return this(
      first ?? _noop,
      second ?? _noop,
      third ?? _noop,
      forth ?? _noop,
      fifth ?? _noop,
      sixth ?? _noop,
      seventh ?? _noop,
      eighth ?? _noop,
      ninth ?? _noop,
    );
  }

  /// {@macro union.join}
  // ignore: missing_return, the switch always returns
  T join<T>(
    T first(A value),
    T second(B value),
    T third(C value),
    T forth(D value),
    T fifth(E value),
    T sixth(F value),
    T seventh(G value),
    T eighth(H value),
    T ninth(I value),
  ) {
    late T res;
    this(
      (a) => res = first(a),
      (a) => res = second(a),
      (a) => res = third(a),
      (a) => res = forth(a),
      (a) => res = fifth(a),
      (a) => res = sixth(a),
      (a) => res = seventh(a),
      (a) => res = eighth(a),
      (a) => res = ninth(a),
    );
    return res;
  }

  /// {@macro union.map}
  // ignore: missing_return, the switch always returns
  Union9<A2, B2, C2, D2, E2, F2, G2, H2, I2>
      map<A2, B2, C2, D2, E2, F2, G2, H2, I2>(
    A2 first(A value),
    B2 second(B value),
    C2 third(C value),
    D2 forth(D value),
    E2 fifth(E value),
    F2 sixth(F value),
    G2 seventh(G value),
    H2 eighth(H value),
    I2 ninth(I value),
  ) {
    late Union9<A2, B2, C2, D2, E2, F2, G2, H2, I2> res;
    this(
      (a) {
        final value = first(a);
        res = (f, _b, _c, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = second(a);
        res = (_, f, _c, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = third(a);
        res = (_, _b, f, _d, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = forth(a);
        res = (_, _b, _c, f, _e, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = fifth(a);
        res = (_, _b, _c, _d, f, _f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = sixth(a);
        res = (_, _b, _c, _d, _e, f, _g, _h, _i) => f(value);
      },
      (a) {
        final value = seventh(a);
        res = (_, _b, _c, _d, _e, _f, f, _h, _i) => f(value);
      },
      (a) {
        final value = eighth(a);
        res = (_, _b, _c, _d, _e, _f, _g, f, _i) => f(value);
      },
      (a) {
        final value = ninth(a);
        res = (_, _b, _c, _d, _e, _f, _g, _h, f) => f(value);
      },
    );
    return res;
  }
}
