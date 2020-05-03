
Base=read.csv("https://raw.githubusercontent.com/omarr667/Tarea2020/master/Bases.csv", stringsAsFactors = FALSE, sep="#", fileEncoding = "UTF8")
Base$Base=sub("\\s+$", "",Base$Base); n=dim(Base)[1]; Base$Contador=1:n

if (Equipo<15){
  set.seed(20202)
  random=sample(1:n, n, replace=F)
  bases=random[((1:2)*Equipo)]
}else{
  set.seed(20203)
  random=sample(1:n, n, replace=F)
  bases=random[((1:2)*Equipo-14)]
}

bases=bases[simulacion]
row_asignado=Base[which(Base$Contador==bases),]


if (row_asignado$Ubicacion=="instalar librería TSA"){
  if(! require("TSA")) install.packages("TSA");library(TSA);library(TSA)
}

print(paste("Te tocó la base '", row_asignado$Base, "', la cual tiene la siguiente información: ", row_asignado$Significado, sep="" ))


eval(parse(text = row_asignado$Base))
x=eval(parse(text =gsub("data", "",row_asignado$Base)))
return(x)