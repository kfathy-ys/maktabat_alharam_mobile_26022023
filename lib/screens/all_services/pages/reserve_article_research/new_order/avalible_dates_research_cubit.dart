import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'avalible_dates_research_state.dart';

class AvalibleDatesResearchCubit extends Cubit<AvalibleDatesResearchState> {
  AvalibleDatesResearchCubit() : super(AvalibleDatesResearchInitial());
}
