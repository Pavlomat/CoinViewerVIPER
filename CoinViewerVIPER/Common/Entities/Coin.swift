//
//  Coin.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import Foundation


// MARK: - MainStruct
struct MainStruct: Codable {
    let status: Status?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: String?
    let serialID: Int?
    let symbol, name, slug: String?
    let contractAddresses: JSONNull?
    let internalTempAgoraID: String?
    let marketData: MarketData?
    let marketcap: Marketcap?
    let supply: Supply?
    let blockchainStats24_Hours: [String: Double?]?
    let marketDataLiquidity: MarketDataLiquidity?
    let allTimeHigh: AllTimeHigh?
    let cycleLow: CycleLow?
    let tokenSaleStats: TokenSaleStats?
    let miningStats: MiningStats?
    let developerActivity: DeveloperActivity?
    let roiData, roiByYear: [String: Double]?
    let riskMetrics: RiskMetrics?
    let miscData: MiscData?
    let reddit: Reddit?
    let onChainData: [String: Double?]?
    let exchangeFlows: [String: Double]?
    let minerFlows: MinerFlows?
    let supplyActivity: [String: Double]?
    let supplyDistribution: [String: Double?]?
    let alertMessages: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id
        case serialID = "serial_id"
        case symbol, name, slug
        case contractAddresses = "contract_addresses"
        case internalTempAgoraID = "_internal_temp_agora_id"
        case marketData = "market_data"
        case marketcap, supply
        case blockchainStats24_Hours = "blockchain_stats_24_hours"
        case marketDataLiquidity = "market_data_liquidity"
        case allTimeHigh = "all_time_high"
        case cycleLow = "cycle_low"
        case tokenSaleStats = "token_sale_stats"
        case miningStats = "mining_stats"
        case developerActivity = "developer_activity"
        case roiData = "roi_data"
        case roiByYear = "roi_by_year"
        case riskMetrics = "risk_metrics"
        case miscData = "misc_data"
        case reddit
        case onChainData = "on_chain_data"
        case exchangeFlows = "exchange_flows"
        case minerFlows = "miner_flows"
        case supplyActivity = "supply_activity"
        case supplyDistribution = "supply_distribution"
        case alertMessages = "alert_messages"
    }
}

// MARK: - AllTimeHigh
struct AllTimeHigh: Codable {
    let price: Double?
    let at: Date?
    let daysSince: Int?
    let percentDown, breakevenMultiple: Double?

    enum CodingKeys: String, CodingKey {
        case price, at
        case daysSince = "days_since"
        case percentDown = "percent_down"
        case breakevenMultiple = "breakeven_multiple"
    }
}

// MARK: - CycleLow
struct CycleLow: Codable {
    let price: Double?
    let at: Date?
    let percentUp: Double?
    let daysSince: Int?

    enum CodingKeys: String, CodingKey {
        case price, at
        case percentUp = "percent_up"
        case daysSince = "days_since"
    }
}

// MARK: - DeveloperActivity
struct DeveloperActivity: Codable {
    let stars, watchers: Int?
    let commitsLast3_Months, commitsLast1_Year, linesAddedLast3_Months, linesAddedLast1_Year: JSONNull?
    let linesDeletedLast3_Months, linesDeletedLast1_Year: JSONNull?

    enum CodingKeys: String, CodingKey {
        case stars, watchers
        case commitsLast3_Months = "commits_last_3_months"
        case commitsLast1_Year = "commits_last_1_year"
        case linesAddedLast3_Months = "lines_added_last_3_months"
        case linesAddedLast1_Year = "lines_added_last_1_year"
        case linesDeletedLast3_Months = "lines_deleted_last_3_months"
        case linesDeletedLast1_Year = "lines_deleted_last_1_year"
    }
}

// MARK: - MarketData
struct MarketData: Codable {
    let priceUsd: Double?
    let priceBtc: Int?
    let priceEth, volumeLast24_Hours, realVolumeLast24_Hours, volumeLast24_HoursOverstatementMultiple: Double?
    let percentChangeUsdLast1_Hour: Double?
    let percentChangeBtcLast1_Hour: Int?
    let percentChangeEthLast1_Hour, percentChangeUsdLast24_Hours, percentChangeBtcLast24_Hours, percentChangeEthLast24_Hours: Double?
    let ohlcvLast1_Hour, ohlcvLast24_Hour: OhlcvLastHour?
    let lastTradeAt: Date?

