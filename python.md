# Install Python 3

### Installation Centos

`yum install python36`
`yum install python36-pip`

### Install Ubuntu

`apt install python3`
`apt-get install python3-pip`

### Test python3

`python3`

### Installing dependencies after via pip

Update pip
`pip install -U pip`
`pip install ipython`
`pip install jupyter`

`jupyter notebook --no-browser --ip=<ip>`

# Input/Output

`print('hello')`
`msg = input('message')`

# Write to file

`f = open('filename', 'w')`
`f.write('abc')`
`f.close()`

# Read

```
filename = 'filename'
with open(filename) as f:
   content = f.readlines()
print(content)
```
