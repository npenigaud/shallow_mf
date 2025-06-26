
ifeq ($(SRC), )
SRC=../src
endif

ifeq ($(BUILD), )
BUILD=.
endif

all: boot exe

include Makefile.inc

$(BUILD)/shallow_mf.intfb.ok: $(BUILD)/shallow_mf.intfb.h $(BUILD)/modd_budget.o $(BUILD)/modd_dimphyexn.o $(BUILD)/modd_cst.o $(BUILD)/modd_nebn.o $(BUILD)/modd_param_mfshalln.o $(BUILD)/modd_turbn.o $(BUILD)/modd_cturb.o $(BUILD)/modd_rain_ice_paramn.o $(BUILD)/modd_parameters.o
	touch $(BUILD)/shallow_mf.intfb.ok

$(BUILD)/compute_frac_ice.func.ok: $(SRC)/compute_frac_ice.func.h $(BUILD)/modd_nebn.o $(BUILD)/modd_cst.o
	touch $(BUILD)/compute_frac_ice.func.ok

$(BUILD)/th_r_from_thl_rt.func.ok: $(SRC)/th_r_from_thl_rt.func.h $(BUILD)/modd_dimphyexn.o $(BUILD)/modd_cst.o $(BUILD)/modd_nebn.o
	touch $(BUILD)/th_r_from_thl_rt.func.ok

$(BUILD)/crc64_intrinsic.o: $(SRC)/crc64_intrinsic.F90 $(BUILD)/parkind1.o
	$(FC) -o $(BUILD)/crc64_intrinsic.o -c $(SRC)/crc64_intrinsic.F90

$(BUILD)/main_shallow_mf.o: $(SRC)/main_shallow_mf.F90 $(BUILD)/yomdata.o $(BUILD)/modi_shallow_mf.o $(BUILD)/mode_shuman_phy.o $(BUILD)/yomhook.o $(BUILD)/modd_budget.o $(BUILD)/modd_dimphyexn.o $(BUILD)/modd_cst.o $(BUILD)/modd_nebn.o $(BUILD)/modd_param_mfshalln.o $(BUILD)/modd_turbn.o $(BUILD)/modd_cturb.o $(BUILD)/modd_rain_ice_paramn.o $(BUILD)/modd_parameters.o $(BUILD)/mode_compute_mf_cloud.o $(BUILD)/mode_compute_updraft.o $(BUILD)/mode_compute_updraft_raha.o $(BUILD)/mode_compute_updraft_rhcj10.o $(BUILD)/mode_mf_turb.o $(BUILD)/mode_mf_turb_expl.o $(BUILD)/mode_msg.o $(BUILD)/mode_thl_rt_from_th_r_mf.o $(BUILD)/util_csturb_t_mod.o $(BUILD)/util_turb_t_mod.o $(BUILD)/util_param_mfshall_t_mod.o $(BUILD)/util_neb_t_mod.o $(BUILD)/util_cst_t_mod.o $(BUILD)/util_dimphyex_t_mod.o $(BUILD)/util_rain_ice_param_t_mod.o $(BUILD)/xrd_getoptions.o $(BUILD)/xrd_unix_env.o shallow_mf.intfb.ok
	$(FC) -o $(BUILD)/main_shallow_mf.o -c $(SRC)/main_shallow_mf.F90

$(BUILD)/modd_budget.o: $(SRC)/modd_budget.F90 $(BUILD)/modd_dimphyexn.o
	$(FC) -o $(BUILD)/modd_budget.o -c $(SRC)/modd_budget.F90

$(BUILD)/modd_cst.o: $(SRC)/modd_cst.F90 
	$(FC) -o $(BUILD)/modd_cst.o -c $(SRC)/modd_cst.F90

$(BUILD)/modd_cturb.o: $(SRC)/modd_cturb.F90 
	$(FC) -o $(BUILD)/modd_cturb.o -c $(SRC)/modd_cturb.F90

$(BUILD)/modd_dimphyexn.o: $(SRC)/modd_dimphyexn.F90 
	$(FC) -o $(BUILD)/modd_dimphyexn.o -c $(SRC)/modd_dimphyexn.F90

