# NAUData Name Service
The NAUData Name Service is a gRPC service that provides methods for resolving group names to group objects.

## API
The Name Service provides the following methods:

### ListGroups
The ListGroups method returns a list of all groups available in the system.

```protobuf
rpc ListGroups(ListGroupsRequest) returns (ListGroupsResponse) {}
```

#### ListGroupsRequest
The ListGroupsRequest message does not contain any fields. Clients simply need to send an empty message to the ListGroups method to request a list of all available groups.

#### ListGroupsResponse
The ListGroupsResponse message contains a repeated field of types.Group messages, representing the list of available groups. Clients can use the information provided in each Group message to display a list of available groups in the user interface.

### ResolveFaculty
The ResolveFaculty method takes a faculty name and returns the corresponding faculty object.

```protobuf
rpc ResolveFaculty(ResolveFacultyRequest) returns (ResolveFacultyResponse) {}
```

#### ResolveFacultyRequest
The ResolveFacultyRequest message is used to request the faculty object associated with a given faculty name. It contains a single field:

- code (string): The code of the faculty to resolve.

#### ResolveFacultyResponse
The ResolveFacultyResponse message is used to return the faculty object associated with the given faculty name. It contains a single field:

- faculty (types.Faculty): The faculty object associated with the given faculty name. If no faculty is found with the given name, an error is returned.


### ResolveGroup
The ResolveGroup method takes a group name and returns the corresponding group object.

```protobuf
rpc ResolveGroup(ResolveGroupRequest) returns (ResolveGroupResponse) {}
```

#### ResolveGroupRequest
The ResolveGroupRequest message is used to request the group object associated with a given group name. It contains a two fields:

- credentials (types.AuthCredentials): The authentication credentials got from the Auth service.
- name (string): The name of the group to resolve.
- faculty (types.Faculty): The faculty object which the group belongs to.

#### ResolveGroupResponse
The ResolveGroupResponse message is used to return the group object associated with the given group name. It contains a single field:

- group (types.Group): The group object associated with the given group name. If no group is found with the given name, an error is returned.

## Usage
To use the Name Service, follow these steps:

You need to know the faculty name and group name you want to resolve.

1. Send a ResolveFaculty request to the Name Service to get the faculty object.
2. Use the faculty object to send a ResolveGroup request to the Name Service to get the group object.

You may use ListGroups to check if the group you want to resolve exists.
