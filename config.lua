Config = {}

-- لیست شناسه‌ها (identifiers) که به کیت VIP دسترسی دارند
Config.VipIdentifiers = {
    "steam:1234567890abcdef",   -- مثال شناسه استیم
    "license:abcdef1234567890"  -- مثال شناسه لایسنس
}

-- کیت‌ها
Config.Kits = {
    ["starter"] = {
        items = {
            {name = "phone", count = 1},   -- موبایل
            {name = "money", count = 500000},   -- پول تازه کار
            {name = "bread", count = 5},   -- نان
            {name = "water", count = 5}    -- آب
        },
        -- در اینجا کول‌دان وجود ندارد
    },
    ["vip"] = {
        items = {
            {name = "phone", count = 1},   -- موبایل
            {name = "money", count = 500000},   -- پول تازه کار
            {name = "bread", count = 10},   -- نان
            {name = "water", count = 10},   -- آب
            {name = "gold_bar", count = 1},   -- سکه طلا
            {name = "diamond", count = 3}     -- الماس
        },
        requiredIdentifiers = Config.VipIdentifiers, -- فقط برای بازیکنانی که شناسه خاص دارند
    }
}
