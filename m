Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BB8FD2E5
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 03:25:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Dhyw5jmQzF77Z
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 13:25:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wiwynn.com (client-ip=103.200.3.19; helo=segapp01.wistron.com;
 envelope-from=bright_cheng@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=Wistron.onmicrosoft.com
 header.i=@Wistron.onmicrosoft.com header.b="BhpVj1dU"; 
 dkim-atps=neutral
Received: from segapp01.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 47Dhy8697JzF70y
 for <openbmc@lists.ozlabs.org>; Fri, 15 Nov 2019 13:24:47 +1100 (AEDT)
Received: from EXCHAPP03.whq.wistron (unverified [10.37.38.26]) by 
 TWNHUMSW5.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id 
 <Tdb7b00bd9ec0a8167311d0@TWNHUMSW5.wistron.com>; Fri, 15 Nov 2019 
 10:24:43 +0800
Received: from EXCHAPP03.whq.wistron (10.37.38.26) by EXCHAPP03.whq.wistron 
 (10.37.38.26) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1713.5; Fri, 15 Nov 2019 10:24:40 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (10.37.38.71) by 
 mail.wistron.com (10.37.38.26) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1713.5 via Frontend Transport; Fri, 15 Nov 2019 10:24:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none; 
 b=c+ZQuW0mnA2RQlAxoMcyvQzla1NMcqo12OdzilzPWghDOoe37tBmBQWOyQXKs+kWFE47WLnr3GYLpkY/eVgY0HsyNYUbv00lAyFAc//Yw4mB6XqgkShjELJ4cz0tTo8imT9Mpy9Inp0vwGR2x8RdtjsETgZWRXSCeJfLqBPgHWg1CEfJdOXkhbfI8+70M/V0KSPIGhad0zvuDgbJJeLL37M/iHrap9wWUC0PnIaswfy9bmtXeUpb0M6z4mxI7WUUqAPIPdJlkeg2Ih9y09PQfby4cMaUNAD+PVGo8CtYe6dcN2uNEbnspcXrFS3rglBVPd3tGZ+dL4mh6VVwaogGXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBUm/aLV7Rw1blixCYEz6BaSKKsFbxQxGUIcAxQBtfQ=; 
 b=Hu1eEZxVmxGmeUw2tnGtpeUCUwHiW4Zg4hk0XPY//69xMDtyrQltDQX62rCTzc9c4qFWYhYP2ou7vPN2xjBnhIHG4fHz2itN5ymVM5PcUrYy1DU3zEw/5nLIMpnWc+wcznZz8MCIC2Sxw4FL/RlJ6A8vE37ZV7a4+mu/Uontau6jmzB4vWBU5HsOOmEEAsTa0IY9/WpwWoHKGh9s6RrtUyukdzEJJdEJeCg028tNQbkulIhEzpybUzXK6X2TpRa5CD4rO3hJhm65CDhIojr2WjYij+XvirAZUSVRPIDOo/SFptIw5yPYY/CGUe8FFonngu2g/iNaSVJQgfe44QRx9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass 
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none 
 header.from=wiwynn.com; dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; 
 d=Wistron.onmicrosoft.com; s=selector2-Wistron-onmicrosoft-com; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBUm/aLV7Rw1blixCYEz6BaSKKsFbxQxGUIcAxQBtfQ=; 
 b=BhpVj1dUQ/QIODwwOJRN5DhuzUxyejKXF5bQkPH5Qe6JypE5ADTVKlP+Z53cA3NG8CDDxRKdbOlGJbxIBMTdIY34jjU1R7VR9nIlAuWla1Kb9/KkhUx9fLW0YJvDACH/lf/1E7DkXUYOJ8qwX7sExQ6ADnb6J7entr6puSbyYMY=
Received: from HK0PR02MB3348.apcprd02.prod.outlook.com (20.177.68.82) by 
 HK0PR02MB2945.apcprd02.prod.outlook.com (20.177.27.206) with 
 Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 
 15.20.2451.28; Fri, 15 Nov 2019 02:24:38 +0000
Received: from HK0PR02MB3348.apcprd02.prod.outlook.com 
 ([fe80::c0bf:21c2:bd83:4133]) by 
 HK0PR02MB3348.apcprd02.prod.outlook.com 
 ([fe80::c0bf:21c2:bd83:4133%4]) with mapi id 15.20.2430.028; Fri, 15 
 Nov 2019 02:24:38 +0000
From: Bright Cheng/WYHQ/Wiwynn <Bright_Cheng@wiwynn.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 'Adriana Kobylak' 
 <anoo@us.ibm.com>, Gunnar Mills <gmills@linux.vnet.ibm.com>, Lei Yu 
 <mine260309@gmail.com>, Ratan Gupta <ratagupt@linux.vnet.ibm.com>, 
 "Jayanth Othayoth" <ojayanth@in.ibm.com>
Subject: phosphor-bmc-code-memt: Support redfish remote firmware update with
 static layout image
Thread-Topic: phosphor-bmc-code-memt: Support redfish remote firmware update 
 with static layout image
Thread-Index: AdWbW9KkyR3t7kg+SUGh/ZISxSBNlg==
Date: Fri, 15 Nov 2019 02:24:37 +0000
Message-ID: <HK0PR02MB33487C8E6D56DD2143034D0C9F700@HK0PR02MB3348.apcprd02.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) 
 smtp.mailfrom=Bright_Cheng@wiwynn.com; 
