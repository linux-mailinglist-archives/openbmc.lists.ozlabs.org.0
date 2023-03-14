Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C77C6B8A50
	for <lists+openbmc@lfdr.de>; Tue, 14 Mar 2023 06:29:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbMXJ2tRhz3cCL
	for <lists+openbmc@lfdr.de>; Tue, 14 Mar 2023 16:29:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=nwEgQDHk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:700f::819; helo=ind01-max-obe.outbound.protection.outlook.com; envelope-from=saini.ranbirs@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=nwEgQDHk;
	dkim-atps=neutral
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn20819.outbound.protection.outlook.com [IPv6:2a01:111:f403:700f::819])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbMWf52mSz3c7t
	for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2023 16:28:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUhxClCR8YT95LWCjlHRj9Sxs0pxc34csy0ZlxnQsa/qUoT53u0ENfr2+v/HCuAR5NqELxUKea0XKL5P3Hn2QXquumrdI/hUjJthaGqIy3vi5jzQMeYxnE5mA/UPFDWqBYmsPEBNsZija4bqnWjqDi7CjNIBz+Ts14kZbkhA6jpoJydL3kdQyPle0A+IUCpQxr8zb2LmXJBu2K5+P30JH9Ed7b+9YWb/dD4H+kHcLj421JDVpzLwoC10Jn0RvBnYwLrB05FH7oq/Qj/Yf8Noi32W2Abyfb5f/LXRicm/rFkPYXZEzMEVnDHOGmENtNQmAt+lNPfHSYs5o+dIso/zzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kn02sgP659/Z+avgLedh+Q2KxFga+kKrkM5ECNcb13k=;
 b=OuWL6pHnrz2aVc0p/TmfXRq45eDoMbOoE6s4PDeE4G4dXWmqxfmw9au4Um20OgMuC2T6NATgDES9UnCjQFaIEowQv5+4mzUeppFW+Gn87JGHYrHG30T2ZesuDLTDU3IBp/IS+/3xSOKA8LT8vKp+won3WxQ+EXdWi+io/CRdypUTqQB6SDCwyuwNmRVNYYZTYnzFKQ/paQBN73DdVYKsj53bJIiBZypO/HjbCho5T0FxxiExT0Ba3o4OPom20A/EOG/Z1Za624F2czHZNFTCDYMTu68nd42ETaLkYuYrrmlWhJ7ieovYAQEYGrjISQgqrUOldXeBMh/8Mjao63+yqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kn02sgP659/Z+avgLedh+Q2KxFga+kKrkM5ECNcb13k=;
 b=nwEgQDHkyvZ/nll2Ai1rCTbv3bsOOfiF1jRF76qlXHomLBEZ7T2WLNvFtDGW7vTrqSq4ascipN62E5p66b0X1OI+jMqxWELPo+baJanAv5ZJ4emzpverBw1azVQf1BxEJoiObNtynlpgCgMJU9rbLnH+ip7/jrIOwz8twjRw8m6X3z3tI6p9jgWZmWpj2YU8z8bMMnGRhrSvejYZ52GoGIyIX0ftiMKjtZNY/H+VQsjRIypevqsElIv0Y6+/hBjOPyjtIZIxgAWlwXzchRaFncFc0CrzcdlGjqdK4W0qBcsHDf7qXI7rfVnyiUgOKOWFkwZ4j+J+kg3DfMsOvYQzCA==
Received: from MA0PR01MB6812.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:5e::10)
 by MAZPR01MB5696.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:64::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 05:28:24 +0000
Received: from MA0PR01MB6812.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::726c:7fc4:d8db:2d3]) by MA0PR01MB6812.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::726c:7fc4:d8db:2d3%3]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 05:28:24 +0000
From: Ranbir Singh <saini.ranbirs@outlook.com>
To: Jian Zhang <zhangjian.3032@bytedance.com>, David Bashaw
	<theactualdbashaw@gmail.com>
Subject: Re: [External] Running evb-ast2600 image using qemu
Thread-Topic: [External] Running evb-ast2600 image using qemu
Thread-Index: AQHZVgbJ1wxYviRlukeSxKB3uxme2K75nygAgAAf8R8=
Date: Tue, 14 Mar 2023 05:28:24 +0000
Message-ID:  <MA0PR01MB6812D93048C946BE907B7DA4F9BE9@MA0PR01MB6812.INDPRD01.PROD.OUTLOOK.COM>
References:  <CAB7+d-nOMCGdD7upJviTVrWuZ=mW0gyV9G0E4wke8rQstg2zzw@mail.gmail.com>
 <CA+J-oUsaF8rNYYff9QZj8C0iZgHf8+YE=LfPuQ74ndx+XrwAnA@mail.gmail.com>
