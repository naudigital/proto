# NAUData Auth Service
The NAUData Auth Service is responsible for authenticating users. It uses Google's OAuth to authenticate users and provide access to the rest of the services in the project.

## Service Protobuf
The auth service is defined in the `service.proto` file, which specifies the methods that are available on the service. Here is an overview of the methods defined in the auth/service.proto file:

- `GetOAuthURL`: Returns Google's OAuth URL that the user should be redirected to for authentication.
- `GetCredentials`: Returns the authentication credentials if the user has authenticated with Google, or an error message otherwise.
- `RenewCredentials`: Renews the authentication token if it has expired.
- `Logout`: Logs the user out of the system.

## Usage

To use the NAUData Auth Service, follow these steps:


1. In your client application, provide a "login" button that initiates the authentication flow.
2. When the user clicks the "login" button, send a GetOAuthURL request to the auth service.
3. The auth service will respond with Google's OAuth URL that the user should be redirected to for authentication.
4. Redirect the user to the URL provided in the response.
5. Once the user completes the authentication process on Google's site, they will be authorized.
6. In your client application, set up a stream handler to receive the authentication credentials using the StreamCredentials method.
7. The auth service will send a StreamCredentialsResponse message over the stream as soon as the user is authorized, containing the authentication credentials. The connection will be closed after the message is sent.
8. Handle the authentication credentials returned by the StreamCredentials method in your client application. You can then use the authentication credentials to access the other services in NAUData that require authentication.

### Alternative way

#### GetCredentials polling method
In addition to the server-side streaming approach described above, you can also use the GetCredentials method to poll the auth service for authentication credentials. Here's how this approach works:

_1 to 5 are the same as above._

6. In your client application, poll the auth service at a regular interval (e.g. once per second) using the GetCredentials method to check if the user has been authorized.
7. The auth service will respond with the authentication credentials if the user has been authorized, or an error message otherwise.
8. Handle the authentication credentials or error message returned by the GetCredentials method in your client application. You can then use the authentication credentials to access the other services in your project that require authentication.

While the GetCredentials polling method is easy to implement, it can result in a high volume of network requests and may not be as efficient as the server-side streaming approach.

#### "I'm done" button

Same as above, but instead of polling the auth service, the client application provides a "I'm done" button. After the user has been authorized, they can click this button to send a GetCredentials request to the auth service. The auth service will respond with the authentication credentials if the user has been authorized, or an error message otherwise.
