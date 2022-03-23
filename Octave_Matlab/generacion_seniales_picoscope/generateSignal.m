function generateSignal (signalNro, duracion) 
  
%%signalNro = 0 : Calibracion  
switch signalNro
  case 0
    Fs=50000;   % Se usa para la se�al de calibracion unicamente
    t = 0:1/Fs:duracion;
    y = ones(size (t));
    y = 5*y;
    periodo = 1/10;  % 1/10Hz (se utiliza para graficar)                     
            
        % ---------- AAMI ADULT Detect --------------           
        case 1
            bpm = 30;  
            amplitudQRS = 0.5; 
            duracionQRS = 70e-3;
        case 2   
            bpm = 80;  
            amplitudQRS = 0.5; 
            duracionQRS = 70e-3;
        case 3
            bpm = 200;  
            amplitudQRS = 0.5; 
            duracionQRS = 70e-3;
        case 4
            bpm = 30;  
            amplitudQRS = 0.5; 
            duracionQRS = 100e-3;
        case 5   
            bpm = 80;  
            amplitudQRS = 0.5; 
            duracionQRS = 100e-3;
        case 6
            bpm = 200;  
            amplitudQRS = 0.5; 
            duracionQRS = 100e-3;            
        case 7
            bpm = 30;  
            amplitudQRS = 0.5; 
            duracionQRS = 120e-3;
        case 8   
            bpm = 80;  
            amplitudQRS = 0.5; 
            duracionQRS = 120e-3;
        case 9
            bpm = 200;  
            amplitudQRS = 0.5; 
            duracionQRS = 120e-3;                                                                                 
        case 10
            bpm = 30;  
            amplitudQRS = 2; 
            duracionQRS = 70e-3;
        case 11   
            bpm = 80;  
            amplitudQRS = 2; 
            duracionQRS = 70e-3;
        case 12
            bpm = 200;  
            amplitudQRS = 2; 
            duracionQRS = 70e-3;            
        case 13
            bpm = 30;  
            amplitudQRS = 2; 
            duracionQRS = 100e-3;
        case 14   
            bpm = 80;  
            amplitudQRS = 2; 
            duracionQRS = 100e-3;
        case 15
            bpm = 200;  
            amplitudQRS = 2; 
            duracionQRS = 100e-3;                        
        case 16
            bpm = 30;  
            amplitudQRS = 2; 
            duracionQRS = 120e-3;
        case 17   
            bpm = 80;  
            amplitudQRS = 2; 
            duracionQRS = 120e-3;
        case 18
            bpm = 200;  
            amplitudQRS = 2; 
            duracionQRS = 120e-3;                                    
        case 19
            bpm = 30;  
            amplitudQRS = 5; 
            duracionQRS = 70e-3;
        case 20   
            bpm = 80;  
            amplitudQRS = 5; 
            duracionQRS = 70e-3;
        case 21
            bpm = 200;  
            amplitudQRS = 5; 
            duracionQRS = 70e-3;            
        case 22
            bpm = 30;  
            amplitudQRS = 5; 
            duracionQRS = 100e-3;
        case 23   
            bpm = 80;  
            amplitudQRS = 5; 
            duracionQRS = 100e-3;
        case 24
            bpm = 200;  
            amplitudQRS = 5; 
            duracionQRS = 100e-3;                        
        case 25
            bpm = 30;  
            amplitudQRS = 5; 
            duracionQRS = 120e-3;
        case 26   
            bpm = 80;  
            amplitudQRS = 5; 
            duracionQRS = 120e-3;
        case 27
            bpm = 200;  
            amplitudQRS = 5; 
            duracionQRS = 120e-3;                                                           
            
   % ---------- AAMI Pediatric Detect --------------
    
        case 28
            bpm = 30;  
            amplitudQRS = 0.5; 
            duracionQRS = 40e-3;
        case 29   
            bpm = 80;  
            amplitudQRS = 0.5; 
            duracionQRS = 40e-3;
        case 30
            bpm = 250;  
            amplitudQRS = 0.5; 
            duracionQRS = 40e-3;                                                              
        case 31
            bpm = 30;  
            amplitudQRS = 0.5; 
            duracionQRS = 80e-3;
        case 32   
            bpm = 80;  
            amplitudQRS = 0.5; 
            duracionQRS = 80e-3;
        case 33
            bpm = 250;  
            amplitudQRS = 0.5; 
            duracionQRS = 80e-3;                                                                          
        case 34
            bpm = 30;  
            amplitudQRS = 0.5; 
            duracionQRS = 120e-3;
        case 35   
            bpm = 80;  
            amplitudQRS = 0.5; 
            duracionQRS = 120e-3;
        case 36
            bpm = 250;  
            amplitudQRS = 0.5; 
            duracionQRS = 120e-3;                                                                                                  
        case 37
            bpm = 30;  
            amplitudQRS = 2; 
            duracionQRS = 40e-3;
        case 38
            bpm = 80;  
            amplitudQRS = 2; 
            duracionQRS = 40e-3;
        case 39
            bpm = 250;  
            amplitudQRS = 2; 
            duracionQRS = 40e-3;                                                              
        case 40
            bpm = 30;  
            amplitudQRS = 2; 
            duracionQRS = 80e-3;
        case 41   
            bpm = 80;  
            amplitudQRS = 2; 
            duracionQRS = 80e-3;
        case 42
            bpm = 250;  
            amplitudQRS = 2; 
            duracionQRS = 80e-3;                                                                          
        case 43
            bpm = 30;  
            amplitudQRS = 2; 
            duracionQRS = 120e-3;
        case 44   
            bpm = 80;  
            amplitudQRS = 2; 
            duracionQRS = 120e-3;
        case 45
            bpm = 250;  
            amplitudQRS = 2; 
            duracionQRS = 120e-3;                                                                                                              
        case 46
            bpm = 30;  
            amplitudQRS = 5; 
            duracionQRS = 40e-3;
        case 47
            bpm = 80;  
            amplitudQRS = 5; 
            duracionQRS = 40e-3;
        case 48
            bpm = 250;  
            amplitudQRS = 5; 
            duracionQRS = 40e-3;                                                              
        case 49
            bpm = 30;  
            amplitudQRS = 5; 
            duracionQRS = 80e-3;
        case 50   
            bpm = 80;  
            amplitudQRS = 5; 
            duracionQRS = 80e-3;
        case 51
            bpm = 250;  
            amplitudQRS = 5; 
            duracionQRS = 80e-3;                                                                          
        case 52
            bpm = 30;  
            amplitudQRS = 5; 
            duracionQRS = 120e-3;
        case 53   
            bpm = 80;  
            amplitudQRS = 5; 
            duracionQRS = 120e-3;
        case 54
            bpm = 250;  
            amplitudQRS = 5; 
            duracionQRS = 120e-3;                                                                                                              

