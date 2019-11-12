import socket


def get_ip_status(ip, port):
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    try:
        server.connect((ip, port))
        print('{0} port {1} is open'.format(ip, port))
    except Exception as err:
        pass
        print('{0} port {1} is not open'.format(ip, port))
    finally:
        server.close()


if __name__ == '__main__':
    host = '101.76.241.4'
    for port in range(0, 2166):
        get_ip_status(host, port)