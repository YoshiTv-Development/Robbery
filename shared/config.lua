YD = {}

YD.LogDiscord = {
    Webhooks = 'Token Here',
    Title = "Server Name",
    Color = 8492048
}

YD.PoliceNecessaria = 1

function NotificaPolizia()
    exports["DISPATCH"]:SendDispatch("10-11")
end

YD.JobRichiesto = 'polizia'

YD.Blips = {
    Sprite = 134,
    Scale = 0.6,
    Colour = 1,
    Name = 'Rapina'
}

YD.Gridsystem = {
    Type = 2,
    Show3D = false,
    Color =  {r = 255, g = 133, b = 60},
    Distance = 38.0,
    Control = 'E'
}

YD.Progress = {
    Bar = true,
    Circle = {
        Active = false, 
        Position = 'bottom'
    },
    Tempo = 1200, -- 120000 SONO 120 SECONDI https://convertlive.com/it/u/convertire/secondi/a/millisecondi#120
    Position = 'bottom',
    AnimDict = 'anim@heists@ornate_bank@grab_cash_heels',
    AnimClip = 'grab'
}


PosRapine = {
    vector3(28.4481, -1339.4037, 29.4970),   -- NEGOZIETTO
    vector3(-43.4526, -1748.5210, 29.4210),  -- NEGOZIETTO
    vector3(-709.4902, -904.8746, 19.2156),  -- NEGOZIETTO
    vector3(-1220.3436, -916.0961, 11.3262), -- NEGOZIETTO
    vector3(-1478.7721, -375.2801, 39.1642), -- NEGOZIETTO
    vector3(-1828.9475, 798.6950, 138.1883), -- NEGOZIETTO
    vector3(378.2587, 333.3176, 103.5664),   -- NEGOZIETTO
    vector3(1159.7025, -314.2502, 69.2050),  -- NEGOZIETTO
    vector3(1126.6704, -980.2252, 45.4158),  -- NEGOZIETTO
    vector3(-3249.9954, 1004.4520, 12.8307), -- NEGOZIETTO
    vector3(1734.8689, 6420.8799, 35.0372),  -- NEGOZIETTO
    vector3(1707.8167, 4920.2944, 42.0636),  -- NEGOZIETTO
    vector3(1959.6189, 3748.9431, 32.3437),  -- NEGOZIETTO
    vector3(1391.5275, 3608.7007, 34.9809),  -- NEGOZIETTO
    vector3(546.3010, 2662.7363, 42.1565),   -- NEGOZIETTO
    vector3(2549.3381, 385.0833, 108.6229),  -- NEGOZIETTO
    vector3(-1211.4187, -335.5245, 37.7810), -- FLEECA
    vector3(-353.3067, -54.1399, 49.0370),   -- FLECCA
    vector3(311.7229, -283.3546, 54.1651),   -- FLECCA
    vector3(147.4369, -1044.9658, 29.3680),  -- FLECCA
    vector3(-2957.8257, 481.9709, 15.6970),  -- FLECCA
    vector3(253.2054, 228.4089, 101.6832),   -- PACIFIC
    vector3(-102.5131, 6477.5347, 31.6761),  -- BLAINE
    vector3(-1054.0020, -230.8234, 44.0210), -- LIFE INVADER
    vector3(-622.6053, -229.4528, 38.0570),  -- GIOIELLERIA
    vector3(991.2441, -2154.0337, 29.4764)   -- MACELLERIA
}

YD.Soldi = {
    Item = 'black_money',
    Ricevere = math.random(20000, 40000)
}

YD.Lang = {
    PrintF8 = "^0[Yoshi Development]^0 ha startato correttamente: "..GetCurrentResourceName(),
    Gridsystem = 'Premi ~r~[E]~w~ per raccogliere',
    ProgressMsg = 'Rapinando Cassaforte',
    Allarme = 'Hai appena fatto scattare l\'allarme e sta arrivando la polizia muoviti a Rapinare!!!',
    RapinaSuccess = 'Hai appena finito di rapinare',
    WeaponError = 'Non sei armato',
    PoliceError = 'Non ci sono abbastanza poliziotti in città'
}