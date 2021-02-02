Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3664C30D024
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 01:07:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVhnc1dJjzDqTb
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 11:07:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=66014ed71=davidwang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=sYJavPAc; 
 dkim-atps=neutral
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DVGdq3Y9dzDwh6
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 18:28:59 +1100 (AEDT)
IronPort-SDR: 5pFg60O1Jii9fXMUxn/VeZUnND89WJ5fk0S1EJGDOu+8J30eLh3amoAaviavkkjU8lh4PACS9x
 49FULNbuNsXQ==
Received: from unknown (HELO mailbx10.quanta.corp) ([10.243.91.107])
 by mx01.quantatw.com with ESMTP; 02 Feb 2021 15:28:56 +0800
Received: from mailbx06.quanta.corp (10.243.91.101) by mailbx10.quanta.corp
 (10.243.91.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 2 Feb 2021
 15:28:55 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (104.47.124.56)
 by mailbx06.quanta.corp (10.243.91.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4
 via Frontend Transport; Tue, 2 Feb 2021 15:28:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8+Ik04K2EPZ1/snRO3kPMtZUWza5d0TGNRKKHw9N3ryx1Bsj/83LghYoczTWTfi69r9LB8+UJUeCZKtSsmoxP8ozCPMfYFkiq9SspKxUsIRjR/gRDZ9wOuyzotI2+C7arrzTlT37V2gDrpkdIvGm2QRJ25eLikrvq3gkozUU8VnqmHxdoz72iv/CPZjwQO2+bbhrSZPZjRH8cYbUX5scDHthQf6cfaOE/swkDacI21he3pdfXZBDnv4C/dA2tHTc7TngQGaSYNnRcSgG+9Kd5hSVlJlYWnUabsRT7WavbdlUxWMrdq3GQH9QgIuh4GoO92g0gitB1j6BBIkcmDVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egi9dYrGRgz5OEJiLSRxCTMJd1o2dGMc032XGxLA/zA=;
 b=lpIdPa4acxolYeUnX49vJphgsb4nFEb+0ZkfoSGTQdXjShTuXgd8eeBVvTIyKLhsJNHgne8hDFe5g3oSG5aLhc3rqnqsEB4x6oPaEvsmgWo34F3oFsFHh009HEuFQPQnKQ+WQJ5Iu4cjjVJelXL4x3FIPpC+mxGtlbp3Fkyiluq0kVRipUSsAQ/Un/yrAKur0Vbe2OK7CTj7xyKWat6C+zqbuow/bxwVyAikj2xRHxPdRuQMtBdDqUk+/0HOwcAE2298yC65qWemGlCslkM5iussxDoGUgq1cgaB2c+t8h9+kna6FGD3FDrElphueRH1tHbavwm0ojhOx9zEHBqc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egi9dYrGRgz5OEJiLSRxCTMJd1o2dGMc032XGxLA/zA=;
 b=sYJavPAcvra+I7uyfON4jJdu53FPzp/sBwK0zktFV8edS0wGMlkHUQ9Iix+f9DYthhbtb+Qff+NQJG7le/FOkOxNr4k0UpxvP/7oA2SE1hSpcJhgPwpbrzl30o5ucA59EcqDZa6QblyfNH2+HNacbAq/O8EnHzBgRR3/oi1NpDU=
Received: from HK0PR04MB2737.apcprd04.prod.outlook.com (2603:1096:203:5b::20)
 by HK0PR04MB2916.apcprd04.prod.outlook.com (2603:1096:203:5f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Tue, 2 Feb
 2021 07:28:55 +0000
Received: from HK0PR04MB2737.apcprd04.prod.outlook.com
 ([fe80::ac2e:5d34:6be5:8840]) by HK0PR04MB2737.apcprd04.prod.outlook.com
 ([fe80::ac2e:5d34:6be5:8840%6]) with mapi id 15.20.3784.019; Tue, 2 Feb 2021
 07:28:55 +0000
From: =?big5?B?RGF2aWQgV2FuZyAopP2utqZ0KQ==?= <DavidWang@quantatw.com>
To: "johnathanx.mantey@intel.com" <johnathanx.mantey@intel.com>,
 "kuiying.wang@intel.com" <kuiying.wang@intel.com>
Subject: sdr info command of intel-ipmi-oem
Thread-Topic: sdr info command of intel-ipmi-oem
Thread-Index: Adb5MqUhjfBkluTDTTKnNx8aU8MIKg==
Date: Tue, 2 Feb 2021 07:28:54 +0000
Message-ID: <HK0PR04MB273783D0CA8B4D19291A167CC9B59@HK0PR04MB2737.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [60.251.243.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a82a60fa-5ec8-4bc6-1ead-08d8c74c3276
x-ms-traffictypediagnostic: HK0PR04MB2916:
x-microsoft-antispam-prvs: <HK0PR04MB291600583974DF2E050690ABC9B59@HK0PR04MB2916.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n5fZmkytKwsP3NnB8beVXWaqdznUBPrbs5V0z8IJjGxNreYxMOqan9VB9jn66iLouFYCkfoq1qIAWjl9zeRAMzw7CJQVWAWvefpfsaOyiQb0oyZEVKObhaThg4dGjCjQ8wZnHXfmdqZi3cpqkC3bnunVdY3TBUs20mpPNFNbfLoQLbI3+hfU2TuzJYtlF6AoV1EVJP8fU0usoC5IuXyfoc0rmT+ZoWQq3WOx9DwzcxCLCvdykqx2sZtnkHcYiQdAQ+k96H0OzQcYlFGEDZk2Yhb2jGwzsFtzlslhpARyprZR5i97zZXk9Gvsz9+qZygpKN7+MMD5n02JzfK39YSOxjC8/yesUohWCS1iBVZh7i8qbEXAq1RQE2Z5o0RAjEg/iZox/azyLdZrsjHra3ZMJ/nN0x8L27Nyr/ON9xmR8fNkGWwDwUouY/GfUjZgoSP5hQhmriUzQ6QHpRQbDrOUD/A7lmuILt6sGRBFpgyQJy9vKvGpuWN6aIpkrz6FmS0D2tn9gM/rw9XZP2Dq7nCOFA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2737.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(66556008)(8936002)(478600001)(86362001)(8676002)(66946007)(64756008)(83380400001)(4744005)(66476007)(66446008)(71200400001)(52536014)(5660300002)(7696005)(4326008)(33656002)(26005)(85182001)(2906002)(76116006)(186003)(110136005)(6506007)(316002)(9686003)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?c05jZndXdkpBelhLVEZydnEvUkt4cHhoSXoyY2g4enRXZDM4a3gxSjhEZFRKV25z?=
 =?big5?B?SkVyMDVvRUZ6S21oTFBiamNvOHJ2MU11ZStocmZucHVmcVV3ZEhIOFVESVlydWMv?=
 =?big5?B?aWR4TmdFYmZNM013RzJjNFoxZ3F5aHUrTVdhUW1TTjhLMk4rNGUrblArZGRGL1dx?=
 =?big5?B?UHozdGM0cXlmMXJkeDMybk96VTN4UUN0SmdBYmdEdm9HMW8rRGx1bnk3dHlsTHUr?=
 =?big5?B?VVRxRExLN1JsNlp0ZHpRTjVMUFFTclE3ZGFDaW9LajRCekVQbGl2R2ROdzdFTjVG?=
 =?big5?B?TGRnemw0WXBORGNCNGlhUHFIdWk3bXdWRDlDZUo1QmRNLytKOW1LOFIxZVZIU1VR?=
 =?big5?B?Smh5Y09taXhlTnZFclpoZTdGNk9YbXdiM0Z6cXlEVzE4UXNuYXB4ZjQ3NFQ1UWFK?=
 =?big5?B?WFRtR2FiS0dpMjNUS0ZGK3djcUN5TzQrRmtjYUJaWGZKZmg1eGRhTlBCSEZqcGRK?=
 =?big5?B?eUFZL0c3TmZUSm55dEFoRHlJU3RjUGMzMjRDTHM2Q3I1SlVKaG1FaytJQ01iRllh?=
 =?big5?B?cHBaZkxkTmdFU1lVMmxyVEtUVDBldXN5UXZQdXJMODJQcmREL0kxd0pMa1lJTzZh?=
 =?big5?B?U21nTkRIeTR3UjU1RTRDR1o5Uzdmd3ZXbk9LM0tOTnMyWngrNXN6UnB4QSs3WEZi?=
 =?big5?B?WXcyUHBpamdpSW9iMU05WHN2emlCR0hvRjdFZWxnMEVZUzJaUitzSDRobi9oK3hN?=
 =?big5?B?WisyZWRXV0hoUE5OQ3FKUnphK0F4dFJiTDlUbXRWTmhsQmFFS3ArVmNXSjF4Ry96?=
 =?big5?B?SFJWMzR4enNYbFFNSVcvZXg4SFFGNzlia3BVbG96dVJIbm5pMnNJNmp3VHVjbjN3?=
 =?big5?B?NGV6WTZHUTlCTndBV2RHdDllcGFwWHo0UlVIODcrNUVyU0o1OUlldGhpUmdaM2dY?=
 =?big5?B?Y0FvMlVyNzM4M2k5RjYwbmJnNWhtNVM2QW9zaWdIUkZUYlFudjVyZkFEa0xHVFBr?=
 =?big5?B?QlpDRU5ocDZ3TUllUXRJdWVjSW9ycGxJditUV29EL2xoallob0ZKSXNGZEU5NGxJ?=
 =?big5?B?OUwzY2d6TCtLT0FObTFZVXBreklmeDJLWkc1bDJLdXAyL0xuMy84czFhNVZvS3Jr?=
 =?big5?B?QlV3SG9pNCtTOUtrRTJHZHg1NXQ0aEk2Q2Z4b3R1b3pYSytSbGFNNnhKQTdlWG80?=
 =?big5?B?ZjhCY1U5UGdJZkJNVFZmVUx6Q2FQMHZTSGtHQ1ZVYWx5TllHdzNpMElRNld6MTlY?=
 =?big5?B?NWZWSDJ5Ni9GZTdKVXpGeFBTSitQSmt2ZWYxUmQrTVg1TXV3RUpkQ0p3T1RxSkdY?=
 =?big5?B?VjlzYkN0ekE4SnFnaGUyWitTSXpFYXNzR01XVmRzamM1clNYVkoyWEdBdXAxbWtw?=
 =?big5?Q?njwYtHYqMSI=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2737.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a82a60fa-5ec8-4bc6-1ead-08d8c74c3276
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 07:28:55.0539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tffKAUzZWEr9hjQSO92wWKqlBQlIEGHIyTPGHR4FPZ4QEfcbIvTnRLiwEiWiPEdzEGkQuGXSzSySSs/dDQu7yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2916
X-OriginatorOrg: quantatw.com
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksDQogDQogICAgSSdtIHRlc3Rpbmcgc29tZSBjYXNlIHdpdGggaW50ZWwtaXBtaS1vZW0gcGFj
a2FnZSwgYW5kIEkgbm90aWNlIHRoZXJlJ3Mgc29tZSBkaWZmZXJlbnQgIHdoZW4gZXhlY3V0ZSAi
aXBtaXRvb2wgc2RyIGluZm8iIChpcG1pdG9vbCByYXcgMHgwYSAweDIwKSBiZXR3ZWVuIGludGVs
LWlwbWktb2VtIGFuZCBwdXJlIHBob3NwaG9yLWlwbWktaG9zdC4NCg0KKHB1cmUgcGhvc3JwaG9y
LWlwbWktaG9zdCkNCjp+IyBpcG1pdG9vbCByYXcgMHgwYSAweDIwDQogNTEgYjUgMDAgZmYgZmYg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDANCg0KKGludGVsLWlwbWktb2VtKQ0KOn4jIGlwbWl0
b29sIHJhdyAweDBhIDB4MjANCiA1MSA3YiAwMCBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiA4Mw0KDQpXaXRoIHB1cmUgcGhvc3Bob3ItaXBtaS1ob3N0LCB0aGUgaW5pdGlhbCB2YWx1ZSBv
ZiAiTW9zdCByZWNlbnQgYWRkaXRpb24gdGltZSIgYW5kICJNb3N0IHJleGVudCBFcmFzZSB0aW1l
IiBpcyBzZXQgYXMgMDAgKDd0aCB0byAxNHRoIGJ5dGUpLg0KDQpXaXRoIGludGVsLWlwbWktb2Vt
LCB0aGUgaW5pdGlhbCB2YWx1ZSBvZiB0aW1lLXN0YW1wIGlzIHNldCBhcyBmZi4gQW5kIHRoZSBz
ZHIgdGltZXN0YW1wIHVwZGF0ZSB3aGVuIEJNQyByZWJvb3QgYW5kIGluaXRpYWwgc2Vuc29ycy4N
Cg0KSSB0aGluayBpdCBzaG91bGQgcmVjb3JkIHRoZSB0aW1lIHdoZW4gd2UgYWRkIHNkciBtYW51
YWxseS4gSXMgaXQgYWxzbyBleHBlY3RlZCB0byByZWNvcmQgdGhlIHRpbWUgQk1DIGZpcnN0IGlu
aXRpYWwgc2Vuc29ycz8NCg0KQW5kIHdoYXQgZG9lcyB0aGUgaW5pdGlhbCBzZXR0aW5nIG9mIGZm
IG1lYW4/IFRoZSBpcG1pIHNwZWMgZGlkbid0IG1lbnRpb24gYWJvdXQgaXQuDQoNClRoYW5rcw0K
DQpCZXN0IFJlZ2FyZHMsDQpEYXZpZA0KDQoNCg==
