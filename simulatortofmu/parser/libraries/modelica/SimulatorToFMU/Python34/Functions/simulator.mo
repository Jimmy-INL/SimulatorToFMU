within SimulatorToFMU.Python34.Functions;
function simulator "Function that communicates with the SimulatorToFMU Python API"
  extends Modelica.Icons.Function;
  input String moduleName
  "Name of the python module that contains the function";
  input String functionName=moduleName "Name of the python function";
  input BaseClasses.PythonObject obj "Memory that holds the Python object";
  input Boolean passMemoryObject
    "Set to true if the Python function returns and receives an object, see User's Guide";
  input String  conFilNam "Name of the python function";
  input Real    modTim "Model time";
  input Real    dblParVal[nDblPar] "Parameter variables values to send to SimulatorToFMU";
  input Real    dblInpVal[max(1, nDblInp)] "Input variables values to be sent to SimulatorToFMU";
  input String  dblParNam[nDblPar] "Parameter variables names to send to SimulatorToFMU";
  input String  dblOutNam[max(1, nDblOut)] "Output variables names to be read from SimulatorToFMU";
  input String  dblInpNam[max(1, nDblInp)] "Input variables names to be sent to SimulatorToFMU";
  input Integer nDblInp(min=0) "Number of double inputs to send to SimulatorToFMU";
  input Integer nDblOut(min=0) "Number of double outputs to read from SimulatorToFMU";
  input Integer nDblPar(min=0) "Number of double parameters to send to SimulatorToFMU";
  input Boolean resWri  "Flag for enabling results writing. 1: write results, 0: else";
  output Real   dblOutVal[max(1, nDblOut)] "Double output values read from SimulatorToFMU";
algorithm
  // Call the.simulator function
dblOutVal := BaseClasses.simulator(
      moduleName=moduleName,
      functionName=functionName,
      conFilNam=conFilNam,
      modTim=modTim,
      nDblInp=nDblInp,
      dblInpNam=dblInpNam,
      dblInpVal=dblInpVal,
      nDblOut=nDblOut,
      dblOutNam=dblOutNam,
      nDblPar=nDblPar,
      dblParNam=dblParNam,
      dblParVal=dblParVal,
      resWri=resWri,
      obj=obj,
      passMemoryObject=passMemoryObject);
annotation (Documentation(info="<html>
<p>
This function is a wrapper for 
<a href=\"modelica://SimulatorToFMU.Python34.Functions.BaseClasses.simulator\">
SimulatorToFMU.Python34.Functions.BaseClasses.simulator</a>.
It adds the directory <code>modelica://SimulatorToFMU/Resources/Python-Sources</code>
to the environment variable <code>PYTHONPATH</code>
prior to calling the function that.simulators data with Python.
After the function call, the <code>PYTHONPATH</code> is set back to what
it used to be when entering this function.
See 
<a href=\"modelica://SimulatorToFMU.Python34.UsersGuide\">
SimulatorToFMU.Python34.UsersGuide</a>
for instructions, and 
<a href=\"modelica://SimulatorToFMU.Python34.Functions.Examples\">
SimulatorToFMU.Python34.Functions.Examples</a>
for examples.
</p>
</html>",
        revisions="<html>
<ul>
<li>
October 17, 2016, by Thierry S. Nouidui:<br/>
First implementation.
</li>
</ul>
</html>"));
end simulator;
