Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 033FB3989DF
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 14:43:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw7xf1y4xz2ykQ
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 22:43:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=dSAZYRU4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.253.105;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=dSAZYRU4; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253105.outbound.protection.outlook.com [40.92.253.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw7xG1brzz2yXh
 for <openbmc@lists.ozlabs.org>; Wed,  2 Jun 2021 22:43:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7hlqPsdccvTVrLkJf67vcga83KWHJ2mxW9U+Q6c8vu/Ld1YOFo6sG1sr3uI84g8yozBOibjYhKitg1IHND2JC2hbrDHt6KoRQ8Bs7th2PdDTd/quu2cSZs7rEec98v3DdvmutQwNQu4byVmQqwMaxYwoCB+UDz7wL+jAHN+mRk8iHLDIRqB5Rr4r1zr+q74vm3/9ngPHHGfxDXhRc+pmdnUY5OcpPaJnyxb4VbWRKsu/6FsFsCApaJ9H5mHJwirxd6IYu9UXsZPeHm0jGixibTvU59PbbnUa2vf9OK+qnk95dPYVp/FgVIdK3hYsRHGnEqZO3mEIv19mmeALKH3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfHHYZzvWSv9avlcpWGOoK55npXWtrbEPL81VrHkxKw=;
 b=hdEcN7KHLSCT/t6rrztzS8z3NVOvgqm4e9i+Q+i4ucQIyomTjr9mSma2TK6cITTcIMkCQeNjCE1VnKf4+nd5+PxR6TQbLHRhdMLYa3vijPEfv4X0vVaXlnfsKzcPbNir9q89EOjxI+iXq2nERNfLbYIUPwVbqHHntbPCEPxx00IQLEotbtxTC67VM+8PCApRwfMHY0+586joCvJlWFf+l3srMeToWCTXcnaEtLcyfStJlMuHh5VAuxKTU5pj7tzfu8qiMfIAnoswcJ49UFmNspE99H1ZVWuS63nSwEwavNKMuAg68+PeHjNvhlJGln0QZ/033vtoDjdamfmajevnsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfHHYZzvWSv9avlcpWGOoK55npXWtrbEPL81VrHkxKw=;
 b=dSAZYRU4n04xmGynhJsa4hO51aCqJCMo7CbO+jYw1tRqiZnB/j/q9At9RbJQxMZ/Wpf+Y+HBTnL2wQYwiIto7gBlN/Q82wMgerEvmJqZbzQkM6tTkrcMREuf+2JIvVX+u9CKuULvuyks60nK2SBGFRiPh8uZn0nB18qsHdzTswKBKhqiwK3WI4Sv6aB1xvrWYHJuyIc03uzymwxQtH+0qo0SAzDlI3iJK6CGQIzMBdy8ns1zViXUJMPsNSCoufmqIbOkiwdwd1kPF4s0tBEKMDO+C3VXnZV0fsDY2RgVadlNYb4Vx09zrXZYXm66sSdk9YVyU5nuwOn9s68ebBa5RA==
Received: from SGBP274CA0005.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::17) by
 PU1PR01MB2090.apcprd01.prod.exchangelabs.com (2603:1096:803:1b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Wed, 2 Jun
 2021 12:43:21 +0000
Received: from SG2APC01FT014.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:b0:cafe::8b) by SGBP274CA0005.outlook.office365.com
 (2603:1096:4:b0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Wed, 2 Jun 2021 12:43:21 +0000
Received: from ME2PR01MB5619.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebd::51) by SG2APC01FT014.mail.protection.outlook.com
 (2a01:111:e400:7ebd::188) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.18 via Frontend
 Transport; Wed, 2 Jun 2021 12:43:21 +0000
