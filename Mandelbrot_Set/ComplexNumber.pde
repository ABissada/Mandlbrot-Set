class ComplexNumber {
  //Fields
  float real;
  float imaginary;
  
  //Constructor
  ComplexNumber(float r, float i){
    this.real = r;
    this.imaginary = i;
  }
  
  //Methods
  void printMe(){
    if(imaginary > 0)
    println(this.real, "+", this.imaginary + "i");
    if(imaginary <0)
    println(this.real, this.imaginary + "i");
  }
  
  float absoluteValue() {
    return sqrt( pow(this.real,2) + pow(this.imaginary,2) );
  }
  
  ComplexNumber add(ComplexNumber n) {
    float newReal = this.real + n.real;
    float newImaginary = this.imaginary + n.imaginary;
    
    ComplexNumber newComplex = new ComplexNumber(newReal, newImaginary);
    return newComplex;
  }
  
  ComplexNumber square(){
    float newReal = (pow(real,2)-pow(imaginary,2));
    float newImaginary = (2*real*imaginary);
    
    ComplexNumber newComplex = new ComplexNumber(newReal, newImaginary);
    return newComplex;
  }
  
}
