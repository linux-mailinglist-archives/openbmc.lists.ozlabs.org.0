Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC712111A9
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 19:11:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xnnb4W70zDr45
	for <lists+openbmc@lfdr.de>; Thu,  2 Jul 2020 03:11:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.41.20;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=chasboyer5985@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=uvzayPd5; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10olkn2020.outbound.protection.outlook.com [40.92.41.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xnmd6Yq3zDqml
 for <openbmc@lists.ozlabs.org>; Thu,  2 Jul 2020 03:10:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRYgKe9QSPpFgFL8URj3LhKpmvzN6D1Qh3pqVRXmE2k+DGHLLz7JonaDQYsgAF5XBbiqr5LcZtGjgY17tIx4DLMngegcI8rbn59F7+VsQGZZE/qDsfOIlGjnE1LAtK5IGLOL0hWs6sMRlB2AbMS1Y9U2Wppb+4PN+gaGBYH7tBXhJlbC3WVKgN1/ZvYueRqBw0Cl6OoGNeZxUrv5Fd/7Oq4Y1Pzep7Ymr6r4I3M8CRsfTHojzZNLF6gkMrsLA9oA+B6RqHs3uGl38JBedBLC2Zl9TZXYIBmVd0gOEwpSYS3lkU503LEuL6Wi86mePFeLE/tEmo4E5/rg9rQc5+kcfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSjtM8ynB+bYxYJGtp/AfLLcQsSlsHruu7nH2hBF1EY=;
 b=c86lom7BqKYa5hGSqu/kEUZUq7UQm35elQKDMRPLs8Njkelv4lMB3dz44ugI7IXCMO0JLtwoKVh7+/zKOVVsD2ZTj88GTJNv+EZ0umhD29nSE5tJkX3pcHNkpe8QkR8+Bwl3oUFlvIxdfTs3m0BYnd1zVFSKK7m+RjnFjQjayrj9Wq6hW+b7lm3o/VV8dkNvujA4iolkCWXILWXl3N7lZfVyK40+wSwjep3APLVHlwjJgg+PmT8pTSFT/HJInZnFUYFsOcdcKTBoxGcLuzch43u7puCK3PjQOBkzzdh7s2pz+bLCHnSmuWX+mymNDHZHR6RMIg58G1ijFZK2jjme/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSjtM8ynB+bYxYJGtp/AfLLcQsSlsHruu7nH2hBF1EY=;
 b=uvzayPd59T/qia4cQllWCcGBkhc+2oz8FOEZ/V6OdjmckzsO/BBBlnWBvnTfcrGN6E7mVwSlE66YvVYpn/av0mrhCkPAXyo38tncOJ93Mne66nx/U90Xy/3fLWi0YeptFqvd3xfaUzt7/QHP78Zv8GBpNy4+jhhzXcrpntMjgxNRoCK0tedrFpkOFgQG0bIuuHeOJ9M89Pp4ki/dZh3m8kLqLk4Alvzb0mmti+/NOaPn+Px1Lp8d4+8YyaPn8ozrs/1+GuldbH4+g5Fpjr7A+/33fVFk1lAsSwpfdd5YtDpSpJH+zTZNNJu3N5/34a/jNILYeeUivGdQrYwa0YeP7g==
Received: from BN7NAM10FT055.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e8f::52) by
 BN7NAM10HT186.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e8f::116)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Wed, 1 Jul
 2020 17:10:35 +0000
Received: from SN6PR08MB6062.namprd08.prod.outlook.com
 (2a01:111:e400:7e8f::47) by BN7NAM10FT055.mail.protection.outlook.com
 (2a01:111:e400:7e8f::188) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Wed, 1 Jul 2020 17:10:34 +0000
Received: from SN6PR08MB6062.namprd08.prod.outlook.com
 ([fe80::71cb:6c7a:9e18:e0a2]) by SN6PR08MB6062.namprd08.prod.outlook.com
 ([fe80::71cb:6c7a:9e18:e0a2%4]) with mapi id 15.20.3131.028; Wed, 1 Jul 2020
 17:10:34 +0000
