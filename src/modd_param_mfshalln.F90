!MNH_LIC Copyright 1994-2014 CNRS, Meteo-France and Universite Paul Sabatier
!MNH_LIC This is part of the Meso-NH software governed by the CeCILL-C licence
!MNH_LIC version 1. See LICENSE, CeCILL-C_V1-en.txt and CeCILL-C_V1-fr.txt
!MNH_LIC for details. version 1.
!-----------------------------------------------------------------
!-----------------------------------------------------------------
!     #############################
      MODULE MODD_PARAM_MFSHALL_n
!     #############################
!> @file
!!      *MODD_PARAM_MFSHALL_n* - Declaration of Mass flux scheme free parameters
!!
!!    PURPOSE
!!    -------
!!    The purpose of this declarative module is to declare the
!!    variables that may be set by namelist for the mass flux scheme
!!
!!    IMPLICIT ARGUMENTS
!!    ------------------
!!      None 
!!
!!    REFERENCE
!!    ---------
!!      
!!          
!!    AUTHOR
!!    ------
!!       S. Malardel, J. Pergaud (Meteo France)      
!!
!!    MODIFICATIONS
!!    -------------
!!      Original    01/02/07
!!      10/16 R.Honnert Update with AROME
!!      01/2019 R.Honnert add parameters for the reduction of mass-flux surface closure with resolution
!!      Jan 2025 A. Marcel: Wet mixing according to Lapp and Randall 2001
!!      Jan 2025 A. Marcel: TKE mixing
!!      A. Marcel Jan 2025: bi-Gaussian PDF and associated subgrid precipitation
!!      S. Riette Jan 2025: LPZ_EXP_LOG switch
!!      A. Marcel Jan 2025: KIC computed following Rooy and Siebesma (2008)
!!      A. Marcel Jan 2025: minimum dry detrainment computed with LUP in updraft
!!      A. Marcel Jan 2025: w_up equation update (XBRIO and XAADVEC)
!!      A. Marcel Jan 2025: relaxation of the small fraction assumption
!-------------------------------------------------------------------------------
!
!*       0.   DECLARATIONS
!             ------------
!
USE MODD_PARAMETERS, ONLY: JPMODELMAX
IMPLICIT NONE

TYPE PARAM_MFSHALL_t

REAL               :: XIMPL_MF     !< degre of implicitness
      
CHARACTER (LEN=4)  :: CMF_UPDRAFT  !< Type of Mass Flux Scheme
                                   !! 'NONE' if no parameterization 
CHARACTER (LEN=4)  :: CMF_CLOUD    !< Type of cloud scheme associated
CHARACTER (LEN=4)  :: CWET_MIXING  !< Type of env mixing for buoyancy sorting scheme
                                   !! PKFB for the original Pergaud code, LR01 for Lappen and Randall 2001
CHARACTER (LEN=4)  :: CKIC_COMPUTE !< Method to compute KIC: KFB (PMMC09 original method, like in KFB)
                                   !! RS08 (to use the Rooy and Siebesma (2008) formulation)
CHARACTER (LEN=4)  :: CDETR_DRY_LUP!< 'SURF' to use LUP at surface (PMMC09), UPDR to compute LUP in updraft
                                     
LOGICAL       :: LMIXUV      !< True if mixing of momentum
LOGICAL       :: LMIXTKE     !< True if mixing of TKE
LOGICAL       :: LMF_FLX     !< logical switch for the storage of the mass flux fluxes
REAL          :: XALP_PERT   !< coefficient for the perturbation of
                             !! theta_l and r_t at the first level of the updraft
