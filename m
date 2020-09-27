Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFEC27A138
	for <lists+openbmc@lfdr.de>; Sun, 27 Sep 2020 15:27:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bzmfl1NXPzDqR6
	for <lists+openbmc@lfdr.de>; Sun, 27 Sep 2020 23:27:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.253.75;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=EEXavg2c; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253075.outbound.protection.outlook.com [40.92.253.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzmdl23spzDqR6
 for <openbmc@lists.ozlabs.org>; Sun, 27 Sep 2020 23:26:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2zYZvohyajuPgNaq3vVAEpTeoG5mMrIwAtw4FCYfvIPinTcQk3m02dpqHpOza+XYXmJXGn5d++hFLMqAg9iI+UWi1c/c92BUZqymwfuOqdizP/5Exo7Ah+Qk/K0Ps4caGrdzVEoFR+eKa3y7v9qpPtomUgc4DGrTAbGFF+QtgnPUVo3vQLWwJvtIw58xF2dQ9DqTU+pHqaTklq6tw96a2isejMbybig5gvg++57VxlfOBlItKvvUTGa6oZ7yD1tgBdhONweMvWFveCdZzzOwY/dDvVDt01Xwj7/tAJMGXhAkQkhGZrYLZXawO7EzAhUgVEooi/a11riifUjaBBKhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHOfvDgI+2fW0bqq8+R/UsowNaoU0NThQVSj8BB92Vw=;
 b=OY95b9vzqLEPXQLcMyQaSnpM+xbif9aPcxTo0f5LUVLr2p6myd/+DXINQ+xYkiB71B5ZMJyCjR07a+Lh05u09hSFL2V3DaIytpdnJ2GKb2A9gDVvySRSaKvnJlkzge9RAPdw23JjbZhnIPl2BADygok0vf6BglLUsLa8YhLywis/dDu4jajQCILZnVtnqUkvOV/+8Uapylgo9eWOL9ihznHi6px0zl0q1cqqghFTo2Np/hjHyjpvNu5TdpvMxkFA3577BX8IfOwkyouvvMdyueAwISjCDQHWcNLkI8wNHLStItnxiQisFBruPZurlOZEJPN5q7N6uY1CQ+2j03MrSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHOfvDgI+2fW0bqq8+R/UsowNaoU0NThQVSj8BB92Vw=;
 b=EEXavg2cT5b473zYgHuOP9TTSaXVbauoi2yC3VVbOdtJhUt3beJ/SfyFeEGNvWheo9MunyPZKkyvbAXebPW87+/nn3Em6+kNxWkerxrhUI+WYwllwfVLKWwvmN6kmEENJqXqMc1xU+DTuuG5x0FdMG02q9ecFj+Uwe3iLtCDN0SjDa0Cl+QcaKB38TjIKiVgQW4nCqtXZxQx0Ja5yyZUP4RTTg6VtClQqKX52LNLlpOxVV0OYT4EnPZRgpy3qaxG0qDNlOIf7walcZvkpMMhxDvvdJG/uEc+Gi+mlkcpYjC0w8sA2ZFKOT1m+0/CrayMJt2L9LpxPA5eGrJmpnzJbw==
Received: from HK2APC01FT032.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::51) by
 HK2APC01HT133.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::388)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Sun, 27 Sep
 2020 13:26:43 +0000
Received: from MEAPR01MB2406.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::4f) by HK2APC01FT032.mail.protection.outlook.com
 (2a01:111:e400:7ebc::188) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend
 Transport; Sun, 27 Sep 2020 13:26:43 +0000
Received: from MEAPR01MB2406.ausprd01.prod.outlook.com
 ([fe80::d912:2b17:75d6:d5dd]) by MEAPR01MB2406.ausprd01.prod.outlook.com
 ([fe80::d912:2b17:75d6:d5dd%3]) with mapi id 15.20.3412.028; Sun, 27 Sep 2020
 13:26:43 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: =?gb2312?B?u9i4tDogYWJvdXQgcGlkIHNwZWVkIGNvbnRyb2w=?=
