using EpidemicsModel
using Documenter

DocMeta.setdocmeta!(EpidemicsModel, :DocTestSetup, :(using EpidemicsModel); recursive=true)

makedocs(;
    modules=[EpidemicsModel],
    authors="Natan Dominko Kobilica",
    repo="https://github.com/dknatan/EpidemicsModel.jl/blob/{commit}{path}#{line}",
    sitename="EpidemicsModel.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(
    repo = "github.com/dknatan/EpidemicsModel.jl"
)
