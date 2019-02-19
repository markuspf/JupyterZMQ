#
# JupyterKernel: Jupyter kernel using ZeroMQ
#
# This file runs package tests. It is also referenced in the package
# metadata in PackageInfo.g.
#
LoadPackage( "JupyterKernel" );

testresult := TestDirectory(
                DirectoriesPackageLibrary("JupyterKernel", "tst"),
                rec(exitGAP := false, suppressStatusMessage := true,
                    testOptions := rec(compareFunction := "uptowhitespace") ) );

if testresult then
  Print("#I  No errors detected while testing\n");
  QUIT_GAP(0);
else
  Print("#I  Errors detected while testing\n");
  QUIT_GAP(1);
fi;

# Should never get here
FORCE_QUIT_GAP(1);
