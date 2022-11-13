def listarClientes(clientes):
    print('\nClientes: \n')
    contador= 1
    for cli in clientes:
        datos="{0}. DNI: {1} \n| Numero de Cliente: {2} \n| Nombre: {3} \n| Apellido: {4} \n| Telefono: {5} \n| Email: {6}"
        print(datos.format(contador, cli[0], cli[1], cli[2], cli[3], cli[4], cli[5], ))
        contador = contador + 1
        print(" ")

def pedirDatosRegistro():
    #------------Codigos---------------
    dniCorrecto=False
    while(not dniCorrecto):
        dni= input("Ingrese el Dni del Cliente: ")
        if dni.isnumeric() and len(dni)==8:
            dniCorrecto= True
            dni=int(dni)        
        else:
            print("Codigo incorrecto, Debe tener 8 Digitos, y solo Numeros")

    nroClienteCorrectos= False
    while(not nroClienteCorrectos):
        numeroCliente= input("Ingrese el Numero de Cliente: ")
        if numeroCliente.isnumeric():
            if (int(numeroCliente)>0):
                nroClienteCorrectos= True
                numeroCliente=int(numeroCliente)
            else:
                print("El Numero de Cliente Debe Ser Auto-Incremental")    
        else:
            print("Corrobora El numero del Cliente anterior!") 
    #numeroCliente= int(input("Ingrese Numero de Cliente: "))            
    nombre= input("Ingrese el Nombre del Cliente: ")
    apellido= input("Ingrese el Apellido del Cliente: ")
    telefono= input("Ingrese el Telefono del Cliente: ")
    email= input("Ingrese el Email del Cliente: ") 


 

    cliente=(dni, numeroCliente, nombre, apellido, telefono, email)
    return cliente

"""def pedirDatosActualizacion(cursos):
    listarCursos(cursos)

    existeCodigo=False

    codigoEditar= input("Ingrese el Codigo del Curso a Editar: ")
    codigoEditar=int(codigoEditar)
    for cur in cursos:
        if cur[0] == codigoEditar:
            existeCodigo=True
            break

    if existeCodigo:
        Nombre= input("Ingrese Nombre a Modificar: ")

        creditoCorrecto=False
        while(not creditoCorrecto):
            Creditos= input("Ingrese Creditos a Modificar: ")
            if Creditos.isnumeric():
                if (int(Creditos) > 0):
                    creditoCorrecto=True
                    Creditos=int(Creditos)
                else:
                    print("Los Creditos Deben ser Mayor a 0")
            else:
                print("Credito incorrecto debe ser un numero unicamente")

        curso=(codigoEditar, Nombre, Creditos)                    
    else:
        curso= None

    return curso        """

def pedirDatosEliminacion(clientes):
    listarClientes(clientes)

    

    dniClienteEliminar= input("Ingrese el dni de Cliente a Eliminar: ")
    dniClienteEliminar=int(dniClienteEliminar)
    
    for cli in clientes:
        
        if cli[0] ==  dniClienteEliminar:
            return dniClienteEliminar   