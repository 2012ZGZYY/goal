set(GOAL_SOURCES
goal_control.cpp
goal_disc.cpp
goal_nested.cpp
goal_sol_info.cpp
goal_states.cpp
goal_integrator.cpp
goal_displacement.cpp
goal_pressure.cpp
goal_scalar_weight.cpp
goal_vector_weight.cpp
goal_pressure_adjoint.cpp
goal_displacement_adjoint.cpp
goal_kinematics.cpp
goal_model.cpp
goal_elastic.cpp
goal_neohookean.cpp
goal_J2.cpp
goal_mixed.cpp
goal_temp.cpp
goal_bforce.cpp
goal_mresidual.cpp
goal_presidual.cpp
goal_stabilization.cpp
goal_qoi.cpp
goal_point_wise.cpp
goal_avg_disp.cpp
goal_avg_disp_subdomain.cpp
goal_von_mises.cpp
goal_avg_vm.cpp
goal_ks_vm.cpp
goal_assembly.cpp
goal_dbcs.cpp
goal_tbcs.cpp
goal_ibcs.cpp
goal_linear_solve.cpp
goal_mechanics.cpp
goal_primal.cpp
goal_functional.cpp
goal_nested_adjoint.cpp
goal_dissipation.cpp
goal_error.cpp
goal_size_field.cpp
goal_output.cpp
goal_regression.cpp
)

set(GOAL_HEADERS
goal_scalar_types.hpp
goal_data_types.hpp
goal_eval_modes.hpp
goal_control.hpp
goal_disc.hpp
goal_nested.hpp
goal_sol_info.hpp
goal_states.hpp
goal_integrator.hpp
goal_displacement.hpp
goal_pressure.hpp
goal_scalar_weight.hpp
goal_vector_weight.hpp
goal_pressure_adjoint.hpp
goal_displacement_adjoint.hpp
goal_kinematics.hpp
goal_model.hpp
goal_elastic.hpp
goal_neohookean.hpp
goal_J2.hpp
goal_mixed.hpp
goal_temp.hpp
goal_bforce.hpp
goal_mresidual.hpp
goal_presidual.hpp
goal_stabilization.hpp
goal_qoi.hpp
goal_point_wise.hpp
goal_avg_disp.hpp
goal_avg_disp_subdomain.hpp
goal_von_mises.hpp
goal_avg_vm.hpp
goal_ks_vm.hpp
goal_assembly.hpp
goal_dbcs.hpp
goal_tbcs.hpp
goal_ibcs.hpp
goal_linear_solve.hpp
goal_mechanics.hpp
goal_primal.hpp
goal_functional.hpp
goal_nested_adjoint.hpp
goal_dissipation.hpp
goal_error.hpp
goal_size_field.hpp
goal_output.hpp
goal_regression.hpp
)

add_library(GOAL ${GOAL_SOURCES} ${GOAL_HEADERS})
target_compile_definitions(GOAL PUBLIC
  "-DGOAL_FAD_SIZE=${GOAL_FAD_SIZE}")
if(GOAL_ENABLE_SNAPPING)
  target_compile_definitions(GOAL PUBLIC
    "-DGOAL_ENABLE_SNAPPING=1")
endif()
target_include_directories(GOAL PUBLIC
  ${Trilinos_INCLUDE_DIRS}
  ${Trilinos_TPL_INCLUDE_DIRS}
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)
target_link_libraries(GOAL PUBLIC
  ${Trilinos_LIBRARIES}
  ${Trilinos_TPL_LIBRARIES}
  ${Trilinos_EXTRA_LD_FLAGS}
  SCOREC::core)
bob_export_target(GOAL)

function(add_exe exename exesrc)
  add_executable(${exename} ${exesrc})
  target_link_libraries(${exename} PRIVATE GOAL)
  bob_export_target(${exename})
endfunction()

add_exe(GoalPrimal main_primal.cpp)
add_exe(GoalSPR main_spr.cpp)
add_exe(GoalNested main_nested.cpp)
add_exe(GoalDissipation main_dissipation.cpp)

bob_end_subdir()
