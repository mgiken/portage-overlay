1. Edit overlays section of `/etc/layman/layman.cfg`. Here's an example:

        overlays: http://www.gentoo.org/proj/en/overlays/repositories.xml
                  http://github.com/mgiken/portage-overlay/raw/master/repository.xml

2. Execute following command:

        layman -a mgiken
