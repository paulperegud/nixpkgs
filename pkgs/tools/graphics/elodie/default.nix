{ lib, python3Packages, fetchFromGitHub }:

python3Packages.buildPythonApplication rec {
  pname = "elodie";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "jmathai";
    repo = "elodie";
    rev = "75e65901a94e14e6fd1ff7ad7a6e0f1c42edccc4";
    sha256 = "1ji3sir2s1d0jmgyy55p4b2ajg3bq9adwm6fawrdmfbig1hdnk15";
  };

  propagatedBuildInputs = with python3Packages; [ click requests send2trash future configparser tabulate pillow ];

  checkInputs = with python3Packages; [ flake8 mock nose ]

  checkPhase = ''
    patchShebangs elodie/tests/run_tests.sh
    ./elodie/tests/run_tests.sh
  '';

  meta = with lib; {
    description = "EXIF-based photo, video and audio assistant";
    longDescription = ''
      Elodie will help you organize your media files mapping EXIF data to
      directory structure.
    '';
    homepage = https://github.com/jmathai/elodie;
    license = licenses.apsl20;
    maintainers = with maintainers; [ paulperegud ];
  };
}
