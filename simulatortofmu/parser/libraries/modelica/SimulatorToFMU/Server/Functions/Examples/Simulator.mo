within SimulatorToFMU.Server.Functions.Examples;
model Simulator "Test model for simulator functions"
  extends Modelica.Icons.Example;
  // Parameters names can be empty.
  // Inputs and outputs cannot be empty.
  parameter String emptyDblParNam[0](each start="")
    "Empty list of parameters names";
  parameter Real emptyDblParVal[0]=zeros(0) "Empty vector of parameters values";
  parameter String startServer=
    Modelica.Utilities.Files.loadResource("C:\\Users\\Public\\start_server.bat")
    "Path to the main Python script";
  parameter String runServer=
    Modelica.Utilities.Files.loadResource("C:\\Users\\Public\\run_server.py")
    "Path to the start server script";
  parameter String _configurationFileName=
    Modelica.Utilities.Files.loadResource("C:\\Users\\Public\\server_config.txt")
    "Path to the configuration file";
  SimulatorToFMU.Server.Functions.BaseClasses.ServerObject obj=
  SimulatorToFMU.Server.Functions.BaseClasses.ServerObject(patResScri=startServer,
    nStrPar=1,
    nDblPar=1,
    strParNam={"_configurationFileName"},
    strParVal={_configurationFileName},
    dblParNam={"test"},
    dblParVal={0.0});
  Real yR1[1] "Real function value";
algorithm
  yR1 := SimulatorToFMU.Server.Functions.simulator(
    modTim=time,
    nDblInp=1,
    dblInpNam={"u"},
    dblInpVal={15.0},
    nDblOut=1,
    dblOutNam={"y"},
    resWri=false,
    obj=obj);
  annotation (
    experiment(StopTime=1.0),
    __Dymola_Commands(file="modelica://SimulatorToFMU.Resources/Scripts/Dymola/Python27/Functions/Examples/SimulatorWithpassMemoryObject.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>
This example calls a function in the Python module <code>testSimulator.py</code>.
It tests whether arguments and return values are passed correctly.
The functions in  <code>testSimulator.py</code> are very simple in order to test
whether they compute correctly, and whether the data conversion between Modelica and
Python is implemented correctly.
Each call to Python is followed by an <code>assert</code> statement which terminates
the simulation if the return value is different from the expected value.
</p>
</html>", revisions="<html>
<ul>
<li>
February 05, 2018, by Thierry S. Nouidui:<br/>
First implementation.
</li>
</ul>
</html>"));
end Simulator;
