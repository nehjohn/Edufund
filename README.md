EduFund Smart Contract

A Decentralized Education Funding Protocol on the Stacks Blockchain

---

Overview
**EduFund** is a Clarity smart contract designed to enable **trustless and transparent educational funding** using STX tokens on the **Stacks blockchain** (secured by Bitcoin).  
It allows donors, sponsors, and organizations to **create education campaigns**, contribute STX, and help students or institutions reach their funding goals — all without intermediaries.

---

Key Features
- **Create Campaigns:** Start education-focused funding campaigns with clear goals.  
- **Transparent Donations:** Allow contributors to fund students or institutions directly.  
- **Trustless Withdrawals:** Recipients can only withdraw when goals or milestones are met.  
- **Immutable Records:** Every transaction is stored permanently on-chain for full transparency.  
- **Social Impact:** Promotes blockchain-powered educational empowerment and inclusion.

---

Smart Contract Details
- **Contract Name:** `edufund.clar`  
- **Language:** [Clarity](https://docs.stacks.co/docs/write-smart-contracts/clarity-overview)  
- **Framework:** [Clarinet](https://docs.hiro.so/clarinet)  
- **Blockchain:** [Stacks](https://stacks.co) (secured by Bitcoin)  

---

Core Functions

| Function | Description |
|-----------|-------------|
| `create-campaign (goal uint)` | Creates a new educational funding campaign with a specified goal. |
| `contribute (campaign-id uint) (amount uint)` | Allows anyone to contribute STX tokens to a campaign. |
| `withdraw (campaign-id uint)` | Enables campaign owners to withdraw funds once the goal is achieved. |
| `get-campaign (id uint)` | Returns details of a specific campaign, including goal, amount raised, and contributors. |

---

How It Works
1. A **student** or **institution** deploys or registers a funding campaign.  
2. **Donors** contribute STX to the campaign through the smart contract.  
3. Once the **funding goal** is reached or time condition met, the **recipient** can safely withdraw funds.  
4. All actions are recorded on-chain — ensuring transparency, accountability, and immutability.

---

Testing
To test with Clarinet:
```bash
clarinet check
clarinet test
