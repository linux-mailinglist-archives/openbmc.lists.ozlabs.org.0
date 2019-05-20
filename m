Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 677D124216
	for <lists+openbmc@lfdr.de>; Mon, 20 May 2019 22:25:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4579Pf5XTLzDqLc
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2019 06:25:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.73.129; helo=nam05-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="VP2x5eAQ"; dkim-atps=neutral
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730129.outbound.protection.outlook.com [40.107.73.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4579P86JJxzDqJX
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 06:24:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=J0EkuFqF9mCOoFU7GAHq4b8zEiP2yVtHrELUHTEKRXrlQjGGlj/wr7yj4AjfRipd0RNeKfhy7LP0bnDAmbOIMLXhiW7Qegug8XLb1X5tt2qxTdgoPfxSHzVYqAHr/nLgein2SCQhT59b6ojZDUyPaZjK1BWuXkbiIXHAF8HpQ9o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugbxI+EFiGoogIGr51itebF7QX5WXwPCD5AtGrFFCdU=;
 b=UqgXJMaNbzv4Ly8jOO7KldvT2S8mVFsZ+gXyAEiyH7gg5i1RG50WXo8TudMV5QqU7f1nxHsxO3T0okHKx902RGXSe7NVhlKvTrejWI1Jlq2zodEvkJg++Vjc9XgDnZ+mXAFdXxTZi+4qLGI/flSS+F6zoCVtQslyc/X0rAWW/X4=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugbxI+EFiGoogIGr51itebF7QX5WXwPCD5AtGrFFCdU=;
 b=VP2x5eAQiUUJSPkBegW5pylweuxV+PLqQ/jiIkud+J8g91f4It8XXL7f5szfBsBFXxb+pCwGbGPiOlPbiGpzotOeETT8Rmt0YoYzzz/hxV2CBwPPIfnYnUwg22fJYyGe45+8GStI03I/B6nOw7O8hR3UBo3CHAwH2NHCnVo6uhM=
Received: from BL0PR2101MB0932.namprd21.prod.outlook.com
 (2603:10b6:207:30::20) by BL0PR2101MB1091.namprd21.prod.outlook.com
 (2603:10b6:207:37::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.3; Mon, 20 May
 2019 20:24:53 +0000
Received: from BL0PR2101MB0932.namprd21.prod.outlook.com
 ([fe80::1072:430b:60ef:aaae]) by BL0PR2101MB0932.namprd21.prod.outlook.com
 ([fe80::1072:430b:60ef:aaae%3]) with mapi id 15.20.1943.003; Mon, 20 May 2019
 20:24:53 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Platform telemetry and health monitoring 
Thread-Topic: Platform telemetry and health monitoring 
Thread-Index: AdUPSgV2V2O36/zKToW4XlARusyEFA==
Date: Mon, 20 May 2019 20:24:53 +0000
Message-ID: <BL0PR2101MB0932AE0C63ADC3CBDAE0CF16C8060@BL0PR2101MB0932.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-05-20T20:24:51.7634725Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=7ad7e3a0-0fda-4efe-b5af-bd9df99a438a;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [2001:4898:80e8:7:7135:bdfc:260f:33b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48a79882-f4da-4c14-4dd1-08d6dd6137d7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR2101MB1091; 
x-ms-traffictypediagnostic: BL0PR2101MB1091:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BL0PR2101MB1091205D9E7AEB4FF0C8BC86C8060@BL0PR2101MB1091.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(366004)(346002)(376002)(136003)(53754006)(189003)(199004)(5660300002)(86362001)(102836004)(7696005)(10090500001)(6506007)(86612001)(8990500004)(4744005)(99286004)(10290500003)(476003)(2906002)(478600001)(6916009)(52396003)(52536014)(486006)(46003)(74316002)(6436002)(7736002)(14454004)(256004)(186003)(9326002)(68736007)(33656002)(4743002)(8676002)(8936002)(81156014)(81166006)(66946007)(76116006)(73956011)(66476007)(316002)(790700001)(6116002)(53936002)(22452003)(66446008)(64756008)(9686003)(6306002)(54896002)(55016002)(71200400001)(71190400001)(66556008)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR2101MB1091;
 H:BL0PR2101MB0932.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: s1gWsQfz64fL3RtYBnAZsyhoWMWqWP4Xw41ZUeHq6S0i6UJK3zFe1+k6HuoavO1fE+ELT1U0pRIEJZaoIG6INoHCmvEQsNRM2q8pGXSQqqolUlA0RBd9qpPL69NMHoPiA40EH/ai6mWOXLr5stHOtY2c0Onj/Y5mhLN9xGzZf7nlM8bb5vDZsWzvR+OjAf33cVLSVOrajlHtxbzWP4kzoEr24pisRd77sUC+CjI9v8vLsGtRQeekVrjYW6hfazoMl/ELRxksHILrx49zsJDlQ54p454RGo6DCJPTGp7/SMOCOA/xV2Hczw/l/hHRg6b6Wx0zEPru0xnbhjWxJfemUDz7DICHbUm/UnZOxdG0Ff1ECz3f8xsTjEYSCauPpJAXQltnPBTwVyOGVfcdiFf48EbWRqvSqFo9QQgltYejYFQ=
Content-Type: multipart/alternative;
 boundary="_000_BL0PR2101MB0932AE0C63ADC3CBDAE0CF16C8060BL0PR2101MB0932_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a79882-f4da-4c14-4dd1-08d6dd6137d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 20:24:53.5618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: neladk@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR2101MB1091
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

--_000_BL0PR2101MB0932AE0C63ADC3CBDAE0CF16C8060BL0PR2101MB0932_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

As we discussed having a focused workstream for "Platform telemetry and hea=
lth monitoring" in one of email thread, Please let me know if you would lik=
e to join this work stream. It would be great to have participation from Si=
licon partners/ mainboard design and mfg partners/ Memory/ NICs/ Firmware a=
nd other components.

Name
Preferred Timings
Agenda / Contribution Areas










Once we have enough quorum, we will put together bi-weekly call to brainsto=
rm various ideas and proposals.

Thanks
Neeraj


--_000_BL0PR2101MB0932AE0C63ADC3CBDAE0CF16C8060BL0PR2101MB0932_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
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
	color:#2F5496;
	font-weight:normal;
	font-style:normal;}
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
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Hi All, <o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">As we discussed having=
 a focused workstream for &#8220;<i>Platform telemetry and health monitorin=
g</i>&#8221; in one of email thread, Please let me know if you would like t=
o join this work stream. It would be great to have
 participation from Silicon partners/ mainboard design and mfg partners/ Me=
mory/ NICs/ Firmware and other components.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
<table class=3D"MsoTableGrid" border=3D"1" cellspacing=3D"0" cellpadding=3D=
"0" style=3D"border-collapse:collapse;border:none">
<tbody>
<tr>
<td width=3D"208" valign=3D"top" style=3D"width:155.8pt;border:solid window=
text 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Name<o:p></o:p></span>=
</p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border:solid windo=
wtext 1.0pt;border-left:none;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Preferred Timings<o:p>=
</o:p></span></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border:solid windo=
wtext 1.0pt;border-left:none;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Agenda / Contribution =
Areas<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"208" valign=3D"top" style=3D"width:155.8pt;border:solid window=
text 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
</tr>
<tr>
<td width=3D"208" valign=3D"top" style=3D"width:155.8pt;border:solid window=
text 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
</tr>
<tr>
<td width=3D"208" valign=3D"top" style=3D"width:155.8pt;border:solid window=
text 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Once we have enough qu=
orum, we will put together bi-weekly call to brainstorm various ideas and p=
roposals.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Thanks <o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Neeraj<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BL0PR2101MB0932AE0C63ADC3CBDAE0CF16C8060BL0PR2101MB0932_--
