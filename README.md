# reMarkable Resources

This repository intends to be a collection of resources, tips, and hacks related to reMarkable Paper Pro.
As a software developer I am logging experiences and tests with my RM3 in this repository.
I assume no responsibility for any damage done to your device due to the use of this software.

## Screen Size

### reMarkable Paper Pro

* 11.8" color display
* 2160 x 1620 resolution (229 PPI)

### reMarkable 2

* 10.3" monochrome display
* 1872 x 1404 resolution (226 DPI)

## Planner

* https://github.com/geraldolsribeiro/latex-yearly-planner (Based on amazing [kudrykv](https://github.com/kudrykv/) work).

<img width="532" src="https://github.com/geraldolsribeiro/latex-yearly-planner/blob/main/examples/pictures/rm3.mos.default.dailycal.planner/05_day.png" />

## Sleeping page

<img width="532" src="https://github.com/geraldolsribeiro/reMarkable/blob/main/sleeping/sleeping_01.png" />

```bash
$ ssh root@10.11.99.1
# mount -o remount,rw /
$ cp /usr/share/remarkable/suspended.png suspended.bak.png   # Backup the original file
$ exit
$ scp root@10.11.99.1:/home/root/suspended.bak.png $HOME/Pictures/
$ file $HOME/Pictures/suspended.bak.png  # PNG image data, 1620 x 2160, 8-bit grayscale, non-interlaced
$ scp sleeping_01.png root@10.11.99.1:/home/root/
$ ssh root@10.11.99.1
# cp sleeping_01.png /usr/share/remarkable/suspended.png
# mount -o remount,ro /
```

## AZ 20

Custom dictionary template with 20 pages per character (A, B, ...).
Download from [releases](https://github.com/geraldolsribeiro/reMarkable/releases/download/0.1.0/az20.pdf).

<img width="532" src="https://github.com/geraldolsribeiro/reMarkable/blob/main/az20/az20.png" />

## Disclaimer

This project is not affiliated to, nor endorsed by, [reMarkable](https://remarkable.com/).
I assume no responsibility for any damage done to your device due to the use of this software.
