# A dockerfile must always start by importing the base image.
# We use the keyword 'FROM' to do that.
# In our example, we want import the python image.
# So we write 'python' for the image name and 'latest' for the version.
# Note that we also specify a platform?
FROM --platform=amd64 conda/miniconda3:latest

# The WORKDIR command sets the working directory for subseqent command.
WORKDIR /src

# In order to launch our python code, we must import it into our image.
# We use the keyword 'COPY' to do that.
# The first parameter 'main.py' is the name of the file on the host.
# The second parameter '/' is the path where to put the file on the image.
# Here we put the file at the image root folder.
COPY main.py /src

# The RUN command specifyes what will be run when the image is created.
# In this case we install mamba and create a python environment.
RUN conda install mamba -n base -c conda-forge
RUN mamba create --name my_environment python=3.7

# We need to define the command to launch when we are going to run the image.
# We use the keyword 'CMD' to do that.
# The following command will execute "python ./main.py".
CMD [ "python", "./main.py" ]