$(BUILD)/modd_io.o: $(SRC)/modd_io.F90 $(BUILD)/modd_parameters.o
	$(FC) -o $(BUILD)/modd_io.o -c $(SRC)/modd_io.F90

$(BUILD)/modd_nebn.o: $(SRC)/modd_nebn.F90 $(BUILD)/modd_parameters.o
	$(FC) -o $(BUILD)/modd_nebn.o -c $(SRC)/modd_nebn.F90

$(BUILD)/modd_param_mfshalln.o: $(SRC)/modd_param_mfshalln.F90 $(BUILD)/modd_parameters.o
	$(FC) -o $(BUILD)/modd_param_mfshalln.o -c $(SRC)/modd_param_mfshalln.F90

$(BUILD)/modd_parameters.o: $(SRC)/modd_parameters.F90 
	$(FC) -o $(BUILD)/modd_parameters.o -c $(SRC)/modd_parameters.F90

$(BUILD)/modd_rain_ice_paramn.o: $(SRC)/modd_rain_ice_paramn.F90 $(BUILD)/modd_parameters.o $(BUILD)/modd_tiwmx.o
	$(FC) -o $(BUILD)/modd_rain_ice_paramn.o -c $(SRC)/modd_rain_ice_paramn.F90

$(BUILD)/modd_tiwmx.o: $(SRC)/modd_tiwmx.F90 
	$(FC) -o $(BUILD)/modd_tiwmx.o -c $(SRC)/modd_tiwmx.F90

$(BUILD)/modd_turbn.o: $(SRC)/modd_turbn.F90 $(BUILD)/modd_parameters.o
	$(FC) -o $(BUILD)/modd_turbn.o -c $(SRC)/modd_turbn.F90

$(BUILD)/mode_compute_bl89_ml.o: $(SRC)/mode_compute_bl89_ml.F90 $(BUILD)/yomhook.o $(BUILD)/modd_dimphyexn.o $(BUILD)/modd_cst.o $(BUILD)/modd_cturb.o $(BUILD)/mode_msg.o $(BUILD)/mode_shuman_mf.o
	$(FC) -o $(BUILD)/mode_compute_bl89_ml.o -c $(SRC)/mode_compute_bl89_ml.F90

$(BUILD)/mode_compute_function_thermo_mf.o: $(SRC)/mode_compute_function_thermo_mf.F90 $(BUILD)/modd_dimphyexn.o $(BUILD)/modd_cst.o $(BUILD)/yomhook.o
	$(FC) -o $(BUILD)/mode_compute_function_thermo_mf.o -c $(SRC)/mode_compute_function_thermo_mf.F90

$(BUILD)/mode_compute_mf_cloud.o: $(SRC)/mode_compute_mf_cloud.F90 $(BUILD)/modd_dimphyexn.o $(BUILD)/modd_cst.o $(BUILD)/modd_turbn.o $(BUILD)/modd_param_mfshalln.o $(BUILD)/modd_rain_ice_paramn.o $(BUILD)/mode_msg.o $(BUILD)/mode_compute_mf_cloud_direct.o $(BUILD)/mode_compute_mf_cloud_stat.o $(BUILD)/mode_compute_mf_cloud_bigaus.o $(BUILD)/yomhook.o
	$(FC) -o $(BUILD)/mode_compute_mf_cloud.o -c $(SRC)/mode_compute_mf_cloud.F90

$(BUILD)/mode_compute_mf_cloud_bigaus.o: $(SRC)/mode_compute_mf_cloud_bigaus.F90 $(BUILD)/modd_dimphyexn.o $(BUILD)/modd_cst.o $(BUILD)/modd_param_mfshalln.o $(BUILD)/modd_rain_ice_paramn.o $(BUILD)/mode_shuman_mf.o $(BUILD)/yomhook.o
	$(FC) -o $(BUILD)/mode_compute_mf_cloud_bigaus.o -c $(SRC)/mode_compute_mf_cloud_bigaus.F90

