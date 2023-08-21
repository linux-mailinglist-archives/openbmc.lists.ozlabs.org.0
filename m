Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24616782D81
	for <lists+openbmc@lfdr.de>; Mon, 21 Aug 2023 17:48:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cBbgUV71;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RTxj45mhlz3bwp
	for <lists+openbmc@lfdr.de>; Tue, 22 Aug 2023 01:48:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cBbgUV71;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RTxhT6lxZz30BZ;
	Tue, 22 Aug 2023 01:48:09 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37LFg7Ne005729;
	Mon, 21 Aug 2023 15:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : subject : references : from : to : in-reply-to :
 mime-version; s=pp1; bh=SUzveMa6TcIgCPrGYrCkczzKa3pRVkIoDQ3jAuSty3U=;
 b=cBbgUV711HByMvqCnc/wUcLRxJwmO4R/kfXEprI8htYAAiBoyhinaKOe01ZQlJUqxQoq
 E8gl0Yo9c/Azny9w4LGs/nUnmdPb0pq70FW6+u4VaB9s9HcIq4wgnDbM8YrYkqFg79SA
 MNX6sYGcZ2NMD6QeK7TwbSwJKx4QOH7+dH1KN2Xyv5/azQOhR+2TDqmXhTWTy8pV/b0y
 xwosVrCAD87CImSrrUVWJDbDePxvii3U5wA9r2g/wCF57FswkIbgI5TQV4REIIEQ5fGU
 9KKe5I+Ef/IjYTM9FiW8mzgkXdP+TJCil9+0aeWK8VvtQkC+hbLt/nRnZPP6SZGnUMq+ jw== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3smasu84wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Aug 2023 15:48:05 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37LFBk01007493;
	Mon, 21 Aug 2023 15:48:04 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ska9juvav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Aug 2023 15:48:03 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37LFknFZ5767882
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Aug 2023 15:46:49 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E0F8658059;
	Mon, 21 Aug 2023 15:46:48 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DAAD58057;
	Mon, 21 Aug 2023 15:46:48 +0000 (GMT)
Received: from [9.67.103.238] (unknown [9.67.103.238])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 21 Aug 2023 15:46:47 +0000 (GMT)
Content-Type: multipart/mixed; boundary="------------yfrL4KF0MA99pr0bN3kgjs0Z"
Message-ID: <88ba508b-1f0f-450e-024e-4174da81f39f@linux.ibm.com>
Date: Mon, 21 Aug 2023 10:46:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Fwd: Red Hat extends support for the CVE Program!
References: <CAJvML35iUb22hvdiS+j9QWU9Uq1W2qu2aw8OSFF0GqroCpRe7Q@mail.gmail.com>
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>,
        "openbmc-security@lists.ozlabs.org" <openbmc-security@lists.ozlabs.org>,
        "Mihm, James" <james.mihm@intel.com>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>
In-Reply-To: <CAJvML35iUb22hvdiS+j9QWU9Uq1W2qu2aw8OSFF0GqroCpRe7Q@mail.gmail.com>
X-Forwarded-Message-Id: <CAJvML35iUb22hvdiS+j9QWU9Uq1W2qu2aw8OSFF0GqroCpRe7Q@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4ICnhUUHFPsKJPweewkMbpwQDdOzZscX
X-Proofpoint-GUID: 4ICnhUUHFPsKJPweewkMbpwQDdOzZscX
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-21_03,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1011 malwarescore=0
 spamscore=0 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308210144
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

This is a multi-part message in MIME format.
--------------yfrL4KF0MA99pr0bN3kgjs0Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

To: OpenBMC community email list
To: OpenBMC Technical Steering Committee (TSC)
To: OpenBMC Technical Oversight Forum (TOF)
To: OpenBMC Security Response Team
To: OpenBMC CNA members


Does the OpenBMC project want to use RedHat as their root CNA?

The RedHat CVE Numbering Authority (CNA) is extending an invitation to 
all open source projects, including OpenBMC, to use RedHat as their root 
CNA. Does the OpenBMC project want to use RedHat as their root CNA?

This email is intended to forward this question and relevant background 
information to the TSC, TOF, and security areas, not to discuss which 
alternatives to choose.

This email is not confidential (the attached email is not confidential).

Please forward this to the OpenBMC Technical Steering Committee (TSC) 
and to the OpenBMC Technical Oversight Forum (TOF).


Background:
CVEs are used to identify security vulnerabilities.
https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures
https://www.cve.org/ProgramOrganization/CNAs

The OpenBMC project has a security response team.  It is intended to 
give the project time to address security problems before public disclosure.
Reference: 
https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team.md

The OpenBMC project has a continuing need to issue CVEs.  There are 
several options:

1. The OpenBMC security response team formed a CNA (specifically James 
Mihm, Joseph Reynolds, Dhananjay Phadke were trained by Mitre in the CNA 
program).  There are several CVEs in progress (CVEs reserved but not 
published).
https://www.cve.org/Media/News/item/news/2022/1/11/The-OpenBMC-Project-Added-as

2. GitHub can create CVEs for us via each source repo's "Security" tab.  
Some OpenBMC project repos have created CVEs that way.
For example, see 
https://github.com/openbmc/bmcweb/security/advisories?state=published

3. RedHat CNA is offering to include OpenBMC.  They offer tools and 
support for CVE tasks.  See the attached "CVE Program FAQ" PDF or see:
https://www.cve.org/Media/News/item/blog/2023/01/10/Why-Red-Hat-Became-Root

4. In addition, organizations consuming OpenBMC will continue to have 
their own security response teams.  They can write CVEs for their own 
products (from any source, including vulnerabilities which originate in 
OpenBMC), but are not allowed to write OpenBMC-scoped CVEs.  (For 
security vulnerabilities which originate in the OpenBMC project itself, 
ideally OpenBMC would write a CVE and that CVE would be referenced by 
everyone else.)

For example, the IBM PSIRT team has a CNA for its own products.
Reference: 
https://www.ibm.com/support/pages/product-security-incident-response-psirt-information

Full disclosure: I work for IBM, and IBM owns RedHat.

- joseph


-------- Forwarded Message --------
Subject: 	[Openbmc-security-CONFIDENTIAL] Red Hat extends support for 
the CVE Program!
Date: 	Tue, 15 Aug 2023 10:35:36 +0530
From: 	Yogesh Mittal <ymittal@redhat.com>
CC: 	Jeremy West <jwest@redhat.com>, Christina Freeman 
<chfreema@redhat.com>, rootcna-coordination@redhat.com, Yoav Buenos 
<ybuenos@redhat.com>, Pedro Sampaio <psampaio@redhat.com>



This is CONFIDENTIAL. See:
https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team-guidelines.md

--------------yfrL4KF0MA99pr0bN3kgjs0Z
Content-Type: text/html; charset="UTF-8"; name="Attached Message Part"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="Attached Message Part"

