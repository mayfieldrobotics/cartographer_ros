-- Copyright 2016 The Cartographer Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

include "trajectory_builder.lua"
include "sparse_pose_graph.lua"

options = {
  sparse_pose_graph = SPARSE_POSE_GRAPH,
  trajectory_builder = TRAJECTORY_BUILDER,
  map_frame = "map",
  odom_frame = "odom",
  tracking_frame = "base_footprint",
  provide_odom_frame = true,
  expect_odometry_data = true,
  publish_occupancy_grid = true,
  laser_min_range = 0.,
  laser_max_range = 5.,
  laser_missing_echo_ray_length = 5.,
  lookup_transform_timeout = 0.01,
  submap_publish_period_sec = 0.3,
  pose_publish_period_sec = 5e-3,
  use_laser_scan_2d = true,
}

options.trajectory_builder.expect_imu_data = false
options.trajectory_builder.use_online_correlative_scan_matching = true
options.trajectory_builder.real_time_correlative_scan_matcher.linear_search_window = 0.05
options.trajectory_builder.real_time_correlative_scan_matcher.translation_delta_cost_weight = .5
options.trajectory_builder.ceres_scan_matcher.occupied_space_cost_functor_weight = 40
options.trajectory_builder.ceres_scan_matcher.previous_pose_translation_delta_cost_functor_weight = 0.1
options.trajectory_builder.ceres_scan_matcher.initial_pose_estimate_rotation_delta_cost_functor_weight = 50
options.trajectory_builder.pose_tracker.position_model_variance = 0.008

return options
