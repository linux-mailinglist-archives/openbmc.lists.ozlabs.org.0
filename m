Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EFE170E62
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 03:24:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Sc2J4swhzDqjx
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 13:24:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wiwynn.com (client-ip=103.200.3.19; helo=segapp01.wistron.com;
 envelope-from=max_lai@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=Wistron.onmicrosoft.com
 header.i=@Wistron.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-Wistron-onmicrosoft-com header.b=GLHWx+OW; 
 dkim-atps=neutral
Received: from segapp01.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 48RLvZ42xtzDqRY
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 12:29:44 +1100 (AEDT)
Received: from EXCHAPP03.whq.wistron (unverified [10.37.38.26]) by 
 TWNHUMSW2.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id 
 <Tdd8816fce8c0a816701c58@TWNHUMSW2.wistron.com>; Tue, 25 Feb 2020 
 09:29:40 +0800
Received: from EXCHAPP04.whq.wistron (10.37.38.27) by EXCHAPP03.whq.wistron 
 (10.37.38.26) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1713.5; Tue, 25 Feb 2020 09:29:38 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (10.37.38.70) by 
 mail.wistron.com (10.37.38.27) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1713.5 via Frontend Transport; Tue, 25 Feb 2020 09:29:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none; 
 b=B4dCh8lRiFO3sCz79E/Uu0e5hYpXEkqrAskS9GTBzgV+on6ynG2kdRw81/9bL5FpygXcjcqPm7vgArACAMUAwVldzRMELJedLGYSjbJBwj+iMBxjrBMH15l8B9VFIgAL7GQMbKfMuvL62tWF5qbJmOToNGeVlpzsAxplJ1vcdKcLneyJVBGaOTU/Jd2SJ4silzNoY6x5ZV/JSSNuoI7q8kVR1M9FQT4qxXK0ySRNjj1D6NRA8eEedNlQWrt6EBJDCHwTKnyl4hI7X4Gc/Gh8AsB19r83fv0FpJSg7Imkf9bKFzJ/PpcRTnN/EHsd//886CN/7h73RIDJ2fQkLEYGRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtPtaNdMbRXWXLJ+8S8worR9QYcS3i5Yyvg73nFLFRA=; 
 b=UIUYZAyZ6CeGjLZA5F1XEzfBmltguRSTBOigIw/KVfVYbu/HJR6SR59asSh84V6PFsIXGt+uLOeBb3BD62BeUBBCyyLVgEdAKbB1Opv6pAxPZkbhAevdrfgiRemmSWLJOfF30J0IwqL4qHUbB/6uxNtJTh/iNpGe0W8w7vSBbpCnLJS9qlrfeDgmSsndEt8v7wCx0SPVoyV1Saga5lldEKCoWg2vhI4QBDRkncpXtxibqfwU/vzp/k+UG/OlUKVOHFpzPEAwyRCj9AhqCz3cctW3w9mvlxLvWff5WWYaM41kcC2cdEC9j0a9ygvcWBvnb4h3tXX2ZiBvFI4Id2C6Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass 
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none 
 header.from=wiwynn.com; dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; 
 d=Wistron.onmicrosoft.com; s=selector2-Wistron-onmicrosoft-com; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtPtaNdMbRXWXLJ+8S8worR9QYcS3i5Yyvg73nFLFRA=; 
 b=GLHWx+OWTmOXkcDmEWwvgh/KiWM67T25sKk9wOvgTXXar4x/1r5H45vy3iLuFW8kZ+nZF2ycihckGFMlEM/xR15hLwY3L6Rp2XYpmfDiv00qaLKuzEj6VFJVEQUSaABA98JLNQE/lrkT9Pp4wv8nKs+k1bN2ZyaW5h5Sd1ZvTa4=
Received: from HK2PR02MB3826.apcprd02.prod.outlook.com (10.170.156.210) by 
 HK2PR02MB4241.apcprd02.prod.outlook.com (20.179.122.80) with 
 Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 
 15.20.2750.18; Tue, 25 Feb 2020 01:29:36 +0000
Received: from HK2PR02MB3826.apcprd02.prod.outlook.com 
 ([fe80::c52c:3509:987b:9b1d]) by 
 HK2PR02MB3826.apcprd02.prod.outlook.com 
 ([fe80::c52c:3509:987b:9b1d%6]) with mapi id 15.20.2750.021; Tue, 25 
 Feb 2020 01:29:36 +0000
From: Max Lai/WYHQ/Wiwynn <Max_Lai@wiwynn.com>
To: James Feist <james.feist@linux.intel.com>
Subject: RE: dbus-sensor: setting the upper non-critical(unc) threshold value
 smaller than reading value would get 3 logs ( assert log,
 de-assert log and then assert log)
Thread-Topic: dbus-sensor: setting the upper non-critical(unc) threshold 
 value smaller than reading value would get 3 logs 
 ( assert log, de-assert log and then assert log)
Thread-Index: AdXmxFb2+sB10j5LQXa8MfyHCelpJQAg0hsAAO4TfuAAFJftgAAIYqww
Date: Tue, 25 Feb 2020 01:29:36 +0000
Message-ID: <HK2PR02MB3826453CD6DDB410E8C22DDCEAED0@HK2PR02MB3826.apcprd02.prod.outlook.com>
References: <HK2PR02MB38260025D3279EB8DBF0523CEA100@HK2PR02MB3826.apcprd02.prod.outlook.com>
 <900ef2d7-3755-a3f1-ad40-4cd9e849ebf7@linux.intel.com> 
 <HK2PR02MB3826381BDA6F9AEE8CF67D7FEAEC0@HK2PR02MB3826.apcprd02.prod.outlook.com>
 <0db737a0-c83c-445d-d0bf-05e6aa3d20fa@linux.intel.com>
In-Reply-To: <0db737a0-c83c-445d-d0bf-05e6aa3d20fa@linux.intel.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) 
 smtp.mailfrom=Max_Lai@wiwynn.com; 
