Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 881962F6F21
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 00:50:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH1Jn1dfvzDsWQ
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 10:50:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.122;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=s80DyuYm; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2122.outbound.protection.outlook.com [40.107.223.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFtln6JSbzDqkV
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 14:51:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oqkhv5V8c7iAliAaPsAu6mwdIaRd//+aLHa45vYs6n6GpVVQrMisxRDKxtd4wSqAWsx0+voWHiVRTR/9BWJnwBT33Xwznpi3+V0gLdHmu8Vr9vQo8PtUyKg5IPvXQzO797602/Z/w8S2tboAgeVNPb4Nn6qRXHrq+q6ZXMqD70lUboDjBZAuoDVeM9LMZNaBqr/scgP3VZm8Gi7tWUtAo/G7TK3W9ypuBIcOIgD6vSenkbsaj3iUlEV84dIyOBO1zXWD5D30yeMk4ewnMZugzfNfD8GdLuonGtXOX7lGi1cwPbhTQAot91vqowze5BCBkAPB821qGEvYA9bnuXp5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Imq++fJNZdvKFoQQG3hod1Jt7OdtRbf9B3CmxpNsZsY=;
 b=fdzIvYfzaOE+dQoPYyRlA+dFZoQzkOAWLqoX3n/wWhEz9AAerGJ4yHeJJEHP6g0KldtToP1GYReBn6HvqSv04I/7dtnLV1ax9n+RsChsbE4k4ZWfGuflq9rsy+dwss5vyS9aHUCWGPJ6DDFGOF1M5wyUHi6U61Hlcbpg1KzfcIYbrzD6xnZix5Emd1DJni0MOPE2rWaTtp7Uvh4Mg7xbWCxVze0X3qkA4Id6EYE/BklFuHCtxEui6pbHrbQqW0aXmfSo+CHhGQ5Vli6orgNI4RYC2Elou71Ba6igoTByzLWeER6nun9JHiFjcmBUd7KPQ0afcjeacEv6vBODl9NJ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Imq++fJNZdvKFoQQG3hod1Jt7OdtRbf9B3CmxpNsZsY=;
 b=s80DyuYmran2/HxPBMAaewiMHa05EDcfLaW7LLprc6gCbo60yA1l9leAm62Eoh8aVPLWqwaaR8zizLqmWiEE0jO2JNVYEg5QwWhjU6Ypd+LqnjwZxIJE6oKYauWnPiNBvM0DaBxU6lbNGsNBRqKhVL1YukQbFp6VruvvfnrczDo=
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 SN6PR01MB5166.prod.exchangelabs.com (2603:10b6:805:b9::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10; Wed, 13 Jan 2021 03:51:08 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::88f5:e350:408d:cdfa]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::88f5:e350:408d:cdfa%6]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 03:51:08 +0000
From: Chanh Nguyen OS <chanh@os.amperecomputing.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Add the ExtendedVersion to MANIFEST file and os-release
Thread-Topic: Add the ExtendedVersion to MANIFEST file and os-release
Thread-Index: AQHW6VpvDDEjc0S4HkeHeERM0/7tsA==
Date: Wed, 13 Jan 2021 03:51:08 +0000
Message-ID: <SN6PR01MB4973E83D23824C0F08258DA595A90@SN6PR01MB4973.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
x-originating-ip: [118.69.219.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f4907dc-a153-4d53-8f68-08d8b77675cc
x-ms-traffictypediagnostic: SN6PR01MB5166:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR01MB5166A61922AF1009CBCA0ED495A90@SN6PR01MB5166.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TO3cRtmy+t2ML51Z1TOXPXMGQYMUO2LpkHqxK7kcIU7OOrl6ZFXeiJN81pASWLRxrXzHVbX0U3TRyo9+E3/DMZWa7ZlMfdtL/QhgUvVxuj7WuzLTlYRn0Koco50Cxe76ShJktqPMxnA2QM8HJIHEuBVfD1B/q+bab5qNRQyicg8Dhr4Yoy0+UH+3/sVK/ZBrkD22qpDGGNeKtgdw929dzQFanmtaKAoOE5bt2RkDe4QE2AlO27OroyrFJx5BovfazehAAC+8yfHkmuJaeizWgnzjakVPO1kobHaGUxg7hhDXcM7mDpHRdwSJ0Kh2ZVtbB2wfagNRWZh8FWhnZ331qROIP4uDhIKWiyBNre24GBYzuPyli4wyoSnBiX6nSMn8s6uHSU/roLkwy/mgEyoUcEv1FaQwTdKRaNaIYxy0D/3T+DGShQqnKb5lMhs6u2LJM78DdcKi/5ZeZdhWo8cuxw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4973.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39850400004)(366004)(376002)(396003)(9686003)(91956017)(107886003)(66946007)(55016002)(966005)(8936002)(66446008)(64756008)(76116006)(66476007)(66556008)(478600001)(6916009)(2906002)(26005)(86362001)(186003)(8676002)(166002)(83380400001)(6506007)(4326008)(4744005)(54906003)(316002)(5660300002)(33656002)(7696005)(71200400001)(19627405001)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?dfMpzYKLC0kNqyZTu++qXajzo829c/U0vyCIkYJP4u00qHCOyCZJbXvUUm?=
 =?iso-8859-1?Q?dDp1twTNy3RDSA8PbDLJOQ6+baDKek/ZgN4qQoAhVR+S8OqEeKCGoSgkYA?=
 =?iso-8859-1?Q?01Gn5s6WDJ9sDRWqfLH2ACM2KH+Yl1LEwBTK5Kx8UPLbfdD3ahAeWDRNsH?=
 =?iso-8859-1?Q?b/Q0OE7vOYW2Rn1/X5OvHb1hAIuNKZmN+ryHuyyUk6K/LtMkSgOAq3QjkA?=
 =?iso-8859-1?Q?KzdOrYqqOrDlGmSWZ85A0elTkhQShZb1KXk2JEvcuHf9PC5ZSFso6mADSU?=
 =?iso-8859-1?Q?utfqS7cIQeaa8nvBUFwGDy0w1GYoF98FblcTg5EWlEr3kyyLzOZPk2ZZQi?=
 =?iso-8859-1?Q?iMZ30whBLGRXU9jbHRSFmlIRTO2wfkvk91OIO093P9p+ZUBLXLLojDrrM5?=
 =?iso-8859-1?Q?Tr0h2HXj8siSecELoAfGN32YxyIjEbpRh79Ic5AuqRcRACJ7D/uaOONq27?=
 =?iso-8859-1?Q?ubrBQVEHED79x3T3m1xNGk7rCCvW0/UPfqAKnHRg2+m1kuKvi2dtsy93Cm?=
 =?iso-8859-1?Q?h2vPs6JxdEVvZnpjWPs7LeCzqNtmWZeB6BA199Jx5vDUwIzVFSm6B4jOyY?=
 =?iso-8859-1?Q?ZGBSMMbWJvRrdElMPuAR0IdPRRVgEStFuuBD6QOjFmUJIHsiieHaJFCeUt?=
 =?iso-8859-1?Q?v3mWvev88CwZEOxKaRB4uOCT5RIqn9+sK2vGW+ftcwaWgZYOupmRfTihDX?=
 =?iso-8859-1?Q?VVvJIr8mYS0qgqjjxJ0H9QSud9wxbwtk3iWY3vJUsBF9Elo1SrDJApF+Oz?=
 =?iso-8859-1?Q?XLQLiKwKK69KQbBQKKIzcz1x10pUGJZV1caZ+W1BrCcnLOSrvwqp7mc/Mq?=
 =?iso-8859-1?Q?2vfrHQJ/lI+rdXAiAcByl5/cf69NNioCFHwwAQRxNwP285g7kXi9EN+hLM?=
 =?iso-8859-1?Q?NQNvtn91DtaUfTuScPpEowz4qTNd/VEDluonZ40ozmXmsHlKUJKC0Vn6fF?=
 =?iso-8859-1?Q?XNQLEgB3ps395tPNG+99udj1wk2yV6uiig4v2Cx+LXzNqtyhjEBMVKvmrg?=
 =?iso-8859-1?Q?0WH/2i4yY1MjvqtkE=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR01MB4973E83D23824C0F08258DA595A90SN6PR01MB4973prod_"
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4907dc-a153-4d53-8f68-08d8b77675cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2021 03:51:08.2080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vz5OIHDiiMmwC6DLFWIhLUHAbd59lJuqyyBg8Y+t5tPkVrNF7zLoH0RiCZXTO0y4d5elQ4US3RM3eTrYOTVLGx7N6OLEjMPW+LkiVExAFExYOXUOl5em1ieE7Mx1Ie8M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB5166
X-Mailman-Approved-At: Fri, 15 Jan 2021 10:48:09 +1100
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
Cc: Phong Vo <pvo@amperecomputing.com>,
 Thang Nguyen <thangqn@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_SN6PR01MB4973E83D23824C0F08258DA595A90SN6PR01MB4973prod_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm supporting the ExtendedVersion in phosphor-bmc-code-mgmt. You can see m=
