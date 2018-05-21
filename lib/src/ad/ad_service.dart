import 'package:angular/angular.dart';
import 'adds/hero_job.dart';
import 'adds/hero_profile.dart';
import 'ad_item.dart';
import 'ad_component.dart';

@Injectable()
class AdService {
  List<AdItem> getAds() {
    return [
      new AdItem(HeroProfileComponent, new ComponentData('Bombasto', 'Brave as they come','','')),
      new AdItem(HeroProfileComponent,  new ComponentData('Dr IQ', '','Smart as they come','') ),
      new AdItem(HeroJobComponent,    new ComponentData('', 'Hiring for several positions','Anguar Programmer','Dont wait apply now')),
      new AdItem(HeroJobComponent,    new ComponentData('', 'Hiring for several positions now','DWH developer','Join our team.')),
    ];

  }

}
