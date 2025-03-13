library(car)
library(crayon)

NumClassA <- suppressWarnings(as.numeric(readline(prompt = "Enter number of students in class A: ")))
A <- numeric(NumClassA)
for( i in 1:NumClassA ){
  number <- suppressWarnings(as.numeric(readline(prompt = paste("Enter Class A student", i, " of ", NumClassA, " score: "))))
  
  if (is.na(number) || number < 0 || number > 20){
    while(TRUE){
      number <- suppressWarnings(as.numeric(readline(prompt = "Score invalid enter again: ")))
      if (!is.na(number) && number >= 0 && number <= 20){
        break
      }
    }
  } 
  A[i] <- number
}


NumClassB <- suppressWarnings(as.numeric(readline(prompt = "Enter number of students in class B: ")))
B <- numeric(NumClassB)
for( i in 1:NumClassB ){
  number <- suppressWarnings(as.numeric(readline(prompt = paste("Enter Class B student", i, " of ", NumClassB, " score: "))))
  
  if (is.na(number) || number < 0 || number > 20){
    while(TRUE){
      number <- suppressWarnings(as.numeric(readline(prompt = "Score invalid enter again: ")))
      if (!is.na(number) && number >= 0 && number <= 20){
        break
      }
    }
}
  B[i] <- number
}

#A <- round(rnorm(15, mean = 10, sd = 4.5), 2)
#B <- round(rnorm(15, mean = 10, sd = 4.5), 2)

#A <- sample(20, 15, replace = TRUE)
#B <- sample(20, 15, replace = TRUE)

if (length(A) != length(B)){
  pairBool <- FALSE
}else{
  pairBool <- TRUE
}

shapiro_vec1 <- shapiro.test(A)
shapiro_vec2 <- shapiro.test(B)

cat("Shapiro class A =", shapiro_vec1$p.value, "\n")
cat("Shapiro class B =", shapiro_vec2$p.value, "\n")

if (pairBool){
  if (shapiro_vec1$p.value <= 0.05 || shapiro_vec2$p.value <= 0.05) {
    cat(red("The scores are not normal! \n"))
    
    test_result <- suppressWarnings(wilcox.test(A, B, paired=TRUE))
  }else{
    cat(green("The scores are normal! \n"))
    
    test_result <- suppressWarnings(t.test(A, B, paired = TRUE))
  }  
  
}else{
  if (shapiro_vec1$p.value <= 0.05 || shapiro_vec2$p.value <= 0.05) {
    cat(red("The scores are not normal! \n"))
  
    test_result <- suppressWarnings(wilcox.test(A, B, paired=FALSE))
  
  }else{
    cat(green("The scores are normal! \n"))
    Levene_result <- leveneTest(c(A, B), factor(rep(1:2, c(length(A), length(B)))))
    if (Levene_result$`Pr(>F)`[1] <= 0.05){
      cat("The Scores' Var are not equal! \n")
      testresult <- t.test(A, B, paired=FALSE, var.equal = FALSE)
      
    }else {
      cat("The Scores' Var are equal! \n")
      test_result <- t.test(A, B, paired=FALSE, var.equal = TRUE)
    }
  }
}

if (test_result$p.value < 0.05){
  cat(paste(test_result$method, "has significant diffrence with p-value = ", test_result$p.value))
}else {
  cat(paste(test_result$method, "has no significant diffrence with p-value = ", test_result$p.value))
}

