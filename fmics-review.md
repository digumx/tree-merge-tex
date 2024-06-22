----------------------- REVIEW 1 ---------------------
SUBMISSION: 10
TITLE: Unifying Syntactic and Semantic Abstractions for Deep Neural Networks
AUTHORS: Sanaa Siddiqui, Diganta Mukhopadhyay, Mohammad Afzal, Hrishikesh Karmarkar and Kumar Madhukar

----------- Overall evaluation -----------
SCORE: 2 (accept)
----- TEXT:
Summary of the Paper

The paper addresses the challenge of using large Deep Neural Networks (DNNs) in resource-constrained, real-time, and safety-critical applications. Large DNNs are essential for high accuracy but are challenging to deploy and verify in such settings. The primary contribution is a novel framework that combines syntactic and semantic approaches to compress these networks while preserving safety properties.

Key Points

1. Problem Statement: Large DNNs are vital for complex tasks but challenging to deploy and verify in constrained environments, limiting their use in safety-critical domains.

2. Existing Techniques:
   - Syntactic Abstraction: Ensures safety properties but often results in sub-optimal network sizes.
   - Semantic Abstraction: Achieves significant size reduction but weakly preserves safety properties.

3. Proposed Solution:
   - Integrates syntactic and semantic approaches.
   - Syntactic Approach: Splits and merges neurons based on syntactic constraints to ensure formal safety guarantees.
   - Semantic Approach: Uses a semantic closeness metric to guide neuron merges based on their global behaviour.

4. Framework Details:
   - Semantic Closeness Metric: Guides neuron merges by measuring behavioural similarity.
   - Tree of Merges: Constructs a hierarchical tree for optimal neuron grouping based on semantic similarity.
   - Tree-Cuts and Refinement: Refines the network by cutting the merge tree and unmerging neurons to eliminate errors.

5. Implementation and Experiments:
   - Implemented in Python using NumPy and SciPy.
   - Tested on ACASXu benchmarks with a CEGAR loop to verify safety properties.
   - Produced smaller networks than existing methods while maintaining verification effectiveness.

6. Results:
   - Outperformed existing CEGAR approaches in network size and verification capability.
   - Flexible framework allowing different definitions of semantic closeness and strategies for neuron selection.

The paper presents a novel approach to neural network compression that balances syntactic soundness and semantic behaviour. This results in smaller, verifiable networks suitable for safety-critical applications, and experimental results validate the approach's effectiveness.

Critique

Originality:
The paper presents a novel integration of syntactic and semantic abstraction techniques, exploiting their strengths to produce smaller, formally verifiable networks while preserving safety properties. This hybrid approach is a novel contribution addressing the limitations of existing methods.

Significance:
The work is significant for safety-critical domains like automated driving, medical diagnosis, and air traffic control, where reliable and resource-efficient DNNs are essential. By enabling smaller, verifiable networks, the research enhances DNN deployability and trustworthiness in real-world applications.

Rigour:
- Theoretical Foundation: Thorough explanation of the approach, including semantic closeness metric, tree construction for merges, and refinement process.
- Algorithm Description: The merge and refinement processes are clearly described and supported by algorithms and examples.
- Experimental Validation: Extensive experiments on ACASXu benchmarks show the approach produces smaller networks capable of verifying safety properties.
- Discussion of Limitations and Future Work: This section acknowledges current limitations and suggests future improvements, adding to the rigour.

Strengths:
- Innovation in Combining Techniques: Addresses a significant research gap.
- Practical Relevance: Enhances efficiency and reliability of DNNs in safety-critical systems.
- Comprehensive Evaluation: Strong evidence for the approach's effectiveness through thorough experiments and comparisons.

Areas for Improvement:
- Complexity Analysis: More explicit analysis of computational complexity and
  scalability would enhance practical understanding.
    Can't do much here - new unreviewed material - but maybe mention np hardness
    of nnv
- Generalisation to Other DNNs: Extending the method to other architectures
  (e.g., convolutional, recurrent networks) would broaden its impact.
    One line in future work? - maybe 
- Real-World Case Studies: Including case studies from real-world applications
  could strengthen practical utility demonstration.
    Not do.

Conclusion

The paper makes a significant and original contribution to neural network compression and verification, demonstrating a rigorous approach and practical relevance. Addressing suggested improvements could further enhance the research's impact and applicability.



