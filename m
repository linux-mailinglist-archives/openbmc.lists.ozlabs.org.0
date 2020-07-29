Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8BB231AE4
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 10:11:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGmTp01JbzDqww
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 18:11:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wiwynn.com (client-ip=40.107.132.89;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=wayne_tung@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cloudadmwiwynn.onmicrosoft.com
 header.i=@cloudadmwiwynn.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-cloudadmwiwynn-onmicrosoft-com header.b=M5ch8sTy; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320089.outbound.protection.outlook.com [40.107.132.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGmSn0BWjzDqgV
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 18:10:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Faj9Sc8DEPwxr2BvfF0mUXT/c/p5R8macpdItMTqW+ljCF7fEjqMSyjS83qBHWLnVGg+tTzw09nxVoWZjnGGnNxQgk/NhNcKJald79rU5Mh6GKVEZoT578rlduB/cGxZQMOnDUPz2O6vzP0lgyve81S8xwes1igZmCEtAWNr+KrjOjVgQVHjQxHU5sw1SmMHQfFmvqSEKS5i8K697GywgfnKrDa1Y8jasyREm4Rq4/BQ57DLP3j49YpFIVKnctaj20ovq/y3mH9OuoFqUuZWtBypL32mZh25EY/417xYWpO5Y+Hifbaov0cnl9ZKtJlZ1qEU+DvL1189rsubdDPmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvBKAdw25CN1NL2l6GTvsaTIoLTnpRGh6qrzt4yP5GQ=;
 b=KvGIbX20Vsdv4rGTm/gQBdtEDdu4jtgHksGArEfR4iF88lUAXkihVG9zScfekFGwYdLFq11++OZsM0qrLkwwInTLCmXlXJNdqJtL3S3ugGMSd9uD8sga5OaOxM9MSSs2cvnAQ98RQeVzIN/szCUEOkrn0qDnXSi1FEta3TWmrY/5/qvzHxsbDIeP6tiQQuN9cAtPopZ06W3kOoo/jC/3sYAL3dsW9LxYKwC0YyQx/V+OKZSf+9UhbYPp9sFvpzSHxiwqhbA89E55yesINkSK27SaNaucWnGxK9yHcFcqWpKkQdsgdzsios3MudkFz0JJVsd4q55t9pppTQofRVvSjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudadmwiwynn.onmicrosoft.com; s=selector1-cloudadmwiwynn-onmicrosoft-com; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvBKAdw25CN1NL2l6GTvsaTIoLTnpRGh6qrzt4yP5GQ=;
 b=M5ch8sTypJ8YnOUABVw7Q+obL1ktdAuCYRC4qY3AtH2R2sbw3/kkH95FRI7xQzkeoRyjleWW/TR17tjEqomWGSWbuTaJtdwvV/sxArURgWwHiDj1dHmhEieSnztUdYtDbFKmtsKMOOYf/8JIJLn2CZnhU2X8n73RJp/J6clAcF4=
Received: from PS1PR04MB2757.apcprd04.prod.outlook.com (2603:1096:803:48::21)
 by PS1PR0401MB2171.apcprd04.prod.outlook.com (2603:1096:803:6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Wed, 29 Jul
 2020 08:10:33 +0000
Received: from PS1PR04MB2757.apcprd04.prod.outlook.com
 ([fe80::51b5:abe4:9225:a218]) by PS1PR04MB2757.apcprd04.prod.outlook.com
 ([fe80::51b5:abe4:9225:a218%2]) with mapi id 15.20.3239.016; Wed, 29 Jul 2020
 08:10:32 +0000
From: Wayne Tung/WYHQ/Wiwynn <Wayne_Tung@wiwynn.com>
To: "'openbmc@lists.ozlabs.org'" <openbmc@lists.ozlabs.org>
Subject: Virtual Media Failed
Thread-Topic: Virtual Media Failed
Thread-Index: AdZlf2JgsjTNRp10T56CPl+D41iO5Q==
Date: Wed, 29 Jul 2020 08:10:32 +0000
Message-ID: <PS1PR04MB2757ADA2E9B430BD2684826B96700@PS1PR04MB2757.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=wiwynn.com;
x-originating-ip: [125.227.140.245]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a97a352d-d172-430a-2dd8-08d83396dd98
x-ms-traffictypediagnostic: PS1PR0401MB2171:
x-microsoft-antispam-prvs: <PS1PR0401MB2171C8EA40768D471012212196700@PS1PR0401MB2171.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y6eOPFH+GyLIqu36t/uETVGrJbe5g+mPo2AgbemsSHjOhV5Cz13tvW26Wu0TAhFo4be6QD5FwKwcpxRhdnMBx7mcj8bAL2j6GRrDfMfsXtmgBhgiv8qMCJLInyV9qPhrNHm8u9jTKRlzDrUBzqejSwc9tks3DeIMoTIbRSwjwwymvUPBw46XKVepvYyGk3gEvGNuEZVqCgLbiikwDEyezU93w7ULcsmgnwYG7lPOeDkt0aEAeKVO0Sn6BN+MOXmIA9JjR5vCVvdQapANKWgFenO9rdcHcjKPDY8LgfF5QLDtJouAmiDhjNz7wrWVLN9T0GDLJnZ+TCfiwUpaIePHlY/NayO9xWVz+jineSSJMgWXNQ3rCupIcTRvdkAH6jii
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS1PR04MB2757.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(86362001)(99936003)(83380400001)(52536014)(5660300002)(8676002)(3480700007)(33656002)(9686003)(316002)(6916009)(55016002)(186003)(71200400001)(64756008)(66446008)(76116006)(66476007)(26005)(6506007)(508600001)(7696005)(66946007)(66556008)(7116003)(8936002)(66616009)(2906002)(491001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: mtfJTtVPX331dpSyX84nD7tGxdmfwmlGM5XuyEiZ6BiNGn/LZGNTTDzzIFHM2fUChORLc+3JoCp/e7KczfjDcBILvFTvkzSuk/OcdnvFDAE51HAVZG3CzbxnrfsNaXsvVAk9h/zuf8UYV9uB0BVBzsvPBlK6G90TFZ3WuSk3EFDzffhWCpnNng2xLHwP5wIL3eOIP5rFHeVp9Dbuj2RXjG+MJ62r4369ZL3fKG4bChO1FLYzINTbluvF7A3nyODWd3chSZluOgv1+36e1IznYAGqRdsn69NLbAl3dvqRcE5gmZhj04AlXI3ZUDhdQjx/EtNbRIWs/kXyTS494EJ4gwo/MDwyv2ntQtqV0r8YPfGTMLUSgZuMsN5R1aSMudNdxPBbD/QjBVsG4dMTPy+VZn24y686Cl6f96CymHoTxzxoqcbLFaChFcR/jbB+d5xHe9XrfQHh4N3IltVlixKj6OVB3NecE5oNb+KpIZ+u68U3SjbRjZFC1KhOihh5q9e/
x-ms-exchange-transport-forked: True
Content-Type: multipart/related;
 boundary="_004_PS1PR04MB2757ADA2E9B430BD2684826B96700PS1PR04MB2757apcp_";
 type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PR04MB2757.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a97a352d-d172-430a-2dd8-08d83396dd98
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2020 08:10:32.6855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R2DPAsR4VqHGoGiP68mPYkZHWHfz885jJ0OfsNNkiN8N+B4DQMRu0l/TjIjUP+eyNWoK+v+yYTCzdwVhbHkRnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0401MB2171
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

--_004_PS1PR04MB2757ADA2E9B430BD2684826B96700PS1PR04MB2757apcp_
Content-Type: multipart/alternative;
	boundary="_000_PS1PR04MB2757ADA2E9B430BD2684826B96700PS1PR04MB2757apcp_"

--_000_PS1PR04MB2757ADA2E9B430BD2684826B96700PS1PR04MB2757apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, all

I met some problems when using virtual media feature in bmcweb UI.
I uploaded an ubuntu image iso file and click start.
And then I got javascript error messages in bmcweb UI.
[cid:image001.png@01D665C0.D87EC080]

I checked that my kernel enabled USB Gadget Mass Storage and Network Block =
Device by add this four lines in my kernel config.
CONFIG_USB_SUPPORT=3Dy
CONFIG_USB_GADGET=3Dy
CONFIG_USB_MASS_STORAGE=3Dm
CONFIG_BLK_DEV_NBD=3Dm

There is jsnbd in my system and my system has NBD devices in /dev folder.

I added some debug prints in jsnbd.
After I started virtual media jsnbd received some sock_client events and th=
en received SIGTERM event because of previous error in javascript (invalid =
option magic) closed the web socket session.

Should jsnbd receive udev events after I start virtual media?

Does anyone have any ideas?


Besides,
I found that there was a virtual_media.hpp implemented in bmcweb and it cal=
led some D-Bus method in "xyz.openbmc_project.VirtualMedia".
Was "xyz.openbmc_project.VirtualMedia" implemented?
I couldn't find it in openbmc.

Thanks

--_000_PS1PR04MB2757ADA2E9B430BD2684826B96700PS1PR04MB2757apcp_
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
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi, all<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I met some problems when using =
virtual media feature in bmcweb UI.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I uploaded an ubuntu image iso =
file and click start.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">And then I got javascript error=
 messages in bmcweb UI.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><img width=3D"473" height=3D"80=
" style=3D"width:4.927in;height:.8333in" id=3D"_x5716__x7247__x0020_1" src=
=3D"cid:image001.png@01D665C0.D87EC080"></span><span lang=3D"EN-US"><o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I checked that my kernel enable=
d </span><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;S=
egoe UI&quot;,sans-serif;color:#24292E;background:white">USB Gadget Mass St=
orage and Network Block Device by add this four lines
 in my kernel config.</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#24292E;background:white">CONF=
IG_USB_SUPPORT=3Dy</span><span lang=3D"EN-US" style=3D"font-size:10.5pt;fon=
t-family:&quot;Segoe UI&quot;,sans-serif;color:#24292E"><br>
<span style=3D"background:white">CONFIG_USB_GADGET=3Dy</span><br>
<span style=3D"background:white">CONFIG_USB_MASS_STORAGE=3Dm</span><br>
<span style=3D"background:white">CONFIG_BLK_DEV_NBD=3Dm<o:p></o:p></span></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#24292E;background:white"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">There is </span><span lang=3D"E=
N-US" style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif=
;color:#24292E;background:white">jsnbd&nbsp;in my system and my system has =
NBD devices in /dev folder.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#24292E;background:white"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#24292E;background:white">I ad=
ded some debug prints in jsnbd.</span><span lang=3D"EN-US"><o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#24292E;background:white">Afte=
r I started virtual media jsnbd received some sock_client events and then r=
eceived SIGTERM event because of previous error
 in javascript (invalid option magic) closed the web socket session.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#24292E;background:white"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#24292E;background:white">Shou=
ld jsnbd receive udev events after I start virtual media?<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#24292E;background:white"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#24292E;background:white">Does=
 anyone have any ideas?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#24292E;background:white"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#24292E;background:white"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#24292E;background:white">Besi=
des,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#24292E;background:white">I fo=
und that there was a virtual_media.hpp implemented in bmcweb and it called =
some D-Bus method in &#8220;xyz.openbmc_project.VirtualMedia&#8221;.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#24292E;background:white">Was =
&#8220;xyz.openbmc_project.VirtualMedia&#8221; implemented?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#24292E;background:white">I co=
uldn&#8217;t find it in openbmc.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#24292E;background:white"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#24292E;background:white">Than=
ks<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_PS1PR04MB2757ADA2E9B430BD2684826B96700PS1PR04MB2757apcp_--

--_004_PS1PR04MB2757ADA2E9B430BD2684826B96700PS1PR04MB2757apcp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=5546;
	creation-date="Wed, 29 Jul 2020 07:56:39 GMT";
	modification-date="Wed, 29 Jul 2020 07:56:39 GMT"
Content-ID: <image001.png@01D665C0.D87EC080>
Content-Transfer-Encoding: base64

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
r3Ok69oAAAAASUVORK5CYII=

--_004_PS1PR04MB2757ADA2E9B430BD2684826B96700PS1PR04MB2757apcp_--
