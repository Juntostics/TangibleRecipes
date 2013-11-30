//
//  TRRecipeDictonary.m
//  TangibleRecipe
//


#import "TRRecipeDictonary.h"
#import "TRFood.h"

@implementation TRRecipeDictonary
NSDictionary *recipesDictionary;

-(void)initDictonary{
    //AutoGenerated using process.rb-----
    recipesDictionary = @{@"ご飯+たまご" : @[[[TRFood alloc] initWithName:@"天津飯・天津丼" id:@"13-119-882" andDescription:@"天津(あまつ)飯(めし)という名(な)でも呼ばれる(よばれる)が、内容(ないよう)や味(あじ)は地域(ちいき)、店(みせ)により違い(ちがい)がある。"], [[TRFood alloc] initWithName:@"オムライス" id:@"14-121-553" andDescription:@"オムライス は、日本(にっぽん)で生まれ(うまれ)た米飯(べいはん)料理(りょうり)である。ケチャップで味付け(あじつけ)したチキンライス。"], [[TRFood alloc] initWithName:@"ロコモコ" id:@"14-125-569" andDescription:@"ロコモコ (locomoco、Loco Moco) は、ハワイの料理(りょうり)のひとつ。日本(にっぽん)の丼もの(どんぶりもの)に近い(ちかい)。日本語化(にほんごか)してロコモコ丼(どん)と呼ぶ(よぶ)こともある。"], [[TRFood alloc] initWithName:@"カツ丼" id:@"14-130-542" andDescription:@"カツ丼(かつどん)は、丼(どんぶり)に盛っ(もっ)た飯(めし)の上(うえ)に調理(ちょうり)した豚カツ(とんかつ)を乗せ(のせ)た日本(にっぽん)の丼(どんぶり)料理(りょうり)である。一般的(いっぱんてき)には豚カツ(とんかつ)を割下(わりした)で調味(ちょうみ)し鶏卵(けいらん)とじにした具(ぐ)を丼飯(どんぶりめし)の上(うえ)にのせた料理(りょうり)である。"], [[TRFood alloc] initWithName:@"あんかけチャーハン" id:@"14-131-892" andDescription:@"あんかけのチャーハン。"], [[TRFood alloc] initWithName:@"クッパ" id:@"14-133-758" andDescription:@"クッパ"]],
                          @"ご飯+とり肉" : @[[[TRFood alloc] initWithName:@"チキンライス" id:@"14-122-552" andDescription:@"チキンライスとは、細切れ(こまぎれ)の鶏肉(とりにく)を混ぜ(まぜ)た米飯(べいはん)をトマトケチャップで味付け(あじつけ)した、日本(にっぽん)の焼き飯(やきめし)料理(りょうり)である。"], [[TRFood alloc] initWithName:@"パエリア" id:@"14-126-303" andDescription:@"パエリアまたはパエージャは、米どころ(こめどころ)として知ら(しら)れるスペイン東部(とうぶ)バレンシア地方(ちほう)発祥(はっしょう)の、米(べい)と野菜(やさい)、魚介類(ぎょかいるい)、肉(にく)などを炊き込ん(たきこん)だ料理(りょうり)。スペインを代表(だいひょう)する世界的(せかいてき)に人気(にんき)の料理(りょうり)の一つ(ひとつ)で、本場(ほんば)バレンシア地方(ちほう)ではパエリアの祭り(まつり)もある。"], [[TRFood alloc] initWithName:@"鶏丼" id:@"14-130-545" andDescription:@"とりにくをご飯(ごはん)の上(うえ)にのせて，甘い(あまい)たれをかけた料理(りょうり)"]],
                          @"ご飯+にんじん" : @[[[TRFood alloc] initWithName:@"クッパ" id:@"14-133-758" andDescription:@"クッパ"]],
                          @"ご飯+にんにく" : @[[[TRFood alloc] initWithName:@"パエリア" id:@"14-126-303" andDescription:@"パエリアまたはパエージャは、米どころ(こめどころ)として知ら(しら)れるスペイン東部(とうぶ)バレンシア地方(ちほう)発祥(はっしょう)の、米(べい)と野菜(やさい)、魚介類(ぎょかいるい)、肉(にく)などを炊き込ん(たきこん)だ料理(りょうり)。スペインを代表(だいひょう)する世界的(せかいてき)に人気(にんき)の料理(りょうり)の一つ(ひとつ)で、本場(ほんば)バレンシア地方(ちほう)ではパエリアの祭り(まつり)もある。"]],
                          @"ご飯+ぶた肉" : @[[[TRFood alloc] initWithName:@"豚丼" id:@"14-130-544" andDescription:@"豚丼(ぶたどん)とは、豚肉(ぶたにく)を調理(ちょうり)したものをどんぶりご飯(ごはん)の上(うえ)に載せ(のせ)た丼物(どんぶりもの)料理(りょうり)。"]],
                          @"ご飯+トマト" : @[[[TRFood alloc] initWithName:@"タコライス" id:@"14-124-568" andDescription:@"タコライス (Taco-Rice) は、タコスの具(ぐ)である挽肉(ひきにく)・チーズ・レタス・トマトを米飯(べいはん)の上(うえ)に載せ(のせ)た沖縄(おきなわ)料理(りょうり)。辛み(からみ)をつけたサルサを乗せ(のせ)て食べる(たべる)。"]],
                          @"ご飯+牛乳" : @[[[TRFood alloc] initWithName:@"リゾット" id:@"14-133-351" andDescription:@"リゾット(Risotto)はもともとイタリアで食べ(たべ)られてきた麦類(むぎるい)の料理(りょうり)に東洋(とうよう)から伝播(でんぱ)した米(こめ)が融合(ゆうごう)した料理(りょうり)である。イタリアでは下記(かき)の料理法(りょうりほう)で調理(ちょうり)した米料理(こめりょうり)のみを指す(さす)が、フランスではピラフの別名(べつめい)として用い(もちい)られてきた。"], [[TRFood alloc] initWithName:@"ドリア" id:@"14-135-143" andDescription:@"ドリア (Doria) は、米(べい)を使っ(つかっ)た料理(りょうり)のひとつ。ピラフなど米飯(べいはん)の上(うえ)にベシャメルソースをかけてオーブンで焼い(やい)た料理(りょうり)。"]],
                          @"ご飯+玉ねぎ" : @[[[TRFood alloc] initWithName:@"オムライス" id:@"14-121-553" andDescription:@"オムライス は、日本(にっぽん)で生まれ(うまれ)た米飯(べいはん)料理(りょうり)である。ケチャップで味付け(あじつけ)したチキンライス。"], [[TRFood alloc] initWithName:@"チキンライス" id:@"14-122-552" andDescription:@"チキンライスとは、細切れ(こまぎれ)の鶏肉(とりにく)を混ぜ(まぜ)た米飯(べいはん)をトマトケチャップで味付け(あじつけ)した、日本(にっぽん)の焼き飯(やきめし)料理(りょうり)である。"], [[TRFood alloc] initWithName:@"タコライス" id:@"14-124-568" andDescription:@"タコライス (Taco-Rice) は、タコスの具(ぐ)である挽肉(ひきにく)・チーズ・レタス・トマトを米飯(べいはん)の上(うえ)に載せ(のせ)た沖縄(おきなわ)料理(りょうり)。辛み(からみ)をつけたサルサを乗せ(のせ)て食べる(たべる)。"], [[TRFood alloc] initWithName:@"ロコモコ" id:@"14-125-569" andDescription:@"ロコモコ (locomoco、Loco Moco) は、ハワイの料理(りょうり)のひとつ。日本(にっぽん)の丼もの(どんぶりもの)に近い(ちかい)。日本語化(にほんごか)してロコモコ丼(どん)と呼ぶ(よぶ)こともある。"], [[TRFood alloc] initWithName:@"パエリア" id:@"14-126-303" andDescription:@"パエリアまたはパエージャは、米どころ(こめどころ)として知ら(しら)れるスペイン東部(とうぶ)バレンシア地方(ちほう)発祥(はっしょう)の、米(べい)と野菜(やさい)、魚介類(ぎょかいるい)、肉(にく)などを炊き込ん(たきこん)だ料理(りょうり)。スペインを代表(だいひょう)する世界的(せかいてき)に人気(にんき)の料理(りょうり)の一つ(ひとつ)で、本場(ほんば)バレンシア地方(ちほう)ではパエリアの祭り(まつり)もある。"], [[TRFood alloc] initWithName:@"ピラフ" id:@"14-127-142" andDescription:@"ピラフは炒め(いため)た米(こめ)を様々(さまざま)な具(ぐ)とともに出汁(だし)で炊い(たい)た料理(りょうり)。トルコ料理(りょうり)が有名(ゆうめい)であるが、インドから中近東(ちゅうきんとう)を経(へ)て、南欧(なんおう)ギリシャにまで幅広く(はばひろく)見(み)られる米料理(こめりょうり)である。"], [[TRFood alloc] initWithName:@"あんかけチャーハン" id:@"14-131-892" andDescription:@"あんかけのチャーハン。"]],
                          @"たまご+にんじん" : @[[[TRFood alloc] initWithName:@"ビビンバ" id:@"14-132-352" andDescription:@"ビビンバは、韓国(かんこく)の混ぜ(まぜ)ご飯(ごはん)である。"], [[TRFood alloc] initWithName:@"クッパ" id:@"14-133-758" andDescription:@"クッパ"]],
                          @"たまご+にんにく" : @[[[TRFood alloc] initWithName:@"カルボナーラ" id:@"15-138-356" andDescription:@"カルボナーラ (Carbonara) とは「炭焼(すみやき)のパスタ」、鶏卵(けいらん)を用いる(もちいる)。"], [[TRFood alloc] initWithName:@"パッタイ" id:@"25-249-744" andDescription:@"パッタイ とは、タイで作ら(つくら)れる焼きそば(やきそば)のことである。米粉(こめこ)でできたやや太め(ふとめ)のビーフンを使用(しよう)して作る(つくる)。パッは「炒める(いためる)」、タイはタイ王国(おうこく)のこと。"]],
                          @"たまご+ぶた肉" : @[[[TRFood alloc] initWithName:@"お好み焼き" id:@"16-158-176" andDescription:@"お好み焼き(おこのみやき)は、各種(かくしゅ)の小麦粉(こむぎこ)を使用(しよう)する鉄板焼き(てっぱんやき)の一種(いっしゅ)であり日本(にっぽん)の庶民的(しょみんてき)な料理(りょうり)である。"], [[TRFood alloc] initWithName:@"スンドゥブチゲ" id:@"25-247-750" andDescription:@"スンドゥブ・チゲは食堂(しょくどう)や家庭(かてい)で一般的(いっぱんてき)かつ安価(あんか)に親しま(したしま)れている鍋料理(なべりょうり)のひとつである。"]],
                          @"たまご+牛乳" : @[[[TRFood alloc] initWithName:@"キッシュ" id:@"13-119-307" andDescription:@"キッシュは、卵(たまご)とクリームを使っ(つかっ)て作る(つくる)フランス、アルザス・ロレーヌ地方(ちほう)の郷土(きょうど)料理(りょうり)。"], [[TRFood alloc] initWithName:@"カルボナーラ" id:@"15-138-356" andDescription:@"カルボナーラ (Carbonara) とは「炭焼(すみやき)のパスタ」、鶏卵(けいらん)を用いる(もちいる)。"], [[TRFood alloc] initWithName:@"タルト" id:@"21-207-193" andDescription:@"タルト"], [[TRFood alloc] initWithName:@"プリン・プディング" id:@"21-211-197" andDescription:@"小麦粉(こむぎこ)、米(べい)、ラード、肉(にく)、卵(たまご)、牛乳(ぎゅうにゅう)、バター、果物(くだもの)などの材料(ざいりょう)を混ぜ(まぜ)て、砂糖(さとう)、塩(しお)などの調味料(ちょうみりょう)や香辛料(こうしんりょう)で味付け(あじつけ)し、煮(に)たり蒸し(むし)たり焼い(やい)たりして固め(かため)た料理(りょうり)"], [[TRFood alloc] initWithName:@"エクレア" id:@"21-212-992" andDescription:@"エクレアは、洋菓子(ようがし)のひとつ。シュークリームのバリエーションの一つ(ひとつ)で、細長く(ほそながく)焼い(やい)たシューにカスタードクリームやホイップクリームを挟み(はさみ)、上(うえ)からチョコレートをかけたものである。カスタードクリームにコーヒーやラム酒(らむしゅ)の風味(ふうみ)をつけたり、果物(くだもの)風味(ふうみ)のフィリングや栗(くり)のピュレを挟む(はさむ)こともある。"], [[TRFood alloc] initWithName:@"ホットケーキ・パンケーキ" id:@"21-215-192" andDescription:@"ホットケーキとは、小麦粉(こむぎこ)に卵(たまご)やベーキングパウダー、砂糖(さとう)、牛乳(ぎゅうにゅう)、水(みず)などを混ぜ(まぜ)、フライパンで両面(りょうめん)を焼い(やい)た料理(りょうり)。"], [[TRFood alloc] initWithName:@"ドーナッツ・ドーナツ" id:@"21-216-196" andDescription:@"ドーナツを油(あぶら)で揚げ(あげ)た食品(しょくひん)。ドーナッツとも言う(ともいう)。"], [[TRFood alloc] initWithName:@"クリームパン" id:@"22-221-207" andDescription:@"クリームパンは、菓子パン(かしぱん)の一種(いっしゅ)で、中(なか)にカスタードクリームが入って(はいって)いることを特徴(とくちょう)とする。ただし、派生(はせい)種(だね)の中(なか)には生クリーム(なまくりーむ)を使用(しよう)したものも見受け(みうけ)られる。"], [[TRFood alloc] initWithName:@"フレンチトースト" id:@"22-228-580" andDescription:@"フレンチトーストは北アメリカ(きたあめりか)、ヨーロッパの一部(いちぶ)、アジアの一部(いちぶ)の国(くに)・地域(ちいき)、ラテンアメリカなどで朝食(ちょうしょく)や軽食(けいしょく)、デザートとしてよく食べ(たべ)られているパン料理(りょうり)の1種(たね)である。溶い(とい)た鶏卵(けいらん)と牛乳(ぎゅうにゅう)などの混合液(こんごうえき)をパンに染み込ま(しみこま)せ、フライパンなどで焼き直し(やきなおし)たもので、パンがしっとりした食感(しょっかん)に変わる(かわる)。"], [[TRFood alloc] initWithName:@"チュロス" id:@"25-256-734" andDescription:@"チュロとはスペイン・ポルトガルおよびラテンアメリカ各国(かっこく)で広く(ひろく)食べ(たべ)られている揚げ(あげ)菓子(かし)である。日本(にっぽん)ではチュロおよび複数形(ふくすうけい)のチュロス (Churros) が定着(ていちゃく)している。"]],
                          @"たまご+玉ねぎ" : @[[[TRFood alloc] initWithName:@"ポテトコロッケ" id:@"13-118-867" andDescription:@"ポテトのコロッケ。"], [[TRFood alloc] initWithName:@"かぼちゃコロッケ" id:@"13-118-869" andDescription:@"かぼちゃのコロッケ。"], [[TRFood alloc] initWithName:@"さつまいもコロッケ" id:@"13-118-873" andDescription:@"さつまいものコロッケ。"], [[TRFood alloc] initWithName:@"オムレツ" id:@"13-119-644" andDescription:@"オムレツとは、代表的(だいひょうてき)な卵料理(たまごりょうり)で、鶏卵(けいらん)を溶い(とい)て、塩(しお)・胡椒(こしょう)などで味付け(あじつけ)をし、フライパンにバターをひいて手早く(てばやく)焼い(やい)たもの。卵焼き(たまごやき)と違い(ちがい)、多く(おおく)は木の葉(このは)型(がた)で丸く(まるく)盛り上がっ(もりあがっ)た形(かたち)をしている。食材(しょくざい)も作り方(つくりかた)も非常に(ひじょうに)単純(たんじゅん)であるため、世界中(せかいじゅう)どこの国(くに)でも一般(いっぱん)に作ら(つくら)れている。"], [[TRFood alloc] initWithName:@"オムライス" id:@"14-121-553" andDescription:@"オムライス は、日本(にっぽん)で生まれ(うまれ)た米飯(べいはん)料理(りょうり)である。ケチャップで味付け(あじつけ)したチキンライス。"], [[TRFood alloc] initWithName:@"ロコモコ" id:@"14-125-569" andDescription:@"ロコモコ (locomoco、Loco Moco) は、ハワイの料理(りょうり)のひとつ。日本(にっぽん)の丼もの(どんぶりもの)に近い(ちかい)。日本語化(にほんごか)してロコモコ丼(どん)と呼ぶ(よぶ)こともある。"], [[TRFood alloc] initWithName:@"親子丼" id:@"14-130-541" andDescription:@"親子丼(おやこどんぶり)は、鶏肉(とりにく)を割り下(わりした)などで煮(に)ながら卵(たまご)汁(じる)でとじ、ご飯(ごはん)の上(うえ)に乗せ(のせ)た料理(りょうり)。丼物(どんぶりもの)の一種(いっしゅ)。「親子(おやこ)」という名称(めいしょう)は鶏(にわとり)の肉(にく)と卵(たまご)を使う(つかう)ことに由来(ゆらい)する。玉ねぎ(たまねぎ)や長(なが)ねぎなどを入れる(いれる)店(みせ)もある。"], [[TRFood alloc] initWithName:@"あんかけチャーハン" id:@"14-131-892" andDescription:@"あんかけのチャーハン。"], [[TRFood alloc] initWithName:@"ナシゴレン" id:@"14-131-894" andDescription:@"ナシゴレン、ナシ・ゴレンは、インドネシアおよびマレーシアの焼き飯(やきめし)料理(りょうり)である。"], [[TRFood alloc] initWithName:@"カルボナーラ" id:@"15-138-356" andDescription:@"カルボナーラ (Carbonara) とは「炭焼(すみやき)のパスタ」、鶏卵(けいらん)を用いる(もちいる)。"], [[TRFood alloc] initWithName:@"トルティージャ・トルティーヤ" id:@"25-256-733" andDescription:@"トルティージャは、スペインのオムレツのような卵料理(たまごりょうり)を指す(さす)。"], [[TRFood alloc] initWithName:@"ハンバーグ" id:@"10-278-641" andDescription:@"ハンバーグ またはハンバーグステーキは、挽肉(ひきにく)に肉(にく)の粘り(ねばり)を出す(だす)ための塩(しお)とタマネギ等(など)の野菜類(やさいるい)のみじん切り(みじんぎり)と胡椒(こしょう)等(など)の香辛料(こうしんりょう)を加え(くわえ)、パン粉(ぱんこ)を混ぜ(まぜ)、こね合わせ(こねあわせ)たものを楕円形(だえんがた)や円形(えんけい)などに整形(せいけい)して焼い(やい)た料理(りょうり)。"], [[TRFood alloc] initWithName:@"ロールキャベツ" id:@"10-278-646" andDescription:@"ロールキャベツは、洋食(ようしょく)のひとつ。"]],
                          @"とり肉+にんじん" : @[[[TRFood alloc] initWithName:@"筑前煮・がめ煮【福岡】" id:@"25-245-679" andDescription:@"がめ煮(がめに)。"]],
                          @"とり肉+にんにく" : @[[[TRFood alloc] initWithName:@"パエリア" id:@"14-126-303" andDescription:@"パエリアまたはパエージャは、米どころ(こめどころ)として知ら(しら)れるスペイン東部(とうぶ)バレンシア地方(ちほう)発祥(はっしょう)の、米(べい)と野菜(やさい)、魚介類(ぎょかいるい)、肉(にく)などを炊き込ん(たきこん)だ料理(りょうり)。スペインを代表(だいひょう)する世界的(せかいてき)に人気(にんき)の料理(りょうり)の一つ(ひとつ)で、本場(ほんば)バレンシア地方(ちほう)ではパエリアの祭り(まつり)もある。"]],
                          @"とり肉+牛乳" : @[[[TRFood alloc] initWithName:@"チキングラタン" id:@"15-149-907" andDescription:@"チキンのグラタン。"]],
                          @"とり肉+玉ねぎ" : @[[[TRFood alloc] initWithName:@"チキンライス" id:@"14-122-552" andDescription:@"チキンライスとは、細切れ(こまぎれ)の鶏肉(とりにく)を混ぜ(まぜ)た米飯(べいはん)をトマトケチャップで味付け(あじつけ)した、日本(にっぽん)の焼き飯(やきめし)料理(りょうり)である。"], [[TRFood alloc] initWithName:@"パエリア" id:@"14-126-303" andDescription:@"パエリアまたはパエージャは、米どころ(こめどころ)として知ら(しら)れるスペイン東部(とうぶ)バレンシア地方(ちほう)発祥(はっしょう)の、米(べい)と野菜(やさい)、魚介類(ぎょかいるい)、肉(にく)などを炊き込ん(たきこん)だ料理(りょうり)。スペインを代表(だいひょう)する世界的(せかいてき)に人気(にんき)の料理(りょうり)の一つ(ひとつ)で、本場(ほんば)バレンシア地方(ちほう)ではパエリアの祭り(まつり)もある。"], [[TRFood alloc] initWithName:@"チキングラタン" id:@"15-149-907" andDescription:@"チキンのグラタン。"], [[TRFood alloc] initWithName:@"タッカルビ" id:@"25-247-754" andDescription:@"タッカルビは韓国(かんこく)の焼肉(やきにく)料理(りょうり)の一種(いっしゅ)で、鶏肉(とりにく)と野菜(やさい)を使っ(つかっ)たものである。"], [[TRFood alloc] initWithName:@"ゲーン（タイカレー）" id:@"25-249-743" andDescription:@"ゲーンあるいはケーンは、代表的(だいひょうてき)なタイ料理(りょうり)の汁物(しるもの)、スープの事(こと)。水分(すいぶん)量(りょう)や素材(そざい)は様々(さまざま)である。様々(さまざま)な香辛料(こうしんりょう)・ハーブ、水(みず)かココナッツミルク、肉(にく)・魚介類(ぎょかいるい)、野菜(やさい)や果物(くだもの)などから作ら(つくら)れる。"]],
                          @"にんじん+にんにく" : @[[[TRFood alloc] initWithName:@"ドライカレー" id:@"14-120-551" andDescription:@"ドライのカレー。ドライカレーは、日本(にっぽん)のカレーライスのバリエーションのひとつ。"], [[TRFood alloc] initWithName:@"スープカレー" id:@"14-120-566" andDescription:@"スープのカレー。スープカレーは、日本(にっぽん)のカレー料理(りょうり)のひとつ。札幌(さっぽろ)の発祥(はっしょう)であり、そのヒントになったのは中国(ちゅうごく)・朝鮮(ちょうせん)の薬膳(やくぜん)スープ、南(みなみ)インド・スリランカ・インドネシア・タイなどの汁気(しるけ)の多い(おおい)カレー等(など)である。"], [[TRFood alloc] initWithName:@"ミートソースパスタ" id:@"15-137-590" andDescription:@"ミートソースのパスタ。"], [[TRFood alloc] initWithName:@"ブイヤベース" id:@"25-252-712" andDescription:@"ブイヤベースは、南(みなみ)フランスのプロヴァンス地方(ちほう)、地中海(ちちゅうかい)沿岸(えんがん)地域(ちいき)の代表的(だいひょうてき)な海鮮(かいせん)料理(りょうり)。マルセイユの名物(めいぶつ)。"]],
                          @"にんじん+ぶた肉" : @[[[TRFood alloc] initWithName:@"ポークカレー" id:@"14-120-884" andDescription:@"ポークのカレー。"], [[TRFood alloc] initWithName:@"豚汁" id:@"17-161-790" andDescription:@"豚汁(とんじる)。"], [[TRFood alloc] initWithName:@"カレー鍋" id:@"23-234-538" andDescription:@"カレー鍋(なべ)は、和風(わふう)だしにカレーのスパイスを利かせ(きかせ)たスープを使っ(つかっ)た鍋料理(なべりょうり)の1つである。"]],
                          @"にんじん+トマト" : @[[[TRFood alloc] initWithName:@"ミネストローネ" id:@"25-250-726" andDescription:@"ミネストローネは、主に(おもに)トマトを使っ(つかっ)たイタリアの野菜(やさい)スープである。"], [[TRFood alloc] initWithName:@"ブイヤベース" id:@"25-252-712" andDescription:@"ブイヤベースは、南(みなみ)フランスのプロヴァンス地方(ちほう)、地中海(ちちゅうかい)沿岸(えんがん)地域(ちいき)の代表的(だいひょうてき)な海鮮(かいせん)料理(りょうり)。マルセイユの名物(めいぶつ)。"]],
                          @"にんじん+ベーコン" : @[[[TRFood alloc] initWithName:@"チャウダー" id:@"17-173-482" andDescription:@"チャウダーはアメリカ合衆国(がっしゅうこく)のスープの一種(いっしゅ)。"]],
                          @"にんじん+牛乳" : @[[[TRFood alloc] initWithName:@"チャウダー" id:@"17-173-482" andDescription:@"チャウダーはアメリカ合衆国(がっしゅうこく)のスープの一種(いっしゅ)。"]],
                          @"にんじん+玉ねぎ" : @[[[TRFood alloc] initWithName:@"ポークカレー" id:@"14-120-884" andDescription:@"ポークのカレー。"], [[TRFood alloc] initWithName:@"野菜カレー" id:@"14-120-564" andDescription:@"野菜のカレー。"], [[TRFood alloc] initWithName:@"ビーフカレー" id:@"14-120-885" andDescription:@"ビーフのカレー。"], [[TRFood alloc] initWithName:@"キーマカレー" id:@"14-120-563" andDescription:@"キーマのカレー。キーマカレーで「細切れ(こまぎれ)肉(にく)」または「ひき肉(ひきにく)」を意味(いみ)する。"], [[TRFood alloc] initWithName:@"ドライカレー" id:@"14-120-551" andDescription:@"ドライのカレー。ドライカレーは、日本(にっぽん)のカレーライスのバリエーションのひとつ。"], [[TRFood alloc] initWithName:@"スープカレー" id:@"14-120-566" andDescription:@"スープのカレー。スープカレーは、日本(にっぽん)のカレー料理(りょうり)のひとつ。札幌(さっぽろ)の発祥(はっしょう)であり、そのヒントになったのは中国(ちゅうごく)・朝鮮(ちょうせん)の薬膳(やくぜん)スープ、南(みなみ)インド・スリランカ・インドネシア・タイなどの汁気(しるけ)の多い(おおい)カレー等(など)である。"], [[TRFood alloc] initWithName:@"ミートソースパスタ" id:@"15-137-590" andDescription:@"ミートソースのパスタ。"], [[TRFood alloc] initWithName:@"クリームシチュー" id:@"17-163-924" andDescription:@"クリームシチュー"], [[TRFood alloc] initWithName:@"コンソメスープ" id:@"17-167-86" andDescription:@"コンソメのスープ。コンソメは、フランス料理(りょうり)におけるスープのひとつで、澄ん(すん)だスープの一種(いっしゅ)。琥珀色(こはくいろ)、浅黄色(あさぎいろ)である。"], [[TRFood alloc] initWithName:@"トマトスープ" id:@"17-168-87" andDescription:@"トマトのスープ。"], [[TRFood alloc] initWithName:@"ポトフ" id:@"17-173-483" andDescription:@"ポトフは、フランスの家庭(かてい)料理(りょうり)のひとつ。「火(ひ)にかけた鍋(なべ)」の意味(いみ)。"], [[TRFood alloc] initWithName:@"チャウダー" id:@"17-173-482" andDescription:@"チャウダーはアメリカ合衆国(がっしゅうこく)のスープの一種(いっしゅ)。"], [[TRFood alloc] initWithName:@"にんじんスープ" id:@"17-173-345" andDescription:@"にんじんのスープ。"], [[TRFood alloc] initWithName:@"豆スープ" id:@"17-173-343" andDescription:@"豆のスープ。"], [[TRFood alloc] initWithName:@"タジン鍋" id:@"23-234-628" andDescription:@"タジン地域(ちいき)の鍋料理(なべりょうり)。もともとは、料理(りょうり)の際(さい)に使わ(つかわ)れる陶製(とうせい)の土鍋(どなべ)のことを指し(さし)た。"], [[TRFood alloc] initWithName:@"チャプチェ" id:@"25-247-756" andDescription:@"チャプチェは春雨(はるさめ)を炒め(いため)た韓国(かんこく)料理(りょうり)。"], [[TRFood alloc] initWithName:@"ボルシチ" id:@"25-248-1060" andDescription:@"ボルシチ（ウクライナ語(ご): борщ , 。"], [[TRFood alloc] initWithName:@"ブイヤベース" id:@"25-252-712" andDescription:@"ブイヤベースは、南(みなみ)フランスのプロヴァンス地方(ちほう)、地中海(ちちゅうかい)沿岸(えんがん)地域(ちいき)の代表的(だいひょうてき)な海鮮(かいせん)料理(りょうり)。マルセイユの名物(めいぶつ)。"], [[TRFood alloc] initWithName:@"肉じゃが" id:@"10-275-631" andDescription:@"肉じゃが(にくじゃが)は、日本(にっぽん)の煮込み(にこみ)料理(りょうり)のひとつである。"], [[TRFood alloc] initWithName:@"酢豚" id:@"10-276-699" andDescription:@"酢豚(すぶた)(すぶた)とは、下味(したあじ)をつけた角切り(かくぎり)の豚肉(ぶたにく)を用い(もちい)、衣(ころも)をつけて油(あぶら)で揚げ(あげ)、甘酢あん(あまずあん)をからませた中華料理(ちゅうかりょうり)である。広東(かんとん)料理店(りょうりてん)が多い(おおい)欧米(おうべい)でも人気(にんき)が高い(たかい)料理(りょうり)である。長崎(ながさき)では酢(す)排骨(ぱーこー)(スーパイコ)とも呼ばれる(よばれる)(九州(きゅうしゅう)他県(たけん)の一部(いちぶ)の中華料理(ちゅうかりょうり)店(てん)でもスーパイコと表記(ひょうき)されていることもある)。"]],
                          @"にんにく+ぶた肉" : @[[[TRFood alloc] initWithName:@"サムギョプサル" id:@"25-247-753" andDescription:@"サムギョプサルとは韓国(かんこく)の肉料理(にくりょうり)のひとつ。「サム」は数字(すうじ)の3、「ギョプ」は層(そう)、「サル」は肉(にく)を表し(あらわし)、日本(にっぽん)でいう三枚肉(さんまいにく)すなわちばら肉(ばらにく)の意味(いみ)だが、一般的(いっぱんてき)に「サムギョプサル」と言え(といえ)ばこの豚(ぶた)の三枚肉(さんまいにく)の焼肉(やきにく)料理(りょうり)のことを指す(さす)。発音(はつおん)はパッチムと濃音(のうおん)化(か)で発音(はつおん)は「sam-gyeopssal」となる。"]],
                          @"にんにく+トマト" : @[[[TRFood alloc] initWithName:@"トマトソース" id:@"19-192-239" andDescription:@"トマトソースは、イタリア料理(りょうり)及び(および)洋食(ようしょく)の基本(きほん)となるソースの一つ(ひとつ)で、パスタやピザなどの食材(しょくざい)にかけたり、ブイヨンなどで薄め(うすめ)てスープにするなど、幅広く(はばひろく)使用(しよう)される。イタリア語(いたりあご)では、サルサ・ディ・ポモドーロと呼ぶ(よぶ)ことが多い(おおい)。 洋食(ようしょく)では、特に(とくに)コロッケのソースとしての利用(りよう)や、スパゲティ・ナポリタンやロールキャベツの味付け(あじつけ)で多用(たよう)される。作り方(つくりかた)も、ベーコンや複数(ふくすう)種(たね)の香味(こうみ)野菜(やさい)、鶏ガラ(とりがら)・ブイヨンでコクを出す(だす)、小麦粉(こむぎこ)でとろみを付ける(つける)等(など)、いくつか相違点(そういてん)が見(み)られる。"], [[TRFood alloc] initWithName:@"ラタトゥイユ・ラタツーユ" id:@"25-252-709" andDescription:@"ラタトゥイユ、ラタトゥユとはフランス南部(なんぶ)プロヴァンス地方(ちほう)、ニースの野菜(やさい)煮込み(にこみ)料理(りょうり)である。 玉ねぎ(たまねぎ)、ナス、ピーマン、ズッキーニといった夏野菜(なつやさい)をにんにくとオリーブ油(おりーぶゆ)で炒め(いため)て、トマトを加え(くわえ)て、オレガノ、バジル、タイムなどの香草(こうそう)とワインで煮(に)て作る(つくる)。うまみを出す(だす)ためにベーコンなどの肉類(にくるい)を入れ(はいれ)たり、唐辛子(とうがらし)を用いる(もちいる)工夫(くふう)がある。"], [[TRFood alloc] initWithName:@"ブイヤベース" id:@"25-252-712" andDescription:@"ブイヤベースは、南(みなみ)フランスのプロヴァンス地方(ちほう)、地中海(ちちゅうかい)沿岸(えんがん)地域(ちいき)の代表的(だいひょうてき)な海鮮(かいせん)料理(りょうり)。マルセイユの名物(めいぶつ)。"]],
                          @"にんにく+ベーコン" : @[[[TRFood alloc] initWithName:@"ペペロンチーノ" id:@"15-139-355" andDescription:@"アーリオ・オリオ・ペペロンチーノは料理(りょうり)でイタリア料理(りょうり)のひとつ。日本(にっぽん)ではペペロンチーノの名(な)で広く(ひろく)知ら(しら)れている。"], [[TRFood alloc] initWithName:@"きのこパスタ" id:@"15-142-904" andDescription:@"きのこのパスタ。"]],
                          @"にんにく+牛乳" : @[[[TRFood alloc] initWithName:@"カルボナーラ" id:@"15-138-356" andDescription:@"カルボナーラ (Carbonara) とは「炭焼(すみやき)のパスタ」、鶏卵(けいらん)を用いる(もちいる)。"]],
                          @"にんにく+玉ねぎ" : @[[[TRFood alloc] initWithName:@"ドライカレー" id:@"14-120-551" andDescription:@"ドライのカレー。ドライカレーは、日本(にっぽん)のカレーライスのバリエーションのひとつ。"], [[TRFood alloc] initWithName:@"スープカレー" id:@"14-120-566" andDescription:@"スープのカレー。スープカレーは、日本(にっぽん)のカレー料理(りょうり)のひとつ。札幌(さっぽろ)の発祥(はっしょう)であり、そのヒントになったのは中国(ちゅうごく)・朝鮮(ちょうせん)の薬膳(やくぜん)スープ、南(みなみ)インド・スリランカ・インドネシア・タイなどの汁気(しるけ)の多い(おおい)カレー等(など)である。"], [[TRFood alloc] initWithName:@"パエリア" id:@"14-126-303" andDescription:@"パエリアまたはパエージャは、米どころ(こめどころ)として知ら(しら)れるスペイン東部(とうぶ)バレンシア地方(ちほう)発祥(はっしょう)の、米(べい)と野菜(やさい)、魚介類(ぎょかいるい)、肉(にく)などを炊き込ん(たきこん)だ料理(りょうり)。スペインを代表(だいひょう)する世界的(せかいてき)に人気(にんき)の料理(りょうり)の一つ(ひとつ)で、本場(ほんば)バレンシア地方(ちほう)ではパエリアの祭り(まつり)もある。"], [[TRFood alloc] initWithName:@"ミートソースパスタ" id:@"15-137-590" andDescription:@"ミートソースのパスタ。"], [[TRFood alloc] initWithName:@"トマトクリーム" id:@"15-137-897" andDescription:@"トマトと牛乳(ぎゅうにゅう)をまぜたソース"], [[TRFood alloc] initWithName:@"カルボナーラ" id:@"15-138-356" andDescription:@"カルボナーラ (Carbonara) とは「炭焼(すみやき)のパスタ」、鶏卵(けいらん)を用いる(もちいる)。"], [[TRFood alloc] initWithName:@"トマトソース" id:@"19-192-239" andDescription:@"トマトソースは、イタリア料理(りょうり)及び(および)洋食(ようしょく)の基本(きほん)となるソースの一つ(ひとつ)で、パスタやピザなどの食材(しょくざい)にかけたり、ブイヨンなどで薄め(うすめ)てスープにするなど、幅広く(はばひろく)使用(しよう)される。イタリア語(いたりあご)では、サルサ・ディ・ポモドーロと呼ぶ(よぶ)ことが多い(おおい)。 洋食(ようしょく)では、特に(とくに)コロッケのソースとしての利用(りよう)や、スパゲティ・ナポリタンやロールキャベツの味付け(あじつけ)で多用(たよう)される。作り方(つくりかた)も、ベーコンや複数(ふくすう)種(たね)の香味(こうみ)野菜(やさい)、鶏ガラ(とりがら)・ブイヨンでコクを出す(だす)、小麦粉(こむぎこ)でとろみを付ける(つける)等(など)、いくつか相違点(そういてん)が見(み)られる。"], [[TRFood alloc] initWithName:@"トマト鍋" id:@"23-234-537" andDescription:@"トマト鍋(なべ)は、トマトを用い(もちい)てスープを調理(ちょうり)した鍋料理(なべりょうり)の1つである。イタリアやフランスでは、トマトを使っ(つかっ)た煮込み(にこみ)料理(りょうり)として、「ミネストローネ」「ブイヤベース」「ズッパ ディ ペシェ」など、それぞれレシピや決まっ(きまっ)た具材(ぐざい)を持ち(もち)、野菜(やさい)や魚介(ぎょかい)スープとして食さ(しょくさ)れているが、これらはトマト鍋(なべ)と全く(まったく)異なる(ことなる)ものである。あくまでも日本(にっぽん)オリジナルのものであるトマト鍋(なべ)には作り方(つくりかた)や具材(ぐざい)に決まり(きまり)はない。"], [[TRFood alloc] initWithName:@"ラタトゥイユ・ラタツーユ" id:@"25-252-709" andDescription:@"ラタトゥイユ、ラタトゥユとはフランス南部(なんぶ)プロヴァンス地方(ちほう)、ニースの野菜(やさい)煮込み(にこみ)料理(りょうり)である。 玉ねぎ(たまねぎ)、ナス、ピーマン、ズッキーニといった夏野菜(なつやさい)をにんにくとオリーブ油(おりーぶゆ)で炒め(いため)て、トマトを加え(くわえ)て、オレガノ、バジル、タイムなどの香草(こうそう)とワインで煮(に)て作る(つくる)。うまみを出す(だす)ためにベーコンなどの肉類(にくるい)を入れ(はいれ)たり、唐辛子(とうがらし)を用いる(もちいる)工夫(くふう)がある。"], [[TRFood alloc] initWithName:@"ブイヤベース" id:@"25-252-712" andDescription:@"ブイヤベースは、南(みなみ)フランスのプロヴァンス地方(ちほう)、地中海(ちちゅうかい)沿岸(えんがん)地域(ちいき)の代表的(だいひょうてき)な海鮮(かいせん)料理(りょうり)。マルセイユの名物(めいぶつ)。"]],
                          @"ぶた肉+玉ねぎ" : @[[[TRFood alloc] initWithName:@"ポークカレー" id:@"14-120-884" andDescription:@"ポークのカレー。"]],
                          @"トマト+玉ねぎ" : @[[[TRFood alloc] initWithName:@"インド風カレー" id:@"14-120-886" andDescription:@"インド風のカレー。"], [[TRFood alloc] initWithName:@"タコライス" id:@"14-124-568" andDescription:@"タコライス (Taco-Rice) は、タコスの具(ぐ)である挽肉(ひきにく)・チーズ・レタス・トマトを米飯(べいはん)の上(うえ)に載せ(のせ)た沖縄(おきなわ)料理(りょうり)。辛み(からみ)をつけたサルサを乗せ(のせ)て食べる(たべる)。"], [[TRFood alloc] initWithName:@"パスタソース" id:@"15-144-242" andDescription:@"パスタにからめて味(あじ)をつけるソース"], [[TRFood alloc] initWithName:@"トマトソース" id:@"19-192-239" andDescription:@"トマトソースは、イタリア料理(りょうり)及び(および)洋食(ようしょく)の基本(きほん)となるソースの一つ(ひとつ)で、パスタやピザなどの食材(しょくざい)にかけたり、ブイヨンなどで薄め(うすめ)てスープにするなど、幅広く(はばひろく)使用(しよう)される。イタリア語(いたりあご)では、サルサ・ディ・ポモドーロと呼ぶ(よぶ)ことが多い(おおい)。 洋食(ようしょく)では、特に(とくに)コロッケのソースとしての利用(りよう)や、スパゲティ・ナポリタンやロールキャベツの味付け(あじつけ)で多用(たよう)される。作り方(つくりかた)も、ベーコンや複数(ふくすう)種(たね)の香味(こうみ)野菜(やさい)、鶏ガラ(とりがら)・ブイヨンでコクを出す(だす)、小麦粉(こむぎこ)でとろみを付ける(つける)等(など)、いくつか相違点(そういてん)が見(み)られる。"], [[TRFood alloc] initWithName:@"ラタトゥイユ・ラタツーユ" id:@"25-252-709" andDescription:@"ラタトゥイユ、ラタトゥユとはフランス南部(なんぶ)プロヴァンス地方(ちほう)、ニースの野菜(やさい)煮込み(にこみ)料理(りょうり)である。 玉ねぎ(たまねぎ)、ナス、ピーマン、ズッキーニといった夏野菜(なつやさい)をにんにくとオリーブ油(おりーぶゆ)で炒め(いため)て、トマトを加え(くわえ)て、オレガノ、バジル、タイムなどの香草(こうそう)とワインで煮(に)て作る(つくる)。うまみを出す(だす)ためにベーコンなどの肉類(にくるい)を入れ(はいれ)たり、唐辛子(とうがらし)を用いる(もちいる)工夫(くふう)がある。"], [[TRFood alloc] initWithName:@"ブイヤベース" id:@"25-252-712" andDescription:@"ブイヤベースは、南(みなみ)フランスのプロヴァンス地方(ちほう)、地中海(ちちゅうかい)沿岸(えんがん)地域(ちいき)の代表的(だいひょうてき)な海鮮(かいせん)料理(りょうり)。マルセイユの名物(めいぶつ)。"], [[TRFood alloc] initWithName:@"ワカモレ" id:@"25-253-779" andDescription:@"ワカモレとは、メキシコ料理(りょうり)のサルサの1種(たね)である。名称(めいしょう)の由来(ゆらい)は、ナワトル語(ご)のAhuacamOlli=Ahuacatl(アボカド)+mOlli(ソース)から。なお、片仮名(かたかな)表記(ひょうき)では、グワカモーレ、ワカモーレと書か(かか)れることもあるが、本稿(ほんこう)ではワカモレに統一(とういつ)する。"], [[TRFood alloc] initWithName:@"サルサ" id:@"25-253-786" andDescription:@"サルサ"]],
                          @"ベーコン+牛乳" : @[[[TRFood alloc] initWithName:@"チャウダー" id:@"17-173-482" andDescription:@"チャウダーはアメリカ合衆国(がっしゅうこく)のスープの一種(いっしゅ)。"]],
                          @"ベーコン+玉ねぎ" : @[[[TRFood alloc] initWithName:@"ナポリタン" id:@"15-137-589" andDescription:@"ナポリタンは、ナポリの料理(りょうり)スパゲティナポレターナを模倣(もほう)し、日本(にっぽん)で独自(どくじ)進化(しんか)したパスタ料理(りょうり)である。"], [[TRFood alloc] initWithName:@"チャウダー" id:@"17-173-482" andDescription:@"チャウダーはアメリカ合衆国(がっしゅうこく)のスープの一種(いっしゅ)。"]],
                          @"牛乳+玉ねぎ" : @[[[TRFood alloc] initWithName:@"カルボナーラ" id:@"15-138-356" andDescription:@"カルボナーラ (Carbonara) とは「炭焼(すみやき)のパスタ」、鶏卵(けいらん)を用いる(もちいる)。"], [[TRFood alloc] initWithName:@"かぼちゃのグラタン" id:@"15-149-906" andDescription:@"かぼちゃののグラタン。"], [[TRFood alloc] initWithName:@"シーフードグラタン" id:@"15-149-808" andDescription:@"シーフードのグラタン。"], [[TRFood alloc] initWithName:@"チキングラタン" id:@"15-149-907" andDescription:@"チキンのグラタン。"], [[TRFood alloc] initWithName:@"かぼちゃスープ" id:@"17-173-342" andDescription:@"かぼちゃのスープ。"], [[TRFood alloc] initWithName:@"チャウダー" id:@"17-173-482" andDescription:@"チャウダーはアメリカ合衆国(がっしゅうこく)のスープの一種(いっしゅ)。"]]
                          };
    //----AutoGenerated
}

-(NSArray *)recipesFor:(NSString*)ingredient1 and:(NSString*)ingredient2
{
    if (!recipesDictionary) {
        [self initDictonary];
    }
    
    if ([ingredient1 compare:ingredient2] == NSOrderedDescending) {
        // swap
        NSString *tmp = ingredient1;
        ingredient1 = ingredient2;
        ingredient2 = tmp;
    }
    NSString *key = [ingredient1 stringByAppendingString:[@"+" stringByAppendingString:ingredient2]];
    
    return [recipesDictionary objectForKey:key];
}
@end