REAL          ::    XABUO    !< coefficient of the buoyancy term in the w_up equation
REAL          ::    XBENTR   !< coefficient of the entrainment term in the w_up equation
REAL          ::    XBDETR   !< coefficient of the detrainment term in the w_up equation
REAL          ::    XCMF     !< coefficient for the mass flux at the first level of the updraft (closure)
REAL          :: XENTR_MF    !< entrainment constant (m/Pa) = 0.2 (m) 
REAL          :: XCRAD_MF    !< cloud radius in cloudy part
REAL          :: XENTR_DRY   !< coefficient for entrainment in dry part 
REAL          :: XDETR_DRY   !< coefficient for detrainment in dry part
REAL          :: XDETR_LUP   !< coefficient for detrainment in dry part
REAL          :: XKCF_MF     !< coefficient for cloud fraction
REAL          :: XKRC_MF     !< coefficient for convective rc
REAL          :: XTAUSIGMF
REAL          :: XPRES_UV    !< coefficient for pressure term in wind mixing
REAL          :: XALPHA_MF   !< coefficient for cloudy fraction
REAL          :: XSIGMA_MF   !< coefficient for updraft sigma computation in the bigaussian scheme
REAL          :: XSIGMA_ENV  !< coefficient for the environment sigma contribution in the bigaussian scheme
REAL          :: XFRAC_UP_MAX!< maximum Updraft fraction
!
REAL          :: XA1         !< Parameter for Rio et al (2010) formulation for entrainment and detrainment (RHCJ10)
REAL          :: XB          !!
REAL          :: XC          !!
REAL          :: XBETA1      !!
!
REAL          :: XR          !< Parameter for closure assumption of Hourdin et al (2002): aspect ratio of updraft
!
LOGICAL       :: LGZ         !< Grey Zone Surface Closure
REAL          :: XGZ         !< Tuning of the surface initialisation for Grey Zone
!
LOGICAL       :: LTHETAS_MF      !< .TRUE. to use ThetaS1 instead of ThetaL
REAL          :: XLAMBDA_MF      !< Thermodynamic parameter: Lambda to compute ThetaS1 from ThetaL
LOGICAL       :: LVERLIMUP      !< .TRUE. to use correction on vertical limitation of updraft (issue #38 PHYEX)
LOGICAL       :: LPZ_EXP_LOG    !< .TRUE. to exp/log during dP/dZ conversion
REAL          :: XBRIO          !< coefficient to slow down wup equa like Rio 2010
REAL          :: XAADVEC        !< coeff for advective pressure perturbation like Jia he 2022
LOGICAL       :: LRELAX_ALPHA_MF !< .TRUE. to relax the small fraction assumption

END TYPE PARAM_MFSHALL_t

TYPE(PARAM_MFSHALL_t), DIMENSION(JPMODELMAX), TARGET, SAVE :: PARAM_MFSHALL_MODEL
TYPE(PARAM_MFSHALL_t), POINTER, SAVE :: PARAM_MFSHALLN => NULL()
                                     
REAL             , POINTER :: XIMPL_MF=>NULL()
CHARACTER (LEN=4), POINTER :: CMF_UPDRAFT=>NULL() 
CHARACTER (LEN=4), POINTER :: CMF_CLOUD=>NULL()
CHARACTER (LEN=4), POINTER :: CWET_MIXING=>NULL()
CHARACTER (LEN=4), POINTER :: CKIC_COMPUTE=>NULL()
CHARACTER (LEN=4), POINTER :: CDETR_DRY_LUP=>NULL()
LOGICAL          , POINTER :: LMIXUV=>NULL() 
LOGICAL          , POINTER :: LMIXTKE=>NULL()
LOGICAL          , POINTER :: LMF_FLX=>NULL() 
!
REAL, POINTER          :: XALP_PERT=>NULL()   
REAL, POINTER          :: XABUO=>NULL()   
REAL, POINTER          :: XBENTR=>NULL()   
REAL, POINTER          :: XBDETR=>NULL()   
REAL, POINTER          :: XCMF=>NULL()    
REAL, POINTER          :: XENTR_MF=>NULL()   
REAL, POINTER          :: XCRAD_MF=>NULL()   
REAL, POINTER          :: XENTR_DRY=>NULL()    
REAL, POINTER          :: XDETR_DRY=>NULL()  
REAL, POINTER          :: XDETR_LUP=>NULL()  
REAL, POINTER          :: XKCF_MF=>NULL()    
REAL, POINTER          :: XKRC_MF=>NULL()    
REAL, POINTER          :: XTAUSIGMF=>NULL()
REAL, POINTER          :: XPRES_UV=>NULL()   
REAL, POINTER          :: XALPHA_MF=>NULL()   
REAL, POINTER          :: XSIGMA_MF=>NULL()  
REAL, POINTER          :: XSIGMA_ENV=>NULL()
REAL, POINTER          :: XFRAC_UP_MAX=>NULL()
REAL, POINTER          :: XA1=>NULL() 
REAL, POINTER          :: XB=>NULL()
REAL, POINTER          :: XC=>NULL()  
REAL, POINTER          :: XBETA1=>NULL()
REAL, POINTER          :: XR=>NULL() 
LOGICAL, POINTER       :: LTHETAS_MF=>NULL()
REAL, POINTER          :: XLAMBDA_MF=>NULL() 
LOGICAL, POINTER       :: LGZ=>NULL() 
REAL, POINTER          :: XGZ=>NULL()
LOGICAL, POINTER       :: LVERLIMUP=>NULL() 
LOGICAL, POINTER       :: LPZ_EXP_LOG=>NULL()
REAL, POINTER          :: XBRIO=>NULL()
REAL, POINTER          :: XAADVEC=>NULL()
LOGICAL, POINTER       :: LRELAX_ALPHA_MF=>NULL()
!
NAMELIST/NAM_PARAM_MFSHALLn/XIMPL_MF,CMF_UPDRAFT,CMF_CLOUD,CWET_MIXING,LMIXUV,LMIXTKE,LMF_FLX,&
                            XALP_PERT,XABUO,XBENTR,XBDETR,XCMF,XENTR_MF,&
                            XCRAD_MF,XENTR_DRY,XDETR_DRY,XDETR_LUP,XKCF_MF,&
                            XKRC_MF,XTAUSIGMF,XPRES_UV,XALPHA_MF,XSIGMA_MF,XSIGMA_ENV,&
                            XFRAC_UP_MAX,XA1,XB,XC,XBETA1,XR,LTHETAS_MF,LGZ,XGZ,&
                            LVERLIMUP,LPZ_EXP_LOG,CKIC_COMPUTE,CDETR_DRY_LUP,&
                            XBRIO, XAADVEC, LRELAX_ALPHA_MF
!
!-------------------------------------------------------------------------------
!
END MODULE MODD_PARAM_MFSHALL_n