ore at https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-bmc-code-mgmt/=
+/39406

I would like to add the ExtendedVersion field to the MANIFEST and store at =
os-release. So, I send this mail to discuss the new field name and the valu=
e in MANIFEST, os-release. I suggest


  1.  The new field name in MANIFEST is ExtendedVersion . It will like as:
purpose
version
ExtendedVersion
KeyType
HashType
MachineName
  2.  The new field name in os-release is EXTENDED_VERSION
ID
NAME
VERSION
VERSION_ID
PRETTY_NAME
BUILD_ID
OPENBMC_TARGET_MACHINE
EXTENDED_VERSION
  3.  The "ExtendedVersion" value will be similar to the "MACHINE" field. I=
t is typically set in the openbmc/meta-*/meta-MACHINE/conf/local.conf.sampl=
e file.

Please raise your ideas for this design!

Thank you!
Chanh

--_000_SN6PR01MB4973E83D23824C0F08258DA595A90SN6PR01MB4973prod_
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
<a style=3D"caret-color:rgb(0, 0, 0);font-weight:400;font-family:Times;font=
-size:medium;orphans:2;widows:2;background-color:rgb(255, 255, 255)"></a>Hi=
 all,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I'm supporting the ExtendedVersion in&nbsp;phosphor-bmc-code-mgmt. You can =
