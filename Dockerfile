FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
	sudo \
	wget \
	vim
WORKDIR /opt
RUN wget https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh && \
	sh Anaconda3-2020.11-Linux-x86_64.sh -b -p /opt/anaconda3 && \
	rm -f Anaconda3-2020.11-Linux-x86_64.sh
ENV PATH /opt/anaconda3/bin:$PATH
RUN pip install --upgrade pip
RUN conda upgrade conda
RUN conda install numpy pandas jupyterlab scikit-learn matplotlib seaborn git

WORKDIR /

# Install required packegesfor Mask RCNN
#RUN conda create -n py369-tf1-MrCnn python=3.6.9
RUN git clone https://github.com/matterport/Mask_RCNN.git
RUN conda install jupyter, nb_conda
RUN conda install tensorflow-gpu=1.15
RUN conda install keras=2.2.4
RUN conda install -c conda-forge imageio
RUN conda install -c anaconda scikit-image
RUN conda install -c conda-forge imgaug
RUN conda install -c conda-forge pycocotools
RUN conda install -c conda-forge shapely
RUN conda install -c conda-forge imgaug

CMD ["jupyter","lab","--ip=0.0.0.0","--allow-root","--LabApp.token=''"]