$(BUILD)/mode_compute_mf_cloud_direct.o: $(SRC)/mode_compute_mf_cloud_direct.F90 $(BUILD)/modd_dimphyexn.o $(BUILD)/modd_param_mfshalln.o $(BUILD)/mode_shuman_mf.o $(BUILD)/yomhook.o
	$(FC) -o $(BUILD)/mode_compute_mf_cloud_direct.o -c $(SRC)/mode_compute_mf_cloud_direct.F90

$(BUILD)/mode_compute_mf_cloud_stat.o: $(SRC)/mode_compute_mf_cloud_stat.F90 $(BUILD)/modd_dimphyexn.o $(BUILD)/modd_cst.o $(BUILD)/modd_param_mfshalln.o $(BUILD)/modd_turbn.o $(BUILD)/mode_shuman_mf.o $(BUILD)/mode_compute_function_thermo_mf.o $(BUILD)/yomhook.o
	$(FC) -o $(BUILD)/mode_compute_mf_cloud_stat.o -c $(SRC)/mode_compute_mf_cloud_stat.F90

$(BUILD)/mode_compute_updraft.o: $(SRC)/mode_compute_updraft.F90 $(BUILD)/modd_dimphyexn.o $(BUILD)/modd_cst.o $(BUILD)/modd_nebn.o $(BUILD)/modd_param_mfshalln.o $(BUILD)/modd_turbn.o $(BUILD)/modd_cturb.o $(BUILD)/mode_shuman_mf.o $(BUILD)/mode_compute_bl89_ml.o $(BUILD)/mode_msg.o $(BUILD)/yomhook.o
	$(FC) -o $(BUILD)/mode_compute_updraft.o -c $(SRC)/mode_compute_updraft.F90

$(BUILD)/mode_compute_updraft_raha.o: $(SRC)/mode_compute_updraft_raha.F90 $(BUILD)/modd_dimphyexn.o $(BUILD)/modd_cst.o $(BUILD)/modd_nebn.o $(BUILD)/modd_param_mfshalln.o $(BUILD)/mode_shuman_mf.o $(BUILD)/yomhook.o
	$(FC) -o $(BUILD)/mode_compute_updraft_raha.o -c $(SRC)/mode_compute_updraft_raha.F90

$(BUILD)/mode_compute_updraft_rhcj10.o: $(SRC)/mode_compute_updraft_rhcj10.F90 $(BUILD)/modd_dimphyexn.o $(BUILD)/modd_cst.o $(BUILD)/modd_nebn.o $(BUILD)/modd_param_mfshalln.o $(BUILD)/modd_turbn.o $(BUILD)/modd_cturb.o $(BUILD)/mode_shuman_mf.o $(BUILD)/mode_compute_bl89_ml.o $(BUILD)/yomhook.o
	$(FC) -o $(BUILD)/mode_compute_updraft_rhcj10.o -c $(SRC)/mode_compute_updraft_rhcj10.F90

$(BUILD)/mode_mf_turb.o: $(SRC)/mode_mf_turb.F90 $(BUILD)/modd_dimphyexn.o $(BUILD)/modd_param_mfshalln.o $(BUILD)/mode_shuman_mf.o $(BUILD)/mode_tridiag_massflux.o $(BUILD)/yomhook.o
	$(FC) -o $(BUILD)/mode_mf_turb.o -c $(SRC)/mode_mf_turb.F90

$(BUILD)/mode_mf_turb_expl.o: $(SRC)/mode_mf_turb_expl.F90 $(BUILD)/modd_dimphyexn.o $(BUILD)/modd_param_mfshalln.o $(BUILD)/yomhook.o $(BUILD)/mode_shuman_mf.o
	$(FC) -o $(BUILD)/mode_mf_turb_expl.o -c $(SRC)/mode_mf_turb_expl.F90

$(BUILD)/mode_msg.o: $(SRC)/mode_msg.F90 $(BUILD)/modd_io.o
	$(FC) -o $(BUILD)/mode_msg.o -c $(SRC)/mode_msg.F90

$(BUILD)/mode_shuman_mf.o: $(SRC)/mode_shuman_mf.F90 $(BUILD)/modd_dimphyexn.o
	$(FC) -o $(BUILD)/mode_shuman_mf.o -c $(SRC)/mode_shuman_mf.F90