see more at&nbsp;<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/ph=
osphor-bmc-code-mgmt/+/39406" id=3D"LPlnk408546">https://gerrit.openbmc-pro=
ject.xyz/c/openbmc/phosphor-bmc-code-mgmt/+/39406</a>&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt; background: var(--white);">I would like to ad=
d the&nbsp;</span><span style=3D"color: rgb(0, 0, 0); font-family: Calibri,=
 Arial, Helvetica, sans-serif; font-size: 12pt;">ExtendedVersion&nbsp;field
 to the MANIFEST and store at os-release. So,&nbsp;</span><span style=3D"co=
lor: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; font=
-size: 12pt; background: var(--white);">I send this mail to discuss the new=
 field name and the value in MANIFEST,&nbsp;os-release.
 I suggest&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color:rgb(0, 0, 0);background-color:rgb(255, 255, 255)=
;display:inline !important"><span class=3D"Apple-converted-space"><br>
</span></span></div>
<div>
<ol>
<li><font color=3D"#000000" face=3D"Calibri, Arial, Helvetica, sans-serif">=
<span style=3D"caret-color: rgb(0, 0, 0);">The new field name in
<b><i>MANIFEST</i></b> is&nbsp;<b><i>ExtendedVersion&nbsp;</i></b>. It will=
 like as:<br>
<span style=3D"color: rgb(33, 33, 33); font-family: &quot;Courier New&quot;=
, monospace; font-size: 14px; orphans: 2; widows: 2; background: var(--whit=
e);">purpose&nbsp;</span><span style=3D"color: rgb(33, 33, 33); font-family=
: Roboto, -apple-system, system-ui, &quot;Segoe UI&quot;, Helvetica, Arial,=
 sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &qu=
