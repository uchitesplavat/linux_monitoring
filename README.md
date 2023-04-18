# linux_monitoring

## Part 1. File generator

The script is run with 6 parameters. An example of running a script: \
`main.sh /opt/test 4 az 5 az.az 3kb`

**Parameter 1** is the absolute path. \
**Parameter 2** is the number of subfolders. \
**Parameter 3** is a list of English alphabet letters used in folder names (no more than 7 characters). \
**Parameter 4** is the number of files in each created folder. \
**Parameter 5** - the list of English alphabet letters used in the file name and extension (no more than 7 characters for the name, no more than 3 characters for the extension). \
**Parameter 6** - file size (in kilobytes, but not more than 100).

The script stops running if there is 1GB of free space left on the file system (in the / partition).

## Part 2. File system clogging

The script is run with 3 parameters. An example of running a script: \
`main.sh az az.az 3Mb`

**Parameter 1** is a list of English alphabet letters used in folder names (no more than 7 characters). \
**Parameter 2** the list of English alphabet letters used in the file name and extension (no more than 7 characters for the name, no more than 3 characters for the extension). \
**Parameter 3** - is the file size (in Megabytes, but not more than 100).

When running the script, file folders must be created in different (any, except paths containing bin or sbin) locations on the file system. The number of subfolders is up to 100. The number of files in each folder is a random number (different for each folder). The script stops running when there is 1GB of free space left on the file system (in the / partition). To check the file system free space use df -h /.

It makes a log file with data on all created folders and files (full path, creation date, file size).

At the end of the script, it displays the start time, end time and total running time of the script.

## Part 3. Cleaning the file system

The script is run with 1 parameter. The script clears the system from the folders and files created in [Part 2](#part-2-file-system-clogging) in 3 ways:

1. By log file
2. By creation date and time
3. By name mask (i.e. characters, underlining and date).

The cleaning method is set as a parameter with a value of 1, 2 or 3 when you running the script.

*When deleting by date and time of creation, the user enters the start and end times up to the minute. All files created within the specified time interval must be deleted.

## Part 4. Log generator

The Script that generates 5 **nginx** log files in *combined* format. Each log should contain information for 1 day.

A random number between 100 and 1000 entries generated per day.
For each entry there randomly generated the following:

1. IP (any correct one, i.e. no ip such as 999.111.777.777)
2. Response codes (200, 201, 400, 401, 403, 404, 500, 501, 502, 503)
3. methods (GET, POST, PUT, PATCH, DELETE)
4. Dates (within a specified log day, should be in ascending order)
5. Agent request URL
6. Agents (Mozilla, Google Chrome, Opera, Safari, Internet Explorer, Microsoft Edge, Crawler and bot, Library and net tool)

## Part 5. Monitoring

The Script to parse **nginx** logs from Part 4 via **awk**.
The script is run with 1 parameter, which has a value of 1, 2, 3 or 4.

Depending on the value of the parameter, output:

1. All entries sorted by response code
2. All unique IPs found in the entries
3. All requests with errors (response code - 4xx or 5xxx)
4. All unique IPs found among the erroneous requests

## Part 6. **GoAccess**

GoAccess utility to get the same information as in Part 5

Opening the web interface of the utility on the local machine.

## Part 7. **Prometheus** and **Grafana**

## Part 8. A ready-made dashboard

## Part 9. Bonus. My own *node_exporter*