$(BUILD)/mode_shuman_phy.o: $(SRC)/mode_shuman_phy.F90 $(BUILD)/yomhook.o $(BUILD)/modd_parameters.o $(BUILD)/modd_dimphyexn.o $(BUILD)/mode_msg.o
	$(FC) -o $(BUILD)/mode_shuman_phy.o -c $(SRC)/mode_shuman_phy.F90

$(BUILD)/mode_thl_rt_from_th_r_mf.o: $(SRC)/mode_thl_rt_from_th_r_mf.F90 $(BUILD)/modd_dimphyexn.o $(BUILD)/modd_cst.o $(BUILD)/yomhook.o
	$(FC) -o $(BUILD)/mode_thl_rt_from_th_r_mf.o -c $(SRC)/mode_thl_rt_from_th_r_mf.F90

$(BUILD)/mode_tridiag_massflux.o: $(SRC)/mode_tridiag_massflux.F90 $(BUILD)/yomhook.o $(BUILD)/modd_dimphyexn.o $(BUILD)/mode_shuman_mf.o
	$(FC) -o $(BUILD)/mode_tridiag_massflux.o -c $(SRC)/mode_tridiag_massflux.F90

$(BUILD)/modi_shallow_mf.o: $(SRC)/modi_shallow_mf.F90 $(BUILD)/modd_budget.o $(BUILD)/modd_dimphyexn.o $(BUILD)/modd_cst.o $(BUILD)/modd_nebn.o $(BUILD)/modd_param_mfshalln.o $(BUILD)/modd_turbn.o $(BUILD)/modd_cturb.o $(BUILD)/modd_rain_ice_paramn.o $(BUILD)/modd_parameters.o
	$(FC) -o $(BUILD)/modi_shallow_mf.o -c $(SRC)/modi_shallow_mf.F90

$(BUILD)/parkind1.o: $(SRC)/parkind1.F90 
	$(FC) -o $(BUILD)/parkind1.o -c $(SRC)/parkind1.F90

$(BUILD)/shallow_mf.o: $(SRC)/shallow_mf.F90 $(BUILD)/mode_shuman_phy.o $(BUILD)/yomhook.o $(BUILD)/modd_budget.o $(BUILD)/modd_dimphyexn.o $(BUILD)/modd_cst.o $(BUILD)/modd_nebn.o $(BUILD)/modd_param_mfshalln.o $(BUILD)/modd_turbn.o $(BUILD)/modd_cturb.o $(BUILD)/modd_rain_ice_paramn.o $(BUILD)/modd_parameters.o $(BUILD)/mode_compute_mf_cloud.o $(BUILD)/mode_compute_updraft.o $(BUILD)/mode_compute_updraft_raha.o $(BUILD)/mode_compute_updraft_rhcj10.o $(BUILD)/mode_mf_turb.o $(BUILD)/mode_mf_turb_expl.o $(BUILD)/mode_msg.o $(BUILD)/mode_thl_rt_from_th_r_mf.o
	$(FC) -o $(BUILD)/shallow_mf.o -c $(SRC)/shallow_mf.F90

$(BUILD)/util_cst_t_mod.o: $(SRC)/util_cst_t_mod.F90 $(BUILD)/modd_cst.o $(BUILD)/crc64_intrinsic.o
	$(FC) -o $(BUILD)/util_cst_t_mod.o -c $(SRC)/util_cst_t_mod.F90

$(BUILD)/util_csturb_t_mod.o: $(SRC)/util_csturb_t_mod.F90 $(BUILD)/modd_cturb.o $(BUILD)/crc64_intrinsic.o
	$(FC) -o $(BUILD)/util_csturb_t_mod.o -c $(SRC)/util_csturb_t_mod.F90

$(BUILD)/util_dimphyex_t_mod.o: $(SRC)/util_dimphyex_t_mod.F90 $(BUILD)/modd_dimphyexn.o $(BUILD)/crc64_intrinsic.o
	$(FC) -o $(BUILD)/util_dimphyex_t_mod.o -c $(SRC)/util_dimphyex_t_mod.F90

