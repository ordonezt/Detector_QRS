function array = memoria2array_int16(ruta_archivo)
    %Abrimos el archivo para lectura
    id_archivo = fopen(ruta_archivo, 'r');
    if id_archivo == -1
        disp('El archivo no existe')
    else
        %Leo el archivo
        bytes = textscan(id_archivo, '%s');
        
        %Ya no lo necesito, lo cierro
        fclose(id_archivo);
        
        %Acomodo la variable para que sea un array
        bytes = bytes{1};
        
        %Separo los bytes en numeros de 16 bits
        %Siguen estando en hexa y texto
        int16_hex_texto = strcat(bytes(2:2:end,1), bytes(1:2:end,1));
        
        %Lo convierto a numeros
        array = typecast(uint16(hex2dec(int16_hex_texto)),'int16');
        
%         %El primer dato no me sirve (Estado y comando del DEA)
%         array = array(2:end);
        
        %Lo grafico
        plot(array);
    end
end