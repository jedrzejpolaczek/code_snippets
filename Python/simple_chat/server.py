""" help from: https://www.geeksforgeeks.org/simple-chat-room-using-python/ """
# TODO: check https://docs.python.org/3/howto/sockets.html and https://docs.python.org/3/library/socket.html
# Python program to implement server side of chat room.
import socket
import sys
import _thread
import time


class ChatServer:
    """
    The first argument AF_INET is the address domain of the socket.
    This is used when we have an Internet Domain with
    any two hosts The second argument is the type of socket.
    SOCK_STREAM means that data or characters are read in a continuous flow.
    """
    def __init__(self):
        self.server_logger("Create server socket instance.")
        self.__server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.__server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

        self.server_logger("Checks whether sufficient arguments have been provided.")
        if len(sys.argv) != 3:
            self.server_logger("Not enough arguments.")
            self.server_logger("Correct usage: script, IP address, port number.\n")
            exit()

        self.server_logger("Takes the first argument from command prompt as IP address: {}.".format(str(sys.argv[1])))
        self.__IP_address = str(sys.argv[1])

        self.server_logger("Takes second argument from command prompt as port number: {}.".format(int(sys.argv[2])))
        self.__Port = int(sys.argv[2])

        # The client must be aware of these parameters.
        self.server_logger("Binds the server to an entered IP address and port number.")
        self.__server_socket.bind((self.__IP_address, self.__Port))

        self.server_logger("Enable a server to accept connections.")
        self.__server_socket.listen()

        self.__list_of_clients = []
        self.server_logger("----------------------------------")

    @staticmethod
    def server_logger(message):
        print("{}: {}".format(time.strftime("%H:%M:%S"), message))

    def client_thread(self, conn, adr):
        self.server_logger("Sends a message to the client whose user object is {}.".format(conn))
        conn.send("Welcome to this chatroom!")

        while True:
            try:
                message = conn.recv(2048)
                if message:
                    # Prints the message and address of the user who just sent the message on the server terminal.
                    self.server_logger("MESSAGE: <{}>{}".format(adr[0], message))

                    self.server_logger("Calls broadcast function to send message to all.")
                    message_to_send = "<{}>{}".format(adr[0], message)
                    self.broadcast(message_to_send, conn)
                else:
                    self.server_logger("Message have no content. Connection is broken?")
                    self.remove(conn)
                    self.server_logger("Connection {} removed.".format(conn))

            except Exception:
                continue

    def broadcast(self, message, conn):
        """
        Using the below function, we broadcast the message to all clients
        who's object is not the same as the one sending the message.
        """
        self.server_logger("Start broadcasting message: {}".format(message))
        for clients in self.__list_of_clients:
            if clients != conn:
                try:
                    clients.send(message)
                except Exception:
                    clients.close()
                    self.remove(clients)  # if the link is broken, we remove the client

    def remove(self, conn):
        """
        The following function simply removes the object from the list that was created at the beginning of the program.
        """
        self.server_logger("Removing connection: {}.".format(conn))
        if conn in self.__list_of_clients:
            self.__list_of_clients.remove(conn)

    def start(self):
        """
        Accepts a connection request and stores two parameters, connection which is a socket object for that user,
        and address which contains the IP address of the client that just connected.
        """
        while True:
            connection, address = self.__server_socket.accept()

            # For ease of broadcasting a message to all available people in the chatroom.
            self.server_logger("Maintains a list of clients.")
            self.__list_of_clients.append(connection)

            self.server_logger("{} the IP address of the user that just connected.".format(address[0]))

            self.server_logger("Creates and individual thread for every user that connects.")
            _thread.start_new_thread(self.client_thread, (connection, address))

            self.server_logger("Connection close.")
            connection.close()
            self.__server_socket.close()


chat_server = ChatServer()
chat_server.start()
