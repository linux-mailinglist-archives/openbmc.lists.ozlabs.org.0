Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 358D7CE61F
	for <lists+openbmc@lfdr.de>; Mon,  7 Oct 2019 16:54:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46n3QY6v2kzDqMf
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 01:53:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hotmail.com
 (client-ip=40.92.5.81; helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=fishbaoz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="iathueUq"; 
 dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-oln040092005081.outbound.protection.outlook.com [40.92.5.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46n3Pv1WVMzDqLC
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 01:53:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkBxaGpbcnx4qVGumBeKG439l5+otirT90HplcViYRBkurJcXAG1/HEroPOgl9A3klp75I9CJVcIY4TSUnhURQxXDgJ5Gy4kp87oZrxT2b1nqF0zzgpx5BAFmYI4AFYoQdkqqvr9toOxc8LnTjWnviV3lbP/KQISaI3HRd3HEKY2qQ6xKquJKrt/v5O+gyTDF5Ng60xc0bqKPIG9N6lsv9Aliex1fTXdItaxl9ifd7jhuNbF7IM7YsaUcWZ28GPSzx0TgvrZbHgIH+HNNHt34oXvgS7DwNN3cW5G4fbF4W6sjesXUr3ZShxVCzZZQC35St0H33/fDMcpriJEVHx3tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViIJclsmfqGYWUpv9yFxEBlF08D+y1N4nad/ajoY4K8=;
 b=bhYDjQEYba6osczqqtf9/CnaKqYvlNEBDwO/yAkzjROnFgbeJjr1jJnNbG58FldgXimtdTScuX3pZYMO+HcAQQZs8FBJl1sXSAwLEvIKXkv3oExfEvi5HHDtdt4jOlq69tI2b1CL1bng1iewdPob6NbOWoRSRfP/1TxxwkTRST9h3JHxFMiTleIPU+AAGnu7efw+ZWE6eVSzR7xDiFJZAF7VoDBCzv8HbZn5lz9AyyeT9cHMqxATbflzZo6PK7EuQwsUMt371dlWsvWCfr9JurJ1UMHZyONcBAyFgD8LM/htWUfiHcoO2mV2IS4DuuedQde/07qnnZL3/yexITTHaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViIJclsmfqGYWUpv9yFxEBlF08D+y1N4nad/ajoY4K8=;
 b=iathueUqfl0ReY1AlMB5xIRV/JioqHu16LN2QgXx06cv88buZDBfRGrKk3IkcO8xS+Q07WCUmiM6jJo6T9z6PnTGrGMp4UX9oSfvK5Ki5RBvLtYJ+4XsAXsR1m0+LC6OswR0/yJl3GRJCdLNtqSfJ/6pnys0oONGrRTo/YRB9vB7U4pmErVr+2Vvd4wT2fc+Bb8N8nu7mKDrCaVJEv34cdFdS349iqawAPnog3OyXzzbXHfxgXG57psHjuskUNJxlcNJ0alOLVcuipqykMV/ga2UcbeUrF0phK386SNmtzbD4NPYcCiTL8SeEZT5B6UMeWpMlL4oQvbs6XXcUhcDHQ==
Received: from BL2NAM02FT016.eop-nam02.prod.protection.outlook.com
 (10.152.76.54) by BL2NAM02HT174.eop-nam02.prod.protection.outlook.com
 (10.152.77.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.21; Mon, 7 Oct
 2019 14:53:15 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com (10.152.76.51) by
 BL2NAM02FT016.mail.protection.outlook.com (10.152.77.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.21 via Frontend Transport; Mon, 7 Oct 2019 14:53:15 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::9886:cd0c:303:4698]) by MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::9886:cd0c:303:4698%2]) with mapi id 15.20.2327.026; Mon, 7 Oct 2019
 14:53:15 +0000
