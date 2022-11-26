FROM tensorflow/serving:2.6.0
COPY \saved_models /models/model
COPY models.config /models/models.config
ENV MODEL_NAME=model
EXPOSE 8501
CMD ["--model_config_file=models/models.config"]