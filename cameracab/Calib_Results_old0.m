% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 751.732447121184691 ; 750.724730517234661 ];

%-- Principal point:
cc = [ 331.820861854779992 ; 255.434324656335292 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.236313424567194 ; -0.425506816096245 ; 0.003858446916388 ; 0.003522123267876 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 5.938727222386168 ; 6.074550257348802 ];

%-- Principal point uncertainty:
cc_error = [ 2.736719431539416 ; 3.151245114650416 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.017616435284063 ; 0.100274616760125 ; 0.002027973592740 ; 0.001810132526992 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 20;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.244196e+00 ; 2.067911e+00 ; -1.785343e-01 ];
Tc_1  = [ -7.707981e+01 ; -6.258303e+01 ; 2.540169e+02 ];
omc_error_1 = [ 3.506539e-03 ; 3.776359e-03 ; 7.642869e-03 ];
Tc_error_1  = [ 9.295643e-01 ; 1.067362e+00 ; 2.052301e+00 ];

%-- Image #2:
omc_2 = [ 2.111339e+00 ; 2.182059e+00 ; -1.361579e-01 ];
Tc_2  = [ -5.917955e+01 ; -7.767485e+01 ; 2.503535e+02 ];
omc_error_2 = [ 3.311254e-03 ; 3.823096e-03 ; 7.429867e-03 ];
Tc_error_2  = [ 9.211942e-01 ; 1.045964e+00 ; 2.029784e+00 ];

%-- Image #3:
omc_3 = [ 2.292590e+00 ; 1.989385e+00 ; -1.600704e-01 ];
Tc_3  = [ -7.568487e+01 ; -6.292113e+01 ; 2.514514e+02 ];
omc_error_3 = [ 3.582169e-03 ; 3.605464e-03 ; 7.466086e-03 ];
Tc_error_3  = [ 9.220335e-01 ; 1.054924e+00 ; 2.033606e+00 ];

%-- Image #4:
omc_4 = [ -2.152570e+00 ; -1.774401e+00 ; -5.550612e-01 ];
Tc_4  = [ -7.525085e+01 ; -4.141388e+01 ; 2.120363e+02 ];
omc_error_4 = [ 3.566517e-03 ; 3.726694e-03 ; 5.714377e-03 ];
Tc_error_4  = [ 7.868063e-01 ; 9.095602e-01 ; 1.829224e+00 ];

%-- Image #5:
omc_5 = [ -2.268423e+00 ; -2.046827e+00 ; -1.826316e-01 ];
Tc_5  = [ -8.847039e+01 ; -5.618715e+01 ; 3.022162e+02 ];
omc_error_5 = [ 5.522601e-03 ; 4.689694e-03 ; 1.068570e-02 ];
Tc_error_5  = [ 1.117210e+00 ; 1.293552e+00 ; 2.507136e+00 ];

%-- Image #6:
omc_6 = [ 2.566238e+00 ; 1.725930e+00 ; -1.726117e-01 ];
Tc_6  = [ -1.219865e+02 ; -5.446163e+01 ; 3.283164e+02 ];
omc_error_6 = [ 4.740396e-03 ; 4.393792e-03 ; 1.001295e-02 ];
Tc_error_6  = [ 1.208150e+00 ; 1.402440e+00 ; 2.678671e+00 ];

%-- Image #7:
omc_7 = [ 1.941979e+00 ; 2.419407e+00 ; 3.064673e-02 ];
Tc_7  = [ -4.813407e+01 ; -9.793816e+01 ; 3.201560e+02 ];
omc_error_7 = [ 4.554484e-03 ; 6.201506e-03 ; 1.175650e-02 ];
Tc_error_7  = [ 1.183996e+00 ; 1.351926e+00 ; 2.674577e+00 ];

%-- Image #8:
omc_8 = [ -2.042964e+00 ; -2.027475e+00 ; -5.487132e-01 ];
Tc_8  = [ -6.781312e+01 ; -5.208622e+01 ; 2.810062e+02 ];
omc_error_8 = [ 3.793215e-03 ; 4.457874e-03 ; 7.144594e-03 ];
Tc_error_8  = [ 1.037726e+00 ; 1.194933e+00 ; 2.417600e+00 ];

%-- Image #9:
omc_9 = [ 2.050989e+00 ; 1.804680e+00 ; -4.710048e-01 ];
Tc_9  = [ -7.375593e+01 ; -4.353827e+01 ; 3.249147e+02 ];
omc_error_9 = [ 3.408660e-03 ; 3.776249e-03 ; 6.328837e-03 ];
Tc_error_9  = [ 1.178628e+00 ; 1.355503e+00 ; 2.359760e+00 ];

