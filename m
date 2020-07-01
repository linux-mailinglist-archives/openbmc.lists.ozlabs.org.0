Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 265A0211253
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 20:05:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xpzN3X9DzDqwy
	for <lists+openbmc@lfdr.de>; Thu,  2 Jul 2020 04:05:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.10.67;
 helo=nam04-co1-obe.outbound.protection.outlook.com;
 envelope-from=chasboyer5985@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=atvi43Jk; 
 dkim-atps=neutral
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-oln040092010067.outbound.protection.outlook.com [40.92.10.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xpyX39GVzDqwJ
 for <openbmc@lists.ozlabs.org>; Thu,  2 Jul 2020 04:04:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bF8ZUYJUCZx9LMxhhkXc7FbiUw6nmJyprS33hYpf4HhWp6vQByQQv4wCy0AwPqwWNQjZOfA4yr62mrU72cVxgmFcM2Mw7cLlOep2wK3hBIFvv66+oJVhvxEIw0wxl80MFDZURyNnqoWmg6dsT11f7IDAqBYTpqTQONEPmnuHmZ6LOPYHNPUWYArXumpP1oqyYP3dcd43rsFVKYXeTulhhe0fGASdHX7oldWpFXU/XK1XBT/W9G/l0RGVTzncTEGYUqJCeF7OgxvAeoJG8BeQ61pxUfs8TfU3OsVe3rbrYkRN+HHlqpBkrYkbNmXdjAMz5oZ5uIjnf4HLDk6u9MOr7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrvbalScR7udNkGJtDZ4Bft9/Bb2Yo7qS0fXZ9Xv4b4=;
 b=h1FDYsYYCIV40sTs6blvUo0Rjscz9tvOVzLRq5es5wh6caPtzndJVkpucwxnN3YR1ZYT/VaB4sZjtEIvPcBXIu14eozGLjwwP4LwrFMIgA9WxND2K7VyK0oabhDBVRCO0t8313Q6eA4sPFPXH1zbeMx6UjZlObsO1Tx5ygqH0Dj8PDLFuOPyEEN34GJsfZefmBCLJD8kbNHoPZPGwKjfeFYNqVLnDQ+TnaT46/Pt2Sc3vOCJiX8FxkZADen91chPTuMS8FyNjsvqUY9p0MgGr+1PJyyqGN+qC12NOKXdY92KV4YTSMszlfEE+3PRyKVYYtfAEvR3eWvK7bX/ISnLxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrvbalScR7udNkGJtDZ4Bft9/Bb2Yo7qS0fXZ9Xv4b4=;
 b=atvi43JkH4cxGVSJJctz18hlrjRG+/TQD1F/iymob6Hz2tV7baG4KtkJ+l1EUiEoKQpmWZfPGiUbVsICEgpG8VRBjktczE+m3ilPwedjhcsOJzTymkXiRcKRUHZ0S8R3QqtU/30mgPFc3xR9mPeRm/UuvCO6yV+AovX4s06IKJbyKV6vTKPQgWnNOvcRiM2q/KYrT2Sa0/n3FUCGhb4FQSXvQ2K3AUqLdqFt4LajU8wGxe7sbez2yF0FUNdQEOVLoN8NMrmR+iOQgrmgfLPxrz7PMYOHEU20EtEOe3AgJbVBpJTA+4P8wB3+oYPpghyxGNheNAWz5krYVC4cq77xog==
Received: from BN3NAM04FT016.eop-NAM04.prod.protection.outlook.com
 (10.152.92.55) by BN3NAM04HT189.eop-NAM04.prod.protection.outlook.com
 (10.152.93.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Wed, 1 Jul
 2020 18:04:13 +0000
Received: from SN6PR08MB6062.namprd08.prod.outlook.com
 (2a01:111:e400:7e4e::4d) by BN3NAM04FT016.mail.protection.outlook.com
 (2a01:111:e400:7e4e::161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Wed, 1 Jul 2020 18:04:13 +0000
Received: from SN6PR08MB6062.namprd08.prod.outlook.com
 ([fe80::71cb:6c7a:9e18:e0a2]) by SN6PR08MB6062.namprd08.prod.outlook.com
 ([fe80::71cb:6c7a:9e18:e0a2%4]) with mapi id 15.20.3131.028; Wed, 1 Jul 2020
 18:04:12 +0000
From: Chas Boyer <chasboyer5985@hotmail.com>
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC System FRU EEPROM Configuration Issues
Thread-Topic: OpenBMC System FRU EEPROM Configuration Issues
Thread-Index: AQHWT8i0P7qjVTGohkKuaTncGB/0O6jy9mUQgAAC3TQ=
Date: Wed, 1 Jul 2020 18:04:12 +0000
Message-ID: <SN6PR08MB60629E5D02AF8AB3E35204B9B46C0@SN6PR08MB6062.namprd08.prod.outlook.com>
References: <SN6PR08MB60621BEBE7B8FFC92EFAB9DDB46C0@SN6PR08MB6062.namprd08.prod.outlook.com>,
 <74ad73afb0b14305824a5bcf3d37d8fa@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <74ad73afb0b14305824a5bcf3d37d8fa@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:69C5F7C220C29365945A6826354E753963486E2264659A10718F26C6A8C31E49;
 UpperCasedChecksum:A743FD5C62584446B2B3E136A5BFE61A6501F6B365F05E03FADC4426DF00C547;
 SizeAsReceived:7000; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [M6VnJ0Eg7hEbISkBgF6C2nDMvx2eoXVC]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: d0f8e287-52b9-4165-16fd-08d81de92945
x-ms-traffictypediagnostic: BN3NAM04HT189:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JyCXrgsnuGKzcnQ8wSuCMbiImiTsXaDEVt/orckBhK4QJypHBfOorv1w4Y3V5FIRcTunpo9b9IezoJEo2ejFtV+GJ0KICr5rUP3onuNn+o2z5/cIi26EECJtTTEaBN1OU4h2g0J7YkYVPnamTRdbnNhhHEj8gz5OnSH3lSEA3s9h+3UBlc6H1XmnydvDjVgUaRZEE892qazsPvBe+4oAJ//MLdjUak1t4nnnOjEZz5NRoLP0Du70N5XCg+rZn6uV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR08MB6062.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: Dx3TCSpyL36pE9Sr6juy7ASj6l4cd/4FYm4ztj4o0fk0yMgVMGNRLjogxuiVXqof2Ma7jvZEQ+iz5Orh348Z+Ax8m0zwKi6bzCaK+YFCIYkZ7IS6JSkR7Qq3bJ8k58vbeA2mTb5P+rTNMdlVXJP4Ww==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SN6PR08MB60629E5D02AF8AB3E35204B9B46C0SN6PR08MB6062namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: BN3NAM04FT016.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f8e287-52b9-4165-16fd-08d81de92945
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 18:04:12.8835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3NAM04HT189
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

--_000_SN6PR08MB60629E5D02AF8AB3E35204B9B46C0SN6PR08MB6062namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

Thank you for your response, and please bear with me as I am new to working=
 with how OpenBMC implements the BMC features.

My physical EEPROM has the FRU area and field contents that follow the Plat=
form Management FRU Information Storage Definition v1.0 document. I am conf=
iguring this FRU in OpenBMC without MRW. I would like to know more informat=
ion on how to configure the YAML files for all three FRU areas and their fi=
elds in general. Correct me if I am wrong, but I learned that YAML files co=
nfigure which inventory objects the ipmi-fru-parser is to update for phosph=
or-inventory-manager, and the Inventory Manager objects are used to build t=
he 'virtual' FRU used by FRU IPMI commands in phosphor-host-ipmid. My prima=
ry challenge is configuring the Custom Field in the YAML so that the proper=
ty appears in the Inventory Manager object and prints with ipmitool fru. Th=
e examples I have found configure a custom version, which is not the use of=
 my Custom Field.

If my approach to configuring this FRU in OpenBMC is incorrect, please let =
me know.

Thanks,
Charles

________________________________
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
Sent: Wednesday, July 1, 2020 12:14 PM
To: Chas Boyer <chasboyer5985@hotmail.com>; openbmc@lists.ozlabs.org <openb=
mc@lists.ozlabs.org>
Subject: RE: OpenBMC System FRU EEPROM Configuration Issues


Check here: https://www.intel.com/content/dam/www/public/us/en/documents/sp=
ecification-updates/ipmi-platform-mgt-fru-info-storage-def-v1-0-rev-1-3-spe=
c-update.pdf



--

Bruce





From: openbmc [mailto:openbmc-bounces+bruce_mitchell=3Dphoenix.com@lists.oz=
labs.org] On Behalf Of Chas Boyer
Sent: Wednesday, July 1, 2020 10:11
To: openbmc@lists.ozlabs.org
Subject: OpenBMC System FRU EEPROM Configuration Issues



Hello,



I have a FRU EEPROM to describe Board, Chassis, and Product information of =
the entire system I would like to configure in an OpenBMC project. The FRU =
has the following fields:



Chassis Type

Chassis Part Number

Chassis Serial

Board Mfg Date

Board Mfg

Board Product

Board Serial

Board Part Number

Board Extra

Product Manufacturer

Product Name

Product Part Number

Product Version

Product Serial



Where may I find documentation to configure this type of FRU? I have seen e=
xamples of FRU IDs with 1 or 2 FRU areas (Board, Chassis, or Product), but =
I have not found examples that use all 3 for one FRU ID.



Also, I have a custom board field to configure, and there is a challenge to=
 get the ipmi-fru-parser, phosphor-inventory-manager, and phosphor-host-ipm=
id configured properly to display the field with ipmitool fru print/list co=
mmand. How do I configure the Board Extra field as a Custom Field, and what=
 are my options for D-Bus properties? Examples I have seen configure a Vers=
ion D-Bus property with Custom Field 2 under the xyz.openbmc_project.Invent=
ory.Decorator.Revision interface, but my board custom field is not used as =
a version.



Sincerely,
Charles

--_000_SN6PR08MB60629E5D02AF8AB3E35204B9B46C0SN6PR08MB6062namp_
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
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
Hi Bruce,</div>
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
Thank you&nbsp;for your response, and please bear with me as I am new to wo=
rking with how OpenBMC implements the BMC features.</div>
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
My physical EEPROM has the FRU area and field contents that follow the&nbsp=
;Platform Management FRU Information Storage Definition v1.0 document. I am=
 configuring this FRU in OpenBMC without MRW. I would like to know more inf=
ormation on how to configure the YAML
 files <span style=3D"font-family: &quot;Times New Roman&quot;, serif; back=
ground-color: rgb(255, 255, 255); display: inline !important">
for all three FRU areas and their fields in general</span>. Correct me if I=
 am wrong, but I learned that YAML files configure which inventory objects =
the&nbsp;<span style=3D"font-family: &quot;Times New Roman&quot;, serif; ba=
ckground-color: rgb(255, 255, 255); display: inline !important">ipmi-fru-pa=
rser
 is to update for phosphor-inventory-manager, and the Inventory Manager obj=
ects are used to build the 'virtual' FRU used by FRU IPMI commands in phosp=
hor-host-ipmid. My primary challenge is configuring the Custom Field in the=
 YAML so that the property appears
 in the Inventory Manager object and prints with ipmitool fru. The examples=
 I have found configure a custom version, which is not the use of my Custom=
 Field.</span></div>
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Times New Roman&quot;, serif; background-=
color: rgb(255, 255, 255); display: inline !important"><span style=3D"font-=
family: &quot;Times New Roman&quot;, serif; background-color: rgb(255, 255,=
 255); display: inline !important"></span></span></div>
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Times New Roman&quot;, serif; background-=
color: rgb(255, 255, 255); display: inline !important"><span style=3D"font-=
family: &quot;Times New Roman&quot;, serif; background-color: rgb(255, 255,=
 255); display: inline !important"><br>
</span></span></div>
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Times New Roman&quot;, serif; background-=
color: rgb(255, 255, 255); display: inline !important"><span style=3D"font-=
family: &quot;Times New Roman&quot;, serif; background-color: rgb(255, 255,=
 255); display: inline !important">If my approach to configuring
 this FRU in OpenBMC is incorrect, please let me know.</span></span></div>
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Times New Roman&quot;, serif; background-=
color: rgb(255, 255, 255); display: inline !important"><br>
</span></div>
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Times New Roman&quot;, serif; background-=
color: rgb(255, 255, 255); display: inline !important">Thanks,</span></div>
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Times New Roman&quot;, serif; background-=
color: rgb(255, 255, 255); display: inline !important">Charles</span></div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:&quot;Times New Roman&quot;,Times,serif; font-siz=
e:12pt; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Bruce Mitchell &lt;Br=
uce_Mitchell@phoenix.com&gt;<br>
<b>Sent:</b> Wednesday, July 1, 2020 12:14 PM<br>
<b>To:</b> Chas Boyer &lt;chasboyer5985@hotmail.com&gt;; openbmc@lists.ozla=
bs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Subject:</b> RE: OpenBMC System FRU EEPROM Configuration Issues</font>
<div>&nbsp;</div>
</div>
<div lang=3D"EN-US">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:Consolas; color:#1F497D">Check=
 here: <a href=3D"https://www.intel.com/content/dam/www/public/us/en/docume=
nts/specification-updates/ipmi-platform-mgt-fru-info-storage-def-v1-0-rev-1=
-3-spec-update.pdf">
https://www.intel.com/content/dam/www/public/us/en/documents/specification-=
updates/ipmi-platform-mgt-fru-info-storage-def-v1-0-rev-1-3-spec-update.pdf=
</a></span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:Consolas; color:#1F497D">&nbsp=
;</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:Consolas; color:#1F497D">-- </=
span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:Consolas; color:#1F497D">Bruce=
</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:Consolas; color:#1F497D">&nbsp=
;</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<a name=3D"x__MailEndCompose"><span style=3D"font-size:11.0pt; font-family:=
Consolas; color:#1F497D">&nbsp;</span></a></p>
<div>
<div style=3D"border:none; border-top:solid #B5C4DF 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<b><span style=3D"font-size:10.0pt; font-family:&quot;Tahoma&quot;,&quot;sa=
ns-serif&quot;">From:</span></b><span style=3D"font-size:10.0pt; font-famil=
y:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> openbmc [mailto:openbmc-bounc=
es&#43;bruce_mitchell=3Dphoenix.com@lists.ozlabs.org]
<b>On Behalf Of </b>Chas Boyer<br>
<b>Sent:</b> Wednesday, July 1, 2020 10:11<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> OpenBMC System FRU EEPROM Configuration Issues</span></p>
</div>
</div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
&nbsp;</p>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">Hello,</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">I have a FRU EEPROM to describe Board, Chassis,=
 and Product information of the entire system I would like to configure in =
an OpenBMC project. The FRU has the following fields:</span></p>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">&nbsp;</span></p>
</div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">Chassis Type</span></p>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">Chassis Part Number</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">Chassis Serial</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">Board Mfg Date</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">Board Mfg</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">Board Product</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">Board Serial</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">Board Part Number</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">Board Extra</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">Product Manufacturer</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">Product Name</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">Product Part Number</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">Product Version</span></p>
</div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">Product Serial </span></p>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">Where may I find documentation to configure thi=
s type of FRU? I have seen examples of FRU IDs with 1 or 2 FRU areas (Board=
, Chassis, or Product), but I have not found examples that use all 3 for on=
e FRU ID.</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">&nbsp;</span></p>
</div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">Also, I have a custom board field to configure,=
 and there is a challenge to get the ipmi-fru-parser, phosphor-inventory-ma=
nager, and phosphor-host-ipmid configured properly to display the field wit=
h ipmitool fru print/list command.
 How do I configure the Board Extra field as a Custom Field, and what are m=
y options for D-Bus properties? Examples I have seen configure a Version D-=
Bus property with Custom Field 2 under the xyz.openbmc_project.Inventory.De=
corator.Revision interface, but
 my board custom field is not used as a version.</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">&nbsp;</span></p>
</div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"color:black">Sincerely,<br>
Charles</span></p>
</div>
</div>
</div>
</body>
</html>

--_000_SN6PR08MB60629E5D02AF8AB3E35204B9B46C0SN6PR08MB6062namp_--
