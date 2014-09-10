% for barrettGlassDyn.xml
%the maximum time step is commonly 2.5 milliseconds
maxdt = 0.0025;

while 1
  % advance the simulation
  h = moveDynamicBodies(maxdt);
  computeNewVelocities(h);

  % compute the control forces
  %where 6 9 12 are the indices of the fingertip bodies
  [CF,CP] = getAverageContacts([6; 9; 12]);
DF=getDOFVals(2);
  DP = getDOFVals;
  %DF = computeControlForces(DP,CF,CP);
  %This would be a user supplied function that computes the new
  %DOF forces based on the current DOF positions, the contact forces,
  %and positions.

  %setDOFForces(DF);
  %setDOFForces([0 0 0 0]',2)
	%setDOFForces((rand(4,1)-0.5)*2,2)
	%setDOFForces((rand(6,1)-0.5)*2,1)
	setDOFForces(rand(4,1),2)
	setDOFForces(rand(6,1),1)
	%setDOFForces([5 0 0 0 1 9]'.*getDOFVals(1),1)

  %the computed forces are applied to the bodies and will affect
  %the next velocity computation.
end