----------------------- REVIEW 2 ---------------------
SUBMISSION: 10
TITLE: Unifying Syntactic and Semantic Abstractions for Deep Neural Networks
AUTHORS: Sanaa Siddiqui, Diganta Mukhopadhyay, Mohammad Afzal, Hrishikesh Karmarkar and Kumar Madhukar

----------- Overall evaluation -----------
SCORE: 2 (accept)
----- TEXT:
Unifying Syntactic and Semantic Abstractions for Deen Neural Networks

In this paper, the authors propose a new method for abstracting neural networks while keeping some property intact. The core idea is built on previous work where nodes are merged in such a way that the output of the new network is always greater or equal to the output from the original network (with the same input). The novelty stems from which nodes, and in what order, are merged. After defining a semantic closeness, and requiring that whenever nodes are merged, the closest nodes are chosen, the authors furthermore present how to incorporate it into a CEGAR approach. When refining based on found counterexamples, the approach tries to find what nodes to unmerge while undoing the least amount of previous mering. They evaluated their approach on the ACASXu NN verified by the NeuralSAT solver and got better results than the basic greedy way in which CEGAR is applied.

Strong points:
- Clear presentation of the approach.
- When applied to standard benchmarks can achieve larger reduction in network
  size compared to previous work.

Weak points:
- The authors present their solution as a framework, where one can choose
  definition of semantic closeness and strategy to finding "culprit node", but
they only explore one choice for each.
    This is fine.


I find the presentation of the paper easy to follow and they describe each step
in a clear manner. The examples are well-illustrated an easy to follow.

The experimental evaluation shows promising results. It would be interesting to
know the magnitude of the applied re-merging strategy (i.e., what order of
magnitude) (dont get what he means by magnitude). Another aspect which could be
interesting is the total run time
(skip this) of the two solutions. I see that in three cases the Existing
approach times out, but in the remaining cases only the resulting size of the
network is reported, and not the verification time (Doesn't make too much
sense). There could be cases where a
larger network is actually easier to reason (e.g., prove properties) about. (We
have said this, we agree with this possibility).

Semantic closeness and the strategy to select the culprit neuron are presented
as choices where multiple strategies could be useful. An exploration of other
choices could give insights, or at least suggestions from the authors of
alternative strategies. (This is fine, Sanaa: One possible thing is to talk
about original CEGAR for culprit selection, and characteristic for closeness
metric.)


Grade: Accept


Minor comments: (Prioritise)
Alg 1> Q undefined. -done 
p 7> Assume this is L2-norm, should be clarified.
p 13> It is mentioned that "re-merging" of semantically identical nodes is
applied. It is unclear if this is applied to both approaches, or only theirs.
p 13> The labels on the graph are too small. Also, it would be helpful if
datasets were represented by different symbols.
p 13> I do not think it's necessary to add [20,12] for every time CEGAR is
mentioned.
p 15> Acknowledgements is empty.



----------------------- REVIEW 3 ---------------------
SUBMISSION: 10
TITLE: Unifying Syntactic and Semantic Abstractions for Deep Neural Networks
AUTHORS: Sanaa Siddiqui, Diganta Mukhopadhyay, Mohammad Afzal, Hrishikesh Karmarkar and Kumar Madhukar

----------- Overall evaluation -----------
SCORE: 1 (weak accept)
----- TEXT:
This paper combines two the idea of semantic and syntactic abstraction
of Neural Networks into a combined approach.
It uses the semantic information to build a tree of merging, i.e. a tree
for the abstraction, and to define a priority of neurons to be merged.
This way, it uses the abstraction of [20] to create a strict formal
link and the idea of the semantics from [1] to compute the closeness of
two neurons.
This idea is a natural combination of these methods and is elegantly
combined with a tree structure for a more efficient CEGAR loop.

The idea is a straightforward combination of existing methods (which is neither
good nor bad, just worth mentioning).


Pros:

- The experimental results indicate an improved performance

- The tree representation is a nice and elegant addition


Cons:

- The paper has very lengthy stretches and could use some re-writing to
make it more concise (especially abstract, introduction and conclusion
sound almost like copies of each other) (address this. Sanaa: Not a lot common). 
There is no need for an
additional section on related work, since most of it was already
mentioned in the introduction. (address this)

- The experiments are very limited and could be extended to other
datasets and networks (can't do much here)


Overall, the paper could benefit from some improvements in the writing,
but it contains an interesting idea that seems to be promising (based on
the experimental evidence).

Therefore, I recommend acceptance.