x-originating-ip: [125.227.140.245]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac05acde-4bc0-4eac-3825-08d7b9922ce7
x-ms-traffictypediagnostic: HK2PR02MB4241:|HK2PR02MB4241:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR02MB42411EFD147C7867D810AC22EAED0@HK2PR02MB4241.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0324C2C0E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(189003)(199004)(26005)(4326008)(66556008)(86362001)(66446008)(478600001)(7696005)(8676002)(53546011)(76116006)(9686003)(55016002)(8936002)(2906002)(6506007)(64756008)(66576008)(66946007)(66476007)(33656002)(316002)(5660300002)(71200400001)(54906003)(81156014)(186003)(107886003)(6916009)(81166006)(52536014);
 DIR:OUT;SFP:1102;SCL:1;SRVR:HK2PR02MB4241;
 H:HK2PR02MB3826.apcprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;
 PTR:InfoNoRecords;MX:1;A:1;
received-spf: None 
 (protection.outlook.com: wiwynn.com does not designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: um5EQBZu+7XbxKklZz6rQPqO7prwUljmf7rEj7Mn0ZvclDEgrMLGf7VbPyMlN5AxHx645NRCb0TbZYWHHI3kSpPMSv4fYw8f+OzUW53273h+qzwdV+EKl9KNm4/ufWE6ZdaZG6aVv1JOHcMKSOf2ROZiInIb4p4m/vFtvPgamg3bNeclXWSwmmvTPys1Q0704NQmIfQufObdxmw7Ub5jFVhuMHDIwQxQG8Exz16CKsn5jd2RQoosRPNKE+DeTwG/oSKqpHNw+SQcVmmKZeTyM78VOqvuZIccvD3ZdYsBXyZ07prar4rXvcKsaBkyU9R42nJl5kxIaHLtbAvuCcD6uXr2ySe9D6Nqw6e3oaLO3u8bJz6DM1KCj2ubxmMFzP+ysCtqZ7tm9eU1UcWLbIT8VzYoccTFORAFDPQcaOLQmD4CZS3XZzI35uEWcyKOkCJu
x-ms-exchange-antispam-messagedata: Co9y22PPEX8CEU34Bl2EYSOmgBLaYN2dw5RB+X8PZxJw73CfkVM1fYix8OUO7b0z2ESHvqfyMaSiMesoLd3KXDKVFp2JFCriYmidorAsjw+pp4xTUeRRQotJlNu+1VPjmKyuie4Wtvw9K76K1vsmGg==
Content-Type: multipart/related; 
 boundary="_006_HK2PR02MB3826453CD6DDB410E8C22DDCEAED0HK2PR02MB3826apcp_";
 type="multipart/alternative"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ac05acde-4bc0-4eac-3825-08d7b9922ce7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2020 01:29:36.4349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de0795e0-d7c0-4eeb-b9bb-bc94d8980d3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +rdFDXoQ7kP4VoHGj+2zUe2LTy6YiV40fZ3yGrqZqXAiMjETV0NUzMk3qIrgLW7v6pXKx3YEaW3WhsNBmu/u2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR02MB4241
X-OriginatorOrg: wiwynn.com
X-TM-SNTS-SMTP: 82AD06AF31967F5D03D1D920515FB503EF27FF5A754290B10E6E7A661EEBDC812000:8
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:08:41 +1100
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "LF_OpenBMC.WYHQ.Wiwynn" <LF_OpenBMC.WYHQ.Wiwynn@Wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_006_HK2PR02MB3826453CD6DDB410E8C22DDCEAED0HK2PR02MB3826apcp_
Content-Type: multipart/alternative; 
    boundary="_000_HK2PR02MB3826453CD6DDB410E8C22DDCEAED0HK2PR02MB3826apcp_"

--_000_HK2PR02MB3826453CD6DDB410E8C22DDCEAED0HK2PR02MB3826apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi James,

Sorry for I offered the wrong information. The last mail this sentence "str=
uct sensor's "objectType" member which was set "xyz.openbmc_project.Configu=
ration.ExitAirTemp" was different than our "xyz.openbmc_project.EntityManag=
er"." is wrong. The correct information is "struct sensor's "objectType" me=
mber which was set "xyz.openbmc_project.Configuration.ExitAirTemp" was diff=
erent than our "xyz.openbmc_project.Configuration.IpmbSensor". The differen=
t is between "xyz.openbmc_project.Configuration.ExitAirTemp" and "xyz.openb=
mc_project.Configuration.IpmbSensor".



Upstream Source Revision : 241356e3dcff3e91393c858256ac29d003e6179e

[cid:image004.png@01D5EBBE.164F0A50][cid:image002.png@01D5EBB7.BF058450]



Our Source Revision : fb64f45d3399b182ceadffb8fa86ee68c0aa0a11

[cid:image004.png@01D5EBBE.164F0A50][cid:image001.png@01D5EBB7.48C83300]


Please let us know if you have any questions.

Thanks for your reply!

Engineer
Storage Firmware
Development Dept.
Firmware Development Div.

Wiwynn Corporation

Tel: +886-2-6614-7549
E-mail: Max_Lai@wiwynn.com<mailto:Max_Lai@wiwynn.com>



-----Original Message-----
From: James Feist <james.feist@linux.intel.com>
Sent: Tuesday, February 25, 2020 4:38 AM
To: Max Lai/WYHQ/Wiwynn <Max_Lai@wiwynn.com>
Cc: openbmc@lists.ozlabs.org; LF_OpenBMC.WYHQ.Wiwynn <LF_OpenBMC.WYHQ.Wiwyn=
n@Wiwynn.com>
Subject: Re: dbus-sensor: setting the upper non-critical(unc) threshold val=
ue smaller than reading value would get 3 logs ( assert log, de-assert log =
and then assert log)



On 2/24/20 3:31 AM, Max Lai/WYHQ/Wiwynn wrote:

> Hi James,

>

> We had tried your fix solution (Deleting lines 117 and 118). Deleting

> the lines 117 and 118 would stop sending the PropertiesChanged signal

> and even stop updating threshold value on Dbus. The result we want is

> we can change threshold value on Dbus and get assert sel log when we

> trigger the threshold mechanism. And we also tried the latest source

> revision on upstream dbus-sensor repository. We found that latest

> source revision in IpmbSensor.cpp, struct sensor's "objectType" member

> which was set "xyz.openbmc_project.Configuration.ExitAirTemp" was

> different than our "xyz.openbmc_project.EntityManager". So this issue doe=
sn't happen.

>

> What's the purpose of this changing?



Can you send a diff? I'm not exactly sure the line you're mentioning.





---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------
This email contains confidential or legally privileged information and is f=
or the sole use of its intended recipient.=20
Any unauthorized review, use, copying or distribution of this email or the =
content of this email is strictly prohibited.
If you are not the intended recipient, you may reply to the sender and shou=
ld delete this e-mail immediately.
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------

--_000_HK2PR02MB3826453CD6DDB410E8C22DDCEAED0HK2PR02MB3826apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"\7D14\6587\5B57 \5B57\5143";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.a
	{mso-style-name:"\7D14\6587\5B57 \5B57\5143";
	mso-style-priority:99;
	mso-style-link:\7D14\6587\5B57;
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal-compose;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1028" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Hi James,<o:p></o:p></span><=
/p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Sorry for I offered the wron=
g information. The last mail this sentence &quot;struct sensor's &quot;obje=
ctType&quot; member which was set &quot;xyz.openbmc_project.Configuration.E=
xitAirTemp&quot; was different than our &quot;<span style=3D"color:red">xyz=
.openbmc_project.EntityManager</span>&quot;.&quot;
 is <b><span style=3D"color:red">wrong</span></b>. The <b><span style=3D"co=
lor:red">correct</span></b><span style=3D"color:red">
</span>information is &quot;struct sensor's &quot;objectType&quot; member w=
hich was set &quot;xyz.openbmc_project.Configuration.ExitAirTemp&quot; was =
different than our &quot;<b><span style=3D"color:red">xyz.openbmc_project.C=
onfiguration.IpmbSensor</span></b>&quot;. The different is between &quot;xy=
z.openbmc_project.Configuration.<b>ExitAirTemp</b>&quot;
 and &quot;xyz.openbmc_project.Configuration.<b>IpmbSensor</b>&quot;.<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><b><span lang=3D"EN-US">Upstream Source Revision =
: 241356e3dcff3e91393c858256ac29d003e6179e<o:p></o:p></span></b></p>
<p class=3D"MsoPlainText"><!--[if gte vml 1]><v:shapetype id=3D"_x0000_t75"=
 coordsize=3D"21600,21600" o:spt=3D"75" o:preferrelative=3D"t" path=3D"m@4@=
5l@4@11@9@11@9@5xe" filled=3D"f" stroked=3D"f">
<v:stroke joinstyle=3D"miter" />
<v:formulas>
<v:f eqn=3D"if lineDrawn pixelLineWidth 0" />
<v:f eqn=3D"sum @0 1 0" />
<v:f eqn=3D"sum 0 0 @1" />
<v:f eqn=3D"prod @2 1 2" />
<v:f eqn=3D"prod @3 21600 pixelWidth" />
<v:f eqn=3D"prod @3 21600 pixelHeight" />
<v:f eqn=3D"sum @0 0 1" />
<v:f eqn=3D"prod @6 1 2" />
<v:f eqn=3D"prod @7 21600 pixelWidth" />
<v:f eqn=3D"sum @8 21600 0" />
<v:f eqn=3D"prod @7 21600 pixelHeight" />
<v:f eqn=3D"sum @10 21600 0" />
</v:formulas>
<v:path o:extrusionok=3D"f" gradientshapeok=3D"t" o:connecttype=3D"rect" />
<o:lock v:ext=3D"edit" aspectratio=3D"t" />
</v:shapetype><v:shape id=3D"_x77e9__x5f62__x0020_2" o:spid=3D"_x0000_s1027=
" type=3D"#_x0000_t75" style=3D'position:absolute;margin-left:63pt;margin-t=
op:130.35pt;width:275.25pt;height:16.5pt;z-index:251659264;visibility:visib=
le;mso-wrap-distance-left:9pt;mso-wrap-distance-top:0;mso-wrap-distance-rig=
ht:9pt;mso-wrap-distance-bottom:0;mso-position-horizontal:absolute;mso-posi=
tion-horizontal-relative:text;mso-position-vertical:absolute;mso-position-v=
ertical-relative:text'>
<v:imagedata src=3D"cid:image004.png@01D5EBBE.164F0A50" o:title=3D"" />
<o:lock v:ext=3D"edit" aspectratio=3D"f" />
</v:shape><![endif]--><![if !vml]><span style=3D"mso-ignore:vglayout;positi=
on:absolute;z-index:251659264;margin-left:84px;margin-top:174px;width:367px=
;height:22px"><img width=3D"367" height=3D"22" style=3D"width:3.8229in;heig=
ht:.2291in" src=3D"cid:image004.png@01D5EBBE.164F0A50" v:shapes=3D"_x77e9__=
x5f62__x0020_2"></span><![endif]><span lang=3D"EN-US"><img width=3D"590" he=
ight=3D"215" style=3D"width:6.1458in;height:2.2395in" id=3D"_x5716__x7247__=
x0020_1" src=3D"cid:image002.png@01D5EBB7.BF058450"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><b><span lang=3D"EN-US">Our Source Revision : fb6=
4f45d3399b182ceadffb8fa86ee68c0aa0a11<o:p></o:p></span></b></p>
<p class=3D"MsoPlainText"><!--[if gte vml 1]><v:shape id=3D"_x77e9__x5f62__=
x0020_3" o:spid=3D"_x0000_s1026" type=3D"#_x0000_t75" style=3D'position:abs=
olute;margin-left:60.75pt;margin-top:144.45pt;width:275.25pt;height:16.5pt;=
z-index:251661312;visibility:visible;mso-wrap-distance-left:9pt;mso-wrap-di=
stance-top:0;mso-wrap-distance-right:9pt;mso-wrap-distance-bottom:0;mso-pos=
ition-horizontal:absolute;mso-position-horizontal-relative:text;mso-positio=
n-vertical:absolute;mso-position-vertical-relative:text'>
<v:imagedata src=3D"cid:image004.png@01D5EBBE.164F0A50" o:title=3D"" />
<o:lock v:ext=3D"edit" aspectratio=3D"f" />
</v:shape><![endif]--><![if !vml]><span style=3D"mso-ignore:vglayout;positi=
on:absolute;z-index:251661312;margin-left:81px;margin-top:192px;width:367px=
;height:22px"><img width=3D"367" height=3D"22" style=3D"width:3.8229in;heig=
ht:.2291in" src=3D"cid:image004.png@01D5EBBE.164F0A50" v:shapes=3D"_x77e9__=
x5f62__x0020_3"></span><![endif]><span lang=3D"EN-US"><img width=3D"583" he=
ight=3D"233" style=3D"width:6.0729in;height:2.427in" id=3D"_x0000_i1026" sr=
c=3D"cid:image001.png@01D5EBB7.48C83300" alt=3D"cid:image001.png@01D5EBB7.4=
8C83300"></span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Please let us know if you ha=
ve any questions.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Thanks for your reply!<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Enginee=
r</span><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Storage=
 Firmware<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Develop=
ment Dept.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Firmwar=
e Development Div.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">Wiwynn Co=
rporation<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">Tel: &#43=
;886-2-6614-7549<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">E-mail:=
</span><span lang=3D"EN-US" style=3D"color:#002060">
<a href=3D"mailto:Max_Lai@wiwynn.com"><span style=3D"color:#0563C1">Max_Lai=
@wiwynn.com</span></a></span><span lang=3D"EN-US" style=3D"color:#1F497D"><=
o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">-----Original Message-----<b=
r>
From: James Feist &lt;james.feist@linux.intel.com&gt; <br>
Sent: Tuesday, February 25, 2020 4:38 AM<br>
To: Max Lai/WYHQ/Wiwynn &lt;Max_Lai@wiwynn.com&gt;<br>
Cc: openbmc@lists.ozlabs.org; LF_OpenBMC.WYHQ.Wiwynn &lt;LF_OpenBMC.WYHQ.Wi=
wynn@Wiwynn.com&gt;<br>
Subject: Re: dbus-sensor: setting the upper non-critical(unc) threshold val=
ue smaller than reading value would get 3 logs ( assert log, de-assert log =
and then assert log)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">On 2/24/20 3:31 AM, Max Lai/=
WYHQ/Wiwynn wrote:<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; Hi James,<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; <o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; We had tried your fix s=
olution (Deleting lines 117 and 118). Deleting
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; the lines 117 and 118 w=
ould stop sending the PropertiesChanged signal
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; and even stop updating =
threshold value on Dbus. The result we want is
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; we can change threshold=
 value on Dbus and get assert sel log when we
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; trigger the threshold m=
echanism. And we also tried the latest source
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; revision on upstream db=
us-sensor repository. We found that latest
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; source revision in Ipmb=
Sensor.cpp, struct sensor's &quot;objectType&quot; member
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; which was set &quot;xyz=
.openbmc_project.Configuration.ExitAirTemp&quot; was
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; different than our &quo=
t;xyz.openbmc_project.EntityManager&quot;. So this issue doesn</span><span =
lang=3D"EN-US" style=3D"font-family:&quot;Courier New&quot;">&#8217;</span>=
<span lang=3D"EN-US">t happen.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; <o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt; What's the purpose of t=
his changing?<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Can you send a diff? I'm not=
 exactly sure the line you're mentioning.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>

<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------</b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
This email contains confidential or legally privileged information and is f=
or the sole use of its intended recipient. </b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
Any unauthorized review, use, copying or distribution of this email or the =
content of this email is strictly prohibited.</b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
If you are not the intended recipient, you may reply to the sender and shou=
ld delete this e-mail immediately.</b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------</b></span></p></body>
</html>

--_000_HK2PR02MB3826453CD6DDB410E8C22DDCEAED0HK2PR02MB3826apcp_--

--_006_HK2PR02MB3826453CD6DDB410E8C22DDCEAED0HK2PR02MB3826apcp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=31699; 
    creation-date="Tue, 25 Feb 2020 01:29:34 GMT"; 
    modification-date="Tue, 25 Feb 2020 01:29:34 GMT"
Content-ID: <image001.png@01D5EBB7.48C83300>
Content-Transfer-Encoding: base64

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
RU5ErkJggg==

--_006_HK2PR02MB3826453CD6DDB410E8C22DDCEAED0HK2PR02MB3826apcp_
Content-Type: image/png; name="image002.png"
Content-Description: image002.png
Content-Disposition: inline; filename="image002.png"; size=30368; 
    creation-date="Tue, 25 Feb 2020 01:29:35 GMT"; 
    modification-date="Tue, 25 Feb 2020 01:29:35 GMT"
Content-ID: <image002.png@01D5EBB7.BF058450>
Content-Transfer-Encoding: base64

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

--_006_HK2PR02MB3826453CD6DDB410E8C22DDCEAED0HK2PR02MB3826apcp_
Content-Type: image/png; name="image004.png"
Content-Description: image004.png
Content-Disposition: inline; filename="image004.png"; size=255; 
    creation-date="Tue, 25 Feb 2020 01:29:35 GMT"; 
    modification-date="Tue, 25 Feb 2020 01:29:35 GMT"
Content-ID: <image004.png@01D5EBBE.164F0A50>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAW8AAAAWCAMAAAFPv90NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAMUExURQAAAP4AAP4AAP8AAPrdYxoAAAADdFJOUwDP74ah8LYAAAAJcEhZcwAADsMA
AA7DAcdvqGQAAABtSURBVFhH7dgxCsAwDARB2fr/n5NCZQio0IJgp7bP4lwkOE52REZLd3lLbZoy
mr84fM6pI0Z4nZ+Gw0fj5zg4zcFp7+A71fySJOmPX0zS2h/CpeybZd8s+2bZN8u+WfbNsm+WfbMy
bj3MCpD3AbhCCQ2iGtrRAAAAAElFTkSuQmCC

--_006_HK2PR02MB3826453CD6DDB410E8C22DDCEAED0HK2PR02MB3826apcp_--