x-originating-ip: [125.227.140.245]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd9d8020-7a5a-4f79-d079-08d76972f69e
x-ms-traffictypediagnostic: HK0PR02MB2945:|HK0PR02MB2945:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR02MB29453B782FBA1B6EE7B579D39F700@HK0PR02MB2945.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02229A4115
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(189003)(51874003)(199004)(66616009)(71190400001)(71200400001)(4744005)(2501003)(80792005)(486006)(476003)(33656002)(76116006)(4326008)(107886003)(64756008)(52536014)(66446008)(7110500001)(66066001)(6436002)(54896002)(9686003)(55016002)(6306002)(66556008)(66946007)(5660300002)(66476007)(316002)(2906002)(81166006)(14454004)(15650500001)(478600001)(110136005)(54906003)(25786009)(7696005)(102836004)(86362001)(74316002)(8936002)(2420400007)(26005)(81156014)(186003)(8676002)(256004)(14444005)(5024004)(99286004)(790700001)(3846002)(7736002)(6506007)(6116002);
 DIR:OUT;SFP:1102;SCL:1;SRVR:HK0PR02MB2945;
 H:HK0PR02MB3348.apcprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;
 PTR:InfoNoRecords;MX:1;A:1;
received-spf: None 
 (protection.outlook.com: wiwynn.com does not designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mlh5ASqUZHLiqYD02y0NrYjBpggDszVi/FFbp7z2eQdJ3TxyIToUwgRF/Y6iZ4HJ4qzYO7tA4nVtg1XFgVF3mAkI+XGoRvCQzSBotAsjNhNqdovJfzYXdn/dN13CDlhysDNESy9WgTCCWmsSV1RT8uKs4H8Skxm7cDzakrGRh/R+zc2HN7oBW4b8zKayXOHE9Q3sqhZ/wisyuxdCT+NdO3mnNkwiTJmXF8TDVDXkKL4vSPukkychxykfIwmGRyyhmBjkT1ZgFXTYhCgQ25Ab339fEgs+3f0XMlH9K+lTR0fFySLdNAyTRjbVkBR3/3loVgJgR7gZv76vuA29pIseknU3IB/lzN5yWJnzalM0EvlzQyCnvoiJd24fkQapPmZMHztcwIv9GSuYyr80Gn4UlGuaJeugyhJcRL63KkgvK5wVUhdWpg+z7kxhHFDaPl+Y
Content-Type: multipart/mixed; 
 boundary="_004_HK0PR02MB33487C8E6D56DD2143034D0C9F700HK0PR02MB3348apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9d8020-7a5a-4f79-d079-08d76972f69e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2019 02:24:37.8914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de0795e0-d7c0-4eeb-b9bb-bc94d8980d3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /UpeMEaR00oyfZxSWJ8Gb7ufmXdLyETFIvr6c5yQhwaUPoDI3rOeXbHUQ1fbGVzl7p2+LEuGBWSJjAUrBOZxWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR02MB2945
X-OriginatorOrg: wiwynn.com
X-TM-SNTS-SMTP: 4535451524F314C01944CE2F101FFE0EE9CAC93330B21AB414A8EE85F625FDE02000:8
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
Cc: 'Neeraj Ladkani' <neladk@microsoft.com>,
 Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_004_HK0PR02MB33487C8E6D56DD2143034D0C9F700HK0PR02MB3348apcp_
Content-Type: multipart/alternative; 
    boundary="_000_HK0PR02MB33487C8E6D56DD2143034D0C9F700HK0PR02MB3348apcp_"

--_000_HK0PR02MB33487C8E6D56DD2143034D0C9F700HK0PR02MB3348apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Adriana,

We add some modifications for phosphor-bmc-code-mgmt can support remote BMC=
 update for static layout.

Do you agree these modifications?

phosphor-bmc-code-memt doesn't support static-layout remote update since st=
atic layout fw package could only has "image-bmc" in the package.

Following are the modifications
1. Add a name list for static layout only has image-bmc in the fw package a=
nd modify related image file checking.
2. Add checking ApplyTime property for static layout to decide whether rebo=
ot to apply update process or not.

Please find the patch for these modifications in the attachment.

Thanks in advanced for any insight !

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

--_000_HK0PR02MB33487C8E6D56DD2143034D0C9F700HK0PR02MB3348apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Microsoft JhengHei";
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"Microsoft JhengHei";
	panose-1:2 11 6 4 3 5 4 4 2 4;}
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Times New Roman",serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">Hi Adriana,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">We add some modifications for pho=
sphor-bmc-code-mgmt can support remote BMC update for static layout.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">Do you agree these modifications?=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">phosphor-bmc-code-memt doesn&#821=
7;t support static-layout remote update since static layout fw package coul=
d only has &#8220;image-bmc&#8221; in the package.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">Following are the modifications<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">1. Add a name list for static lay=
out only has image-bmc in the fw package and modify related image file chec=
king.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">2. Add checking ApplyTime propert=
y for static layout to decide whether reboot to apply update process or not=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">Please find the patch for these m=
odifications in the attachment.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">Thanks in advanced for any insigh=
t !<o:p></o:p></span></p>
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