From: Chas Boyer <chasboyer5985@hotmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC System FRU EEPROM Configuration Issues
Thread-Topic: OpenBMC System FRU EEPROM Configuration Issues
Thread-Index: AQHWT8i0P7qjVTGohkKuaTncGB/0Ow==
Date: Wed, 1 Jul 2020 17:10:34 +0000
Message-ID: <SN6PR08MB60621BEBE7B8FFC92EFAB9DDB46C0@SN6PR08MB6062.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:424487118ACFFFFD1DE19AF8FFCC4D6ED980CDAEFD05E07CC0A5F1D7EA071B98;
 UpperCasedChecksum:2B5C333060677C0BA5C57E8E94578BC13839E1887C308C77D51348331D55DC1A;
 SizeAsReceived:6673; Count:41
x-tmn: [MYj5kpSURzk0rNpZtrdZgGnpcddb77OL]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 1c5049a4-1764-4bfb-1340-08d81de1ab0a
x-ms-traffictypediagnostic: BN7NAM10HT186:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NIOkmi/+u/CgPTwTJYpwI5MBlxru+cBL3Sktiymg2JgiSylRvAxRi248xkGOhTUAix1+amcJpqr9aO4o9tvupMwtU8vIvqHSF+iK+rktlWiL7sQZ5uRokmjUyrFounS5tSRUiMFRbQYTYxCoKcBPok+o9iVg2y6UxHU5YMHIvz8B7ABAB3PRGNoE18OSYOgj4f/hkQew2oISb/Q5vhZ/0g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR08MB6062.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: XKTtpzcYfuTfdLrwkplWxPpw9lqBUTTX7fAQXacnYDzvp/jrCyJvPqu76aVdz11i3pXaEPOmshiMVFMXTblgZa1ZKKmMIGlvs+tMzX5ufquHpgET5hol4RG/YJYgCvMrXxWkIbKslLpI9D/d2fbzkg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SN6PR08MB60621BEBE7B8FFC92EFAB9DDB46C0SN6PR08MB6062namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT055.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5049a4-1764-4bfb-1340-08d81de1ab0a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 17:10:34.6387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7NAM10HT186
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

--_000_SN6PR08MB60621BEBE7B8FFC92EFAB9DDB46C0SN6PR08MB6062namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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

--_000_SN6PR08MB60621BEBE7B8FFC92EFAB9DDB46C0SN6PR08MB6062namp_
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
Hello,</div>
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<span>I have a FRU EEPROM to describe Board, Chassis, and Product informati=
on of the entire system I would like to configure in an OpenBMC project. Th=
e FRU has the following fields:<br>
</span>
<div><br>
</div>
<div></div>
<span>Chassis Type<br>
</span>
<div>Chassis Part Number<br>
</div>
<div>Chassis Serial<br>
</div>
<div>Board Mfg Date<br>
</div>
<div>Board Mfg<br>
</div>
<div>Board Product<br>
</div>
<div>Board Serial<br>
</div>
<div>Board Part Number<br>
</div>
<div>Board Extra<br>
</div>
<div>Product Manufacturer<br>
</div>
<div>Product Name<br>
</div>
<div>Product Part Number<br>
</div>
<div>Product Version<br>
</div>
<span>Product Serial</span>
<div><br>
</div>
<div>Where may I find documentation to configure this type of FRU? I have s=
een examples of FRU IDs with 1 or 2 FRU areas (Board, Chassis, or Product),=
 but I have not found examples that use all 3 for one FRU ID.</div>
<div><br>
</div>
<span>Also, I have a custom board field to configure, and there is a challe=
nge to get the ipmi-fru-parser, phosphor-inventory-manager, and phosphor-ho=
st-ipmid configured properly to display the field with ipmitool fru print/l=
ist command. How do I configure
 the Board Extra field as a Custom Field, and what are my options for D-Bus=
 properties? Examples I have seen configure a Version D-Bus property with C=
ustom Field 2 under the xyz.openbmc_project.Inventory.Decorator.Revision in=
terface, but my board custom field
 is not used as a version.</span><br>
</div>
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<span>Sincerely,<br>
Charles</span></div>
</body>
</html>

--_000_SN6PR08MB60621BEBE7B8FFC92EFAB9DDB46C0SN6PR08MB6062namp_--
