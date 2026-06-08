# sotsurunndeta
このリポジトリは、作者からもらいた公開リポジトリをもとに作成したものであり、自分の卒業論文のデータを分析するため修正を加えたものである。

作者からもらいたものは直接的に運行出来ないため、主に修正を加えたものはファイルmain_PAPER.v1.m中の内容でした。

現在のコードを運行したい場合は、main_PAPER.v1.mから始める。

また、運行前、13行目のファイル位置を変更すべき：maindir = 'C:\D\SHUJU\horizon_ddm-master_fulltext2\';　ここを現在のファイル位置を変更する。

新しいデータを入れ替えたい場合：28行目の：sub = load_humanData_v1(datadir, 'allHorizonData_labo.csv', 'DDM_labo_fit.csv');を変更する。

データ分析図のセーブに関して、main_PAPER.v1.mの中に、saveFigurePdfを検索し、その行目まで運行して、手作業でセーブする。

なお、以下に記載されている英語の説明文は、元のリポジトリに含まれていた内容である。

# horizon_ddm
Code to reproduce figures and analysis for Feng, Wang, Zarnescu, and Wilson: "The dynamics of explore-exploit decisions reveal a signal-to-noise mechanism for random exploration"

Preprint (2020-11-18): https://psyarxiv.com/uepr7
Published Version: https://doi.org/10.1038/s41598-021-82530-8

In the MATLAB code, the notation for the DDM is slightly different from that used in the paper, following instead that Bogacz et al 2006.  The differences are in the threshold and bias (starting point).  In the paper, the starting point was \alpha \beta, whereas in Bogacz et al this is treated as a single separate parameter, X0. In the paper, the upper/lower thresholds are at \beta and 0 (implying that 0 <= \alpha \beta <= \beta), whereas in Bogacz et al, thresholds are between z and -z for some positive parameter z. 

Start with main_PAPER.v1.m which should reproduce all of the figures in the paper.

Bogacz, R., Brown, E., Moehlis, J., Holmes, P., & Cohen, J. D. (2006). The physics of optimal decision making: a formal analysis of models of performance in two-alternative forced-choice tasks. Psychological review, 113(4), 700.
