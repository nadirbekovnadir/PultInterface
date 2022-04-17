#Base
add_headers(
    SensorsProcessor.h
    SensorsProvider.h
)

#Pressure
add_headers(
    MS5837_RPS_Processor.h
    MS5837_RPS_Provider.h
)

add_sources(
    MS5837_RPS_Processor.cpp
    MS5837_RPS_Provider.cpp
)

#IMU
add_headers(
    VN100_IMU_Processor.h
    VN100_IMU_Provider.h
)

add_sources(
    VN100_IMU_Processor.cpp
    VN100_IMU_Provider.cpp
)

propagate_to_parent()
