import sys

sys.path.append('D:/ProyectoFullStack/ProyectoFullStack/Parking Lot Web/modelo/DB')
sys.path.append('D:/ProyectoFullStack/ProyectoFullStack/Parking Lot Web/modelo')
import Funciones
from Conexion import TablaCliente


def menu_principal():
    continuar= True
    while(continuar):
        opcionCorrecta=False
        while (not opcionCorrecta):
            print('==== MENU PRINCIPAL ====')
            print('1.- Listar Clientes')
            print('2.- Registrar Clientes')
            print('3.- Actualizar Clientes')
            print('4.- Eliminar Clientes')
            print('5.- Salir')
            print('------------------------------')
            opcion= input("seleccione una opcion: ")
            opcion=int(opcion)

            if opcion <1 or opcion>5:
                print('Opcion incorrecta, Ingrese nuevamente...')

            elif opcion==5:
                continuar=False #para que cuando uno elija el 5 salga del programa
                print('Gracias por usar este sistema...')
                break #para que rompa el bucle

            else:
                opcionCorrecta=True #esta variable me indica la opcion correcta para que salga del bucle
                ejecutarOpcion(opcion)

def ejecutarOpcion(opcion):
    datos= TablaCliente()

    #------Listar Cursos-------
    if opcion==1:
        try:
            clientes= datos.listar_clientes()
            if len(clientes)>0:
                Funciones.listarClientes(clientes)
            else:
                print('No se han encotrado clientes')
        
        except:
            print('Ocurrio un Error...')


    #----------Registrar Cursos----------------        
    elif opcion==2:
        cliente= Funciones.pedirDatosRegistro()
        try:
            datos.registrar_cliente(cliente)
        except:
            print('Ocurrio un Error...')    

    #----------Actualizar Cursos---------------        
    elif opcion==3:
        try:

            clientes=datos.listar_clientes()
            if len(clientes)>0:
                cliente= Funciones.pedirDatosActualizacion(clientes)
                if cliente:
                    datos.actualizar_cliente(cliente)
                else:
                    print("dni del clinete a actualizar no encontrado")        
            else:
                print('No se han encotrado Cliente')
        except:
            print("Ocurrio un Problema...")
    


    #---------Eliminar Cursos---------------    
    elif opcion==4:
        try:

            clientes=datos.listar_clientes()
            if len(clientes)>0:
                cliente= Funciones.pedirDatosEliminacion(clientes)
                if cliente:
                    datos.eliminar_cliente(cliente)
                else:
                    print("Dni del Clinete a actualizar no encontrado")        
            else:
                print('No se han encotrado Cliente')
        except Exception as ex:
            print(str(ex))    
    else:
        print('Opcion no Valida') 

 



menu_principal()   