From: Zheng Bao <fishbaoz@hotmail.com>
To: Oskar Senft <osk@google.com>, Andrew Geissler <geissonator@gmail.com>
Subject: Re: chassis power status seems to not be changed when type command to
 shutdown OS
Thread-Topic: chassis power status seems to not be changed when type command
 to shutdown OS
Thread-Index: AdVY0BhwaA4FVtd3SwOO92uQAtcHFAAMLUQAATm5YgAHzV2v9A==
Date: Mon, 7 Oct 2019 14:53:15 +0000
Message-ID: <MN2PR04MB66695835528F80F235765ED8CD9B0@MN2PR04MB6669.namprd04.prod.outlook.com>
References: <d0c56bc73b384a0f941e5f4b96ddc73a@lenovo.com>
 <CALLMt=rvTV0iUV9hUkXQyMF2yTOBQmfrpjZwqKD2X4LLV11j7A@mail.gmail.com>,
 <CABoTLcSbv4xC0X=5R6pk9vkSG3PFAuO2qHVa72AtqOrSAczZ1g@mail.gmail.com>
In-Reply-To: <CABoTLcSbv4xC0X=5R6pk9vkSG3PFAuO2qHVa72AtqOrSAczZ1g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:1E04D1CDA46C5BB7F261D93BB93BC712539E1D9E0A1A37415D6789FBC12FF2DF;
 UpperCasedChecksum:4A09C43613FEEDAD77E4B5641A516D7493B81D48BEDAA6486CCF6D783689A094;
 SizeAsReceived:7153; Count:45
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [y2CrSg/8LF2Wr6f24jkHUViB2FU+H7ol]
x-ms-publictraffictype: Email
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: BL2NAM02HT174:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZVA66wrJTus9hs+fyf/Ow6TpurzDXAtFJi+TDn3cUpDmeSY+v28h0tHCjyWQa0Gjlsz7rVrog+E1eFcuszpUUfr7Q/BsP7W1RMAjTdVzMJwpJ1YzCTXXcvQqVbcjM8W6hrSNnPvqNGAPShy8bhcdlGwqq159rqO/L6z4KfF8KHkLEj3RWREc3nTHWvObcjY2
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MN2PR04MB66695835528F80F235765ED8CD9B0MN2PR04MB6669namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a096a4bf-0a37-43ca-93eb-08d74b361526
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 14:53:15.0630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT174
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
Cc: Andrew MS1 Peng <pengms1@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_MN2PR04MB66695835528F80F235765ED8CD9B0MN2PR04MB6669namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

How does the "ipmitool power on/off"  do to power on/off the host? I assume=
 it need to trigger the power
button connected to BMC gpio, right? But I am not quite sure about the path=
 which the message goes from ipmitool
to gpio.

What I have got:
1. The gpio defined in machine layer, gpio_defs.json, which is handled by o=
bmc-libobmc-intf.
2. obmc-libobmc-intf is part of "skeleton=93.
    The decription of skeleton on github says "Area for initial design & re=
ference code. Will be replaced with proper implementation and design docs. =
" What does it mean?

Am I on track? Is power on/off gpio handled by skeleton? Thanks.


Can any big boy give some hint? Thanks.

Zheng

________________________________
From: openbmc <openbmc-bounces+fishbaoz=3Dhotmail.com@lists.ozlabs.org> on =
behalf of Oskar Senft <osk@google.com>
Sent: Wednesday, August 28, 2019 9:29 PM
To: Andrew Geissler <geissonator@gmail.com>
Cc: Andrew MS1 Peng <pengms1@lenovo.com>; openbmc@lists.ozlabs.org <openbmc=
@lists.ozlabs.org>
Subject: Re: chassis power status seems to not be changed when type command=
 to shutdown OS

There's also quite a bit of infrastructure on the OpenBMC side that needs t=
o be running to be able for the BMC to actually power on / off the host.

Can you power-on / off the host using "ipmitool power on" / "off" from the =
BMC? If that works, then the host should be able to do the same.

