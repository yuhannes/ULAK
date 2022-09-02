# RSYNC

```sh
apt-get install rsync
```

## USAGE

### _`--dry-run`_
- Perform a trial run with no changes made

 This makes rsync perform a trial run that doesn't make any changes (and produces mostly the same output as a real run). It is most commonly used in combination with the `--verbose (-v)` and/or `--itemize-changes (-i)` options to see what an rsync command is going to do before one actually runs it.

The output of `--itemize-changes` is supposed to be exactly the same on a dry run and a subsequent real run (barring intentional trickery and system call failures); if it isn't, that's a bug. Other output should be mostly unchanged, but may differ in some areas. Notably, a dry run does not send the actual data for file transfers, so `--progress` has no effect, the "bytes sent", "bytes received", "literal data", and "matched data" statistics are too small, and the "speedup" value is equivalent to a run where no file transfers were needed.

```sh
rsync -avn source-dir/ username@remote_host:destination_directory
```

### _COMMANDS_

The following command will recursively copy all files from the local filesystem from destination_directory/ to the remote system. Note the following:

- Any files that do not exist on the remote system are copied over
- Any that have been updated will be copied over, although note that rsync is extremely efficient in that only the changed parts of files are copied and if the file is exactly the same if it is not copied over at all
- Any that have been deleted on the local system are deleted on the remote

```sh
rsync --ignore-existing -raz --progress source-dir/ remote_host:destination_directory --delete-before
```