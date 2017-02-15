clear;

ExpTimes = 999;
seats = 300;
competitors = 4000;
SuccessA = zeros(ExpTimes,1);
SuccessB = zeros(ExpTimes,1);

for j = 1:ExpTimes
    C = randperm(competitors,3);
    CA = C(1);  % Competitor A
    CB = C(2);  % Competitor B
    Pool = randperm(competitors,competitors);
    for i = 1:seats
        if Pool(i) == CA
            SuccessA(j) = SuccessA(j)+1;
            SuccessB(j) = SuccessB(j)+1;
            Pool(Pool==CB) = [];
        end
        if Pool(i) == CB
            SuccessA(j) = SuccessA(j)+1;
            SuccessB(j) = SuccessB(j)+1;
            Pool(Pool==CA) = [];
        end
        Pool(:,1)=[];
    end
end

sum(SuccessA)/ExpTimes
sum(SuccessB)/ExpTimes