% ---------- AAMI No Detect --------------            
            
        case 55
            bpm = 30;  
            amplitudQRS = 0.15; 
            duracionQRS = 40e-3;
        case 56   
            bpm = 80;  
            amplitudQRS = 0.15; 
            duracionQRS = 40e-3;
        case 57
            bpm = 200;  
            amplitudQRS = 0.15; 
            duracionQRS = 40e-3;                                                                                                                          
        case 58
            bpm = 250;  
            amplitudQRS = 0.15; 
            duracionQRS = 40e-3;             
        case 59
            bpm = 30;  
            amplitudQRS = 0.15; 
            duracionQRS = 70e-3;
        case 60   
            bpm = 80;  
            amplitudQRS = 0.15; 
            duracionQRS = 70e-3;
        case 61
            bpm = 200;  
            amplitudQRS = 0.15; 
            duracionQRS = 70e-3;                                                                                                                          
        case 62
            bpm = 250;  
            amplitudQRS = 0.15; 
            duracionQRS = 70e-3;             
        case 63
            bpm = 30;  
            amplitudQRS = 0.15; 
            duracionQRS = 80e-3;
        case 64
            bpm = 80;  
            amplitudQRS = 0.15; 
            duracionQRS = 80e-3;
        case 65
            bpm = 200;  
            amplitudQRS = 0.15; 
            duracionQRS = 80e-3;                                                                                                                          
        case 66
            bpm = 250;  
            amplitudQRS = 0.15; 
            duracionQRS = 80e-3;                                     
        case 67
            bpm = 30;  
            amplitudQRS = 0.15; 
            duracionQRS = 100e-3;
        case 68
            bpm = 80;  
            amplitudQRS = 0.15; 
            duracionQRS = 100e-3;
        case 69
            bpm = 200;  
            amplitudQRS = 0.15; 
            duracionQRS = 100e-3;                                                                                                                          
        case 70
            bpm = 250;  
            amplitudQRS = 0.15; 
            duracionQRS = 100e-3;                                     
        case 71
            bpm = 30;  
            amplitudQRS = 0.15; 
            duracionQRS = 120e-3;
        case 72
            bpm = 80;  
            amplitudQRS = 0.15; 
            duracionQRS = 120e-3;
        case 73
            bpm = 200;  
            amplitudQRS = 0.15; 
            duracionQRS = 120e-3;                                                                                                                          
        case 74
            bpm = 250;  
            amplitudQRS = 0.15; 
            duracionQRS = 200e-3;                                                 
        case 75
            bpm = 30;  
            amplitudQRS = 1; 
            duracionQRS = 10e-3;
        case 76
            bpm = 80;  
            amplitudQRS = 1; 
            duracionQRS = 10e-3;
        case 77
            bpm = 200;  
            amplitudQRS = 1; 
            duracionQRS = 10e-3;                                                                                                                          
        case 78
            bpm = 250;  
            amplitudQRS = 1; 
            duracionQRS = 10e-3;
            
% ------------- IEC 60601-2-27   50.102.8    Methode A -------------------
      
        case 80         
            Fs=50000;              
            t = 0:1/Fs:duracion;
            y = 0.5*sin (2*pi*5*t);
            periodo = 1/5;         

        case 81                                      
            Fs = 50000;          
            t = 0:1/Fs:duracion;
            y = 0.5*sin (2*pi*0.67*t);
            periodo = 1/0.67;         

        case 82                                                   
            Fs = 50000;          
            t = 0:1/Fs:duracion;
            y = 0.5*sin (2*pi*40*t);
            periodo = 1/40;    


% 50.102.8    Impulse Response -------------------

        case 83
            Fs = 50000;          
            t = 0:1/Fs:duracion;
            y = 1.5+1.5*sign(sin (2*pi*5*t));          
            periodo = 1/5;    

            
