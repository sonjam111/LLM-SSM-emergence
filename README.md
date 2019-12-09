# LLM-SSM-emergence
A repo for code, in R, papers and demo for the emergence index based on a state-space model

LLM-SSM_paper.pdf contains the theoretical elements of the model used for the emergence index calculations.

likelihoodLLMvard.R has the code to compute the likelihood.

parameter_estimator3.R has the code to obtain the hyperparameters via maximum likelihood.

dkfLLMvard.R implements the Kalman Filter for the LLM-SSM model.

smfilter.R implements the smoothing filter.

demo_SSM-LLM.Rmd contains the code for a demo on how to use the code. Its output is in demo_SSM-LLM.html.


