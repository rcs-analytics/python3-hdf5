FROM python:3.5

ENV HOME /root

RUN apt-get update
RUN apt-get -yq install gcc build-essential zlib1g-dev wget

# Build HDF5
RUN cd ; wget https://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.8.15-patch1.tar.gz
RUN cd ; tar zxf hdf5-1.8.15-patch1.tar.gz
RUN cd ; mv hdf5-1.8.15-patch1 hdf5-setup
RUN cd ; cd hdf5-setup ; ./configure --prefix=/usr/local/
RUN cd ; cd hdf5-setup ; make && make install

# cleanup
RUN cd ; rm -rf hdf5-setup
RUN apt-get -yq autoremove
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install numpy
RUN pip install pandas
RUN pip install tables