    enum CodingKeys: String, CodingKey {
        case priceUsd = "price_usd"
        case priceBtc = "price_btc"
        case priceEth = "price_eth"
        case volumeLast24_Hours = "volume_last_24_hours"
        case realVolumeLast24_Hours = "real_volume_last_24_hours"
        case volumeLast24_HoursOverstatementMultiple = "volume_last_24_hours_overstatement_multiple"
        case percentChangeUsdLast1_Hour = "percent_change_usd_last_1_hour"
        case percentChangeBtcLast1_Hour = "percent_change_btc_last_1_hour"
        case percentChangeEthLast1_Hour = "percent_change_eth_last_1_hour"
        case percentChangeUsdLast24_Hours = "percent_change_usd_last_24_hours"
        case percentChangeBtcLast24_Hours = "percent_change_btc_last_24_hours"
        case percentChangeEthLast24_Hours = "percent_change_eth_last_24_hours"
        case ohlcvLast1_Hour = "ohlcv_last_1_hour"
        case ohlcvLast24_Hour = "ohlcv_last_24_hour"
        case lastTradeAt = "last_trade_at"
    }
}

// MARK: - OhlcvLastHour
struct OhlcvLastHour: Codable {
    let ohlcvLastHourOpen, high, low, close: Double?
    let volume: Double?

    enum CodingKeys: String, CodingKey {
        case ohlcvLastHourOpen = "open"
        case high, low, close, volume
    }
}

// MARK: - MarketDataLiquidity
struct MarketDataLiquidity: Codable {
    let clearingPricesToSell, marketcap, assetBidDepth, usdBidDepth: JSONNull?
    let updatedAt: Date?

    enum CodingKeys: String, CodingKey {
        case clearingPricesToSell = "clearing_prices_to_sell"
        case marketcap
        case assetBidDepth = "asset_bid_depth"
        case usdBidDepth = "usd_bid_depth"
        case updatedAt = "updated_at"
    }
}

// MARK: - Marketcap
struct Marketcap: Codable {
    let rank: Int?
    let marketcapDominancePercent, currentMarketcapUsd, y2050_MarketcapUsd, yPlus10MarketcapUsd: Double?
    let liquidMarketcapUsd, volumeTurnoverLast24_HoursPercent, realizedMarketcapUsd, outstandingMarketcapUsd: Double?

    enum CodingKeys: String, CodingKey {
        case rank
        case marketcapDominancePercent = "marketcap_dominance_percent"
        case currentMarketcapUsd = "current_marketcap_usd"
        case y2050_MarketcapUsd = "y_2050_marketcap_usd"
        case yPlus10MarketcapUsd = "y_plus10_marketcap_usd"
        case liquidMarketcapUsd = "liquid_marketcap_usd"
        case volumeTurnoverLast24_HoursPercent = "volume_turnover_last_24_hours_percent"
        case realizedMarketcapUsd = "realized_marketcap_usd"
        case outstandingMarketcapUsd = "outstanding_marketcap_usd"
    }
}

// MARK: - MinerFlows
struct MinerFlows: Codable {
    let supply1HopMinersUsd, supply1HopMinersNativeUnits, supplyMinersUsd, supplyMinersNativeUnits: Double?

    enum CodingKeys: String, CodingKey {
        case supply1HopMinersUsd = "supply_1hop_miners_usd"
        case supply1HopMinersNativeUnits = "supply_1hop_miners_native_units"
        case supplyMinersUsd = "supply_miners_usd"
        case supplyMinersNativeUnits = "supply_miners_native_units"
    }
}

// MARK: - MiningStats
struct MiningStats: Codable {
    let miningAlgo, networkHashRate: String?
    let availableOnNicehashPercent: Double?
    let the1_HourAttackCost, the24_HoursAttackCost, attackAppeal: JSONNull?
    let hashRate, hashRate30DAverage, miningRevenuePerHashUsd, miningRevenuePerHashNativeUnits: Double?
    let miningRevenuePerHashPerSecondUsd, miningRevenuePerHashPerSecondNativeUnits, miningRevenueFromFeesPercentLast24_Hours, miningRevenueNative: Double?
    let miningRevenueUsd, miningRevenueTotal, averageDifficulty: Double?

