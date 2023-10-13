import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alpha_eye/data/repos/scan_repo.dart';

import '../../../data/data.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  final _scanRepo = ScanRepository();
  ScanBloc() : super(ScanInitial()) {
    on<ScanFileEvent>((event, emit) async {
      emit(ScanLoading());
      try {
        final res = await _scanRepo.scan(file: event.file);
        if (res.success) {
          emit(
            GetScanDetailsSuccess(res.data!),
          );
        } else {
          emit(ScanError(res.message));
        }
      } catch (e) {
        emit(ScanError(e.toString()));
      }
    });
    on<GetScanHistoryEvent>((event, emit) async {
      emit(ScanLoading());
      try {
        final res = await _scanRepo.getScanHistory();
        if (res.success) {
          emit(
            GetScanHistorySuccess(res.data!),
          );
        } else {
          emit(ScanError(res.message));
        }
      } catch (e) {
        emit(ScanError(e.toString()));
      }
    });
  }
}
