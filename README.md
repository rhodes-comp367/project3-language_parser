[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/dPwN1w3S)
# Final project

**Explain the general theme and specific features of your project.**

This project implements a simple language parser, evaluator, and pretty printer in Agda. The parser is designed to interpret basic expressions, such as equality checks (`eq`) and addition (`add`), and convert them into an abstract syntax tree (AST) in the form of predefined expressions. An evaluator then processes the AST to compute results based on the semantics of the expressions. The pretty printer function can be used to convert parsed expressions back into their origional format. 

Specific features:
- Parsing Expressions: The parser can handle expressions like `eq 2 3` and `add 4 5`, converting them into structured representations.
- Evaluation: The evaluator supports evaluating equality expressions to `true` or `false` 
- Pretty Printing: The project includes functionality to pretty-print parsed expressions back into their original string form.

I couldn't quite get add working correctly in eval. I would either need to write a different eval function to handle each operation, then maybe a helper to handle pattern matching, but I just couldn't quite get it working. 
The Test file includes some testing and proofs to verify that each portion of the project actually works as intended. 

**Cite any resources or existing code you used.**

In terms of sources, all I really used was some limited AI. I used AI to form an idea of how to structure the project as early on I just couldn't wrap my head around what needed to go into it. I also used AI to generate the expression data type, although it was modified by me as my goals for the project changed. AI also told me about the Maybe data type to get around some issues I was having, I know its defined in the standard library but it was easier to just define the function myself. I also used it for some various debugging but most of the remaining code was written by me. 


**Discuss any challenges, or anything you'd like feedback on.**

My biggest challenge with this project was the complexity. This is a very simple interpreter tool that has limited functionality and a large amount of hardcoding that limits its effectiveness. Realisticlally it would have been tough for me to make it more advanced given the timeline, but in an ideal world it would be able to handle much more complex syntax. 

