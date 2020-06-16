import torch
import numpy as np
from torch_geometric.datasets import TUDataset
from torch_geometric.data import DataLoader
from torch_geometric import utils
from networks3 import  Net  		# import your network here
import torch.nn.functional as F
import argparse
import os
from torch.utils.data import random_split
from torch.utils.data.dataset import Subset



parser = argparse.ArgumentParser()

parser.add_argument('--dataset', type=str, default='DS',
                    help='dataset directory under /data. e.g. DS')



#Load GPU (If present)
args = parser.parse_args()
args.device = 'cpu'
args.seed = 777
torch.manual_seed(args.seed)
if torch.cuda.is_available():
    torch.cuda.manual_seed(args.seed)
    args.device = 'cuda:0'


#Read dataset using TUDataset
dataset = TUDataset(os.path.join('data',args.dataset),name=args.dataset,use_node_attr=True)
print(dataset)
args.num_classes = dataset.num_classes
args.num_features = dataset.num_features
print(args.num_features)
args.nhid = 128 #set your hidden layer setting here [8 or 128]
args.pooling_ratio = 0.5
args.dropout_ratio = 0.5

#Evaluate the model on the Independent Test Set
model = Net(args).to(args.device)
model.load_state_dict(torch.load('latest.pth'))
print(model)
