Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDB0382309
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 05:22:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk4Dl38HLz306W
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 13:21:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=AKsbzBmv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-pu1-obe.outbound.protection.outlook.com
 (client-ip=40.107.132.70; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=ctcchien@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=AKsbzBmv; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320070.outbound.protection.outlook.com [40.107.132.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk4DP1qpXz2yYK
 for <openbmc@lists.ozlabs.org>; Mon, 17 May 2021 13:21:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZheS9GuC98Nj64ynqGpAphdkw5gmB07jgcYKuYDBG9crseIAK/apcOBEBX7ZelgTROgJtlYrgUf8DlIchScIwOSmUGqHdqtTd1iV2gKt8EdfCKGP2MAXgm6mxCuzIdJ4Vg7vDE8h+JjvSBGCbN93m2nSXRm/YC7CxHMHoRTDJIpLC8WVIOTCWu2ZCa59W3rttWZ/pR7YksPl7PYuTvCZZv23YJ238mrwf+kLQzM6lJRknZwzR2rXN+zXsXDZsmLLUUVllVul/OGycbDka4yfPmQt5Dd7WyhJIu5UmQFadSZaoi8qRBT1X82mSLQzJbL9Y0N9+Y6FmP+Eb2XOygciEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TZ6efTNrHzl7NLBCh6X4gtG2D/XfPlJ7oKko16zaOU=;
 b=LvF43lYeLMxi0g/IbKGZIUxKmvSgmdqBJvRAY+CLKEiEDde8gtQYSUpy2U6+hXHHJYei03uajUCP5rFInC0RNMk29sgdRsfQw+9vaisZ8WApfP2Jk6xSSWWMxu1MXWf8BOJ0MKwN5oX62r/dN8Zf1h6Wyugwn2DZvUopwXK0R7bqYJ3ZnHiZOeuLaI8grJvxz1mizrc571+c5+bQLChJjDK6OSbWDy0EQkrdjsnoB5/PwxkPPIyXEhdXKAJGDfK8e04FYiaJm/QGQ4v52Q6ZsDpltumYttFYa7vhg2OvJP1nWVwd/DHc9eWgZUsURsjoHsCbmSM1STklI39F9DTk3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TZ6efTNrHzl7NLBCh6X4gtG2D/XfPlJ7oKko16zaOU=;
 b=AKsbzBmv04+s0gq7R9+F5PXNs/0guuuIxBOOiL77b0mXZQk3rRNXgaKZmByZKa7tRR33P3QoEXjPelHcEmB7tT1W/A8WZPHuhterzohAcVRSR+xc95fqQ9pTD1qsjOC15OVjk/H5dSeCVcKk+FZEaGvGhNpNKSU3d1oozxAvUFo=
Received: from HK0PR03MB3954.apcprd03.prod.outlook.com (2603:1096:203:a1::10)
 by HK0PR03MB3521.apcprd03.prod.outlook.com (2603:1096:203:31::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.11; Mon, 17 May
 2021 03:21:15 +0000
Received: from HK0PR03MB3954.apcprd03.prod.outlook.com
 ([fe80::7048:5ba4:2664:f38f]) by HK0PR03MB3954.apcprd03.prod.outlook.com
 ([fe80::7048:5ba4:2664:f38f%6]) with mapi id 15.20.4150.017; Mon, 17 May 2021
 03:21:14 +0000
From: CS20 CTCchien <CTCCHIEN@nuvoton.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: phosphor-host-ipmid will crash on aarch64
Thread-Topic: phosphor-host-ipmid will crash on aarch64
Thread-Index: AddKx/eBndGv1OPoRqyPy1FOdlThfQ==
Date: Mon, 17 May 2021 03:21:14 +0000
Message-ID: <HK0PR03MB3954243C26C79A3E8586CFFCDF2D9@HK0PR03MB3954.apcprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=nuvoton.com;
x-originating-ip: [60.250.194.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b99b5cf-f79b-4840-00e1-08d918e2d40d
x-ms-traffictypediagnostic: HK0PR03MB3521:
x-microsoft-antispam-prvs: <HK0PR03MB35215288DEA7852026008962DF2D9@HK0PR03MB3521.apcprd03.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +0ugpPI1TNBD7I0zI1Vlv2EesS2RpewRJOHcSwfyrq9wUMq34rQFngbnxc9p/TUpAI1mr95y+LeMCm84eil0vCQk27u4tQDcYcSnTk4qp+JsejNG8Wp84J51El1dkXem4QgDzQVB8mHSbRv3aLbYiJZzOMURlB4bI8lXvUpQexBy/W7oXLtXIwsgaNyQ6uJc5CF8TVAZMvyP8bA9KAApfYa7CmZLbt2mxBsHMET55L4IzcGyovuzbQ3UbuFKljmg7KnpP5wOJDZww4C7Dz/J1kCLXH0lr7fb10uMqtuB3ZsSicOhfIiZKzgO1qVYzFvFQHcuTXbSfoyRmWAAB8Btbz5+eDb+Byj3Z2vDrh57PBb9tuli0zu9BD5YxmT98mNSL8GKR0UTaz7LtLFggwyro9G6EMHZtjKrr/ooBip83dDP41jEyzjGnF93EaAJP8igGwyXamU+LXCX5Zy0WtJqmv1MLJdbMIWpvQPP8SW+SbACRQU96srFWzfwi19aTWM6PDi+uH099xbZWUsyNz6I3BEhphAaRU1cj2YwUzp8+CBLVoX5t9gD70mcRSP2/dVJBWgz4yrXPknfOsoH4Hm6X9OX5gEX22ii8XrWSWphnLfPnClgH0togMZrTwOC71IIHJ5STlGs2aNVZc8EKF5nRnkL0/rtyEtT2k7pg5fnzKdpDhy+rU4XrNMKxo4wFlOr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB3954.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(8936002)(55016002)(86362001)(966005)(5660300002)(83380400001)(9686003)(316002)(2906002)(7696005)(166002)(66946007)(122000001)(76116006)(8676002)(6506007)(186003)(38100700002)(33656002)(71200400001)(6916009)(66556008)(478600001)(52536014)(66446008)(26005)(66476007)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?4wmRcV0xiLTNVgcZEK2hauw6tK48ZhPucTfiI2AlttdQZAx0TsthCyDfy43N?=
 =?us-ascii?Q?Ndly+5KDdDbpkhdXhYx6MUkHKspHfNaAnaYTiRDt09/cozlfJgv0ShHNNDP6?=
 =?us-ascii?Q?3csvne356hDFOfn0SrEnzce1cntslkGOWL0+ICBIevdCGQuoJoX1xp8XoPet?=
 =?us-ascii?Q?nOBEB/IDlkg/LemhR4AYMJRBE//aGwm4ONhSVWOaD41lM50vr+yF1XdOl2UY?=
 =?us-ascii?Q?yNflAaRFceRqKE8xwQuOm0xh87Hc9ZEYXPUe4iDF4dIDCk77ANmd7xKCNOJz?=
 =?us-ascii?Q?lW482+cgGhDTnOXlT2T5DranA3oYTysa+LMZAmxPiojH+JAdU2deu+Lx3ET8?=
 =?us-ascii?Q?IUifzSE2S35uNhKOj/4xw/j2GYHQGfzB3bGwMfXcQ9YMn2ML+T+SaBcQE/k6?=
 =?us-ascii?Q?qRhp1zZANrePQ1m+7V+BTJmfW9zxAP+p4MGG4trcy5zqM6ZlODi/tXzra8le?=
 =?us-ascii?Q?TzejoYVLGaDDwupePBpzinfRo4JWMTcSTqNUhWWn7t6CjW8vqnsKew/OTbNb?=
 =?us-ascii?Q?dUpTFxWIozgVSRinatq+7vUm96PZri/z/NNlDthA3/tF8EbDRZsDUhMSdr5o?=
 =?us-ascii?Q?WWBpaBuNtwZPpr6UH5s2IGXFkixAaETW5Pqs2Opm4u+wwXjkWAU1fhGGdY1k?=
 =?us-ascii?Q?Eu6Z0pYGzC0YH8Eg0b6eNbXFos20lTvkt5SldEYj1HQg+/vDzDxbXJuKMLZr?=
 =?us-ascii?Q?WCJxMJCTvL8PRjQ+b86EZpW2R903rdOhjtfLlS3Y/ZQFd3xSHDa7mxNahWCz?=
 =?us-ascii?Q?mX8h1k4i8zwv9SjZ+Ln/Ne1NpJPwXQMyNFt1MBtrXtWt2+jzwm2Cz0kxsKtD?=
 =?us-ascii?Q?LZrt9bkNOoR+AIUORooqrBiLd6wtbUhQ4fs9RPu1eBddzOKtf8I9jvH9WwaS?=
 =?us-ascii?Q?mQooHN8PrMkWoUiHEfX9Gfo5LKFoHRwn2YSsxvFZEOS0k4NSwlyg2Z9txV9g?=
 =?us-ascii?Q?RbB94PRfcOzgdgcqA1rQdb3hswg7TO5tAq2i0CyU7EFbqgydLn+UeWYgwaav?=
 =?us-ascii?Q?5K9IkIJWJ0D45f/K0n8MieWH1H+pt4aIfaOEa0lOroktoFu5Oy0whZchGSG1?=
 =?us-ascii?Q?i4YoHYIiRs8CRY6ww8VYpzIpgQV8LqulwalHCGw1eE8b4BoallErAsi1J8RB?=
 =?us-ascii?Q?g1KPBRdVZFEDuesPSsiDVjhd7v9/4b+w25sN/a4/DtZH0CNotzsoJ+gSi0Y+?=
 =?us-ascii?Q?D9cxiAShHpVxHT0NNH7MryD5Ipgjx5lnVR+gM6sCTpFZs8W0i4P7K1N4UWwQ?=
 =?us-ascii?Q?7PqQ26v8+7syUSJjglkAxWc4PgjZW1Q+K9+spuFIESttLY6VVGme7tVBgvLJ?=
 =?us-ascii?Q?Kjzig9cu1/k7Od1icVA+nF9e?=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR03MB3954243C26C79A3E8586CFFCDF2D9HK0PR03MB3954apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3954.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b99b5cf-f79b-4840-00e1-08d918e2d40d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2021 03:21:14.7144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nFVR24/GgLgLPGHDdTRqjIzBm4KZVGr7/2lykkn8gJCx8+8HCVMf+qNp/ZkFzNV9Cgra137+tTwJsbq8nzfqcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3521
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

--_000_HK0PR03MB3954243C26C79A3E8586CFFCDF2D9HK0PR03MB3954apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Rthomaiy,  Vmauery,  Pstrinkle, Jayaprakashmutyala,

When I build phosphor-host-ipmid for aarch64 platform, size_t will be 8 byt=
es, but in aarch32 sizte_t will be 4 bytes, so ipmid will crash at https://=
github.com/openbmc/phosphor-host-ipmid/blob/master/user_channel/passwd_mgr.=
cpp#L323, due to the data size of hashsize and ivsize and padsize and macsi=
ze is 4 bytes in /etc/ipmi_pass, but ipmid will read those data as 8 bytes.
/*
* Meta data struct for encrypted password file
*/
struct MetaPassStruct
{
    char signature[10];
    unsigned char reseved[2];
    size_t hashSize;
    size_t ivSize;
    size_t dataSize;
    size_t padSize;
    size_t macSize;
};

If I replace size_t in this structure with unsigned int, then ipmid will no=
t crash at this point.
But those fields in this structure are also used to store the return value =
from other functions, like EVP_MD_block_size(),
And the return type is also size_t.

Do you have any idea about this issue?
Maybe we could just discard the Most Significant 4 Bytes? (I guess these 4 =
bytes are not used)

Thanks

B.R.
Medad

________________________________
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.

--_000_HK0PR03MB3954243C26C79A3E8586CFFCDF2D9HK0PR03MB3954apcp_
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
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
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
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.pl-c
	{mso-style-name:pl-c;}
span.pl-k
	{mso-style-name:pl-k;}
span.pl-en
	{mso-style-name:pl-en;}
span.pl-c1
	{mso-style-name:pl-c1;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi </span><span lang=3D"EN-US" =
style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;backg=
round:white">Rthomaiy</span><span lang=3D"EN-US">,
</span><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Seg=
oe UI&quot;,sans-serif;background:white">&nbsp;Vmauery</span><span lang=3D"=
EN-US">,
</span><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Seg=
oe UI&quot;,sans-serif;background:white">&nbsp;Pstrinkle</span><span lang=
=3D"EN-US">,
</span><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Seg=
oe UI&quot;,sans-serif;background:white">Jayaprakashmutyala</span><span lan=
g=3D"EN-US">,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">When I build phosphor-host-ipmi=
d for aarch64 platform, size_t will be 8 bytes, but in aarch32 sizte_t will=
 be 4 bytes, so ipmid will crash at
<a href=3D"https://github.com/openbmc/phosphor-host-ipmid/blob/master/user_=
channel/passwd_mgr.cpp#L323">
https://github.com/openbmc/phosphor-host-ipmid/blob/master/user_channel/pas=
swd_mgr.cpp#L323</a>, due to the data size of hashsize and ivsize and padsi=
ze and macsize is 4 bytes in
</span><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-family:Consolas;c=
olor:#032F62;background:white">/etc/ipmi_pass</span><span lang=3D"EN-US">, =
but ipmid will read those data as 8 bytes.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p></o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D"background:white;border-collapse:collapse">
<tbody>
<tr>
<td valign=3D"top" style=3D"padding:0cm 7.5pt 0cm 7.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:9.0pt;font-family:Consolas;color:#24292E">/*<o:p></o:p></s=
pan></p>
</td>
</tr>
<tr>
<td width=3D"50" nowrap=3D"" valign=3D"top" style=3D"width:37.5pt;padding:0=
cm 7.5pt 0cm 7.5pt">
</td>
<td valign=3D"top" style=3D"padding:0cm 7.5pt 0cm 7.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:9.0pt;font-family:Consolas;color:#24292E">* Meta data stru=
ct for encrypted password file<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"50" nowrap=3D"" valign=3D"top" style=3D"width:37.5pt;padding:0=
cm 7.5pt 0cm 7.5pt">
</td>
<td valign=3D"top" style=3D"padding:0cm 7.5pt 0cm 7.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:9.0pt;font-family:Consolas;color:#24292E">*/<o:p></o:p></s=
pan></p>
</td>
</tr>
<tr>
<td width=3D"50" nowrap=3D"" valign=3D"top" style=3D"width:37.5pt;padding:0=
cm 7.5pt 0cm 7.5pt">
</td>
<td valign=3D"top" style=3D"padding:0cm 7.5pt 0cm 7.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:9.0pt;font-family:Consolas;color:#24292E">struct MetaPassS=
truct<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"50" nowrap=3D"" valign=3D"top" style=3D"width:37.5pt;padding:0=
cm 7.5pt 0cm 7.5pt">
</td>
<td valign=3D"top" style=3D"padding:0cm 7.5pt 0cm 7.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:9.0pt;font-family:Consolas;color:#24292E">{<o:p></o:p></sp=
an></p>
</td>
</tr>
<tr>
<td width=3D"50" nowrap=3D"" valign=3D"top" style=3D"width:37.5pt;padding:0=
cm 7.5pt 0cm 7.5pt">
</td>
<td valign=3D"top" style=3D"padding:0cm 7.5pt 0cm 7.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:9.0pt;font-family:Consolas;color:#24292E">&nbsp;&nbsp;&nbs=
p; char signature[10];<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"50" nowrap=3D"" valign=3D"top" style=3D"width:37.5pt;padding:0=
cm 7.5pt 0cm 7.5pt">
</td>
<td valign=3D"top" style=3D"padding:0cm 7.5pt 0cm 7.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:9.0pt;font-family:Consolas;color:#24292E">&nbsp;&nbsp;&nbs=
p; unsigned char reseved[2];<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"50" nowrap=3D"" valign=3D"top" style=3D"width:37.5pt;padding:0=
cm 7.5pt 0cm 7.5pt">
</td>
<td valign=3D"top" style=3D"padding:0cm 7.5pt 0cm 7.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:9.0pt;font-family:Consolas;color:#24292E">&nbsp;&nbsp;&nbs=
p; size_t hashSize;<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"50" nowrap=3D"" valign=3D"top" style=3D"width:37.5pt;padding:0=
cm 7.5pt 0cm 7.5pt">
</td>
<td valign=3D"top" style=3D"padding:0cm 7.5pt 0cm 7.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:9.0pt;font-family:Consolas;color:#24292E">&nbsp;&nbsp;&nbs=
p; size_t ivSize;<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"50" nowrap=3D"" valign=3D"top" style=3D"width:37.5pt;padding:0=
cm 7.5pt 0cm 7.5pt">
</td>
<td valign=3D"top" style=3D"padding:0cm 7.5pt 0cm 7.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:9.0pt;font-family:Consolas;color:#24292E">&nbsp;&nbsp;&nbs=
p; size_t dataSize;<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"50" nowrap=3D"" valign=3D"top" style=3D"width:37.5pt;padding:0=
cm 7.5pt 0cm 7.5pt">
</td>
<td valign=3D"top" style=3D"padding:0cm 7.5pt 0cm 7.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:9.0pt;font-family:Consolas;color:#24292E">&nbsp;&nbsp;&nbs=
p; size_t padSize;<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"50" nowrap=3D"" valign=3D"top" style=3D"width:37.5pt;padding:0=
cm 7.5pt 0cm 7.5pt">
</td>
<td valign=3D"top" style=3D"padding:0cm 7.5pt 0cm 7.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:9.0pt;font-family:Consolas;color:#24292E">&nbsp;&nbsp;&nbs=
p; size_t macSize;<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"50" nowrap=3D"" valign=3D"top" style=3D"width:37.5pt;padding:0=
cm 7.5pt 0cm 7.5pt">
</td>
<td valign=3D"top" style=3D"padding:0cm 7.5pt 0cm 7.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:9.0pt;font-family:Consolas;color:#24292E">};<o:p></o:p></s=
pan></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">If I replace size_t in this str=
ucture with unsigned int, then ipmid will not crash at this point.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">But those fields in this struct=
ure are also used to store the return value from other functions, like EVP_=
MD_block_size(),<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">And the return type is also siz=
e_t.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Do you have any idea about this=
 issue?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Maybe we could just discard the=
 Most Significant 4 Bytes? (I guess these 4 bytes are not used)<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">B.R.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Medad<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<hr align=3D"center" width=3D"100%">
<span style=3D"font-size:12pt;line-height:0.7;font-family: 'Arial'; color:#=
808080">The privileged confidential information contained in this email is =
intended for use only by the addressees as indicated by the original sender=
 of this email. If you are not the
 addressee indicated in this email or are not responsible for delivery of t=
he email to such a person, please kindly reply to the sender indicating thi=
s fact and delete all copies of it from your computer and network server im=
mediately. Your cooperation is highly
 appreciated. It is advised that any unauthorized use of confidential infor=
mation of Nuvoton is strictly prohibited; and any information in this email=
 irrelevant to the official business of Nuvoton shall be deemed as neither =
given nor endorsed by Nuvoton.
</span>
</body>
</html>

--_000_HK0PR03MB3954243C26C79A3E8586CFFCDF2D9HK0PR03MB3954apcp_--