Thread-Topic: about pid speed control
Thread-Index: AQHWlHzHwZ8YAL1/I0q7ukLRL3P3yKl8d1CQ
Date: Sun, 27 Sep 2020 13:26:43 +0000
Message-ID: <MEAPR01MB24061B5B8759322BD1C71950FE340@MEAPR01MB2406.ausprd01.prod.outlook.com>
References: <CAGm54UH407RGGHmrbqUvWDy3ozXx08NQCNiW2E4qs576kwB67g@mail.gmail.com>,
 <HK2PR04MB3826F0E0E2F9CA1A041DFC5DFE610@HK2PR04MB3826.apcprd04.prod.outlook.com>,
 <OF1D7ABF81.CDBAD648-ON002585A5.0017F478-002585A5.0018BAEF@notes.na.collabserv.com>,
 <SY2PR01MB2410CFE5E559B0F8CDEA25DDFE340@SY2PR01MB2410.ausprd01.prod.outlook.com>
In-Reply-To: <SY2PR01MB2410CFE5E559B0F8CDEA25DDFE340@SY2PR01MB2410.ausprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:82881FA583CFD508963DD5729E33B064036A2D4B102D1B7671961A0BCCC702C0;
 UpperCasedChecksum:D3768BD17ADA68BFB44A750FB30D13A28B9005095F57BF6950C5869A165CFE2A;
 SizeAsReceived:7096; Count:44
x-tmn: [UjV64tIwH79wYAHLWciw+bDtk3Jq5b/2]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 33142b90-48ea-4236-dba2-08d862e8f983
x-ms-traffictypediagnostic: HK2APC01HT133:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qynM2EcjZoeQoKI0cV33akOuYbBtS3t0CLBl4QNbKpUkBFYth9SCwQJFohjXnJUCRKvpjzvY11CRCfcKp3oWEt3UbDybs00JGzkxdWKI5YZSGlknt6OZMQSAG2kp6WllUdnR/B1HFCO2F/Y82SywkGj/kWLuDw8P5RdGkKB4QOry8Ua4W8xpyCqSKjA86xY8msCG1az3tUjEVMZpBWUgAgG2g96roaHD+Ucl1HFXRhxnVilKG8qwj/HnLgH3RSxj
x-ms-exchange-antispam-messagedata: 3uAJawfZRpUMQMUaVBXnyFVSgjOfv7jdBPVOgJynAOTw1u5gZq2NL6Xsi2FJIK60DtlReVjzyM6o2LTctCkyiTKAYEtvjveQ4vEjYdSBplEPfHv+kpUsrs7TDzXAHxXOumN1etVKN0nqL06QSp5qXg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MEAPR01MB24061B5B8759322BD1C71950FE340MEAPR01MB2406ausp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT032.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 33142b90-48ea-4236-dba2-08d862e8f983
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2020 13:26:43.0208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT133
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

