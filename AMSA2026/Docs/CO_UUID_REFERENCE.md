# CO Name to Metadata UUID Reference

This is the full collection of IMOS cloud optimised products.

To see a full description of the product, go to the AODN portal replacing <uuid> the the corresponding uuid in the table: 

`https://portal-beta.aodn.org.au/details/<uuid>`

Example with the AusTemp product:  
`https://portal-beta.aodn.org.au/details/2ffccdad-1197-4e41-b412-a9033517cfb2`


To connect to the AWS S3 store just add the name of the cloud optimised product and the extension .zarr or .parquet to 

`s3://aond-cloud-optimised/<COname>.<type>/`

Example with AusTemp product:  

`s3://aodn-cloud-optimised/satellite_austemp_heatwave_14day.zarr/`  

------------------------


| CO name | Metadata UUID | UUID source | Type |
|---|---|---|---|
| `aggregated_amsa_nonqc` | `2a5739e7-0cb8-444a-b83b-b2bc841b0ce8` | co file | parquet |
| `aggregated_dugong_nonqc` | `b85f6b58-636a-4a6e-aca4-c90999d7f424` | co file | parquet |
| `aggregated_kelp_nonqc` | `20be281d-dfb2-4868-b690-c889a23b5714` | co file | parquet |
| `aggregated_seabird_nonqc` | `ec2c0ef9-3645-4ded-b617-c8297f6eb250` | co file | parquet |
| `aggregated_seagrass_nonqc` | `009a1131-efc1-4a61-8f90-cf289e7c043d` | co file | parquet |
| `animal_acoustic_tracking_delayed_detection_qc` | `541d4f15-122a-443d-ab4e-2b5feb08d6a0` | config | parquet |
| `animal_acoustic_tracking_delayed_qc` | `0ede6b3d-8635-472f-b91c-56a758b4e091` | config | parquet |
| `animal_acoustic_tracking_delayed_summarised_detection_qc` | `c524d3dd-536e-452c-b8e8-cd0e8901ea67` | config | parquet |
| `animal_ctd_satellite_relay_tagging_delayed_qc` | `95d6314c-cfc7-40ae-b439-85f14541db71` | config | parquet |
| `animal_ctd_satellite_relay_tagging_location_qc_realtime_qc` | `b2548767-514f-4a31-b65e-36bb894382d5` | config | parquet |
| `animal_diag_satellite_relay_tagging_location_qc_realtime_qc` | `b2548767-514f-4a31-b65e-36bb894382d5` | config | parquet |
| `animal_dive_satellite_relay_tagging_location_qc_realtime_qc` | `b2548767-514f-4a31-b65e-36bb894382d5` | config | parquet |
| `animal_gps_satellite_relay_tagging_location_qc_realtime_qc` | `b2548767-514f-4a31-b65e-36bb894382d5` | config | parquet |
| `animal_haulout_satellite_relay_tagging_location_qc_realtime_qc` | `b2548767-514f-4a31-b65e-36bb894382d5` | config | parquet |
| `animal_metadata_satellite_relay_tagging_location_qc_realtime_qc` | `b2548767-514f-4a31-b65e-36bb894382d5` | config | parquet |
| `animal_ssmoutputs_satellite_relay_tagging_location_qc_realtime_qc` | `b2548767-514f-4a31-b65e-36bb894382d5` | config | parquet |
| `animal_summary_satellite_relay_tagging_location_qc_realtime_qc` | `b2548767-514f-4a31-b65e-36bb894382d5` | config | parquet |
| `argo` | `4402cb50-e20a-44ee-93e6-4728259250d2` | config | parquet |
| `autonomous_underwater_vehicle` | `af5d0ff9-bb9c-4b7c-a63c-854a630b6984` | config | parquet |
| `diver_benthic_cover_in_situ_qc` | `ec424e4f-0f55-41a5-a3f2-726bc4541947` | config | parquet |
| `diver_cryptobenthic_fish_abundance_qc` | `9efa25cd-4da4-47b5-9385-45e3cbd11705` | config | parquet |
| `diver_mobile_macroinvertebrate_abundance_qc` | `48cf3cb9-caa9-4633-9baa-8bba3c4d904a` | config | parquet |
| `diver_off_transect_species_observations_qc` | `a73907b7-3686-4dcf-8a1d-7efc4e5ffc05` | config | parquet |
| `diver_photoquadrat_qc_DwC` | `0a65be6d-1c76-49ac-a151-80acf123612c` | co file | parquet |
| `diver_photoquadrat_score_qc` | `0a65be6d-1c76-49ac-a151-80acf123612c` | config | parquet |
| `diver_reef_fish_abundance_biomass_qc` | `b273fafa-03d6-4fc2-9acf-39d8c06581e5` | config | parquet |
| `diver_site_information_qc` | `e41efa35-03f0-4dea-be98-2a69e46b510b` | config | parquet |
| `diver_survey_metadata_qc` | `997c2e15-b345-438f-afac-49a4ac19be38` | config | parquet |
| `model_sea_level_anomaly_gridded_delayed` | `663be14d-bb88-4e84-a34c-6c84a0196e2e` | config | zarr |
| `model_sea_level_anomaly_gridded_realtime` | `0c9eb39c-9cbe-4c6a-8a10-5867087e703a` | config | zarr |
| `mooring_acidification_delayed_qc` | `89b495cc-7382-43c0-abef-d1e66738a924` | config | parquet |
| `mooring_acidification_realtime_qc` | `4d3d4aca-472e-4616-88a5-df0f5ab401ba` | config | parquet |
| `mooring_ctd_delayed_qc` | `7b901002-b1dc-46c3-89f2-b4951cedca48` | config | parquet |
| `mooring_estuarine_coastal_water_quality_monitoring_realtime_qc` | `f3c16fdb-72fc-4b55-bff1-3b5b5722f38f` | config | parquet |
| `mooring_hourly_timeseries_delayed_qc` | `efd8201c-1eca-412e-9ad2-0534e96cea14` | config | parquet |
| `mooring_satellite_altimetry_calibration_validation` | `78d588ed-79dd-47e2-b806-d39025194e7e` | config | parquet |
| `mooring_southern_ocean_surface_fluxes_realtime_qc` | `80ffbf9d-9547-41aa-8fa1-cf028c58556a` | config | parquet |
| `mooring_southern_ocean_surface_properties_realtime_qc` | `9fdb1eee-bc28-43a9-88c5-972324784837` | config | parquet |
| `mooring_temperature_logger_delayed_qc` | `7e13b5f3-4a70-4e31-9e95-335efa491c5c` | config | parquet |
| `mooring_timeseries_realtime_qc` | `a8f5c736-6eaa-47fb-a9eb-d778beb71701` | config | parquet |
| `mooring_wave_timeseries_delayed_qc` | `aaebf991-b79d-4670-a1c5-a0de9bf649ce` | config | zarr |
| `ocean_glider_delayed_qc` | `c317b0fe-02e8-4ff9-96c9-563fd58e82ac` | config | parquet |
| `ocean_glider_realtime_nonqc` | `a681fdba-c6d9-44ab-90b9-113b0ed03536` | config | parquet |
| `radar_BonneyCoast_velocity_hourly_averaged_delayed_qc` | `38dd003d-2f71-4715-bd3f-4b1cfdce391d` | config | zarr |
| `radar_BonneyCoast_velocity_hourly_averaged_realtime_nonqc` | `4a1608ab-ebdd-4f98-93c3-15f2da87bfa0` | config | zarr |
| `radar_CapricornBunkerGroup_velocity_hourly_averaged_delayed_qc` | `8a2d2824-0557-4110-a561-01ec35a9583d` | config | zarr |
| `radar_CapricornBunkerGroup_velocity_hourly_averaged_realtime_nonqc` | `422db51d-596c-4d1c-86a0-b89413c5187e` | config | zarr |
| `radar_CapricornBunkerGroup_wave_delayed_qc` | `400a1237-af4d-45c6-a292-788cf0212522` | config | zarr |
| `radar_CapricornBunkerGroup_wind_delayed_qc` | `742dc902-b300-4e3e-839f-04d03671aa09` | config | zarr |
| `radar_CoffsHarbour_velocity_hourly_averaged_delayed_qc` | `85da1645-2c63-45fa-97b5-4125165b999d` | config | zarr |
| `radar_CoffsHarbour_velocity_hourly_averaged_realtime_nonqc` | `82bc6673-c9cb-4afc-8b5d-0e65b097bfdc` | config | zarr |
| `radar_CoffsHarbour_wave_delayed_qc` | `e32e51d9-b0a5-4b95-9906-44e0c6c8d516` | config | zarr |
| `radar_CoffsHarbour_wind_delayed_qc` | `ffe8f19c-de4a-4362-89be-7605b2dd6b8c` | config | zarr |
| `radar_CoralCoast_velocity_hourly_averaged_delayed_qc` | `f7b36a1c-0936-4da6-b47f-94ed538b367e` | config | zarr |
| `radar_CoralCoast_velocity_hourly_averaged_realtime_nonqc` | `0dd3832a-cf67-4068-a446-a9c91c77273e` | config | zarr |
| `radar_Newcastle_velocity_hourly_averaged_delayed_qc` | `6dca1f8a-8337-4551-ac4b-a2d35ec6f333` | config | zarr |
| `radar_Newcastle_velocity_hourly_averaged_realtime_nonqc` | `e952bcee-79e7-4995-91ad-a7e6408d29ce` | config | zarr |
| `radar_NorthWestShelf_velocity_hourly_averaged_delayed_qc` | `23c27e4f-c982-44e9-9ab7-71094d297549` | config | zarr |
| `radar_NorthWestShelf_velocity_hourly_averaged_realtime_nonqc` | `ba9110f1-072c-4d15-8328-2091be983991` | config | zarr |
| `radar_RottnestShelf_velocity_hourly_averaged_delayed_qc` | `028b9801-279f-427c-964b-0ffcdf310b59` | config | zarr |
| `radar_RottnestShelf_velocity_hourly_averaged_realtime_nonqc` | `8b469535-eb48-4f1f-9612-bdf2e83cdce8` | config | zarr |
| `radar_RottnestShelf_wave_delayed_qc` | `9c6d6a0c-4983-4cb5-b119-02c11ce6af4e` | config | zarr |
| `radar_RottnestShelf_wind_delayed_qc` | `5ad9a6da-3f0b-4b2f-8212-48b386e1b98c` | config | zarr |
| `radar_SouthAustraliaGulfs_velocity_hourly_averaged_delayed_qc` | `cb2e22b5-ebb9-460b-8cff-b446fe14ea2f` | config | zarr |
| `radar_SouthAustraliaGulfs_velocity_hourly_averaged_realtime_nonqc` | `d83ef640-827e-4990-8c35-7c1a1aa587a9` | config | zarr |
| `radar_SouthAustraliaGulfs_wave_delayed_qc` | `19da2ce7-138f-4427-89de-a50c724f5f54` | config | zarr |
| `radar_SouthAustraliaGulfs_wind_delayed_qc` | `db049981-3d4e-4cb2-9c4b-e697650845b9` | config | zarr |
| `radar_TurquoiseCoast_velocity_hourly_averaged_delayed_qc` | `055342fc-f970-4be7-a764-8903220d42fb` | config | zarr |
| `radar_TurquoiseCoast_velocity_hourly_averaged_realtime_nonqc` | `52f09a23-63a2-4c14-8b3b-1fc7c8167281` | config | zarr |
| `satellite_austemp_degree-heating-day_australia` | `e1f2476a-b801-4a1f-9fbe-727b4f76f726` | co file | zarr |
| `satellite_austemp_dhd_14day` | `e1f2476a-b801-4a1f-9fbe-727b4f76f726` | config | zarr |
| `satellite_austemp_heatwave_14day` | `2ffccdad-1197-4e41-b412-a9033517cfb2` | config | zarr |
| `satellite_austemp_sst-anomaly_australia` | `62f6b449-90dc-45bf-8acb-ae52e8a58c5c` | co file | zarr |
| `satellite_austemp_sst_14day` | `62f6b449-90dc-45bf-8acb-ae52e8a58c5c` | config | zarr |
| `satellite_chlorophylla_carder_1day_aqua` | `43ac4663-c8de-4eb0-9711-3da65cbecdd3` | config | zarr |
| `satellite_chlorophylla_gsm_1day_aqua` | `f73daf07-eb81-4995-a72a-ca903834509f` | config | zarr |
| `satellite_chlorophylla_gsm_1day_noaa20` | `ad4d6908-3a36-4991-996a-5b00ac162794` | config | zarr |
| `satellite_chlorophylla_gsm_1day_snpp` | `6447f562-9063-4879-8598-ca0b5c4e0175` | config | zarr |
| `satellite_chlorophylla_oc3_1day_aqua` | `d7a14921-8f3f-4522-9a54-e7d1df969c8a` | config | zarr |
| `satellite_chlorophylla_oc3_1day_noaa20` | `77f46a04-f07d-4968-a5f9-1da8df9706a7` | config | zarr |
| `satellite_chlorophylla_oc3_1day_snpp` | `d222bd3f-b1a8-46f1-b462-90e44c5d9b44` | config | zarr |
| `satellite_chlorophylla_oci_1day_aqua` | `24055e3a-94e5-40bb-b97f-7519f0482d6a` | config | zarr |
| `satellite_chlorophylla_oci_1day_noaa20` | `a9e03db8-f277-45d1-821d-cfcbfe8ae6be` | config | zarr |
| `satellite_chlorophylla_oci_1day_snpp` | `d7f9eb3f-b81e-4421-8c75-761ffb33db5d` | config | zarr |
| `satellite_diffuse_attenuation_coefficent_1day_aqua` | `a8632154-b8e5-493d-acd4-e458fae3ae26` | config | zarr |
| `satellite_diffuse_attenuation_coefficent_1day_noaa20` | `37751f5b-3c93-40df-9913-951df310cbc8` | config | zarr |
| `satellite_diffuse_attenuation_coefficent_1day_snpp` | `697aa9e7-bf24-4f9e-9950-d5cfd78f1b35` | config | zarr |
| `satellite_ghrsst_l3c_1day_daytime_noaa19_australia` | `e6782131-821c-4237-b2a9-27c6aaa8608c` | config | zarr |
| `satellite_ghrsst_l3c_1day_daytime_noaa19_southern_ocean` | `be9103bd-dbbb-42a8-949d-92e8543a4d92` | config | zarr |
| `satellite_ghrsst_l3c_1day_daytime_snpp_australia` | `bcf6a870-2591-492e-b340-931f38de5975` | config | zarr |
| `satellite_ghrsst_l3c_1day_nighttime_himawari8` | `72b65fb8-84e1-4a56-b32c-7f15970903d2` | config | zarr |
| `satellite_ghrsst_l3c_1day_nighttime_noaa19_australia` | `46ebc1a9-c503-4435-b85c-11fe16176c8d` | config | zarr |
| `satellite_ghrsst_l3c_1day_nighttime_noaa19_southern_ocean` | `91495e9a-6590-4fb9-bb63-0901a8a4b7b1` | config | zarr |
| `satellite_ghrsst_l3c_1day_nighttime_snpp_australia` | `a05817da-fdab-483a-a965-b26fe364ad7c` | config | zarr |
| `satellite_ghrsst_l3c_4hour_himawari8` | `06d2fff4-8e2c-4bd7-b98f-cd98e588df6f` | config | zarr |
| `satellite_ghrsst_l3s_1day_daynighttime_multi_sensor_australia` | `d7f3178d-869a-4eac-959d-71d1f5e24888` | config | zarr |
| `satellite_ghrsst_l3s_1day_daynighttime_single_sensor_southernocean` | `165a23d7-5ef3-4cab-9e02-90c8adb941dd` | config | zarr |
| `satellite_ghrsst_l3s_1day_daytime_multi_sensor_australia` | `52ad55a5-b537-4e10-8a81-22d9317c81f2` | config | zarr |
| `satellite_ghrsst_l3s_1day_daytime_single_sensor_australia` | `8bd3fe33-fd98-4307-ad23-424ad9a2907b` | config | zarr |
| `satellite_ghrsst_l3s_1day_nighttime_geopolar_multi_sensor_australia` | `7d8d046b-6002-4897-b781-04e7324d6af8` | config | zarr |
| `satellite_ghrsst_l3s_1day_nighttime_multi_sensor_australia` | `d3e3bce3-adb4-433a-a192-93abc91899d3` | config | zarr |
| `satellite_ghrsst_l3s_1day_nighttime_single_sensor_australia` | `aaad092c-c3af-42e6-87e0-bdaef945f522` | config | zarr |
| `satellite_ghrsst_l3s_1month_daynighttime_multi_sensor_australia` | `73e6608c-cbf5-4a01-9c95-1f137de6cbac` | config | zarr |
| `satellite_ghrsst_l3s_1month_daynighttime_single_sensor_australia` | `d6f49c4a-8b75-4d05-acd4-b9c085bf4de0` | config | zarr |
| `satellite_ghrsst_l3s_1month_daynighttime_single_sensor_southernocean` | `a05d8ceb-ab0c-4bad-8126-d16d535e73c1` | config | zarr |
| `satellite_ghrsst_l3s_1month_daytime_multi_sensor_australia` | `e3b2531b-a662-43de-9a8b-8e2b385267b3` | config | zarr |
| `satellite_ghrsst_l3s_1month_daytime_single_sensor_australia` | `b8e9f613-9611-4692-a958-07f100d2c763` | config | zarr |
| `satellite_ghrsst_l3s_1month_nighttime_multi_sensor_australia` | `1aa787da-a9ba-494a-ae22-0c3eee2491e1` | config | zarr |
| `satellite_ghrsst_l3s_1month_nighttime_single_sensor_australia` | `d9618fb2-1a71-4afd-b1c8-56a6871b224a` | config | zarr |
| `satellite_ghrsst_l3s_3day_daynighttime_multi_sensor_australia` | `4cbb9eeb-9ed3-4079-a180-2293a2c219b9` | config | zarr |
| `satellite_ghrsst_l3s_3day_daytime_multi_sensor_australia` | `08e04227-4da1-479b-bec1-06ee27a69a40` | config | zarr |
| `satellite_ghrsst_l3s_3day_nighttime_multi_sensor_australia` | `b28ab00c-06f9-4cef-9053-4ff3bf537bb7` | config | zarr |
| `satellite_ghrsst_l3s_6day_daynighttime_multi_sensor_australia` | `95b81267-bad2-4939-8559-45b0d0c6f2e9` | config | zarr |
| `satellite_ghrsst_l3s_6day_daynighttime_single_sensor_australia` | `023ae12a-8c0c-4abc-997a-7884f9fec9cd` | config | zarr |
| `satellite_ghrsst_l3s_6day_daytime_multi_sensor_australia` | `f07c3d3f-547b-4818-9d2f-12e872c7e158` | config | zarr |
| `satellite_ghrsst_l3s_6day_daytime_single_sensor_australia` | `a5cad244-c33e-4083-b8a9-09ef59500b3d` | config | zarr |
| `satellite_ghrsst_l3s_6day_nighttime_multi_sensor_australia` | `e1908591-b3cf-42aa-a32f-424322b28165` | config | zarr |
| `satellite_ghrsst_l3s_6day_nighttime_single_sensor_australia` | `f9d6616a-f359-4418-979a-e7b89b5b9086` | config | zarr |
| `satellite_ghrsst_l4_gamssa_1day_multi_sensor_world` | `2d496463-600c-465a-84a1-8a4ab76bd505` | config | zarr |
| `satellite_ghrsst_l4_ramssa_1day_multi_sensor_australia` | `a4170ca8-0942-4d13-bdb8-ad4718ce14bb` | config | zarr |
| `satellite_nanoplankton_fraction_oc3_1day_aqua` | `9fde091c-9d38-4b2f-ba23-c262c21a41a2` | config | zarr |
| `satellite_net_primary_productivity_gsm_1day_aqua` | `27cc65c0-d453-4ba3-a0d6-55e4449fee8c` | config | zarr |
| `satellite_net_primary_productivity_oc3_1day_aqua` | `b35b829c-9149-46c6-9e25-d0fd03463280` | config | zarr |
| `satellite_optical_water_type_1day_aqua` | `60e57a2e-f88c-4b18-a3a1-1164c6259a10` | config | zarr |
| `satellite_optical_water_type_1day_noaa20` | `5f359ca7-396a-4c1a-8388-77a50ad39859` | config | zarr |
| `satellite_optical_water_type_1day_snpp` | `8f44f09a-07a3-4f9b-ba26-2fc4983fef69` | config | zarr |
| `satellite_picoplankton_fraction_oc3_1day_aqua` | `bc428d0b-eff7-41b9-8d4c-10e666ee1312` | config | zarr |
| `satellite_sst_1day_aqua` | `468f550b-bbd8-42b1-91b5-313d5898d9e6` | config | zarr |
| `satellite_sst_1day_snpp` | `8e00907f-716d-4080-b212-534fcd78a602` | config | zarr |
| `satellite_wind_altimeter_delayed_qc` | `b02b929f-2caf-45d4-ac60-d4632b7ca0ca` | config | zarr |
| `slocum_glider_delayed_qc` | `c317b0fe-02e8-4ff9-96c9-563fd58e82ac` | co file | parquet |
| `station_lucinda_jetty_daily_satlantic_hyperocr` | `4ac6bf81-cd37-4611-8da8-4d5ae5e2bda3` | config | zarr |
| `station_lucinda_jetty_daily_satlantic_hyperocr_derived_product` | `4ac6bf81-cd37-4611-8da8-4d5ae5e2bda3` | config | zarr |
| `station_lucinda_jetty_daily_wetlabs_acs` | `4ac6bf81-cd37-4611-8da8-4d5ae5e2bda3` | config | zarr |
| `station_lucinda_jetty_daily_wetlabs_bb9` | `4ac6bf81-cd37-4611-8da8-4d5ae5e2bda3` | config | zarr |
| `station_lucinda_jetty_daily_wetlabs_ecotriplet` | `4ac6bf81-cd37-4611-8da8-4d5ae5e2bda3` | config | parquet |
| `station_lucinda_jetty_daily_wetlabs_wqm` | `4ac6bf81-cd37-4611-8da8-4d5ae5e2bda3` | config | parquet |
| `station_lucinda_jetty_dalec` | `4ac6bf81-cd37-4611-8da8-4d5ae5e2bda3` | config | zarr |
| `station_lucinda_jetty_dalec_derived_product` | `4ac6bf81-cd37-4611-8da8-4d5ae5e2bda3` | config | zarr |
| `station_lucinda_jetty_hourly_satlantic_hyperocr` | `4ac6bf81-cd37-4611-8da8-4d5ae5e2bda3` | config | zarr |
| `station_lucinda_jetty_hourly_wetlabs_acs` | `4ac6bf81-cd37-4611-8da8-4d5ae5e2bda3` | config | zarr |
| `station_lucinda_jetty_hourly_wetlabs_ecotriplet` | `4ac6bf81-cd37-4611-8da8-4d5ae5e2bda3` | config | parquet |
| `station_lucinda_jetty_hourly_wetlabs_wqm` | `4ac6bf81-cd37-4611-8da8-4d5ae5e2bda3` | config | parquet |
| `station_nrs_wireless_sensor_network_realtime_qc` | `006bb7dc-860b-4b89-bf4c-6bd930bd35b7` | config | parquet |
| `station_wireless_sensor_network_delayec_qc` | `4260aa0a-0d0a-4dd0-9ebc-74d2bf937e21` | config | parquet |
| `vessel_air_sea_flux_product_delayed` | `07818819-2e5c-4a12-9395-0082b57b2fe8` | config | parquet |
| `vessel_air_sea_flux_sst_meteo_realtime` | `9436802f-ed93-4660-be50-e77c3c07bd09` | config | parquet |
| `vessel_bio_optical_absorption_delayed_qc` | `97b9fe73-ee44-437f-b2ae-5b8613f81042` | config | parquet |
| `vessel_bio_optical_backscattering_delayed_qc` | `97b9fe73-ee44-437f-b2ae-5b8613f81042` | config | parquet |
| `vessel_bio_optical_pigment_delayed_qc` | `97b9fe73-ee44-437f-b2ae-5b8613f81042` | config | parquet |
| `vessel_bio_optical_suspended_matter_delayed_qc` | `97b9fe73-ee44-437f-b2ae-5b8613f81042` | config | parquet |
| `vessel_co2_delayed_qc` | `63db5801-cc19-40ef-83b3-85ccba884cf7` | config | parquet |
| `vessel_co2_realtime_nonqc` | `9e5c3031-a026-48b3-a153-a70c2e2b78b9` | config | parquet |
| `vessel_ctd_profiles_delayed_qc` | `7b901002-b1dc-46c3-89f2-b4951cedca48` | config | parquet |
| `vessel_ctd_profiles_delayed_qc_backup` | `7b901002-b1dc-46c3-89f2-b4951cedca48` | co file | parquet |
| `vessel_fishsoop_realtime_qc` | `bdb84466-dc53-49ad-a60f-83d9fa0baed5` | config | parquet |
| `vessel_nrs_ctd_profiles_delayed_qc` | `7b901002-b1dc-46c3-89f2-b4951cedca48` | co file | parquet |
| `vessel_satellite_radiance_delayed_qc` | `28f8bfed-ca6a-472a-84e4-42563ce4df3f` | config | zarr |
| `vessel_satellite_radiance_derived_product` | `28f8bfed-ca6a-472a-84e4-42563ce4df3f` | config | zarr |
| `vessel_sst_delayed_qc` | `67f0b6ea-518f-4af5-9d21-dd3c08c7cb5c` | config | parquet |
| `vessel_sst_realtime_nonqc` | `ca15915b-38c5-4e95-8d25-9cc42c4dd485` | config | parquet |
| `vessel_trv_realtime_qc` | `8af21108-c535-43bf-8dab-c1f45a26088c` | config | parquet |
| `vessel_xbt_delayed_qc` | `911f6b96-fa33-4621-9d8c-4d1cc14d94d0` | config | parquet |
| `vessel_xbt_realtime_nonqc` | `35234913-aa3c-48ec-b9a4-77f822f66ef8` | config | parquet |
| `wave_buoy_delayed_qc` | `2807f3aa-4db0-4924-b64b-354ae8c10b58` | config | parquet |
| `wave_buoy_realtime_nonqc` | `b299cdcd-3dee-48aa-abdd-e0fcdbb9cadc` | config | parquet |


---

*Tested by the AODN QA/QC team on 2026-08-28 at 10:55 AEST with `update_co_uuid_reference.py`*