% ------------- IEC 60601-2-27   50.102.12    ----------------------------
                                    % Segunda parte unicamente
        case 84                     
            bpm = 90;  
            amplitudPacemaker = 2; 
            duracionPacemaker = 2e-3;     % seg
            tiempoPaceQ = 0;        
            tao = 10e-3;  % entre 4 y 100 mseg
                      
% ------------- IEC 60601-2-27   50.102.13    ----------------------------

        case 85     % Sub punto a                                                      
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            amplitudPacemaker = 2; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;                        
                       
        case 86       % Sub punto d                                                      
            bpm = 60;  
            amplitudQRS = 0; 
            amplitudT = 0;         
            amplitudPacemaker = 2;
            duracionPacemaker = 2e-3;
            tiempoPaceQ = 40e-3;
            tao = 10e-3;                        

        case 87     % Sub punto e a -2mV                                                                 
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            amplitudPacemaker = -2; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;                                    
            
        case 88     % Sub punto e a 100mV                                     
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            amplitudPacemaker = 100; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;                                    
            
        case 89     % Sub punto e a -100mV        
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            amplitudPacemaker = -100; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;                                    
            
        case 90     % Sub punto e a 300mV
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            amplitudPacemaker = 300; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;                        
            
        case 91     % Sub punto e a -300mV
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            amplitudPacemaker = -300; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;                        
            
        case 92     % Sub punto e a 500mV
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            amplitudPacemaker = 500; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;                        
            
        case 93     % Sub punto e a -500mV
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            amplitudPacemaker = -500; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;                        
            
        case 94     % Sub punto e a 700mV
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            amplitudPacemaker = 700; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;                        
            
        case 95     % Sub punto e a -700mV
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            amplitudPacemaker = -700; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;                                                                
            
        case 96   % Sub punto f  
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = 2; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;
           
        case 97     % Sub punto g -> a Pace Time 150mseg
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;
            bpmPace = 60; amplitudPacemaker = 2; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3; secondPulseTime = 150e-3;
            
        case 98     % Sub punto g -> d Pace Time 150mseg
            bpmPace = 60; amplitudPacemaker = 2; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 10e-3;  secondPulseTime = 150e-3;

        case 99     % Sub punto g -> e. Pace pulso -2mV. Pace Time 150mseg
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            bpmPace = 60; amplitudPacemaker = -2; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3 ;secondPulseTime = 150e-3;  
            
        case 100     % Sub punto g -> e. Paca pulso 100mV. Pace Time 150mseg          
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            bpmPace = 60; amplitudPacemaker = 100; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3; secondPulseTime=150e-3;
                   
        case 101     % Sub punto g -> e. Paca pulso -100mV. Pace Time 150mseg
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            bpmPace = 60; amplitudPacemaker = -100; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;secondPulseTime=150e-3;
           
        case 102     % Sub punto g -> e. Paca pulso 300mV. Pace Time 150mseg
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            bpmPace = 60; amplitudPacemaker = 300; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;secondPulseTime=150e-3;
            
        case 103     % Sub punto g -> e. Paca pulso -300mV. Pace Time 150mseg      
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            bpmPace = 60; amplitudPacemaker = -300; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3; secondPulseTime=150e-3;
           
        case 104     % Sub punto g -> e. Paca pulso 500mV. Pace Time 150mseg  
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            bpmPace = 60; amplitudPacemaker = 500; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;secondPulseTime=150e-3;
           
        case 105     % Sub punto g -> e. Paca pulso -500mV. Pace Time 150mseg
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            bpmPace = 60; amplitudPacemaker = -500; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;secondPulseTime=150e-3;
            
        case 106     % Sub punto g -> e. Paca pulso 700mV. Pace Time 150mseg
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            bpmPace = 60; amplitudPacemaker = 700; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;secondPulseTime=150e-3;
            
        case 107     % Sub punto g -> e. Paca pulso -700mV. Pace Time 150mseg
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            bpmPace = 60; amplitudPacemaker = -700; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;secondPulseTime=150e-3;
            
        case 108 % Sub punto g -> f. Pace time 150mseg. 
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = 2; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=150e-3;
                            
        case 109     % Sub punto g -> a Pace Time 250mseg
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;
            bpmPace = 60; amplitudPacemaker = 2; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;secondPulseTime=250e-3;
            
        case 110     % Sub punto g -> d Pace Time 250mseg
            bpmPace = 60; amplitudPacemaker = 2; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 10e-3;secondPulseTime=250e-3;

        case 111     % Sub punto g -> e. Paca pulso -2mV. Pace Time 250mseg
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            bpmPace = 60; amplitudPacemaker = -2; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;secondPulseTime=250e-3;
            
        case 112     % Sub punto g -> e. Paca pulso 100mV. Pace Time 250mseg
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            bpmPace = 60; amplitudPacemaker = 100; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;secondPulseTime=250e-3;
            
        case 113     % Sub punto g -> e. Paca pulso -100mV. Pace Time 250mseg
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            bpmPace = 60; amplitudPacemaker = -100; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;secondPulseTime=250e-3;
            
        case 114     % Sub punto g -> e. Paca pulso 300mV. Pace Time 250mseg
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            bpmPace = 60; amplitudPacemaker = 300; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;secondPulseTime=250e-3;
            
        case 115     % Sub punto g -> e. Paca pulso -300mV. Pace Time 250mseg
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            bpmPace = 60; amplitudPacemaker = -300; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3; secondPulseTime=250e-3;
                           
        case 116     % Sub punto g -> e. Paca pulso 500mV. Pace Time 250mseg
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            bpmPace = 60; amplitudPacemaker = 500; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;secondPulseTime=250e-3;
            
        case 117     % Sub punto g -> e. Paca pulso -500mV. Pace Time 250mseg
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            bpmPace = 60; amplitudPacemaker = -500; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;secondPulseTime=250e-3;
                           
        case 118     % Sub punto g -> e. Paca pulso 700mV. Pace Time 250mseg
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            bpmPace = 60; amplitudPacemaker = 700; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;secondPulseTime=250e-3;
            
        case 119     % Sub punto g -> e. Paca pulso -700mV. Pace Time 250mseg
            bpm = 60; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;     
            bpmPace = 60; amplitudPacemaker = -700; duracionPacemaker = 2e-3; tiempoPaceQ = 40e-3; tao = 10e-3;secondPulseTime=250e-3;
                           
        case 120 % Sub punto g -> f. Pace time 250mseg. 
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2; duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = 2; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=250e-3;
                     
        case 121    % Sub punto J -> f. Pace amp -2mV
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = -2; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;                   
                           
        case 122    % Sub punto J -> g. Pace amp -2mV. Pace time 150mseg
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;                                        
            bpmPace = 80; amplitudPacemaker = -2; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=150e-3;
            
        case 123    % Sub punto J -> h. Pace amp -2mV. Pace time 250mseg
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = -2; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=250e-3;                   
                           
        case 124    % Sub punto J -> f. Pace amp 100mV
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = 100; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;
           
        case 125    % Sub punto J -> g. Pace amp 100mV. Pace time 150mseg
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;                                       
            bpmPace = 80; amplitudPacemaker = 100; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=150e-3;
                           
        case 126    % Sub punto J -> h. Pace amp 100mV. Pace time 250mseg
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = 100; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=250e-3;
           
       case 127    % Sub punto J -> f. Pace amp -100mV
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = -100; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;
            
        case 128    % Sub punto J -> g. Pace amp -100mV. Pace time 150mseg
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = -100; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=150e-3;
            
        case 129    % Sub punto J -> h. Pace amp -100mV. Pace time 250mseg
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = -100; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=250e-3;
            
       case 130    % Sub punto J -> f. Pace amp 300mV
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = 300; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;
            
        case 131    % Sub punto J -> g. Pace amp 300mV. Pace time 150mseg
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = 300; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=150e-3;
            
        case 132    % Sub punto J -> h. Pace amp 300mV. Pace time 250mseg
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;                                       
            bpmPace = 80; amplitudPacemaker = 300; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=250e-3;
                          
       case 133    % Sub punto J -> f. Pace amp -300mV
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = -300; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;
                           
        case 134    % Sub punto J -> g. Pace amp -300mV. Pace time 150mseg
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = -300; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=150e-3;
            
        case 135    % Sub punto J -> h. Pace amp 300mV. Pace time 250mseg
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = -300; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=250e-3;
            
        case 136    % Sub punto J -> f. Pace amp 500mV
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = 500; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;
            
        case 137    % Sub punto J -> g. Pace amp 500mV. Pace time 150mseg
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = 500; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=150e-3;
            
        case 138    % Sub punto J -> h. Pace amp 500mV. Pace time 250mseg
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = 500; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=250e-3;
            
        case 139    % Sub punto J -> f. Pace amp -500mV
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = -500; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;
            
        case 140    % Sub punto J -> g. Pace amp -500mV. Pace time 150mseg
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = -500; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=150e-3;
            
        case 141    % Sub punto J -> h. Pace amp -500mV. Pace time 250mseg
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = -500; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=250e-3;
            
      case 142    % Sub punto J -> f. Pace amp 700mV
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = 700; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;

        case 143    % Sub punto J -> g. Pace amp 700mV. Pace time 150mseg
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = 700; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=150e-3;
           
        case 144    % Sub punto J -> h. Pace amp 700mV. Pace time 250mseg 
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = 700; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=250e-3;
           
        case 145    % Sub punto J -> f. Pace amp -700mV
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = -700; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;
            
        case 146    % Sub punto J -> g. Pace amp -700mV. Pace time 150mseg
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = -700; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=150e-3;
            
        case 147    % Sub punto J -> h. Pace amp -700mV. Pace time 250mseg
            bpm = 30; amplitudQRS = 1; duracionQRS = 100e-3; amplitudT = 0.2;  duracionT = 180e-3; duracionQT = 350e-3;            
            bpmPace = 80; amplitudPacemaker = -700; duracionPacemaker = 2e-3; tiempoPaceQ = 0; tao = 4e-3;secondPulseTime=250e-3;           
                        
