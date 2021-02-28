### Vertex-Enriched Graph Neural Network (VEGNN)


This is my work directory of our submission to Machine Learning Journal. The work is based on the Vertex-Enrichment process of Graph Neural Networks. That is: augmenting the node features with relational-features obtained by using symbolic domain-knowledge. We treat these symbolic relations as hyperedges meaning any relation or a relational feature is a hyperedge. For more information on this, please go through our paper. 

We will be updating new experiments that we have conducted (or will conduct) in some other repository. We shall update this README accordingly.


#### Machine, Tools and Requirements

Machine specification:

  * `Machine: Dell 5810`
  * `RAM: 64GB`
  * `Processor: Intel 16-Core Xeon (3.10GHz)`
  * `GPU: NVIDIA P4000 (8GB VRAM)`
  * `OS: Ubuntu Linux 16.04.6 LTS (64bit)`

Tools used in this work:

  * `Editor: vi/vim`
  * `Execution: Linux-Shell`
  * `MATLAB R2018b (64bit)`
  * `Prolog compiler: YAP 6.2.2`
  * `ILP Engine: Aleph`
  * `CUDA 10.1.105`
  * `Python 3.7.6`

Python Libraries:
 
  * `torch 1.4.0`
  * `torch_geometric 1.2.1`
  * `numpy 1.18.1`


#### Source Data

There are 73 problems obtained from NCI. The data source including the extracted domain relations will be made available somewhere else (non-GitHub site) due to storage issues.

Temporarity, this is hosted in the Google Drive: [DataForVEGNN](https://drive.google.com/file/d/1eJrq_kvD2UmWiWe6F3C3Ire0fbv6CNrm/view?usp=sharing). The compressed file contains all data required for the work. Soon, we should be able to host these generated datasets with some well-known Benchmark websites. The information will be updated in this site, when that happens.


#### Working Data directory

A temporary data directory is created in `./data`. Under this there are two two directories for processing: `./data/raw` and `./data/processed`. Purposefully, the files are kept empty for uploading to GitHub. The split information gets copied to `./data/train_split` and `./data/test_split`.


#### Shell scripts

The script "run.bash" is one-shot execution of all methods. 

`
bash run.bash
`

The script "resultsummary.bash" summarises the results for each dataset. For this, one needs to supply the result directory as an argument. For example:

`
bash resultsummary.bash Result_dir_name
`

To store the results in a file:

`
bash resultsummary.bash Result_dir_name > Result_file_name.txt
`

To store only dataset and accuracy, one can *gawk* out the columns and then redirect to some file.


**added 1:** One can now create a full summary with regard to all the datasets and features for any particular method. See the following for help about the new summarising script.

`
bash createressum.bash --help
`


**added 2:** Added a Python script to load a (trained) saved model and print the structure

`
python modelsummary.py
`

**added 3:** Code to load the saved models for deployment. Deployment refers to testing the trained model on unseen data. For us this is: test data. Added also the printing model code in this. So, no need to explicitly use the modelsummary.py code given in "added 2".

`
bash test.bash
`

Some results from this are saved in the file `testedsavedmodels.out`.



**added 4:** The `createressum_*.bash` files summarise the results.

`
bash createressum_[enter].bash --help
`


#### Note on Reproducibility


The implementations have been carried out using [PyTorch](https://pytorch.org/docs/stable/index.html). All the experiments are conducted by setting a fixed seed for the Random Number Generator (RNG). Although we believe that this should be sufficient to reproduce all the experiments; we note the [official statement](https://pytorch.org/docs/stable/notes/randomness.html) from PyTorch on reproducibility: "Completely reproducible results are not guaranteed across PyTorch releases, individual commits or different platforms. Furthermore, results need not be reproducible between CPU and GPU executions, even when using identical seeds."


#### Cite

[New] This work is now accepted at Springer Machine Learning Journal (Feb 19, 2021)

[Preprint] The manuscript is available as a [pre-print](https://arxiv.org/abs/2010.13900). Cite as:

<pre>
@misc{dash2021incorporating,
      title={Incorporating Symbolic Domain Knowledge into Graph Neural Networks},
      author={Tirtharaj Dash and Ashwin Srinivasan and Lovekesh Vig},
      year={2021},
      eprint={2010.13900},
      archivePrefix={arXiv},
      primaryClass={cs.LG}
}
</pre>

[Old] This work is under review at Springer Machine Learning Journal. Additional citation details will be updated after acceptance of the article.
