function M = dec2basemat(b,d,varargin)
% dec2basemat(B,D) converts decimal numbers to a matrix where each 
% row is a base B number with leading zeros for a total of D digits
% If no third argument, all B^D base B numbers with D digits are used.
% 
% dec2basemat(B,D,V) converts those decimal numbers in vector V.
% 
%
% Examples:
% 
% dec2basemat(3,4,[5 6 7])
% dec2basemat(2,5)
%

if nargin==2
    N=0:b^d-1;
elseif nargin==3
    N=varargin{1};
else 
    error('base2mat says: wrong number of input arguments.')
end

for i=1:length(N)
    str1=dec2base(N(i),b,d);
    str2=str1(1);
    for j=2:d
        str2=[ str2 ',' str1(j)];
    end
    M(i,:)=str2num(str2);
end

return
