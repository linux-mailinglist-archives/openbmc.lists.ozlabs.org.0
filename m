Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED23920373B
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 14:49:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49r8Ph4xQ5zDqXB
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 22:49:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.255.76;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=qiRo/0V1; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-oln040092255076.outbound.protection.outlook.com [40.92.255.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49r8Nc5QftzDqGL
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2020 22:48:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkiKzPQ2Fa8FaTrkiqGvfzfbsw9iesZfQT+msz2mO7nMAj/YO0ezRIn91fNTJ0MZDYfxN/bXZ0ybyoVMSlnUxExYJsGARg95doukZeil3qKhUPCynpta2kPwAnuTb5lGXK5ajJps8Z2tyhItXrIKqEcVPuc/rCOv9qixEpXnnngzr4+zfTzl2LQVGrJfnL2OClZVTanLND2rCn0R9l8mC/h7QqoADto9Iq+WLg6y1999I1dJpBKpHIj+DN9URJp4nkSiZMSmK/iTFKAlJvAVkQFBlilUez+8Sth5eBxkM+byx9vuR831u8k6OEuh1qxAzMawg2VMWA7nWT+Cy7gIbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEd6Ar+O9fqtR//13+vfUtm1FUo9tMuxwLqDGVFOXzs=;
 b=V4RVQ96SFMlevykNdn1xIR60B6x/uVbmY0MUM/Sr+Sasqtz16pnR81KyE0nOnU2NtIUCibTsoyX+btiBGO+YjYr0OuZIoo/2lqol8dJx1jpNs+gaTYfMJQHi3QB2YH/R1WlFpQd2y10LdlbYtMXsKXL5g4rTkX5ncn488RAIrcWtCzcbLTZ97ZxYdLtlviAUWMsltyiE91jfjHURZqy0gD11rEBSu0MVFlDoh3LpEGfu06lMkeePMJz/3JxXjukPDtiW7x+D4PWoUmXosQr48Pko4gqtoShJnLYdl3cFoWfLYx8nW/5D9G5HQPiJdZuFRL9fYOuc9n/rfLHUzjq9pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEd6Ar+O9fqtR//13+vfUtm1FUo9tMuxwLqDGVFOXzs=;
 b=qiRo/0V1tpHaYo7PZo7IchweT8kF1WjViZjgAUt93jGfJ3JzxSRp82e48MQlGxZw7eyAoIQy9Lx5B0IXbFBP7VPeo7FSuGPFuBNMYTa5/fQDgxbHWYaLyh3w3Pb7jXucOJugQW/idd3AH4V5y+ZW201ByA2bR4coEDgC85fU92eTCBndPeH1oX3odWfGpG8u1ONy3GNvtHIbbybiTTlHRCF+KEAwjwtaBRDeEKzJpTVlLZt5J04NWaxxARVTxJlfa/6pS0qYyDt8yrc19HY/ms+sOr0w32U/HNqfhhDu+SlC7cDdijSTaZG4A6wK3QO8ubP32aKxEZbm1exodcBz4g==
Received: from HK2APC01FT010.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4f) by
 HK2APC01HT091.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::379)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 12:48:42 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebc::4e) by HK2APC01FT010.mail.protection.outlook.com
 (2a01:111:e400:7ebc::157) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Mon, 22 Jun 2020 12:48:42 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::88c3:5243:9944:700f]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::88c3:5243:9944:700f%6]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 12:48:42 +0000
From: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: about virtual variable
Thread-Topic: about virtual variable
Thread-Index: AQHWSJK9AQ4jrODwAkqVAEi5zh+8Gg==
Date: Mon, 22 Jun 2020 12:48:42 +0000
Message-ID: <HK2PR04MB38261ACC44E9A3FE1236DF55FE970@HK2PR04MB3826.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:69C4AD07B6722A00481A720C8D1305358D457CE42ABE4FD21BD7D4B0BFF6CEC2;
 UpperCasedChecksum:E2EDEB461E791E2EAF218CDE6F5E32933456633DA844F904387FB74ED3C0B947;
 SizeAsReceived:6642; Count:42
