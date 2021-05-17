# Empik_scripts
Shell scripts concerning Empik task for interns.

The task was to create a bash script that copies a large number of small files from one directory to another in the most efficient way. It seemed to be a general problem that can be divided into two categories: how to copy files between two directories on the same host and how to copy files between two directories on different hosts. 

Answer to both questions is similar with a couple of small differences. First of all, one problem to be considered is that although multiple small files reside in the same directory, doesn't necessarily mean that they are also stored in the same place on a physical disc. They may be rather split into multiple small chunks over the whole disk. It affects I/O operations in case they are copied to another directory. Speaking of I/O operations, for each file that is beeing transferred such parameters like attributes, location, compression or memory management must be setup. The amount of overhead depends on the number of files that are copied. The more files copied, the more overhead. That remains true when transferring files over the internet, e.g. when files are sent by Ansible instance to many remote hosts. 

The solution is to compress all the files into a tape archive (tar file). That operation is responsible for creating one archive file which will lead to decreased overhead when copying files. 

Skrypt1.sh sends files between two different hosts. In order to do so, navigate to a directory where the script is stored and run the following command:
```
./skrypt1.sh -ld <local_directory> -rd <remote_directory> -rh <remote_host> -ru <remote_user>
```
Replace:
* <local_directory> with the directory where files are stored
* <remote_directory> with the directory where files will be stored on remote host
* <remote_host> IP address of the remote host
* <remote_user> user created on remote host

Final command may look like this:
./skrypt1.sh -ld . -rd /home/stanislaw/Documents/copy_files/received_files -rh localhost -ru stanislaw

Skrypt2.sh copies files between two directories on the same host. In order to do so, navigate to a directory where the script is stored and run the following command:
```
./skrypt2.sh -ld <local_directory> -rd <remote_directory>
```
Replace:
* <local_directory> with the directory where files are stored
* <remote_directory> with the directory where files will be stored on remote host

Final command may look like this:
```
./skrypt2.sh -ld . -rd /home/stanislaw/Documents/copy_files/received_files
```

Skrypt3.sh is also used when two directories reside on the same host, but it uses different technique whatsoever. If e.g. local machine is short on disk, it may be a good idea to use symbolic links. The concept relies on creating some sort of a shortcut in the desired directory, so that it seems as if files were copied from one directory to another. To use the script, run the following command:

stored and run the following command:
```
./skrypt3.sh -ld <local_directory> -rd <remote_directory>
```
Replace:
* <local_directory> with the directory where files are stored
* <remote_directory> with the directory where files will be stored on remote host

Final command may look like this:
```
./skrypt3.sh -ld /home/stanislaw/Downloads -rd /home/stanislaw/Desktop
```
