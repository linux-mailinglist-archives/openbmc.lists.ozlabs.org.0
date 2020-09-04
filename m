Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE41E260D67
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 10:20:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Blykf0nW2zDqMC
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 18:20:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jet.li@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cVU1+YGV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjXzH6J0FzDqdp
 for <openbmc@lists.ozlabs.org>; Fri,  4 Sep 2020 19:52:39 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0849WoHa143052
 for <openbmc@lists.ozlabs.org>; Fri, 4 Sep 2020 05:52:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : cc : date : mime-version : references :
 content-transfer-encoding : content-type : message-id; s=pp1;
 bh=k5kD7xc7K78uJ4nk2FZ/uzhTQCyTGmLGUd8qE+F1ml0=;
 b=cVU1+YGVmP/TpFhaqk8MihsLmzxUnwbXwDkKbB8PVmJIbCLCJjOM9LVypWmoAud6MEAa
 5BsDK+gjTrPPZVqhVjespIRVora3+aBnj94J0/aP9WMadRmyzWEAVKolE6dIG1QvwYfM
 3LXMTgjSgGUJPj3KkoAj0kOupjxQ26/8w+yvc136Tro+IHgosdHcaomY8Lb1+16b7t8N
 9Houqpt4FI3Py7GjPVQOd8/AzAWifx+DbJs5HxZzATmtbYMFMMmgt2Wk28Dojccii8h+
 mV5ERLI36SHnyIfSgJl3ILzibSQzcHakiNPIhbKSJKlA9+iqBApffcyBBkF0JV4Hq5ti Vg== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.104])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33bj4n235q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 04 Sep 2020 05:52:33 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Jet.Li@ibm.com>;
 Fri, 4 Sep 2020 09:52:33 -0000
Received: from us1b3-smtp05.a3dr.sjc01.isc4sb.com (10.122.203.183)
 by smtp.notes.na.collabserv.com (10.122.47.44) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 4 Sep 2020 09:52:31 -0000
Received: from us1b3-mail140.a3dr.sjc03.isc4sb.com ([10.160.11.254])
 by us1b3-smtp05.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020090409523008-232812 ;
 Fri, 4 Sep 2020 09:52:30 +0000 
In-Reply-To: <c4a250cb-f81d-21a3-5a27-fccf265afa7a@gmail.com>
Subject: Re: [PATCH linux dev-5.8 v2] ARM: dts: aspeed: rainier: Add I2C buses
 for NVMe use
From: "Jet Li" <Jet.Li@ibm.com>
To: santosh.puranik.ibm@gmail.com
Date: Fri, 4 Sep 2020 09:52:29 +0000
Sensitivity: 
MIME-Version: 1.0
References: <c4a250cb-f81d-21a3-5a27-fccf265afa7a@gmail.com>,
 <20200901061731.12694-1-Jet.Le@ibm.com>
 <CACPK8XfPHNns35z9Jx9jw7jgB=AeD29mMyfyupaN3x99GxdeRw@mail.gmail.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-KeepSent: AC08E4AD:2D69F5A8-002585D9:00339050;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 35691
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 20090409-5525-0000-0000-00000335A2D7
X-IBM-SpamModules-Scores: BY=0.10441; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.407427; ST=0; TS=0; UL=0; ISC=; MB=0.003343
X-IBM-SpamModules-Versions: BY=3.00013773; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01429872; UDB=6.00767727; IPR=6.01212592; 
 MB=3.00033875; MTD=3.00000008; XFM=3.00000015; UTC=2020-09-04 09:52:32
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-09-04 08:26:31 - 6.00011800
x-cbparentid: 20090409-5526-0000-0000-0000DD8BBE37
Message-Id: <OFAC08E4AD.2D69F5A8-ON002585D9.00339050-002585D9.00363EAA@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-04_05:2020-09-04,
 2020-09-04 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
X-Mailman-Approved-At: Tue, 08 Sep 2020 17:47:26 +1000
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org, Jet.Le@ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" style=3D"font-family=
:Arial, Helvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Hi,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >thanks for point that the right address and help sending&=
nbsp;upstream.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Jet</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" data-history-expanded=3D"1"=
 dir=3D"ltr" style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; paddi=
