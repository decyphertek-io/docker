Reseearch
=========

OKD is the open sourced Openshift.

Install
-------

    # Extract the downloaded tarballs and copy the binaries into your PATH. 
    $ wget https://github.com/okd-project/okd/releases/download/4.13.0-0.okd-2023-06-04-080300/openshift-client-linux-4.13.0-0.okd-2023-06-04-080300.tar.gz
    $ wget https://github.com/okd-project/okd/releases/download/4.13.0-0.okd-2023-06-04-080300/openshift-install-linux-4.13.0-0.okd-2023-06-04-080300.tar.gz
    $ wget https://www.okd.io/vrutkovs.pub
    # Then run the following from an empty directory:
    $ openshift-install create cluster

References
-----------

    # https://www.okd.io/installation/#getting-started
    # https://github.com/okd-project/okd/releases