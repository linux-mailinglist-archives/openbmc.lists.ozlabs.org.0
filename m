Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D94E6F1D
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 10:33:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471qJf3WTBzDqx5
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 20:33:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wiwynn.com (client-ip=103.200.3.19; helo=segapp03.wistron.com;
 envelope-from=bright_cheng@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=Wistron.onmicrosoft.com
 header.i=@Wistron.onmicrosoft.com header.b="P8NwPjHD"; 
 dkim-atps=neutral
Received: from segapp03.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 471qJ22fWTzDqx5
 for <openbmc@lists.ozlabs.org>; Mon, 28 Oct 2019 20:32:31 +1100 (AEDT)
Received: from EXCHAPP02.whq.wistron (unverified [10.37.38.25]) by 
 TWNHUMSW4.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id 
 <Tdb1fd5da4cc0a81672e94@TWNHUMSW4.wistron.com> for 
 <openbmc@lists.ozlabs.org>; Mon, 28 Oct 2019 17:32:26 +0800
Received: from EXCHAPP01.whq.wistron (10.37.38.24) by EXCHAPP02.whq.wistron 
 (10.37.38.25) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1713.5; Mon, 28 Oct 2019 17:32:25 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (10.37.38.70) by 
 mail.wistron.com (10.37.38.24) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 
 15.1.1713.5 via Frontend Transport; Mon, 28 Oct 2019 17:32:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none; 
 b=hO3xhPNpgn0nUvPQDkUAw/kdTyH9d7R7xKaGJFJCV5WZ4aFrAQs9bTlF+WlHNSywm/oBk/+lnLr+2qbMjyu6r2/eLkyvkwL06ZpyqcRLk23Th3lIHcN9CNKogMFB1miNsyRfzN69cxb+YwticrELfRmVPQFYji8HBl4m8pUTJnuB4i6yJvt3ePE2l0/36+kJ65L2VMwK1S9Nv+/mBR7JrVuvtaVWbDicaYyjLH1JpImQUhdps2EVhsCBqghz4koOHbwJxJqbb6AAZLhMc4y9APOlr9m+zP/HFdy5FvKLnkusCuTiiJbnvlGUgufZ08evEhKpXHtHJML5jkHCzWNP3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MSMSwPG8YDd+jrdvJrWLaW5ZUDduKAsd3BJRHKnLkE=; 
 b=ndtvO5FIaJ7IGGNMuRADjMM5nOXG5Oilxm+6TpCtZi07DF5X4/vYjtVYaa8ZAhf6S/L8QbsBDIixXJLAV6PVYBDqfRTf7EzUFEy6IYmiXB9MTOEjY+LLJft1aUqJlt5mh47TzbGni/hamAbk8SE7CLxIKCmKtWu+fK2UymVteiIBQc5vjTU6vN6fnto2cy0kr3eMRJXU2x3VGsh7wnPre0fRdAREQBEB32Pc5ADtl05RRfzyAhzHOCStF/Mpz0dFrPkVF8sNHXHET7qpRfBt/sXEuN347KgMmVHJh9s8BHNPmwqBsI97f+OXBKwB+qFKNLlkzNFbNvPVNE06AZiRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass 
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none 
 header.from=wiwynn.com; dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; 
 d=Wistron.onmicrosoft.com; s=selector2-Wistron-onmicrosoft-com; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MSMSwPG8YDd+jrdvJrWLaW5ZUDduKAsd3BJRHKnLkE=; 
 b=P8NwPjHDfaTbeynguHuuLkSFo7b+j0BYxbAtsfjq/dgZR6S7YB2S4Pxn6i1XwAgdQhzLgJtJAGbCmTPLyUvDFrT5a8YV1u/DR1yOupEa+MD9Bi8sLHFgiAxZ8yo6mpS2Ipv4R1rHCqme6VPG/E05miKK8QJLSBuRALXn5OmhcCw=
Received: from HK0PR02MB3348.apcprd02.prod.outlook.com (20.177.68.82) by 
 HK0PR02MB3187.apcprd02.prod.outlook.com (20.177.29.74) with Microsoft 
 SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 
 15.20.2387.24; Mon, 28 Oct 2019 09:32:23 +0000
Received: from HK0PR02MB3348.apcprd02.prod.outlook.com 
 ([fe80::c0bf:21c2:bd83:4133]) by 
 HK0PR02MB3348.apcprd02.prod.outlook.com 
 ([fe80::c0bf:21c2:bd83:4133%4]) with mapi id 15.20.2387.025; Mon, 28 
 Oct 2019 09:32:23 +0000
From: Bright Cheng/WYHQ/Wiwynn <Bright_Cheng@wiwynn.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: How to use phosphor-ipmi-flash
Thread-Topic: How to use phosphor-ipmi-flash
Thread-Index: AdWNbjSbWMj/xlM+R2ugYYuU5vZkaw==
Date: Mon, 28 Oct 2019 09:32:23 +0000
Message-ID: <HK0PR02MB3348A12C43559ED44AA67D149F660@HK0PR02MB3348.apcprd02.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) 
 smtp.mailfrom=Bright_Cheng@wiwynn.com; 
