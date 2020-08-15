function [Result] = Fib(NumInt) %Arrays should index as 0
Result=zeros(1,NumInt+1);
Result(1)=0;
Result(2)=1;
for i=3:NumInt+1
    Result(i)=Result(i-1)+Result(i-2);
end
end

