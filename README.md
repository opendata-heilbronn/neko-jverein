# neko-jverein
A JVerein installation shared through Neko

# Why?
Hibiscus and JVerein are single-user applications. They require some amount of local installation and configuration before being usable. Sharing data between installatons is also not really simple. Although Hibiscus and JVerein both support MySQL in addition to the local H2 database, only one user can be active at a time, and some data is also stored locally, for example attachments in the data folder.

This setup uses [neko](https://github.com/m1k1o/neko) to host a screenshared installation of Hibiscus and JVerein, so multiple board members can access the data without having to setup everything on their local device.

# Database
This repository contains two config files that will instruct Hibiscus and 