% ------------- IEC 60601-2-27   50.102.15    ----------------------------
            
   % Adult
   
      case 200                                      
            bpm  = 5;  
            amplitudQRS = 1; 
            duracionQRS = 70e-3;                      

     case 201                       
            bpm  = 7;  
            amplitudQRS = 1; 
            duracionQRS = 70e-3;                      
                
      case 202                                
            bpm  = 10;  
            amplitudQRS = 1; 
            duracionQRS = 70e-3;                      

     case 203                                 
            bpm  = 20;  
            amplitudQRS = 1; 
            duracionQRS = 70e-3;                      
           
     case 204
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                    
            bpm  = 30;  
            amplitudQRS = 1; 
            duracionQRS = 70e-3;                      
            
     case 205
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                
            bpm  = 300;  
            amplitudQRS = 1; 
            duracionQRS = 70e-3;                      

     case 206
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                    
            bpm  = 5;  
            amplitudQRS = 1; 
            duracionQRS = 120e-3;                      
            
     case 207
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 7;  
            amplitudQRS = 1; 
            duracionQRS = 120e-3;                      

     case 208
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                    
            bpm  = 10;  
            amplitudQRS = 1; 
            duracionQRS = 120e-3;                      
            
     case 209
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 20;  
            amplitudQRS = 1; 
            duracionQRS = 120e-3;                      
            
    case 210
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 1; 
            duracionQRS = 120e-3;                                  
    
    case 211
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
             set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 300;  
            amplitudQRS = 1; 
            duracionQRS = 120e-3;                                  
                      
   % Pediatric            

    case 212
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 5;  
            amplitudQRS = 1; 
            duracionQRS = 40e-3;                                     
            
    case 213
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 7;  
            amplitudQRS = 1; 
            duracionQRS = 40e-3;                                                 

    case 214
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 10;  
            amplitudQRS = 1; 
            duracionQRS = 40e-3;                                                 
   
    case 215
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 20;  
            amplitudQRS = 1; 
            duracionQRS = 40e-3;                                                 
            
    case 216
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 1; 
            duracionQRS = 40e-3;                                     
            
    case 217
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 325;  
            amplitudQRS = 1; 
            duracionQRS = 40e-3;                                                 
            
    case 218
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 350;  
            amplitudQRS = 1; 
            duracionQRS = 40e-3;                                     

    case 219
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 5;  
            amplitudQRS = 1; 
            duracionQRS = 120e-3;                                                 
            
    case 220
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 7;  
            amplitudQRS = 1; 
            duracionQRS = 120e-3;                                                 
            
    case 221
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 10;  
            amplitudQRS = 1; 
            duracionQRS = 120e-3;                                     
            
    case 222
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 20;  
            amplitudQRS = 1; 
            duracionQRS = 120e-3;                                                 
            
    case 223
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 1; 
            duracionQRS = 120e-3;                                     
            
    case 224
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 325;  
            amplitudQRS = 1; 
            duracionQRS = 120e-3;                                                 
            
    case 225
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 350;  
            amplitudQRS = 1; 
            duracionQRS = 120e-3;     
            
       % Accuracy requirements, Adult use
       
    case 226
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 0.5; 
            duracionQRS = 70e-3;                                                 
            
    case 227
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 60;  
            amplitudQRS = 0.5; 
            duracionQRS = 70e-3;                                                 
            
    case 228
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 120;  
            amplitudQRS = 0.5; 
            duracionQRS = 70e-3;                                                 
            
    case 229
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 180;  
            amplitudQRS = 0.5; 
            duracionQRS = 70e-3;                                                 
            
    case 230
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 200;  
            amplitudQRS = 0.5; 
            duracionQRS = 70e-3;                                                             
            
    case 231
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 0.5; 
            duracionQRS = 100e-3;                                                 
            
    case 232
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 60;  
            amplitudQRS = 0.5; 
            duracionQRS = 100e-3;                                                 
            
    case 233
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 120;  
            amplitudQRS = 0.5; 
            duracionQRS = 100e-3;                                                 
            
    case 234
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 180;  
            amplitudQRS = 0.5; 
            duracionQRS = 100e-3;                                                 
            
    case 235
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 200;  
            amplitudQRS = 0.5; 
            duracionQRS = 100e-3;                                 
        
   case 236
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 0.5; 
            duracionQRS = 120e-3;                                                 
            
    case 237
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 60;  
            amplitudQRS = 0.5; 
            duracionQRS = 120e-3;                                                 
            
    case 238
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 120;  
            amplitudQRS = 0.5; 
            duracionQRS = 120e-3;                                                 
            
    case 239
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 180;  
            amplitudQRS = 0.5; 
            duracionQRS = 120e-3;                                                 
            
    case 240
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 200;  
            amplitudQRS = 0.5; 
            duracionQRS = 120e-3; 
                              
    case 241
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 2; 
            duracionQRS = 70e-3;                                                 
            
    case 242
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 60;  
            amplitudQRS = 2; 
            duracionQRS = 70e-3;                                                 
            
    case 243
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 120;  
            amplitudQRS = 2; 
            duracionQRS = 70e-3;                                                 
            
    case 244
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 180;  
            amplitudQRS = 2; 
            duracionQRS = 70e-3;                                                 
            
    case 245
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 200;  
            amplitudQRS = 2; 
            duracionQRS = 70e-3;                                                             
            
    case 246
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 2; 
            duracionQRS = 100e-3;                                                 
            
    case 247
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 60;  
            amplitudQRS = 2; 
            duracionQRS = 100e-3;                                                 
            
    case 248
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 120;  
            amplitudQRS = 2; 
            duracionQRS = 100e-3;                                                 
            
    case 249
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 180;  
            amplitudQRS = 2; 
            duracionQRS = 100e-3;                                                 
            
    case 250
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 200;  
            amplitudQRS = 2; 
            duracionQRS = 100e-3;                                 
        
   case 251
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 2; 
            duracionQRS = 120e-3;                                                 
            
    case 252
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 60;  
            amplitudQRS = 2; 
            duracionQRS = 120e-3;                                                 
            
    case 253
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 120;  
            amplitudQRS = 2; 
            duracionQRS = 120e-3;                                                 
            
    case 254
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 180;  
            amplitudQRS = 2; 
            duracionQRS = 120e-3;                                                 
            
    case 255
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 200;  
            amplitudQRS = 2; 
            duracionQRS = 120e-3;        

    case 256
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 5; 
            duracionQRS = 70e-3;                                                 
            
    case 257
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 60;  
            amplitudQRS = 5; 
            duracionQRS = 70e-3;                                                 
            
    case 258
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 120;  
            amplitudQRS = 5; 
            duracionQRS = 70e-3;                                                 
            
    case 259
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 180;  
            amplitudQRS = 5; 
            duracionQRS = 70e-3;                                                 
            
    case 260
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 200;  
            amplitudQRS = 5; 
            duracionQRS = 70e-3;                                                             
            
    case 261
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 5; 
            duracionQRS = 100e-3;                                                 
            
    case 262
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 60;  
            amplitudQRS = 5; 
            duracionQRS = 100e-3;                                                 
            
    case 263
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 120;  
            amplitudQRS = 5; 
            duracionQRS = 100e-3;                                                 
            
    case 264
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 180;  
            amplitudQRS = 5; 
            duracionQRS = 100e-3;                                                 
            
    case 265
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 200;  
            amplitudQRS = 5; 
            duracionQRS = 100e-3;                                 
        
   case 266
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 5; 
            duracionQRS = 120e-3;                                                 
            
    case 267
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 60;  
            amplitudQRS = 5; 
            duracionQRS = 120e-3;                                                 
            
    case 268
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 120;  
            amplitudQRS = 5; 
            duracionQRS = 120e-3;                                                 
            
    case 269
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 180;  
            amplitudQRS = 5; 
            duracionQRS = 120e-3;                                                 
            
    case 270
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Adult use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 200;  
            amplitudQRS = 5; 
            duracionQRS = 120e-3;        
            
            %Pediatric
   case 271
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 0.5; 
            duracionQRS = 40e-3;                    

   case 272
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 60;  
            amplitudQRS = 0.5; 
            duracionQRS = 40e-3;                                
       
   case 273
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 120;  
            amplitudQRS = 0.5; 
            duracionQRS = 40e-3;                                
            
   case 274
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 180;  
            amplitudQRS = 0.5; 
            duracionQRS = 40e-3;                                
            
   case 275
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 200;  
            amplitudQRS = 0.5; 
            duracionQRS = 40e-3;                                
            
   case 276
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 225;  
            amplitudQRS = 0.5; 
            duracionQRS = 40e-3;                                
            
   case 277
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 250;  
            amplitudQRS = 0.5; 
            duracionQRS = 40e-3;                                
            
   case 278
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 0.5; 
            duracionQRS = 80e-3;                    

   case 279
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 60;  
            amplitudQRS = 0.5; 
            duracionQRS = 80e-3;                    
       
   case 280
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 120;  
            amplitudQRS = 0.5; 
            duracionQRS = 80e-3;                    
            
   case 281
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 180;  
            amplitudQRS = 0.5; 
            duracionQRS = 80e-3;                    
            
   case 282
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 200;  
            amplitudQRS = 0.5; 
            duracionQRS = 80e-3;                    
            
   case 283
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 225;  
            amplitudQRS = 0.5; 
            duracionQRS = 80e-3;                    
            
   case 284
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 250;  
            amplitudQRS = 0.5; 
            duracionQRS = 80e-3;                    
            
   case 285
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 0.5; 
            duracionQRS = 120e-3;                    

   case 286
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 60;  
            amplitudQRS = 0.5; 
            duracionQRS = 120e-3;                    
       
   case 287
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 120;  
            amplitudQRS = 0.5; 
            duracionQRS = 120e-3;                    
            
   case 288
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 180;  
            amplitudQRS = 0.5; 
            duracionQRS = 120e-3;                    
            
   case 289
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 200;  
            amplitudQRS = 0.5; 
            duracionQRS = 120e-3;                    
            
   case 290
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 225;  
            amplitudQRS = 0.5; 
            duracionQRS = 120e-3;                    
            
   case 291
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 250;  
            amplitudQRS = 0.5; 
            duracionQRS = 120e-3;                    
            
   case 292
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 2; 
            duracionQRS = 40e-3;                    

   case 293
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 60;  
            amplitudQRS = 2; 
            duracionQRS = 40e-3;                                
       
   case 294
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 120;  
            amplitudQRS = 2; 
            duracionQRS = 40e-3;                                
            
   case 295
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 180;  
            amplitudQRS = 2; 
            duracionQRS = 40e-3;                                
            
   case 296
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 200;  
            amplitudQRS = 2; 
            duracionQRS = 40e-3;                                
            
   case 297
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 225;  
            amplitudQRS = 2; 
            duracionQRS = 40e-3;                                
            
   case 298
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 250;  
            amplitudQRS = 2; 
            duracionQRS = 40e-3;                                
            
   case 299
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 2; 
            duracionQRS = 80e-3;                    

   case 300
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 60;  
            amplitudQRS = 2; 
            duracionQRS = 80e-3;                    
       
   case 301
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 120;  
            amplitudQRS = 2; 
            duracionQRS = 80e-3;                    
            
   case 302
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 180;  
            amplitudQRS = 2; 
            duracionQRS = 80e-3;                    
            
   case 303
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 200;  
            amplitudQRS = 2; 
            duracionQRS = 80e-3;                    
            
   case 304
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 225;  
            amplitudQRS = 2; 
            duracionQRS = 80e-3;                    
            
   case 305
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 250;  
            amplitudQRS = 2; 
            duracionQRS = 80e-3;                    
            
   case 306
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 2; 
            duracionQRS = 120e-3;                    

   case 307
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 60;  
            amplitudQRS = 2; 
            duracionQRS = 120e-3;                    
       
   case 308
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 120;  
            amplitudQRS = 2; 
            duracionQRS = 120e-3;                    
            
   case 309
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 180;  
            amplitudQRS = 2; 
            duracionQRS = 120e-3;                    
            
   case 310
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 200;  
            amplitudQRS = 2; 
            duracionQRS = 120e-3;                    
            
   case 311
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 225;  
            amplitudQRS = 2; 
            duracionQRS = 120e-3;                    
            
   case 312
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 250;  
            amplitudQRS = 2; 
            duracionQRS = 120e-3;                    

   case 313
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 5; 
            duracionQRS = 40e-3;                    

   case 314
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 60;  
            amplitudQRS = 5; 
            duracionQRS = 40e-3;                                
       
   case 315
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 120;  
            amplitudQRS = 5; 
            duracionQRS = 40e-3;                                
            
   case 316
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 180;  
            amplitudQRS = 5; 
            duracionQRS = 40e-3;                                
            
   case 317
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 200;  
            amplitudQRS = 5; 
            duracionQRS = 40e-3;                                
            
   case 318
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 225;  
            amplitudQRS = 5; 
            duracionQRS = 40e-3;                                
            
   case 319
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 250;  
            amplitudQRS = 5; 
            duracionQRS = 40e-3;                                
            
   case 320
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 5; 
            duracionQRS = 80e-3;                    

   case 321
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 60;  
            amplitudQRS = 5; 
            duracionQRS = 80e-3;                    
       
   case 322
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 120;  
            amplitudQRS = 5; 
            duracionQRS = 80e-3;                    
            
   case 323
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 180;  
            amplitudQRS = 5; 
            duracionQRS = 80e-3;                    
            
   case 324
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 200;  
            amplitudQRS = 5; 
            duracionQRS = 80e-3;                    
            
   case 325
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 225;  
            amplitudQRS = 5; 
            duracionQRS = 80e-3;                    
            
   case 326
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 250;  
            amplitudQRS = 5; 
            duracionQRS = 80e-3;                    
            
   case 327
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 30;  
            amplitudQRS = 5; 
            duracionQRS = 120e-3;                    

   case 328
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 60;  
            amplitudQRS = 5; 
            duracionQRS = 120e-3;                    
       
   case 329
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 120;  
            amplitudQRS = 5; 
            duracionQRS = 120e-3;                    
            
   case 330
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 180;  
            amplitudQRS = 5; 
            duracionQRS = 120e-3;                    
            
   case 331
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 200;  
            amplitudQRS = 5; 
            duracionQRS = 120e-3;                    
            
   case 332
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 225;  
            amplitudQRS = 5; 
            duracionQRS = 120e-3;                    
            
   case 333
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','Pediatric use');
            set (handles.textDescripcion2,'String','Accuracy requirements');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                                                            
            bpm  = 250;  
            amplitudQRS = 5; 
            duracionQRS = 120e-3;                                
            
   case 334
            specialSignal = 1;
            set (handles.uipanel11,'Visible','on');
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','50Hz Rejection');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                       
            bpm  = 30;  
            amplitudQRS = 1; 
            duracionQRS = 100e-3;                                                        
            [t,y,Fs] = QRST_PRO (duracion, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
            bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime);                    
            y2 = 0.07*sin(2*pi*50*t); % senoidal 50 Hz 100 uV (�0.07? por algun error en bajas amplitudes)
            y = y + y2;
            clear y2;
            
   case 335 % TODO
            specialSignal = 1;
            set (handles.uipanel11,'Visible','on');
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','50Hz Rejection');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                       
            bpm  = 60;  
            amplitudQRS = 1; 
            duracionQRS = 100e-3;                                                        
            [t,y,Fs] = QRST_PRO (duracion, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
            bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime);                           
            y2 = 0.07*sin(2*pi*50*t); % senoidal 50 Hz 100 uV (�0.07? por algun error en bajas amplitudes)
            y = y + y2;            
            clear y2;
            
   case 336
            specialSignal = 1;
            set (handles.uipanel11,'Visible','on');
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','50Hz Rejection');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                       
            bpm  = 80;  
            amplitudQRS = 1; 
            duracionQRS = 100e-3;                                                               
            [t,y,Fs] = QRST_PRO (duracion, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
            bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime);
            y2 = 0.07*sin(2*pi*50*t); % senoidal 50 Hz 100 uV (�0.07? por algun error en bajas amplitudes)
            y = y + y2;                        
            clear y2;

   case 337
            specialSignal = 1;
            set (handles.uipanel11,'Visible','on');
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','50Hz Rejection');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                       
            bpm  = 120;  
            amplitudQRS = 1; 
            duracionQRS = 100e-3;                                                                      
            [t,y,Fs] = QRST_PRO (duracion, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
            bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime);                                   
            y2 = 0.07*sin(2*pi*50*t); % senoidal 50 Hz 100 uV (�0.07? por algun error en bajas amplitudes)
            y = y + y2;           
            clear y2;
            
   case 338
            specialSignal = 1;
            set (handles.uipanel11,'Visible','on');
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','50Hz Rejection');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                       
            bpm  = 180;  
            amplitudQRS = 1; 
            duracionQRS = 100e-3;                                                                       
            [t,y,Fs] = QRST_PRO (duracion, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
            bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime);                                   
            y2 = 0.07*sin(2*pi*50*t); % senoidal 50 Hz 100 uV (�0.07? por algun error en bajas amplitudes)
            y = y + y2;                                    
            clear y2;            
            
   case 339
            specialSignal = 1;
            set (handles.uipanel11,'Visible','on');
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','50Hz Rejection');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                       
            bpm  = 200;  
            amplitudQRS = 1; 
            duracionQRS = 100e-3;                                                                      
            [t,y,Fs] = QRST_PRO (duracion, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
            bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime);                                 
            y2 = 0.07*sin(2*pi*50*t); % senoidal 50 Hz 100 uV (�0.07? por algun error en bajas amplitudes)
            y = y + y2;      
            clear y2;            
            
   case 340                
            bpm  = 225;  
            amplitudQRS = 1; 
            duracionQRS = 100e-3;                                                               
            [t,y,Fs] = QRST_PRO (duracion, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
            bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime);                                   
            y2 = 0.07*sin(2*pi*50*t); % senoidal 50 Hz 100 uV (�0.07? por algun error en bajas amplitudes)
            y = y + y2;                                    
            clear y2;            
            
   case 341
            specialSignal = 1;
            set (handles.uipanel11,'Visible','on');
            set (handles.textNorma,'String','60601-2-27');
            set (handles.textPunto,'String','50.102.15');            
            set (handles.textDescripcion,'String','50Hz Rejection');
            set (handles.textDescripcion2,'String',' ');                                                       
            set (handles.uipanelEspecificaciones,'Position',[140 4.3850 38.8 14.7690]);
            set (handles.uipanelEspecificaciones,'Visible','on');   % Muestro las especificaciones                       
            bpm  = 250;  
            amplitudQRS = 1; 
            duracionQRS = 100e-3;                                                               
            [t,y,Fs] = QRST_PRO (duracion, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
            bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime);                                   
            y2 = 0.07*sin(2*pi*50*t); % senoidal 50 Hz 100 uV (�0.07? por algun error en bajas amplitudes)
            y = y + y2;         
            clear y2;                        
            
        otherwise
            set (handles.text64,'Visible','on');  % No existe tal se�al
            
    end

    
    if (amplitudQRS==0)
        duracionQRS = 0;
        duracionQT = 0;               
    end
    if (amplitudT==0)
        duracionT = 0;        
        duracionQT = 0;             
    end
    
    if (amplitudPacemaker==0)
        duracionPacemaker = 0;
        tiempoPaceQ = 0;
        tao = 0;   
    end