In-Reply-To:  <CA+J-oUsaF8rNYYff9QZj8C0iZgHf8+YE=LfPuQ74ndx+XrwAnA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [MfYfCzO/hskYd2r5FgsFIvnY10KPuXPj]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB6812:EE_|MAZPR01MB5696:EE_
x-ms-office365-filtering-correlation-id: 5c8e1f89-f1a3-4ab3-daa5-08db244cef05
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  eb+Vfh3pMPTmtcHbHRLZxTlU6oZdjQhRSStgHy79g8jVs0hsrni3b4FzPkIfqp/Rl22ORcqw17y4WKTXyryrIDyFwbUwsgUqHsVsAxnd7eMJSCTJ8LVV05hEwUAMRVwQbsdDbyACzoL2SOodQ/nu9pKI3yJipvS/b0XCE4uMkva/LcG9H6v1GzxCNFI7KYDehSx9iLw90SCfVHEx5hhgSWHqh9podQbZIXsL0OPBvb/sDacJM0o6RiGhEiXBN8+RHTdkypPe1fZjrubl5z+IKMX6pF9MgfWttDA1g7ssyoN4hxnHqfWOcwEF7c1ZmNmRgTsdG9TL0hce2XK7aJckLjujFNE+kjlzySao5cI+fmvgAFQjAHGu3I5RVZyHg4hPhLmcr4WifGYAmp2u0OtwsNgBfCEQn9gpZzyizK0dA6vmHJMs4BsJ1TFmLJ2pHGyk+OFnyhbhvLaFuLA6bfwi2aH8Vk+bRkiiLSojyJDwVGExKmVCEK/6s6aGaYazsz6o7r9XletyroaaQlplsDVw+MMyPMCQev8gsVtxYvFKLj6aLNXXPL+GIJqN1QfeZgEFS2sQgkR8chasihhyfqtezHGVir+uafpN9TfBJJwZXB1A3wrJk+g9oPMVY6DeG1GBttKv5uEUniXRydxmKbEP4MFjoTaqzcUp/JEthE6XH5U=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?LnJpubffP+60Tdk1kH4N2UaAbUiXPNKzQQDv6UoB8fTOuMcDiyhyMTwGzLgF?=
 =?us-ascii?Q?flEZj2BbrjBL71F6TSwGMZBUfnsLyae6y+pIjYxEtJKZd6z0nmakQICzzYv1?=
 =?us-ascii?Q?MbbLwlF+xDsnJ08BR2Ncs5w61pqU1AE9iPEhLb6mVJUB+8L43k8/Rc9BH4uQ?=
 =?us-ascii?Q?PlR9QYnmE3xkVCK29SiX+iO9bW6pCzYzL06rBpV90067IiSU8DxBXLkrIqKq?=
 =?us-ascii?Q?BEqqAhqbyYO61me/jjhs9vEwV2qbjgilWh23TIMwBUFBntqujr9kpBSb5yb1?=
 =?us-ascii?Q?yBRVEHBz/n6SACA4R2f+4QvYiFeBg8waA6B7UTpAF0UEenPj6Zsnv6/xO6Vw?=
 =?us-ascii?Q?uN2lHkskC2utBBYcDEn4YPKd0/P0/dOrXPqsatNH4GOCqh5bLP+YzrvnBmUR?=
 =?us-ascii?Q?dXv/kFL7AjhKKAcxkfCXz5gikEvgW7hcTEx3T7+OGnrc+HiKN+sm5PSn3vvd?=
 =?us-ascii?Q?flhvadZUUFHC5Qd1IRWmXfMpbmkddjYZsMpRjnLwNta025Ovn5Wkc7ejHGx2?=
 =?us-ascii?Q?ImxLSYx5xaNXmXtTYPDXwS3hDKrCjLRYOtRDglAEBElSTl4A+gaSP/s/KBIr?=
 =?us-ascii?Q?1p5+ksb+U/6FtUCrC+SnrHGbx7GF3pnnYcU7J60gnW94mQWPw+6jz39/15LR?=
 =?us-ascii?Q?mcT7fVaKc7tViQbNVYnu9z4wDDI3/ZE7YxG31jrhrxKBzVQCyuVddzWk4gac?=
 =?us-ascii?Q?2XeV4CCFOHPBV+ItZB6ZxVQLRbSvmcc8t0ZEm7SrRcuk9hh1uQoCuoKdR5yS?=
 =?us-ascii?Q?MKLBVsXByi3NrPDh7AuZ6kbsi9c13PmRJbke86pfVjyuB8jFPyPjxeTf9ng1?=
 =?us-ascii?Q?/gsB/b1MEh1fCThFpcQKQWVbfKqxMtRik+gF26cUqYHvDPzVL0Qs3JC/3g28?=
 =?us-ascii?Q?K7d6Ds18tcMLorFpT4xNI+CInrJXjclZ9HoBiab3+J0SKorVD8DTAZV3kffK?=
 =?us-ascii?Q?02R/87Qv8XyLsZEb2nldl+J9InxIS54awm+EdLmJxuvpZ5v6C5DtWDNVmgi+?=
 =?us-ascii?Q?RXxmj6oZ6TRg2jX6y2a17CExr4G2ykA72lmbfOmG/q7XTT/bQfNL99dY8hHr?=
 =?us-ascii?Q?hiRz2pQZvNwLCe8pk+4+lyHQ3U5BDw22DBJQU+/gPyPJxIdve7FbZUGqGKwu?=
 =?us-ascii?Q?DmsWf3a+HCIXShvXd51pPL8AHc0t/XrVOxtXDxpXjxLpItCJl8wp217KWeoQ?=
 =?us-ascii?Q?BsV/ik/tcLlghEjeisJsIeKCkvhwtw4i4nHghNJ7b7pp6yDEHuk6r2oJlhNY?=
 =?us-ascii?Q?4CA+NE8tWta/rlso7UMJTdPBBp9BSGL1Cfm3Y4ACjg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MA0PR01MB6812D93048C946BE907B7DA4F9BE9MA0PR01MB6812INDP_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB6812.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c8e1f89-f1a3-4ab3-daa5-08db244cef05
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 05:28:24.8841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5696
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_MA0PR01MB6812D93048C946BE907B7DA4F9BE9MA0PR01MB6812INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Is there anyway to login using the Web UI also when running image on qemu ?
________________________________
From: openbmc <openbmc-bounces+saini.ranbirs=3Doutlook.com@lists.ozlabs.org=
> on behalf of Jian Zhang <zhangjian.3032@bytedance.com>
Sent: 14 March 2023 09:02
To: David Bashaw <theactualdbashaw@gmail.com>
Cc: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
Subject: Re: [External] Running evb-ast2600 image using qemu

