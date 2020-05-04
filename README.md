# kaggle-python-spark
A docker image which includes almost all python data science libraries (don't think Kaggle left anything behind but if you find out that anything is missing, please do let us know, we will have it installed for you) along with PySpark configured. We will come up with a list of libraries/modules installed in this image very soon.

Using this image will help you get rid of the steps of installing Anaconda, installing all required libraries one by one and configuring Spark to work with Anaconda/Jupyter notebook. All you have to do is pull the image and boot it up. Follow the [User setup instructions](#user-setup-instructions) for detailed steps.

## User setup instructions:
1. Download and Install `Docker Desktop` (Window/Mac) or `docker-ce` (Linux).
2. Save the below content in a file named `docker-compose.yml` (remember to change `</path/to/your/workspace>` to corresponding value):

    ```yml
    version: '2.1'

    services:
        pyspark:
            image: mrinal449/kaggle-python-spark
            ports:
                - "8888:8888"
                - "4040:4040"
            environment:
                - PYSPARK_DRIVER_PYTHON=jupyter
                - PYSPARK_DRIVER_PYTHON_OPTS=lab
            volumes:
                - "</path/to/your/workspace>:/root/workspace"
            command: pyspark
    ```
3. Execute `docker-compose up` in `terminal/cmd` where the above file is saved.
4. Take the `URL` like this:
http://ce0b50f8b797:8888/?token=c32be575572898bfd6089b1a358d81e46b2afc2a7fdb3a0a 
5. Replace `ce0b50f8b797` with `localhost` and paste in a browser.
