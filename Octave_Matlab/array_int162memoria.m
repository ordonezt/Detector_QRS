function array_int162memoria(array, archivo)
    %array debe ser un vector columna
    %archivo debe ser la ruta del archivo a crear o sobreescribir

    %Lo paso a hexadecimal
    hexa = ndec2hex(double(array), 16);
    %Obtengo la forma de la matriz de datos
    forma = size(hexa);
    
    %Abro el archivo como escritura y sobreescritura y si no existe lo creo
    id_archivo = fopen(archivo, 'w+');
    if id_archivo == -1
        disp('No se pudo crear el archivo');
    else
        %Recorro los datos de a 1
        for i = 1:forma(1)
            %Primero escribo el byte LSB
            fprintf(id_archivo, '%s', hexa(i, 3:4));
            fprintf(id_archivo, '%s', ' ');
            
            %Segundo escribo el byte LSB
            fprintf(id_archivo, '%s', hexa(i, 1:2));
            fprintf(id_archivo, '%s', ' ');
            
            %Si ya escribi 16 datos meto un salto de linea (Asi lo hace
            %eclipse, no se por que)
            if (mod(i, 16) == 0) && (i ~= 0)
                fprintf(id_archivo, '%s\n', '');
            end
        end
        fclose(id_archivo);
    end
end