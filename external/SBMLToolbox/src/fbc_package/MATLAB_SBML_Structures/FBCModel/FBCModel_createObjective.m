function FBCModel = FBCModel_createObjective(FBCModel)
% SBMLFBCModel = FBCModel_createObjective(SBMLFBCModel)
%
% Takes
%
% 1. FBCModel, an SBML FBCModel structure
%
% Returns
%
% 1. the SBML FBCModel structure with a new SBML Objective structure added
%

%<!---------------------------------------------------------------------------
% This file is part of SBMLToolbox.  Please visit http://sbml.org for more
% information about SBML, and the latest version of SBMLToolbox.
%
% Copyright (C) 2009-2016 jointly by the following organizations: 
%     1. California Institute of Technology, Pasadena, CA, USA
%     2. EMBL European Bioinformatics Institute (EBML-EBI), Hinxton, UK
%
% Copyright (C) 2006-2008 jointly by the following organizations: 
%     1. California Institute of Technology, Pasadena, CA, USA
%     2. University of Hertfordshire, Hatfield, UK
%
% Copyright (C) 2003-2005 jointly by the following organizations: 
%     1. California Institute of Technology, Pasadena, CA, USA 
%     2. Japan Science and Technology Agency, Japan
%     3. University of Hertfordshire, Hatfield, UK
%
% SBMLToolbox is free software; you can redistribute it and/or modify it
% under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation.  A copy of the license agreement is provided
% in the file named "LICENSE.txt" included with this software distribution.
%----------------------------------------------------------------------- -->


%get level and version and check the input arguments are appropriate

[level, version, pkgVersion] = GetFBCLevelVersion(FBCModel);

if isfield(FBCModel, 'fbc_objective')
  SBMLObjective = Objective_create(level, version, FBCModel.fbc_version);
	index = length(FBCModel.fbc_objective);
	if index == 0
		FBCModel.fbc_objective = SBMLObjective;
	else
		FBCModel.fbc_objective(index+1) = SBMLObjective;
	end;
else
	error('Objective not an element on SBML L%dV%d FBC V%d Model', level, version, pkgVersion);
end;