    enum CodingKeys: String, CodingKey {
        case miningAlgo = "mining_algo"
        case networkHashRate = "network_hash_rate"
        case availableOnNicehashPercent = "available_on_nicehash_percent"
        case the1_HourAttackCost = "1_hour_attack_cost"
        case the24_HoursAttackCost = "24_hours_attack_cost"
        case attackAppeal = "attack_appeal"
        case hashRate = "hash_rate"
        case hashRate30DAverage = "hash_rate_30d_average"
        case miningRevenuePerHashUsd = "mining_revenue_per_hash_usd"
        case miningRevenuePerHashNativeUnits = "mining_revenue_per_hash_native_units"
        case miningRevenuePerHashPerSecondUsd = "mining_revenue_per_hash_per_second_usd"
        case miningRevenuePerHashPerSecondNativeUnits = "mining_revenue_per_hash_per_second_native_units"
        case miningRevenueFromFeesPercentLast24_Hours = "mining_revenue_from_fees_percent_last_24_hours"
        case miningRevenueNative = "mining_revenue_native"
        case miningRevenueUsd = "mining_revenue_usd"
        case miningRevenueTotal = "mining_revenue_total"
        case averageDifficulty = "average_difficulty"
    }
}

// MARK: - MiscData
struct MiscData: Codable {
    let privateMarketPriceUsd, vladimirClubCost, btcCurrentNormalizedSupplyPriceUsd, btcY2050NormalizedSupplyPriceUsd: JSONNull?
    let assetCreatedAt, assetAgeDays: JSONNull?
    let categories, sectors: [String]?
    let tags: JSONNull?

    enum CodingKeys: String, CodingKey {
        case privateMarketPriceUsd = "private_market_price_usd"
        case vladimirClubCost = "vladimir_club_cost"
        case btcCurrentNormalizedSupplyPriceUsd = "btc_current_normalized_supply_price_usd"
        case btcY2050NormalizedSupplyPriceUsd = "btc_y2050_normalized_supply_price_usd"
        case assetCreatedAt = "asset_created_at"
        case assetAgeDays = "asset_age_days"
        case categories, sectors, tags
    }
}

// MARK: - Reddit
struct Reddit: Codable {
    let activeUserCount, subscribers: Int?

    enum CodingKeys: String, CodingKey {
        case activeUserCount = "active_user_count"
        case subscribers
    }
}

// MARK: - RiskMetrics
struct RiskMetrics: Codable {
    let sharpeRatios: SharpeRatios?
    let volatilityStats: VolatilityStats?

    enum CodingKeys: String, CodingKey {
        case sharpeRatios = "sharpe_ratios"
        case volatilityStats = "volatility_stats"
    }
}

// MARK: - SharpeRatios
struct SharpeRatios: Codable {
    let last30_Days, last90_Days, last1_Year, last3_Years: Double?

    enum CodingKeys: String, CodingKey {
        case last30_Days = "last_30_days"
        case last90_Days = "last_90_days"
        case last1_Year = "last_1_year"
        case last3_Years = "last_3_years"
    }
}

// MARK: - VolatilityStats
struct VolatilityStats: Codable {
    let volatilityLast30_Days, volatilityLast90_Days, volatilityLast1_Year, volatilityLast3_Years: Double?

    enum CodingKeys: String, CodingKey {
        case volatilityLast30_Days = "volatility_last_30_days"
        case volatilityLast90_Days = "volatility_last_90_days"
        case volatilityLast1_Year = "volatility_last_1_year"
        case volatilityLast3_Years = "volatility_last_3_years"
    }
}

// MARK: - Supply
struct Supply: Codable {
    let y2050, yPlus10, liquid: Double?
    let circulating: Int?
    let y2050_IssuedPercent, annualInflationPercent, stockToFlow, yPlus10IssuedPercent: Double?
    let supplyRevived90D: Double?

    enum CodingKeys: String, CodingKey {
        case y2050 = "y_2050"
        case yPlus10 = "y_plus10"
        case liquid, circulating
        case y2050_IssuedPercent = "y_2050_issued_percent"
        case annualInflationPercent = "annual_inflation_percent"
        case stockToFlow = "stock_to_flow"
        case yPlus10IssuedPercent = "y_plus10_issued_percent"
        case supplyRevived90D = "supply_revived_90d"
    }
}

// MARK: - TokenSaleStats
struct TokenSaleStats: Codable {
    let saleProceedsUsd, saleStartDate, saleEndDate, roiSinceSaleUsdPercent: JSONNull?
    let roiSinceSaleBtcPercent, roiSinceSaleEthPercent: JSONNull?

    enum CodingKeys: String, CodingKey {
        case saleProceedsUsd = "sale_proceeds_usd"
        case saleStartDate = "sale_start_date"
        case saleEndDate = "sale_end_date"
        case roiSinceSaleUsdPercent = "roi_since_sale_usd_percent"
        case roiSinceSaleBtcPercent = "roi_since_sale_btc_percent"
        case roiSinceSaleEthPercent = "roi_since_sale_eth_percent"
    }
}

// MARK: - Status
struct Status: Codable {
    let elapsed: Int?
    let timestamp: String?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