$(BUILD)/util_neb_t_mod.o: $(SRC)/util_neb_t_mod.F90 $(BUILD)/modd_nebn.o $(BUILD)/crc64_intrinsic.o
	$(FC) -o $(BUILD)/util_neb_t_mod.o -c $(SRC)/util_neb_t_mod.F90

$(BUILD)/util_param_mfshall_t_mod.o: $(SRC)/util_param_mfshall_t_mod.F90 $(BUILD)/modd_param_mfshalln.o $(BUILD)/crc64_intrinsic.o
	$(FC) -o $(BUILD)/util_param_mfshall_t_mod.o -c $(SRC)/util_param_mfshall_t_mod.F90

$(BUILD)/util_rain_ice_param_t_mod.o: $(SRC)/util_rain_ice_param_t_mod.F90 $(BUILD)/modd_rain_ice_paramn.o $(BUILD)/util_tiwmx_t_mod.o $(BUILD)/crc64_intrinsic.o
	$(FC) -o $(BUILD)/util_rain_ice_param_t_mod.o -c $(SRC)/util_rain_ice_param_t_mod.F90

$(BUILD)/util_tiwmx_t_mod.o: $(SRC)/util_tiwmx_t_mod.F90 $(BUILD)/modd_tiwmx.o $(BUILD)/crc64_intrinsic.o
	$(FC) -o $(BUILD)/util_tiwmx_t_mod.o -c $(SRC)/util_tiwmx_t_mod.F90

$(BUILD)/util_turb_t_mod.o: $(SRC)/util_turb_t_mod.F90 $(BUILD)/modd_turbn.o $(BUILD)/crc64_intrinsic.o
	$(FC) -o $(BUILD)/util_turb_t_mod.o -c $(SRC)/util_turb_t_mod.F90

$(BUILD)/xrd_getoptions.o: $(SRC)/xrd_getoptions.F90 $(BUILD)/parkind1.o $(BUILD)/xrd_unix_env.o
	$(FC) -o $(BUILD)/xrd_getoptions.o -c $(SRC)/xrd_getoptions.F90

$(BUILD)/xrd_unix_env.o: $(SRC)/xrd_unix_env.F90 $(BUILD)/parkind1.o
	$(FC) -o $(BUILD)/xrd_unix_env.o -c $(SRC)/xrd_unix_env.F90

$(BUILD)/yomdata.o: $(SRC)/yomdata.F90 $(BUILD)/parkind1.o
	$(FC) -o $(BUILD)/yomdata.o -c $(SRC)/yomdata.F90

$(BUILD)/yomhook.o: $(SRC)/yomhook.F90 $(BUILD)/parkind1.o
	$(FC) -o $(BUILD)/yomhook.o -c $(SRC)/yomhook.F90

$(BUILD)/crc64.o: $(SRC)/crc64.c
	$(CC) -o $(BUILD)/crc64.o -c $(SRC)/crc64.c
$(BUILD)/get_time.o: $(SRC)/get_time.c
	$(CC) -o $(BUILD)/get_time.o -c $(SRC)/get_time.c