--_000_MEAPR01MB24061B5B8759322BD1C71950FE340MEAPR01MB2406ausp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgZXZlcnlvbmUsDQoNCiAgICAgICAgICBGb3IgdGhlIHBhcmFtZXRlcnMgb2YgdGhlIGZvbGxv
d2luZyB0YWJsZSwgZG9lcyB0aGUgUElEIGNvZGUgb2Ygb3BlbmJtYyBoYXZlIGEgY2xlYXJlciB0
cmFuc2ZlciBmdW5jdGlvbiBjb3JyZXNwb25kaW5nIHRvIHRoaXMgdGFibGU/IEJ5IGFkanVzdGlu
ZyB0aGUgZm9sbG93aW5nIHBhcmFtZXRlcnMsIGZhbmNvbnRyb2wgaGFzIHRha2VuIGVmZmVjdC4g
SSBzZXQgNTAwMCBycG0sIGJ1dCB0aGUgZmFuIHdpbGwgY2hhbmdlIGJhY2sgYW5kIGZvcnRoIGJl
dHdlZW4gNDUwMC01NTAwLiBUaGUgY2hhbmdlIGluIHRoaXMgcmFuZ2UgaXMgc3RpbGwgcmVsYXRp
dmVseSBsYXJnZS4gSWYgdGhlcmUgaXMgYSB0cmFuc2ZlciBmdW5jdGlvbiwgdGhlIGFkanVzdG1l
bnQgd2lsbCBiZSBtb3JlIGFjY3VyYXRlIGFuZCBmYXN0ZXIuDQoNCg0KaHR0cHM6Ly9naXRodWIu
Y29tL29wZW5ibWMvcGhvc3Bob3ItcGlkLWNvbnRyb2wvYmxvYi9tYXN0ZXIvY29uZmlndXJlLm1k
DQpbaHR0cHM6Ly9hdmF0YXJzMy5naXRodWJ1c2VyY29udGVudC5jb20vdS8xMzY3MDA0Mz9zPTQw
MCZ2PTRdPGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLXBpZC1jb250cm9sL2Js
b2IvbWFzdGVyL2NvbmZpZ3VyZS5tZD4NCm9wZW5ibWMvcGhvc3Bob3ItcGlkLWNvbnRyb2w8aHR0
cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItcGlkLWNvbnRyb2wvYmxvYi9tYXN0ZXIv
Y29uZmlndXJlLm1kPg0KT3BlbkJNQyBQSUQtYmFzZWQgVGhlcm1hbCBDb250cm9sIERhZW1vbi4g
Q29udHJpYnV0ZSB0byBvcGVuYm1jL3Bob3NwaG9yLXBpZC1jb250cm9sIGRldmVsb3BtZW50IGJ5
IGNyZWF0aW5nIGFuIGFjY291bnQgb24gR2l0SHViLg0KZ2l0aHViLmNvbQ0KDQpmaWVsZCAgIHR5
cGUgICAgbWVhbmluZw0Kc2FtcGxlUGVyaW9kICAgIGRvdWJsZSAgSG93IGZyZXF1ZW50bHkgdGhl
IHZhbHVlIGlzIHNhbXBsZWQuIDAuMSBmb3IgZmFucywgMS4wIGZvciB0ZW1wZXJhdHVyZXMuDQpw
cm9wb3J0aW9uYWxDb2VmZiAgICAgICBkb3VibGUgIFRoZSBwcm9wb3J0aW9uYWwgY29lZmZpY2ll
bnQuDQppbnRlZ3JhbENvZWZmICAgZG91YmxlICBUaGUgaW50ZWdyYWwgY29lZmZpY2llbnQuDQpm
ZWVkRndkT2Zmc2V0Q29lZmYgICAgICBkb3VibGUgIFRoZSBmZWVkIGZvcndhcmQgb2Zmc2V0IGNv
ZWZmaWNpZW50Lg0KZmVlZEZ3ZEdhaW5Db2VmZiAgICAgICAgZG91YmxlICBUaGUgZmVlZCBmb3J3
YXJkIGdhaW4gY29lZmZpY2llbnQuDQppbnRlZ3JhbExpbWl0X21pbiAgICAgICBkb3VibGUgIFRo
ZSBpbnRlZ3JhbCBtaW5pbXVtIGNsYW1wIHZhbHVlLg0KaW50ZWdyYWxMaW1pdF9tYXggICAgICAg
ZG91YmxlICBUaGUgaW50ZWdyYWwgbWF4aW11bSBjbGFtcCB2YWx1ZS4NCm91dExpbV9taW4gICAg
ICBkb3VibGUgIFRoZSBvdXRwdXQgbWluaW11bSBjbGFtcCB2YWx1ZS4NCm91dExpbV9tYXggICAg
ICBkb3VibGUgIFRoZSBvdXRwdXQgbWF4aW11bSBjbGFtcCB2YWx1ZS4NCnNsZXdOZWcgZG91Ymxl
ICBOZWdhdGl2ZSBzbGV3IHZhbHVlIHRvIGRhbXBlbiBvdXRwdXQuDQpzbGV3UG9zIGRvdWJsZSAg
UG9zaXRpdmUgc2xldyB2YWx1ZSB0byBhY2NlbGVyYXRlIG91dHB1dC4NCg0KDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6INbcINS2x+UgPHpob3V5dWFucWluZzhA
b3V0bG9vay5jb20+DQq3osvNyrG85DogMjAyMMTqOdTCMjfI1SAxMToxNw0KytW8/sjLOiBvcGVu
Ym1jIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQqzrcvNOiB1cGVyaWNAMTYzLmNvbSA8dXBl
cmljQDE2My5jb20+DQrW98ziOiBhYm91dCBwaWQgc3BlZWQgY29udHJvbA0KDQpIaSBldmVyeW9u
ZSwNCg0KICAgIEkgYWRkZWQgdGhlIHBob3Bob3ItcGlkLWNvbnRyb2wgbW9kdWxlIHRvIG15IHBy
b2plY3QuIEFmdGVyIHRoZSBQSUQgbW9kdWxlIHdhcyBzdGFydGVkLCB0aGUgcHdtIHZhbHVlIG9z
Y2lsbGF0ZWQgYmV0d2VlbiAxMiBhbmQgMTUzLiBJIGRlbGV0ZWQgb3RoZXIgY29uZmlndXJhdGlv
bnMgYW5kIG9ubHkga2VwdCBvbmUgZmFuIGFuZCBvbmUgdGVtcC4gSSBoYXZlIGRlYnVnZ2VkIHZh
cmlvdXMgUElEIHBhcmFtZXRlciB2YWx1ZXMgb2YgZmFuLCBhbmQgdGhlcmUgaXMgbm8gb2J2aW91
cyBjaGFuZ2UgaW4gdGhlIHBoZW5vbWVub24uIFBsZWFzZSB0YWtlIGEgbG9vayBhdCBpdCwgdGhh
bmsgeW91Lg0KDQogICBUaGUgY29uZmlndXJhdGlvbiBpcyBhcyBmb2xsb3dzOg0KDQogICA0NjEx
IHJvb3QgICAgICA3NjE2IFMgICAgL3Vzci9iaW4vc3dhbXBkIC10IC1sIC90bXAvDQoNCiAgIHJv
b3RAc3Rhcmxha2Utc246fiMgY2F0IC9ldGMvdGhlcm1hbC5kL3NldHBvaW50DQogICAzMDAwDQoN
CiAgIGNvbmZpZy5qc29uIGFzIGZvbGxvdzoNCiAgIHsNCiAgICAic2Vuc29ycyIgOiBbDQogICAg
ICAgIHsNCiAgICAgICAgICAgICJuYW1lIjogIkZhbjBfU3BlZWQiLA0KICAgICAgICAgICAgInR5
cGUiOiAiZmFuIiwNCiAgICAgICAgICAgICJyZWFkUGF0aCI6ICIveHl6L29wZW5ibWNfcHJvamVj
dC9zZW5zb3JzL2Zhbl90YWNoL0ZhbjBfU3BlZWQiLA0KICAgICAgICAgICAgIndyaXRlUGF0aCI6
ICIveHl6L29wZW5ibWNfcHJvamVjdC9zZW5zb3JzL2Zhbl90YWNoL0ZhbjBfU3BlZWQiLA0KICAg
ICAgICAgICAgIm1pbiI6IDAsDQogICAgICAgICAgICAibWF4IjogMjU1LA0KICAgICAgICAgICAg
InRpbWVvdXQiOiAwDQogICAgICAgIH0sDQogICAgICAgIHsNCiAgICAgICAgICAgICJuYW1lIjog
ImlubGV0X1RlbXAiLA0KICAgICAgICAgICAgInR5cGUiOiAidGVtcCIsDQogICAgICAgICAgICAi
cmVhZFBhdGgiOiAiL3h5ei9vcGVuYm1jX3Byb2plY3Qvc2Vuc29ycy90ZW1wZXJhdHVyZS9pbmxl
dF9UZW1wIiwNCiAgICAgICAgICAgICJ3cml0ZVBhdGgiOiAiIiwNCiAgICAgICAgICAgICJtaW4i
OiAwLA0KICAgICAgICAgICAgIm1heCI6IDAsDQogICAgICAgICAgICAiaWdub3JlRGJ1c01pbk1h
eCI6IHRydWUsDQogICAgICAgICAgICAidGltZW91dCI6IDANCiAgICAgICAgfQ0KICAgIF0sDQog
ICJ6b25lcyIgOiBbDQogICAgICAgIHsNCiAgICAgICAgICAgICJpZCI6IDEsDQogICAgICAgICAg
ICAibWluVGhlcm1hbE91dHB1dCI6IDMwMDAuMCwNCiAgICAgICAgICAgICJmYWlsc2FmZVBlcmNl
bnQiOiA3NS4wLA0KICAgICAgICAgICAgInBpZHMiOiBbDQogICAgICAgICAgICAgICAgew0KICAg
ICAgICAgICAgICAgICAgICAibmFtZSI6ICJGYW4wX1NwZWVkIiwNCiAgICAgICAgICAgICAgICAg
ICAgInR5cGUiOiAiZmFuIiwNCiAgICAgICAgICAgICAgICAgICAgImlucHV0cyI6IFsiRmFuMF9T
cGVlZCJdLA0KICAgICAgICAgICAgICAgICAgICAic2V0cG9pbnQiOiA1MC4wLA0KICAgICAgICAg
ICAgICAgICAgICAicGlkIjogew0KICAgICAgICAgICAgICAgICAgICAgICAgInNhbXBsZVBlcmlv
ZCI6IDAuMSwNCiAgICAgICAgICAgICAgICAgICAgICAgICJwcm9wb3J0aW9uYWxDb2VmZiI6IDIw
LjAsDQogICAgICAgICAgICAgICAgICAgICAgICAiaW50ZWdyYWxDb2VmZiI6IDAuMSwNCiAgICAg
ICAgICAgICAgICAgICAgICAgICJmZWVkRndkT2Zmc2V0Q29lZmYiOiAwLjAsDQogICAgICAgICAg
ICAgICAgICAgICAgICAiZmVlZEZ3ZEdhaW5Db2VmZiI6IDEuMCwNCiAgICAgICAgICAgICAgICAg
ICAgICAgICJpbnRlZ3JhbExpbWl0X21pbiI6IDAuMCwNCiAgICAgICAgICAgICAgICAgICAgICAg
ICJpbnRlZ3JhbExpbWl0X21heCI6IDUuMCwNCiAgICAgICAgICAgICAgICAgICAgICAgICJvdXRM
aW1fbWluIjogNS4wLA0KICAgICAgICAgICAgICAgICAgICAgICAgIm91dExpbV9tYXgiOiA2MC4w
LA0KICAgICAgICAgICAgICAgICAgICAgICAgInNsZXdOZWciOiAwLjAsDQogICAgICAgICAgICAg
ICAgICAgICAgICAic2xld1BvcyI6IDAuMA0KICAgICAgICAgICAgICAgICAgICB9DQogICAgICAg
ICAgICAgICAgfSwNCiAgICAgICAgICAgICAgICB7DQogICAgICAgICAgICAgICAgICAgICJuYW1l
IjogImlubGV0X1RlbXAiLA0KICAgICAgICAgICAgICAgICAgICAidHlwZSI6ICJ0ZW1wIiwNCiAg
ICAgICAgICAgICAgICAgICAgImlucHV0cyI6IFsiaW5sZXRfVGVtcCJdLA0KICAgICAgICAgICAg
ICAgICAgICAic2V0cG9pbnQiOiA1MC4wLA0KICAgICAgICAgICAgICAgICAgICAicGlkIjogeyAg
ICAgICAgICAgICAgICAgICAgICBhbXBsZVBlcmlvZCI6IDAuMSwNCiAgICAgICAgICAgICAgICAg
ICAgICAgICJzYW1wbGVQZXJpb2QiOiAxLjAsDQogICAgICAgICAgICAgICAgICAgICAgICAicHJv
cG9ydGlvbmFsQ29lZmYiOiAtMC4xLA0KICAgICAgICAgICAgICAgICAgICAgICAgImludGVncmFs
Q29lZmYiOiAxLjAsICAgICAzNjszNEhpbiI6IDUuMCwNCiAgICAgICAgICAgICAgICAgICAgICAg
ICJmZWVkRndkT2Zmc2V0Q29lZmYiOiAwLjAsDQogICAgICAgICAgICAgICAgICAgICAgICAiZmVl
ZEZ3ZEdhaW5Db2VmZiI6IDAuMCwNCiAgICAgICAgICAgICAgICAgICAgICAgICJpbnRlZ3JhbExp
bWl0X21pbiI6IDAuMCwNCiAgICAgICAgICAgICAgICAgICAgICAgICJpbnRlZ3JhbExpbWl0X21h
eCI6IDAuMCwNCiAgICAgICAgICAgICAgICAgICAgICAgICJvdXRMaW1fbWluIjogMzAwMC4wLA0K
ICAgICAgICAgICAgICAgICAgICAgICAgIm91dExpbV9tYXgiOiAxNjAwMC4wLA0KICAgICAgICAg
ICAgICAgICAgICAgICAgInNsZXdOZWciOiAwLjAsDQogICAgICAgICAgICAgICAgICAgICAgICAi
c2xld1BvcyI6IDAuMCwNCiAgICAgICAgICAgICAgICAgICAgICAgICJwb3NpdGl2ZUh5c3RlcmVz
aXMiOiAxLjAsDQogICAgICAgICAgICAgICAgICAgICAgICAibmVnYXRpdmVIeXN0ZXJlc2lzIjog
MS4wDQogICAgICAgICAgICAgICAgICAgIH0NCiAgICAgICAgICAgfQ0KICAgICAgICAgICAgXQ0K
ICAgICAgICB9DQogICAgXQ0KfQ0K

