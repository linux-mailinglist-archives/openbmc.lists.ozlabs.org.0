Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D93F142214
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2020 04:40:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481HW02R1czDqZB
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2020 14:40:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=adathatr@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sT4R5xq7zDqJf
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 21:23:51 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 007AHB4k136058
 for <openbmc@lists.ozlabs.org>; Tue, 7 Jan 2020 05:23:48 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.90])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xaq7xwcr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 07 Jan 2020 05:23:48 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <adathatr@in.ibm.com>;
 Tue, 7 Jan 2020 10:23:47 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 7 Jan 2020 10:23:44 -0000
Received: from us1a3-mail205.a3.dal06.isc4sb.com ([10.146.77.29])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2020010710234420-270688 ;
 Tue, 7 Jan 2020 10:23:44 +0000 
In-Reply-To: <CAAMkS12b+pZRPnqHH5CNib=t=x9ymM=Y=fU-Z5daqPivm239uQ@mail.gmail.com>
From: "Anusha Dathatri" <adathatr@in.ibm.com>
To: Tony.Lee@quantatw.com
Date: Tue, 7 Jan 2020 10:23:43 +0000
Sensitivity: 
MIME-Version: 1.0
References: <CAAMkS12b+pZRPnqHH5CNib=t=x9ymM=Y=fU-Z5daqPivm239uQ@mail.gmail.com>,
 <491f35b0a7fd4d10868bee1504f0c03c@quantatw.com>
 <CAAMkS123QsposBjeZsi=Dtr+7ycBfDgCMgA0rH+Pnx8nG9ZhuA@mail.gmail.com>
 <ab84d89c974c4067bd3f3ce848b71450@quantatw.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 62899
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 20010710-3649-0000-0000-000001D13FC6
X-IBM-SpamModules-Scores: BY=0.021851; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.371236; ST=0; TS=0; UL=0; ISC=; MB=0.135007
X-IBM-SpamModules-Versions: BY=3.00012348; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01315605; UDB=6.00699557; IPR=6.01097934; 
 MB=3.00030215; MTD=3.00000008; XFM=3.00000015; UTC=2020-01-07 10:23:47
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-01-07 08:06:58 - 6.00010855
x-cbparentid: 20010710-3650-0000-0000-00003D86C210
Message-Id: <OF4C77B2B1.3265D9B3-ON002584E8.003909FE-002584E8.00391AA4@notes.na.collabserv.com>
Subject: RE: Question about IPMI password MAX length test in
 openbmc-test-automation
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-07_02:2020-01-06,2020-01-07 signatures=0
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Mon, 20 Jan 2020 14:39:46 +1100
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
Cc: openbmc@lists.ozlabs.org, rahulmaheshwari01@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Hi Tony,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >I have removed the login verification for cases where pas=
sword is not set. Added you as a reviewer for the code.</div>
<div dir=3D"ltr" ><br><br>Thanks &amp; Regards<br>Anusha Dathatri,<br>Power=
 Firmware,<br>Email: adathatr@in.ibm.com<br>Mobile : 9916920803</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" data-history-expanded=3D"1"=
 dir=3D"ltr" style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; paddi=
ng-left:5px; direction:ltr; margin-right:0px" >----- Original message -----=
<br>From: Rahul Maheshwari &lt;rahulmaheshwari01@gmail.com&gt;<br>To: "Tony=
 Lee (=E6=9D=8E=E6=96=87=E5=AF=8C)" &lt;Tony.Lee@quantatw.com&gt;<br>Cc: "a=
dathatr@in.ibm.com" &lt;adathatr@in.ibm.com&gt;<br>Subject: [EXTERNAL] Re: =
Question about IPMI password MAX length test in openbmc-test-automation<br>=
Date: Tue, Jan 7, 2020 12:36 PM<br>&nbsp;
<div dir=3D"ltr" >oops .. I meat to say option&nbsp;1 is better. Typo mista=
ke from my side.
<div>&nbsp;</div></div>&nbsp;

<div><div dir=3D"ltr" >On Tue, Jan 7, 2020 at 12:19 PM Tony Lee (=E6=9D=8E=
=E6=96=87=E5=AF=8C) &lt;<a href=3D"mailto:Tony.Lee@quantatw.com" target=3D"=
=5Fblank" >Tony.Lee@quantatw.com</a>&gt; wrote:</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" ><div lang=3D"ZH-TW" ><div><p style=3D"margin: =
0px;" ><span style=3D"font-family:Calibri,sans-serif;color:rgb(31,73,125)" =
lang=3D"EN-US" >Hi Rahul,</span></p>
<p style=3D"margin: 0px;" ><span style=3D"font-family:Calibri,sans-serif;co=
lor:rgb(31,73,125)" lang=3D"EN-US" >&nbsp;</span></p>
<p style=3D"margin:0cm 0cm 0.0001pt" ><span style=3D"font-family:&quot;Time=
s New Roman&quot;,serif;color:black;background:white" lang=3D"EN-US" >Thank=
 you for your reply.</span></p>
