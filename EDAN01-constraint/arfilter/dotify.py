#!/usr/bin/env python2

add = [9,10,11,12,13,14,19,20,25,26,27,28]
mul = [1,2,3,4,5,6,7,8,15,16,17,18,21,22,23,24]

nodes = []
nodes.extend(add)
nodes.extend(mul);

dependencies = [
    [9],
    [9],
    [10],
    [10],
    [11],
    [11],
    [12],
    [12],
    [27],
    [28],
    [13],
    [14],
    [16,17],
    [15,18],
    [19],
    [19],
    [20],
    [20],
    [22,23],
    [21,24],
    [25],
    [25],
    [26],
    [26],
    [27],
    [28],
    [],
    []
];


print "digraph rdt {"
for node in nodes:
    op = "+" if node in add else "*"
    name = "%s%s" % (op, node)

    for dep in dependencies[node - 1]:
        op_dep = "+" if dep in add else "*"
        name_dep = "%s%s" % (op_dep, dep)
        print "\"%s\" -> { \"%s\" }" % (name, name_dep)
print "}"
