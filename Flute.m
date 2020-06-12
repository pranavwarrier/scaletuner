clc
clear all
x=1;

while x==1
    
    x=isempty (input ('Press enter to start program or press zero to quit. '));
    
    fhighE=1318.1505;
    
    fB=1975.53;
    
    fG=1567.98;
    
    fD=1174.66;
    
    fA=1760;
    
    flowE=659.25;
    
    flute=[fhighE,fB,fG,fD,fA,flowE];
    
    if x==1
        
        p=input ('Which string are you adjusting? \n1=E 2=B 3=G 4=D 5=A 6=e : ');
        
        w=flute (p);
        
        y=isempty (input ('Press enter to record input signal or 0 to start over. '));
        
        % record input signal
        
        Fs=44100;
        
        T=0:1:Fs/2-1;
        
        RecordObject=audiorecorder(Fs,16,1);
        record(RecordObject,2);
        pause(3);
        %record(RecordObject,'off');
        
        I=getaudiodata(RecordObject,'double');
        
        
        % to compare frequencies of a stored save file
        
        % let's hear the input signal
        
        display ('This is how the input signal sounds. ');
        
        sound (I,Fs);
        
        % fft of input signal
        
        J=fft (I)/size(I,1);
        
        K=0:1:Fs/2-1;
        
        while y==1
            if p==6
                
                for i=500:size(J,1)
                    
                    J(i,1)=0;
                    
                end
                
            else
                
                for i=2100:size(J,1)
                    
                    J(i,1)=0;
                    
                end
                
            end
            
%             %Plotting
%             
%             subplot(2,1,1);plot(I);
%             
%             subplot(2,1,2);plot(K,2*real(J(1:Fs/2)));
%             
%             if p==6
%                 
%                 axis([ 200 500 -0.01 0.01])
%                 
%                 for i=400:size(J,1)
%                     
%                     J(i,1)=0;
%                     
%                 end
%                 
%             elseif p==5
%                 
%                 axis([ 400 550 -0.01 0.01])
%                 
%                 for i=550:size(J,1)
%                     
%                     J(i,1)=0;
%                     
%                 end
%                 
%             elseif p==4
%                 
%                 axis([ 450 700 -0.01 0.01])
%                 
%                 for i=700:size(J,1)
%                     
%                     J(i,1)=0;
%                     
%                 end
%             elseif p==3
%                 
%                 axis([ 650 850 -0.01 0.01])
%                 
%                 for i=900:size(J,1)
%                     
%                     J(i,1)=0;
%                     
%                 end
%                 
%             elseif p==2
%                 
%                 axis([ 800 1100 -0.01 0.01])
%                 
%                 for i=1200:size(J,1)
%                     
%                     J(i,1)=0;
%                     
%                 end
%                 
%             elseif p==1
%                 
%                 axis([ 1200 1400 -0.01 0.01])
%                 
%                 for i=1500:size(J,1)
%                     
%                     J(i,1)=0;
%                     
%                 end
%                 
%             end
%             
%             % xlabel('Frequency(Hz)'),ylabel('Amplitude(V)');
%             
%             % title('input signal');
            K=0:1:(Fs/2-1);
            
            (1.015*w);
            
            K (J==max (J));
            class(K (J==max (J)))
            (0.8985*w)
            
            z=((K (find (J==max (J)))-w)/w)*100;
            
            if (1.0201*w)>K (find (J==max (J)))&& (0.885*w) <K (find (J==max (J))),
                
                display ('Perfect Intonation!!!');
                
%                 disp (['The frequency of the input signal is, ',
%                     sprintf('%d %d', K (find (J==max (J))))  'Hz.']);
%                 
%                 fprintf ('Percent Error % d %% \n',z)
                
            elseif (0.885*w)>K (find (J==max (J))),
                
                display ('Input frequency should be increased');
                
                disp (['The frequency of the input signal is, ',sprintf('%d %d', K (find (J==max (J))))  'Hz.']);
                
                fprintf ('Percent Error % d %% \n',z)
                
            elseif (1.0201*w)<K (J==max (J)),
                
                display ('Input frequency should be decreased');
                
                disp (['The frequency of the input signal is, ',sprintf('%d %d', K (find (J==max (J)))) 'Hz.']);
                
                fprintf ('Percent Error % d %% \n',z)
                
            end
            
            y=isempty (input ('Make needed adjustments and press enter to record a new input signal or 0 to start over. '));
            
            if y==1,
                
                continue;
                
            else x=1;
                
            end
            
        end
        
    end
    
end