# Dockerfile for image `rcsa/python3-hdf5`

# Ingredients:

- Python 3.5 (linked to update with official image)
- HDF5 (quite cumbersome to install from source)
- PyTables (requires HDF5 installed)
- NumPy (compiling takes some time)
- Pandas (requires pytables for hdf5-files and compiling takes some time)

All taken care of...

# Build on top of this image with a Dockerfile like this:

    FROM rcsa/python3-hfd5:latest
    ENV PYTHONUNBUFFERED 1
    RUN mkdir /code
    WORKDIR /code
    ADD requirements.txt /code/
    RUN pip install -r requirements.txt
    ADD . /code/
    EXPOSE 5000
    CMD ["python", "app.py"]
