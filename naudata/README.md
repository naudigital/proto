# NAUData protocol

## Overview
This folder contains the protocol buffer files for NAUData, a project designed to facilitate the collection and aggregation of data related to the educational process. The protocol buffer files are organized based on the service they are responsible for.

## File Structure
The protocol buffer files are organized into subfolders based on their respective services. Each service has its own folder containing three files: requests.proto, service.proto, and types.proto.

- `requests.proto` defines the request and response messages for each method in the service.
- `service.proto` defines the methods available on the service.
- `types.proto` defines the data structures used in both the requests and responses of the service.

The `types.proto` file in the root defines message types that are used across multiple services in the project. For example, it defines the `AuthCredentials` message type, which represents authentication credentials, and the `Group` message type, which represents a group of students.

## Services
The following services are currently available:

- [auth](auth/README.md): Handles authentication requests.
- [lists](lists/README.md): Handles requests related to student lists.
- [name](name/README.md): Handles requests related to resolving names.
- [schedules](schedules/README.md): Handles requests related to class schedules.
