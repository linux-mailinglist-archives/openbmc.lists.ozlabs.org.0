Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C717F114B51
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 04:03:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Tcq25NSWzDqYt
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 14:03:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.23.74;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=fishbaoz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="stwPaLL9"; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2074.outbound.protection.outlook.com [40.92.23.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TcpB5b13zDqLf
 for <openbmc@lists.ozlabs.org>; Fri,  6 Dec 2019 14:02:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyCrhJX3VthMG13sZCxguLbbHUJe7jfyzwfDL0Ai6VAg82a0sWo0m/2KUZxAEAXF9Vwbuq+4rwYqHLPNjt9me0S2PYZtPWUbZHwLu7zwrqDVkGIjj5VKGRrxcjSl/Y8vzsoXWioTzQurKLidgy+Dz4yLpAWQM9YpU2VuAYUGIoUsWCxtlcysbPExBnJvEtQrvqUkfx1FriVeogrnRBh9Wo/H4Q0PA+rRJirEPXVGqTcziscx0q2KJ4PgHSgsk9cIkSRxRjGa1/NpNZjQMy5AARjDmeWpytToG+1AU2E9RfpdIWvHtM5i0l1Vdupwedvmn2AQkkmVi6b1dJ9bRBpxcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCztM6WXa2GmOHsQobo+ybKsGNjvWPiPF4qk3aYMdAA=;
 b=TD/QHAxpzQ1t2F1/aph18BDJafXJQwrg5Qwj9D8lHEUJECBsRg4OpAFFX5tdlKCWz5coHnjJ3X4Goauk5oCTlwFR7k+v9MeAbotisBEvwFrWRI7dU0D33iVHN2xOElYN5rDi8LzE6tayBReiLVizoEGJuoMvKlSYyrdPFukL4DwaFS68bQtvYOP2Ga9v9FI8K3MyV98MasT2RGgo5QcWoJBjAG4I9R/u+uz+PMkcZcter2sUi3vxFH+akEi7N3ctXNqr+GebMrH28YLvApCavATPcMre2rKrlJ1Bszt5SfPA+AuVGAZbcod5F8dYHkNFQ7R1hZ4ZnDlv92BHodeQdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCztM6WXa2GmOHsQobo+ybKsGNjvWPiPF4qk3aYMdAA=;
 b=stwPaLL90fm+FUl7F2h3BrAnG3Fm0EocGGhbPgo+X0qZnAjVt5XTWxSjISEVzJUd9qE4YVqUCmh6Y3wlJpjHyBoL0foYx/jirkwDUzNO1wFwoSxfIJhDgERyJJMsUdqYgjpJ2WUgl5xl17CPp3Uu+GR+ywrQkD2PebR7DZzBUDwFVlrg+ngnZgcklWGzb2mPmthm34B+QyGyL+PlpYCu2MOyD4iN7ptvWNg1UebPGq6qYMTBiPaEBEom3ihHKC4wS/SfTS+S7jKtmSuh7msN3X7DGiLkNXzGN+7e6H/64a2TMQVaV1hm4MG6/UVjxxCnGWkL7o8KwRj3691tx3PdxQ==
Received: from DM3NAM05FT058.eop-nam05.prod.protection.outlook.com
 (10.152.98.52) by DM3NAM05HT040.eop-nam05.prod.protection.outlook.com
 (10.152.98.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.10; Fri, 6 Dec
 2019 03:02:37 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com (10.152.98.54) by
 DM3NAM05FT058.mail.protection.outlook.com (10.152.98.174) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.8 via Frontend Transport; Fri, 6 Dec 2019 03:02:37 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::64f4:9bd0:ebf9:844e]) by MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::64f4:9bd0:ebf9:844e%2]) with mapi id 15.20.2516.014; Fri, 6 Dec 2019
 03:02:37 +0000
From: Zheng Bao <fishbaoz@hotmail.com>
To: Alexander Amelkin <a.amelkin@yadro.com>, AKASH G J <akashgj91@gmail.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Add sensors to S2600WF
Thread-Topic: Add sensors to S2600WF
Thread-Index: AQHVq+FqsbNS4zU+dE+Yc2xBTnW9jA==
Date: Fri, 6 Dec 2019 03:02:37 +0000
Message-ID: <MN2PR04MB6669251047DBA64FD791C9B7CD5F0@MN2PR04MB6669.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:4D1CB077369012852350FB15500BBAC37E476429B759F8B01FFF6445FAE3DEFE;
 UpperCasedChecksum:0918BF4EA5F08DF41078C9CE2E6CB826C71B9E24FB0B1FFBDF41F1F10919E6D6;
 SizeAsReceived:6720; Count:42