--_000_MEAPR01MB24061B5B8759322BD1C71950FE340MEAPR01MB2406ausp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div>
<div id=3D"appendonsend" style=3D"font-family: Calibri, Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgrou=
nd-color: rgb(255, 255, 255); display: inline !important">Hi everyone,</spa=
n><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgrou=
nd-color: rgb(255, 255, 255); display: inline !important"><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgrou=
nd-color: rgb(255, 255, 255); display: inline !important">&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;&nbsp;For the parameters of the following table, does the =
PID code of openbmc have a clearer transfer function corresponding
 to this table? By adjusting the following parameters, fancontrol has taken=
 effect. I set 5000 rpm, but the fan will change back and forth between 450=
0-5500. The change in this range is still relatively large. If there is a t=
ransfer function, the adjustment
 will be more accurate and faster.</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgrou=
nd-color: rgb(255, 255, 255); display: inline !important"><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<a href=3D"https://github.com/openbmc/phosphor-pid-control/blob/master/conf=
igure.md" id=3D"LPlnk">https://github.com/openbmc/phosphor-pid-control/blob=
/master/configure.md</a><br>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1">
<div id=3D"LPBorder_GTaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItcGlkL=
WNvbnRyb2wvYmxvYi9tYXN0ZXIvY29uZmlndXJlLm1k" class=3D"LPBorder771081" style=
=3D"width: 100%; margin-top: 16px; margin-bottom: 16px; position: relative;=
 max-width: 800px; min-width: 424px;">
