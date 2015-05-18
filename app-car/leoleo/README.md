#leo-leo
This is a sample application to demonstrate using Lotus as Web Backend API. The app consists following components:

* iOS Mobile Client

* Web Client (written also in Lotus)

* Web API Backend

# Setup

### Install Node and Bower

```
./installPackage.sh

```

If you encounter permission error. Please install

```
chmod 777 ./installPackage.sh

```

# How to start?

*Build content

```
foreman start build

```

*Run server at frontend:*

```
foreman start frontend_server

```
then open at browser

```
http://localhost:9000/

```

*Combine backend and frontend:*

```
foreman start api_server

```

then open at browser
```
http://localhost:2300/

```


**Note**

If you run conflict port with Lotus's port in Procfile.
Please change `lotus serve -p 3000` you can change '3000' by another number
