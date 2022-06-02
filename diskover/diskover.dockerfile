FROM python:3.7-alpine

# Install additional packages
RUN apk update \
  && apk add --no-cache --virtual build-dependencies \
  build-base \
  gcc \
  python3-dev \
  && apk add --no-cache bash \
  ncurses

# Copy existing application directory contents
COPY . /app/diskover

WORKDIR /app/diskover

# Install required python3 pip modules
RUN pip3 install --no-cache-dir -r requirements.txt

# Start diskoverd task woker (Essential + versions only)
CMD ["python3", "diskoverd.py", "-v"]
