Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFE72A2CFA
	for <lists+openbmc@lfdr.de>; Mon,  2 Nov 2020 15:28:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPwJk726rzDqBg
	for <lists+openbmc@lfdr.de>; Tue,  3 Nov 2020 01:28:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.253.24;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=sgYKXSPN; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253024.outbound.protection.outlook.com [40.92.253.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPwF91SrzzDqRf
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2020 01:25:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPkHn5m2E9wxyXYxstFFAr7H2APKl4nsyDBqjMOHLSJ4bq5wxBzPd1GGZ7omEKwsNdbI1RhSp640VONoc9YeiyzVewTNpFgGU+XxfcLqQux8lfDGL8puTNPMlc5HJXcOn/TIuYktIiZs4MY0c9McUDXFFXoHXPzB1OtAwHsfo6JW6k4hzO9v067oBOP28yfPbwRNZzzSmaQJ3KrYB/MMwwLkonYKDipwmWAqRdXTFiVIOFfE4YtWapO3d+P+cl3eMM0k8ngVnFVBw7Gqcrfqt/+eUOXyNen2YpvEoUMnJ3Xs+4QoNMzLZXCBBMCixjJh86ew+uxNeoRiaB966/mKww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZby3i9zELBDuSYvZ2JQ0QtDML0kQklvCEVc7CsK4js=;
 b=NBxtUoCDT3ZKI9XN1RK/r9uCX1UfxIEPDIA90p/wNFi1+5Jr4j+BFgzrrC4dXeNRp92/NnD3hYeeSicDTPR2AZ9/h8aDGl/cyfhLCAHrqopCDGBX3mS72aejt9Eio1M1+dIOAxjH69rmTLB7KBgYLc2VnZCDCrNCZ9pPQvWCFP5zNt0HX8yzcYPifKYClvSYn7yQGKZUWc7+DpkQbbmCKyqyTWUdZBcrop18W6XHATsCYLJNsT++9ulfkUaIkdvUvJVdR+RmVyeG9ATfaSrjITxVtzLjI6bBSmMUm+iI7eQCcm1m2hv6gGxkwk6EmZInwnzdfh42Qv16ypsBZxtkYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZby3i9zELBDuSYvZ2JQ0QtDML0kQklvCEVc7CsK4js=;
 b=sgYKXSPN5yCfEr1R783TvMaFhsiuMKE27SfGNvSKXnBStm8FORUQQ7OKwJcjb7bvWcCxq+aYgdxFqUsPw0s30wMyfZKd7D/nS728jWSHd3h3bfSSLpIvNLFFLEqtsgDD/9/GQqwz1JCWGrGQ5LDvAQdtrREZJhr6zg6gcdGdCRBY4c5C1QttfAWDkY0gOOnX59RIAt6Relc6/vOsOZc+FSRi8CklNK8us7BVqB6rBoknXNbBqyLy2kydaMGGcBTslZ6sl4EdmvRXLxWyfnHwwELHs5aZ0rN0C8y0n67Y09igIEL56pm26WaZKrV2bGuB7xs5IbyPX3GHfodUhJDGTg==
Received: from SG2APC01FT034.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::49) by
 SG2APC01HT141.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::363)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3520.15; Mon, 2 Nov
 2020 14:25:41 +0000
Received: from MEAPR01MB3335.ausprd01.prod.outlook.com (10.152.250.60) by
 SG2APC01FT034.mail.protection.outlook.com (10.152.250.204) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Mon, 2 Nov 2020 14:25:41 +0000