<p style=3D"margin:0cm 0cm 0.0001pt" ><span style=3D"font-family:&quot;Time=
s New Roman&quot;,serif;color:black;background:white" lang=3D"EN-US" >I'm c=
onfused, you said that option 2 is better but the additional explanation is=
 about option 1.</span></p>
<p style=3D"margin: 0px;" ><span style=3D"font-family:Calibri,sans-serif" l=
ang=3D"EN-US" >&nbsp;</span></p>
<p style=3D"margin: 0px;" ><span style=3D"font-family:Calibri,sans-serif" l=
ang=3D"EN-US" >Thanks</span></p>
<p style=3D"margin: 0px;" ><span style=3D"font-family:Calibri,sans-serif" l=
ang=3D"EN-US" >Best Regards,</span></p>
<p style=3D"margin: 0px;" ><span style=3D"font-family:Calibri,sans-serif" l=
ang=3D"EN-US" >Tony</span></p>
<p style=3D"margin: 0px;" ><span style=3D"font-family:Calibri,sans-serif;co=
lor:rgb(31,73,125)" lang=3D"EN-US" >&nbsp;</span></p>
<div><div style=3D"border-right:none;border-bottom:none;border-left:none;bo=
rder-top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm" ><p style=3D"margi=
n: 0px;" ><b><span style=3D"font-size:11pt;font-family:Calibri,sans-serif" =
lang=3D"EN-US" >From:</span></b><span style=3D"font-size:11pt;font-family:C=
alibri,sans-serif" lang=3D"EN-US" > Rahul Maheshwari &lt;<a href=3D"mailto:=
rahulmaheshwari01@gmail.com" target=3D"=5Fblank" >rahulmaheshwari01@gmail.c=
om</a>&gt;<br><b>Sent:</b> Tuesday, January 7, 2020 1:45 PM<br><b>To:</b> T=
ony Lee (</span><span style=3D"font-size:11pt" >=E6=9D=8E=E6=96=87=E5=AF=8C=
</span><span style=3D"font-size:11pt;font-family:Calibri,sans-serif" lang=
=3D"EN-US" >) &lt;<a href=3D"mailto:Tony.Lee@quantatw.com" target=3D"=5Fbla=
nk" >Tony.Lee@quantatw.com</a>&gt;<br><b>Cc:</b> <a href=3D"mailto:adathatr=
@in.ibm.com" target=3D"=5Fblank" >adathatr@in.ibm.com</a>; <a href=3D"mailt=
o:openbmc@lists.ozlabs.org" target=3D"=5Fblank" >openbmc@lists.ozlabs.org</=
a><br><b>Subject:</b> Re: Question about IPMI password MAX length test in o=
penbmc-test-automation</span></p></div></div>
<p style=3D"margin: 0px;" ><span lang=3D"EN-US" >&nbsp;</span></p>
<div><p style=3D"margin: 0px;" ><span lang=3D"EN-US" >Hi Tony,</span></p>
<div><p style=3D"margin: 0px;" ><span lang=3D"EN-US" >I would say option 2 =
is better. There is no need to verify IPMI command execution when set user =
password is expected to fail.</span></p></div>
<div><p style=3D"margin: 0px;" ><span lang=3D"EN-US" >&nbsp;</span></p></di=
v>
<div><p style=3D"margin: 0px;" ><span lang=3D"EN-US" >Thanks</span></p></di=
v>
<div><p style=3D"margin: 0px;" ><span lang=3D"EN-US" >Rahul</span></p></div=
></div>
<p style=3D"margin: 0px;" ><span lang=3D"EN-US" >&nbsp;</span></p>
<div><p style=3D"margin: 0px;" ><span lang=3D"EN-US" >On Mon, Jan 6, 2020 a=
t 3:06 PM Tony Lee (</span>=E6=9D=8E=E6=96=87=E5=AF=8C<span lang=3D"EN-US" =
>) &lt;<a href=3D"mailto:Tony.Lee@quantatw.com" target=3D"=5Fblank" >Tony.L=
ee@quantatw.com</a>&gt; wrote:</span></p></div>
<p style=3D"margin: 0px;" ><span lang=3D"EN-US" >Hi Anusha,<br><br>I met an=
 issue that "Verify Setting IPMI User With Invalid Password Length" will fa=
il when<br>its user id is same as "Verify Setting IPMI User With Max Passwo=
rd Length".<br><br>This is because the password length 20 has been successf=
ully set in "Verify Setting IPMI User With Max Password Length".<br>Therefo=
re, the case of password=5Flength =3D 21 and password=5Foption =3D 20 is ex=
pected to fail but pass when their user id are the same.<br><br>I have two =
solutions:<br><br>1. Only verify the message that cannot use invalid passwo=
rd length to set password<br>and do not verify that user is able to run IPM=
I command with given username and password in this case.<br><br>2. At the e=
nd of each case, delete the user it just created to ensure that it will not=
 affect other cases.<br><br>Which is better, or do you have other suggestio=
ns?<br><br>Thanks<br>Best Regards,<br>Tony</span></p></div></div></blockquo=
te></div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

