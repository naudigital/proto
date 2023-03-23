# NAUData Schedules Service
This is a gRPC service that provides functionality to retrieve and modify schedules for different groups.

## API
The Schedules service provides the following methods:

### GetSchedules
```protobuf
rpc GetSchedules(GetSchedulesRequest) returns (GetSchedulesResponse) {}
```

Returns a list of schedules for a given group. If correct credentials are provided, the response includes additional information such as the meet URL and comments.

Request
```protobuf
message GetSchedulesRequest {
  types.AuthCredentials credentials = 1;
  types.Group group = 2;
}
```
- credentials (optional): Credentials for authentication.
- group: The group to retrieve the schedules for.

Response
```protobuf
message GetSchedulesResponse {
  repeated Schedule schedules = 1;
}
```

- schedules: A list of schedules for the given group.

### GetScheduleByDay
```protobuf
rpc GetScheduleByDay(GetScheduleByDayRequest) returns (GetScheduleByDayResponse) {}
```

Returns the schedule for a given group on a given day. If credentials are provided, the response includes additional information such as the meet URL and comments.

Request
```protobuf
message GetScheduleByDayRequest {
  types.Group group = 1;
  Week week = 2;
  Day day = 3;
}
```

- group: The group to retrieve the schedule for.
- week: The week for which to retrieve the schedule.
- day: The day for which to retrieve the schedule.

Response
```protobuf
message GetScheduleByDayResponse {
  Schedule schedule = 1;
}
```

- schedule: The schedule for the given group on the given day.

SetSchedule
```protobuf
rpc SetSchedule(SetScheduleRequest) returns (SetScheduleResponse) {}
```

Sets the schedule for a given group. Credentials are required to modify the schedule.

Request
```protobuf
message SetScheduleRequest {
  types.AuthCredentials credentials = 1;
  types.Group group = 2;
  Schedule schedule = 3;
}
```

- credentials: Credentials for authentication.
- group: The group to set the schedule for.
- schedule: The new schedule for the given group.

Response
```protobuf
message SetScheduleResponse {}
```

## Types

### Week
The Week enum represents the week of the schedule.

Possible values:

- `WEEK_UNSPECIFIED`: Unspecified week
- `WEEK_FIRST`: First week
- `WEEK_SECOND`: Second week

### Day
The Day enum represents the day of the week for a schedule.

Possible values:

- `DAY_UNSPECIFIED`: Unspecified day
- `DAY_MONDAY`: Monday
- `DAY_TUESDAY`: Tuesday
- `DAY_WEDNESDAY`: Wednesday
- `DAY_THURSDAY`: Thursday
- `DAY_FRIDAY`: Friday
- `DAY_SATURDAY`: Saturday
- `DAY_SUNDAY`: Sunday

### Schedule
The Schedule message represents a schedule for a specific week and day.

Fields:

- `classes` (repeated Class): The classes for the schedule
- `week` (Week): The week of the schedule
- `day` (Day): The day of the schedule

### Class
The Class message represents a class within a schedule.

Fields:

- `name` (string): The name of the class
- `teacher` (string): The name of the teacher
- `room` (string): The room number
- `type` (Type): The type of class (lecture, practice, lab, additional)
- `start_shift` (uint32): The start time of the class in minutes from 00:00
- `end_shift` (uint32): The end time of the class in minutes from 00:00
- `meet_url` (string): The URL to the meet (auth required)
comment (string): Additional information (auth required)

Possible values for Type:

- `TYPE_UNSPECIFIED`: Unspecified class type
- `TYPE_LECTURE`: Lecture
- `TYPE_PRACTICE`: Practice
- `TYPE_LAB`: Lab
- `TYPE_ADDITIONAL`: Additional class


## UNSPECIFIED values
All enums have an UNSPECIFIED value. This value is used to indicate that the field is not set. If the field is required, the server will return an error if the field is not set.
