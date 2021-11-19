## About

Hi! in this application you will have access to a list of exclusive offers, where you can make a purchase and view your balance.

## Main Technologies and Libraries

- [Flutter](https://docs.flutter.dev/get-started/install?utm_source=google) `2.5.3`

- [Dart](https://dart.dev/) `2.14.4`

- [GetX](https://github.com/jonataslaw/getx) `4.3.8` to manage the application's state and routes.

- [GraphQL](https://pub.dev/packages/graphql) `5.0.0` used to make requests to the api

- [Mockito](https://pub.dev/packages/mockito) `5.0.16` to generate mocked classes and methods for testing

## Development Methodology

The project's architecture was designed to be simple and testable. It was based on [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

In this project I decided not to go so deeply into architecture, avoiding including unnecessary complexity in a project of this type, but the project is ready to grow without major difficulties.

## Get Started

##### 1 - Repository clone:

```
$ git clone https://github.com/lucasjcs/nuconta_marketplace.git
```

##### 2 - Install dependencies:

You need to add an `.env` file at the root of the project to provide the api key and base url like this:

```
BASE_URL=YOUR_BASE_URL_API_HERE

ACCESS_TOKEN=YOUR_ACCESS_TOKEN_HERE
```

After adding an `.env` file, get the dependencies

```
$ cd marketplace_nuconta

$ flutter pub get
```

##### 3 - Run:

```
$ flutter run lib/main.dart
```

even though it's possible to run on the web, I recommend running it only on **Android** or **iOS** devices

## Run tests

**1 - Run de build runner**
to generate the mock files (auto generated :cry: by mockito)

```
$ flutter pub run build_runner watch --delete-conflicting-outputs
```

**2 - Run tests**

```
$ flutter test --coverage ./lib
```

**3- Generate code coverage:**

it is necessary to install **lcov** to be able to generate code coverage

```
$ genhtml -o coverage coverage/lcov.info
```

##

This project was developed with:purple_heart: by [@lucasjcs](https://github.com/lucasjcs).