$(BUILD)/main_shallow_mf.x: $(BUILD)/main_shallow_mf.o $(BUILD)/crc64_intrinsic.o $(BUILD)/modd_budget.o $(BUILD)/modd_cst.o $(BUILD)/modd_cturb.o $(BUILD)/modd_dimphyexn.o $(BUILD)/modd_io.o $(BUILD)/modd_nebn.o $(BUILD)/modd_param_mfshalln.o $(BUILD)/modd_parameters.o $(BUILD)/modd_rain_ice_paramn.o $(BUILD)/modd_tiwmx.o $(BUILD)/modd_turbn.o $(BUILD)/mode_compute_bl89_ml.o $(BUILD)/mode_compute_function_thermo_mf.o $(BUILD)/mode_compute_mf_cloud.o $(BUILD)/mode_compute_mf_cloud_bigaus.o $(BUILD)/mode_compute_mf_cloud_direct.o $(BUILD)/mode_compute_mf_cloud_stat.o $(BUILD)/mode_compute_updraft.o $(BUILD)/mode_compute_updraft_raha.o $(BUILD)/mode_compute_updraft_rhcj10.o $(BUILD)/mode_mf_turb.o $(BUILD)/mode_mf_turb_expl.o $(BUILD)/mode_msg.o $(BUILD)/mode_shuman_mf.o $(BUILD)/mode_shuman_phy.o $(BUILD)/mode_thl_rt_from_th_r_mf.o $(BUILD)/mode_tridiag_massflux.o $(BUILD)/modi_shallow_mf.o $(BUILD)/parkind1.o $(BUILD)/shallow_mf.o $(BUILD)/util_cst_t_mod.o $(BUILD)/util_csturb_t_mod.o $(BUILD)/util_dimphyex_t_mod.o $(BUILD)/util_neb_t_mod.o $(BUILD)/util_param_mfshall_t_mod.o $(BUILD)/util_rain_ice_param_t_mod.o $(BUILD)/util_tiwmx_t_mod.o $(BUILD)/util_turb_t_mod.o $(BUILD)/xrd_getoptions.o $(BUILD)/xrd_unix_env.o $(BUILD)/yomdata.o $(BUILD)/yomhook.o $(BUILD)/crc64.o $(BUILD)/get_time.o
	$(FC) -o $(BUILD)/main_shallow_mf.x $(BUILD)/main_shallow_mf.o $(BUILD)/crc64_intrinsic.o $(BUILD)/modd_budget.o $(BUILD)/modd_cst.o $(BUILD)/modd_cturb.o $(BUILD)/modd_dimphyexn.o $(BUILD)/modd_io.o $(BUILD)/modd_nebn.o $(BUILD)/modd_param_mfshalln.o $(BUILD)/modd_parameters.o $(BUILD)/modd_rain_ice_paramn.o $(BUILD)/modd_tiwmx.o $(BUILD)/modd_turbn.o $(BUILD)/mode_compute_bl89_ml.o $(BUILD)/mode_compute_function_thermo_mf.o $(BUILD)/mode_compute_mf_cloud.o $(BUILD)/mode_compute_mf_cloud_bigaus.o $(BUILD)/mode_compute_mf_cloud_direct.o $(BUILD)/mode_compute_mf_cloud_stat.o $(BUILD)/mode_compute_updraft.o $(BUILD)/mode_compute_updraft_raha.o $(BUILD)/mode_compute_updraft_rhcj10.o $(BUILD)/mode_mf_turb.o $(BUILD)/mode_mf_turb_expl.o $(BUILD)/mode_msg.o $(BUILD)/mode_shuman_mf.o $(BUILD)/mode_shuman_phy.o $(BUILD)/mode_thl_rt_from_th_r_mf.o $(BUILD)/mode_tridiag_massflux.o $(BUILD)/modi_shallow_mf.o $(BUILD)/parkind1.o $(BUILD)/shallow_mf.o $(BUILD)/util_cst_t_mod.o $(BUILD)/util_csturb_t_mod.o $(BUILD)/util_dimphyex_t_mod.o $(BUILD)/util_neb_t_mod.o $(BUILD)/util_param_mfshall_t_mod.o $(BUILD)/util_rain_ice_param_t_mod.o $(BUILD)/util_tiwmx_t_mod.o $(BUILD)/util_turb_t_mod.o $(BUILD)/xrd_getoptions.o $(BUILD)/xrd_unix_env.o $(BUILD)/yomdata.o $(BUILD)/yomhook.o $(BUILD)/crc64.o $(BUILD)/get_time.o $(LIBS)


exe: $(BUILD)/main_shallow_mf.x

subclean:
	\rm -f $(BUILD)/main_shallow_mf.o $(BUILD)/shallow_mf.o $(BUILD)/crc64.o $(BUILD)/get_time.o

clean: 
	\rm -f $(BUILD)/*.o $(BUILD)/*.xml $(BUILD)/*.a $(BUILD)/*.x $(BUILD)/*.mod $(BUILD)/*.optrpt $(BUILD)/*.smod $(BUILD)/*.ok $(BUILD)/*.optrpt

tidy:
	\rm -f $(BUILD)/*.xml $(BUILD)/*.optrpt
