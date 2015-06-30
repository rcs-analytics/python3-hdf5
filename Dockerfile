FROM python:3.4

ENV HOME /root

RUN apt-get update
RUN apt-get -yq install gcc build-essential subversion zlib1g-dev

# Build HDF5
RUN cd ; svn co -r25733 http://svn.hdfgroup.uiuc.edu/hdf5/features/vol/ hdf5-vol
RUN cd ; cd hdf5-vol ; ./configure --prefix=/usr/local/
RUN cd ; cd hdf5-vol ; make && make install

# cleanup
RUN cd ; rm -rf hdf5-vol .subversion
RUN apt-get -yq remove subversion
RUN apt-get -yq autoremove
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install numpy
RUN pip install pandas
RUN pip install tables
