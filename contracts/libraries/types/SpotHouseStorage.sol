// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.9;

import "../exchange/SpotOrderData.sol";
import "../../interfaces/ISpotFactory.sol";
import "../../WithdrawBNB.sol";

contract SpotHouseStorage {
    using SpotLimitOrder for mapping(address => mapping(address => SpotLimitOrder.Data[]));

    ISpotFactory public spotFactory;

    address public WBNB;

    mapping(address => mapping(address => SpotLimitOrder.Data[]))
        public limitOrders;
    enum Side {
        BUY,
        SELL
    }

    enum Asset {
        Quote,
        Base,
        Fee
    }

    struct PendingLimitOrder {
        bool isBuy;
        uint256 quantity;
        uint256 partialFilled;
        uint128 pip;
        uint256 blockNumber;
        uint256 orderIdOfTrader;
        uint64 orderId;
        uint16 fee;
    }

    struct OpenLimitResp {
        uint64 orderId;
        uint256 sizeOut;
    }

    IWithdrawBNB public withdrawBNB;

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[49] private __gap;

    address public operator;
}
