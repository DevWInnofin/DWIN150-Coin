// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    struct Sender {
        string sender;
        string senderAddress;
        string taxNumber;
    }

    struct Clearing {
        uint256 amount;
        string currency;
        string bank;
        string accountNumber;
        string sortcode;
        string debitClearingNumber;
        string iban;
    }

    struct Reciever {
        string receiver;
        string receiverAddress;
    }

    Reciever private receiver;
    Clearing private clearing;
    Sender private sender;

    constructor(
        string memory name_,
        string memory symbol_,
        uint256 reserveBalance
    ) ERC20(name_, symbol_) {
        receiver = Reciever({
            receiver: "DWIN INTERTRADE COMPANY LIMITED",
            receiverAddress: "2/55 THONGLOR ALLEY, CHOMPHON SUBDISTRICT, CHATUCHAK DISTRICT, BANGKOK, THAILAND"
        });
        sender = Sender({
            sender: "State Digital Bank",
            senderAddress: "Sofioter St. 23,99091 Erfurt Germany Staatsbank ISO-4217-01 / 03 ID.278 Berlin DE 101. 3-12-13 Komazawa Setagaya-Ku Tokyo 154-0012 Japan",
            taxNumber: "3-0104-01-076395"
        });
        clearing = Clearing({
            amount: 150000000,
            currency: "USD",
            bank: "HSBC Bank Plc.",
            accountNumber: "39048574",
            sortcode: "400515",
            debitClearingNumber: "Ref.HS90B18122023/13249660 (KMM39289793V83739L0KM)",
            iban: "GB28MIDL40051539 048574"
        });
        _mint(msg.sender, reserveBalance);
    }

    function getReceiver() external view returns (Reciever memory) {
        return receiver;
    }

    function getClearing() external view returns (Clearing memory) {
        return clearing;
    }

    function getSender() external view returns (Sender memory) {
        return sender;
    }
}
