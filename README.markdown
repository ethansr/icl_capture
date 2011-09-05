ICL Capture
===========

These are scripts to aid in automatically capturing video from a UVC
Compliant Webcam on Linux

To do:
* Check whether resources are in use or not
* Pull information on formats from camera
* Configuration for everything
* Rebuild ffmpeg support
* less ghetto guvcview code
* Check whether recording job is in progress.

Bugs:
* Routine to check storage space messes up for CDs (and maybe other
  types of disks. This means that the cdrom (if present) will be chosen
  as the best capture storage.
* Command generated for guvcview does work in cron

