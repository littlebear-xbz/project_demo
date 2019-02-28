# -*- coding: utf-8 -*-
"""
Created on 2018年4月24日
@author: xiongz
"""

import ConfigParser
import logging.config
import sys
import time
import json
import threading
import pymysql
from kafka import KafkaConsumer
from kafka import KafkaProducer
import hashlib
reload(sys)
sys.setdefaultencoding('utf-8')

data = open("./ks.json", 'r')
json_data = json.loads(data.read())

for i in json_data:
    print(i["ip"] + "\t" + str(i["lat"])+ "\t" + str(i["lng"])+ "\t" + i["location"]+ "\t" + i["name"] +"\t"+ hashlib.md5(i["name"]).hexdigest()[:11])