{ stdenv, buildPythonPackage, fetchPypi, solc, py-solc }:

buildPythonPackage rec {
  pname = "py-solc-simple";
  version = "0.0.12";

  src = fetchPypi {
      inherit pname version;
      sha256 = "1k80psg5nxrzwhgln0p5s0wdq9g38kns3gsd3cm7d5pc8lggrr9l";
  };

  propagatedBuildInputs = [ solc py-solc ];

  doCheck = true;

  meta = with stdenv.lib; {
    description = "A thin simplified wrapper around py-solc.";
    license = licenses.mit;
    maintainers = [ maintainers.paulperegud ];
  };
}