end

if (specialSignal==0)  % Si no es se�al especial (Pulsos de ECG varios)  
    [t,y,Fs] = QRST_PRO (duracion, bpm, amplitudQRS, duracionQRS, amplitudT, duracionT, duracionQT,...
                bpmPace, amplitudPacemaker, duracionPacemaker, tao, tiempoPaceQ, secondPulseTime);
end
    
plot(t,y), xlabel('Tiempo [seg]'), ylabel('Amplitud [mv]');

if bpm==0
    periodo = 60/bpmPace;
else if bpmPace == 0
        periodo = 60/bpm;
    else
        periodo = max( 60/bpm, 60/bpmPace);
    end
end  
    
% Normalizacion de la se�al (A la placa de sonido se le pueden enviar
% valores entre -1 y 1, de otra forma satura. Con lo cual debemos achicar
% la se�al de manera que el 1 sean 5mV, que ser� la m�xima amplitud de
% se�al que se podr� obtener a la salida del cable

if (amplitudPacemaker>5)
   set (handles.textoAtenuacion,'String','Colocar cable de Escala a 700mV');   % Escala a 700m
   set(handles.Atenuacion700mV, 'Value', 1);                                   % Selecciono la escala de 700mV   
end       
    
if (get(handles.Atenuacion5mV, 'Value') == 1)   % Fondo de escala 5mV
    [t,ynorm] = NORMALIZE (t,y,max(y)/5);       % La se�al que se puede sacar por la placa de sonido es de -1 a +1
else            
    [t,ynorm] = NORMALIZE (t,y,max(y)/715);     % Fondo de escala 700mV (La dif. es para ajustar la tolerancia del atenuacodr)
end    

%figure                                  % entonces la maxima se�al que podemos lograr es de 5mV con el circuito actual
%plot (t,ynorm)
sound (ynorm,Fs,16)      % 16 bits    


    