The command that I used.
```
qemu-system-arm -M ast2600-evb  -nographic -drive file=3Dimage-bmc,format=
=3Draw,if=3Dmtd -net nic,model=3Dftgmac100,netdev=3Dnetdev1 -netdev user,id=
=3Dnetdev1,hostfwd=3D:127.0.0.1:3222-:22,hostfwd=3D:127.0.0.1:1443-:443,hos=
tfwd=3Dudp::1623-:623
```
For your reference.

Jian
From: "David Bashaw"<theactualdbashaw@gmail.com<mailto:theactualdbashaw@gma=
il.com>>
Date: Tue, Mar 14, 2023, 07:52
Subject: [External] Running evb-ast2600 image using qemu
To: <openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>>
I'm new to openbmc but have read lots fo docs.
I want to try running an evb-ast2600 image using qemu.
I ran the following steps:
.setup evb-ast2600
bitbake obmc-phosphor-image

The build completes fine.
I installed qemu-system-arm also.

What command line should I use to invoke qemu?


--_000_MA0PR01MB6812D93048C946BE907B7DA4F9BE9MA0PR01MB6812INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=3D"eleme=
ntToProof">
Is there anyway to login using the Web UI also when running image on qemu ?=
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openbmc &lt;openbmc-b=
ounces+saini.ranbirs=3Doutlook.com@lists.ozlabs.org&gt; on behalf of Jian Z=
hang &lt;zhangjian.3032@bytedance.com&gt;<br>
<b>Sent:</b> 14 March 2023 09:02<br>
<b>To:</b> David Bashaw &lt;theactualdbashaw@gmail.com&gt;<br>
<b>Cc:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Subject:</b> Re: [External] Running evb-ast2600 image using qemu</font>
<div>&nbsp;</div>
</div>
<div>
<div id=3D"x_editor_version_1.29.5_YkJYyBhx" style=3D"word-break:break-word=
">
<div style=3D"margin-top:4px; margin-bottom:4px; line-height:1.6">
<div class=3D"" style=3D"font-size:14px">The command that I used. </div>
</div>
<div style=3D"margin-top:4px; margin-bottom:4px; line-height:1.6">
<div class=3D"" style=3D"font-size:14px">``` </div>
</div>
<div style=3D"margin-top:4px; margin-bottom:4px; line-height:1.6">
<div class=3D"" style=3D"font-size:14px">qemu-system-arm -M ast2600-evb&nbs=
p; -nographic -drive file=3Dimage-bmc,format=3Draw,if=3Dmtd -net nic,model=
=3Dftgmac100,netdev=3Dnetdev1 -netdev user,id=3Dnetdev1,hostfwd=3D:127.0.0.=
1:3222-:22,hostfwd=3D:127.0.0.1:1443-:443,hostfwd=3Dudp::1623-:623
</div>
</div>
<div style=3D"margin-top:4px; margin-bottom:4px; line-height:1.6">
<div class=3D"" style=3D"font-size:14px">``` </div>
</div>
<div style=3D"margin-top:4px; margin-bottom:4px; line-height:1.6">
<div class=3D"" style=3D"font-size:14px">For your reference. </div>
</div>
<div style=3D"margin-top:4px; margin-bottom:4px; line-height:1.6">
<div class=3D"" style=3D"font-size:14px"><br>
</div>
</div>
<div style=3D"margin-top:4px; margin-bottom:4px; line-height:1.6">
<div class=3D"" style=3D"font-size:14px">Jian </div>
</div>
</div>
<div class=3D"x_history-quote-wrapper" id=3D"x_lark-mail-quote-167876472">
<div style=3D"list-style-position:inside">
<div class=3D"x_adit-html-block x_adit-html-block--collapsed" style=3D"bord=
er-left:none; padding-left:0px">
<div>
<div class=3D"x_adit-html-block__attr x_history-quote-meta-wrapper x_histor=
y-quote-gap-tag" id=3D"x_lark-mail-meta-WqZOEPU8H" style=3D"padding:12px; b=
ackground:rgb(245,246,247); color:rgb(31,35,41); border-radius:4px; margin-=
top:24px; margin-bottom:12px">
<div id=3D"x_lark-mail-quote-4892a39c936a394f576156da4b8bf9e2">
<div style=3D"word-break:break-word">
<div style=3D""><span style=3D"">From: </span><span style=3D"white-space:no=
wrap">&quot;David Bashaw&quot;&lt;<a href=3D"mailto:theactualdbashaw@gmail.=
com" class=3D"x_quote-head-meta-mailto" style=3D"white-space:pre-wrap; word=
-break:break-word; text-decoration:none; color:inherit">theactualdbashaw@gm=
ail.com</a>&gt;</span></div>
<div style=3D""><span style=3D"">Date: </span>Tue, Mar 14, 2023, 07:52</div=
>
<div style=3D""><span style=3D"">Subject: </span>[External] Running evb-ast=
2600 image using qemu</div>
<div style=3D""><span style=3D"">To: </span><span style=3D"white-space:nowr=
ap">&lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" class=3D"x_quote-head-m=
eta-mailto" style=3D"white-space:pre-wrap; word-break:break-word; text-deco=
ration:none; color:inherit">openbmc@lists.ozlabs.org</a>&gt;</span></div>
</div>
</div>
</div>
<div>
<div dir=3D"ltr">I'm new to openbmc but have read lots fo docs.
<div>I want to try running an evb-ast2600 image using qemu.</div>
<div>I ran the following steps:</div>
<div>.setup evb-ast2600</div>
<div>bitbake obmc-phosphor-image</div>
<div><br>
</div>
<div>The build completes fine.</div>
<div>I installed qemu-system-arm also.</div>
<div><br>
</div>
<div>What command line should I use to invoke qemu?</div>
<div><br>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_MA0PR01MB6812D93048C946BE907B7DA4F9BE9MA0PR01MB6812INDP_--
