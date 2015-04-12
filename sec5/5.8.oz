%% 5.8 進んだ話題
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% 5.8.1 非決定性並列モデル

% 宣言的並列モデルとメッセージ伝達並列モデルの中間の表現力．
% メッセージ伝達並列モデルよりも表現力は劣るが，その代わり"論理的意味"を持つ(第9章参照)．

% 宣言的並列モデルにたったひとつ非決定性選択 {WaitTwo <x> <y> <z>} を加える．

% 宣言的並列モデルの根本的な限界:
% 「ストリームオブジェクトが入力ストリームにアクセスするパターンが一定であること」
% 2つのストリームが同じストリームオブジェクトに独立に供給することはできない．

% booksuppl.oz よりWaitTwoの実装抽出... Record.waitOrとは?
fun {WaitTwo X Y}
   {Record.waitOr X#Y}
end

% 例外を使うWaitTwo
fun {WaitTwo A B}
   X in
   thread {Wait A} try X=1 catch _ then skip end end
   thread {Wait B} try X=2 catch _ then skip end end
   X
end

% IsDetを使うWaitTwo
fun {WaitTwo A B}
   U in
   thread {Wait A} U=unit end
   thread {Wait B} U=unit end
   {Wait U}
   if {IsDet A} then 1 else 2 end
end
