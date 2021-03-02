resource "aws_security_group_rule" "LDAP_UDP" {
  description = "LDAP UDP"
  type              = "ingress"
  from_port         = 389
  to_port           = 389
  protocol          = "udp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "LDAP_TCP" {
  description = "LDAP TCP"
  type              = "ingress"
  from_port         = 389
  to_port           = 389
  protocol          = "tcp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "LDAP_SSL_TCP" {
  description = "LDAP SSL"
  type              = "ingress"
  from_port         = 636
  to_port           = 636
  protocol          = "tcp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "LDAP_GC_TCP" {
  description = "LDAP GC"
  type              = "ingress"
  from_port         = 3268
  to_port           = 3268
  protocol          = "tcp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "LDAP_GC_SSL_TCP" {
  description = "LDAP GC SSL"
  type              = "ingress"
  from_port         = 3269
  to_port           = 3269
  protocol          = "tcp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "Kerberos_TCP" {
  description = "Kerberos TCP"
  type              = "ingress"
  from_port         = 88
  to_port           = 88
  protocol          = "tcp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "Kerberos_UDP" {
  description = "Kerberos UDP"
  type              = "ingress"
  from_port         = 88
  to_port           = 88
  protocol          = "udp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "DNS_UDP" {
  description = "DNS UDP"
  type              = "ingress"
  from_port         = 53
  to_port           = 53
  protocol          = "udp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "DNS_TCP" {
  description = "DNS TCP"
  type              = "ingress"
  from_port         = 53
  to_port           = 53
  protocol          = "tcp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "SMB_UDP" {
  description = "SMB,CIFS,SMB2, DFSN, LSARPC, NbtSS, NetLogonR, SamR, SrvSvc UDP"
  type              = "ingress"
  from_port         = 445
  to_port           = 445
  protocol          = "udp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "SMB_TCP" {
  description = "SMB,CIFS,SMB2, DFSN, LSARPC, NbtSS, NetLogonR, SamR, SrvSvc TCP"
  type              = "ingress"
  from_port         = 445
  to_port           = 445
  protocol          = "tcp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "SMTP_TCP" {
  description = "SMTP TCP"
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "RPC_TCP" {
  description = "RPC, EPM TCP"
  type              = "ingress"
  from_port         = 135
  to_port           = 135
  protocol          = "tcp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "DCOM_TCP" {
  description = "RPC, DCOM, EPM, DRSUAPI, NetLogonR, SamR, FRS Windows Server 2003 TCP"
  type              = "ingress"
  from_port         = 1025
  to_port           = 5000
  protocol          = "tcp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "EPM_TCP" {
  description = "RPC, DCOM, EPM, DRSUAPI, NetLogonR, SamR, FRS Windows Server 2008+ TCP"
  type              = "ingress"
  from_port         = 49152
  to_port           = 65535
  protocol          = "tcp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "DFSR_TCP" {
  description = "RPC, DFSR (SYSVOL) TCP"
  type              = "ingress"
  from_port         = 5722
  to_port           = 5722
  protocol          = "tcp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "WindowsTime_UDP" {
  description = "Windows Time UDP"
  type              = "ingress"
  from_port         = 123
  to_port           = 123
  protocol          = "udp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "KerberosPassword_UDP" {
  description = "Kerberos change/set password UDP"
  type              = "ingress"
  from_port         = 464
  to_port           = 464
  protocol          = "udp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "KerberosPassword_TCP" {
  description = "Kerberos change/set password TCP"
  type              = "ingress"
  from_port         = 464
  to_port           = 464
  protocol          = "tcp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "DCOM_UDP" {
  description = "RPC, DCOM, EPM Windows Server 2003 TCP"
  type              = "ingress"
  from_port         = 1025
  to_port           = 5000
  protocol          = "udp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "EPM_UDP" {
  description = "RPC, DCOM, EPM Windows Server 2008+ TCP"
  type              = "ingress"
  from_port         = 49152
  to_port           = 65535
  protocol          = "udp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "DFSN_UDP" {
  description = "DFSN, NetLogon, NetBIOS Datagram Service UDP"
  type              = "ingress"
  from_port         = 138
  to_port           = 138
  protocol          = "udp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "ADDSWeb_TCP" {
  description = "AD DS Web Services SOAP TCP"
  type              = "ingress"
  from_port         = 9389
  to_port           = 9389
  protocol          = "tcp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "DHCP_UDP" {
  description = "DHCP, MADCAP UDP"
  type              = "ingress"
  from_port         = 67
  to_port           = 67
  protocol          = "udp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "MADCAP_UDP" {
  description = "DHCP, MADCAP UDP"
  type              = "ingress"
  from_port         = 2535
  to_port           = 2535
  protocol          = "udp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "NetLogon_UDP" {
  description = "NetLogon, NetBIOS Name Resolution UDP"
  type              = "ingress"
  from_port         = 137
  to_port           = 137
  protocol          = "udp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

resource "aws_security_group_rule" "NetLogon_TCP" {
  description = "DFSN, NetBIOS Session Service, NetLogon TCP"
  type              = "ingress"
  from_port         = 139
  to_port           = 139
  protocol          = "tcp"
  source_security_group_id = aws_security_group.DC_SG.id
  security_group_id = aws_security_group.DC_SG.id
  depends_on = [ aws_security_group.DC_SG ]
}

