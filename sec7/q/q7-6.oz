% Flavius Josephus の問題++

% a. 直列状態ありモデルを使って解く
%   a-1. 短絡なしバージョン
%   a-2. 短絡ありバージョン

% b. 異なる版の実行時間を比較せよ
%   b-1. いろいろな n, k について各モデル短絡版の実行時間を比較
%   b-2. 短絡の 3 バージョンを比較. n, k の関数として漸近的計算量は同じか?

% 時間測定の方法
declare
T1={Time.time}
{Time.delay 1000}
T2={Time.time}
T=T2-T1
{Browse T}