Received: from MEAPR01MB3335.ausprd01.prod.outlook.com
 ([fe80::48f:b699:9fb2:52d0]) by MEAPR01MB3335.ausprd01.prod.outlook.com
 ([fe80::48f:b699:9fb2:52d0%6]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 14:25:41 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: =?gb2312?B?u9i4tDogYWxsIGRpc2NyZXRlIHNlbnNvciBzaG93cyBuYQ==?=
Thread-Topic: all discrete sensor shows na
Thread-Index: AQHWryxt+3AP5Ft2cUyUGo53J0xAkam05s2p
Date: Mon, 2 Nov 2020 14:25:41 +0000
Message-ID: <MEAPR01MB3335C126F3491EB6F3100755FE100@MEAPR01MB3335.ausprd01.prod.outlook.com>
References: <MEAPR01MB3335EABEA5565F42170CB4F2FE120@MEAPR01MB3335.ausprd01.prod.outlook.com>
In-Reply-To: <MEAPR01MB3335EABEA5565F42170CB4F2FE120@MEAPR01MB3335.ausprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:D2A3B95D7F41AD982CAEC3A23C8BCC4D6D31C2D850BF815F9DBA4A026A386C98;
 UpperCasedChecksum:F4D7051DBF0187C36B69E942606686C4F0840B4DC30D73C62A67F9D591B7899F;
 SizeAsReceived:6870; Count:44
x-tmn: [m2aaVfS3y3HQNcVgStC//v0tYGS1vA8i]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 7fdaba2b-3e61-44c6-555a-08d87f3b2d95
x-ms-traffictypediagnostic: SG2APC01HT141:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2It3o19DTvc5z+d1WhIaVM1c7pOqL4mJvKZbZHPXIhwlZgn+jNKIjCIBloMFw6z2yBSkXyD8FGfN9UH6p++j1p9HKnh09okeB7oKf0joljTCCJRf1fAyBR3boxhAUl5vJUnGsO+KGPsg5Rr9zYaXOgewVp1Z2YKQqxQVi/xqj7mi93S0eonDYI3hZwNrd2wFqUNVl5e3lllW0vn/wrfN4A==
x-ms-exchange-antispam-messagedata: ss4tCf6rL6zF0m7jjRxPBqi07gZoMHR3UYoGHj2CLQfegHjUVGU1ig4KC0qIl/ONlPxV//KQ6oBzmafZOnlZzLLNlceLrGg0W0EWMV8fB5rua9msmF6WSf+lhrFuYjDl1hl720ZWwM6NBsGyIv1JTQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MEAPR01MB3335C126F3491EB6F3100755FE100MEAPR01MB3335ausp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT034.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fdaba2b-3e61-44c6-555a-08d87f3b2d95
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2020 14:25:41.6395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT141
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

--_000_MEAPR01MB3335C126F3491EB6F3100755FE100MEAPR01MB3335ausp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGksDQoNCkFmdGVyIEkgZW5hYmxlIHRoZSByZWFkIHNlbnNvciBpbnRlcmZhY2UgaW4gdGhlIGNv
ZGUgYmVsb3csIHRoZSB2YWx1ZSBvZiB0aGUgZGlzY3JldGUgc2Vuc29yIGNhbiBiZSByZWFkLiBJ
IHRoaW5rIHRoZXJlIHNob3VsZCBiZSBhIHBsYWNlIGluIHRoZSBpcG1pZCBjb2RlLiBBZnRlciBh
IGNlcnRhaW4gY29uZGl0aW9uIGlzIGRldGVjdGVkLCB0aGUgc2Vuc29yIHdpbGwgYmUgZW5hYmxl
ZC4gQ2FuIHNvbWVvbmUgcGxlYXNlIGhlbHAgZ3VpZGUgdGhlIG9wZXJhdGlvbiBvZiB0aGUgZW5h
YmxlIHNlbnNvcj8gV2hlcmUgaXMgdGhlIGNvZGU/DQoNCiBpcG1pU2Vuc29yR2V0U2Vuc29yUmVh
ZGluZyh1aW50OF90IHNlbnNvck51bSkNCnsNCiAgICBpZiAoc2Vuc29yTnVtID09IDB4RkYpDQog
ICAgew0KICAgICAgICByZXR1cm4gaXBtaTo6cmVzcG9uc2VJbnZhbGlkRmllbGRSZXF1ZXN0KCk7
DQogICAgfQ0KDQogICAgY29uc3QgYXV0byBpdGVyID0gaXBtaTo6c2Vuc29yOjpzZW5zb3JzLmZp
bmQoc2Vuc29yTnVtKTsNCiAgICBpZiAoaXRlciA9PSBpcG1pOjpzZW5zb3I6OnNlbnNvcnMuZW5k
KCkpDQogICAgew0KICAgICAgICByZXR1cm4gaXBtaTo6cmVzcG9uc2VTZW5zb3JJbnZhbGlkKCk7
DQogICAgfQ0KICAgIGlmIChpcG1pOjpzZW5zb3I6Ok11dGFiaWxpdHk6OlJlYWQgIT0NCiAgICAg
ICAgKGl0ZXItPnNlY29uZC5tdXRhYmlsaXR5ICYgaXBtaTo6c2Vuc29yOjpNdXRhYmlsaXR5OjpS
ZWFkKSkNCiAgICB7DQogICAgICAgIHJldHVybiBpcG1pOjpyZXNwb25zZUlsbGVnYWxDb21tYW5k
KCk7DQogICAgfQ0KDQogICAgdHJ5DQogICAgew0KICAgICAgICBpcG1pOjpzZW5zb3I6OkdldFNl
bnNvclJlc3BvbnNlIGdldFJlc3BvbnNlID0NCiAgICAgICAgICAgIGl0ZXItPnNlY29uZC5nZXRG
dW5jKGl0ZXItPnNlY29uZCk7DQoNCiAgICAgICAgZW5hYmxlU2Nhbm5pbmcoJnJlc3BvbnNlKTsN
Cg0KICAgICAgICByZXR1cm4gaXBtaTo6cmVzcG9uc2VTdWNjZXNzKGdldFJlc3BvbnNlLnJlYWRp
bmcsIHVpbnQ1X3QoMCksDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2V0
UmVzcG9uc2UucmVhZGluZ09yU3RhdGVVbmF2YWlsYWJsZSwNCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBnZXRSZXNwb25zZS5zY2FubmluZ0VuYWJsZWQsDQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2V0UmVzcG9uc2UuYWxsRXZlbnRNZXNzYWdlc0Vu
YWJsZWQsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2V0UmVzcG9uc2Uu
dGhyZXNob2xkTGV2ZWxzU3RhdGVzLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGdldFJlc3BvbnNlLmRpc2NyZXRlUmVhZGluZ1NlbnNvclN0YXRlcyk7DQogICAgfQ0KDQpo
YXJsZXkNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6IG9wZW5ibWMg
PG9wZW5ibWMtYm91bmNlcyt6aG91eXVhbnFpbmc4PW91dGxvb2suY29tQGxpc3RzLm96bGFicy5v
cmc+ILT6se0g1twg1LbH5SA8emhvdXl1YW5xaW5nOEBvdXRsb29rLmNvbT4NCreiy83KsbzkOiAy
MDIwxOoxMNTCMzHI1SAxMDozMQ0KytW8/sjLOiBvcGVuYm1jIDxvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmc+DQqzrcvNOiB1cGVyaWNAMTYzLmNvbSA8dXBlcmljQDE2My5jb20+DQrW98ziOiBhbGwg
ZGlzY3JldGUgc2Vuc29yIHNob3dzIG5hDQoNCkhpLA0KDQogICBJIGFkZGVkIHNvbWUgZGlzY3Jl
dGUgc2Vuc29ycyB0byBvcGVuYm1jLCBidXQgSSB1c2VkIHRoZSBpcG1pdG9vbCBjb21tYW5kIHRv
IHF1ZXJ5IGFuZCBmb3VuZCB0aGF0IGFsbCBkaXNjcmV0ZSBzZW5zb3JzIGRpc3BsYXllZCBuYS4g
UGxlYXNlIGhlbHAgYW5kIGd1aWRlLCB0aGFuayB5b3UuIEV4YW1wbGVzIGFyZSBhcyBmb2xsb3dz
Lg0KDQpGOlxpcG1pdG9vbCB2MS44LjE4PmlwbWl0b29sLmV4ZSAtSSBsYW5wbHVzIC1DIDE3IC1I
IDE3Mi4xNi45MC4xNzIgLVUgcm9vdCAtUCAwcGVuQm1jIHNlbnNvciBsaXN0DQpQb3dlckRyb3Ag
ICAgICAgIHwgbmEgICAgICAgICB8IGRpc2NyZXRlICAgfCBuYSAgICB8IG5hICAgICAgICB8IG5h
ICAgICAgICB8IG5hICAgICAgICB8IG5hICAgICAgICB8IG5hICAgICAgICB8IG5hDQoNCkY6XGlw
bWl0b29sIHYxLjguMTg+aXBtaXRvb2wuZXhlIC1JIGxhbnBsdXMgLUMgMTcgLUggMTcyLjE2Ljkw
LjE3MiAtVSByb290IC1QIDBwZW5CbWMgc2Vuc29yIGdldCBQb3dlckRyb3ANCkxvY2F0aW5nIHNl
bnNvciByZWNvcmQuLi4NClNlbnNvciBJRCAgICAgICAgICAgICAgOiBQb3dlckRyb3AgICgweDI4
KQ0KIEVudGl0eSBJRCAgICAgICAgICAgICA6IDcuMQ0KIFNlbnNvciBUeXBlIChEaXNjcmV0ZSk6
IFBvd2VyIFN1cHBseQ0KIFVuYWJsZSB0byByZWFkIHNlbnNvcjogRGV2aWNlIE5vdCBQcmVzZW50
DQoNCkkgaGF2ZSBjaGVja2VkIHRoZSBkYnVzIGludGVyZmFjZSBjb3JyZXNwb25kaW5nIHRvIFBv
d2VyRHJvcCwgYW5kIGl0IGNhbiBiZSBzZXQgYW5kIGlucXVpcmVkIHRocm91Z2ggdGhlIGJ1c2N0
bCBjb21tYW5kOw0KDQpUaGFua3lvdSENCg0KaGFybGV5Lg0K

--_000_MEAPR01MB3335C126F3491EB6F3100755FE100MEAPR01MB3335ausp_
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
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
After I enable the read sensor interface in the code below, the value of th=
e discrete sensor can be read. I think there should be a place in the ipmid=
 code. After a certain condition is detected, the sensor will be enabled. C=
an someone please help guide the
 operation of the enable sensor? Where is the code?<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp;ipmiSensorGetSensorReading(uint8_t sensorNum)
<div>{</div>
<div>&nbsp; &nbsp; if (sensorNum =3D=3D 0xFF)</div>
<div>&nbsp; &nbsp; {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; return ipmi::responseInvalidFieldRequest()=
;</div>
<div>&nbsp; &nbsp; }</div>
<div><br>
</div>
<div>&nbsp; &nbsp; const auto iter =3D ipmi::sensor::sensors.find(sensorNum=
);</div>
<div>&nbsp; &nbsp; if (iter =3D=3D ipmi::sensor::sensors.end())</div>
<div>&nbsp; &nbsp; {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; return ipmi::responseSensorInvalid();</div=
>
<div>&nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; if (ipmi::sensor::Mutability::Read !=3D</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; (iter-&gt;second.mutability &amp; ipmi::se=
nsor::Mutability::Read))</div>
<div>&nbsp; &nbsp; {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; return ipmi::responseIllegalCommand();</di=
v>
<div>&nbsp; &nbsp; }</div>
<div><br>
</div>
<div>&nbsp; &nbsp; try</div>
<div>&nbsp; &nbsp; {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; ipmi::sensor::GetSensorResponse getRespons=
e =3D</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; iter-&gt;second.getFunc(iter=
-&gt;second);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </div>
<div><span style=3D"color: rgb(12, 100, 192);">&nbsp; &nbsp; &nbsp; &nbsp; =
enableScanning(&amp;response);</span></div>
<div><br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; return ipmi::responseSuccess(getResponse.r=
eading, uint5_t(0),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;getResponse.r=
eadingOrStateUnavailable,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;getResponse.s=
canningEnabled,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;getResponse.a=
llEventMessagesEnabled,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;getResponse.t=
hresholdLevelsStates,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;getResponse.d=
iscreteReadingSensorStates);</div>
&nbsp; &nbsp; }<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
harley</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> openbmc=
 &lt;openbmc-bounces+zhouyuanqing8=3Doutlook.com@lists.ozlabs.org&gt; =B4=
=FA=B1=ED =D6=DC =D4=B6=C7=E5 &lt;zhouyuanqing8@outlook.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA10=D4=C231=C8=D5 10:31<br>
<b>=CA=D5=BC=FE=C8=CB:</b> openbmc &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=B3=AD=CB=CD:</b> uperic@163.com &lt;uperic@163.com&gt;<br>
<b>=D6=F7=CC=E2:</b> all discrete sensor shows na</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
&nbsp; &nbsp;I added some discrete sensors to openbmc, but I used the ipmit=
ool command to query and found that all discrete sensors displayed na. Plea=
se help and guide, thank you. Examples are as follows.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"background-color:rgb(255,255,255); display:inline!important"=
>F:\ipmitool v1.8.18&gt;</span>ipmitool.exe -I lanplus -C 17 -H 172.16.90.1=
72 -U root -P 0penBmc sensor list</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
PowerDrop &nbsp; &nbsp; &nbsp; &nbsp;| na &nbsp; &nbsp; &nbsp; &nbsp; | dis=
crete &nbsp; | na &nbsp; &nbsp;| na &nbsp; &nbsp; &nbsp; &nbsp;| na &nbsp; =
&nbsp; &nbsp; &nbsp;| na &nbsp; &nbsp; &nbsp; &nbsp;| na &nbsp; &nbsp; &nbs=
p; &nbsp;| na &nbsp; &nbsp; &nbsp; &nbsp;| na<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
F:\ipmitool v1.8.18&gt;ipmitool.exe -I lanplus -C 17 -H 172.16.90.172 -U ro=
ot -P 0penBmc sensor get
<span style=3D"background-color:rgb(255,255,255); display:inline!important"=
>PowerDrop<span class=3D"x_Apple-converted-space">&nbsp;</span></span>
<div>Locating sensor record...</div>
<div>Sensor ID &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: <span styl=
e=3D"background-color:rgb(255,255,255); display:inline!important">
PowerDrop<span class=3D"x_Apple-converted-space">&nbsp;</span></span> (0x28=
)</div>
<div>&nbsp;Entity ID &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : 7.1</div>
<div>&nbsp;Sensor Type (Discrete): Power Supply</div>
&nbsp;Unable to read sensor: Device Not Present<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
I have checked the dbus interface corresponding to PowerDrop, and it can be=
 set and inquired through the busctl command;<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thankyou!</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
harley.</div>
</div>
</body>
</html>

--_000_MEAPR01MB3335C126F3491EB6F3100755FE100MEAPR01MB3335ausp_--