%-- Image #10:
omc_10 = [ 1.961701e+00 ; 2.255398e+00 ; -1.393640e-01 ];
Tc_10  = [ -4.458146e+01 ; -9.050383e+01 ; 2.932236e+02 ];
omc_error_10 = [ 3.533516e-03 ; 4.408551e-03 ; 8.035584e-03 ];
Tc_error_10  = [ 1.078937e+00 ; 1.218630e+00 ; 2.352214e+00 ];

%-- Image #11:
omc_11 = [ -2.273175e+00 ; -2.107370e+00 ; 2.077114e-02 ];
Tc_11  = [ -5.071290e+01 ; -6.486029e+01 ; 2.742775e+02 ];
omc_error_11 = [ 4.563314e-03 ; 4.319748e-03 ; 9.457479e-03 ];
Tc_error_11  = [ 1.008410e+00 ; 1.157313e+00 ; 2.262231e+00 ];

%-- Image #12:
omc_12 = [ -2.016997e+00 ; -2.331048e+00 ; 1.284911e-01 ];
Tc_12  = [ -2.455333e+01 ; -9.215081e+01 ; 2.949004e+02 ];
omc_error_12 = [ 4.539279e-03 ; 4.969140e-03 ; 9.944107e-03 ];
Tc_error_12  = [ 1.088615e+00 ; 1.233343e+00 ; 2.415777e+00 ];

%-- Image #13:
omc_13 = [ -2.400192e+00 ; -1.984254e+00 ; 1.408895e-01 ];
Tc_13  = [ -4.689198e+01 ; -6.704095e+01 ; 2.912182e+02 ];
omc_error_13 = [ 4.996668e-03 ; 4.151147e-03 ; 9.774821e-03 ];
Tc_error_13  = [ 1.068060e+00 ; 1.215657e+00 ; 2.370168e+00 ];

%-- Image #14:
omc_14 = [ -2.221132e+00 ; -1.982151e+00 ; -7.621285e-02 ];
Tc_14  = [ -4.116861e+01 ; -6.161005e+01 ; 2.672292e+02 ];
omc_error_14 = [ 4.438666e-03 ; 4.341291e-03 ; 8.582959e-03 ];
Tc_error_14  = [ 9.850948e-01 ; 1.129279e+00 ; 2.167657e+00 ];

%-- Image #15:
omc_15 = [ 2.207415e+00 ; 1.966204e+00 ; -3.488710e-01 ];
Tc_15  = [ -4.542980e+01 ; -6.000584e+01 ; 3.169545e+02 ];
omc_error_15 = [ 4.077377e-03 ; 3.905469e-03 ; 7.842676e-03 ];
Tc_error_15  = [ 1.154245e+00 ; 1.309016e+00 ; 2.394386e+00 ];

%-- Image #16:
omc_16 = [ 2.284037e+00 ; 2.118536e+00 ; -1.087188e-01 ];
Tc_16  = [ -5.346233e+01 ; -6.923406e+01 ; 2.524126e+02 ];
omc_error_16 = [ 3.854012e-03 ; 3.721585e-03 ; 8.055730e-03 ];
Tc_error_16  = [ 9.279114e-01 ; 1.056935e+00 ; 2.060823e+00 ];

%-- Image #17:
omc_17 = [ -2.325481e+00 ; -2.107668e+00 ; 1.107992e-01 ];
Tc_17  = [ -7.911865e+01 ; -6.512961e+01 ; 2.581461e+02 ];
omc_error_17 = [ 4.253224e-03 ; 3.363441e-03 ; 8.447121e-03 ];
Tc_error_17  = [ 9.469805e-01 ; 1.091196e+00 ; 2.117439e+00 ];

%-- Image #18:
omc_18 = [ -2.295344e+00 ; -2.117432e+00 ; 1.080308e-01 ];
Tc_18  = [ -6.417308e+01 ; -6.262871e+01 ; 2.912182e+02 ];
omc_error_18 = [ 4.812293e-03 ; 4.257646e-03 ; 9.910680e-03 ];
Tc_error_18  = [ 1.064111e+00 ; 1.223577e+00 ; 2.376316e+00 ];

%-- Image #19:
omc_19 = [ 2.436090e+00 ; 1.920185e+00 ; -2.013809e-01 ];
Tc_19  = [ -7.966550e+01 ; -6.601449e+01 ; 3.045293e+02 ];
omc_error_19 = [ 4.439467e-03 ; 4.143012e-03 ; 9.225837e-03 ];
Tc_error_19  = [ 1.114385e+00 ; 1.275837e+00 ; 2.441244e+00 ];

%-- Image #20:
omc_20 = [ 2.097738e+00 ; 2.335751e+00 ; -5.134816e-02 ];
Tc_20  = [ -3.794313e+01 ; -8.786613e+01 ; 2.865742e+02 ];
omc_error_20 = [ 4.253908e-03 ; 4.873497e-03 ; 9.769050e-03 ];
Tc_error_20  = [ 1.057516e+00 ; 1.203545e+00 ; 2.369140e+00 ];

