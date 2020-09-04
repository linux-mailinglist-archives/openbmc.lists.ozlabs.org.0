Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA02025D0DC
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 07:26:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjR3s0rhkzDr0m
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 15:26:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-hk2-obe.outbound.protection.outlook.com
 (client-ip=40.107.130.51; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=kfting@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=YvYvmKZb; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300051.outbound.protection.outlook.com [40.107.130.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjR325qzTzDqkd
 for <openbmc@lists.ozlabs.org>; Fri,  4 Sep 2020 15:25:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPf8v925fjUFNOKmGwIEmdUTzGFdJyYchZLHj25S9rI0uMIWC9QH87U+5QNMtnP7xvb312NqTjcJXurvDsS1Xjcz64qJbOj5mj8zw+hrcR/2X84lwBpAjuQp4GRhSxl2Ek6pKxLi0x18z9VdSYDQqiqO4AWXKYuZ9inmhA4tLsolyhiJMJYw1mBIDTiou0iq3jUTje5yXIQ+NrsQZuJspYuACyZSrwwRde9aT7W2+WOg1vrhITAQARz4sgwgPN4d2NQRi5cUDUC2z7g6+1i1KSQa37n/JdTMwxDrbCHYdMxwylExFv57C6KJ6ZavBNtHdIQfMlv/PsAmPlzyzJL25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UV2sQBGK0uKTb55uZDZ8ph9CJYkgLbmnNTZQYYoChLo=;
 b=jznq9sWXIoJPQC6nCMWhFgWsMJHeG3lHCVVZJuFHLDPW5FoofXPk8NK6l8TlRmHeFdsV/eU4e1cnjvN3uMQXbuvCi7NdBGARK9u6eVVAQc3s4Y+1RPpgvrq1vsEFRd+NUTP/kHoQheo61nqGEF2PLX6Tp7OKHRoNrLmpc37eP9UMi6J3GqxXLfTE9JnQWe/AClqjuhXqUWawjMxQSprh+ESbX5RMi9hMkp+RfsGZjnNpozX+2nPsqcqnuk5maGYshv3yFTDRGOF26T8Vs5TPNanKiwWZDKLDbinZlDpskrJhlL67hYKhWE9Yyk4bbF2hovIvFxovA1dD4X8Q6cn2bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UV2sQBGK0uKTb55uZDZ8ph9CJYkgLbmnNTZQYYoChLo=;
 b=YvYvmKZbIVzf8WjOfFujY1X6K6hUJVG22txadv9eFt0HpHh73wkbiq+Xf29XskoUV/2D59GdkNi24PQc4TBB9md5mn03DJAQ8s6Ry6YA7tVX6pbwr2PYS1r78wA8MI4m+RCBpc6y1CPn7CbX47xLEGrQzsBN9Rvttcgsd5QUk7c=
Received: from HK0PR03MB4897.apcprd03.prod.outlook.com (2603:1096:203:bb::22)
 by HK0PR03MB3892.apcprd03.prod.outlook.com (2603:1096:203:7c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.7; Fri, 4 Sep
 2020 05:25:12 +0000
Received: from HK0PR03MB4897.apcprd03.prod.outlook.com
 ([fe80::645a:4cdc:ebde:3c37]) by HK0PR03MB4897.apcprd03.prod.outlook.com
 ([fe80::645a:4cdc:ebde:3c37%2]) with mapi id 15.20.3348.013; Fri, 4 Sep 2020
 05:25:12 +0000
From: CS20 KFTing <KFTING@nuvoton.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
Subject: Nuvoton requests to create a repo in openbmc github
Thread-Topic: Nuvoton requests to create a repo in openbmc github
Thread-Index: AdaCcKwAFmOqXeaTTb6S2Qc5SWBdbAACod+Q
Date: Fri, 4 Sep 2020 05:25:12 +0000
Message-ID: <HK0PR03MB489753729249375AC99D79E7DB2D0@HK0PR03MB4897.apcprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=nuvoton.com;
x-originating-ip: [60.250.207.217]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49ace420-3bdb-483d-0f21-08d85092e61f
x-ms-traffictypediagnostic: HK0PR03MB3892:
x-microsoft-antispam-prvs: <HK0PR03MB389283E616A0030E4E897F58DB2D0@HK0PR03MB3892.apcprd03.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Onf+wZjDzpCqI9tOP6pew84fDQM/7oYQy4P6yofnJlqN36Ba2GAujCYFH1pWtXNLB3VyWS5ZM/A0+WK5tvVAMeOSrWKYp4rUTCmxQ8tt1w3CN7yfu8jUIK9JQHPleSNRUc8HoYkagnIL3ETRR3Olngr0mxUPeyrToXRTuF019OeifWowvv7RZvjRQZtb7KQkwcEgxz/EGAN5GVE0MP6OH59IYS1GimPm2vhoAGNUeDXGmRGnZjazDbxlpxbleI8K7lQSeRQdPU/4x/ezKFZR/MXT3HSbsXza5CGKSoK8Jwhgexc+l21x8AbeXD6cPJvhf3+8c9boaqVWl3Oo6c7LAQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB4897.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(39860400002)(396003)(136003)(376002)(71200400001)(55016002)(478600001)(33656002)(9686003)(8676002)(6506007)(5660300002)(86362001)(8936002)(7696005)(316002)(110136005)(52536014)(186003)(66946007)(76116006)(66446008)(66476007)(66556008)(64756008)(26005)(2906002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: pfP2QXWREkBAgjQmYfrefVGhpdnlooATGmitoSNqyU00fxJyicg+wr1RQ64tRBMFmfCqNeooGkco5gzZd+ZfCGkj+qBYhV32yxTklIVQl3zvLB/dBf70YDPUUQLhuuVNaIrBJcVWRTLGJPMXmSZIRZL3fEWITu4oQ9L8I0VVgEhNNB+0RGUPOTxjUCUkGADe6iHWXSmiv4DA8E+AFwJ1uFAeuyeY+xBxJr+weMS9oR2OBVVfD9xIoMH5+ejge9XGcoWFxjX1iPc5wSepsXz7OuUpMsMfFZGCvzEraOgu3b5XSOS2LCdCWWzXyowXPGqWQSvTK4ETizqrlRjb6mcsypMsMiSvkuJ4m03OiwrPBoMojPWr/RY6Vr1mij0+FQsciF57WYvVWOTVYcHCecxdo/LQekC0JGR/fg1EEjstSyDh3hf+3hEC0JbujsgSRf+c3v2NWG2BI8u5iOsx6RG+XU1UvVlJDM6ctKPnOfALJHsW+qaFQDf2UTcxXlsf8B/rJS07giCSk6PNy/b5ZunCpO7kqJ6g7ES/ZTwE2h4a6R+iuQ2N0gKJHVOlywdhFCByMRCzvh8hvr6Dbtc7CPpg1g73IHRfJj3Jm60Ju2O4OtyHQkWWtDNfBTUOyf0+IzX4bdS+uqGS66clh0/r/xC98A==
Content-Type: multipart/alternative;
 boundary="_000_HK0PR03MB489753729249375AC99D79E7DB2D0HK0PR03MB4897apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB4897.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ace420-3bdb-483d-0f21-08d85092e61f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2020 05:25:12.8538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m8TAZuUojniNFf/UqHhtTXU3+mfGVM5/GIF7aXu09mTaq5HwiLcf9QmC2cMOG0eDAAXeuurSfGA+vMItWBl7BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3892
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

--_000_HK0PR03MB489753729249375AC99D79E7DB2D0HK0PR03MB4897apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Brad:

This is Tyrone from Nuvoton.

Nuvoton creates an ipmitool library to provide Nuvoton-specific IPMI comman=
d handlers for Nuvoton-based platform running OpenBMC, just like intel-ipmi=
-oem.

Nuvoton would like to ask your help to create a repo named "nuvoton-ipmi-oe=
m" in openbmc github.

Joseph Liu <kwliu@nuvoton.com>  and warp5tw <kfting@nuvoton.com> will be th=
e administrators of this repo.

Thank you.

Regards,
Tyrone

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

--_000_HK0PR03MB489753729249375AC99D79E7DB2D0HK0PR03MB4897apcp_
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
span.EmailStyle20
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Hi Brad=
:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">This is=
 Tyrone from Nuvoton.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Nuvoton=
 creates an ipmitool library to provide Nuvoton-specific IPMI command handl=
ers for Nuvoton-based platform running OpenBMC, just like intel-ipmi-oem.<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Nuvoton=
 would like to ask your help to create a repo named &#8220;nuvoton-ipmi-oem=
&#8221; in openbmc github.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Joseph =
Liu &lt;kwliu@nuvoton.com&gt; &nbsp;and warp5tw &lt;kfting@nuvoton.com&gt; =
will be the administrators of this repo.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Thank y=
ou.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Regards=
,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">Tyrone<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p>&n=
bsp;</o:p></span></p>
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

--_000_HK0PR03MB489753729249375AC99D79E7DB2D0HK0PR03MB4897apcp_--