ng-left:5px; direction:ltr; margin-right:0px" >----- Original message -----=
<br>From: Santosh Puranik &lt;santosh.puranik.ibm@gmail.com&gt;<br>To: Jet =
Li &lt;Jet.Le@ibm.com&gt;<br>Cc: Joel Stanley &lt;joel@jms.id.au&gt;, Andre=
w Jeffery &lt;andrew@aj.id.au&gt;, Jet Li &lt;Jet.Li@ibm.com&gt;, OpenBMC M=
aillist &lt;openbmc@lists.ozlabs.org&gt;<br>Subject: [EXTERNAL] Re: [PATCH =
linux dev-5.8 v2] ARM: dts: aspeed: rainier: Add I2C buses for NVMe use<br>=
Date: Thu, Sep 3, 2020 1:16 AM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >Hi,<br><br>On 9/1/20 11:53 AM, Joel Stanley wrote:<br>&gt; Hello,<br>&=
gt;<br>&gt; On Tue, 1 Sep 2020 at 06:19, Jet Li &lt;Jet.Le@ibm.com&gt; wrot=
e:<br>&gt;&gt; From: Jet Li &lt;Jet.Li@ibm.com&gt;<br>&gt;&gt;<br>&gt;&gt; =
Adding pca9552 exposes the presence detect lines for the cards and<br>&gt;&=
gt; tca9554 exposes the presence details for the cards.<br><br>This change =
looks incorrect. Per the Rainier workbook,<br><br>there is no TCA chip at 0=
x40 on i2c0. The chip is at 0x20<br><br>and only has presence GPIOs (inputs=
).<br><br>Why is this using a gpio-hog to set this as an output?<br><br>--<=
br><br>Santosh<br><br>&gt; This patch is already in dev-5.8 as a3ce4e380958=
571814bbf3e237e6496d5b35153b.<br>&gt;<br>&gt; Cheers,<br>&gt;<br>&gt; Joel<=
br>&gt;<br>&gt;&gt; Signed-off-by: Jet Li &lt;Jet.Li@ibm.com&gt;<br>&gt;&gt=
; Signed-off-by: Joel Stanley &lt;joel@jms.id.au&gt;<br>&gt;&gt; ---<br>&gt=
;&gt; &nbsp; arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 105 +++++++++++=
++++++++++++++++<br>&gt;&gt; &nbsp; 1 file changed, 105 insertions(+)<br>&g=
t;&gt;<br>&gt;&gt; diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt=
s b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts<br>&gt;&gt; index d20cdf3c=
..e803133 100644<br>&gt;&gt; --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier=
.dts<br>&gt;&gt; +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts<br>&gt;=
&gt; @@ -300,6 +300,21 @@<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;compatible =3D "atmel,24c64";<br>&gt;&gt; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reg =3D &lt;0x51&gt;;=
<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;};<br>&gt;&gt; +<br>&gt;&gt;=
 + &nbsp; &nbsp; &nbsp; tca9554@40 {<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; compatible =3D "ti,tca9554";<br>&gt;&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D &lt;0x40&gt;;<br>&gt;&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gpio-controller;<br>&gt=
;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; #gpio-cells =3D &l=
t;2&gt;;<br>&gt;&gt; +<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; smbus0 {<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gpio-hog;<br>&gt;&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gpios =3D &lt=
;4 GPIO=5FACTIVE=5FHIGH&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; output-high;<br>&gt;&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; l=
ine-name =3D "smbus0";<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; };<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; };<br>&gt;&gt; +<br>&gt;&g=
t; &nbsp; };<br>&gt;&gt;<br>&gt;&gt; &nbsp; &amp;i2c1 {<br>&gt;&gt; @@ -614=
,6 +629,96 @@<br>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;compatible =3D "atmel,24c64";<br>&gt;&gt; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reg =3D &lt;0x51&gt;;<br>&gt;&gt;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;};<br>&gt;&gt; +<br>&gt;&gt; + &nbsp; &n=
bsp; &nbsp; pca1: pca9552@61 {<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; compatible =3D "nxp,pca9552";<br>&gt;&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D &lt;0x61&gt;;<br>&gt;&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; #address-cells =3D &lt;1&gt;=
;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; #size-cell=
s =3D &lt;0&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; gpio-controller;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; #gpio-cells =3D &lt;2&gt;;<br>&gt;&gt; +<br>&gt;&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gpio@0 {<br>&gt;&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D &lt=
;0&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; type =3D &lt;PCA955X=5FTYPE=5FGPIO&gt;;<br>&gt;&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };<br>&gt;&gt; +<br>&gt=
;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gpio@1 {<br>&gt;&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; reg =3D &lt;1&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; type =3D &lt;PCA955X=5FTYPE=5FGPI=
O&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };<br=
>&gt;&gt; +<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
gpio@2 {<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; reg =3D &lt;2&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; type =3D &lt;PC=
A955X=5FTYPE=5FGPIO&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; };<br>&gt;&gt; +<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; gpio@3 {<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D &lt;3&gt;;<br>&gt;&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; type =3D &lt;PCA955X=5FTYPE=5FGPIO&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; };<br>&gt;&gt; +<br>&gt;&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gpio@4 {<br>&gt;&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D &lt;4&=
gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; type =3D &lt;PCA955X=5FTYPE=5FGPIO&gt;;<br>&gt;&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };<br>&gt;&gt; +<br>&gt;&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gpio@5 {<br>&gt;&gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; reg =3D &lt;5&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; type =3D &lt;PCA955X=5FTYPE=5FGPIO&g=
t;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };<br>&g=
t;&gt; +<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gpi=
o@6 {<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; reg =3D &lt;6&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; type =3D &lt;PCA95=
5X=5FTYPE=5FGPIO&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; };<br>&gt;&gt; +<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; gpio@7 {<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D &lt;7&gt;;<br>&gt;&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
type =3D &lt;PCA955X=5FTYPE=5FGPIO&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; };<br>&gt;&gt; +<br>&gt;&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; gpio@8 {<br>&gt;&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D &lt;8&gt;=
;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; type =3D &lt;PCA955X=5FTYPE=5FGPIO&gt;;<br>&gt;&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };<br>&gt;&gt; +<br>&gt;&gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gpio@9 {<br>&gt;&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 reg =3D &lt;9&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; type =3D &lt;PCA955X=5FTYPE=5FGPIO&gt;;=
<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };<br>&gt;&=
gt; +<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gpio@1=
0 {<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; reg =3D &lt;10&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; type =3D &lt;PCA955=
X=5FTYPE=5FGPIO&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; };<br>&gt;&gt; +<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; gpio@11 {<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D &lt;11&gt;;<br>&gt;&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 type =3D &lt;PCA955X=5FTYPE=5FGPIO&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; };<br>&gt;&gt; +<br>&gt;&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gpio@12 {<br>&gt;&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D &lt;12&=
gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; type =3D &lt;PCA955X=5FTYPE=5FGPIO&gt;;<br>&gt;&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };<br>&gt;&gt; +<br>&gt;&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gpio@13 {<br>&gt;&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; reg =3D &lt;13&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; type =3D &lt;PCA955X=5FTYPE=5FGPIO=
&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };<br>=
&gt;&gt; +<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; g=
pio@14 {<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; reg =3D &lt;14&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; type =3D &lt;P=
CA955X=5FTYPE=5FGPIO&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; };<br>&gt;&gt; +<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; gpio@15 {<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D &lt;15&gt;;<br>&gt;&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; type =3D &lt;PCA955X=5FTYPE=5FGPIO&gt;;<br>&gt;&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };<br>&gt;&gt; + &nbsp; &nbsp; &nbsp; };<=
br>&gt;&gt; +<br>&gt;&gt; &nbsp; };<br>&gt;&gt;<br>&gt;&gt; &nbsp; &amp;i2c=
9 {<br>&gt;&gt; --<br>&gt;&gt; 2.7.4<br>&gt;&gt;</font><br>&nbsp;</div></bl=
ockquote>
<div dir=3D"ltr" >&nbsp;</div></div></div><BR>

