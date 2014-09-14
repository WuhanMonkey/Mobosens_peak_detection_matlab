fid = fopen('WindowFreqList20140909_142245.txt','r');

%fid = fopen('WindowFreqList20140909_152841.txt','r');

data=1:11996;
char data_string="";
data_part=1:1000;
slope_plot=1:1000;
for i=1:11996
data_string = fgets(fid);
data(i) = str2double(data_string);
end

yy=smooth(data);

for i=10000:11000;
   data_part(i-9999) = yy(i);
end

slope=0;
prev_slope=0;
result_index=0;
for i=1:999;
    prev=data_part(i);
    curr=data_part(i+1);
    if(prev < curr)
        slope = slope+1;
    elseif(prev > curr)
        slope = slope-1;
    end
    %fprintf('%d\n',slope)
    if(slope < -50)
     if(prev_slope<slope)
         result_index=i;
         break;
     end
    end    
    prev_slope = slope;
    slope_plot(i) = slope;
end
fprintf('%d\n',data_part(result_index))

fclose(fid);
 