<head><!-- BaNnErBlUrFlE-HeAdEr-start -->
<style>
  #pfptBannerbjucpxt { all: revert !important; display: block !important;=20
    visibility: visible !important; opacity: 1 !important;=20
    background-color: #D0D8DC !important;=20
    max-width: none !important; max-height: none !important }
  .pfptPrimaryButtonbjucpxt:hover, .pfptPrimaryButtonbjucpxt:focus {
    background-color: #b4c1c7 !important; }
  .pfptPrimaryButtonbjucpxt:active {
    background-color: #90a4ae !important; }
</style>

<!-- BaNnErBlUrFlE-HeAdEr-end -->
</head><!-- BaNnErBlUrFlE-BoDy-start -->
<!-- Preheader Text : BEGIN -->
<div style=3D"display:none !important;display:none;visibility:hidden;mso-hi=
de:all;font-size:1px;color:#ffffff;line-height:1px;height:0px;max-height:0p=
x;opacity:0;overflow:hidden;">
 Hello fellow technology enthusiasts! We would like to extend a warm welcom=
e from Red Hat, a long-time CVE Numbering Authority (CNA) within the CVE Pr=
ogram and a Root for open source projects.&#8202;=C2=A0 Since you are liste=
d as an open source organization
</div>
<!-- Preheader Text : END -->

<!-- Email Banner : BEGIN -->
<div style=3D"display:none !important;display:none;visibility:hidden;mso-hi=
de:all;font-size:1px;color:#ffffff;line-height:1px;height:0px;max-height:0p=
x;opacity:0;overflow:hidden;"></div>
<!-- Email Banner : END -->

<!-- BaNnErBlUrFlE-BoDy-end -->
<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif"><span id=3D"gmail-docs-internal-guid-587bdf03-7fff-abaf-bc86-bc=
28b148c8d5"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;vertical-align:bas=
eline">Hello fellow technology enthusiasts!</span></p><br><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline">We would like to exten=
d a warm welcome from Red Hat, a long-time CVE Numbering Authority (CNA) wi=
thin the CVE Program and a Root for open source projects.=C2=A0</span></p><=
br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline">Si=
nce you are listed as an open source organization on the </span><a href=3D"=
https://www.cve.org/PartnerInformation/ListofPartners" style=3D"text-decora=
tion-line:none"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;font-variant-alternates:normal;text-decoration-line:underline;=
vertical-align:baseline">cve.org list of partner</span></a><span style=3D"f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(17,85,204);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;font-variant-alternates:normal;text-decoration-line:underline;vertical-al=
ign:baseline">s</span><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical=
-align:baseline">, we are contacting you to extend our support and expertis=
e in the program and across the open source community. If you would like to=
 have Red Hat as your Root, please respond to this email or reach out to us=
 directly at </span><a href=3D"mailto:rootcna-coordination@redhat.com" styl=
e=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-family:A=
rial,sans-serif;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-variant-alternates:normal;text-decoration=
-line:underline;vertical-align:baseline">rootcna-coordination@redhat.com</s=
pan></a><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rg=
b(0,0,0);background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;vertical-align:baselin=
e">.</span></p><br><span style=3D"font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-al=
ign:baseline">Attached is a FAQ document to answer some of the common quest=
ions that existing CNAs have. If you have any further questions, please fee=
l free to contact us at </span><a href=3D"mailto:rootcna-coordination@redha=
t.com" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;fo=
nt-family:Arial,sans-serif;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;text=
-decoration-line:underline;vertical-align:baseline">rootcna-coordination@re=
dhat.com</span></a><span style=3D"font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-al=
ign:baseline">.</span></span><br clear=3D"all"></div><div class=3D"gmail_de=
fault" style=3D"font-family:verdana,sans-serif"><span><span style=3D"font-s=
ize:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline"><br></span></span></div><d=
iv><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signa=
ture"><div dir=3D"ltr"><p style=3D"color:rgb(34,34,34);font-size:13px;margi=
n:0px;font-family:RedHatText,sans-serif">Thanks and regards,</p><p style=3D=
"color:rgb(34,34,34);font-weight:bold;margin:0px;padding:0px;font-size:16px=
;font-family:RedHatText,sans-serif">Yogesh=C2=A0Mittal<span style=3D"color:=
rgb(170,170,170);margin:0px"></span></p><p style=3D"color:rgb(34,34,34);fon=
t-size:12px;margin:0px;font-family:RedHatText,sans-serif">Manager, Product =
Security Incident Response</p><p style=3D"color:rgb(34,34,34);margin:0px 0p=
x 4px;font-size:12px;font-family:RedHatText,sans-serif"><a href=3D"https://=
www.redhat.com/" style=3D"color:rgb(0,136,206);margin:0px" target=3D"_blank=
">Red Hat=C2=A0Pune</a></p><div style=3D"color:rgb(34,34,34);margin-bottom:=
4px"></div><p style=3D"color:rgb(34,34,34);margin:0px;font-size:12px;font-f=
amily:RedHatText,sans-serif"><span style=3D"margin:0px;padding:0px"><a href=
=3D"mailto:ymittal@redhat.com" style=3D"color:rgb(0,0,0);margin:0px" target=
=3D"_blank">ymittal@redhat.com</a>=C2=A0 =C2=A0</span><br>M:=C2=A0<a href=
=3D"tel:+91-9637123455" style=3D"color:rgb(0,0,0);margin:0px" target=3D"_bl=
ank">+91-9637123455</a></p><p style=3D"color:rgb(34,34,34);margin:0px;font-=
size:12px;font-family:RedHatText,sans-serif"><br></p><div><div dir=3D"ltr">=
<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><table border=3D"0" styl=
e=3D"color:rgb(34,34,34)"><tbody><tr><td width=3D"100px"><a href=3D"https:/=
/www.redhat.com/" style=3D"color:rgb(17,85,204)" target=3D"_blank"><img src=
=3D"https://static.redhat.com/libs/redhat/brand-assets/2/corp/logo--200.png=
" width=3D"90" height=3D"auto"></a></td></tr></tbody></table></div></div></=
div></div></div></div></div></div></div>


--------------yfrL4KF0MA99pr0bN3kgjs0Z
Content-Type: application/pdf; name="CVE Program FAQ_OSS CNA.pdf"
Content-Disposition: attachment; filename="CVE Program FAQ_OSS CNA.pdf"
Content-Transfer-Encoding: base64

JVBERi0xLjQKJdPr6eEKMSAwIG9iago8PC9UaXRsZSAoQ1ZFIFByb2dyYW0gRkFRX09TUyBD
TkFfdjEuMCkKL1Byb2R1Y2VyIChTa2lhL1BERiBtMTE3IEdvb2dsZSBEb2NzIFJlbmRlcmVy
KT4+CmVuZG9iagozIDAgb2JqCjw8L2NhIDEKL0JNIC9Ob3JtYWw+PgplbmRvYmoKNyAwIG9i
ago8PC9DQSAxCi9jYSAxCi9MQyAwCi9MSiAwCi9MVyAxLjMzMzMzMzM3Ci9NTCAxMAovU0Eg
dHJ1ZQovQk0gL05vcm1hbD4+CmVuZG9iago4IDAgb2JqCjw8L1R5cGUgL1hPYmplY3QKL1N1
YnR5cGUgL0ltYWdlCi9XaWR0aCAxMjI2Ci9IZWlnaHQgMjkwCi9Db2xvclNwYWNlIC9EZXZp
Y2VSR0IKL0JpdHNQZXJDb21wb25lbnQgOAovRmlsdGVyIC9EQ1REZWNvZGUKL0NvbG9yVHJh
bnNmb3JtIDAKL0xlbmd0aCAyMzA3Mz4+IHN0cmVhbQr/2P/gABBKRklGAAECAAABAAEAAP/b
AEMACAYGBwYFCAcHBwkJCAoMFA0MCwsMGRITDxQdGh8eHRocHCAkLicgIiwjHBwoNyksMDE0
NDQfJzk9ODI8LjM0Mv/bAEMBCQkJDAsMGA0NGDIhHCEyMjIyMjIyMjIyMjIyMjIyMjIyMjIy
MjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMv/AABEIASIEygMBIgACEQEDEQH/xAAfAAAB
BQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgv/xAC1EAACAQMDAgQDBQUEBAAAAX0BAgMABBEF
EiExQQYTUWEHInEUMoGRoQgjQrHBFVLR8CQzYnKCCQoWFxgZGiUmJygpKjQ1Njc4OTpDREVG
R0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmq
srO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4eLj5OXm5+jp6vHy8/T19vf4+fr/xAAfAQAD
AQEBAQEBAQEBAAAAAAAAAQIDBAUGBwgJCgv/xAC1EQACAQIEBAMEBwUEBAABAncAAQIDEQQF
ITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RF
RkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeo
qaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEA
AhEDEQA/APf6KKKACiiigAooooAKKKKACiiigAooooAKKKbJIkUbSSMqIgLMzHAAHUmgAd1j
Qu7BVUZJJwAK5TUfiN4e0+Volnlu3Xg/Zk3D8yQD+Brz7xn40uPEF09raSNHpiHCqODLj+Jv
b0H9a5CuOpibO0T6zAcOxlBTxLd30X6nsEXxX0VnxJZ3yD+8FU/+zV0uleKdF1ohbK/jaU/8
sn+R/wAj1/CvnqlBwciojiZrc7K3DmFkv3bcX9/9fefTlFeIaF8Q9Z0gLFO4vrYcbJidwHs3
X8816LpPxB0DU1VXufscx6pc/KP++un610wrwkfO4vJsVhteXmXda/hudVRUUNzBcJvgmjlX
ruRgw/SsrVvFejaLEzXV9GZAOIYmDyH8B0/HArVySV2ebCjUqS5IRbZqXd3BY2slzdSpFDGN
zu5wAK8l8R/Eu/vZng0djaWo483H7x/f/ZH0596xfFXjC98TXAVgYbKM5jgB7+rHuf5VzlcV
Wu3pHY+yyvI4UV7TEq8u3Rf5s1R4m15W3DWtQz73Lkflmtex+I/iOzID3Ud0g/hnjB/UYP61
ydFYKclsz2qmCw9RWnBP5I9W034s2smF1LT5IT3kgbePyOCP1rstM8SaPrGBY6hDI5/5Zk7X
/wC+Tg1870oODkVtHEyW+p5GI4dwtTWm3F/evx/zPpyivBNJ8b69pG1Yr1poR/yyuPnX8zyP
wNd1pHxV0+42x6pbSWj95I/nT8uo/WuiOIhLfQ8HE5Di6OsVzLy3+7/K56DRVWx1Gz1KDzrK
6iuI/wC9GwOPr6Varfc8WUXF2krMKKKKBBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU
UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF
ABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU
UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFF
ABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU
UUUAFFFFABRRRQAUUUUAFFFFABXnvxR19rSwi0aBsSXI3zEHkRg8D8T/AC969BJCqWYgAckn
tXzx4k1U614gvL7PySSYjHog4X9BWGInyxsup7uQYRV8T7SS0hr8+n+fyMqiiivPPvAooooA
KKKKACiiigAooooAKKKKACiiigAooooAntby5sZ1ntLiSCVejxsVP6V3GjfFLUbTbFqkC3kQ
48xcJIP6H9PrXAUVcZyjszlxOCoYlWqxT/P7z6D0XxXo+vACyu184jmCT5ZB+Hf8M1tV8xqx
Vgykgg5BB5BrsNC+I2saVtiu2+32w/hlb5wPZv8AHNdMMStpHzOM4blH3sNK/k9/v/4Y9sor
D0LxZpPiBALS4Cz4y0EnyuPw7/hmtyupNNXR81VpTpS5Kis/MKKKKZmFFFFABRRRQAUUUUAF
FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR
QAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF
FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR
QAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF
FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAHN+O9V/snwndurYlnHkR/Vuv/juTXg1eg/Fb
VfP1e20xG+S2Te4/22/wAH/fVefV5+IlzTt2Pvshw3scIpPeWv8Al/n8wooorA9sKKKKACii
igAooooAKKKKACiiigAooooAKKKKACiiigAooooAcjvFIrxsyOpyrKcEH2Neh+F/iXPbMlpr
haaDoLkDLr/vD+Ie/X6151RVwnKDujlxWDo4qHJVV/zXofTME8V1Ak8EiSRSDcjochh6g1JX
iHgfxdJoF+trcuW02dsOCf8AVMf4x/X/AOtXtwIYAggg8givQpVFNXPgMxy+eCq8ktU9n/XU
WiiitDzwooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA
ooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK
KACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA
ooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK
KACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACmSypBC8sjBURSzE9gOTT6
5H4jar/Z3hSaFWxLeMIFx/dPLfoMfjUylyps3w1B160aS6ux47q2oPqur3d/JkGeVnAPYZ4H
4DAqlRRXlN31P1CEVCKjHZBRRRQUFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU
UUUAFFFFABXuPw71dtU8LRJK26a0byGJ6kDlT+Rx+FeHV6F8J77ytZvbEnCzwiQf7yn/AAY/
lW2HlafqeNn2HVXByl1jr/n+B63RRRXon5+FFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFA
BRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUU
UUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFA
BRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUU
UUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFA
BRRRQAV438UNV+2eIo7FGzFZx4IH99uT+m0fhXr11cxWdpNdTNtihQyOfQAZNfOF9dyX9/cX
kv8ArJ5Gkb6k5rmxMrR5e59Jw3huevKs9or8X/wPzK9FFFcJ9qFFFFABRRRQAUUUUAFFFFAB
RRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVu+Db3+z/F2mzE4VphE30f5f61hU5HaN1dC
QynII7GnF2dzKtTVWnKm+qa+8+m6Krafdrf6ba3i/dniWQD0yM1Zr1j8slFxbT6BRRRQIKKK
KACiiigAooooAKKKKACiiigAooooAKKKKACivn/9pr/mVv8At7/9o14BQB9/0V8AUUAff9Ff
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
yTXFtJqtwvO69YMgPsgAX880AfM2n+Edc1PRL3WrewkGmWcZklupPlTjspP3j7DPvisOvujx
D4ft9f8AC95oRc21vcw+TuiUfIOOg6dq8m/4Zr0f/oYL7/vylAHzhRX0f/wzXo//AEMF9/35
Sj/hmvR/+hgvv+/KUAfOFfd+g/8AIvaZ/wBekX/oArx//hmvR/8AoYL7/vyle02VsLKwt7VW
LLBEsYY9SFGM/pQBPRRRQAVS1bSbLXNKudM1GBZ7S4TZJG3cf0I6g9jV2igD5E+Inwl1jwVc
y3dtHJfaKSSl0i5MQ9JAOn+90Pt0rzuvv4gEEEZB6g15/wCI/gv4M8RSPObBtPuX5Mtgwjyf
dCCv6ZoA+QaK981H9mmUMzaZ4kRh2S5tiMf8CVj/ACrFf9nDxaHIj1TRGXsWllB/LyzQB47R
XscX7OHipmxNqujIvqkkrH8jGK27H9mhshr/AMTADukFpn/x4t/SgDwmw/5CFt/11X+Yr73r
y3R/gF4M0uVJrgX2oSIwYfaJ9qgj2QL+pNepUAFFFFABRRRQAUUUUAFZet+H9O1+18i/gDkD
5JF4dPof6dK1KKTSasy6dSVOSnB2aPDvEvgLUtBLzwg3diOfNRfmQf7S9vr0+lcnX071rjPE
fw603WN9xZYsbw8kov7tz7r2+o/WuSphusD6rAcRLSGK+9fqv8vuPFaK1da8OapoE2y/tmVC
cLKvzI30P9OtZVcrTTsz6mnUhUipwd0wooopFhRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR
RQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAV6F8JrQya1fXePlhgEefd
mB/kprz2vafhlphsfC/2mRcSXkhkGeuwcL/In8a2w8bzPHz2sqWCkustP6+R2lFFFeifnwUU
UUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFA
BRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUU
UUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFA
BRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUU
UUAFFFFABRRRQBHPBDcwtDPEksTjDI6hgR7g1wOvfC6zui8+jzfZZTz5MmTGfoeq/rXoVFRK
EZ7nVhcbXwsualK35fcfOeraFqWhz+VqFo8OThX6q30YcGs6vpi4t4LuBoLiGOaJxhkkUMD+
Brhdb+F2n3m6bSpjZynny2y0Z/qP1+lcs8M1rE+pwfEdKfu4hcr7rb/NfieQ0Vs6z4V1jQmJ
vbNxCP8AltH80Z/EdPxxWNXM01oz6KnVhVjzU3deQUUUUjQKKKKACiiigAooooAKKKKACiii
gAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiloA0NC0mXXNattPiyPNf52H8K
jlj+VfQ9vBHa20VvCoWKJAiKOwAwBXIfD7wqdE04312mL66UZUjmJOoX6nqfw9K7SvQoU+WN
3uz4LPcesTX5IP3Y/i+rCiiitzwwooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi
iigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoooo
AKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi
iigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoooo
AKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAEIDAggEHgg1yus/D7Q
tW3SJAbOc8+Zb8An3Xp+WDXV0VMoqWjNqGIq0Jc1KTT8jxbV/hprWn7ntAl/CO8Xyv8A98n+
hNcfPBNbStFPE8Ui9UkUqR9Qa+map3+l2GqReVfWkNwnbzEBI+h6j8K55YZP4WfQYbiSrHSv
Hm81o/8AL8j5uor13VfhVptxufTbmW0fsj/vE/Xkfma4vU/h94h03cwtBdxj+O2bf/47979K
55UZx6H0GHzjB19Izs+z0/4By1FPlikhkMcqMjjqrDBH4Uysj0k7hRRRQMKKKKACiiigAooo
oAKKKKACiiigAooooAKKKKACiiigAooooAKKKs2On3ep3S2tlbyTzN0VBn8T6D3NCVxSkoq8
nZFavT/AXgV0kj1jV4cEYa3t3HOezsP5D8a0/Cfw7t9JZL7VNlzejlIxykR/qffp/Ou7rso0
Le9I+QzbPFNOhhnp1f8Al/mFFFFdZ8sFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR
QAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF
FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR
QAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF
FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR
QAUUUUAVL3TLDUo9l7ZwXC448xA2Poe1cpqHww0K7y1qZ7N/RH3L+Tc/rXbUVMoRlujpoYzE
UP4U2vy+48fv/hVq9vlrK5trtR0BzGx/A5H61y994Z1vTc/a9MuUUdXCbl/76GRX0RRWMsNF
7HsUeI8VDSolL8H+Gn4HzFRX0de6Jpeo5N5p9tOx/ieIFvz61z158NPDlznyoZ7U+sMpP/oW
axeFl0Z6lLiXDy/iRa/H/L8jxKivULv4Rqcmz1Yj0WaHP6g/0rFufhbr8PMTWk4/2JSD/wCP
AVm6M10PRp5zgam1RL10/M4miuguPBHiW2zv0mdv+uZV/wD0EmsybR9Tts+fp13Fj+/Ay/zF
Q4yW6OyGJoz+Cafo0UqKVlKsVYEEdQaSpNwooooAKKKKACilVWZgqgknsBV+DQ9WuseRpl5J
7rAxH54ppN7ESnGGsnYz6K6i0+HviW6I/wBA8lT/ABTSKuPwzn9K37H4SXb4N/qcMQ/uwIXz
+Jxj8qtUpvZHFVzXB0viqL5a/kecVbsNMvtTm8mxtJrh+4jQnH1Pb8a9l074ceHrDDSQSXcg
/iuHyP8AvkYH55rqILeC1hENvDHDEvRI1CgfgK2jhX9pnkYjiWlHShBv10X9fceW6J8K7mYr
NrNwIE6mCEhnP1boPwzXpGl6Np+i232fT7VIU/iI5Zvcnqav0V0wpRhsfN4vMsRi3+9lp2W3
9eoUUUVocIUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR
QAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF
FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR
QAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF
FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR
QAUUUUAFFFFABRRRQAx4o5RiSNXH+0M1VfSNMkIL6daMR/egU/0oorOZ6OCIT4b0InJ0XTs/
9eqf4Un/AAjehf8AQF07/wABU/woorA9sP8AhG9C/wCgLp3/AICp/hU6aPpcZymm2anplYFH
9KKKqJhiPhLUcUcS4jjVB6KMU+iiuhbHztT4mFFFFMgKKKKACiiigAooooAKKKKACiiigAoo
ooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKA
CiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo
ooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKA
CiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA//9kKZW5kc3Ry
ZWFtCmVuZG9iago5IDAgb2JqCjw8L1R5cGUgL0Fubm90Ci9TdWJ0eXBlIC9MaW5rCi9GIDQK
L0JvcmRlciBbMCAwIDBdCi9SZWN0IFs5NC4zMDQ5NzcgNDk5LjY0OTk5IDEyMS40OTk4ODYg
NTEyLjI1XQovQSA8PC9UeXBlIC9BY3Rpb24KL1MgL1VSSQovVVJJIChodHRwczovL2dpdGh1
Yi5jb20vUmVkSGF0UHJvZHVjdFNlY3VyaXR5L2N2ZWxpYik+Pj4+CmVuZG9iagoxMCAwIG9i
ago8PC9UeXBlIC9Bbm5vdAovU3VidHlwZSAvTGluawovRiA0Ci9Cb3JkZXIgWzAgMCAwXQov
UmVjdCBbMjYwLjM1NDMxIDM0MS44OTk5OSA1MjQuMjQ5ODIgMzU0LjVdCi9BIDw8L1R5cGUg
L0FjdGlvbgovUyAvVVJJCi9VUkkgKGh0dHBzOi8vd3d3LmN2ZS5vcmcvTWVkaWEvTmV3cy9p
dGVtL2Jsb2cvMjAyMy8wMi8wNy9PcGVuLVNvdXJjZS1hbmQtdGhlLUNWRS1Qcm9ncmFtKT4+
Pj4KZW5kb2JqCjExIDAgb2JqCjw8L1R5cGUgL0Fubm90Ci9TdWJ0eXBlIC9MaW5rCi9GIDQK
L0JvcmRlciBbMCAwIDBdCi9SZWN0IFs5MCAzMjcuMTQ5OTkgMTcxLjgzNjY3IDMzOS43NV0K
L0EgPDwvVHlwZSAvQWN0aW9uCi9TIC9VUkkKL1VSSSAoaHR0cHM6Ly93d3cuY3ZlLm9yZy9N
ZWRpYS9OZXdzL2l0ZW0vYmxvZy8yMDIzLzAyLzA3L09wZW4tU291cmNlLWFuZC10aGUtQ1ZF
LVByb2dyYW0pPj4+PgplbmRvYmoKMTIgMCBvYmoKPDwvRmlsdGVyIC9GbGF0ZURlY29kZQov
TGVuZ3RoIDY4NjI+PiBzdHJlYW0KeJztXduOJMdxfZ+vmGcDTGZG3gFDwC6p1bPsBex3WxJg
iDZM/z/gE91d3TVdHZWR2VXdPSJJQFpO7VRm5SXixO2Ee7f49weH/8mV3v/jl7f/fTM5Hn46
/T9+6N7533/50/vxD7/+7e3HP/n3v/3fGz8vLr07G9P7r395++vbn6/eUPEXoon8FlO994cH
eNPlPy5v+/r97cdv4T3Y9+9/fXOXqTlnrMNfp/D+/ReM+UOwJpO11r1//8/3f8Yf8h/ev//X
GxVTcq054HeOD9yX44NsXMQDf35g6+HBH78Lg5ZqCK8iag/uwnGMaBIPns9jVH944MgEX2vJ
dHlij7/ir3+llOkB/8r8N87vKvwu5y6/QsdfsSbxk8u3lz+ufyJFa2qsOSnW97iM7rgoszFs
nL498/rWy8LHafAbB8L5bKjjSMR3l0w6/HN9Msh4/nHJp5njL1b+QZzm8fU482R89vjP2bod
T4CzhqqPlsr1ilbjq69kLx9V44cVlaYV8HXZWmrPrhzXNZhcEzb1MoUaVCOlwOfaJ69YiHT8
XIfPpWQpXj43nT63Bp+zmx0g3efWalJJmRTfa3+aTnEMDievqte8GBuiq+k8bUfutHYUsnPJ
9a6dC8lAcFANin0Kp0lkyimnyxKdLvKtQ/RtemLDxyenL8omUYkUZg/86YFPZC+iSjwkxU9D
ZEoxzba0Jmla4uDyUWx9YmuhKUIAZs9aorXO59nFj5s9TaI5VPamVNWWygshy4WkmoS3EdIt
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
dGlvbgovUyAvVVJJCi9VUkkgKGh0dHBzOi8vd3d3LmN2ZS5vcmcvTWVkaWEvTmV3cy9pdGVt
L2Jsb2cvMjAyMy8wMS8xMC9XaHktUmVkLUhhdC1CZWNhbWUtUm9vdCk+Pj4+CmVuZG9iagox
NSAwIG9iago8PC9UeXBlIC9Bbm5vdAovU3VidHlwZSAvTGluawovRiA0Ci9Cb3JkZXIgWzAg
MCAwXQovUmVjdCBbMjA1LjI0NjE1IDM3Ni4zOTk5OSAzNjUuNDc1NDYgMzg5XQovQSA8PC9U
eXBlIC9BY3Rpb24KL1MgL1VSSQovVVJJIChtYWlsdG86cm9vdGNuYS1jb29yZGluYXRpb25A
cmVkaGF0LmNvbSk+Pj4+CmVuZG9iagoxNiAwIG9iago8PC9GaWx0ZXIgL0ZsYXRlRGVjb2Rl
Ci9MZW5ndGggNDY2NT4+IHN0cmVhbQp4nO1d265btxF9P1+h5wKhSQ6vQFHAjpM8pzXQvrdJ
gKJp0fT/ga6RtSVZ0uwZUlvnksQHcBzto83bcLhmzYVh5/HzVcBftcfd339++u+Tq3n/6fJf
fBh2/PPn73af//HLT0/vvqPdT/974uctlF3wuex++eHpx6fvL97Q8QvZZX6L33+It3z+x+kt
Hz49vfsWL0m7Tz8+hVOXvnItRO99rLtP/PWvQnIxh44/u0//2P3R+5b+tPv0z6fiesi99IYv
fX7Q/f5BcwG/XlI5Pmjf7B+E4FrsPZdw40nNvadWTy8r+yfV1Vh7KXT6yrfSg/f7B+SCr72V
fHpV3j/ILvbQa+n6N9rSeCt4cOpuX4YeWu312HQIbf/5N5+EaW3VJV9LTpbpjYe2qVBH84aB
5/XWA9romAWsiKF5ea3UjuXGHTs96O+VjuXoejTNSigH2apYqhKvVwrrgRUp9klpGGEKsRsa
919/nhO/F5Sc+/WchIw5CfFa5hKxzNH1g4Amar0hc5cj6bR/kFzLeHDeRlofYiRML5Gv90jd
sfXMe8TTZX/l1nPB9kndMsEzQifu3aM0BqxVL9czf6UG5tu42oqbLyIRuRRjMS2i0l+5kdRc
jh4D0RsRFXMPi/ovmN+rEV4qTXk9NJGrrvAkpmhYwW/WB54gcjlEsgipeLxJA5d1k7IcKRXo
0hgtivE4u9T3zeinsbyA4rxLJ76mA1IPjjAAi/CK4iP1SoYbH5ZtEPEkGdYjHR7EkiGJBiUu
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
pZEJ/kzsl0JzrnATnMJCuVvMMwOCnzeS8U7sUPxtEYJxn7MCaW9Er4iGwSiFGmgxa7PnWMN4
2cbvtYUNLFtqx8MD+IzLl1qJz5GUcTU20Tr05QgnLlb5Be85fbvogNnFmRTkvcFiVmNqqQG3
FOyBu9grzQe0cjZga3afTDkhs0k3iUsUcYTsS/CdnFJM1RTm/yZrbmbOYGkcA/cIzPE6am7e
AGYpVP7XM1eYGY8RG085365Gt0b3jtYyYK0HWy495p4yJSh3DRTWEIopxEU9yuxlOMWF1YLZ
Il6WazbdZTyhDjXvU95flZ1eqC5jbdBvgUzxGWJxdFGFzpZxWK2/mDLZwpsX10dl5XrmlNAW
cSVPN/KGs9XiHg512zKyVAxi0LxXPblGbawQ2WbBfMQlN6Ac77n951UUkxipDXGK6rAYk+++
q3yURrQa2/4Bpd3PT+x3+Ez3nD7919NfVhiUgcbYVOVPAcBiW2iln5+olFObh0+XNvfj4gZZ
tfANRrtffnj66x92/8azsC9VjDXdf47fLGpYy7u/td3H/+DN3z/9H7XWlUIKZW5kc3RyZWFt
CmVuZG9iagoyIDAgb2JqCjw8L1R5cGUgL1BhZ2UKL1Jlc291cmNlcyA8PC9Qcm9jU2V0IFsv
UERGIC9UZXh0IC9JbWFnZUIgL0ltYWdlQyAvSW1hZ2VJXQovRXh0R1N0YXRlIDw8L0czIDMg
MCBSCi9HNyA3IDAgUj4+Ci9YT2JqZWN0IDw8L1g4IDggMCBSPj4KL0ZvbnQgPDwvRjQgNCAw
IFIKL0Y1IDUgMCBSCi9GNiA2IDAgUj4+Pj4KL01lZGlhQm94IFswIDAgNjEyIDc5Ml0KL0Fu
bm90cyBbOSAwIFIgMTAgMCBSIDExIDAgUl0KL0NvbnRlbnRzIDEyIDAgUgovU3RydWN0UGFy
ZW50cyAwCi9QYXJlbnQgMTcgMCBSPj4KZW5kb2JqCjEzIDAgb2JqCjw8L1R5cGUgL1BhZ2UK
L1Jlc291cmNlcyA8PC9Qcm9jU2V0IFsvUERGIC9UZXh0IC9JbWFnZUIgL0ltYWdlQyAvSW1h
Z2VJXQovRXh0R1N0YXRlIDw8L0czIDMgMCBSCi9HNyA3IDAgUj4+Ci9YT2JqZWN0IDw8L1g4
IDggMCBSPj4KL0ZvbnQgPDwvRjUgNSAwIFIKL0Y2IDYgMCBSPj4+PgovTWVkaWFCb3ggWzAg
MCA2MTIgNzkyXQovQW5ub3RzIFsxNCAwIFIgMTUgMCBSXQovQ29udGVudHMgMTYgMCBSCi9T
dHJ1Y3RQYXJlbnRzIDEKL1BhcmVudCAxNyAwIFI+PgplbmRvYmoKMTcgMCBvYmoKPDwvVHlw
ZSAvUGFnZXMKL0NvdW50IDIKL0tpZHMgWzIgMCBSIDEzIDAgUl0+PgplbmRvYmoKMTggMCBv
YmoKPDwvaC42Nnk0a3FiajQ2OGEgWzIgMCBSIC9YWVogOTAgNzA2LjUgMF0KL2guMWoxZDV1
NWFyeGkgWzIgMCBSIC9YWVogOTAgNjU0Ljc1IDBdCi9oLmVtbXBhZDF4bzB5YSBbMiAwIFIg
L1hZWiA5MCA0ODIuMjUgMF0KL2guZHF2N2N6cm1naXZhIFsyIDAgUiAvWFlaIDkwIDMyNC43
NSAwXQovaC5pbGxvenV0a2tsd2kgWzIgMCBSIC9YWVogOTAgMTY3LjI1IDBdCi9oLjY2b2xq
cDg1ZWtwbCBbMTMgMCBSIC9YWVogOTAgNDMyIDBdPj4KZW5kb2JqCjE5IDAgb2JqCjw8L1R5
cGUgL0NhdGFsb2cKL1BhZ2VzIDE3IDAgUgovRGVzdHMgMTggMCBSPj4KZW5kb2JqCjIwIDAg
b2JqCjw8L0xlbmd0aDEgMzg2NAovRmlsdGVyIC9GbGF0ZURlY29kZQovTGVuZ3RoIDE5NzE+
PiBzdHJlYW0KeJztV2lMXNcVPve+YcYsxp4yi40NDDPAsOPZHRhIgBlmWCYsQzIYO3amLAMO
m2BwHKlSozhWLOq4Vl3VrZQ/XdQlStuoUitHdbqotOmPLlLdRqoUujg/3KZRW//AlRwzr9+9
s4Apkdp/VdV3xLtnu2e759x5ECOig3hpiEKBYA9/gg8QsT+A2xoaGoz6fuqYgHCOiO8LRZ/o
uvHgxnuQPw957WC0xTl94vQnIZsE/XR0tHP0TvJnVtBHQYcn5uNLSkzZAr0O+mOJ+MqS8Ib9
Bqz7EnPPTX+963IVUSFIzaGZqfik5QuOMci/CoZ3Bgzdz9mXQZ8CXTUznzxf8T5fxdbXYXNo
bnEi3vvZ8C+IlMegUz8fP79EX6LvAhf+LQvx+SlHQxS+tUno+5cWV5JqGyFW5hfypeWppRnt
5Yugi0DrbjD14uual0ESU1U6QKI2n6YnUZsJ0klq+9GAVtKoelzY3OPBDuV+6pdQ9qpvpIo0
5l02hHXBKaAaAA/0DIzSR+biyQUqzvgQ1tWsLWJ57z6zOvbxMwf8m1So/Emwf/fqb94U6+/3
6f+svqFyjVnB+ZCW+HYMVJTBObLIAzCsIp98AKMXAIwuARhdBTC6BpD+APukJYN8VxF/NjGT
FKLZZHyOiQppIBN14ExhV7HcBK6Az9nBnH8NL4YsD9I1jtOl/vTKTpOTtcutioYzraJk9HNP
pLt/gH5AnbScrqNynznAviYNvy99WdLepVeSsTC5amgGqwndpqAandRNPTSMs4xTguZpkZZl
XQU/SEMP89X1LFBlDnaf3PazPwd2wFOAFXppD3iV7maB5f2PQdcOuLgD3gT8TQAvypxtAbrI
men14kyvZ/tc9twzU8sL6LpMx0PGRQ+yYuzk9LzUfZs+A57uQ0/koUfdUO/toO6IPhSregvL
gSxX3dhB3VXv7tyf2ykmJg9+88mImblEVzAt1xBVgZyqPDlVCqQF0DQAGPSM4IgJ08oJ49hz
BTmIOeNyzjS5qUzv18qp1MidfMdUKlJbTG25rEEBfY9u0KcoSQsUpi7y488LqYhFRGDA/tJc
lIxK1e/L9235viMyUV8mHbIz4q8Uub+Afr8ErSvQuYr1WkZ3Q8SnvgLsLnRuQ2cdOh9AZx06
H0hLF2DpFizdgqUCaH0bWtehtQ6t69BaF5ZkXUrhVVz4a2JSNfnAv8Uog4vcbmdwjr74dQZX
6DHclGlcQ800ncHzYHMgg2upnqxpnIkbz5TBlW07uK+KEEMaPwiMaAQTP4/ZX6BeVDJOczSL
uz5GU1gTuEGS0JjC7R6GLEkBcFdoCVpxeo6apCxBq5Jexh0yhfcKdBZhz0IORHoMve7K2LBk
rFh22bHssrO9r40iuJ/6kWPbfxDHv1If7rsbsS5hXc7la4Fn4d0BbBScqUx8O20MQX+RzoI7
IelOeEtCd1Hmb6FaaSkJyyvUSi2ABOwLjVX6KLKbkFVveSinQZzqtKz+rDyHh6U9sqZJquOc
/LsnnH8lfYPwX1GjXGcows+gdv/Gw1+iiFKX3reXzf8//50P1+B3ZC9+H7pvj0c5SY9K+dC2
nI2Dx8ivvsJ+wv8qvh9i+kq9n61NKiMPvoEbCB3Av4ivDJ24K1aYi9nslbqSSkXDrE8xy+hY
6jsnksywxm9uBd55h5WzGKw1qpv8Nf4W2YiC1mbucXdwl9NkMutqamzWYm40lIP2+szFnF0f
eHHS55t8ccA3FbO66s53ts9EGhoen23vPFfrtMUmC30TFwYGLkz4jriqvS2uxsHZjvazg42u
JneV+4j4bUSH8x7Eh8/nFX2lMQsRtpkaY8bUX9hr/GZgs/tBIKPbBd38Hbr6tKYp9R707nen
foychd4Z6BXh90NoInajQau12fR6xO1x19hsEXYsOHX8+HTg3Y3Q6Ghog990nmxvP+lK/Zad
7e3oCMNKo/p3voUqmDHHFLRjf64W5aiBVmeuRhHsPrMXJpt5tjL8oqMu7hEpi9T7sXZ4+lI/
rA1XTA721zY1RKb9/gRqFEkcbDtcli2PWAfXHCc6DSXPFo3XznV0zA42ZquV/oZIn6OWKM5c
JThIZkv9MbrF2OMpRL91mSe3Aoi6Sv0He4updJTq0AvWmhqP2+tymkXSVq3O7gVhMuptHq3W
bjCJU/SIQ9Vu+KItc6eGuwKd1f1NR72nms8kwtbhz4eON/WVV/Q0+kP5NYGm0Ii1y99uND9S
emh8NPVNR1nZ5+o9R8tPG0s88Fyr1vNClqIycRMFrTV2n0k48HhQOBmGcG32uPQGrZLzqzUa
TCbmck/XW5oi9lBfcDy43N29HGoYtvYurRwbOnx4uMUdPeaIvn3kcOshU6CrpzWwGg6vBsrL
nFsPnk6wkqrKe5YqZ8zrjblEnTAhSjnyrxYn7zJKn9KzyFqfrsJOXP9o3yPjnhFzxZM+30hL
b4+/LnCIK709bbWdZrbp63TUNzc5Yq2pH7Hm7khdXaF5fxqtrkp9gmTW93gtsj5AFTLrbKKy
4+xO0Rs7Eq0NrQYCq6FwMhBIhl1RhyPqku+C4Lne3nPB9LvLPeb1xdzumM875s7kxAJc/tcp
cxIHaqzJhm8ONZca95fubw4a2GbI3qAL5Gk8ztTX6J9JFFb/CmVuZHN0cmVhbQplbmRvYmoK
MjEgMCBvYmoKPDwvVHlwZSAvRm9udERlc2NyaXB0b3IKL0ZvbnROYW1lIC9BQUFBQUErUmVk
SGF0RGlzcGxheS1SZWd1bGFyCi9GbGFncyA0Ci9Bc2NlbnQgMTAxOAovRGVzY2VudCAtMzA1
Ci9TdGVtViA5NAovQ2FwSGVpZ2h0IDcwMAovSXRhbGljQW5nbGUgMAovRm9udEJCb3ggWy03
MSAtMjU0IDEwNDcgMTAwMl0KL0ZvbnRGaWxlMiAyMCAwIFI+PgplbmRvYmoKMjIgMCBvYmoK
PDwvVHlwZSAvRm9udAovRm9udERlc2NyaXB0b3IgMjEgMCBSCi9CYXNlRm9udCAvQUFBQUFB
K1JlZEhhdERpc3BsYXktUmVndWxhcgovU3VidHlwZSAvQ0lERm9udFR5cGUyCi9DSURUb0dJ
RE1hcCAvSWRlbnRpdHkKL0NJRFN5c3RlbUluZm8gPDwvUmVnaXN0cnkgKEFkb2JlKQovT3Jk
ZXJpbmcgKElkZW50aXR5KQovU3VwcGxlbWVudCAwPj4KL1cgWzAgWzUxNF0gNyBbNzIyIDAg
NjE2IDYwN10gMjAgWzY0NyA4MDldIDEzMCBbNTE2XSAxMzYgWzU4Nl0gMTQyIFs4NTkgMCA1
OTIgMCAwIDM0Nl1dCi9EVyA2Nzk+PgplbmRvYmoKMjMgMCBvYmoKPDwvRmlsdGVyIC9GbGF0
ZURlY29kZQovTGVuZ3RoIDI4OT4+IHN0cmVhbQp4nF2RTWrDMBCF9zrFLNNFsOzEiQPGEJIG
vOgPdXsARxqngloWsrLw7SvPpAlUIMHHvCc9zSSH+lhbEyB594NqMEBnrPY4DlevEM54MVak
GWijwo3oVH3rRBLNzTQG7GvbDaIsAZKPWB2Dn2Cx18MZn0Ty5jV6Yy+w+Do0kZurcz/Yow0g
RVWBxi7e9NK617ZHSMi2rHWsmzAto+eh+JwcQkaccho1aBxdq9C39oKilHFVUJ7iqgRa/a9e
sOvcqe/WkzqPainXaUW0ZVoRpXuifENUZEQbVhYF05bpmelItJNMJ6YV0TajPLeXs78cj9g7
kkl+c51zgjVRyiFzebuCTfPv5incW6eu3seu0aioXXOjjMX7NN3gZte8fwFRW5PQCmVuZHN0
cmVhbQplbmRvYmoKNCAwIG9iago8PC9UeXBlIC9Gb250Ci9TdWJ0eXBlIC9UeXBlMAovQmFz
ZUZvbnQgL0FBQUFBQStSZWRIYXREaXNwbGF5LVJlZ3VsYXIKL0VuY29kaW5nIC9JZGVudGl0
eS1ICi9EZXNjZW5kYW50Rm9udHMgWzIyIDAgUl0KL1RvVW5pY29kZSAyMyAwIFI+PgplbmRv
YmoKMjQgMCBvYmoKPDwvTGVuZ3RoMSA3Mzg4Ci9GaWx0ZXIgL0ZsYXRlRGVjb2RlCi9MZW5n
dGggMzY2ND4+IHN0cmVhbQp4nO1Za3BUx5U+3Xce0iA0GjQPjZ7z0MwIoQeahyRLAiH0QpbE
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
aXB0b3IKL0ZvbnROYW1lIC9CQUFBQUErUmVkSGF0VGV4dC1Cb2xkCi9GbGFncyA0Ci9Bc2Nl
bnQgMTAxOAovRGVzY2VudCAtMzA1Ci9TdGVtViAxODgKL0NhcEhlaWdodCA3MDAKL0l0YWxp
Y0FuZ2xlIDAKL0ZvbnRCQm94IFstNTggLTI2NiAxMDMyIDEwMDJdCi9Gb250RmlsZTIgMjQg
MCBSPj4KZW5kb2JqCjI2IDAgb2JqCjw8L1R5cGUgL0ZvbnQKL0ZvbnREZXNjcmlwdG9yIDI1
IDAgUgovQmFzZUZvbnQgL0JBQUFBQStSZWRIYXRUZXh0LUJvbGQKL1N1YnR5cGUgL0NJREZv
bnRUeXBlMgovQ0lEVG9HSURNYXAgL0lkZW50aXR5Ci9DSURTeXN0ZW1JbmZvIDw8L1JlZ2lz
dHJ5IChBZG9iZSkKL09yZGVyaW5nIChJZGVudGl0eSkKL1N1cHBsZW1lbnQgMD4+Ci9XIFsw
IFs1MTRdIDUgWzc0MiAwIDcyMCAwIDY2OCAwIDAgNzYzIDMwOF0gMTggWzc4OCAwIDcxMCAw
IDcwMyAwIDAgMCA3NDIgOTgzXSAxMzAgWzU3OSA2NDQgNTM5IDY0MyA1OTIgNDYwIDY0Ml0g
MTM4IDE0MSAyODggMTQyIFs5MTNdIDE0NyBbNDQyIDUxMSA0NThdIDE1MSBbNTkyIDc4MyAw
IDU4NF0gMjc5IDI4MCAyNTAgMjg2IFs1MzcgMCAwIDI3NV1dCi9EVyA2MTg+PgplbmRvYmoK
MjcgMCBvYmoKPDwvRmlsdGVyIC9GbGF0ZURlY29kZQovTGVuZ3RoIDMyNz4+IHN0cmVhbQp4
nF2Sz46DIBDG7z4Fx+6hEWhtNTEmXdsmHvZP1t0HsDB2SVYkaA++/eKM2yZLAslvZj74YIjL
6lhZM7L43feqhpG1xmoPQ3/zCtgFrsZGQjJt1LgQrqprXBQHcT0NI3SVbfsozxmLP0J2GP3E
VgfdX+Apit+8Bm/sla2+yjpwfXPuBzqwI+NRUTANbdjppXGvTQcsRtm60iFvxmkdNI+Kz8kB
k8iC3Khew+AaBb6xV4hyHkbB8nMYRQRW/8uLRXZp1XfjsTwJ5ZxvRYG0J9oQZUQJkpBEJ6It
UsKJdkQSKTsg7bOZhKA95YkoJSqJTkibM5IUgSQXGVpfPCZ/jh83LFHEj+QnJQd0pngmIzsM
pmQ5pdyO7piSLuMULMnyhoLkbi8XB3Tm/I5zv+9NUjfvQ3/wU2Bj5pYYC/d/43o3q+b5CyfO
qLAKZW5kc3RyZWFtCmVuZG9iago1IDAgb2JqCjw8L1R5cGUgL0ZvbnQKL1N1YnR5cGUgL1R5
cGUwCi9CYXNlRm9udCAvQkFBQUFBK1JlZEhhdFRleHQtQm9sZAovRW5jb2RpbmcgL0lkZW50
aXR5LUgKL0Rlc2NlbmRhbnRGb250cyBbMjYgMCBSXQovVG9Vbmljb2RlIDI3IDAgUj4+CmVu
ZG9iagoyOCAwIG9iago8PC9MZW5ndGgxIDExNTc2Ci9GaWx0ZXIgL0ZsYXRlRGVjb2RlCi9M
ZW5ndGggNTY5OT4+IHN0cmVhbQp4nO1aC1SU153/329eMIgIzAxvGBhgeMPMMDyEAUaGx/AW
UIMaFQRUfEDUtDZN08R3fEVNDIm1j9OmOd3ty2ZPz+m67ibt0RjX1G02aetJYtLQnGpSN6l2
wyYaZvZ37/cNDIip3Z49p7unc73fff8fv////u/9PiRGRPPwUBM1eOrqNbs0e4ikVej9XENH
e9eLrarNRBFziMJ3NnQtWvBhy9k4ItVOjP+gvavQPljtc2A+mrSqq9vdfWXk5WQi9hO0G1dv
7B3J9WQPYPwS2t9b07tlhHPDuAFlyJoNXxh8sGn0BFHiYXR/Z+1Ab7/5G8VPYvxhjJesRYfu
grQQ7eVop6/duHXbQy3hHUShNUSalzcMr+798vs7XyHS3gMeVzf2bhthO+h5zE/EfPOm3o0D
+dmdD0K5Yoynjwxv2eqvoH6MV/Lxkc0DI2u1B3ahDf1I9xPm33VSfRBNYn4/RaAktoXuATYD
pOOtoJ8abZVc9ZdxmrP8sEJ10/dvmJzhf3HiPXXIDBqcOu9hmt/+67fTrSsjKj+iMNVVPvLW
3//yR7x8O8RY7X/RN64OUb2PplaGWtBmFCJaBvFMJ+nza9Zu5eTWbe3dwMIwrsYYl1FiKgaE
pdOoq9AvCX2FfKSWojCmweg+CShSs1yyFWRnLrFUpZaYVqV6mKZL31rb3EIvkNWcJOuousls
6H5cEH5H8DILbkRzlCUSRYKTBn06gWcoEqMwCsdzHhKjKIrG00SxeCYgMdqOxGgnEqPdSIz2
0j48D9BBPB+jw3g+Tk/i+RQSo+P0FUVOSWhLAgMmSjVmECWDk4rmUjYVUBHZaT65qZa81EHd
tIQeMMeZk2B9IivlKeM1GK+jFuqkxdSL8UQxTiyNpdHbsP+ZQKLUd0Le0YJbMqUpOptncYt6
VsbKWSwrZjGsUeBBpKdG2kSSp76lm4o29G7dBAkzSeVeWmcmU21nN57dnc14gp9f6AU78l0r
2pLQV9W/aXgjmbEvNlD8pvs3biaDMi9gOya8Ng9UZF9kojQgTbW0kJ77SCfrntZbIVbvE3TC
UAJVdSjqz9FVpc5gt18odQny/0ypq4DhXqWupixapdQ1FE/1Sl0LD06T64x7jEmpq6bowKfn
ACe5zmsEiwzTRuoFcl7ainIDraPVsOIAyjW0Fn2dqPcD217Uu1HfhjJf9K6h+zG/lzbDqgN4
bsGaYVAyk03xDIey2qysN09SMM+gMLWiglrhLc3wloq74n17azZ+tZBshL6AGQG9zODGOdrE
rLWYZ75tdQfmD9MQeleLtht8tmLusNDWDEtwSltBeQssVIi0BvT5jPupDxqtFugWTtOjnQaR
OMrrBN7TR+sFgluxt3BgTCYr0r1IW2gP/ZQu0bsi/ZGFs3S2gj2C9B32PrvFbkkRUu7/qzQk
fU36uUpSlamWqb6u+pnqLbVenaouUA+q96pPqT/UpGsWaB7RPKt5SfO6ZlwbrrVpG/8XUsf/
gTSo3aL98oy0VzuqfeZPppNK+rn213dM72rf1XXNknYhHZwlnZqRfqP7TcjMXz5StyRR5cz4
Lj1BoaL8FZWJcj31SH3Uo0qhMulN3Ccm6J7JuSvRvxzjv0WZQ+XSIeoR/XvQN0yJ0jpKDNBU
PUI5t58mf/v9NfykuWSTGqiZTZBTqkfOJyfbDPvxehbOg7cQYd/2X2Pvof42NatacdNCv+TB
ONbxeWwV1p+hRPYAmTHWyD6iCOkU2lconN2gCHZBxNW//t/r0PVvv7/8dxOn6k2c8bz87Hl2
dpyqkO1/KUt2jlzT2kfgk0dwr/lzf7/CXQA/yS/HwD/1Q3wrF2X63cU4vKO4P2sc7y9JorTg
jeJu5qWLNw9+D08HivI9fK5yDw/cssVteP3A5k24EZNyN1bjpov3sJBPsVLSbudzdb/T3qBU
ipvOyT9+N3rNWHNLPK8rrfP+a5wO0thdrn81sPYO42PTpNKTnq/wX5rOf9qKa/xdUV4rVpD/
hP+S/wpkui5Tu4OeyXch7TWFc0RAZ/6c0vWzEAyMKfpqINVYQKoZPMameEAbA97aIrAqwn8U
3PXQ5cf+83x0pvQc+xk//Z9QyHCblCfvMFMzszapD2wuozrdFpD9+lR9mjz6ydWaaSuuQC9F
KtQv4vm8jK7/IVG77D/pHwUCU3z0k7JETHLSo67n3AW2M7xrFm+TaWj8pwQd3oqYhptebgVp
My4j7b8cRDfIhpO74XkZGUFR7rmItc8Lipbb5KBZLKjn3sB97jY9TvhfFbvnqP9Z4RUnIYEe
CJ0X6B6FVTivi0F2uiR8FXtHron6uMwTM78rYxUsAWxwSZFi3H9F9JxR9D/q/66wx3khG6cg
j9/u/7KtuR7XFSynoRsk3a2pFaLnPCS6rKwI1vzKJDbjymq9IsM1oVHAXpNeEhQtFH8Qel/G
+skRrNEErXheYMFRkSPGSZkT5DEI1MenZFc0n4oB12R9lbocH38ckCpIj1njnvD2i5NW0MwY
vXXn9iy7f5o9ptvmfxLrZ7dygK/iVQbFZoFR+Mk0LRiVoK3D+wf/VhJO8yhSfFMzUQzFUgJt
px20k3bRbryJ76VHaR/tF1/SDokvaUfoKD1OT9AxepJG6Sl6WnxNO8tiWCyLY6ksjVlYMStj
nWyQrWUjuN9KlCW+6GnFFz0V+OrFF70w1Oco3/Wi8IxGUinfmUxIDPLEYEYsUoT40jdPfOnT
Qb4dOEN3QkIJMu4Bpb1IEmQ9iH4upwaSHkbPESQNJD6K+uNIGkj+BE7rY0hh0OBJnMv8m2AU
tDgO/l9BMtJZJDXXiCKhUxzFQC8LGaBXMW7Z5aycTNCvk2Kh4yCFQs+1eI6wEdKzzdAYpzzl
CZ1DhM5zxFdMrdA5SnzFDFe0NYnvmFzPuULPaKGnQfmiGdBzJ/TfhaQRXzd1QmfzpM6Pii9u
+zF6ACkOGBxEnaPAhL3UQfonCP3DhP4mob8EK47CAzgKMbDm06DAsYgUWCQKLDQCC6PAIllg
ES+wmAc7l1GSwCLljlgwGhK3oyJ1jbpEna7ardqmGlKtksakX0j/In1PSpPmSVr2MbvB3mWv
s9dQf1HSip6P2WvsNPsBewblUfYwW4xnI6tCKubfVZEMbC5dpTF6jS4iMSpSPFsPHecBTYPi
1fGTfh3w6gOf5c+3eXMj/9IpvJlRPGK6iqXyb7vi7ogH68a+DEX8ukKxOMXiEdUSEBn2YJ8e
Qx7FnKf9V8QsBkslw/Lx2KVP+y+j7zLQicdpNAorP+0fZ93QQcK4vI7XYCGcWXzNmEyLeLTk
f1/ZhbwbeS/yYeSjyPKMCFiPWCNiA6gjLuDU5usYf0sI9IAfrNQISaVAS5FMlvi63I8Zl9Gv
0BU0OQpXxKhGGeWojGLF05CRCW6877zSd0nocQ0tIQ9GR6EfOAjuafwuRjqsDEOORuY7Pl7s
ej1tB+WdoLQLeTfyHlDci/IQJHgM+TDqR1DixKXHUT6Bc/kY5jwJrpz7U0KCa3Qc5Vf8YyzG
P8pikeOAdTEs0Oi/xEb8F9lm8FELrqOoQWaMnBJYjQc0E1/ig/HUCzRSIP934Wd6WH9cjCag
dztk2QlKu5B3I+/B2r0oD0Hjx5APo34E5VGUj6M8hvEnhdX18EE95NwKObcGexrkHWfl/lvg
+ipkPgOZzwhkx4SGHPEvQNaTGB8TrUuKJcfIChmPAuNLwPgSML4krLAdfrUD8u70Pws5n4Wc
zyr4PkuPotyHvB/5APJB5EOQ9THkwxg/ghJ3H8h+EZifCcL8CjAfE1Y/Dt8A5nQWlg7oE+e/
Bj04uiegwynocCrYJ4TXjgvfmvLfE2IHyN43Dv+qxNoXpQ/43ziWRKZGVrJ9/arOT3+AVaHY
Mvul04gCOAG3MAezWFN10amqUGZcziK7unwvda1nobuk0xOeN9/EHr8X1Mr8H0nPSOf4jbAu
rUByFldJDrvJFKPLzLSkzZWMhmS0S0pj5krsRPMjfSUlfY80F6/sTnVY73NVDDbn5DQPVrju
szpSu1eGla7e0dKyY3VpgiPDWejI61hX5RrqyCsucGY4EvjZ2wP5KiBfGKSLTDUGUg97yzfM
TL732THptOej2k89ytxSzA0Nmhspz4zyfYB5N2t9ZxX5r0J+6zT5Z4hfUmpxphoN0OF488O9
JSW9Dzd3PGYvtn6upqKfq9BfUT9cp73G5tuXPRBWtnpHc/OO1WXzy4sL7fntQy7XUHt+1UaP
J8X7pZVOrgf/a+rOgB4O2MARacHznlZ2tLXVt0k67TvHyic8rMr3M3k2fRuzVfLse1o5/oqG
NvRrFCrGnlYG603s9ShYqVSTPKKjOQvGInvWv//+eq/vP31/BJe57MaER+qdeEWyTXxVobgv
gJmDqbCGRfd0sOOSt963XALt05IHKxZO/BDeUg7krgO56OnYJUscKKu9Cu0CKQAiO+Z9aGVJ
ycqHvIGyvK8pO7upr1wpJ40fKOvzOoZcVes68uAHrir4AY/nXMIeSDgHNw1uV3ia0aDVWiyR
kTCTszjTYulhqZ7+0tJ+z2sXvJ2d3gvSace91VUrHL4xtqrF7W5SqCwFlbmIO1NUdNEW1TQ6
KbX9ZW2eY4sOvfJyXVdX3cugtNRVv9rgu8Byfb9k672uKi9QSwQOdcAhl6OQaS01mbjHgIbV
mpnpLC4pmfQnrdZoMMXEyDKzis4D7sLqYU/JoqL6xfet6nFtaGjb7c4q2VZla86tqh8ZGajb
FlZRWVZhz6jJdpZGREd21VcsK84tqMzOTZufUVAcFm3oaXetKuUyQKNWsXOpN5L7Kow994Zk
uyFt83gm9oq/Bct7W4sZjPsDYwm+Dzr/cL3ddw2GPSRtnhB+kwO/WSIQpi0qPg//VBaV6qej
bZ//fvP3tzWPtv3oOSz4Z6l24nnJDW/onOCxw+b/L3aW/YGSOIUlaVOaczDTtDorbxghm1Zr
NXCESp0CkrHijvyCztKcZnNNVVpDbkLf4mV9jea2p2pLs+uSUxZkl3lCM2vz8tzpUYbaSpfB
VFbY0+U7XZ6aOppbnJi4IirSxv2i2f+JFCW9jhtiKrdoaaTgLfsGbGIslS0iJDGaTM3exA5b
zUCla427oD3pgK01P7/VluuNifVKFyJ8FyyZtffV12+uzUirKbMtcpZ02yzmD83pQMfp/5iN
CS25rWexrtAsBtbN9GysqdnoKelLL4xvyixqLShoLcpsii9M7wup3VLfsLk2K92RZLZ3Fxd3
21MTHelZ0MLp/4Tdkt6RtQimD4UEcJOoCVbMVD1Y6Vpbk9+W5IVCybmNUCBbKKODAg331VpS
WVbERIrbklGTlnIjxVLUXeJcZBOcxtkt6BE7g5PJaExVArZWq0rl+xe6WD2balxr3TUDFb5H
1IWtBZkNcQU5S99kTk2uOytrQa6+dktj4+YF7uF6k709PyHGlmpmaXl1WdY6kn2T3Su9K+81
i9MBVlwno1DEaHTAVx/duLGl3pAaPi8+Midz/372vcrBxja1ZoFGnZ03UOnrFhJnQOIPcP/L
D95nTqew8JS3OSINWtUMnPJtq3NS8psyausSO4pkzArakhqH1gUh9kZCbFmMqcbVZ8ngxgd2
adUTnyzrZQZLyvVJ5Bg1Q5vfwEaGaX6G4Cq7eSRcq83mbM/3NlRmLTBJ/x7h+0lebv7CEt8Z
ZnU3Z2b4nuL+yr/fPyOdR0yPkKO3Ki1TxgUu2+RNN6WkmJDZVV+s1JtiNKbwTBLeyDNwFpxH
VMeB2BW0BuutThmRSA7BiEJh45wYfWik3pzgrZ4i9OkZDauWpOQ0acHEqYoFilZvQyu9rFWp
Q4ez39jsvXrPx0y16vdcjbw3rvrpvfdInk1PYLZKnt3sxfhEijKiUsOvMoRWRtkmMzGaqgu4
GvOL2wxJC5225hxvTVmmK0aSvO6y5jx2tSUnx5FXWFQA9M6y7JqmTKveFCZXG33HKGAN8DME
8buzNdjV9llsgT0tRYBGBO6i0/eCQWy5QOCQfcni2VBVtcFTu76qar2nqCk3t6lIPEMWbOZ7
QH7W2BY7SxbZbItKnIuV+FQoRcF7xc5eMiWpEp8io2fEp8bEhYH41Ja0Pyg+vSL9Y32GVQ5P
llTfDRYaHKCENoVin8gxJPK23TFzbzw3uSV4GHk1aEe8wqLEXhBxpGqigemDY4iMfRNwiwy2
tbyrOfDRDQXhprA5CXPya6PZ1X5HuUq9QK0pLvT9gzgzx9k3sDZbnBWBvTzbkRl0Yo5VDqZb
85qszvrswo6G2vwOh31pQXpmi7VofkZhZ5PHvlifYSkyJ9mtyWmhc8OrnDk1GUlmR0JcTnqy
OSQivKYkty6Le40Z3JdKX+YRCfZ2iqBUKgKRfDIZEfM01e6BAe+BA6mZ0ckGQ57eNZ9VV+6O
HK30vWaFgm6dllNqxHlwmV3l/ifOPL73BAl+pUNo+gSnW1N9ZbbbhAjdGlLQ6WQVvtfdLZnp
bJ0vtj03DzQQAdjvQEMbOHFVv36p/Wsn2s5j929hB32xyvn+NcyZeSp/c3fD4P3u+wfqdjVs
3Yr5D7DdIseyfb7PYV04aL+OdfwWWGp1xGBjx1isuvB/Orlkz+6uH51ecvTIxO9PnfqPW+fO
cUkQY8cwO5pro4ST0lJZprnSqphYvSkkMSM8/fTCJ766cHxepv0NnRthxNwDzsPsyMTfWYuM
HBVYlX0ddPg90sk0uI6wDGM2i8MNfdj3O5Y8n21gteW+o2wB/6uPEgvVWvF/nwSm9Bz1c5mX
BEW4LykRLcRsiklJiTGZ+Vy7fzWdpibxLgPd7JVtC7965QqnKqiw69pMBiuTjj/ZQfTbJR2d
lj5Q61gsMH0GPVWSjq1FTyF6bkoLXyC8KcXizouaPJ8tx6gVo9+QniFlHXi76Cbbx8o5789D
RRdrvVldzfcFUFwhvcTtWscvxSXiMOV+zMpahkpLh1oy+9av73ujaP/JwTUn9xc5XJf27bvk
Ai+HP53VS+fUEayMHWHXXuAa1ktR9Jj8ttZldegWhnn1UtSbb2Knl/lHpHNSDVVT+8z7N9/1
1mk7H+BoA/dS5c1m8q5itZdmws6TQYEd8n7pXodj2YONni2Li/JaimriipzWqvS8prxEW5Sm
NEOXaE51Jjc82OZa157Xumdx3sL0yKzlnbmpjEmG8IKEJFuS87Bz5cPN7Xv6Swu6Rha4esuy
87M8ubaOIkNU3AvYxa2FLdvqbD33e3r2dxgN2aaYG5YwU/iQKTatPK2oUnm7WIZb9d1F5aaO
L9bXf7FDfrp67PYeV+VSu31p2PJvDa3/5vLl31w/9K3lbu+upUt3eeUnty1uqmwceGvZCnGu
uWHZcPBMEH7LX2CUq+skY50qw9jEYlMzIrpqbN3FOaUjruq+sqiC3A/ZOiezp5cWJTjrMgvt
dlthp9NSUVvom2DV0CaJ9TC39FP4dMz0c9sqv22IOPdD98KFbp7ziovzcp1O1tPf0dHPc763
qsrLM5cymq1g4aAFP+xylpaUTJOSv8foHMaEA/HGrJTY3MSkpKo0Z22iZf0P2YrM7XHpxvi0
qDhLfEJ5XnKRuV+8UyX5bzE3Wy3LtuQuZdPcLhr/Ck0sHJRiOX53L9lscv03Ap/uKgplbmRz
dHJlYW0KZW5kb2JqCjI5IDAgb2JqCjw8L1R5cGUgL0ZvbnREZXNjcmlwdG9yCi9Gb250TmFt
ZSAvQ0FBQUFBK1JlZEhhdFRleHQtUmVndWxhcgovRmxhZ3MgNAovQXNjZW50IDEwMTgKL0Rl
c2NlbnQgLTMwNQovU3RlbVYgOTQKL0NhcEhlaWdodCA3MDAKL0l0YWxpY0FuZ2xlIDAKL0Zv
bnRCQm94IFstNTggLTI2NiAxMDMyIDEwMDJdCi9Gb250RmlsZTIgMjggMCBSPj4KZW5kb2Jq
CjMwIDAgb2JqCjw8L1R5cGUgL0ZvbnQKL0ZvbnREZXNjcmlwdG9yIDI5IDAgUgovQmFzZUZv
bnQgL0NBQUFBQStSZWRIYXRUZXh0LVJlZ3VsYXIKL1N1YnR5cGUgL0NJREZvbnRUeXBlMgov
Q0lEVG9HSURNYXAgL0lkZW50aXR5Ci9DSURTeXN0ZW1JbmZvIDw8L1JlZ2lzdHJ5IChBZG9i
ZSkKL09yZGVyaW5nIChJZGVudGl0eSkKL1N1cHBsZW1lbnQgMD4+Ci9XIFswIFs1MTRdIDUg
WzY2MCAwIDcyNiAwIDYxOSA2MTAgNzk5IDczMiAyNTMgMCAwIDYwNyA4NjAgNzM5IDgxMCA2
NTQgMCA2NDcgNjIzIDYxNyAwIDY2MCA4OTddIDEzMCBbNTI2IDU4MyA1MDkgNTgyIDU1NyAz
NzAgNTgyIDU1MiAyMjIgMjIzIDQ4OSAyMjMgODQ1IDU1MiA1ODAgNTgzIDU4MiAzNTIgNDUy
IDM3OCA1NTIgNTAxIDY5OCA0ODcgNDk4IDQ1OV0gMjkwIDI5MSA0MTAgMzA4IFs0NTUgMCAw
IDAgNDAxIDQwMV0gMzI2IFsyMTQgMCA3NjddIDMzOCBbNjYwIDAgNTQ4XV0KL0RXIDI1MD4+
CmVuZG9iagozMSAwIG9iago8PC9GaWx0ZXIgL0ZsYXRlRGVjb2RlCi9MZW5ndGggMzQyPj4g
c3RyZWFtCnicXZLLboMwEEX3/gov00WEbchLQkgpaSUWfai0H0DsIbVUjGXIgr+vmaGJVEtG
Otcz4zuMk7I6Vc6OPHkPva5h5K11JsDQX4MGfoaLdUwqbqweF8Kv7hrPkphcT8MIXeXanuU5
58lHPB3GMPHV0fRneGDJWzAQrLvw1VdZR66v3v9AB27kghUFN9DGSi+Nf2064AmmrSsTz+04
rWPOPeJz8sAVsiQ3ujcw+EZDaNwFWC7iKnj+HFfBwJl/53JJO7f6uwkYvonhQmSyQNoRpTNJ
SaSeiPZEJdEBKT0iKRlJiSjOlGYUeULKtkQ7IqqSCaSNoioLUV6q0Pricffn+N4hXS1OVGmD
zqVAklQiK0mkqxfn8TIUjyQ+krhFcU9GDiRuJXWFolQpNUeNp1hMpmRC7Rev5G7+4/PLuI1T
X0OIk8TngyOch2cd3F6Y7/2cNe9fRV2whwplbmRzdHJlYW0KZW5kb2JqCjYgMCBvYmoKPDwv
VHlwZSAvRm9udAovU3VidHlwZSAvVHlwZTAKL0Jhc2VGb250IC9DQUFBQUErUmVkSGF0VGV4
dC1SZWd1bGFyCi9FbmNvZGluZyAvSWRlbnRpdHktSAovRGVzY2VuZGFudEZvbnRzIFszMCAw
IFJdCi9Ub1VuaWNvZGUgMzEgMCBSPj4KZW5kb2JqCnhyZWYKMCAzMgowMDAwMDAwMDAwIDY1
NTM1IGYgCjAwMDAwMDAwMTUgMDAwMDAgbiAKMDAwMDAzNjI0MiAwMDAwMCBuIAowMDAwMDAw
MTE5IDAwMDAwIG4gCjAwMDAwNDAxMzQgMDAwMDAgbiAKMDAwMDA0NTA1NiAwMDAwMCBuIAow
MDAwMDUyMDk5IDAwMDAwIG4gCjAwMDAwMDAxNTYgMDAwMDAgbiAKMDAwMDAwMDI0MiAwMDAw
MCBuIAowMDAwMDIzNTAxIDAwMDAwIG4gCjAwMDAwMjM2OTkgMDAwMDAgbiAKMDAwMDAyMzkz
MiAwMDAwMCBuIAowMDAwMDI0MTU5IDAwMDAwIG4gCjAwMDAwMzY1MzUgMDAwMDAgbiAKMDAw
MDAzMTA5MyAwMDAwMCBuIAowMDAwMDMxMzE5IDAwMDAwIG4gCjAwMDAwMzE1MDUgMDAwMDAg
biAKMDAwMDAzNjgxMyAwMDAwMCBuIAowMDAwMDM2ODc2IDAwMDAwIG4gCjAwMDAwMzcxMzgg
MDAwMDAgbiAKMDAwMDAzNzIwMSAwMDAwMCBuIAowMDAwMDM5MjU4IDAwMDAwIG4gCjAwMDAw
Mzk0NjUgMDAwMDAgbiAKMDAwMDAzOTc3NCAwMDAwMCBuIAowMDAwMDQwMjg3IDAwMDAwIG4g
CjAwMDAwNDQwMzcgMDAwMDAgbiAKMDAwMDA0NDIzOSAwMDAwMCBuIAowMDAwMDQ0NjU4IDAw
MDAwIG4gCjAwMDAwNDUyMDMgMDAwMDAgbiAKMDAwMDA1MDk4OSAwMDAwMCBuIAowMDAwMDUx
MTkzIDAwMDAwIG4gCjAwMDAwNTE2ODYgMDAwMDAgbiAKdHJhaWxlcgo8PC9TaXplIDMyCi9S
b290IDE5IDAgUgovSW5mbyAxIDAgUj4+CnN0YXJ0eHJlZgo1MjI0OQolJUVPRgo=
--------------yfrL4KF0MA99pr0bN3kgjs0Z
Content-Type: text/plain; charset=UTF-8; name="Attached Message Part"
Content-Disposition: attachment; filename="Attached Message Part"
Content-Transfer-Encoding: base64

LS0gCk9wZW5ibWMtc2VjdXJpdHkgbWFpbGluZyBsaXN0Ck9wZW5ibWMtc2VjdXJpdHlAbGlzdHMu
b3psYWJzLm9yZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vb3BlbmJtYy1zZWN1
cml0eQoK

--------------yfrL4KF0MA99pr0bN3kgjs0Z--