Oskar.

On Thu, Aug 22, 2019 at 11:47 AM Andrew Geissler <geissonator@gmail.com<mai=
lto:geissonator@gmail.com>> wrote:
On Thu, Aug 22, 2019 at 5:01 AM Andrew MS1 Peng <pengms1@lenovo.com<mailto:=
pengms1@lenovo.com>> wrote:
>
> Hi Team,
>
> When I executed command "poweroff" or "shutdown -h" in Host OS, the chass=
is power status seems to not be changed. Is there any package could support=
 update power status for this situation?

Sounds like your host is not sending the inband IPMI message to
the BMC to turn off the chassis once it completes the shutdown?

> Thanks,
>
> Andrew
>
>

--_000_MN2PR04MB66695835528F80F235765ED8CD9B0MN2PR04MB6669namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div>How does the &quot;ipmitool power on/off&quot;&nbsp; do to power on/of=
f the host? I assume it need to trigger the power</div>
<div>button connected to BMC gpio, right? But I am not quite sure about the=
 path which the message goes from ipmitool</div>
<div>to gpio. <br>
</div>
<div><br>
</div>
<div>What I have got:</div>
<div>1. The gpio defined in machine layer, gpio_defs.json, which is handled=
 by obmc-libobmc-intf.</div>
<div>2. obmc-libobmc-intf is part of &quot;skeleton=93. <span><br>
</span></div>
<div><span>&nbsp;&nbsp;&nbsp; The decription of skeleton on github says &qu=
ot;Area for initial design &amp; reference code. Will be replaced with prop=
er implementation and design docs.
</span>&quot; What does it mean? <br>
</div>
<div><br>
</div>
<div>Am I on track? Is power on/off gpio handled by skeleton? Thanks.</div>
<div><br>
</div>
<div><br>
</div>
<div>Can any big boy give some hint? Thanks.</div>
<div><br>
</div>
<div>Zheng<br>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> openbmc &lt;openbmc=
-bounces&#43;fishbaoz=3Dhotmail.com@lists.ozlabs.org&gt; on behalf of Oskar=
 Senft &lt;osk@google.com&gt;<br>
<b>Sent:</b> Wednesday, August 28, 2019 9:29 PM<br>
<b>To:</b> Andrew Geissler &lt;geissonator@gmail.com&gt;<br>
<b>Cc:</b> Andrew MS1 Peng &lt;pengms1@lenovo.com&gt;; openbmc@lists.ozlabs=
.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Subject:</b> Re: chassis power status seems to not be changed when type =
command to shutdown OS</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">There's also quite a bit of infrastructure on the OpenBMC =
side that needs to be running to be able for the BMC to actually power on /=
 off the host.
<div><br>
</div>
<div>Can you power-on / off the host using &quot;ipmitool power on&quot; / =
&quot;off&quot; from the BMC? If that works, then the host should be able t=
o do the same.</div>
<div><br>
</div>
<div>Oskar.</div>
</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Thu, Aug 22, 2019 at 11:47 AM An=
drew Geissler &lt;<a href=3D"mailto:geissonator@gmail.com">geissonator@gmai=
l.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
On Thu, Aug 22, 2019 at 5:01 AM Andrew MS1 Peng &lt;<a href=3D"mailto:pengm=
s1@lenovo.com" target=3D"_blank">pengms1@lenovo.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Team,<br>
&gt;<br>
&gt; When I executed command &quot;poweroff&quot; or &quot;shutdown -h&quot=
; in Host OS, the chassis power status seems to not be changed. Is there an=
y package could support update power status for this situation?<br>
<br>
Sounds like your host is not sending the inband IPMI message to<br>
the BMC to turn off the chassis once it completes the shutdown?<br>
<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Andrew<br>
&gt;<br>
&gt;<br>
</blockquote>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR04MB66695835528F80F235765ED8CD9B0MN2PR04MB6669namp_--
