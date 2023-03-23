# NAUData Lists Service
The NAUData Lists service provides access to student lists for specific groups at National Aviation University.

## Usage
To use the NAUData Lists service, follow these steps:

1. Send a GetStudents request to the Lists service, providing the necessary authentication credentials and group information.
2. The Lists service will respond with a GetStudentsResponse message containing a list of Student objects.
3. Handle the list of students in your client application as necessary.

### GetStudents request
The GetStudents request is used to retrieve a list of students for a specific group. It has the following fields:

- credentials (required): An AuthCredentials object containing the authentication credentials necessary to access the Lists service.
- group (required): A Group object containing the information for the group whose student list you want to retrieve.

### GetStudents response
The GetStudents response is returned by the Lists service in response to a GetStudents request. It contains a list of Student objects.

## Types
The Lists service also defines a Student object, which has the following fields:

- id (required): The unique identifier for the student.
- name (required): The full name of the student.
- short_name (optional): An short name for the student, if available.
