## Project 3: Algorithm Implementation and Evaluation
### Summary

+ Term: Spring 2018
+ Project title: Implementation and Evaluation of Collaborative Filtering Algorithms
+ Team Number: Group 1
+ Team Members: Mingkai Deng, Mao Guan, Ayano Kase, Juho Ma, Cindy Xu

+ Project summary: In this project, we implemented and evaluated different collaborative filtering algorithms of two types: memory-based and model-based. For memory-based model, we also considered possible variations in implementation, with varying methods of weighting (significance and variance weighting) and correlation/similarity measures (Pearson, Spearman, Vector Similarity, Entropy, Mean Squared Difference, and SimRank).

### Task 1. Model-based vs. Memory-based Algorithms

### Result

### Task 2. Correlation/Similarity Measures

Along with Pearson correlation, we tested several correlation/similarity measurement methods to test their validity. As suggested by Herlocker et al., we tested Spearman, vector similarity, mean square difference, and entropy methods. Also included is SimRank which was suggested by Jeh and Widom. Refer to `functions.R` to see how each method is implemented.

### Result

						MAE (Movie data)		Rank Score (MS data)
	Pearson					1.09				26.89
	Spearman				1.09				26.89
	Vector similarity			1.10				27.03
	Entropy					1.10				26.91
	Mean square difference			1.10				27.14
	SimRank					1.08				27.08

As indicated in the paper, we also didn't see significant improvement in the performance for both datasets. Some measures (such as Entropy) was extremely inefficient compared to simple Pearson or Spearman method.

### Task 3. Significance and Variance Weighting

We also tested two different ways to weigh correlation based on the methods suggested by Herlocker et al. Significance weighting takes into account the number of common ratings between two users in order to devalue those similarity weights based on a small number of co-rated items. As suggested in the paper, those with fewer than 50 co-rated items are weighted down by n/50. Variance weighting is a way to reflect the differences between items, with an idea that if the ratings are homogenous for an item, the significance of such ratings should be weighted down. We used the suggested normalization of variance weight as (variance - min(variance)) / max(variance).

### Result

						MAE (Movie data)		Rank Score (MS data)
	Pearson					1.09				26.89
	Pearson w/ Sig Weighting		1.10				26.89
	Pearson w/ Var Weighting		1				26.3

With our implementation, we didn't see any significant improvement in performance. It is possible that for significance weighting, we may need a better measure than the mere number of co-rated items, as the ratings for such items could diverge significantly. The paper suggests significance weighting with Spearman correlation yielded significant improvement, which we didn't experiment in this project. Variance weighting, as already suggested, showed similar result.

### Contribution Statement

[default](doc/a_note_on_contributions.md) All team members contributed equally in all stages of this project. All team members approve our work presented in this GitHub repository including this contributions statement.

+ Mingkai Deng

	+ Researched and implemented evaluation metrics for memory-based model
	+ Researched method to calculate similarity measures based on Entropy and Mean-Square-Difference 
	+ Developed R scripts to streamline workflow 
	+ Presentation
	
+ Mao Guan

	+ Model-based Model Training Implementation
	+ Evaluation Method Implementation
	+ Contribute to the README.md and Slides
	+ Presentation
	
  
+ Ayano Kase

	+ Coded and evaluated memory-based model with Spearman and vector similarity
	+ Contributed to README.md
	+ Contributed to presentation deck

+ Juho Ma

	+ Significance and Variance Weighting
	+ SimRank
	+ Slides, Main, ReadMe, and outputs documentation

+ Cindy Xu

	+ Entropy and Mean Square difference
	+ Slides, ReadMe, and outputs documentation
	+ Presentation

+ All

	+ Similarity weight matrices and predict matrices


### References

+ Breese, J. S., Heckerman, D., & Kadie, C. (1998, July). Empirical analysis of predictive algorithms for collaborative filtering. In Proceedings of the Fourteenth conference on Uncertainty in artificial intelligence (pp. 43-52). Morgan Kaufmann Publishers Inc..

+ Herlocker, J. L., Konstan, J. A., Borchers, A., & Riedl, J. (1999, August). An algorithmic framework for performing collaborative filtering. In Proceedings of the 22nd annual international ACM SIGIR conference on Research and development in information retrieval (pp. 230-237). ACM.

+ Su, X., & Khoshgoftaar, T. M. (2009). A survey of collaborative filtering techniques. Advances in artificial intelligence, 2009, 4.

+ Jeh, G., & Widom, J. (2002, July). SimRank: a measure of structural-context similarity. In Proceedings of the eighth ACM SIGKDD international conference on Knowledge discovery and data mining (pp. 538-543). ACM.

Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.
