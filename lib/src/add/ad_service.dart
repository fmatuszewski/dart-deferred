import 'package:angular/angular.dart';
import 'adds/hero_job_ad.component.dart';
import 'adds/hero_profile_ad.component.dart';
import 'ad_item.dart';
import 'ad_component.dart';

@Injectable()
class AdService {
  getAds() {
    return [
      new AdItem(HeroProfileComponent, new ComponentData('Bombasto', 'Brave as they come','','')),
      new AdItem(HeroProfileComponent,  new ComponentData('Dr IQ', '','Smart as they come','') ),
      new AdItem(HeroJobAdComponent,    new ComponentData('', 'Hiring for several positions','','')),
      new AdItem(HeroJobAdComponent,    new ComponentData('', 'Hiring for several positions','','')),
    ];
  }
}
