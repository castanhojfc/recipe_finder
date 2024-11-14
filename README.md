# Recipe Finder

## Problem statement

#### **_It's dinner time ! Create an application that helps users find the most relevant recipes that they can prepare with the ingredients that they have at home_**

## Objective

Deliver a prototype web application to answer the above problem statement.

| :white_check_mark: Must have's      | :stop_sign: Don'ts                                       |
| ----------------------------------- | -------------------------------------------------------- |
| A back-end with Ruby on Rails       | Excessive effort in styling                              |
| A SQL-compliant relational database | Features which don't directly answer the above statement |
| A well-thought user experience      | Over-engineer your prototype                             |
| A good code quality                 |

## Deliverable

- [ ] The codebase: hosted on GitHub and shared with: @soyoh @sforsell @clemalfroy @dmilon @pointcom @evangelos-fotis @thecodehunter @gterral @sirdharma @maximilientyc @by-robots @NikosVlagoidis @toommz @foreverhungry @mandark97 @technoir9,
- [ ] 2 or 3 user stories that address the statement in the repo's `README.md`,
- [ ] The application accessible online (a personal server, fly.io or something else),
- [ ] Submission of the above via [this form](https://forms.gle/siH7Rezuq2V1mUJGA),
- [ ] If you're on Mac, make sure your browser has permission to share the screen.


## Data
We provide two datasets to choose from:
- [french-language recipes](https://pennylane-interviewing-assets-20220328.s3.eu-west-1.amazonaws.com/recipes-fr.json.gz) scraped from www.marmiton.org with [python-marmiton](https://github.com/remaudcorentin-dev/python-marmiton)
- [english-language recipes](https://pennylane-interviewing-assets-20220328.s3.eu-west-1.amazonaws.com/recipes-en.json.gz) scraped from www.allrecipes.com with [recipe-scrapers](https://github.com/hhursev/recipe-scrapers)

Download it with this command if the above link doesn't work:
```shell
wget https://pennylane-interviewing-assets-20220328.s3.eu-west-1.amazonaws.com/recipes-en.json.gz && gzip -dc recipes-en.json.gz > recipes-en.json
```

## The debrief interview

Do we want to fill this ?

## FAQ

<details>
<summary><i>I'm a back-end developper or don't know React, what do I do?</i></summary>

Just make the simplest UI, style isn't important and server rendered HTML pages will do!
</details>

<details>
<summary><i>Can I have a time extension for the test?</i></summary>

No worries, we know that unforeseen events happen, simply reach out to the recruiter you've been
talking with to discuss this.
</details>

<details>
<summary><i>Can I transform the dataset before seeding it in the DB</i></summary>

Absolutely, feel free to post-process the dataset as needed to fit your needs.
</details>

<details>
<summary><i>Should I rather implement option X or option Y</i></summary>

That decision is up to you and part of the challenge. Please document your choice
to be able to explain your reflexion and choice to your interviewer for the
challenge debrief.
</details>

<details>
<summary><i>I tried to make it available online but can't make it work</i></summary>

Don't overinvest time (or money) on this if you really can't figure it out and we'll
assess over your local version. Please make sure eveything is working smoothly
locally before your debrief interview.
</details>