x-tmn: [ccH3fyb315lKtqKdyB+uajCYkdb4NFj/]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: f3fe52a9-83cf-4a1c-6831-08d816aa9824
x-ms-traffictypediagnostic: HK2APC01HT091:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O7LyL57q0+dNDei3CMjgNhFFxHjwJoYaBWwgSjv+oP3SQdFG3V1ggEXC2iTZkqUDuZAAY95HQyAakPFMYUMKa6bIkp11aKGXV8UgO+vyFvwpp1YtB3lAQGiku/zSrqI5z7rpgC60vo1d1bZG9NdqhRpYNEmtSBcQCMpDh5GodHJWLAR2al2BdE7mFEcmgmCeBc5GpFGlVYlPNLCgaNvpANvF3yxIRkrMXdBm6Pas5LLXIjNAgPyT6aFxmavQq5I6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: oUejQfiEVukYBJrswr5QnI2uuLMLirI48IkRpCZ2e6iOHNy8rUQH6ANjAuGhBAO3RT4oZru24aidVngN4UkGx9X4uuezbHL8Tx3Hjv8QZL+ENk7nQvrGbmI/PRzb4F/cvVOQhnIRQ+i52qM/wMONPw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB38261ACC44E9A3FE1236DF55FE970HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f3fe52a9-83cf-4a1c-6831-08d816aa9824
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2020 12:48:42.5399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT091
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
Cc: "uperic@163.com" <uperic@163.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK2PR04MB38261ACC44E9A3FE1236DF55FE970HK2PR04MB3826apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

     I would like to ask, is virtual a variable defined by bitbake? I did n=
ot find it in the bitbake manual. What is the use of the virtual variable? =
What would be the problem without this variable?
2.4. Preferences=B6<https://www.yoctoproject.org/docs/latest/bitbake-user-m=
anual/bitbake-user-manual.html#bb-bitbake-preferences>

The PROVIDES list is only part of the solution for figuring out a target's =
recipes. Because targets might have multiple providers, BitBake needs to pr=
ioritize providers by determining provider preferences.

A common example in which a target has multiple providers is "virtual/kerne=
l", which is on the PROVIDES list for each kernel recipe. Each machine ofte=
n selects the best kernel provider by using a line similar to the following=
 in the machine configuration file:

     PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto"


--_000_HK2PR04MB38261ACC44E9A3FE1236DF55FE970HK2PR04MB3826apcp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi everyone,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;I would like to ask, is virtual a variable defined by b=
itbake? I did not find it in the bitbake manual. What is the use of the vir=
tual variable? What would be the problem without this variable?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div style=3D"font-weight: 400; color: rgb(51, 51, 51); font-family: Verdan=
a, Sans, sans-serif; font-size: medium; orphans: 2; widows: 2; background-c=
olor: rgb(255, 255, 255)">
<div>
<div>
<h2 style=3D"font-family: Arial, Sans; color: rgb(0, 85, 125); clear: both;=
 margin: 2em 0em 0.66em; padding: 0.5em 0em 0em; font-size: 1.5em; font-wei=
ght: bold">
2.4.&nbsp;Preferences<span><a alt=3D"Permalink" title=3D"Permalink" href=3D=
"https://www.yoctoproject.org/docs/latest/bitbake-user-manual/bitbake-user-=
manual.html#bb-bitbake-preferences" style=3D"text-decoration: underline; co=
lor: rgb(238, 238, 238); background-position: initial initial; background-r=
epeat: initial initial">=B6</a></span></h2>
</div>
</div>
</div>
<p style=3D"font-weight: 400; line-height: 1.5em; margin-top: 0em; color: r=
gb(51, 51, 51); font-family: Verdana, Sans, sans-serif; font-size: medium; =
orphans: 2; widows: 2; background-color: rgb(255, 255, 255)">
The<span>&nbsp;</span><code style=3D"font-family: Courier, monospace">PROVI=
DES</code><span>&nbsp;</span>list is only part of the solution for figuring=
 out a target's recipes. Because targets might have multiple providers, Bit=
Bake needs to prioritize providers by determining
 provider preferences.</p>
<p style=3D"font-weight: 400; line-height: 1.5em; margin-top: 0em; color: r=
gb(51, 51, 51); font-family: Verdana, Sans, sans-serif; font-size: medium; =
orphans: 2; widows: 2; background-color: rgb(255, 255, 255)">
A common example in which a target has multiple providers is &quot;virtual/=
kernel&quot;, which is on the<span>&nbsp;</span><code style=3D"font-family:=
 Courier, monospace">PROVIDES</code><span>&nbsp;</span>list for each kernel=
 recipe. Each machine often selects the best kernel provider
 by using a line similar to the following in the machine configuration file=
:</p>
<pre style=3D"font-weight: 400; overflow: auto; color: rgb(51, 51, 51); orp=
hans: 2; widows: 2; background-color: rgb(255, 255, 255)">     PREFERRED_PR=
OVIDER_virtual/kernel =3D &quot;linux-yocto&quot;</pre>
<br>
</div>
</body>
</html>

--_000_HK2PR04MB38261ACC44E9A3FE1236DF55FE970HK2PR04MB3826apcp_--
