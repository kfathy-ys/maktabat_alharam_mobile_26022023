import 'package:bloc/bloc.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/new_order/models/all_university.dart';
import 'package:meta/meta.dart';

part 'all_uni_state.dart';

class AllUniCubit extends Cubit<AllUniState> {
  AllUniCubit() : super(AllUniInitial());
  AllUni? typeUniId;

  void onUniTypeChanged(AllUni value) => typeUniId = value;
}
