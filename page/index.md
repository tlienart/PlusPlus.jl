<!-- =============================
     ABOUT
    ============================== -->

\begin{:section, title="About this Package", name="About"}

\lead{PkgPage.jl is based upon [Franklin.jl](https://github.com/tlienart/Franklin.jl) and makes it easy to create a beautiful landing page for a package in less than 10 minutes.}

Say something else $\sin^2(x)+\cos^2(x)=1$.

$$ \sin^2(x)+\cos^2(x)=1 $$

\end{:section}


<!-- =============================
     SHOWING CODE
    ============================== -->

\begin{:section, title="Showing Code"}

```julia:ex
using DataFrames
using PlusPlus
df = DataFrame(A = 1:4, B = ["M", "F", "F", "M"])
df2 = DataFrame(A = 1:4, B = ["M", "F", "F", "M"])
df ++ df2
```

You can control the indentation and appearance of the output block in the `config.md` too.

\end{:section}


<!-- =============================
     Deploying
    ============================== -->

\begin{:section, title="Deployment"}

\lead{Make your page available online easily by leveraging GitHub Actions and GitHub Pages.}

By following these instructions, the content of the rendered website will be copied to a `gh-pages` branch where it will be deployed by GitHub.
If you would like to deploy the page with your own URL or using something else than GitHub, have a look at the specific instructions further on.

**Adjust DeployPage**: start by checking the `.github/workflows/DeployPage.yml` in particular:
* if you want to use Python or matplotlib, uncomment the relevant lines
* in the `run` block ensure that
    * `NodeJS` and `PkgPage` are added,
    * any packages that your page might rely on are added,
    * the `optimize` call has the appropriate `input` and `output` path (if you're in the default setting, leave as is).

**Keys**: in order to have your page be built and deployed on GitHub, you will need to generate a keypair and add it to the GitHub repo. To do so:

1. run in your terminal `ssh-keygen -N "" -f franklin`,
1. copy the entire content of the generated `franklin` file and put it as a new secret named `FRANKLIN_PRIV` on <https://github.com/USERNAME/PACKAGE.jl/settings/secrets/new>,
1. copy the entire content of the generated `franklin.pub` file and put it as a new deploy key named `FRANKLIN_PUB` on <https://github.com/USERNAME/PACKAGE.jl/settings/keys> with `read/write` access,
1. remove both files.

Whenever the `master` branch of your package gets updated, the  build process will be triggered and your page updated.
**That's basically it**.

\alert{In order to avoid having GitHub mark your repo as a CSS/HTML repo instead of a Julia one, you will want to tell it to ignore the `page/` folder (or whatever you named the folder) for the language statistics. To do so, add a file `.gitattributes` in your repo with `page/* linguist-vendored` such as [the one we use](https://github.com/tlienart/PkgPage.jl/blob/master/.gitattributes).
}

**Avoiding clashes with Documenter.jl**: if you already use [Documenter.jl](https://github.com/JuliaDocs/Documenter.jl) you might want your page to be deployed in a specific folder of `gh-pages` as Documenter also generates files in `gh-pages`.

\alert{This will typically not be necessary as the names created by PkgPage and Documenter don't clash, but you might still prefer to avoid mixing the two (in which case, read on).}

you can do so in two steps:

1. change the `run` part of `DeployPage.yml` by specifying the `output` keyword argument  in `PkgPage.optimize` for instance: `PkgPage.optimize(input="page", output="page")`,
1. change the `prepath` in `config.md` to reflect that the base URL will contain that additional folder, for instance `@def prepath = "YourPackage.jl/page"`.

**Use your own URL**: you can usually get host services like Netlify to deploy a specific branch of a GitHub repo, do make sure to set `@def prepath = ""` in your `config.md` though.

If you want to do the deployment without GitHub actions then you will need to:

* ensure you have `purgecss` and `highlights` installed and available to `NodeJS`, the simplest way to do this is to install them via `NodeJS` with

```
using NodeJS;
run(`$(npm_cmd()) install highlight.js`);
run(`$(npm_cmd()) install purgecss`);
```
\\
* run `PkgPage.optimize(input="page", output="")` (adapting `input` as required)
* place the content of `page/__site` wherever your server requires it.

\end{:section}