--_000_HK0PR02MB33487C8E6D56DD2143034D0C9F700HK0PR02MB3348apcp_--

--_004_HK0PR02MB33487C8E6D56DD2143034D0C9F700HK0PR02MB3348apcp_
Content-Type: application/octet-stream; 
    name="0001-add-namelist-to-support-image-bmc-and-using-systemca.patch"
Content-Description: 0001-add-namelist-to-support-image-bmc-and-using-systemca.patch
Content-Disposition: attachment; 
    filename="0001-add-namelist-to-support-image-bmc-and-using-systemca.patch";
     size=6430; creation-date="Fri, 15 Nov 2019 01:02:29 GMT"; 
    modification-date="Fri, 15 Nov 2019 01:02:29 GMT"
Content-Transfer-Encoding: base64

RnJvbSBhMGZkNmRjNWRjNTM4MDQ4ZTJiZjQ5NTBiNzNmN2YxYTc3ZGZiMzcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBicmlnaHQgPGJyaWdodF9jaGVuZ0B3aXd5bm4uY29tPgpEYXRl
OiBUaHUsIDEyIFNlcCAyMDE5IDE3OjI1OjM0ICswODAwClN1YmplY3Q6IFtQQVRDSF0gYWRkIG5h
bWVsaXN0IHRvIHN1cHBvcnQgaW1hZ2UgYm1jIGFuZCB1c2luZyBzeXN0ZW1jYWxsIHRvCiByZWJv
b3QgQk1DCgotLS0KIGFjdGl2YXRpb24uY3BwICAgICAgIHwgMjAgKysrKysrKysrKysrKysrKyst
LS0KIGRvd25sb2FkX21hbmFnZXIuY3BwIHwgIDQgKysrKwogaW1hZ2VzLmhwcCAgICAgICAgICAg
fCAgMiArKwogaXRlbV91cGRhdGVyLmNwcCAgICAgfCAxOSArKysrKysrKysrKysrKy0tLS0tCiBz
dGF0aWMvZmxhc2guY3BwICAgICB8IDIyICsrKysrKysrKysrKysrKysrKystLS0KIDUgZmlsZXMg
Y2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YWN0aXZhdGlvbi5jcHAgYi9hY3RpdmF0aW9uLmNwcAppbmRleCAwYzE4ODIxLi4xZmY4ZWZmIDEw
MDY0NAotLS0gYS9hY3RpdmF0aW9uLmNwcAorKysgYi9hY3RpdmF0aW9uLmNwcApAQCAtNzgsNyAr
NzgsNiBAQCB2b2lkIEFjdGl2YXRpb246OnVuc3Vic2NyaWJlRnJvbVN5c3RlbWRTaWduYWxzKCkK
IAogYXV0byBBY3RpdmF0aW9uOjphY3RpdmF0aW9uKEFjdGl2YXRpb25zIHZhbHVlKSAtPiBBY3Rp
dmF0aW9ucwogewotCiAgICAgaWYgKCh2YWx1ZSAhPSBzb2Z0d2FyZVNlcnZlcjo6QWN0aXZhdGlv
bjo6QWN0aXZhdGlvbnM6OkFjdGl2ZSkgJiYKICAgICAgICAgKHZhbHVlICE9IHNvZnR3YXJlU2Vy
dmVyOjpBY3RpdmF0aW9uOjpBY3RpdmF0aW9uczo6QWN0aXZhdGluZykpCiAgICAgewpAQCAtMjAw
LDcgKzE5OSwyMyBAQCBhdXRvIEFjdGl2YXRpb246OmFjdGl2YXRpb24oQWN0aXZhdGlvbnMgdmFs
dWUpIC0+IEFjdGl2YXRpb25zCiAgICAgICAgIC8vIENyZWF0ZSBhY3RpdmUgYXNzb2NpYXRpb24K
ICAgICAgICAgcGFyZW50LmNyZWF0ZUFjdGl2ZUFzc29jaWF0aW9uKHBhdGgpOwogCi0gICAgICAg
IGxvZzxsZXZlbDo6SU5GTz4oIkJNQyBpbWFnZSByZWFkeSwgbmVlZCByZWJvb3QgdG8gZ2V0IGFj
dGl2YXRlZC4iKTsKKyAgICAgICAgaWYgKEFjdGl2YXRpb246OmNoZWNrQXBwbHlUaW1lSW1tZWRp
YXRlKCkgPT0gdHJ1ZSkKKyAgICAgICAgeworICAgICAgICAgICAgbG9nPGxldmVsOjpJTkZPPigi
SW1hZ2UgQWN0aXZlLiBBcHBseVRpbWUgaXMgaW1tZWRpYXRlLCAiCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJyZWJvb3RpbmcgQk1DLiIpOworICAgICAgICAgICAgYXV0byByZXBseSA9
IHN0ZDo6c3lzdGVtKCIvc2Jpbi9yZWJvb3QiKTsKKyAgICAgICAgICAgIGlmIChyZXBseSA8IDAp
CisgICAgICAgICAgICB7CisgICAgICAgICAgICAgICAgbG9nPGxldmVsOjpBTEVSVD4oIkVycm9y
IGluIHRyeWluZyB0byByZWJvb3QgdGhlIEJNQy4gIgorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJUaGUgQk1DIG5lZWRzIHRvIGJlIG1hbnVhbGx5IHJlYm9vdGVkIHRvIGNvbXBs
ZXRlICIKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAidGhlIGltYWdlIGFjdGl2
YXRpb24uIik7CisgICAgICAgICAgICB9CisgICAgICAgIH0KKyAgICAgICAgZWxzZQorICAgICAg
ICB7CisgICAgICAgICAgICBsb2c8bGV2ZWw6OklORk8+KCJCTUMgaW1hZ2UgcmVhZHksIG5lZWQg
cmVib290IHRvIGdldCBhY3RpdmF0ZWQuIik7CisgICAgICAgIH0KKwogICAgICAgICByZXR1cm4g
c29mdHdhcmVTZXJ2ZXI6OkFjdGl2YXRpb246OmFjdGl2YXRpb24oCiAgICAgICAgICAgICBzb2Z0
d2FyZVNlcnZlcjo6QWN0aXZhdGlvbjo6QWN0aXZhdGlvbnM6OkFjdGl2ZSk7CiAjZW5kaWYKQEAg
LTIxMiw3ICsyMjcsNiBAQCBhdXRvIEFjdGl2YXRpb246OmFjdGl2YXRpb24oQWN0aXZhdGlvbnMg
dmFsdWUpIC0+IEFjdGl2YXRpb25zCiAgICAgfQogICAgIHJldHVybiBzb2Z0d2FyZVNlcnZlcjo6
QWN0aXZhdGlvbjo6YWN0aXZhdGlvbih2YWx1ZSk7CiB9Ci0KIHZvaWQgQWN0aXZhdGlvbjo6ZGVs
ZXRlSW1hZ2VNYW5hZ2VyT2JqZWN0KCkKIHsKICAgICAvLyBDYWxsIHRoZSBEZWxldGUgb2JqZWN0
IGZvciA8dmVyc2lvbklEPiBpbnNpZGUgaW1hZ2VfbWFuYWdlcgpkaWZmIC0tZ2l0IGEvZG93bmxv
YWRfbWFuYWdlci5jcHAgYi9kb3dubG9hZF9tYW5hZ2VyLmNwcAppbmRleCA2MzU3ZWU4Li5hNmJl
ZWU3IDEwMDY0NAotLS0gYS9kb3dubG9hZF9tYW5hZ2VyLmNwcAorKysgYi9kb3dubG9hZF9tYW5h
Z2VyLmNwcApAQCAtMzAsNiArMzAsOCBAQCB2b2lkIERvd25sb2FkOjpkb3dubG9hZFZpYVRGVFAo
c3RkOjpzdHJpbmcgZmlsZU5hbWUsIHN0ZDo6c3RyaW5nIHNlcnZlckFkZHJlc3MpCiB7CiAgICAg
dXNpbmcgQXJndW1lbnQgPSB4eXo6Om9wZW5ibWNfcHJvamVjdDo6Q29tbW9uOjpJbnZhbGlkQXJn
dW1lbnQ7CiAKKyAgICBmcHJpbnRmKHN0ZG91dCwgIlRGVFAgZG93bmxvYWQgc3RhcnQgXHJcbiIp
OworCiAgICAgLy8gU2FuaXRpemUgdGhlIGZpbGVOYW1lIHN0cmluZwogICAgIGlmICghZmlsZU5h
bWUuZW1wdHkoKSkKICAgICB7CkBAIC00Myw2ICs0NSw3IEBAIHZvaWQgRG93bmxvYWQ6OmRvd25s
b2FkVmlhVEZUUChzdGQ6OnN0cmluZyBmaWxlTmFtZSwgc3RkOjpzdHJpbmcgc2VydmVyQWRkcmVz
cykKICAgICAgICAgbG9nPGxldmVsOjpFUlI+KCJFcnJvciBGaWxlTmFtZSBpcyBlbXB0eSIpOwog
ICAgICAgICBlbG9nPEludmFsaWRBcmd1bWVudD4oQXJndW1lbnQ6OkFSR1VNRU5UX05BTUUoIkZp
bGVOYW1lIiksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBcmd1bWVudDo6QVJHVU1F
TlRfVkFMVUUoZmlsZU5hbWUuY19zdHIoKSkpOworICAgICAgICBmcHJpbnRmKHN0ZG91dCwgImZp
bGVOYW1lIGlzIGVtcHR5OiAlcyBcclxuIiwgZmlsZU5hbWUuY19zdHIoKSk7CiAgICAgICAgIHJl
dHVybjsKICAgICB9CiAKQEAgLTUxLDYgKzU0LDcgQEAgdm9pZCBEb3dubG9hZDo6ZG93bmxvYWRW
aWFURlRQKHN0ZDo6c3RyaW5nIGZpbGVOYW1lLCBzdGQ6OnN0cmluZyBzZXJ2ZXJBZGRyZXNzKQog
ICAgICAgICBsb2c8bGV2ZWw6OkVSUj4oIkVycm9yIFNlcnZlckFkZHJlc3MgaXMgZW1wdHkiKTsK
ICAgICAgICAgZWxvZzxJbnZhbGlkQXJndW1lbnQ+KEFyZ3VtZW50OjpBUkdVTUVOVF9OQU1FKCJT
ZXJ2ZXJBZGRyZXNzIiksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBcmd1bWVudDo6
QVJHVU1FTlRfVkFMVUUoc2VydmVyQWRkcmVzcy5jX3N0cigpKSk7CisgICAgICAgIGZwcmludGYo
c3Rkb3V0LCAic2VydmVyQWRkcmVzcyBpcyBlbXB0eTogJXMgXHJcbiIsIHNlcnZlckFkZHJlc3Mu
Y19zdHIoKSk7CiAgICAgICAgIHJldHVybjsKICAgICB9CiAKZGlmZiAtLWdpdCBhL2ltYWdlcy5o
cHAgYi9pbWFnZXMuaHBwCmluZGV4IDk3YjhmN2YuLmNlYWMzMzYgMTAwNjQ0Ci0tLSBhL2ltYWdl
cy5ocHAKKysrIGIvaW1hZ2VzLmhwcApAQCAtMTMsNiArMTMsOCBAQCBuYW1lc3BhY2UgaW1hZ2UK
IC8vIEJNQyBmbGFzaCBpbWFnZSBmaWxlIG5hbWUgbGlzdC4KIGNvbnN0IHN0ZDo6dmVjdG9yPHN0
ZDo6c3RyaW5nPiBibWNJbWFnZXMgPSB7ImltYWdlLWtlcm5lbCIsICJpbWFnZS1yb2ZzIiwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImltYWdlLXJ3ZnMiLCAi
aW1hZ2UtdS1ib290In07CisvLyBCTUMgZmxhc2ggaW1hZ2UgZmlsZSBuYW1lIGxpc3QgKGltYWdl
LWJtYykKK2NvbnN0IHN0ZDo6dmVjdG9yPHN0ZDo6c3RyaW5nPiBibWNGbGFzaEltYWdlcyA9IHsi
aW1hZ2UtYm1jIn07CiAKIH0gLy8gbmFtZXNwYWNlIGltYWdlCiB9IC8vIG5hbWVzcGFjZSBzb2Z0
d2FyZQpkaWZmIC0tZ2l0IGEvaXRlbV91cGRhdGVyLmNwcCBiL2l0ZW1fdXBkYXRlci5jcHAKaW5k
ZXggMjFmYjZlMC4uOTExZGRiMCAxMDA2NDQKLS0tIGEvaXRlbV91cGRhdGVyLmNwcAorKysgYi9p
dGVtX3VwZGF0ZXIuY3BwCkBAIC0zNTgsMTYgKzM1OCwyNSBAQCBJdGVtVXBkYXRlcjo6QWN0aXZh
dGlvblN0YXR1cwogewogICAgIGJvb2wgaW52YWxpZCA9IGZhbHNlOwogCi0gICAgZm9yIChhdXRv
JiBibWNJbWFnZSA6IGJtY0ltYWdlcykKKyAgICBmb3IgKGF1dG8mIGJtY0ZsYXNoSW1hZ2UgOiBi
bWNGbGFzaEltYWdlcykKICAgICB7CiAgICAgICAgIGZzOjpwYXRoIGZpbGUoZmlsZVBhdGgpOwot
ICAgICAgICBmaWxlIC89IGJtY0ltYWdlOworICAgICAgICBmaWxlIC89IGJtY0ZsYXNoSW1hZ2U7
CiAgICAgICAgIHN0ZDo6aWZzdHJlYW0gZWZpbGUoZmlsZS5jX3N0cigpKTsKICAgICAgICAgaWYg
KGVmaWxlLmdvb2QoKSAhPSAxKQogICAgICAgICB7Ci0gICAgICAgICAgICBsb2c8bGV2ZWw6OkVS
Uj4oIkZhaWxlZCB0byBmaW5kIHRoZSBCTUMgaW1hZ2UuIiwKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBlbnRyeSgiSU1BR0U9JXMiLCBibWNJbWFnZS5jX3N0cigpKSk7Ci0gICAgICAgICAg
ICBpbnZhbGlkID0gdHJ1ZTsKKyAgICAgICAgICAgIGZvciAoYXV0byYgYm1jSW1hZ2UgOiBibWNJ
bWFnZXMpCisgICAgICAgICAgICB7CisgICAgICAgICAgICAgICAgZnM6OnBhdGggZmlsZShmaWxl
UGF0aCk7CisgICAgICAgICAgICAgICAgZmlsZSAvPSBibWNJbWFnZTsKKyAgICAgICAgICAgICAg
ICBzdGQ6Omlmc3RyZWFtIGVmaWxlKGZpbGUuY19zdHIoKSk7CisgICAgICAgICAgICAgICAgaWYg
KGVmaWxlLmdvb2QoKSAhPSAxKQorICAgICAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICAg
ICAgbG9nPGxldmVsOjpFUlI+KCJGYWlsZWQgdG8gZmluZCB0aGUgQk1DIGltYWdlLiIsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnRyeSgiSU1BR0U9JXMiLCBibWNJbWFn
ZS5jX3N0cigpKSk7CisgICAgICAgICAgICAgICAgICAgIGludmFsaWQgPSB0cnVlOworICAgICAg
ICAgICAgICAgIH0KKyAgICAgICAgICAgIH0KICAgICAgICAgfQogICAgIH0KIApkaWZmIC0tZ2l0
IGEvc3RhdGljL2ZsYXNoLmNwcCBiL3N0YXRpYy9mbGFzaC5jcHAKaW5kZXggODJjMjM5My4uYjNm
ODY0MCAxMDA2NDQKLS0tIGEvc3RhdGljL2ZsYXNoLmNwcAorKysgYi9zdGF0aWMvZmxhc2guY3Bw
CkBAIC02LDYgKzYsNyBAQAogI2luY2x1ZGUgImltYWdlcy5ocHAiCiAKICNpbmNsdWRlIDxleHBl
cmltZW50YWwvZmlsZXN5c3RlbT4KKyNpbmNsdWRlIDxmc3RyZWFtPgogCiBuYW1lc3BhY2UKIHsK
QEAgLTI4LDEwICsyOSwyNSBAQCB2b2lkIEFjdGl2YXRpb246OmZsYXNoV3JpdGUoKQogICAgIC8v
IHRoZSBpbWFnZSB0byBmbGFzaCBkdXJpbmcgcmVib290LgogICAgIGZzOjpwYXRoIHVwbG9hZERp
cihJTUdfVVBMT0FEX0RJUik7CiAgICAgZnM6OnBhdGggdG9QYXRoKFBBVEhfSU5JVFJBTUZTKTsK
LSAgICBmb3IgKGF1dG8mIGJtY0ltYWdlIDogcGhvc3Bob3I6OnNvZnR3YXJlOjppbWFnZTo6Ym1j
SW1hZ2VzKQorICAgIGZvciAoYXV0byYgYm1jRmxhc2hJbWFnZSA6IHBob3NwaG9yOjpzb2Z0d2Fy
ZTo6aW1hZ2U6OmJtY0ZsYXNoSW1hZ2VzKQogICAgIHsKLSAgICAgICAgZnM6OmNvcHlfZmlsZSh1
cGxvYWREaXIgLyB2ZXJzaW9uSWQgLyBibWNJbWFnZSwgdG9QYXRoIC8gYm1jSW1hZ2UsCi0gICAg
ICAgICAgICAgICAgICAgICAgZnM6OmNvcHlfb3B0aW9uczo6b3ZlcndyaXRlX2V4aXN0aW5nKTsK
KyAgICAgICAgZnM6OnBhdGggZmlsZSh1cGxvYWREaXIuY19zdHIoKSk7CisgICAgICAgIGZpbGUg
Lz0gdmVyc2lvbklkOworICAgICAgICBmaWxlIC89IGJtY0ZsYXNoSW1hZ2U7CisgICAgICAgIHN0
ZDo6aWZzdHJlYW0gZWZpbGUoZmlsZS5jX3N0cigpKTsKKyAgICAgICAgaWYgKGVmaWxlLmdvb2Qo
KSAhPSAxKQorICAgICAgICB7CisgICAgICAgICAgICBmb3IgKGF1dG8mIGJtY0ltYWdlIDogcGhv
c3Bob3I6OnNvZnR3YXJlOjppbWFnZTo6Ym1jSW1hZ2VzKQorICAgICAgICAgICAgeworICAgICAg
ICAgICAgICAgIGZzOjpjb3B5X2ZpbGUodXBsb2FkRGlyIC8gdmVyc2lvbklkIC8gYm1jSW1hZ2Us
IHRvUGF0aCAvIGJtY0ltYWdlLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZnM6OmNv
cHlfb3B0aW9uczo6b3ZlcndyaXRlX2V4aXN0aW5nKTsKKyAgICAgICAgICAgIH0KKyAgICAgICAg
fQorICAgICAgICBlbHNlCisgICAgICAgIHsKKyAgICAgICAgICAgIGZzOjpjb3B5X2ZpbGUodXBs
b2FkRGlyIC8gdmVyc2lvbklkIC8gYm1jRmxhc2hJbWFnZSwgdG9QYXRoIC8gYm1jRmxhc2hJbWFn
ZSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgZnM6OmNvcHlfb3B0aW9uczo6b3ZlcndyaXRl
X2V4aXN0aW5nKTsKKyAgICAgICAgfQogICAgIH0KIH0KIAotLSAKMS45LjEKCg==

--_004_HK0PR02MB33487C8E6D56DD2143034D0C9F700HK0PR02MB3348apcp_--
