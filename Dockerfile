FROM pytorch/torchserve:0.3.0-cpu
ADD mnist /home/model-server/mnist
USER root
RUN chown -R model-server /home/model-server
USER model-server
RUN cd /home/model-server/mnist && torch-model-archiver --model-name mnist --serialized-file mnist.pth.tar --model-file model.py --handler handler --runtime python3 --version 1.0 --force
RUN cp /home/model-server/mnist/mnist.mar /home/model-server/model-store/