Received: from ME2PR01MB5619.ausprd01.prod.outlook.com
 ([fe80::80b4:ae94:72b1:f28e]) by ME2PR01MB5619.ausprd01.prod.outlook.com
 ([fe80::80b4:ae94:72b1:f28e%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 12:43:20 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: cannot modify the files in the overlay file system
Thread-Topic: cannot modify the files in the overlay file system
Thread-Index: AQHXV6uD29Fm3xLyEUW53rfibtpLwg==
Date: Wed, 2 Jun 2021 12:43:20 +0000
Message-ID: <ME2PR01MB56196A14C09EA4391F4C04E0FE3D9@ME2PR01MB5619.ausprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:38CBD1E543F00CCA9EB991C8462DA43C00F6208AA57D3CE5B09FF990A6F596FD;
 UpperCasedChecksum:9D8A4E4057D4A87ACA18356E49E77B619F24944F84D86F2A68C122595DAD42F4;
 SizeAsReceived:6687; Count:42
x-tmn: [B4NkXKD0bN6RgmfIddKIDYmrBrkgRf1y]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 72a84b7f-a680-4bcd-3338-08d925c400c5
x-ms-traffictypediagnostic: PU1PR01MB2090:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pT/+uDkMKcLQZ0NSBd8YJkDNz8qzt2QJFOF9dDsqI59uMqCyfTf32xA99tfuS5mXQKWFnuSbqx1vBZ0R6SIo0owRDcTgEA4LnKfaEtc3+SZmWkU9QBNuMDkw9Rt8UCNAR//2m4pziTYaW06Fscsk9YDtn85BDN3VSrHoO0umnPljNxpUrN13HcUNv/kYFVHoGK/qjNheHiDlGFssK27hwuzZS4+apLmMICyKMOX9VsrbBi802JPZ0SGEbMpd1lkh13/q04mzHjxm4W2mfnn+51quMcgr1SxG6tco6q6vwfgwUTNI7DAEldkNZ57bcAzorafObd4P8C1g/re9nNasBx0N0ged5PB70s2xiUgbWgzUFf6QJowHFBUIO5fVAJZXa6G9AEDro6ZhAwsWi13kvg==
x-ms-exchange-antispam-messagedata: xidPHDKgGQNBGbwqkIzQ3xR9aUnniqbkcQ/BUn20rC8pRxl5uZDnw4BgZS3KYTfupWZmExoQbPvOUvVBHaWvBVDzwtgb0+SRlQB3Z4mjgCbBoc3rmtZlefrgkCeoFg4pA3cLZe/rsuhvaLInG+bjwg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_ME2PR01MB56196A14C09EA4391F4C04E0FE3D9ME2PR01MB5619ausp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT014.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a84b7f-a680-4bcd-3338-08d925c400c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 12:43:20.5809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR01MB2090
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

--_000_ME2PR01MB56196A14C09EA4391F4C04E0FE3D9ME2PR01MB5619ausp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgVGVhbaOsDQoNCiAgIG1vdW50IGNvbW1hbmQgaXMgZm9sbG93Og0KDQptb3VudCAtdCBvdmVy
bGF5IG92ZXJsYXkgLW8gcmVkaXJlY3RfZGlyPW9uLGluZGV4PW9uLGxvd2VyZGlyPS9ydW4vaW5p
dHJhbWZzL3JvL3Vzci9iaW4sdXBwZXJkaXI9L3J1bi9pbml0cmFtZnMvcncvY293MSx3b3JrZGly
PS9ydW4vaW5pdHJhbWZzL3J3L3dvcmsxIC9ydW4vaW5pdHJhbWZzL3J3L21lcmdlZA0KDQogICBB
ZnRlciBJIG1vdW50ZWQgdGhlIG92ZXJsYXkgZmlsZSBzeXN0ZW0gLCBJIHVzZWQgdmkgdG8gb3Bl
biB0aGUgZmlsZSAodmkgeHh4LnNoKSBpbiB0aGUgbWVyZ2VkIGRpcmVjdG9yeSwgYW5kIHRoZW4g
d2hlbiBJIHNhdmVkIGl0LCBpdCBwcm9tcHRlZCAiJ3h4eC5zaCBJbnZhbGlkIGFyZ3VtZW50Ii4g
Q2FuIHlvdSBoZWxwIG1lIHNvbHZlIHRoaXMgcHJvYmxlbT8NCg0KICAgT24gbXkgc3lzdGVtLCB0
aGlzIHByb2JsZW0gb2NjdXJzIHByb2JhYmlsaXN0aWNhbGx5IG9uIG9wZW5ibWMgMi44LjAsIGFu
ZCB0aGUgcHJvYmFiaWxpdHkgaXMgdmVyeSBsb3c7IGJ1dCBvbiBvcGVuYm1jIDIuOS4wLCBpdCBt
dXN0IG9jY3VyLg0KDQogICBvcGVuYm1jIHJlbGVhc2UgdmVyc2lvbiA6Mi45LjANCiAgIGtlcm5l
bCB2ZXJzaW9uo7o1LjEwLjE0oaMNCg0KVGhhbmt5b3UuDQoNCmhhcmxleQ0K

--_000_ME2PR01MB56196A14C09EA4391F4C04E0FE3D9ME2PR01MB5619ausp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Team=A3=AC</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;mount command is follow:
<p style=3D"margin:0.0px 0.0px 0.0px 0.0px;font:12.0px 'PingFang SC'">mount=
 -t overlay overlay -o
<span style=3D"font:14.0px 'PingFang SC';font-kerning:none;background-color=
:#ffffff">
redirect_dir=3Don,index=3Don,</span>lowerdir=3D/run/initramfs/ro/usr/bin,up=
perdir=3D/run/initramfs/rw/cow1,workdir=3D/run/initramfs/rw/work1 /run/init=
ramfs/rw/merged<span class=3D"Apple-converted-space">&nbsp;</span></p>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;After I mounted the overlay file system , I used vi to open th=
e file (vi xxx.sh) in the merged directory, and then when I saved it, it pr=
ompted &quot;'xxx.sh Invalid argument&quot;. Can you help me solve this pro=
blem?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;On my system, this problem occurs probabilistically on openbmc=
 2.8.0, and the probability is very low; but on openbmc 2.9.0, it must occu=
r.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;openbmc release version :2.9.0</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;kernel version=A3=BA5.10.14=A1=A3</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thankyou.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
harley</div>
</body>
</html>

--_000_ME2PR01MB56196A14C09EA4391F4C04E0FE3D9ME2PR01MB5619ausp_--
