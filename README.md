# kaggle-python-spark
A docker image which includes almost all python data science libraries along with PySpark configured.

## User setup instructions:
1. Download and install docker
2. Pull the image by executing the following command:
    `docker pull mrinal449/kaggle-python-spark`
3. Starup a Jupyter container using this image by executing the following command:
    * Python:
        `docker -ti --rm -p 8888:8888 -p 4040:4040 -v "/path/to/your/workspace/in/host/machine":"/root/workspace" mrinal449/kaggle-python-spark:latest jupyter lab`
    * PySpark:
        `docker -ti --rm -p 8888:8888 -p 4040:4040 -v "/path/to/your/workspace/in/host/machine":"/root/workspace" mrinal449/kaggle-python-spark:latest pyspark`
4. Copy the generated URL with token and paste it in your favorite web browser, but **DON'T** hit ENTER yet. The URL should look like this:
http://215fb0371469:8888/?token=fa23cac25e899027ab5587f6b6569321835da0f440647ee9
5. The `215fb0371469` is the hostname of the container. Please replace it with `localhost`. Now you can press that ENTER.
6. Just a quick note, wherever in a URL you see `215fb0371469`, replace it with `localhost`.

### NOTE: If you are connected to a VPN, volume mapping (-v option) won't work. This problem is native to docker itself, nothing special about this image. So, consequently, your changes won't be persisted in your host machine. But, you will still be able to use it for ad hoc tasks where saving files or notebook is not what you're looking for.