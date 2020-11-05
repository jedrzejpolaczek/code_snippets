""" help from: https://www.geeksforgeeks.org/simple-chat-room-using-python/ """

# Python program to implement client side of chat room.
import socket
import sys
import select
import time


class ChatClient:
    def __init__(self):
        self.__server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        print("{}: Checks whether sufficient arguments have been provided.".format(time.strftime("%H:%M:%S")))
        if len(sys.argv) != 3:
            print("\n{}: Not enough arguments.".format(time.strftime("%H:%M:%S")))
            print("{}: Correct usage: script, IP address, port number.\n".format(time.strftime("%H:%M:%S")))
            exit()

        print("{}: Takes the first argument from command prompt as IP address: {}.".
              format(time.strftime("%H:%M:%S"), str(sys.argv[1])))
        self.__IP_address = str(sys.argv[1])

        print("{}: Takes second argument from command prompt as port number: {}.".
              format(time.strftime("%H:%M:%S"), int(sys.argv[2])))
        self.__Port = int(sys.argv[2])

        print("{}: Connecting to server.".format(time.strftime("%H:%M:%S")))
        self.__server_socket.connect((self.__IP_address, self.__Port))

        print("----------------------------------")

    def start(self):
        """
        There are two possible input situations. Either the user wants to give  manual input to send to other people,
        or the server is sending a message  to be printed on the screen. Select returns from sockets_list, the stream
        that is reader for input. So for example, if the server wants to send a message, then the if condition will
        hold true below. If the user wants to send a message, the else condition will evaluate as true.
        """
        while True:
            print("{}: Maintains a list of possible input streams.".format(time.strftime("%H:%M:%S")))
            sockets_list = [sys.stdin, self.__server_socket]

            read_sockets, write_socket, error_socket = select.select(sockets_list, [], [])

            for socks in read_sockets:
                if socks == self.__server_socket:
                    message = socks.recv(2048)
                    print(message)
                else:
                    message = sys.stdin.readline()
                    self.__server_socket.send(message)
                    sys.stdout.write("<You>")
                    sys.stdout.write(message)
                    sys.stdout.flush()
                    self.__server_socket.close()


chat_client = ChatClient()
# chat_client.start()
