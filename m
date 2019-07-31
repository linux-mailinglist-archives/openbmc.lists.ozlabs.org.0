Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5057CF48
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 23:04:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zQsQ2CbTzDqnF
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 07:04:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.40; helo=atlmailgw1.ami.com;
 envelope-from=chittarip@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw1.ami.com (atlmailgw1.ami.com [63.147.10.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zQrg0SvszDqmX
 for <openbmc@lists.ozlabs.org>; Thu,  1 Aug 2019 07:03:44 +1000 (AEST)
X-AuditID: ac1060b2-413ff70000003a7d-19-5d42022e46dc
Received: from atlms2.us.megatrends.com (atlms2.us.megatrends.com
 [172.16.96.152])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 B1.12.14973.E22024D5; Wed, 31 Jul 2019 17:03:42 -0400 (EDT)
Received: from ATLMS1.us.megatrends.com ([fe80::8c55:daf0:ef05:5605]) by
 atlms2.us.megatrends.com ([fe80::29dc:a91e:ea0c:cdeb%12]) with mapi id
 14.03.0415.000; Wed, 31 Jul 2019 17:03:40 -0400
From: Chittari Pabba <ChittariP@ami.com>
To: "yocto-security@yoctoproject.org" <yocto-security@yoctoproject.org>,
 openbmc <openbmc@lists.ozlabs.org>
Subject: CVE-Tool build issues in Open BMC project
Thread-Topic: CVE-Tool build issues in Open BMC project
Thread-Index: AdVH4ubNp6BRTzi3QrSYLIFUeiHJsQ==
Date: Wed, 31 Jul 2019 21:03:40 +0000
Message-ID: <00DE8410EF1E8148ABEDA156FA727A3C03FAC17B12@atlms1.us.megatrends.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.100.135]
Content-Type: multipart/alternative;
 boundary="_000_00DE8410EF1E8148ABEDA156FA727A3C03FAC17B12atlms1usmegat_"
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPIsWRmVeSWpSXmKPExsWyRiBhhq4ek1OsweM1ShanWl6wWGxe+pLN
 gcnj/IyFjB7tJ/rYApiiGhhtEvPy8ksSS1IVUlKLk22VAooyyxKTK5UUMlNslQyVFApyEpNT
 c1PzSmyVEgsKUvNSlOy4FDCADVBZZp5Cal5yfkpmXrqtkmewv66FhamlrqGSXUhGqkJmXlp+
 UW5iSWZ+nkJyfl4JUHVqClBUIaGLM+P38SdMBVvtKxbv28DYwLjNoouRk0NCwESi83cvaxcj
 F4eQwC4miS0vVzFBOIcZJTbe6GcBqWIT0JBoePKEHcQWEciVWPjqJ1hcWMBIouFhCyNE3Fzi
 xdEDLBC2nsSRZUvB6lkEVCV2N08Di/MKBEo83DmPCcRmFBCT+H5qDZjNLCAucevJfCaIiwQk
 luw5zwxhi0q8fPyPFcJWkuj7uY4Noj5f4nnHLVaImYISJ2c+YZnAKDgLyahZSMpmISmDiOtI
 LNj9iQ3C1pZYtvA1M4x95sBjJmTxBYzsqxiFEktychMzc9LLDfUSczP1kvNzNzFCYn/TDsaW
 i+aHGJk4GA8xSnAwK4nwLha3jxXiTUmsrEotyo8vKs1JLT7E6AQMiInMUtygWAFGc7yxgYGU
 KIxjaGJmYm5kbmhpYm5srCTOu3LNtxghgXRgcslOTS1ILYIZwsTBKdXAGK/vFxp6SeX83KUv
 +M8ePBU8+ViMe2URLwfjze27l58+vN6AJ2Cq66x/92TE+5/VundtC7BoT2W54KR6QTRMP2bb
 1k3Gs50MpaSiI/v27ZuuJexguiDptq1DHoPQ4dOr7eL3GvvwfGjd6PpeJpXl17HSJz8P2n//
 5dQssWW/wLWJksvzz6Q9UmIpzkg01GIuKk4EAP2RsoESAwAA
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

--_000_00DE8410EF1E8148ABEDA156FA727A3C03FAC17B12atlms1usmegat_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello All:

We are trying to enable cve-check tool in our Open BMC project build, but we=
 could not able to succeed, build is troughing below errors. Anyone noticed=
 similar issues enabling of cve-check tool open BMC build? Any help highly a=
ppreciates.

Initialising tasks: 100% |##################################################=
############################################################################=
######################################################################| Time=
: 0:00:04
Sstate summary: Wanted 5 Found 0 Missed 5 Current 1625 (0% match, 99% comple=
te)
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: cve-update-db-1.0-r0 do_populate_cve_db: Error executing a python fun=
ction in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
*** 0002:do_populate_cve_db(d)
     0003:
File: '/home/chittari/Projects/git-clones/openbmc/meta/recipes-core/meta/cve=
-update-db.bb', lineno: 31, function: do_populate_cve_db
     0027:    JSON_TMPFILE =3D d.getVar("CVE_CHECK_DB_DIR") + '/nvd.json.gz'
     0028:
     0029:    # Connect to database
    0030:    db_file =3D d.getVar("CVE_CHECK_DB_FILE")
*** 0031:    conn =3D sqlite3.connect(db_file)
     0032:    c =3D conn.cursor()
     0033:
     0034:    initialize_db(c)
     0035:
Exception: sqlite3.OperationalError: unable to open database file

ERROR: cve-update-db-1.0-r0 do_populate_cve_db: unable to open database file
ERROR: cve-update-db-1.0-r0 do_populate_cve_db: Function failed: do_populate=
_cve_db
ERROR: Logfile of failure stored in: /home/chittari/Projects/git-clones/open=
bmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/cve-update-db/1.0-r0/temp/lo=
g.do_populate_cve_db.8218
ERROR: Task (/home/chittari/Projects/git-clones/openbmc/meta/recipes-core/me=
ta/cve-update-db.bb:do_populate_cve_db) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1381 tasks of which 1380 didn't need to be re=
run and 1 failed.

Thanks,
Chittari

Please consider the environment before printing this email.

The information contained in this message may be confidential and proprietar=
y to American Megatrends, Inc.  This communication is intended to be read on=
ly by the individual or entity to whom it is addressed or by their designee.=
 If the reader of this message is not the intended recipient, you are on not=
ice that any distribution of this message, in any form, is strictly prohibit=
ed.  Please promptly notify the sender by reply e-mail or by telephone at 77=
0-246-8600, and then delete or destroy all copies of the transmission.

--_000_00DE8410EF1E8148ABEDA156FA727A3C03FAC17B12atlms1usmegat_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micro=
soft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" xm=
lns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://w=
ww.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello All:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#222222;background:white">We are=
 trying to enable cve-check tool in our Open BMC project build, but we could=
 not able to succeed, build is troughing below errors. Anyone noticed simila=
r issues enabling of cve-check tool
 open BMC build? Any help highly appreciates.&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Initialising tasks: 100% |###########################=
############################################################################=
############################################################################=
#################| Time: 0:00:04<o:p></o:p></p>
<p class=3D"MsoNormal">Sstate summary: Wanted 5 Found 0 Missed 5 Current 162=
5 (0% match, 99% complete)<o:p></o:p></p>
<p class=3D"MsoNormal">NOTE: Executing SetScene Tasks<o:p></o:p></p>
<p class=3D"MsoNormal">NOTE: Executing RunQueue Tasks<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: cve-update-db-1.0-r0 do_populate_cve_db: Error=
 executing a python function in exec_python_func() autogenerated:<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The stack trace of python calls that resulted in this=
 exception/failure was:<o:p></o:p></p>
<p class=3D"MsoNormal">File: 'exec_python_func() autogenerated', lineno: 2,=
 function: &lt;module&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0001:<o:p></o:p></p>
<p class=3D"MsoNormal">*** 0002:do_populate_cve_db(d)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0003:<o:p></o:p></p>
<p class=3D"MsoNormal">File: '/home/chittari/Projects/git-clones/openbmc/met=
a/recipes-core/meta/cve-update-db.bb', lineno: 31, function: do_populate_cve=
_db<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0027:&nbsp;&nbsp;&nbsp; JSON=
_TMPFILE =3D d.getVar(&quot;CVE_CHECK_DB_DIR&quot;) &#43; '/nvd.json.gz'<o:p=
></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0028:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0029:&nbsp;&nbsp;&nbsp; # Co=
nnect to database<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;0030:&nbsp;&nbsp;&nbsp; db_fi=
le =3D d.getVar(&quot;CVE_CHECK_DB_FILE&quot;)<o:p></o:p></p>
<p class=3D"MsoNormal">*** 0031:&nbsp;&nbsp;&nbsp; conn =3D sqlite3.connect(=
db_file)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0032:&nbsp;&nbsp;&nbsp; c =
=3D conn.cursor()<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0033:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0034:&nbsp;&nbsp;&nbsp; init=
ialize_db(c)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; 0035:<o:p></o:p></p>
<p class=3D"MsoNormal">Exception: sqlite3.OperationalError: unable to open d=
atabase file<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">ERROR: cve-update-db-1.0-r0 do_populate_cve_db: unabl=
e to open database file<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: cve-update-db-1.0-r0 do_populate_cve_db: Funct=
ion failed: do_populate_cve_db<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: Logfile of failure stored in: /home/chittari/P=
rojects/git-clones/openbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/cve-u=
pdate-db/1.0-r0/temp/log.do_populate_cve_db.8218<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: Task (/home/chittari/Projects/git-clones/openb=
mc/meta/recipes-core/meta/cve-update-db.bb:do_populate_cve_db) failed with e=
xit code '1'<o:p></o:p></p>
<p class=3D"MsoNormal">NOTE: Tasks Summary: Attempted 1381 tasks of which 13=
80 didn't need to be rerun and 1 failed.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Chittari<o:p></o:p></p>
</div>
<font color=3D"#009900" face=3D"Webdings" size=3D"4">P</font><font
  color=3D"#009900" face=3D"verdana,arial,helvetica" size=3D"2"> <strong>Ple=
ase
consider the environment before printing this email</strong></font>
<p>The information contained in this message may be confidential and proprie=
tary to American Megatrends, Inc.  This communication is intended to be read=
 only by the individual or entity to whom it is addressed or by their design=
ee. If the reader of this message is not the intended recipient, you are on=
 notice that any distribution of this message, in any form, is strictly proh=
ibited.  Please promptly notify the sender by reply e-mail or by telephone a=
t 770-246-8600, and then delete or destroy all copies of the transmission.</=
p>
</body>
</html>

--_000_00DE8410EF1E8148ABEDA156FA727A3C03FAC17B12atlms1usmegat_--
