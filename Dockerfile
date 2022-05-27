FROM python:3.7

ENV PRJHOME=/app

RUN python -m pip install --upgrade pip
COPY requirements.txt $PRJHOME/
RUN pip install -r $PRJHOME/requirements.txt

COPY main.py $PRJHOME/
COPY entrypoint.sh $PRJHOME/

WORKDIR $PRJHOME

EXPOSE 80/tcp

ENTRYPOINT ["./entrypoint.sh"]

CMD ["serve"]