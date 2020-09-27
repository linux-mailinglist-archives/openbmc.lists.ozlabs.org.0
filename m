Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 684FF279DB2
	for <lists+openbmc@lfdr.de>; Sun, 27 Sep 2020 05:19:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BzW8L4LGkzDqQZ
	for <lists+openbmc@lfdr.de>; Sun, 27 Sep 2020 13:18:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.255.77;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=gI1SJhL0; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-oln040092255077.outbound.protection.outlook.com [40.92.255.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BzW7R5zcGzDqJP
 for <openbmc@lists.ozlabs.org>; Sun, 27 Sep 2020 13:18:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFyoJTm4W7E8GfMPO/J2VdQ6HTzd+xSlw37UYbqaaC65nxBbxMGH5fNrJgaJr1ybYbcO3ujDFykYr8gUdWKepQGgQnbGu/HhR/MVL69hmTTFsQoyeEqTFXsGd1/BYu3y2r+GHoX3gsnxj4lEM3QrgSgkx/fuzIYJYLA79Ppu7rLJ2WhmYwc7a/lCtZ6+gg/oVghmqP2qShHFC9a7AhvjNeOyYzmqlJEba7WzLlGt3GghVD5vF+JVExtFVxoLFcNg1aINjG6S5JtQQa9kaVIvEZ5NXGLIWUD9Y3uLK10ZJX0YFBNgTVaBfnqUUOZwSK6zGoGCkROZ5aVuZTCF1ZESSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czRsIm3wy8rqlSJ9D+xnEH+eHYO8wXAJA+zl2iZwRKs=;
 b=JKH7brDDLmWZT3Ezg3VP6DNFEVS3gFx2q/1weIC1+cBk0SSqUKN4bapT93fH1jMUZd1regVQIflySmy6W+dazgOF/92L+3rHnWl/8nVbxtB0hsHvOwELiCbphUKlsbYu5ka7SplFj0BtMHWX2qakoH9ftjNV6XQM+PoOzFEo4uBs+6f4lm1ZVudbFLRS3AuKK5YQIfqVV0O3vKwOSOhr23B6PwD5Wat9nbsGuJO/oaF0pgToRrMzoNOeLoGhHE1R0Rn+bZefWSZA5IXIM3bIXFTevpSJ5mrptp5rEnqO8yCqA/bmGpbUmTbplpI49M1YhUhe6pYECYortfptRC81cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czRsIm3wy8rqlSJ9D+xnEH+eHYO8wXAJA+zl2iZwRKs=;
 b=gI1SJhL0SwzyaxOkdCyCY2rRh4RAkR7UTP6+ZrElkoPL6c7JooTk9rva2SzwfmdUaPRHVES4K5YLul91AUXf4TwoWy+nHV8YoLUv02sIYLyAexmhqWUzy0DRe+Uwzoa1W6gaSse3xbLiNOQpfEIqiBN5oeLZOCGA2BXCq3viCPZMjChxAATL1ZsuqqAw6fsBLt9ls9zjzmtuc2imJTAouW8A/jGCUbEPqpYZbBzyGSRsRfgbmzws6qZheTdNJSMa8yqmGl+0kz4AL9qpFXlNERhclPhHB9B1SQqnvBQegroGHaThtcz0MPzXLmtL2lJYem5envtnNksTSInyQBU1Bw==
Received: from SG2APC01FT056.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::42) by
 SG2APC01HT006.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::206)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.25; Sun, 27 Sep
 2020 03:17:49 +0000
