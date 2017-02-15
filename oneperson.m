clear;

ExpTimes = 999;
seats = 300;
competitors = 10000;
Success = zeros(ExpTimes,1);

for j = 1:ExpTimes
    C = randperm(competitors,1);
    Pool = randperm(competitors,competitors);
    for i = 1:seats
        if Pool(i) == C
            Success(j) = Success(j)+1;
        end
        Pool(:,1)=[];
    end
end

sum(Success)/ExpTimes