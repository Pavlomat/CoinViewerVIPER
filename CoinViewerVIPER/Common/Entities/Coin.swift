//
//  Coin.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import Foundation

// MARK: - MainStruct
struct Coin: Codable {
    let data: CoinData?
}

// MARK: - CoinData
struct CoinData: Codable {
    
    let id: String?
    let serialID: Int?
    let symbol, name, slug: String?
    let marketData: MarketData?

    enum CodingKeys: String, CodingKey {
        case id
        case serialID = "serial_id"
        case symbol, name, slug
        case marketData = "market_data"
    }
}

// MARK: - MarketData
struct MarketData: Codable {
    
    let priceUsd, priceBtc: Double?
    let priceEth: Double?
    let percentChangeUsdLast1_Hour: Double?
    let ohlcvLast1_Hour, ohlcvLast24_Hour: OhlcvLastHour?
    let lastTradeAt: Date?

    enum CodingKeys: String, CodingKey {
        case priceUsd = "price_usd"
        case priceBtc = "price_btc"
        case priceEth = "price_eth"
        case percentChangeUsdLast1_Hour = "percent_change_usd_last_1_hour"
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