x-originating-ip: [125.227.140.245]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eea6689c-9898-4236-e6df-08d75b89bcea
x-ms-traffictypediagnostic: HK0PR02MB3187:
x-microsoft-antispam-prvs: <HK0PR02MB31876CF07537263031A1128B9F660@HK0PR02MB3187.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0204F0BDE2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(53754006)(51874003)(199004)(189003)(6436002)(66446008)(66556008)(64756008)(8676002)(66476007)(52536014)(7696005)(476003)(486006)(25786009)(33656002)(86362001)(2351001)(55016002)(26005)(2501003)(5640700003)(81166006)(14454004)(1730700003)(81156014)(5660300002)(7736002)(66946007)(76116006)(6306002)(54896002)(9686003)(8936002)(99286004)(74316002)(186003)(4744005)(71190400001)(102836004)(66066001)(71200400001)(256004)(14444005)(80792005)(3846002)(478600001)(316002)(6116002)(790700001)(2906002)(6506007)(6916009);
 DIR:OUT;SFP:1102;SCL:1;SRVR:HK0PR02MB3187;
 H:HK0PR02MB3348.apcprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;
 PTR:InfoNoRecords;A:1;MX:1;
received-spf: None 
 (protection.outlook.com: wiwynn.com does not designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oqkHIg3cDqCytz9QHrqxvoGz7Hv+WQsjLuiQTp7oJchv593+dm+TaBMyZvn1+ZA3HuTViZ9mxqUCOKCJZXTs7de65JZZHKTKCP2L9PxTsly3iqylYBxdr1OGUKM/UHPYrrMp3RZ7+euTjaU2mkMPlhuhnM1ozGHnoCyVVcAbTd/jegeL2oSAG3oDSHSB5mOPn2C0tjqrFYqDaw/cs6AmKS4+oAT4rKdKLNh0EOybyImb6HcVl28CLP2270ngUvCFFNKRU4F0JxKU51J9pDiZSW7HQQ/9zeoi9KAcvpRE25wDUbEeionQlrfUW9Mtyxb2EeqwvZmJR/duU40MjiThNkv31XHb3L2Rg6iKw/90ID3De9JgECO0kZpKsuE5Xk4pxtfUbgl9OEtK/Xw5BSJ8LqwvtlLNuvHaPMWoHOJ/WDoDxvnOo3NzZ4BBLXGlaxJ9
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative; 
 boundary="_000_HK0PR02MB3348A12C43559ED44AA67D149F660HK0PR02MB3348apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: eea6689c-9898-4236-e6df-08d75b89bcea
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2019 09:32:23.2763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de0795e0-d7c0-4eeb-b9bb-bc94d8980d3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jHwIGVvrgO2K5/aWCOIQgqtffd7ZapIjVQ53vrMTsO3ji0eVs1U+z0vb12guB/T8LQfvfr3IG8JFyn2aFwa8ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR02MB3187
X-OriginatorOrg: wiwynn.com
X-TM-SNTS-SMTP: 307591EC38CE16D949F2E15E3A46F71E374FF2638BDFFFF178C395CD4D6A34332000:8
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

--_000_HK0PR02MB3348A12C43559ED44AA67D149F660HK0PR02MB3348apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I installed phosphor-ipmi-flash, phosphor-ipmi-blob and ipmi-blob-tool in B=
MC and tried host-tool in Linux to update via ipmilpc.

Following are command and its response:
# ./burn_my_bmc --command update --interface ipmilpc --image /root/obmc-ima=
ge/image-bmc --sig /root/obmc-image/image-bmc.sig --type static --ignore-up=
date --address 0x1 --length 1024
/flash/static not found

Should I add "/flash/static" to <<config-static-bmc.json.in>> for getting t=
his "/flash/static" blob?
If yes, how to set <<config-static-bmc.json.in>> if I want to update BMC vi=
a ipmilpc?

One more question, how to decide address and length for lpc?

Thanks in advanced for any insight!

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

--_000_HK0PR02MB3348A12C43559ED44AA67D149F660HK0PR02MB3348apcp_
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
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Microsoft JhengHei";
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
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
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
family:&quot;Times New Roman&quot;,serif">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">I installed phosphor-ipmi-flash, =
phosphor-ipmi-blob and ipmi-blob-tool in BMC and tried host-tool in Linux t=
o update via ipmilpc.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">Following are command and its res=
ponse:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif"># ./burn_my_bmc --command update =
--interface ipmilpc --image /root/obmc-image/image-bmc --sig /root/obmc-ima=
ge/image-bmc.sig --type static --ignore-update --address
 0x1 --length 1024<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">/flash/static not found<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">Should I add &#8220;/flash/static=
&#8221; to &lt;&lt;config-static-bmc.json.in&gt;&gt; for getting this &#822=
0;/flash/static&#8221; blob?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">If yes, how to set &lt;&lt;config=
-static-bmc.json.in&gt;&gt; if I want to update BMC via ipmilpc?<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">One more question, how to decide =
address and length for lpc?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Times New Roman&quot;,serif">Thanks in advanced for any insigh=
t!</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;T=
imes New Roman&quot;,serif"><o:p></o:p></span></p>
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

--_000_HK0PR02MB3348A12C43559ED44AA67D149F660HK0PR02MB3348apcp_--
