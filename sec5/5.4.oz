%% 5.4 並列性のためのプログラム設計
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 並列コンポーネントを使う，コンポーネントベースプログラミング
% 4.3.5では論理ゲートを例として扱ったが今回はもっと汎用．


%% 5.4.1 並列コンポーネントを使うプログラミング
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 第一歩: きちんと定義された方法で相互作用する並列アクティビティの集合として
%         アプリケーションをモデル化すること
% 並列コンポーネントは「エージェント(agent)」と呼ばれることもある

% 入出力はポート．手続きによって並列コンポーネントをモデル化する．手続きは合成的で，任意個の入力と出力を持てる．
% インターフェイス: 並列コンポーネントはコレを通じて環境と相互作用する．ワイヤ(wire)．

% 基本操作
%   1. 具体化(Instantiation, なのでインスタンス化というべきか)
%   2. 合成(Composition)
%   3. リンク(Linking): 入力と出力を結び付ける
%   4. 制限(Restriction): 入出力の可視性を合成コンポーネントの内部に制限する

% latch: かんぬき
declare
proc {Latch C DI ?DO}
   % これらはwireで，このコンポーネント内部に「制限」されてる
   X Y Z F
in
   {DelayG DO F}
   {AndG F C X} % Andゲートの出力Xは...
   {NotG C Z}
   {AndG Z DI Y}
   {OrG X Y DO} % Orゲートの入力Xとなる．リンクされる．
end

% 実際に書いてみると特に新しい言語要件はない．


%% 5.4.2 設計方法
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 仕様は形式張らずしかし正確に書き下す
% コンポーネント(並列アクティビティ)を残らず書き下す
% メッセージプロトコルを決める
% 各コンポーネントの状態ダイアグラムを書く
% 言語はおこのみで
% コンポーネント間の並列性を実装するためのスケジューリングアルゴリズムを決定


%% 5.4.3 並列性パターンとしての機能的構成要素
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% リスト操作とメッセージプロトコルは似たようなもん．