x-tmn: [tZVmOwHsIgb8PNyzQD2YGFKg8cPx+ASY]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: d5d05c12-9566-4105-32bb-08d779f8c005
x-ms-traffictypediagnostic: DM3NAM05HT040:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FjS2v3P1Xufg/aMV+xyEEPx4+VpLZRT6Qv4FJTv5GpK1fCBQNl/32mig3dpuaDxCbdDuR5xJh6CHKyvkAkis8gKn7MBhEWPwfynVgqF8G7sEYH+Wj2shx55zrLf0rZI7+XRkrGiKYMGsY94oM2jBXdw8njLe0pFetHzgvA5ba2x+1OtgBAO88TgOk2CDvbOg
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MN2PR04MB6669251047DBA64FD791C9B7CD5F0MN2PR04MB6669namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d05c12-9566-4105-32bb-08d779f8c005
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2019 03:02:37.5456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3NAM05HT040
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

--_000_MN2PR04MB6669251047DBA64FD791C9B7CD5F0MN2PR04MB6669namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Is there any chance to shrink the size of wolfpass to 32M?

Zheng

________________________________
From: openbmc on behalf of Alexander Amelkin
Sent: Tuesday, December 3, 2019 1:47 PM
To: AKASH G J; openbmc@lists.ozlabs.org
Subject: Re: Add sensors to S2600WF

03.12.2019 13:39, AKASH G J wrote:
Hi all,

I am using S2600WF configuration for BMC firmware.  We are having temperatu=
re sensors and ADC voltage monitors connected on board. All sensor readings=
 are shown on hwmon sysfs interface.

But it is not coming when issuing IPMI commands.

$ ipmitool -I dbus sdr type temperature
$ ipmitool -I dbus sdr type voltage

Is there anything to be done to make sure sensor values are reported over D=
Bus.

For s2600wf it's best to use the version of OpenBMC from the
Intel-BMC repository ([mailto:git@github.com:Intel-BMC/openbmc.git]git@gith=
ub.com:Intel-BMC/openbmc.git).
I'm using their clean_builds branch.

Use 'wolfpass' machine there instead of `s2600wf` and build
'intel-platforms' instead of 'phosphor-obmc-image'.

Sensors work for me that way via IPMI.

With best regards,
Alexander Amelkin

--_000_MN2PR04MB6669251047DBA64FD791C9B7CD5F0MN2PR04MB6669namp_
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
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Is there any chance to shrink the size of wolfpass to 32M?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Zheng<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
<br>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%;">
<b>From:</b> openbmc on behalf of Alexander Amelkin<br>
<b>Sent:</b> Tuesday, December 3, 2019 1:47 PM<br>
<b>To:</b> AKASH G J; openbmc@lists.ozlabs.org<br>
<b>Subject:</b> Re: Add sensors to S2600WF
<div><br>
</div>
</div>
<div class=3D"rps_e069">
<div style=3D"background-color:#FFFFFF">03.12.2019 13:39, AKASH G J wrote:<=
br>
<blockquote type=3D"cite">
<div dir=3D"ltr">
<div>Hi all,</div>
<div><br>
</div>
<div>I am using S2600WF configuration for BMC firmware.&nbsp; We are having=
 temperature sensors and ADC voltage monitors connected on board. All senso=
r readings are shown on hwmon sysfs interface.</div>
<div><br>
</div>
<div>But it is not coming when issuing IPMI commands.</div>
<div><br>
</div>
<div>$ ipmitool -I dbus sdr type temperature</div>
<div>$ ipmitool -I dbus sdr type voltage</div>
<div><br>
</div>
<div>Is there anything to be done to make sure <span class=3D"x_gmail-il">s=
ensor</span> values are reported over DBus.</div>
</div>
</blockquote>
<p>For s2600wf it's best to use the version of OpenBMC from the<br>
Intel-BMC repository ([mailto:git@github.com:Intel-BMC/openbmc.git]git@gith=
ub.com:Intel-BMC/openbmc.git).<br>
I'm using their clean_builds branch.</p>
<p>Use 'wolfpass' machine there instead of `s2600wf` and build<br>
'intel-platforms' instead of 'phosphor-obmc-image'.</p>
<p>Sensors work for me that way via IPMI.<br>
</p>
<pre class=3D"x_moz-signature" cols=3D"80">With best regards,=0A=
Alexander Amelkin</pre>
</div>
</div>
</body>
</html>

--_000_MN2PR04MB6669251047DBA64FD791C9B7CD5F0MN2PR04MB6669namp_--