ot;Segoe UI Symbol&quot;; font-size: 14px; orphans: 2; widows: 2; backgroun=
d: var(--white);"><br>
</span></span></font><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(3=
3, 33, 33); font-family: &quot;Courier New&quot;, monospace; font-size: 14p=
x; orphans: 2; widows: 2; background: var(--white);">version</span><span st=
yle=3D"caret-color: rgb(0, 0, 0); color: rgb(33, 33, 33); font-family: Robo=
to, -apple-system, system-ui, &quot;Segoe UI&quot;, Helvetica, Arial, sans-=
serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Seg=
oe UI Symbol&quot;; font-size: 14px; orphans: 2; widows: 2; background: var=
(--white);"><br>
</span><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(33, 33, 33); fo=
nt-family: &quot;Courier New&quot;, monospace; font-size: 14px; orphans: 2;=
 widows: 2; background: var(--white);">ExtendedVersion</span><span style=3D=
"caret-color: rgb(0, 0, 0); color: rgb(33, 33, 33); font-family: Roboto, -a=
pple-system, system-ui, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif,=
 &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI =
Symbol&quot;; font-size: 14px; orphans: 2; widows: 2; background: var(--whi=
te);"><br>
</span><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(33, 33, 33); fo=
nt-family: &quot;Courier New&quot;, monospace; font-size: 14px; orphans: 2;=
 widows: 2; background: var(--white);">KeyType&nbsp;</span><span style=3D"c=
aret-color: rgb(0, 0, 0); color: rgb(33, 33, 33); font-family: Roboto, -app=
le-system, system-ui, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &=
quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Sy=
mbol&quot;; font-size: 14px; orphans: 2; widows: 2; background: var(--white=
);"><br>
</span><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(33, 33, 33); fo=
nt-family: &quot;Courier New&quot;, monospace; font-size: 14px; orphans: 2;=
 widows: 2; background: var(--white);">HashType</span><span style=3D"caret-=
color: rgb(0, 0, 0); color: rgb(33, 33, 33); font-family: Roboto, -apple-sy=
stem, system-ui, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;=
Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&=
quot;; font-size: 14px; orphans: 2; widows: 2; background: var(--white);"><=
br>
</span><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(33, 33, 33); fo=
nt-family: &quot;Courier New&quot;, monospace; font-size: 14px; orphans: 2;=
 widows: 2; background: var(--white);">MachineName</span><span style=3D"car=
et-color: rgb(0, 0, 0); color: rgb(33, 33, 33); font-family: Roboto, -apple=
-system, system-ui, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &qu=
ot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symb=
ol&quot;; font-size: 14px; orphans: 2; widows: 2; background: var(--white);=
"><br>
</span></li><li><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0); font-family: calibri, arial, helvetica, sans-serif; font-size: 12pt; ba=
ckground-color: rgb(255, 255, 255); display: inline !important; line-height=
: normal;">The new field name in
<b><i>os-release</i></b> is&nbsp;<i style=3D"font-weight: bold;">EXTENDED_V=
ERSION&nbsp;<br>
</i></span><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); f=
ont-family: &quot;Courier New&quot;, monospace; font-size: 10pt; font-varia=
nt-caps: inherit; line-height: normal;">ID</span><span style=3D"caret-color=
: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: calibri, arial, helvetica=
, sans-serif; font-size: 12pt; font-variant-caps: inherit;"><br>
</span><span style=3D"color: rgb(0, 0, 0); font-family: &quot;Courier New&q=
uot;, monospace; font-size: 10pt; background-color: rgba(0, 0, 0, 0); caret=
-color: rgb(0, 0, 0); line-height: normal;">NAME</span><span style=3D"color=
: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-size: 12pt;=
 background-color: rgba(0, 0, 0, 0); caret-color: rgb(0, 0, 0);"><br>
