if GetLocale() == "ruRU" then
    REACHED_LEVEL_STR = "Вы достигли"
    NEW_LEVEL_NUM_STR = "%d-го уровня"
elseif GetLocale() == "frFR" then
    REACHED_LEVEL_STR = "Vous avez atteint"
    NEW_LEVEL_NUM_STR = "Niveau %d"
elseif GetLocale() == "deDE" then
    REACHED_LEVEL_STR = "Du hast erreicht"
    NEW_LEVEL_NUM_STR = "Stufe %d"
elseif GetLocale() == "esES" then
    REACHED_LEVEL_STR = "Has alcanzado"
    NEW_LEVEL_NUM_STR = "Nivel %d"
elseif GetLocale() == "esMX" then
    REACHED_LEVEL_STR = "Has alcanzado"
    NEW_LEVEL_NUM_STR = "Nivel %d"
elseif GetLocale() == "koKR" then
    REACHED_LEVEL_STR = "당신은 도달했습니다"
    NEW_LEVEL_NUM_STR = "레벨 %d"
elseif GetLocale() == "enCN" then
    REACHED_LEVEL_STR = "你已经达到"
    NEW_LEVEL_NUM_STR = "级别 %d"
elseif GetLocale() == "zhCN" then
    REACHED_LEVEL_STR = "你已经达到"
    NEW_LEVEL_NUM_STR = "级别 %d"
elseif GetLocale() == "zhTW" then
    REACHED_LEVEL_STR = "你已經達到"
    NEW_LEVEL_NUM_STR = "級別 %d"
else
    REACHED_LEVEL_STR = "You've Reached"
    NEW_LEVEL_NUM_STR = "Level %d"
end