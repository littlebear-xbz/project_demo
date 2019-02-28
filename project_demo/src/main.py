# -*- coding: utf-8 -*-
"""
Created on 2018年4月24日
@author: xiongz
"""

import ConfigParser
import logging.config
import sys
import time
CF = ConfigParser.ConfigParser()
CF.read('../conf/conf.conf')
logging.config.fileConfig("../conf/logger.conf")
logger = logging.getLogger("FileAndScreen")
reload(sys)
sys.setdefaultencoding('utf-8')

def main():
    count = 0
    while True:
        count = count + 1
        logger.info("Hi " + str(count))
        time.sleep(2)


if __name__ == '__main__':
    main()
