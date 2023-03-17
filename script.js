window.ethereum.enable();
var provider = new ethers.providers.Web3Provider(
  web3.currentProvider,
  "ropsten"
);
//change this address to that of calculator contract
var supplychainAddress = "0x3810413146982366F21D7130479c85E9598a45bd";
let supplychainABI = [
  {
    constant: false,
    inputs: [
      {
        internalType: "string",
        name: "vegetable",
        type: "string",
      },
      {
        internalType: "int256",
        name: "_good",
        type: "int256",
      },
      {
        internalType: "int256",
        name: "_bad",
        type: "int256",
      },
      {
        internalType: "int256",
        name: "_price",
        type: "int256",
      },
    ],
    name: "calculateProfit",
    outputs: [],
    payable: false,
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    constant: true,
    inputs: [],
    name: "netAllVeggie",
    outputs: [
      {
        internalType: "int256",
        name: "",
        type: "int256",
      },
    ],
    payable: false,
    stateMutability: "view",
    type: "function",
  },
  {
    constant: true,
    inputs: [],
    name: "netVeggie",
    outputs: [
      {
        internalType: "int256",
        name: "",
        type: "int256",
      },
    ],
    payable: false,
    stateMutability: "view",
    type: "function",
  },
  {
    constant: true,
    inputs: [],
    name: "pnlAllVeggie",
    outputs: [
      {
        internalType: "int256",
        name: "",
        type: "int256",
      },
    ],
    payable: false,
    stateMutability: "view",
    type: "function",
  },
  {
    constant: true,
    inputs: [],
    name: "pnlVeggie",
    outputs: [
      {
        internalType: "int256",
        name: "",
        type: "int256",
      },
    ],
    payable: false,
    stateMutability: "view",
    type: "function",
  },
  {
    constant: true,
    inputs: [],
    name: "totalVeggies",
    outputs: [
      {
        internalType: "int256",
        name: "",
        type: "int256",
      },
    ],
    payable: false,
    stateMutability: "view",
    type: "function",
  },
];

provider.listAccounts().then(function (accounts) {
  signer = provider.getSigner(accounts[0]);
  supplychainContract = new ethers.Contract(
    supplychainAddress,
    supplychainABI,
    signer
  );
});

async function onSubmit() {
  document.getElementById("modalbody").innerHTML = `Loading...`;
  vegetable = $("#vegetable").val();
  goodQty = $("#goodQty").val();
  badQty = $("#badQty").val();
  pricePerUnit = $("#pricePerUnit").val();
  getResultPromise = supplychainContract.calculateProfit(
    vegetable,
    goodQty,
    badQty,
    pricePerUnit
  );
  var result = await getResultPromise;
}

async function onViewResult() {
  getResultPromise = supplychainContract.pnlAllVeggie();
  var result = await getResultPromise;
  getNetPrice = supplychainContract.netAllVeggie();
  var netPrice = await getResultPromise;
  getVegetableQty = supplychainContract.totalVeggies();
  VegetableQty = await getVegetableQty;
  if (result >= 0) {
    document.getElementById(
      "modalbody"
    ).innerHTML = `Vendor is in Profit<br> Profit Amount: ${result}<br> Total vegetable purchased: ${VegetableQty}<br> Net Buying Price: ${netPrice}`;
  } else {
    document.getElementById(
      "modalbody"
    ).innerHTML = `Vendor is in Loss<br> Loss Amount: ${result}<br> Total vegetable purchased: ${VegetableQty}<br> Net Buying Price: ${netPrice}`;
  }
}
