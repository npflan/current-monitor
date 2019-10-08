import serial
import pymysql
from prometheus_client.core import GaugeMetricFamily, Gauge
from prometheus_client import REGISTRY, make_wsgi_app
from wsgiref.simple_server import make_server
import random


class Monitor:
    def __init__(self, id):
        self.refresh = 0
        self.pi_id = id
        self.ser = serial.Serial('/dev/ttyAMA0', 38400, timeout=5)

    def __current_information(self):
        while True:
            try:
                return pymysql.connect('current-mysql.current.svc.cluster.local',
                                       'monitor',
                                       '12345678',
                                       'npf',
                                       cursorclass=pymysql.cursors.DictCursor)
            except Exception as e:
                print(e)

    def pi_information(self):
        conn = self.__current_information()
        cur = conn.cursor()

        cur.execute("SELECT * FROM settings WHERE id = {}".format(self.pi_id))
        self.pi_settings = cur.fetchone()

    def __convert(self, reading):
        setting = {
            'ct1': 0.001,
            'ct2': 0.001,
            'ct3': 0.001,
            'ct4': 0.001,
            'ct5': 0.001,
            'ct6': 0.001,
            'ct7': 0.001,
            'ct8': 0.001,

        }
        data = {
            'ct1': float(reading[1]) * setting['ct1'],
            'ct2': float(reading[2]) * setting['ct2'],
            'ct3': float(reading[3]) * setting['ct3'],
            'ct4': float(reading[4]) * setting['ct4'],
            'ct5': float(reading[5]) * setting['ct5'],
            'ct6': float(reading[6]) * setting['ct6'],
            'ct7': float(reading[7]) * setting['ct7'],
            'ct8': float(reading[8]) * setting['ct8']
        }
        return data

    def collect(self):

        # Update Pi information
        if self.refresh > 15:
            self.pi_information()
            print("Settings Refresh")
        self.refresh += 1

        current_metric = GaugeMetricFamily('current',
                                           'Total amount of folders proccsed',
                                           labels=['device', 'messe_c_tavle', 'device_location', 'location', 'tavle_id', 'fase'])

        line = self.ser.readline()  # read a '\n' terminated line

        output = line.decode('ascii').rstrip('\n\r')
        if len(output) > 0:
            data = output.split(" ")
            data = self.__convert(data)

            d = self.pi_settings
            current_metric.add_metric([d['messe_c_tavle'], d['device'], d['device_location'], d['tavle_location1'], d['tavle_id1'], d['ct1']], data['ct1'])
            current_metric.add_metric([d['messe_c_tavle'], d['device'], d['device_location'], d['tavle_location1'], d['tavle_id1'], d['ct2']], data['ct2'])
            current_metric.add_metric([d['messe_c_tavle'], d['device'], d['device_location'], d['tavle_location1'], d['tavle_id1'], d['ct3']], data['ct3'])
            current_metric.add_metric([d['messe_c_tavle'], d['device'], d['device_location'], d['tavle_location1'], d['tavle_id1'], d['ct4']], data['ct4'])

            current_metric.add_metric([d['messe_c_tavle'], d['device'], d['device_location'], d['tavle_location2'], d['tavle_id2'], d['ct5']], data['ct5'])
            current_metric.add_metric([d['messe_c_tavle'], d['device'], d['device_location'], d['tavle_location2'], d['tavle_id2'], d['ct6']], data['ct6'])
            current_metric.add_metric([d['messe_c_tavle'], d['device'], d['device_location'], d['tavle_location2'], d['tavle_id2'], d['ct7']], data['ct7'])
            current_metric.add_metric([d['messe_c_tavle'], d['device'], d['device_location'], d['tavle_location2'], d['tavle_id2'], d['ct8']], data['ct8'])

        yield current_metric

pi_id = "1"

current = Monitor(pi_id)
current.pi_information()

if __name__ == '__main__':
    REGISTRY.register(current)
    app = make_wsgi_app()
    httpd = make_server('', 80, app)
    httpd.serve_forever()