Received: from SY2PR01MB2410.ausprd01.prod.outlook.com (10.152.250.52) by
 SG2APC01FT056.mail.protection.outlook.com (10.152.251.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Sun, 27 Sep 2020 03:17:49 +0000
Received: from SY2PR01MB2410.ausprd01.prod.outlook.com
 ([fe80::952:5429:be97:8c70]) by SY2PR01MB2410.ausprd01.prod.outlook.com
 ([fe80::952:5429:be97:8c70%2]) with mapi id 15.20.3412.022; Sun, 27 Sep 2020
 03:17:49 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: about pid speed control
Thread-Topic: about pid speed control
Thread-Index: AQHWlHzHwZ8YAL1/I0q7ukLRL3P3yA==
Date: Sun, 27 Sep 2020 03:17:49 +0000
Message-ID: <SY2PR01MB2410CFE5E559B0F8CDEA25DDFE340@SY2PR01MB2410.ausprd01.prod.outlook.com>
References: <CAGm54UH407RGGHmrbqUvWDy3ozXx08NQCNiW2E4qs576kwB67g@mail.gmail.com>,
 <HK2PR04MB3826F0E0E2F9CA1A041DFC5DFE610@HK2PR04MB3826.apcprd04.prod.outlook.com>,
 <OF1D7ABF81.CDBAD648-ON002585A5.0017F478-002585A5.0018BAEF@notes.na.collabserv.com>
In-Reply-To: <OF1D7ABF81.CDBAD648-ON002585A5.0017F478-002585A5.0018BAEF@notes.na.collabserv.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:B96131FEDE8D759BDD60902DD7006B02DDE88B725B46AA6A608B3757B0E4FAAD;
 UpperCasedChecksum:BDE2A328F6821EB7B131728CDE9BFE7C2E409BD315B4ED36880FBDA161F654EB;
 SizeAsReceived:6982; Count:44
x-tmn: [QaOPLdP9EHJWCauO/Cj2HzRPaBBiyJH5]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: ae19a97f-3347-41a2-f0bb-08d86293e99d
x-ms-traffictypediagnostic: SG2APC01HT006:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MTayCjTujxSjM/fA4LqfUYpDB5iN1hUqORDDU1v4ks1d3aRZ/455KS9Qv9xD1a1GY/XmMwVSnw0aRHi95bHR9x2MTbiTqfFYCIdl7IXhsSdtYmKFbZbb38JE4nt0bQ9VGLMlMC+BeG0diggjVsX2WuU8UzZZ3CNsCIeS/SR17OiLiIpkpcueDR5GpbfYCaBDU2K86qJU2TOLKM49FADtnQ==
x-ms-exchange-antispam-messagedata: EPkGHEMk8V9q+k9Z7WKQG6X/zD4pquX6qpxbbDp5rbDV3+94fI1mWMTfGyVktKwxginvLCt/mgT9YKaADDPHz4xxlYDr+F097DcK/JQWxuUtfJyfzQaDOLTyIf4D2/3jt8qGkWI9/gPYA2BaVmGnDw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SY2PR01MB2410CFE5E559B0F8CDEA25DDFE340SY2PR01MB2410ausp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT056.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ae19a97f-3347-41a2-f0bb-08d86293e99d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2020 03:17:49.0822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT006
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

--_000_SY2PR01MB2410CFE5E559B0F8CDEA25DDFE340SY2PR01MB2410ausp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgZXZlcnlvbmUsDQoNCiAgICBJIGFkZGVkIHRoZSBwaG9waG9yLXBpZC1jb250cm9sIG1vZHVs
ZSB0byBteSBwcm9qZWN0LiBBZnRlciB0aGUgUElEIG1vZHVsZSB3YXMgc3RhcnRlZCwgdGhlIHB3
bSB2YWx1ZSBvc2NpbGxhdGVkIGJldHdlZW4gMTIgYW5kIDE1My4gSSBkZWxldGVkIG90aGVyIGNv
bmZpZ3VyYXRpb25zIGFuZCBvbmx5IGtlcHQgb25lIGZhbiBhbmQgb25lIHRlbXAuIEkgaGF2ZSBk
ZWJ1Z2dlZCB2YXJpb3VzIFBJRCBwYXJhbWV0ZXIgdmFsdWVzIG9mIGZhbiwgYW5kIHRoZXJlIGlz
IG5vIG9idmlvdXMgY2hhbmdlIGluIHRoZSBwaGVub21lbm9uLiBQbGVhc2UgdGFrZSBhIGxvb2sg
YXQgaXQsIHRoYW5rIHlvdS4NCg0KICAgVGhlIGNvbmZpZ3VyYXRpb24gaXMgYXMgZm9sbG93czoN
Cg0KICAgNDYxMSByb290ICAgICAgNzYxNiBTICAgIC91c3IvYmluL3N3YW1wZCAtdCAtbCAvdG1w
Lw0KDQogICByb290QHN0YXJsYWtlLXNuOn4jIGNhdCAvZXRjL3RoZXJtYWwuZC9zZXRwb2ludA0K
ICAgMzAwMA0KDQogICBjb25maWcuanNvbiBhcyBmb2xsb3c6DQogICB7DQogICAgInNlbnNvcnMi
IDogWw0KICAgICAgICB7DQogICAgICAgICAgICAibmFtZSI6ICJGYW4wX1NwZWVkIiwNCiAgICAg
ICAgICAgICJ0eXBlIjogImZhbiIsDQogICAgICAgICAgICAicmVhZFBhdGgiOiAiL3h5ei9vcGVu
Ym1jX3Byb2plY3Qvc2Vuc29ycy9mYW5fdGFjaC9GYW4wX1NwZWVkIiwNCiAgICAgICAgICAgICJ3
cml0ZVBhdGgiOiAiL3h5ei9vcGVuYm1jX3Byb2plY3Qvc2Vuc29ycy9mYW5fdGFjaC9GYW4wX1Nw
ZWVkIiwNCiAgICAgICAgICAgICJtaW4iOiAwLA0KICAgICAgICAgICAgIm1heCI6IDI1NSwNCiAg
ICAgICAgICAgICJ0aW1lb3V0IjogMA0KICAgICAgICB9LA0KICAgICAgICB7DQogICAgICAgICAg
ICAibmFtZSI6ICJpbmxldF9UZW1wIiwNCiAgICAgICAgICAgICJ0eXBlIjogInRlbXAiLA0KICAg
ICAgICAgICAgInJlYWRQYXRoIjogIi94eXovb3BlbmJtY19wcm9qZWN0L3NlbnNvcnMvdGVtcGVy
YXR1cmUvaW5sZXRfVGVtcCIsDQogICAgICAgICAgICAid3JpdGVQYXRoIjogIiIsDQogICAgICAg
ICAgICAibWluIjogMCwNCiAgICAgICAgICAgICJtYXgiOiAwLA0KICAgICAgICAgICAgImlnbm9y
ZURidXNNaW5NYXgiOiB0cnVlLA0KICAgICAgICAgICAgInRpbWVvdXQiOiAwDQogICAgICAgIH0N
CiAgICBdLA0KICAiem9uZXMiIDogWw0KICAgICAgICB7DQogICAgICAgICAgICAiaWQiOiAxLA0K
ICAgICAgICAgICAgIm1pblRoZXJtYWxPdXRwdXQiOiAzMDAwLjAsDQogICAgICAgICAgICAiZmFp
bHNhZmVQZXJjZW50IjogNzUuMCwNCiAgICAgICAgICAgICJwaWRzIjogWw0KICAgICAgICAgICAg
ICAgIHsNCiAgICAgICAgICAgICAgICAgICAgIm5hbWUiOiAiRmFuMF9TcGVlZCIsDQogICAgICAg
ICAgICAgICAgICAgICJ0eXBlIjogImZhbiIsDQogICAgICAgICAgICAgICAgICAgICJpbnB1dHMi
OiBbIkZhbjBfU3BlZWQiXSwNCiAgICAgICAgICAgICAgICAgICAgInNldHBvaW50IjogNTAuMCwN
CiAgICAgICAgICAgICAgICAgICAgInBpZCI6IHsNCiAgICAgICAgICAgICAgICAgICAgICAgICJz
YW1wbGVQZXJpb2QiOiAwLjEsDQogICAgICAgICAgICAgICAgICAgICAgICAicHJvcG9ydGlvbmFs
Q29lZmYiOiAyMC4wLA0KICAgICAgICAgICAgICAgICAgICAgICAgImludGVncmFsQ29lZmYiOiAw
LjEsDQogICAgICAgICAgICAgICAgICAgICAgICAiZmVlZEZ3ZE9mZnNldENvZWZmIjogMC4wLA0K
ICAgICAgICAgICAgICAgICAgICAgICAgImZlZWRGd2RHYWluQ29lZmYiOiAxLjAsDQogICAgICAg
ICAgICAgICAgICAgICAgICAiaW50ZWdyYWxMaW1pdF9taW4iOiAwLjAsDQogICAgICAgICAgICAg
ICAgICAgICAgICAiaW50ZWdyYWxMaW1pdF9tYXgiOiA1LjAsDQogICAgICAgICAgICAgICAgICAg
ICAgICAib3V0TGltX21pbiI6IDUuMCwNCiAgICAgICAgICAgICAgICAgICAgICAgICJvdXRMaW1f
bWF4IjogNjAuMCwNCiAgICAgICAgICAgICAgICAgICAgICAgICJzbGV3TmVnIjogMC4wLA0KICAg
ICAgICAgICAgICAgICAgICAgICAgInNsZXdQb3MiOiAwLjANCiAgICAgICAgICAgICAgICAgICAg
fQ0KICAgICAgICAgICAgICAgIH0sDQogICAgICAgICAgICAgICAgew0KICAgICAgICAgICAgICAg
ICAgICAibmFtZSI6ICJpbmxldF9UZW1wIiwNCiAgICAgICAgICAgICAgICAgICAgInR5cGUiOiAi
dGVtcCIsDQogICAgICAgICAgICAgICAgICAgICJpbnB1dHMiOiBbImlubGV0X1RlbXAiXSwNCiAg
ICAgICAgICAgICAgICAgICAgInNldHBvaW50IjogNTAuMCwNCiAgICAgICAgICAgICAgICAgICAg
InBpZCI6IHsgICAgICAgICAgICAgICAgICAgICAgYW1wbGVQZXJpb2QiOiAwLjEsDQogICAgICAg
ICAgICAgICAgICAgICAgICAic2FtcGxlUGVyaW9kIjogMS4wLA0KICAgICAgICAgICAgICAgICAg
ICAgICAgInByb3BvcnRpb25hbENvZWZmIjogLTAuMSwNCiAgICAgICAgICAgICAgICAgICAgICAg
ICJpbnRlZ3JhbENvZWZmIjogMS4wLCAgICAgMzY7MzRIaW4iOiA1LjAsDQogICAgICAgICAgICAg
ICAgICAgICAgICAiZmVlZEZ3ZE9mZnNldENvZWZmIjogMC4wLA0KICAgICAgICAgICAgICAgICAg
ICAgICAgImZlZWRGd2RHYWluQ29lZmYiOiAwLjAsDQogICAgICAgICAgICAgICAgICAgICAgICAi
aW50ZWdyYWxMaW1pdF9taW4iOiAwLjAsDQogICAgICAgICAgICAgICAgICAgICAgICAiaW50ZWdy
YWxMaW1pdF9tYXgiOiAwLjAsDQogICAgICAgICAgICAgICAgICAgICAgICAib3V0TGltX21pbiI6
IDMwMDAuMCwNCiAgICAgICAgICAgICAgICAgICAgICAgICJvdXRMaW1fbWF4IjogMTYwMDAuMCwN
CiAgICAgICAgICAgICAgICAgICAgICAgICJzbGV3TmVnIjogMC4wLA0KICAgICAgICAgICAgICAg
ICAgICAgICAgInNsZXdQb3MiOiAwLjAsDQogICAgICAgICAgICAgICAgICAgICAgICAicG9zaXRp
dmVIeXN0ZXJlc2lzIjogMS4wLA0KICAgICAgICAgICAgICAgICAgICAgICAgIm5lZ2F0aXZlSHlz
dGVyZXNpcyI6IDEuMA0KICAgICAgICAgICAgICAgICAgICB9DQogICAgICAgICAgIH0NCiAgICAg
ICAgICAgIF0NCiAgICAgICAgfQ0KICAgIF0NCn0NCg==

--_000_SY2PR01MB2410CFE5E559B0F8CDEA25DDFE340SY2PR01MB2410ausp_
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
Hi everyone,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;&nbsp;I added the phophor-pid-control module to my project. Af=
ter the PID module was started, the pwm value oscillated between 12 and 153=
. I deleted other configurations and only kept one fan and one temp. I have=
 debugged various PID parameter values of fan,
 and there is no obvious change in the phenomenon. Please take a look at it=
, thank you.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(81, 167, 249);">&nbsp;</span><span style=3D"color=
: rgb(81, 167, 249);"> &nbsp;</span><span style=3D"color: rgb(81, 167, 249)=
;">The configuration is as follows</span><span style=3D"color: rgb(81, 167,=
 249);">:&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;4611 root &nbsp; &nbsp; &nbsp;7616 S &nbsp; &nbsp;/usr/bin/swa=
mpd -t -l /tmp/<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;root@starlake-sn:~# cat /etc/thermal.d/setpoint</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;3000</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(81, 167, 249);">&nbsp;</span><span style=3D"color=
: rgb(81, 167, 249);"> &nbsp;config.json as follow:</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;{
<div>&nbsp; &nbsp; &quot;sensors&quot; : [</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;name&quot;: &quot;Fan0=
_Speed&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;type&quot;: &quot;fan&=
quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;readPath&quot;: &quot;=
/xyz/openbmc_project/sensors/fan_tach/Fan0_Speed&quot;, &nbsp;
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;writePath&quot;: &quot=
;/xyz/openbmc_project/sensors/fan_tach/Fan0_Speed&quot;, &nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;min&quot;: 0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;max&quot;: 255,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;timeout&quot;: 0</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;name&quot;: &quot;inle=
t_Temp&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;type&quot;: &quot;temp=
&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;readPath&quot;: &quot;=
/xyz/openbmc_project/sensors/temperature/inlet_Temp&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;writePath&quot;: &quot=
;&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;min&quot;: 0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;max&quot;: 0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;ignoreDbusMinMax&quot;=
: true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;timeout&quot;: 0</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
&nbsp; &nbsp; ],</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &quot;zones&quot; : [
<div>&nbsp; &nbsp; &nbsp; &nbsp; {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;id&quot;: 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;minThermalOutput&quot;=
: 3000.0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;failsafePercent&quot;:=
 75.0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;pids&quot;: [</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&quot;name&quot;: &quot;Fan0_Speed&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&quot;type&quot;: &quot;fan&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&quot;inputs&quot;: [&quot;Fan0_Speed&quot;],</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&quot;setpoint&quot;: 50.0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&quot;pid&quot;: {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;samplePeriod&quot;: 0.1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;proportionalCoeff&quot;: 20.0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;integralCoeff&quot;: 0.1, &nbsp; &nbsp; </div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;feedFwdOffsetCoeff&quot;: 0.0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;feedFwdGainCoeff&quot;: 1.0, &nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;integralLimit_min&quot;: 0.0, </div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;integralLimit_max&quot;: 5.0, </div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;outLim_min&quot;: 5.0, &nbsp; &nbsp; &nbsp; &nbsp;</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;outLim_max&quot;: 60.0, &nbsp; &nbsp; &nbsp; </div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;slewNeg&quot;: 0.0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;slewPos&quot;: 0.0</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&quot;name&quot;: &quot;inlet_Temp&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&quot;type&quot;: &quot;temp&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&quot;inputs&quot;: [&quot;inlet_Temp&quot;], &nbsp; &nbsp; </div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&quot;setpoint&quot;: 50.0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&quot;pid&quot;: { &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;amplePeriod&quot;: 0.1, &nbsp; &nbsp; &nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;samplePeriod&quot;: 1.0, &nbsp; &nbsp; &nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;proportionalCoeff&quot;: -0.1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;integralCoeff&quot;: 1.0, &nbsp; &nbsp; 36;34Hin&quot;:=
 5.0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;feedFwdOffsetCoeff&quot;: 0.0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;feedFwdGainCoeff&quot;: 0.0, &nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;integralLimit_min&quot;: 0.0, </div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;integralLimit_max&quot;: 0.0, </div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;outLim_min&quot;: 3000.0, &nbsp; &nbsp; </div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;outLim_max&quot;: 16000.0, &nbsp; &nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;slewNeg&quot;: 0.0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;slewPos&quot;: 0.0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;positiveHysteresis&quot;: 1.0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &quot;negativeHysteresis&quot;: 1.0 </div>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ]</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; ]</div>
}<br>
</div>
</body>
</html>

--_000_SY2PR01MB2410CFE5E559B0F8CDEA25DDFE340SY2PR01MB2410ausp_--
