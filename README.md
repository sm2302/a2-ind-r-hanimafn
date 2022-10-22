# Instructions

-   Read carefully the assignment instructions contained within `r-ind-2022s1.pdf`.

-   Create a single .R file (name this `solution.R`) containing your solutions to Questions 1--5. **Only the code contained within this file will be assessed**.

-   It is important that you name your functions and variables **as instructed**, as your solutions will be auto-graded using R.

-   The code in your script file should be able to be run without any errors.

-   Please note that not only will you be graded on the correctness of your code but also on creativity, code styling, the proper use of GitHub, as well as following instructions. Therefore, ensure that you

    -   Style your code correctly--Refer to the Tidyverse Style Guide at <https://style.tidyverse.org/>;
    -   Use comments where appropriate;
    -   Cite your sources (failure to do so will result in penalties for plagiarism).

-   If you wish, you may provide a README.md file summarising your work on GitHub / GitHub Pages. Be aware that while your repositories remain private, any information on GitHub Pages will always be publicly available.

## R Individual Assignment

Probability density distribution (pdf) of the Pareto distribution:

$$
f(x|\alpha,\beta)=
\begin{cases}
\frac{\alpha\beta^{\alpha}}{x^{\alpha +1}}  & x\geq \beta \\ 
0 & x<\beta
\end{cases}
$$

Deviance function:

$$
D(\alpha,\beta|X)=
-2\sum\limits_{i = 1}^{n}{logf(X_i|\alpha,\beta)} 
$$

Cumulative distribution function (cdf) :

$$
F(x|\alpha,\beta)=Pr(X\leq x)=
\int_{-\infty }^{x}{f(u|\alpha,\beta)du} 
$$

### Question 3

Here is the derivation that I calculated for $\hat{\alpha}$ :

$$
\frac{\delta D}{\delta \alpha} = 
\frac{\delta}{\delta \alpha}
\left
[-2\sum_{i = 1}^{n}logf(X_i|\alpha,\beta)
\right]
$$

$$
= -2\frac{\delta}{\delta \alpha}
\left
[\sum_{i = 1}^{n}logf(X_i|\alpha,\beta)
\right]
$$

$$
=-2 \frac{\delta}{\delta\alpha}
\left
[\sum_{i=1}^{n}log
\frac{\alpha\beta^{\alpha}}{X_i^{\alpha+1}}
\right]
$$

$$
= -2 \frac{\delta}{\delta\alpha}
\left
[\sum_{i=1}^{n}[log(\alpha\beta^{\alpha}) - logX_i^{\alpha+1}]
\right]
$$

$$
= -2\frac{\delta}{\delta\alpha}
\left
[[log(\alpha\beta^{\alpha})-logX_1^{\alpha + 1}] + ... +
[log(\alpha\beta^{\alpha})-logX_n^{\alpha + 1}]
\right]
$$

$$
= -2\frac{\delta}{\delta\alpha}
\left
[nlog(\alpha\beta^{\alpha})-[log(X_1^{\alpha+1})+...+log(X_n^{\alpha+1})
\right]
$$

$$
= -2n \frac{\delta}{\delta \alpha}[log(\alpha \beta^{\alpha})]
+2 \frac{\delta}{\delta \alpha}
[log(X_1^{\alpha}\cdot X_1) + ...+ log(X_n^{\alpha}\cdot X_n)]
$$

$$
= -2n \frac{\delta}{\delta \alpha}[log\alpha + \alpha log\beta]
+2 \frac{\delta}{\delta \alpha}
\left[
[log(X_1^{\alpha})+ log(X_1)]+...+ [log(X_n^{\alpha})+ log(X_n)]
\right]
$$

$$
= -2n \left[ \frac{1}{\alpha} + log\beta \right]
+2[logX_1+...+logX_n]
$$

$$
= 2 \left[
[logX_1+...+logX_n] -nlog\beta -\frac{n}{\alpha}
\right]
$$

$$
= 2 \left[
\left[log \left(\frac{X_1}{\beta} \right)\right] +...+
\left[log \left(\frac{X_1}{\beta} \right)\right]
-\frac{n}{\alpha}
\right]
$$

$$
=2\left[
\sum_{i = 1}^{n}log \left(\frac{X_i}{\beta}\right) -\frac{n}{\alpha}
\right]
$$

$\hat{\alpha}$ is $\alpha$ when $\frac{\delta D}{\delta\alpha}=0$ and $\beta = \hat{\beta}$

$$
2\left[
\sum_{i = 1}^{n}log
\left(\frac{X_i}{\beta}\right)
-\frac{n}{\alpha}
\right] = 0
$$

$$
\frac{n}{\alpha} = 
\sum_{i = 1}^{n}log
\left(\frac{X_i}{\beta}\right)
$$

$$
\alpha = \frac{n}
{\sum_{i= 1}^{n}log\left(\frac{X_i}{\beta}\right)} =
\hat{\alpha}
$$

### Question 4

find $F$ from integration of $f$

$$
F(x|\alpha,\beta)=\int_{-\infty}^{x}{f(u|\alpha,\beta)du}
$$

$$
=\int_{-\infty}^{x}{\frac{\alpha\beta^{\alpha}}{x^{\alpha +1}}}du
$$

$$
=\alpha\beta^\alpha lim_{t \to -\infty}
\int_{t}^{x}{u^{-(\alpha+1)}}du
$$

$$
=\alpha\beta^\alpha lim_{t \to \beta}
\int_{t}^{x}{u^{-(\alpha+1)}}du
$$

$$
=\alpha\beta
\left
[\frac{u^{-\alpha}}{-\alpha}
\right]_{u = \beta}^{u = x}
$$

$$
=-\beta^{\alpha}
\left
[u^{-\alpha}
\right]_{u = \beta}^{u = x}
$$

$$
= -\beta^{\alpha}
\left[x^{-\alpha} - \beta^{-\alpha}\right]
$$

$$
= 1 - \left(\frac{\beta}{x}\right)^{\alpha}
$$
