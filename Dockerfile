FROM ubuntu:jammy



ENV DISPLAY=:99
ENV APP_HOME /usr/src/app

WORKDIR /$APP_HOME

# Install Python Version 3
RUN apt update && apt upgrade -y
RUN apt-get install python3 python3-pip -y wget

# Download Chrome Browser
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 

# Install Chrome
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb

# Install Webdriver
RUN google-chrome --version
RUN pip install webdriver-manager


# copy app into docker
COPY ./src/ $APP_HOME/

# Install requirements
RUN pip install -r requirements.txt

# set display port to avoid crash
CMD ["python3", "YOUR_SEL_PROGRAMM.py"]