</span><span style=3D"color: rgb(0, 0, 0); font-family: &quot;Courier New&q=
uot;, monospace; font-size: 10pt; background-color: rgba(0, 0, 0, 0); caret=
-color: rgb(0, 0, 0); line-height: normal;">VERSION</span><span style=3D"co=
lor: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-size: 12=
pt; background-color: rgba(0, 0, 0, 0); caret-color: rgb(0, 0, 0);"><br>
</span><span style=3D"color: rgb(0, 0, 0); font-family: &quot;Courier New&q=
uot;, monospace; font-size: 10pt; background-color: rgba(0, 0, 0, 0); caret=
-color: rgb(0, 0, 0); line-height: normal;">VERSION_ID</span><span style=3D=
"color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-size:=
 12pt; background-color: rgba(0, 0, 0, 0); caret-color: rgb(0, 0, 0);"><br>
</span><span style=3D"color: rgb(0, 0, 0); font-family: &quot;Courier New&q=
uot;, monospace; font-size: 10pt; background-color: rgba(0, 0, 0, 0); caret=
-color: rgb(0, 0, 0); line-height: normal;">PRETTY_NAME</span><span style=
=3D"color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-si=
ze: 12pt; background-color: rgba(0, 0, 0, 0); caret-color: rgb(0, 0, 0);"><=
br>
</span><span style=3D"color: rgb(0, 0, 0); font-family: &quot;Courier New&q=
uot;, monospace; font-size: 10pt; background-color: rgba(0, 0, 0, 0); caret=
-color: rgb(0, 0, 0); line-height: normal;">BUILD_ID</span><span style=3D"c=
olor: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-size: 1=
2pt; background-color: rgba(0, 0, 0, 0); caret-color: rgb(0, 0, 0);"><br>
</span><span style=3D"color: rgb(0, 0, 0); font-family: &quot;Courier New&q=
uot;, monospace; font-size: 10pt; background-color: rgba(0, 0, 0, 0); caret=
-color: rgb(0, 0, 0); line-height: normal;">OPENBMC_TARGET_MACHINE</span><s=
pan style=3D"color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif=
; font-size: 12pt; background-color: rgba(0, 0, 0, 0); caret-color: rgb(0, =
0, 0);"><br>
</span><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-=
family: &quot;Courier New&quot;, monospace; font-size: 10pt; background-col=
or: rgba(0, 0, 0, 0); line-height: normal;">EXTENDED_VERSION</span></li><li=
><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt;=
 line-height: normal;">The</span><span style=3D"font-family: Arial, Helveti=
ca, sans-serif; font-size: 12pt; line-height: normal;"><span style=3D"font-=
weight: 400; text-align: start; color: rgb(33, 33, 33); font-family: Arial,=
 Helvetica, sans-serif; font-size: 12pt; orphans: 2; widows: 2; display: in=
line !important; line-height: normal;">&nbsp;&quot;ExtendedVersion&quot;
 value will be similar to the &quot;MACHINE&quot; field. It is typically se=
t in the openbmc/meta-*/meta-MACHINE/conf/local.conf.sample file.</span></s=
pan><br>
</li></ol>
<div style=3D"orphans: 2; widows: 2;"><font color=3D"#212121" face=3D"Arial=
, Helvetica, sans-serif"><span style=3D"caret-color: rgb(33, 33, 33);">Plea=
se raise your ideas for this design!&nbsp;</span></font></div>
<div style=3D"orphans: 2; widows: 2;"><font color=3D"#212121" face=3D"Arial=
, Helvetica, sans-serif"><span style=3D"caret-color: rgb(33, 33, 33);"><br>
</span></font></div>
<div style=3D"orphans: 2; widows: 2;"><font color=3D"#212121" face=3D"Arial=
, Helvetica, sans-serif"><span style=3D"caret-color: rgb(33, 33, 33);">Than=
k you!</span></font></div>
</div>
<div style=3D"orphans: 2; widows: 2;"><font color=3D"#212121" face=3D"Arial=
, Helvetica, sans-serif"><span style=3D"caret-color: rgb(33, 33, 33);">Chan=
h</span></font></div>
</body>
</html>

--_000_SN6PR01MB4973E83D23824C0F08258DA595A90SN6PR01MB4973prod_--
