from sqlite3 import Cursor
import mysql.connector
from mysql.connector import Error


class TablaCliente:
    #defino el constructor 
    def __init__(self):
        try:
            self.conexion= mysql.connector.connect(
                host= 'localhost',
                port= 3307,
                user= 'root',
                password= 'root',
                db= 'parking_lot'
            )

        except Error as ex:
            print('Error al intentar conectar con la Base de Datos: {0}'.fotmat(ex))

    def listar_clientes(self):
        if self.conexion.is_connected():
            try:
                cursor= self.conexion.cursor()
                cursor.execute("SELECT * FROM cliente ORDER BY nombre ASC")
                resultado= cursor.fetchall()
                return resultado

            except Error as ex:
                print('Error al intentar conectar con la Base de Datos: {0}'.fotmat(ex))
               

    def registrar_cliente(self, cliente):
        if self.conexion.is_connected():
            try:
                cursor= self.conexion.cursor()
                sql= "INSERT INTO cliente (dni_cliente, numero_cliente, nombre, apellido, telefono, email) VALUES ({0}, {1}, '{2}', '{3}', '{4}', '{5}')"
                cursor.execute(sql.format(cliente[0], cliente[1], cliente[2], cliente[3], cliente[4], cliente[5]))
                self.conexion.commit()
                print("Cliente Registrado!\n")
            except Error as ex:
                print('Error al intentar conectar con la Base de Datos: {0}'.fotmat(ex))
                    


    #-----------Actualizar-------------
    def actualizar_cliente(self, cliente):
        if self.conexion.is_connected():
            try:
                cursor= self.conexion.cursor()
                sql= "UPDATE cliente SET nombre = '{0}', apellido = '{1}', telefono = '{2}', email = '{3}' WHERE dni_cliente = {4};"
                cursor.execute(sql.format(cliente[0], cliente[1], cliente[2], cliente[3], cliente[4]))
                self.conexion.commit()
                print("Cliente Actualizado!\n")
            except Error as ex:
                print('Error al intentar conectarse con la base de datos: {0}'.format(ex)) 
            


    #---------Eliminar Cliente---------
    def eliminar_cliente(self, clienteEliminar):
        if self.conexion.is_connected():
            try:
                cursor= self.conexion.cursor()
                sql= "DELETE FROM cliente WHERE dni_cliente = {0}"
                cursor.execute(sql.format(clienteEliminar))
                self.conexion.commit()
                print("Cliente Eliminado")
            except Error as ex:
                print("Error al intentar la Conexion: {0}".format(ex))

                