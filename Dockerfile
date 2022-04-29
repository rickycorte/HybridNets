FROM pytorch/pytorch

COPY requirements.txt requirements.txt
RUN conda install pip
RUN pip install --upgrade pip && pip install -r requirements.txt

RUN mkdir /.cache
RUN chmod 777 /.cache

CMD ["bash"]
WORKDIR /exp

# example usage
# docker build -t <image/tag> .
# nvidia-docker run -v /path/to/your/data:/exp/data -v /path/to/checkpoint:/exp/checkpoints --rm --gpus all <image/tag> python train.py ...