import 'package:flutter/material.dart';

class FlightProgressForAppBarWidget extends StatefulWidget {
  final dynamic model;
  final bool isFlightAllowEditing;
  const FlightProgressForAppBarWidget({
    Key? key,
    required this.model,
    this.isFlightAllowEditing = true,
  }) : super(key: key);

  @override
  _FlightProgressForAppBarWidgetState createState() =>
      _FlightProgressForAppBarWidgetState();
}

class _FlightProgressForAppBarWidgetState
    extends State<FlightProgressForAppBarWidget> {
  int progressCount = 8;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // showModalSideSheet(
        //   context: context,
        //   width: size.width * 0.3,
        //   barrierDismissible: true,
        //   withCloseControll: false,
        //   body: _sideFlightProgressIndicator(),
        // );
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildProgressItem(
              size,
              'Activation',
              widget.model?.activeTerminal ?? false,
            ),
            _buildProgressItem(
              size,
              'Landing',
              widget.model?.landing ?? false,
            ),
            _buildProgressItem(
              size,
              'Chocks On',
              widget.model?.chockOn ?? false,
            ),
            _buildProgressItem(
              size,
              'Cupps/Ny',
              widget.model?.checkingPassengers ?? false,
            ),
            _buildProgressItem(
              size,
              'Cargo And Mail',
              (widget.model?.mail ?? false) && (widget.model?.cargo ?? false),
            ),
            _buildProgressItem(
              size,
              'First Class',
              widget.model?.firstClassPassengers ?? false,
            ),
            _buildProgressItem(
              size,
              'Services',
              widget.model?.firstClassPassengers ?? false,
            ),
            _buildProgressItem(
              size,
              'Chocks off',
              widget.model?.chockOff ?? false,
            ),
            _buildProgressItem(
              size,
              'Airline Approval',
              widget.model?.companySign ?? false,
            ),
            _buildProgressItem(
              size,
              'Airport Approval',
              widget.model?.airportOfficer ?? false,
            ),
            _buildProgressItem(
              size,
              'Take-Off',
              widget.model?.takeOff ?? false,
            ),
            // _buildProgressItem(
            //   size,
            //   'Take-Off',
            //   widget.model?.takeOff ?? false,
            // ),
          ],
        ),
      ),
    );
  }

//!customProgressCount
  _buildProgressItem(Size size, String title, bool value,
      [int? customProgressCount]) {
    // final _settingsProvider = Provider.of<SettingsProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width:
                ((size.width * 0.92) / (customProgressCount ?? progressCount)),
            height: 3.5,
            decoration: BoxDecoration(
              color: value ? const Color(0xFF7F7FD5) : const Color(0xFFC1C9D2),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: value
                          ? const Color(0xFF7F7FD5)
                          : const Color(0xFFC1C9D2),
                      width: value ? 4 : 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(width: 3),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade900,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Text _buildTitleWidget() {
    return const Text(
      'Flight Progress',
      style: TextStyle(
        fontSize: 23,
        color: Color(0xFF4F4F4F),
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _sideFlightProgressIndicator() {
    return Builder(builder: (context) {
      // final _settingsProvider = Provider.of<SettingsProvider>(context);
      return Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleWidget(),
            Expanded(
              child: Stepper(
                physics: const BouncingScrollPhysics(),
                type: StepperType.vertical,
                controlsBuilder: (_, c) => const SizedBox(),
                currentStep: 11,
                steps: [
                  _buildStepItem(
                    'Landing',
                    widget.model?.landing,
                    widget.model?.landingTime,
                  ),
                  _buildStepItem(
                    'Chocks On',
                    widget.model?.chockOn,
                    widget.model?.chockOnTime,
                  ),
                  _buildStepItem(
                    'Active Terminal',
                    widget.model?.activeTerminal,
                    widget.model?.activeTerminalTime,
                  ),
                  _buildStepItem(
                    'Checking Passenger',
                    widget.model?.checkingPassengers,
                    widget.model?.checkingPassengersTime,
                  ),
                  _buildStepItem(
                    'First Class',
                    widget.model?.firstClassPassengers,
                    widget.model?.firstClassPassengersTime,
                  ),
                  _buildStepItem(
                    'Cargo',
                    widget.model?.cargo,
                    widget.model?.cargoTime,
                  ),
                  _buildStepItem(
                    'Mail',
                    widget.model?.mail,
                    widget.model?.mailTime,
                  ),
                  _buildStepItem(
                    'Services',
                    widget.model?.services,
                    widget.model?.servicesTime,
                  ),
                  _buildStepItem(
                    'Chocks Off',
                    widget.model?.chockOff,
                    widget.model?.chockOffTime,
                  ),
                  _buildStepItem(
                    'Airline Approval',
                    widget.model?.companySign,
                    widget.model?.companySignTime,
                  ),
                  _buildStepItem(
                    'Airport Approval',
                    widget.model?.airportOfficer,
                    widget.model?.airportOfficerTime,
                  ),
                  _buildStepItem(
                    'Take-Off',
                    widget.model?.takeOff,
                    widget.model?.takeOffTime,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Step _buildStepItem(String title, bool? isActive, String? time) {
    // final timeOfDay = time != null
    //     ? TimeOfDay(
    //         hour: int.parse(time.split(":")[0]),
    //         minute: int.parse(time.split(":")[1]))
    //     : null;
    // final _settingsProvider = Provider.of<SettingsProvider>(context);
    return Step(
      isActive: isActive ?? false,
      state: isActive ?? false ? StepState.complete : StepState.disabled,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: time != null ? Text(time.substring(0, time.length - 3)) : null,
      content: const SizedBox(),
    );
  }
}
