Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 005046288A
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 20:46:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jDtr0MBBzDqPn
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 04:46:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gkeishin@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jDtD33FWzDqP2
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2019 04:45:52 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x68IgeM7096128
 for <openbmc@lists.ozlabs.org>; Mon, 8 Jul 2019 14:45:50 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tm8867kwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 08 Jul 2019 14:45:50 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Mon, 8 Jul 2019 18:45:49 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 8 Jul 2019 18:45:29 -0000
Received: from us1a3-mail113.a3.dal06.isc4sb.com ([10.146.6.4])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2019070818452973-842619 ;
 Mon, 8 Jul 2019 18:45:29 +0000 
MIME-Version: 1.0
Subject: OpenBMC Test 2.7 release (Warrior) information 
To: "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
From: "George Keishing" <gkeishin@in.ibm.com>
Date: Tue, 9 Jul 2019 00:15:25 +0530
X-KeepSent: F283F771:84A42BFB-00258431:00668028;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1 November 29, 2018
X-LLNOutbound: False
X-Disclaimed: 63915
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=8FBB0EA2DFF506B88f9e8a93df938690918c8FBB0EA2DFF506B8"
Content-Disposition: inline
x-cbid: 19070818-3815-0000-0000-00000C071162
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00011397; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01229324; UDB=6.00647421; IPR=6.01010584; 
 BA=6.00006352; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00027637; XFM=3.00000015;
 UTC=2019-07-08 18:45:47
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-07-08 15:15:59 - 6.00010140
x-cbparentid: 19070818-3816-0000-0000-000010B22CF8
Message-Id: <OFF283F771.84A42BFB-ON00258431.00668028-65258431.00670954@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-08_06:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--0__=8FBB0EA2DFF506B88f9e8a93df938690918c8FBB0EA2DFF506B8
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=ISO-8859-1



Refer: https://github.com/openbmc/openbmc-test-automation/releases

This release is for the OpenBMC community Warrior branch

OpenBMC Dev branch=A0https://github.com/openbmc/openbmc/tree/warrior
OpenBMC test branch
https://github.com/openbmc/openbmc-test-automation/tree/warrior

OpenBMC branches follow Yocto Releases see
https://wiki.yoctoproject.org/wiki/Releases=A0or
https://github.com/openbmc/docs/tree/master/release

Changes since v2.6-thud-stable:
      Redfish features testing support
            Certificates
            Local User Management (Redfish/IPMI)
            LDAP
            Network
            Event Logging
            DateTime
            Boot Devices
            DMTF Tools etc.
      Code fixes and documentation updates


Thanks and Regards,
 George Keishing


--0__=8FBB0EA2DFF506B88f9e8a93df938690918c8FBB0EA2DFF506B8
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=ISO-8859-1
Content-Disposition: inline

<html><body><p><font color=3D"#2F2F2F" face=3D"Segoe UI">Refer: </font><a h=
ref=3D"https://github.com/openbmc/openbmc-test-automation/releases"><font f=
ace=3D"Segoe UI">https://github.com/openbmc/openbmc-test-automation/release=
s</font></a><br><br><font color=3D"#24292E" face=3D"Segoe UI">This release =
is for the OpenBMC community Warrior branch</font><br><br><font color=3D"#2=
4292E" face=3D"Segoe UI">OpenBMC Dev branch=A0</font><a href=3D"https://git=
hub.com/openbmc/openbmc/tree/warrior"><font color=3D"#0366D6" face=3D"Segoe=
 UI">https://github.com/openbmc/openbmc/tree/warrior</font></a><font color=
=3D"#24292E" face=3D"Segoe UI"><br>OpenBMC test branch=A0</font><a href=3D"=
https://github.com/openbmc/openbmc-test-automation/tree/warrior"><font colo=
r=3D"#0366D6" face=3D"Segoe UI">https://github.com/openbmc/openbmc-test-aut=
omation/tree/warrior</font></a><br><br><font color=3D"#24292E" face=3D"Sego=
e UI">OpenBMC branches follow Yocto Releases see=A0</font><a href=3D"https:=
//wiki.yoctoproject.org/wiki/Releases"><font color=3D"#0366D6" face=3D"Sego=
e UI">https://wiki.yoctoproject.org/wiki/Releases</font></a><font color=3D"=
#24292E" face=3D"Segoe UI">=A0or=A0</font><a href=3D"https://github.com/ope=
nbmc/docs/tree/master/release"><font color=3D"#0366D6" face=3D"Segoe UI">ht=
tps://github.com/openbmc/docs/tree/master/release</font></a><br><br><b><fon=
t color=3D"#24292E" face=3D"Segoe UI">Changes since v2.6-thud-stable:</font=
></b><ul><ul type=3D"disc"><li><font color=3D"#24292E" face=3D"Segoe UI">Re=
dfish features testing support</font><ul><ul type=3D"disc"><li><font color=
=3D"#24292E" face=3D"Segoe UI">Certificates</font><li><font color=3D"#24292=
E" face=3D"Segoe UI">Local User Management (Redfish/IPMI)</font><li><font c=
olor=3D"#24292E" face=3D"Segoe UI">LDAP</font><li><font color=3D"#24292E" f=
ace=3D"Segoe UI">Network</font><li><font color=3D"#24292E" face=3D"Segoe UI=
">Event Logging</font><li><font color=3D"#24292E" face=3D"Segoe UI">DateTim=
e</font><li><font color=3D"#24292E" face=3D"Segoe UI">Boot Devices</font><l=
i><font color=3D"#24292E" face=3D"Segoe UI">DMTF Tools etc.</font></ul></ul>
<li><font color=3D"#24292E" face=3D"Segoe UI">Code fixes and documentation =
updates</font></ul></ul><br><br><b><font size=3D"2" color=3D"#0000FF">Thank=
s and Regards,</font></b><br><font size=3D"2" color=3D"#0000FF"> George Kei=
shing</font><br><br><BR>
</body></html>

--0__=8FBB0EA2DFF506B88f9e8a93df938690918c8FBB0EA2DFF506B8--

