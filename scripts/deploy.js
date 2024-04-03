async function main() {
    const initialSupply = 1000000;
    const initialOwner = "0x1234567890123456789012345678901234567890";
  const Solar = await hre.ethers.getContractFactory("SolarGreen");
  const solar = await Solar.deploy(initialSupply, initialOwner);

  await solar.deployed();
  console.log("SolarGreen deployed to:", solar.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
