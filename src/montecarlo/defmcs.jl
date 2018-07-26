using Mimi
using Distributions

mcs = @defmcs begin

    aceiadd = [USA => Normal(0.0,0.025), CAN => Normal(0.0,0.025), WEU => Normal(0.0,0.025), JPK => Normal(0.0,0.0375), ANZ => Normal(0.0,0.0375), EEU => Normal(0.0,0.025), FSU => Normal(0.0,0.025), MDE => Normal(0.0,0.0875), CAM => Normal(0.0,0.05625), LAM => Normal(0.0,0.05625), SAS => Normal(0.0,0.0875), SEA => Normal(0.0,0.0875), CHI => Normal(0.0,0.0375), MAF => Normal(0.0,0.11875), SSA => Normal(0.0,0.11875), SIS => Normal(0.0,0.05625)]
    aeeiadd = [USA => Normal(0.0,0.0625), CAN => Normal(0.0,0.0625), WEU => Normal(0.0,0.0625), JPK => Normal(0.0,0.0625), ANZ => Normal(0.0,0.0625), EEU => Normal(0.0,0.1), FSU => Normal(0.0,0.1), MDE => Normal(0.0,0.15), CAM => Normal(0.0,0.15), LAM => Normal(0.0,0.15), SAS => Normal(0.0,0.15), SEA => Normal(0.0,0.15), CHI => Normal(0.0,0.175), MAF => Normal(0.0,0.15), SSA => Normal(0.0,0.15), SIS => Normal(0.0,0.15)]
    agcbm = [USA => Truncated(Normal(0.089,0.1484), 0.0, Inf), CAN => Truncated(Normal(0.0402,0.065), 0.0, Inf), WEU => Truncated(Normal(0.1541,0.1183), 0.0, Inf), JPK => Truncated(Normal(0.2319,0.366), 0.0, Inf), ANZ => Truncated(Normal(0.1048,0.085), 0.0, Inf), EEU => Truncated(Normal(0.0952,0.0514), 0.0, Inf), FSU => Truncated(Normal(0.0671,0.0548), 0.0, Inf), MDE => Truncated(Normal(0.0943,0.0266), 0.0, Inf), CAM => Truncated(Normal(0.1641,0.0538), 0.0, Inf), LAM => Truncated(Normal(0.0596,0.0504), 0.0, Inf), SAS => Truncated(Normal(0.058,0.0164), 0.0, Inf), SEA => Truncated(Normal(0.0845,0.4181), 0.0, Inf), CHI => Truncated(Normal(0.1921,0.0613), 0.0, Inf), MAF => Truncated(Normal(0.0727,0.019), 0.0, Inf), SSA => Truncated(Normal(0.0505,0.022), 0.0, Inf), SIS => Truncated(Normal(0.2377,0.0864), 0.0, Inf)]
    agel = Truncated(Normal(0.31,0.15), 0.0, 1.0)
    aglparl = [USA => Truncated(Normal(0.0259810049019608,0.0213267435505035), 0.0, Inf), CAN => Truncated(Normal(0.0923560606060606,0.0800938684660319), 0.0, Inf), WEU => Truncated(Normal(0.021883487654321,0.00155285586012424), 0.0, Inf), JPK => Truncated(Normal(0.0462338709677419,0.0216697050990404), 0.0, Inf), ANZ => Truncated(Normal(0.0396465746205965,0.0707787669743405), 0.0, Inf), EEU => Truncated(Normal(0.0475721982758621,0.0973749246061888), 0.0, Inf), FSU => Truncated(Normal(0.0418566470712197,0.0751278509694302), 0.0, Inf), MDE => Truncated(Normal(0.0421993430741693,0.0705702013176662), 0.0, Inf), CAM => Truncated(Normal(0.0638352272727273,0.0428390811061973), 0.0, Inf), LAM => Truncated(Normal(0.003045,0.00495797624773007), 0.0, Inf), SAS => Truncated(Normal(0.025470079787234,0.0240282059284576), 0.0, Inf), SEA => Truncated(Normal(0.0135138888888889,0.00355503300856311), 0.0, Inf), CHI => Truncated(Normal(0.0430619429569277,0.0762567733933823), 0.0, Inf), MAF => Truncated(Normal(0.03346875,0.0426305042811185), 0.0, Inf), SSA => Truncated(Normal(0.0244802631578947,0.0340552582289858), 0.0, Inf), SIS => Truncated(Normal(0.0425735877466748,0.0769042893611385), 0.0, Inf)]
    aglparq = [USA => Truncated(Normal(-0.0119178921568627,0.0182356597477236), -Inf, 0.0), CAN => Truncated(Normal(-0.0158143939393939,0.00945384554959497), -Inf, 0.0), WEU => Truncated(Normal(-0.0138503086419753,0.013197508099606), -Inf, 0.0), JPK => Truncated(Normal(-0.0235887096774194,0.029940084414887), -Inf, 0.0), ANZ => Truncated(Normal(-0.0155903909385135,0.0374712492013158), -Inf, 0.0), EEU => Truncated(Normal(-0.0181573275862069,0.0476884205159737), -Inf, 0.0), FSU => Truncated(Normal(-0.0163118735427424,0.0388313181355771), -Inf, 0.0), MDE => Truncated(Normal(-0.0165914930103618,0.0373495478918258), -Inf, 0.0), CAM => Truncated(Normal(-0.0303977272727273,0.0427671908556002), -Inf, 0.0), LAM => Truncated(Normal(-0.00435,0.00280772150262969), -Inf, 0.0), SAS => Truncated(Normal(-0.0112699468085106,0.018095882190896), -Inf, 0.0), SEA => Truncated(Normal(-0.00965277777777778,0.00843513605824223), -Inf, 0.0), CHI => Truncated(Normal(-0.0168265560310128,0.0396988494314158), -Inf, 0.0), MAF => Truncated(Normal(-0.0139453125,0.0265770062631446), -Inf, 0.0), SSA => Truncated(Normal(-0.0100328947368421,0.0201799487191507), -Inf, 0.0), SIS => Truncated(Normal(-0.0166147684550101,0.0399015737834891), -Inf, 0.0)]
    agnl = Truncated(Normal(2.0,0.5), 0.0, Inf)
    agrbm = [USA => Truncated(Normal(-0.00021,0.00176), -Inf, 0.0), CAN => Truncated(Normal(-0.00029,0.00073), -Inf, 0.0), WEU => Truncated(Normal(-0.00039,0.00138), -Inf, 0.0), JPK => Truncated(Normal(-0.00033,0.00432), -Inf, 0.0), ANZ => Truncated(Normal(-0.00015,0.00142), -Inf, 0.0), EEU => Truncated(Normal(-0.00027,0.00062), -Inf, 0.0), FSU => Truncated(Normal(-0.00018,0.00066), -Inf, 0.0), MDE => Truncated(Normal(-0.00022,0.00032), -Inf, 0.0), CAM => Truncated(Normal(-0.00034,0.00061), -Inf, 0.0), LAM => Truncated(Normal(-9.0e-5,0.0006), -Inf, 0.0), SAS => Truncated(Normal(-0.00014,0.00021), -Inf, 0.0), SEA => Truncated(Normal(-9.0e-5,0.00482), -Inf, 0.0), CHI => Truncated(Normal(-0.00013,0.00075), -Inf, 0.0), MAF => Truncated(Normal(-0.00016,0.00023), -Inf, 0.0), SSA => Truncated(Normal(-0.00011,0.00026), -Inf, 0.0), SIS => Truncated(Normal(-0.0005,0.00103), -Inf, 0.0)]
    agtime = [USA => Truncated(Normal(10.0,5.0), 1.0, Inf), CAN => Truncated(Normal(10.0,5.0), 1.0, Inf), WEU => Truncated(Normal(10.0,5.0), 1.0, Inf), JPK => Truncated(Normal(10.0,5.0), 1.0, Inf), ANZ => Truncated(Normal(10.0,5.0), 1.0, Inf), EEU => Truncated(Normal(10.0,5.0), 1.0, Inf), FSU => Truncated(Normal(10.0,5.0), 1.0, Inf), MDE => Truncated(Normal(10.0,5.0), 1.0, Inf), CAM => Truncated(Normal(10.0,5.0), 1.0, Inf), LAM => Truncated(Normal(10.0,5.0), 1.0, Inf), SAS => Truncated(Normal(10.0,5.0), 1.0, Inf), SEA => Truncated(Normal(10.0,5.0), 1.0, Inf), CHI => Truncated(Normal(10.0,5.0), 1.0, Inf), MAF => Truncated(Normal(10.0,5.0), 1.0, Inf), SSA => Truncated(Normal(10.0,5.0), 1.0, Inf), SIS => Truncated(Normal(10.0,5.0), 1.0, Inf)]
    bioloss = Truncated(Normal(0.003,0.002), 0.0, Inf)
    biosens = Truncated(Normal(0.001,0.001), 0.0, Inf)
    bioshare = TriangularDist(0.0, 1.0, 0.05)
    ccmlbm = [USA => Truncated(Normal(151.6768,3.4583), 0.0, Inf), CAN => Truncated(Normal(195.6424,3.4583), 0.0, Inf), WEU => Truncated(Normal(19.2327,1.2716), 0.0, Inf), JPK => Truncated(Normal(65.5934,3.5211), 0.0, Inf), ANZ => Truncated(Normal(67.1775,2.9403), 0.0, Inf), EEU => Truncated(Normal(61.484,1.5395), 0.0, Inf), FSU => Truncated(Normal(-3.4422,3.4583), -Inf, 0.0), MDE => Truncated(Normal(-2.4508,1.5732), -Inf, 0.0), CAM => Truncated(Normal(-0.6855,2.6117), -Inf, 0.0), LAM => Truncated(Normal(16.6942,1.8829), 0.0, Inf), SAS => Truncated(Normal(-1.6072,2.6242), -Inf, 0.0), SEA => Truncated(Normal(-0.6838,1.4722), -Inf, 0.0), CHI => Truncated(Normal(81.1077,3.4522), 0.0, Inf), MAF => Truncated(Normal(-1.9826,1.9196), -Inf, 0.0), SSA => Truncated(Normal(-1.0407,0.9609), -Inf, 0.0), SIS => Truncated(Normal(1.6035,1.1897), 0.0, Inf)]
    ccmqbm = [USA => Truncated(Normal(-155.1251,2.8292), -Inf, 0.0), CAN => Truncated(Normal(-199.0906,2.8292), -Inf, 0.0), WEU => Truncated(Normal(-21.7191,1.0403), -Inf, 0.0), JPK => Truncated(Normal(-67.185,2.8805), -Inf, 0.0), ANZ => Truncated(Normal(-68.9576,2.4054), -Inf, 0.0), EEU => Truncated(Normal(-65.2217,1.2594), -Inf, 0.0), FSU => Truncated(Normal(0.0473,2.8292), 0.0, Inf), MDE => Truncated(Normal(0.0457,1.287), 0.0, Inf), CAM => Truncated(Normal(-0.484,2.1366), -Inf, 0.0), LAM => Truncated(Normal(-18.2021,1.5404), -Inf, 0.0), SAS => Truncated(Normal(0.0473,2.1468), 0.0, Inf), SEA => Truncated(Normal(0.0413,1.2044), 0.0, Inf), CHI => Truncated(Normal(-84.8815,2.8242), -Inf, 0.0), MAF => Truncated(Normal(0.0473,1.5704), 0.0, Inf), SSA => Truncated(Normal(0.0448,0.7861), 0.0, Inf), SIS => Truncated(Normal(-2.3428,0.9733), -Inf, 0.0)]
    ccplbm = [USA => Truncated(Normal(-161.4521,62.3397), -Inf, 0.0), CAN => Truncated(Normal(-205.4176,62.3397), -Inf, 0.0), WEU => Truncated(Normal(-145.9539,23.8362), -Inf, 0.0), JPK => Truncated(Normal(-33.683,24.9641), -Inf, 0.0), ANZ => Truncated(Normal(-91.0606,53.2451), -Inf, 0.0), EEU => Truncated(Normal(-201.8789,27.0842), -Inf, 0.0), FSU => Truncated(Normal(-190.3936,62.3397), -Inf, 0.0), MDE => Truncated(Normal(-136.8033,30.2768), -Inf, 0.0), CAM => Truncated(Normal(-54.1635,45.5739), -Inf, 0.0), LAM => Truncated(Normal(-78.4126,32.7397), -Inf, 0.0), SAS => Truncated(Normal(-80.232,51.2055), -Inf, 0.0), SEA => Truncated(Normal(12.0899,12.0535), 0.0, Inf), CHI => Truncated(Normal(-66.6796,43.8249), -Inf, 0.0), MAF => Truncated(Normal(-102.4339,35.4522), -Inf, 0.0), SSA => Truncated(Normal(-49.97,16.5999), -Inf, 0.0), SIS => Truncated(Normal(-10.4503,7.4943), -Inf, 0.0)]
    ccpqbm = [USA => Truncated(Normal(2.8314,62.308), 0.0, Inf), CAN => Truncated(Normal(2.8314,62.308), 0.0, Inf), WEU => Truncated(Normal(2.8279,23.8241), 0.0, Inf), JPK => Truncated(Normal(1.2018,24.9514), 0.0, Inf), ANZ => Truncated(Normal(2.8314,53.218), 0.0, Inf), EEU => Truncated(Normal(2.8314,27.0704), 0.0, Inf), FSU => Truncated(Normal(2.8314,62.308), 0.0, Inf), MDE => Truncated(Normal(2.7443,30.2614), 0.0, Inf), CAM => Truncated(Normal(2.7085,45.5507), 0.0, Inf), LAM => Truncated(Normal(2.8094,32.723), 0.0, Inf), SAS => Truncated(Normal(2.8314,51.1794), 0.0, Inf), SEA => Truncated(Normal(-1.1081,12.0474), -Inf, 0.0), CHI => Truncated(Normal(2.0193,43.8025), 0.0, Inf), MAF => Truncated(Normal(2.8314,35.4341), 0.0, Inf), SSA => Truncated(Normal(2.6771,16.5915), 0.0, Inf), SIS => Truncated(Normal(0.5138,7.4905), 0.0, Inf)]
    cebm = [USA => Truncated(Normal(-0.00212,0.00212), -Inf, 0.0), CAN => Truncated(Normal(-0.00186,0.00186), -Inf, 0.0), WEU => Truncated(Normal(-0.00372,0.00372), -Inf, 0.0), JPK => Truncated(Normal(-0.00029,0.00029), -Inf, 0.0), ANZ => Truncated(Normal(-0.00021,0.00021), -Inf, 0.0), EEU => Truncated(Normal(-0.00185,0.00185), -Inf, 0.0), FSU => Truncated(Normal(-0.00674,0.00674), -Inf, 0.0), MDE => Truncated(Normal(-0.00233,0.00233), -Inf, 0.0), CAM => Truncated(Normal(-0.00239,0.00239), -Inf, 0.0), LAM => Truncated(Normal(-0.00259,0.00259), -Inf, 0.0), SAS => Truncated(Normal(-0.00384,0.00384), -Inf, 0.0), SEA => Truncated(Normal(-0.0074,0.0074), -Inf, 0.0), CHI => Truncated(Normal(-0.02891,0.02891), -Inf, 0.0), MAF => Truncated(Normal(-0.01892,0.01892), -Inf, 0.0), SSA => Truncated(Normal(-0.00797,0.00797), -Inf, 0.0), SIS => Truncated(Normal(-0.00239,0.00239), -Inf, 0.0)]
    ceel = Truncated(Normal(0.8,0.2), 0.0, 1.0)
    cenl = Truncated(Normal(1.5,0.5), 0.0, Inf)
    ch4add = Normal(0.0,6.8346)
    chmlbm = [USA => Truncated(Normal(1.0988,1.0738), 0.0, Inf), CAN => Truncated(Normal(1.0705,1.0738), 0.0, Inf), WEU => Truncated(Normal(0.4022,0.4226), 0.0, Inf), JPK => Truncated(Normal(1.0356,1.1234), 0.0, Inf), ANZ => Truncated(Normal(0.4493,0.9147), 0.0, Inf), EEU => Truncated(Normal(0.6119,0.4767), 0.0, Inf), FSU => Truncated(Normal(0.6468,1.0738), 0.0, Inf), MDE => Truncated(Normal(1.0931,0.4791), 0.0, Inf), CAM => Truncated(Normal(0.9144,0.8887), 0.0, Inf), LAM => Truncated(Normal(0.5893,0.5874), 0.0, Inf), SAS => Truncated(Normal(1.6317,0.8373), 0.0, Inf), SEA => Truncated(Normal(0.8545,0.4641), 0.0, Inf), CHI => Truncated(Normal(0.7565,1.0335), 0.0, Inf), MAF => Truncated(Normal(1.0409,0.5662), 0.0, Inf), SSA => Truncated(Normal(0.8682,0.3408), 0.0, Inf), SIS => Truncated(Normal(1.0227,0.4957), 0.0, Inf)]
    chmqbm = [USA => Truncated(Normal(0.0471,0.8815), 0.0, Inf), CAN => Truncated(Normal(0.0471,0.8815), 0.0, Inf), WEU => Truncated(Normal(0.0467,0.3469), 0.0, Inf), JPK => Truncated(Normal(0.0559,0.9223), 0.0, Inf), ANZ => Truncated(Normal(0.047,0.7509), 0.0, Inf), EEU => Truncated(Normal(0.047,0.3914), 0.0, Inf), FSU => Truncated(Normal(0.0471,0.8815), 0.0, Inf), MDE => Truncated(Normal(0.0452,0.3933), 0.0, Inf), CAM => Truncated(Normal(0.0471,0.7296), 0.0, Inf), LAM => Truncated(Normal(0.047,0.4823), 0.0, Inf), SAS => Truncated(Normal(0.047,0.6874), 0.0, Inf), SEA => Truncated(Normal(0.0411,0.381), 0.0, Inf), CHI => Truncated(Normal(0.0474,0.8485), 0.0, Inf), MAF => Truncated(Normal(0.0471,0.4648), 0.0, Inf), SSA => Truncated(Normal(0.044,0.2798), 0.0, Inf), SIS => Truncated(Normal(0.0324,0.407), 0.0, Inf)]
    chplbm = [USA => Truncated(Normal(34.9374,42.9155), 0.0, Inf), CAN => Truncated(Normal(27.328,42.9155), 0.0, Inf), WEU => Truncated(Normal(25.757,17.8447), 0.0, Inf), JPK => Truncated(Normal(8.2986,17.7713), 0.0, Inf), ANZ => Truncated(Normal(18.8372,36.7267), 0.0, Inf), EEU => Truncated(Normal(29.6249,18.8672), 0.0, Inf), FSU => Truncated(Normal(36.4415,42.9155), 0.0, Inf), MDE => Truncated(Normal(50.5493,20.6547), 0.0, Inf), CAM => Truncated(Normal(44.7697,34.4286), 0.0, Inf), LAM => Truncated(Normal(33.7621,23.0347), 0.0, Inf), SAS => Truncated(Normal(74.5092,36.2131), 0.0, Inf), SEA => Truncated(Normal(-18.7223,8.1867), -Inf, 0.0), CHI => Truncated(Normal(82.0355,29.0776), 0.0, Inf), MAF => Truncated(Normal(50.4842,23.0206), 0.0, Inf), SSA => Truncated(Normal(43.4397,13.5145), 0.0, Inf), SIS => Truncated(Normal(16.9938,8.0489), 0.0, Inf)]
    chpqbm = [USA => Truncated(Normal(1.7285,35.2319), 0.0, Inf), CAN => Truncated(Normal(1.7285,35.2319), 0.0, Inf), WEU => Truncated(Normal(1.7966,14.6498), 0.0, Inf), JPK => Truncated(Normal(0.7493,14.5895), 0.0, Inf), ANZ => Truncated(Normal(1.7286,30.1512), 0.0, Inf), EEU => Truncated(Normal(1.7531,15.4893), 0.0, Inf), FSU => Truncated(Normal(1.7285,35.2319), 0.0, Inf), MDE => Truncated(Normal(1.7011,16.9568), 0.0, Inf), CAM => Truncated(Normal(1.662,28.2646), 0.0, Inf), LAM => Truncated(Normal(1.7535,18.9106), 0.0, Inf), SAS => Truncated(Normal(1.7378,29.7296), 0.0, Inf), SEA => Truncated(Normal(-0.6683,6.721), -Inf, 0.0), CHI => Truncated(Normal(1.2095,23.8716), 0.0, Inf), MAF => Truncated(Normal(1.7096,18.8991), 0.0, Inf), SSA => Truncated(Normal(1.6578,11.0949), 0.0, Inf), SIS => Truncated(Normal(0.4223,6.6079), 0.0, Inf)]
    climatesensitivity = Truncated(Gamma(6.47815626,0.547629469), 1.0, Inf)
    cvlin = Truncated(Normal(0.025901,0.009574), 0.0, Inf)
    dfch = [USA => Truncated(Normal(0.3534,0.0614), 0.0, Inf), CAN => Truncated(Normal(0.3534,0.0614), 0.0, Inf), WEU => Truncated(Normal(0.3534,0.0614), 0.0, Inf), JPK => Truncated(Normal(0.3534,0.0614), 0.0, Inf), ANZ => Truncated(Normal(0.3534,0.0614), 0.0, Inf), EEU => Truncated(Normal(0.3534,0.0614), 0.0, Inf), FSU => Truncated(Normal(0.3534,0.0614), 0.0, Inf), MDE => Truncated(Normal(0.3534,0.0614), 0.0, Inf), CAM => Truncated(Normal(0.3534,0.0614), 0.0, Inf), LAM => Truncated(Normal(0.3534,0.0614), 0.0, Inf), SAS => Truncated(Normal(0.3534,0.0614), 0.0, Inf), SEA => Truncated(Normal(0.3534,0.0614), 0.0, Inf), CHI => Truncated(Normal(0.3534,0.0614), 0.0, Inf), MAF => Truncated(Normal(0.3534,0.0614), 0.0, Inf), SSA => Truncated(Normal(0.3534,0.0614), 0.0, Inf), SIS => Truncated(Normal(0.3534,0.0614), 0.0, Inf)]
    dfnl = Truncated(Normal(1.0,0.5), 0.0, Inf)
    diamortel = Truncated(Normal(-1.578625,0.232507), -Inf, 0.0)
    diamortnl = Truncated(Normal(1.141714,0.508302), 0.0, Inf)
    diayldel = Truncated(Normal(-0.418406,0.119223), -1.0, 0.0)
    diayldnl = Truncated(Normal(0.699241,0.260643), 0.0, Inf)
    dlbm = [USA => Truncated(Normal(20000.0,10000.0), 0.0, Inf), CAN => Truncated(Normal(970.0,970.0), 0.0, Inf), WEU => Truncated(Normal(4212.0,1273.0), 0.0, Inf), JPK => Truncated(Normal(2687.0,1213.0), 0.0, Inf), ANZ => Truncated(Normal(3135.0,2920.0), 0.0, Inf), EEU => Truncated(Normal(1889.0,860.0), 0.0, Inf), FSU => Truncated(Normal(15138.0,15138.0), 0.0, Inf), MDE => Truncated(Normal(1621.0,1025.0), 0.0, Inf), CAM => Truncated(Normal(12004.0,8033.0), 0.0, Inf), LAM => Truncated(Normal(29407.0,11847.0), 0.0, Inf), SAS => Truncated(Normal(81275.0,49361.0), 0.0, Inf), SEA => Truncated(Normal(157286.0,90170.0), 0.0, Inf), CHI => Truncated(Normal(35000.0,17500.0), 0.0, Inf), MAF => Truncated(Normal(8354.0,3478.0), 0.0, Inf), SSA => Truncated(Normal(126602.0,63820.0), 0.0, Inf), SIS => Truncated(Normal(1505.0,628.0), 0.0, Inf)]
    drylandlossparam = [USA => Truncated(Normal(0.583433160330257,0.0310749451958314), 0.0, 1.0), CAN => Truncated(Normal(0.260515053189669,0.0137582984542109), 0.0, 1.0), WEU => Truncated(Normal(0.273314149409615,0.0146688810943221), 0.0, 1.0), JPK => Truncated(Normal(0.412066944374299,0.0268279386449215), 0.0, 1.0), ANZ => Truncated(Normal(0.548496484507909,0.0353090095289534), 0.0, 1.0), EEU => Truncated(Normal(0.193491238230705,0.0120297038764903), 0.0, 1.0), FSU => Truncated(Normal(0.555487676094765,0.0344126167165359), 0.0, 1.0), MDE => Truncated(Normal(0.628422279667412,0.00914652560895185), 0.0, 1.0), CAM => Truncated(Normal(0.678302864355753,0.0264748504908147), 0.0, 1.0), LAM => Truncated(Normal(0.756134247750368,0.0200692929944761), 0.0, 1.0), SAS => Truncated(Normal(0.929957316565567,0.0241559579142168), 0.0, 1.0), SEA => Truncated(Normal(0.81223935947527,0.0429547897395688), 0.0, 1.0), CHI => Truncated(Normal(0.707719142022655,0.0243920096916722), 0.0, 1.0), MAF => Truncated(Normal(0.336949623686827,0.0195350728174195), 0.0, 1.0), SSA => Truncated(Normal(0.798533208857799,0.0442837491243777), 0.0, 1.0), SIS => Truncated(Normal(0.667255915065629,0.0408474363982656), 0.0, 1.0)]
    dvbm = Truncated(Normal(0.004,0.002), 0.0, Inf)
    dvydl = Truncated(Normal(1.0,0.25), 0.0, Inf)
    ecgradd = [USA => Truncated(Normal(0.0,0.28), -0.645266515499562, 1.35473348450044), CAN => Truncated(Normal(0.0,0.28), -0.645266515499562, 1.35473348450044), WEU => Truncated(Normal(0.0,0.2775), -0.645129685612399, 1.3548703143876), JPK => Truncated(Normal(0.0,0.2825), -0.645237785006474, 1.35476221499353), ANZ => Truncated(Normal(0.0,0.2825), -0.645237785006474, 1.35476221499353), EEU => Truncated(Normal(0.0,0.4825), -0.702791192885658, 1.29720880711434), FSU => Truncated(Normal(0.0,0.4825), -0.702791192885658, 1.29720880711434), MDE => Truncated(Normal(0.0,0.65), -0.751960508718775, 1.24803949128122), CAM => Truncated(Normal(0.0,0.65), -0.751960508718775, 1.24803949128122), LAM => Truncated(Normal(0.0,0.65), -0.751960508718775, 1.24803949128122), SAS => Truncated(Normal(0.0,0.65), -0.751960508718775, 1.24803949128122), SEA => Truncated(Normal(0.0,0.65), -0.751960508718775, 1.24803949128122), CHI => Truncated(Normal(0.0,0.7125), -0.761043730670382, 1.23895626932962), MAF => Truncated(Normal(0.0,0.65), -0.751960508718775, 1.24803949128122), SSA => Truncated(Normal(0.0,0.65), -0.751960508718775, 1.24803949128122), SIS => Truncated(Normal(0.0,0.65), -0.751960508718775, 1.24803949128122)]
    emcst = Truncated(Normal(3.0,1.5), 0.0, Inf)
    extratropicalstormsdamel = Truncated(Normal(-0.514,0.027), -1.0, 0.0)
    extratropicalstormsdeadel = Truncated(Normal(-0.501,0.051), -1.0, 0.0)
    forbm = [USA => Normal(5.325e-5,1.422e-5), CAN => Normal(1.123e-5,7.152e-5), WEU => Normal(2.528e-5,5.7e-6), JPK => Normal(4.173e-5,1.235e-5), ANZ => Normal(-0.0001211,3.255e-5), EEU => Normal(5.462e-5,2.472e-5), FSU => Normal(-2.348e-5,5.312e-5), MDE => Normal(0.0,3.386e-5), CAM => Normal(1.806e-5,3.429e-5), LAM => Normal(2.411e-5,1.195e-5), SAS => Normal(6.237e-5,2.294e-5), SEA => Normal(6.674e-5,2.772e-5), CHI => Normal(8.723e-5,3.22e-5), MAF => Normal(0.0,3.386e-5), SSA => Normal(1.141e-5,3.459e-5), SIS => Normal(0.0,3.386e-5)]
    forco2 = Truncated(Normal(2.2972,1.1486), 0.0, Inf)
    forel = Truncated(Normal(-0.31,0.2), -1.0, 0.0)
    foremadd = [USA => Normal(0.0,0.2025), CAN => Normal(0.0,0.2025), CAM => Normal(0.0,3.185), LAM => Normal(0.0,28.66), SAS => Normal(0.0,4.0375), SEA => Normal(0.0,12.1125), CHI => Normal(0.0,1.2675), SSA => Normal(0.0,11.76)]
    fornl = Truncated(Normal(1.0,0.5), 0.0, Inf)
    hebm = [USA => Truncated(Normal(0.00429,0.00429), 0.0, Inf), CAN => Truncated(Normal(0.00378,0.00378), 0.0, Inf), WEU => Truncated(Normal(0.00241,0.00241), 0.0, Inf), JPK => Truncated(Normal(0.00207,0.00207), 0.0, Inf), ANZ => Truncated(Normal(0.00151,0.00151), 0.0, Inf), EEU => Truncated(Normal(0.00456,0.00456), 0.0, Inf), FSU => Truncated(Normal(0.01663,0.01663), 0.0, Inf), MDE => Truncated(Normal(0.02074,0.02074), 0.0, Inf), CAM => Truncated(Normal(0.00366,0.00366), 0.0, Inf), LAM => Truncated(Normal(0.00395,0.00395), 0.0, Inf), SAS => Truncated(Normal(0.00361,0.00361), 0.0, Inf), SEA => Truncated(Normal(0.00695,0.00695), 0.0, Inf), CHI => Truncated(Normal(0.03971,0.03971), 0.0, Inf), MAF => Truncated(Normal(0.00015,0.00015), 0.0, Inf), SSA => Truncated(Normal(6.0e-5,6.0e-5), 0.0, Inf), SIS => Truncated(Normal(0.00366,0.00366), 0.0, Inf)]
    heel = Truncated(Normal(0.8,0.1), 0.0, 1.0)
    henl = Truncated(Normal(0.5,0.5), 0.0, Inf)
    hurrdamel = Truncated(Normal(-0.514,0.027), -1.0, 0.0)
    hurrdeadel = Truncated(Normal(-0.501,0.051), -1.0, 0.0)
    hurrpar = Normal(0.04,0.005)
    immcst = Truncated(Normal(0.4,0.2), 0.0, Inf)
    lifech4 = TriangularDist(8.0, 16.0, 12.0)
    lifeco2 = Truncated(Normal(363.0,90.75), 0.0, Inf)
    lifeco3 = Truncated(Normal(74.0,18.5), 0.0, Inf)
    lifeco4 = Truncated(Normal(17.0,4.25), 0.0, Inf)
    lifeco5 = Truncated(Normal(2.0,0.5), 0.0, Inf)
    lifen2o = TriangularDist(100.0, 170.0, 114.0)
    lifesea = TriangularDist(250.0, 1000.0, 500.0)
    lifesf6 = TriangularDist(1600.0, 4800.0, 3200.0)
    malch = [USA => Truncated(Normal(0.0794,0.0575), 0.0, Inf), CAN => Truncated(Normal(0.0794,0.0575), 0.0, Inf), WEU => Truncated(Normal(0.0794,0.0575), 0.0, Inf), JPK => Truncated(Normal(0.0794,0.0575), 0.0, Inf), ANZ => Truncated(Normal(0.0794,0.0575), 0.0, Inf), EEU => Truncated(Normal(0.0794,0.0575), 0.0, Inf), FSU => Truncated(Normal(0.0794,0.0575), 0.0, Inf), MDE => Truncated(Normal(0.0794,0.0575), 0.0, Inf), CAM => Truncated(Normal(0.0794,0.0575), 0.0, Inf), LAM => Truncated(Normal(0.0794,0.0575), 0.0, Inf), SAS => Truncated(Normal(0.0794,0.0575), 0.0, Inf), SEA => Truncated(Normal(0.0794,0.0575), 0.0, Inf), CHI => Truncated(Normal(0.0794,0.0575), 0.0, Inf), MAF => Truncated(Normal(0.0794,0.0575), 0.0, Inf), SSA => Truncated(Normal(0.0794,0.0575), 0.0, Inf), SIS => Truncated(Normal(0.0794,0.0575), 0.0, Inf)]
    malnl = Truncated(Normal(1.0,0.5), 0.0, Inf)
    maxcardvasc = Truncated(Normal(0.05,0.02), 0.0, Inf)
    migrate = [[USA, USA] => Gamma(101.990195135928,0.00990195135927852), [USA, CAN] => Gamma(1.0,0.05), [USA, WEU] => Gamma(1.0,0.05), [USA, JPK] => Gamma(1.0,0.05), [USA, ANZ] => Gamma(1.0,0.05), [USA, EEU] => Gamma(1.0,0.05), [USA, FSU] => Gamma(1.0,0.05), [USA, MDE] => Gamma(2.0,0.04), [USA, CAM] => Gamma(2.0,0.1), [USA, LAM] => Gamma(2.0,0.1), [USA, SAS] => Gamma(2.0,0.04), [USA, SEA] => Gamma(2.0,0.04), [USA, CHI] => Gamma(2.0,0.04), [USA, MAF] => Gamma(2.0,0.01), [USA, SSA] => Gamma(2.0,0.03), [USA, SIS] => Gamma(2.0,0.15), [CAN, USA] => Gamma(1.0,0.05), [CAN, CAN] => Gamma(101.990195135928,0.00990195135927852), [CAN, WEU] => Gamma(1.0,0.02), [CAN, JPK] => Gamma(1.0,0.02), [CAN, ANZ] => Gamma(1.0,0.02), [CAN, EEU] => Gamma(1.0,0.02), [CAN, FSU] => Gamma(1.0,0.02), [CAN, MDE] => Gamma(2.0,0.01), [CAN, CAM] => Gamma(1.0,0.05), [CAN, LAM] => Gamma(1.0,0.05), [CAN, SAS] => Gamma(2.0,0.01), [CAN, SEA] => Gamma(2.0,0.01), [CAN, CHI] => Gamma(2.0,0.01), [CAN, MAF] => Gamma(1.0,0.005), [CAN, SSA] => Gamma(2.0,0.005), [CAN, SIS] => Gamma(2.0,0.1), [WEU, USA] => Gamma(1.0,0.02), [WEU, CAN] => Gamma(1.0,0.02), [WEU, WEU] => Gamma(101.990195135928,0.00990195135927852), [WEU, JPK] => Gamma(1.0,0.02), [WEU, ANZ] => Gamma(1.0,0.02), [WEU, EEU] => Gamma(1.0,0.02), [WEU, FSU] => Gamma(1.0,0.02), [WEU, MDE] => Gamma(2.0,0.04), [WEU, CAM] => Gamma(1.0,0.05), [WEU, LAM] => Gamma(1.0,0.05), [WEU, SAS] => Gamma(2.0,0.04), [WEU, SEA] => Gamma(2.0,0.02), [WEU, CHI] => Gamma(2.0,0.02), [WEU, MAF] => Gamma(2.0,0.09), [WEU, SSA] => Gamma(2.0,0.06), [WEU, SIS] => Gamma(2.0,0.15), [JPK, USA] => Gamma(1.0,0.01), [JPK, CAN] => Gamma(1.0,0.01), [JPK, WEU] => Gamma(1.0,0.01), [JPK, JPK] => Gamma(101.990195135928,0.00990195135927852), [JPK, ANZ] => Gamma(1.0,0.01), [JPK, EEU] => Gamma(1.0,0.001), [JPK, FSU] => Gamma(1.0,0.001), [JPK, MDE] => Gamma(1.0,0.005), [JPK, CAM] => Gamma(1.0,0.01), [JPK, LAM] => Gamma(1.0,0.01), [JPK, SAS] => Gamma(2.0,0.005), [JPK, SEA] => Gamma(2.0,0.01), [JPK, CHI] => Gamma(2.0,0.01), [JPK, MAF] => Gamma(1.0,0.001), [JPK, SSA] => Gamma(1.0,0.001), [JPK, SIS] => Gamma(2.0,0.05), [ANZ, USA] => Gamma(1.0,0.02), [ANZ, CAN] => Gamma(1.0,0.02), [ANZ, WEU] => Gamma(1.0,0.02), [ANZ, JPK] => Gamma(1.0,0.02), [ANZ, ANZ] => Gamma(101.990195135928,0.00990195135927852), [ANZ, EEU] => Gamma(1.0,0.01), [ANZ, FSU] => Gamma(1.0,0.01), [ANZ, MDE] => Gamma(2.0,0.01), [ANZ, CAM] => Gamma(1.0,0.01), [ANZ, LAM] => Gamma(1.0,0.01), [ANZ, SAS] => Gamma(2.0,0.005), [ANZ, SEA] => Gamma(2.0,0.02), [ANZ, CHI] => Gamma(2.0,0.02), [ANZ, MAF] => Gamma(1.0,0.005), [ANZ, SSA] => Gamma(2.0,0.005), [ANZ, SIS] => Gamma(2.0,0.15), [EEU, USA] => Gamma(1.0,0.001), [EEU, CAN] => Gamma(1.0,0.001), [EEU, WEU] => Gamma(1.0,0.001), [EEU, JPK] => Gamma(1.0,0.001), [EEU, ANZ] => Gamma(1.0,0.001), [EEU, EEU] => Gamma(101.990195135928,0.00990195135927852), [EEU, FSU] => Gamma(1.0,0.05), [EEU, MDE] => Gamma(1.0,0.001), [EEU, CAM] => Gamma(1.0,0.001), [EEU, LAM] => Gamma(1.0,0.001), [EEU, SAS] => Gamma(1.0,0.001), [EEU, SEA] => Gamma(1.0,0.001), [EEU, CHI] => Gamma(1.0,0.001), [EEU, MAF] => Gamma(1.0,0.001), [EEU, SSA] => Gamma(1.0,0.001), [EEU, SIS] => Gamma(1.0,0.001), [FSU, USA] => Gamma(1.0,0.001), [FSU, CAN] => Gamma(1.0,0.001), [FSU, WEU] => Gamma(1.0,0.001), [FSU, JPK] => Gamma(1.0,0.001), [FSU, ANZ] => Gamma(1.0,0.001), [FSU, EEU] => Gamma(1.0,0.001), [FSU, FSU] => Gamma(101.990195135928,0.00990195135927852), [FSU, MDE] => Gamma(1.0,0.001), [FSU, CAM] => Gamma(1.0,0.001), [FSU, LAM] => Gamma(1.0,0.001), [FSU, SAS] => Gamma(1.0,0.001), [FSU, SEA] => Gamma(1.0,0.001), [FSU, CHI] => Gamma(1.0,0.001), [FSU, MAF] => Gamma(1.0,0.001), [FSU, SSA] => Gamma(1.0,0.001), [FSU, SIS] => Gamma(1.0,0.001), [MDE, USA] => Gamma(1.0,0.001), [MDE, CAN] => Gamma(1.0,0.001), [MDE, WEU] => Gamma(1.0,0.001), [MDE, JPK] => Gamma(1.0,0.001), [MDE, ANZ] => Gamma(1.0,0.001), [MDE, EEU] => Gamma(1.0,0.001), [MDE, FSU] => Gamma(1.0,0.001), [MDE, MDE] => Gamma(82.987950057818,0.0109772228646444), [MDE, CAM] => Gamma(1.0,0.001), [MDE, LAM] => Gamma(1.0,0.001), [MDE, SAS] => Gamma(1.0,0.001), [MDE, SEA] => Gamma(1.0,0.001), [MDE, CHI] => Gamma(1.0,0.001), [MDE, MAF] => Gamma(1.0,0.001), [MDE, SSA] => Gamma(1.0,0.001), [MDE, SIS] => Gamma(1.0,0.001), [CAM, USA] => Gamma(1.0,0.001), [CAM, CAN] => Gamma(1.0,0.001), [CAM, WEU] => Gamma(1.0,0.001), [CAM, JPK] => Gamma(1.0,0.001), [CAM, ANZ] => Gamma(1.0,0.001), [CAM, EEU] => Gamma(1.0,0.001), [CAM, FSU] => Gamma(1.0,0.001), [CAM, MDE] => Gamma(1.0,0.001), [CAM, CAM] => Gamma(82.987950057818,0.0109772228646444), [CAM, LAM] => Gamma(1.0,0.005), [CAM, SAS] => Gamma(1.0,0.001), [CAM, SEA] => Gamma(1.0,0.001), [CAM, CHI] => Gamma(1.0,0.001), [CAM, MAF] => Gamma(1.0,0.001), [CAM, SSA] => Gamma(1.0,0.001), [CAM, SIS] => Gamma(2.0,0.1), [LAM, USA] => Gamma(1.0,0.001), [LAM, CAN] => Gamma(1.0,0.001), [LAM, WEU] => Gamma(1.0,0.001), [LAM, JPK] => Gamma(1.0,0.001), [LAM, ANZ] => Gamma(1.0,0.001), [LAM, EEU] => Gamma(1.0,0.001), [LAM, FSU] => Gamma(1.0,0.001), [LAM, MDE] => Gamma(1.0,0.001), [LAM, CAM] => Gamma(1.0,0.005), [LAM, LAM] => Gamma(82.987950057818,0.0109772228646444), [LAM, SAS] => Gamma(1.0,0.001), [LAM, SEA] => Gamma(1.0,0.001), [LAM, CHI] => Gamma(1.0,0.001), [LAM, MAF] => Gamma(1.0,0.001), [LAM, SSA] => Gamma(1.0,0.001), [LAM, SIS] => Gamma(2.0,0.1), [SAS, USA] => Gamma(1.0,0.001), [SAS, CAN] => Gamma(1.0,0.001), [SAS, WEU] => Gamma(1.0,0.001), [SAS, JPK] => Gamma(1.0,0.001), [SAS, ANZ] => Gamma(1.0,0.001), [SAS, EEU] => Gamma(1.0,0.001), [SAS, FSU] => Gamma(1.0,0.001), [SAS, MDE] => Gamma(1.0,0.001), [SAS, CAM] => Gamma(1.0,0.001), [SAS, LAM] => Gamma(1.0,0.001), [SAS, SAS] => Gamma(82.987950057818,0.0109772228646444), [SAS, SEA] => Gamma(1.0,0.005), [SAS, CHI] => Gamma(1.0,0.001), [SAS, MAF] => Gamma(1.0,0.001), [SAS, SSA] => Gamma(1.0,0.001), [SAS, SIS] => Gamma(2.0,0.1), [SEA, USA] => Gamma(1.0,0.001), [SEA, CAN] => Gamma(1.0,0.001), [SEA, WEU] => Gamma(1.0,0.001), [SEA, JPK] => Gamma(1.0,0.001), [SEA, ANZ] => Gamma(1.0,0.001), [SEA, EEU] => Gamma(1.0,0.001), [SEA, FSU] => Gamma(1.0,0.001), [SEA, MDE] => Gamma(1.0,0.001), [SEA, CAM] => Gamma(1.0,0.001), [SEA, LAM] => Gamma(1.0,0.001), [SEA, SAS] => Gamma(1.0,0.005), [SEA, SEA] => Gamma(82.987950057818,0.0109772228646444), [SEA, CHI] => Gamma(1.0,0.005), [SEA, MAF] => Gamma(1.0,0.001), [SEA, SSA] => Gamma(1.0,0.001), [SEA, SIS] => Gamma(2.0,0.1), [CHI, USA] => Gamma(1.0,0.001), [CHI, CAN] => Gamma(1.0,0.001), [CHI, WEU] => Gamma(1.0,0.001), [CHI, JPK] => Gamma(1.0,0.001), [CHI, ANZ] => Gamma(1.0,0.001), [CHI, EEU] => Gamma(1.0,0.001), [CHI, FSU] => Gamma(1.0,0.001), [CHI, MDE] => Gamma(1.0,0.001), [CHI, CAM] => Gamma(1.0,0.001), [CHI, LAM] => Gamma(1.0,0.001), [CHI, SAS] => Gamma(1.0,0.001), [CHI, SEA] => Gamma(1.0,0.001), [CHI, CHI] => Gamma(82.987950057818,0.0109772228646444), [CHI, MAF] => Gamma(1.0,0.001), [CHI, SSA] => Gamma(1.0,0.001), [CHI, SIS] => Gamma(1.0,0.001), [MAF, USA] => Gamma(1.0,0.001), [MAF, CAN] => Gamma(1.0,0.001), [MAF, WEU] => Gamma(1.0,0.001), [MAF, JPK] => Gamma(1.0,0.001), [MAF, ANZ] => Gamma(1.0,0.001), [MAF, EEU] => Gamma(1.0,0.001), [MAF, FSU] => Gamma(1.0,0.001), [MAF, MDE] => Gamma(1.0,0.001), [MAF, CAM] => Gamma(1.0,0.001), [MAF, LAM] => Gamma(1.0,0.001), [MAF, SAS] => Gamma(1.0,0.001), [MAF, SEA] => Gamma(1.0,0.001), [MAF, CHI] => Gamma(1.0,0.001), [MAF, MAF] => Gamma(82.987950057818,0.0109772228646444), [MAF, SSA] => Gamma(1.0,0.005), [MAF, SIS] => Gamma(1.0,0.001), [SSA, USA] => Gamma(1.0,0.001), [SSA, CAN] => Gamma(1.0,0.001), [SSA, WEU] => Gamma(1.0,0.001), [SSA, JPK] => Gamma(1.0,0.001), [SSA, ANZ] => Gamma(1.0,0.001), [SSA, EEU] => Gamma(1.0,0.001), [SSA, FSU] => Gamma(1.0,0.001), [SSA, MDE] => Gamma(1.0,0.001), [SSA, CAM] => Gamma(1.0,0.001), [SSA, LAM] => Gamma(1.0,0.001), [SSA, SAS] => Gamma(1.0,0.001), [SSA, SEA] => Gamma(1.0,0.001), [SSA, CHI] => Gamma(1.0,0.001), [SSA, MAF] => Gamma(1.0,0.001), [SSA, SSA] => Gamma(82.987950057818,0.0109772228646444), [SSA, SIS] => Gamma(1.0,0.001), [SIS, USA] => Gamma(1.0,0.001), [SIS, CAN] => Gamma(1.0,0.001), [SIS, WEU] => Gamma(1.0,0.001), [SIS, JPK] => Gamma(1.0,0.001), [SIS, ANZ] => Gamma(1.0,0.001), [SIS, EEU] => Gamma(1.0,0.001), [SIS, FSU] => Gamma(1.0,0.001), [SIS, MDE] => Gamma(1.0,0.001), [SIS, CAM] => Gamma(1.0,0.001), [SIS, LAM] => Gamma(1.0,0.001), [SIS, SAS] => Gamma(1.0,0.001), [SIS, SEA] => Gamma(1.0,0.001), [SIS, CHI] => Gamma(1.0,0.001), [SIS, MAF] => Gamma(1.0,0.001), [SIS, SSA] => Gamma(1.0,0.001), [SIS, SIS] => Gamma(1.0,0.1)]
    n2oadd = Normal(0.0,0.0059)
    pc = [USA => Truncated(Normal(95.3,95.3), 0.0, Inf), CAN => Truncated(Normal(13.0,13.0), 0.0, Inf), WEU => Truncated(Normal(153.9,52.6), 0.0, Inf), JPK => Truncated(Normal(75.5,54.7), 0.0, Inf), ANZ => Truncated(Normal(36.6,26.8), 0.0, Inf), EEU => Truncated(Normal(3.1,1.7), 0.0, Inf), FSU => Truncated(Normal(54.0,54.0), 0.0, Inf), MDE => Truncated(Normal(18.9,9.6), 0.0, Inf), CAM => Truncated(Normal(42.3,33.8), 0.0, Inf), LAM => Truncated(Normal(117.6,79.0), 0.0, Inf), SAS => Truncated(Normal(172.0,153.6), 0.0, Inf), SEA => Truncated(Normal(169.7,84.4), 0.0, Inf), CHI => Truncated(Normal(118.4,118.4), 0.0, Inf), MAF => Truncated(Normal(19.0,10.2), 0.0, Inf), SSA => Truncated(Normal(84.3,38.3), 0.0, Inf), SIS => Truncated(Normal(16.0,5.7), 0.0, Inf)]
    pgadd = [USA => Normal(0.0,0.00625), CAN => Normal(0.0,0.00625), WEU => Normal(0.0,0.00625), JPK => Normal(0.0,0.01875), ANZ => Normal(0.0,0.01875), EEU => Normal(0.0,0.00625), FSU => Normal(0.0,0.00625), MDE => Normal(0.0,0.09375), CAM => Normal(0.0,0.0375), LAM => Normal(0.0,0.0375), SAS => Normal(0.0,0.09375), SEA => Normal(0.0,0.09375), CHI => Normal(0.0,0.01875), MAF => Normal(0.0,0.15625), SSA => Normal(0.0,0.15625), SIS => Normal(0.0,0.0375)]
    plusel = Truncated(Normal(0.25,0.08), 0.0, Inf)
    rlbm = [USA => Normal(0.9452,6.7337), CAN => Normal(-1.9284,6.7337), WEU => Normal(-0.765,2.4863), JPK => Normal(0.4185,5.813), ANZ => Normal(0.2579,5.7279), EEU => Normal(-1.2946,2.9883), FSU => Normal(1.5277,6.7337), MDE => Normal(5.6711,3.069), CAM => Normal(3.8894,5.0789), LAM => Normal(1.0893,3.6563), SAS => Normal(10.2485,5.1264), SEA => Normal(4.8562,3.2809), CHI => Normal(4.4083,6.5634), MAF => Normal(5.198,3.7408), SSA => Normal(3.6196,1.8681), SIS => Normal(4.1354,2.033)]
    rlin = Truncated(Normal(0.001583,0.000457), 0.0, Inf)
    rqbm = [USA => Normal(0.4342,5.5281), CAN => Normal(0.4342,5.5281), WEU => Normal(0.4341,2.0412), JPK => Normal(0.4342,4.7723), ANZ => Normal(0.4342,4.7024), EEU => Normal(0.4342,2.4533), FSU => Normal(0.4342,5.5281), MDE => Normal(0.4194,2.5196), CAM => Normal(0.4342,4.1696), LAM => Normal(0.4335,3.0017), SAS => Normal(0.4342,4.2086), SEA => Normal(0.4339,2.6935), CHI => Normal(0.4319,5.3883), MAF => Normal(0.4341,3.0711), SSA => Normal(0.411,1.5337), SIS => Normal(0.2522,1.669)]
    seas = Gamma(6.0,0.4)
    sf6add = Normal(0.0,0.08)
    smch = [USA => Truncated(Normal(-0.1149,0.0614), -Inf, 0.0), CAN => Truncated(Normal(-0.1149,0.0614), -Inf, 0.0), WEU => Truncated(Normal(-0.1149,0.0614), -Inf, 0.0), JPK => Truncated(Normal(-0.1149,0.0614), -Inf, 0.0), ANZ => Truncated(Normal(-0.1149,0.0614), -Inf, 0.0), EEU => Truncated(Normal(-0.1149,0.0614), -Inf, 0.0), FSU => Truncated(Normal(-0.1149,0.0614), -Inf, 0.0), MDE => Truncated(Normal(-0.1149,0.0614), -Inf, 0.0), CAM => Truncated(Normal(-0.1149,0.0614), -Inf, 0.0), LAM => Truncated(Normal(-0.1149,0.0614), -Inf, 0.0), SAS => Truncated(Normal(-0.1149,0.0614), -Inf, 0.0), SEA => Truncated(Normal(-0.1149,0.0614), -Inf, 0.0), CHI => Truncated(Normal(-0.1149,0.0614), -Inf, 0.0), MAF => Truncated(Normal(-0.1149,0.0614), -Inf, 0.0), SSA => Truncated(Normal(-0.1149,0.0614), -Inf, 0.0), SIS => Truncated(Normal(-0.1149,0.0614), -Inf, 0.0)]
    smnl = Truncated(Normal(1.0,0.5), 0.0, Inf)
    spbm = Truncated(Normal(50.0,50.0), 0.0, Inf)
    taxmp = [USA => Gamma(5.8284,0.2071), CAN => Gamma(5.8284,0.2071), WEU => Gamma(5.8284,0.2071), JPK => Gamma(5.8284,0.2071), ANZ => Gamma(5.8284,0.2071), EEU => Gamma(5.8284,0.2071), FSU => Gamma(5.8284,0.2071), MDE => Gamma(5.8284,0.2071), CAM => Gamma(5.8284,0.2071), LAM => Gamma(5.8284,0.2071), SAS => Gamma(5.8284,0.2071), SEA => Gamma(5.8284,0.2071), CHI => Gamma(5.8284,0.2071), MAF => Gamma(5.8284,0.2071), SSA => Gamma(5.8284,0.2071), SIS => Gamma(5.8284,0.2071)]
    terrco2sens = Gamma(4.92255,662.834125760029)
    valinc = [USA => Truncated(Normal(30000.0,10000.0), 0.0, Inf), CAN => Truncated(Normal(30000.0,10000.0), 0.0, Inf), WEU => Truncated(Normal(30000.0,10000.0), 0.0, Inf), JPK => Truncated(Normal(30000.0,10000.0), 0.0, Inf), ANZ => Truncated(Normal(30000.0,10000.0), 0.0, Inf), EEU => Truncated(Normal(30000.0,10000.0), 0.0, Inf), FSU => Truncated(Normal(30000.0,10000.0), 0.0, Inf), MDE => Truncated(Normal(30000.0,10000.0), 0.0, Inf), CAM => Truncated(Normal(30000.0,10000.0), 0.0, Inf), LAM => Truncated(Normal(30000.0,10000.0), 0.0, Inf), SAS => Truncated(Normal(30000.0,10000.0), 0.0, Inf), SEA => Truncated(Normal(30000.0,10000.0), 0.0, Inf), CHI => Truncated(Normal(30000.0,10000.0), 0.0, Inf), MAF => Truncated(Normal(30000.0,10000.0), 0.0, Inf), SSA => Truncated(Normal(30000.0,10000.0), 0.0, Inf), SIS => Truncated(Normal(30000.0,10000.0), 0.0, Inf)]
    vbel = Truncated(Normal(-2.65,0.69), -Inf, 0.0)
    vmorbbm = Truncated(Normal(19970.090515545,29955.1357733176), 0.0, Inf)
    vmorbel = Truncated(Normal(1.0,0.2), 0.0, Inf)
    vslbm = Truncated(Normal(4.99252262888626e6,2.49626131444313e6), 0.0, Inf)
    vslel = Truncated(Normal(1.0,0.2), 0.0, Inf)
    watechrate = Truncated(Normal(0.005,0.005), 0.0, Inf)
    wlbm = [USA => Truncated(Normal(11400.0,5700.0), 0.0, Inf), WEU => Truncated(Normal(3210.0,1335.0), 0.0, Inf), JPK => Truncated(Normal(573.0,573.0), 0.0, Inf), ANZ => Truncated(Normal(256.0,256.0), 0.0, Inf), EEU => Truncated(Normal(38.0,18.0), 0.0, Inf), CAM => Truncated(Normal(14775.0,11171.0), 0.0, Inf), LAM => Truncated(Normal(27234.0,19016.0), 0.0, Inf), SAS => Truncated(Normal(14303.0,6005.0), 0.0, Inf), SEA => Truncated(Normal(50885.0,29599.0), 0.0, Inf), CHI => Truncated(Normal(5879.0,5879.0), 0.0, Inf), MAF => Truncated(Normal(2649.0,1989.0), 0.0, Inf), SSA => Truncated(Normal(27847.0,9024.0), 0.0, Inf), SIS => Truncated(Normal(1528.0,1067.0), 0.0, Inf)]
    wmbm = [USA => Truncated(Normal(789.0,8344.0), 0.0, Inf), WEU => Truncated(Normal(903.0,2188.0), 0.0, Inf), JPK => Truncated(Normal(7.0,815.0), 0.0, Inf), ANZ => Truncated(Normal(183.0,508.0), 0.0, Inf), EEU => Truncated(Normal(0.0,26.0), 0.0, Inf), CAM => Truncated(Normal(238.0,15832.0), 0.0, Inf), LAM => Truncated(Normal(4748.0,28997.0), 0.0, Inf), SAS => Truncated(Normal(0.0,8492.0), 0.0, Inf), SEA => Truncated(Normal(4.0,41860.0), 0.0, Inf), CHI => Truncated(Normal(1779.0,9654.0), 0.0, Inf), MAF => Truncated(Normal(0.0,2814.0), 0.0, Inf), SSA => Truncated(Normal(345.0,12768.0), 0.0, Inf), SIS => Truncated(Normal(169.0,1516.0), 0.0, Inf)]
    wrbm = [USA => Normal(-0.00065,0.00065), CAN => Normal(-0.00057,0.00057), WEU => Normal(-0.00027,0.00027), JPK => Normal(3.0e-6,3.0e-6), ANZ => Normal(3.0e-6,3.0e-6), EEU => Normal(-0.00697,0.00697), FSU => Normal(-0.02754,0.02754), MDE => Normal(-0.00133,0.00133), CAM => Normal(-0.0013,0.0013), LAM => Normal(-0.0014,0.0014), SAS => Normal(-0.00156,0.00156), SEA => Normal(-0.00314,0.00314), CHI => Normal(0.00569,0.00569), MAF => Normal(-0.00902,0.00902), SSA => Normal(-0.0036,0.0036), SIS => Normal(-0.0013,0.0013)]
    wrel = Truncated(Normal(0.85,0.15), 0.0, 1.0)
    wrnl = Truncated(Normal(1.0,0.5), 0.0, Inf)
    wrpl = Truncated(Normal(0.85,0.15), 0.0, Inf)
    wvbm = Truncated(Normal(0.00588,0.003927), 0.0, Inf)
    wvel = Truncated(Normal(1.16,0.46), 0.0, Inf)
    wvpdl = Truncated(Normal(0.47,0.12), 0.0, 1.0)
    wvsl = Truncated(Normal(-0.11,0.05), -1.0, 0.0)


    save(
        climatedynamics.temp,
        impactaggregation.loss
    )

end 
