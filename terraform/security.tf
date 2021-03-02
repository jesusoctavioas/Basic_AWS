resource "aws_key_pair" "TheGoodStuff" {
  key_name   = "JOAS"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6acZ6T5wU/T5c8Nce9+Nzz2BfYjn+AfTXAWNVekBdR4lrcR+EjKvkemn4ls2dbJduaFveg7PGzTSzmbEcaPqQedgbb2JxVnQNs2SgOcVoNdcD1Uz5Tkmb613ze71gMhIT9bgChE7QbxSkDA/+QX96qAaoL3Ie5weLxkrg01/dK0hjFjeGw1PIiEwsw/UbkvwE3UPn/wTu0mUeSDw6pKqYqykY2Uwgvs1ejx1qFSLb0ofFPkvHYQtATpuvlsVjMM/qP+fBJNjJbUDgsKo4UEpVBfZ3hdU3yh4odNTsXdJ7bYfeP4f2p95Vqg1wTEySemwFjkNl/acGvZkL9h/asy+h"
  tags = {
      Name = "JOAS"
      Team = "SRE"
      Owner = "JOAS-1"
  }
}