<table id=3D"LPContainer771081" role=3D"presentation" style=3D"padding: 12p=
x 36px 12px 12px; width: 100%; border-width: 1px; border-style: solid; bord=
er-color: rgb(200, 200, 200); border-radius: 2px;">
<tbody>
<tr valign=3D"top" style=3D"border-spacing: 0px;">
<td>
<div id=3D"LPImageContainer771081" style=3D"position: relative; margin-righ=
t: 12px; height: 160px; overflow: hidden;">
<a target=3D"_blank" id=3D"LPImageAnchor771081" href=3D"https://github.com/=
openbmc/phosphor-pid-control/blob/master/configure.md"><img id=3D"LPThumbna=
ilImageId771081" alt=3D"" height=3D"160" style=3D"display: block;" width=3D=
"160" src=3D"https://avatars3.githubusercontent.com/u/13670043?s=3D400&amp;=
v=3D4"></a></div>
</td>
<td style=3D"width: 100%;">
<div id=3D"LPTitle771081" style=3D"font-size: 21px; font-weight: 300; margi=
n-right: 8px; font-family: wf_segoe-ui_light, &quot;Segoe UI Light&quot;, &=
quot;Segoe WP Light&quot;, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Taho=
ma, Arial, sans-serif; margin-bottom: 12px;">
<a target=3D"_blank" id=3D"LPUrlAnchor771081" href=3D"https://github.com/op=
enbmc/phosphor-pid-control/blob/master/configure.md" style=3D"text-decorati=
on: none; color: var(--themePrimary);">openbmc/phosphor-pid-control</a></di=
v>
<div id=3D"LPDescription771081" style=3D"font-size: 14px; max-height: 100px=
; color: rgb(102, 102, 102); font-family: wf_segoe-ui_normal, &quot;Segoe U=
I&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif; margin-bottom: 12=
px; margin-right: 8px; overflow: hidden;">
OpenBMC PID-based Thermal Control Daemon. Contribute to openbmc/phosphor-pi=
d-control development by creating an account on GitHub.</div>
<div id=3D"LPMetadata771081" style=3D"font-size: 14px; font-weight: 400; co=
lor: rgb(166, 166, 166); font-family: wf_segoe-ui_normal, &quot;Segoe UI&qu=
ot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif;">
github.com</div>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<br>
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgrou=
nd-color: rgb(255, 255, 255); display: inline !important">
<table style=3D"box-sizing: border-box; border-spacing: 0px; border-collaps=
e: collapse; margin-top: 0px; margin-bottom: 16px; display: block; width: m=
ax-content; max-width: 100%; overflow: auto; caret-color: rgb(36, 41, 46); =
color: rgb(36, 41, 46); font-family: -apple-system, BlinkMacSystemFont, &qu=
ot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&qu=
ot;, &quot;Segoe UI Emoji&quot;; font-weight: normal; orphans: auto; widows=
: auto">
<thead style=3D"box-sizing: border-box">
<tr style=3D"box-sizing: border-box; background-color: rgb(255, 255, 255); =
border-top-width: 1px; border-top-style: solid; border-top-color: rgb(198, =
203, 209)">
<th style=3D"box-sizing: border-box; padding: 6px 13px; font-weight: 600; b=
order: 1px solid rgb(223, 226, 229)">
field</th>
<th style=3D"box-sizing: border-box; padding: 6px 13px; font-weight: 600; b=
order: 1px solid rgb(223, 226, 229)">
type</th>
<th style=3D"box-sizing: border-box; padding: 6px 13px; font-weight: 600; b=
order: 1px solid rgb(223, 226, 229)">
meaning</th>
</tr>
</thead>
<tbody style=3D"box-sizing: border-box">
<tr style=3D"box-sizing: border-box; background-color: rgb(255, 255, 255); =
border-top-width: 1px; border-top-style: solid; border-top-color: rgb(198, =
203, 209)">
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">samplePeriod</co=
de></td>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">double</code></t=
d>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
How frequently the value is sampled. 0.1 for fans, 1.0 for temperatures.</t=
d>
</tr>
<tr style=3D"box-sizing: border-box; background-color: rgb(246, 248, 250); =
border-top-width: 1px; border-top-style: solid; border-top-color: rgb(198, =
203, 209)">
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">proportionalCoef=
f</code></td>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">double</code></t=
d>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
The proportional coefficient.</td>
</tr>
<tr style=3D"box-sizing: border-box; background-color: rgb(255, 255, 255); =
border-top-width: 1px; border-top-style: solid; border-top-color: rgb(198, =
203, 209)">
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">integralCoeff</c=
ode></td>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">double</code></t=
d>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
The integral coefficient.</td>
</tr>
<tr style=3D"box-sizing: border-box; background-color: rgb(246, 248, 250); =
border-top-width: 1px; border-top-style: solid; border-top-color: rgb(198, =
203, 209)">
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">feedFwdOffsetCoe=
ff</code></td>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">double</code></t=
d>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
The feed forward offset coefficient.</td>
</tr>
<tr style=3D"box-sizing: border-box; background-color: rgb(255, 255, 255); =
border-top-width: 1px; border-top-style: solid; border-top-color: rgb(198, =
203, 209)">
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">feedFwdGainCoeff=
</code></td>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">double</code></t=
d>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
The feed forward gain coefficient.</td>
</tr>
<tr style=3D"box-sizing: border-box; background-color: rgb(246, 248, 250); =
border-top-width: 1px; border-top-style: solid; border-top-color: rgb(198, =
203, 209)">
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">integralLimit_mi=
n</code></td>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">double</code></t=
d>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
The integral minimum clamp value.</td>
</tr>
<tr style=3D"box-sizing: border-box; background-color: rgb(255, 255, 255); =
border-top-width: 1px; border-top-style: solid; border-top-color: rgb(198, =
203, 209)">
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">integralLimit_ma=
x</code></td>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">double</code></t=
d>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
The integral maximum clamp value.</td>
</tr>
<tr style=3D"box-sizing: border-box; background-color: rgb(246, 248, 250); =
border-top-width: 1px; border-top-style: solid; border-top-color: rgb(198, =
203, 209)">
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">outLim_min</code=
></td>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">double</code></t=
d>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
The output minimum clamp value.</td>
</tr>
<tr style=3D"box-sizing: border-box; background-color: rgb(255, 255, 255); =
border-top-width: 1px; border-top-style: solid; border-top-color: rgb(198, =
203, 209)">
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">outLim_max</code=
></td>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">double</code></t=
d>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
The output maximum clamp value.</td>
</tr>
<tr style=3D"box-sizing: border-box; background-color: rgb(246, 248, 250); =
border-top-width: 1px; border-top-style: solid; border-top-color: rgb(198, =
203, 209)">
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">slewNeg</code></=
td>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">double</code></t=
d>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
Negative slew value to dampen output.</td>
</tr>
<tr style=3D"box-sizing: border-box; background-color: rgb(255, 255, 255); =
border-top-width: 1px; border-top-style: solid; border-top-color: rgb(198, =
203, 209)">
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">slewPos</code></=
td>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
<code style=3D"box-sizing: border-box; font-family: SFMono-Regular, Consola=
s, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 13.60000038146=
9727px; padding: 0.2em 0.4em; margin: 0px; background-color: rgba(27, 31, 3=
5, 0.05); border-top-left-radius: 6px; border-top-right-radius: 6px; border=
-bottom-right-radius: 6px; border-bottom-left-radius: 6px">double</code></t=
d>
<td style=3D"box-sizing: border-box; padding: 6px 13px; border: 1px solid r=
gb(223, 226, 229)">
Positive slew value to accelerate output.</td>
</tr>
</tbody>
</table>
<br class=3D"Apple-interchange-newline">
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> =D6=DC =
=D4=B6=C7=E5 &lt;zhouyuanqing8@outlook.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA9=D4=C227=C8=D5 11:17<br>
<b>=CA=D5=BC=FE=C8=CB:</b> openbmc &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=B3=AD=CB=CD:</b> uperic@163.com &lt;uperic@163.com&gt;<br>
<b>=D6=F7=CC=E2:</b> about pid speed control</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi everyone,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
&nbsp; &nbsp;&nbsp;I added the phophor-pid-control module to my project. Af=
ter the PID module was started, the pwm value oscillated between 12 and 153=
. I deleted other configurations and only kept one fan and one temp. I have=
 debugged various PID parameter values of fan,
 and there is no obvious change in the phenomenon. Please take a look at it=
, thank you.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"color:rgb(81,167,249)">&nbsp;</span><span style=3D"color:rgb=
(81,167,249)"> &nbsp;</span><span style=3D"color:rgb(81,167,249)">The confi=
guration is as follows</span><span style=3D"color:rgb(81,167,249)">:&nbsp;<=
/span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
&nbsp; &nbsp;4611 root &nbsp; &nbsp; &nbsp;7616 S &nbsp; &nbsp;/usr/bin/swa=
mpd -t -l /tmp/<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
&nbsp; &nbsp;root@starlake-sn:~# cat /etc/thermal.d/setpoint</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
&nbsp; &nbsp;3000</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"color:rgb(81,167,249)">&nbsp;</span><span style=3D"color:rgb=
(81,167,249)"> &nbsp;config.json as follow:</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
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
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
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
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ]</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; ]</div>
}<br>
</div>
</div>
</div>
</body>
</html>

--_000_MEAPR01MB24061B5B8759322BD1C71950FE340MEAPR01MB2406ausp_--
