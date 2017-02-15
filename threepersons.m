clear;

ExpTimes = 999;
seats = 300;
competitors = 10000;
SuccessA = zeros(ExpTimes,1);
SuccessB = zeros(ExpTimes,1);
SuccessC = zeros(ExpTimes,1);

for j = 1:ExpTimes
    C = randperm(competitors,3);
    CA = C(1);  % Competitor A
    CB = C(2);  % Competitor B
    CC = C(3);  % Competitor C
    Pool = randperm(competitors,competitors);
    for i = 1:seats
        if Pool(1) == CA
            SuccessA(j) = SuccessA(j)+1;
            SuccessB(j) = SuccessB(j)+1;
            SuccessC(j) = SuccessC(j)+1;
            % Delete the other two from the pool
            Pool(Pool==CB) = [];
            Pool(Pool==CC) = [];
        end
        if Pool(1) == CB
            SuccessA(j) = SuccessA(j)+1;
            SuccessB(j) = SuccessB(j)+1;
            SuccessC(j) = SuccessC(j)+1;
            % Delete the other two from the pool
            Pool(Pool==CA) = [];
            Pool(Pool==CC) = [];
        end
        if Pool(1) == CC
            SuccessA(j) = SuccessA(j)+1;
            SuccessB(j) = SuccessB(j)+1;
            SuccessC(j) = SuccessC(j)+1;
            % Delete the other two from the pool
            Pool(Pool==CA) = [];
            Pool(Pool==CB) = [];
        end
        Pool(:,1)=[];
    end
end

sum(SuccessA)/ExpTimes
sum(SuccessB)/ExpTimes
sum(SuccessC)/ExpTimes