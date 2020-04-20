# kaggle-python-spark
A docker image which includes almost all python data science libraries (don't think Kaggle left anything behind but if you find out that anything is missing, please do let us know, we will have it installed for you) along with PySpark configured. We will come up with a list of libraries/modules installed in this image very soon.

Using this image will help you get rid of the steps of installing Anaconda, installing all required libraries one by one and configuring Spark to work with Anaconda/Jupyter notebook. All you have to do is pull the image and boot it up. Follow the [User setup instructions](#user-setup-instructions) for detailed steps.

## User setup instructions:
1. Download and install docker
2. Pull the image by executing the following command:
    `docker pull mrinal449/kaggle-python-spark`
3. Starup a Jupyter container using this image by 
    1. executing the following command:
        * Python:
            * Unix/Mac users:
            ```Bash
            docker run -ti --rm -p 8888:8888 -p 4040:4040 -v "/path/to/your/workspace/in/host/machine":"/root/workspace" mrinal449/kaggle-python-spark:latest jupyter lab
            ```
            * Windows:
            ```PowerShell
            docker run -ti --rm -p 8888:8888 -p 4040:4040 -v "C:\path\to\your\workspace\in\your\host\machine":"/root/workspace" mrinal449/kaggle-python-spark:latest jupyter lab
            ```
        * PySpark:
            * Unix/Mac users:
            ```Bash
            docker run -ti --rm -p 8888:8888 -p 4040:4040 -v "/path/to/your/workspace/in/host/machine":"/root/workspace" mrinal449/kaggle-python-spark:latest pyspark
            ```
            * Windows:
            ```PowerShell
            docker run -ti --rm -p 8888:8888 -p 4040:4040 -v "C:\path\to\your\workspace\in\your\host\machine":"/root/workspace" mrinal449/kaggle-python-spark:latest pyspark
            ```
        * General: Let's just say you have started a Python notebook and you need PySprak now. But also you don't want to loose your session with all those vairables. We have a solution for that as well. Follow the below instructions please:
        ```Python
        import findspark
        findspark.init()
        ```
        This will let you create a SparkContext/SparkSession inside that notbook. But the only difference between the point `PySpark` and this setup is, in `PySpark` setup you will have the `SparkSession` (and inherently `SparkContext`) readily available, referenced as `spark`, but, in this setup you'll have to create it yourself by executing the following (for Spark configuration tweaks, we believe you know what to do):
        ```Python
        from pyspark.sql import SparkSession
        spark = SparkSession.builder.getOrCreate()
        ```
        That's it.
    or
    2. Using the sample `docker-compose.yml` file:
        1. Replace the left side of the `volumes` parameter in the compose file with `/path/to/your/workspace/in/host/machine`
        2. Execute:
        ```bash
        docker-compose -f ./docker-compose.yml up
        ```
4. Copy the generated URL with token and paste it in your favorite web browser, but **DON'T** hit ENTER yet. The URL should look like this:
http://215fb0371469:8888/?token=fa23cac25e899027ab5587f6b6569321835da0f440647ee9
5. The `215fb0371469` is the hostname of the container. Please replace it with `localhost`. Now you can press that ENTER.

### NOTES:
* For the first time when you startup an container using the above instructions, it will prompt you for sharing you drive from host machine with the docker container. Please hit YES (or similar) and also enter your `username/password` if required. This is necessary for volume mapping (-v option) i.e. for persisting your changes.
* If you want to look at the Spark UI, just go to http://localhost:4040
