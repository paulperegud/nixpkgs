{ stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  pname = "hyperledger-fabric";
  version = "2.1.0";

  goPackagePath = "github.com/hyperledger/fabric";

  # taken from https://github.com/hyperledger/fabric/blob/v2.1.0/Makefile#L82
  subPackages = [
    "cmd/configtxgen"
    "cmd/configtxlator"
    "cmd/cryptogen"
    "cmd/idemixgen"
    "cmd/discover"
    "cmd/peer"
    "cmd/orderer"
  ];

  src = fetchFromGitHub {
    owner = "hyperledger";
    repo = "fabric";
    rev = "v${version}";
    sha256 = "05xrcrrhwviglxdmqvrig3qs5z82nrm0rr4ib7jnddl50skwij81";
  };

  # turning off tests because they do fail on both 2.2.0 and 2.1.0
  doCheck = false;

  meta = with stdenv.lib; {
    description = "An implementation of blockchain technology, leveraging familiar and proven technologies";
    homepage = "https://wiki.hyperledger.org/projects/Fabric";
    license = licenses.asl20;
    maintainers = [ maintainers.marsam ];
  };
}
