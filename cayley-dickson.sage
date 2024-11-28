# Definition of Cayley-Dickson algebras (up to the sedenion algebra)

def prod_R(real_1, real_2):
    return real_1 * real_2

def conj_R(real):
    return real

def prod_C(complex_1, complex_2):
    x0,x1 = complex_1
    y0,y1 = complex_2
    product = vector([x0*y0-x1*y1, x0*y1+x1*y0])
    return product

def conj_C(complex):
    x0,x1= complex
    conjugate = vector([conj_R(x0),-x1])
    return conjugate

def prod_H(quaternion_1, quaternion_2):
    x0 = quaternion_1[:2]
    x1 = quaternion_1[2:]
    y0 = quaternion_2[:2]
    y1 = quaternion_2[2:]
    left_side = prod_C(x0,y0)-prod_C(conj_C(y1),x1)
    right_side = prod_C(y1,x0)+prod_C(x1,conj_C(y0))
    product = vector(left_side.list() + right_side.list())
    return product

def conj_H(quaternion):
    x0 = quaternion[:2]
    x1 = quaternion[2:]
    left_side = conj_C(x0)
    right_side = -x1
    conjugate = vector(left_side.list()+right_side.list())
    return conjugate

def prod_O(octonion_1, octonion_2):
    x0 = octonion_1[:4]
    x1 = octonion_1[4:]
    y0 = octonion_2[:4]
    y1 = octonion_2[4:]
    left_side = prod_H(x0,y0)-prod_H(conj_H(y1),x1)
    right_side = prod_H(y1,x0)+prod_H(x1,conj_H(y0))
    product = vector(left_side.list() + right_side.list())
    return product

def conj_O(octonion):
    x0 = octonion[:4]
    x1 = octonion[4:]
    left_side = conj_H(x0)
    right_side = -x1
    conjugate = vector(left_side.list()+right_side.list())
    return conjugate

def prod_S(sedenion_1, sedenion_2):
    x0 = sedenion_1[:8]
    x1 = sedenion_1[8:]
    y0 = sedenion_2[:8]
    y1 = sedenion_2[8:]
    left_side = prod_O(x0,y0)-prod_O(conj_O(y1),x1)
    right_side = prod_O(y1,x0)+prod_O(x1,conj_O(y0))
    product = vector(left_side.list() + right_side.list())
    return product

def conj_S(sedenion):
    x0 = sedenion[:8]
    x1 = sedenion[8:]
    left_side = conj_O(x0)
    right_side = -x1
    conjugate = vector(left_side.list()+right_side.list())
    return conjugate
