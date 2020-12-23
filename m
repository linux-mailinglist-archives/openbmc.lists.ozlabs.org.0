Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFDE2E1AA4
	for <lists+openbmc@lfdr.de>; Wed, 23 Dec 2020 10:55:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D17qW4GM8zDqTj
	for <lists+openbmc@lfdr.de>; Wed, 23 Dec 2020 20:55:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=61964a07b=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=rPvZpHx9; 
 dkim-atps=neutral
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 4D17pp4L3CzDqSC
 for <openbmc@lists.ozlabs.org>; Wed, 23 Dec 2020 20:54:37 +1100 (AEDT)
IronPort-SDR: pKEd5bgtiZfxx7WIhfZtBeOU+6IFozYXC5wkGWT03S0c9NsG6wpB9+tEIKD/ZXUOjZ4NvJJkop
 Yuw8qac7WbNQ==
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx01.quantatw.com with ESMTP; 23 Dec 2020 17:54:19 +0800
Received: from mailbx06.quanta.corp (10.243.91.101) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 23 Dec
 2020 17:54:02 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (104.47.126.57)
 by mailbx06.quanta.corp (10.243.91.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4
 via Frontend Transport; Wed, 23 Dec 2020 17:54:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RB0Pp3wywI89JjsBdhBOl8BnoHUXHUUpS0wOaD2P8qG8R7HOJ0DMkwE3wU07a7FUSN0BQXhIbu1tVWsbQuGqL4nk8YBGCq01Vp7hJaydmfKG2NerXMNuoosWJ2MI22QqYzdhjK3EPWiIlMXlSvAnU43rxUFWRsrlw8S1oMJlmbmtavmMwTomoA63tCmruFN9RMMCAdJ1rHDyhhb+6y3G1csvm4lc67CMNyIBXS6h/plmCFuIUSf7dXR5QbBpwUAd30EZYG+nr8OyaPTYqjQlBcu2KqY95Dlzr41lM9yUbY5PmB0jqD5U3OwLH63Qf2e3vUxtHlb20QzGYPGGvnXVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueqHITdDcGb2OEPCX1XATt2s9cFsRGpevfJqZldHg4w=;
 b=DJ1zK/45SfjwHJpjcautovBVq5NRmk791+3hwtXp59C/FtyOsSqYp/dHKD1PlUBc50mA+Enb7mSP4deXfeu9KOcyxuCTXGKCrGEothomjzpgjwD3PIj5bdKwWkOyVvQlAGF4EJSVM260OofhNT9a+BBal9+z3d4XQxCtZFS6wlBTxzvkaRyxRVCUE9/TVoz8NPaj/QQC3n8uUfM/FZBowUzzodTynaz8SIkUv9+SL5jB1PhM8DvBKxLxIpDkbXeMzTwPjf6TVCFVmeWBB8YQ+lYaDVwgHnPbR+huO04smk0fSiX6xoXw1Q0Y5QAN83KgfiJP8lrUwy7Lqv+weMeGsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueqHITdDcGb2OEPCX1XATt2s9cFsRGpevfJqZldHg4w=;
 b=rPvZpHx9EOoDtDl4FeihhN1Ze+K0mhJ9VR3CQmhSLuLefIx4cUaUGzzaUPrSQVQTSyDFawBQu/63Qc65jC50r6Rcy+Ml2FWRTAEfUVjPGI3MBmqCV4u8wNCx0FEdLHrhJheBm7/JcN5ZjZLz70n8V4RnuW5GIz/+VZh97QaHQAQ=
Received: from HK0PR04MB3058.apcprd04.prod.outlook.com (2603:1096:203:8d::11)
 by HK0PR04MB2772.apcprd04.prod.outlook.com (2603:1096:203:34::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.30; Wed, 23 Dec
 2020 09:54:16 +0000
Received: from HK0PR04MB3058.apcprd04.prod.outlook.com
 ([fe80::f8e5:4b28:7105:ce26]) by HK0PR04MB3058.apcprd04.prod.outlook.com
 ([fe80::f8e5:4b28:7105:ce26%6]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 09:54:16 +0000
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: "geissonator@gmail.com" <geissonator@gmail.com>
Subject: Question about Redfish code update with multiple firmware
Thread-Topic: Question about Redfish code update with multiple firmware
Thread-Index: AdbZEHTXksJROyhdSdiY61BPbF0hMg==
Date: Wed, 23 Dec 2020 09:54:16 +0000
Message-ID: <HK0PR04MB3058A9D9DBBDFA3C50EE82B3E6DE0@HK0PR04MB3058.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da2d330a-6176-42ab-c6e5-08d8a728b5b5
x-ms-traffictypediagnostic: HK0PR04MB2772:
x-microsoft-antispam-prvs: <HK0PR04MB27726BB30508F2E7E1C19A6DE6DE0@HK0PR04MB2772.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 75KVtkWehwneYWHUnMsuiaWGdZJoX2oYhtljG+Z0duy+BmmMbZjOmXGRmRCMkp/awnQYrIk+mXx3MIXn4JKPsNKVfNFIxoPXzTocxInv8Ba59g6A6SA0F2IPg6sHFh0QyVql6X7jWwV/6s7obWks1rP3JmxxcIl10ajF7FYzOMj9b9hEqcfLkAleYcUqLo/2PVmrNRao/PoPOA1HbIa5ddtAnedfG8i4WsxAtj9Smfmyx2clOYyR/nUgMvrVv0j/MjGG+jdvNY+EBvJkWWRroG1fQYLDuQT69qTpqt71bTmGnNRHvmrL/bdGxryNMhoeoP5jcAhrnS0sGwcRcN2QnnwgWcS7vsSPGXvvNHj8Sj7k0PhtbHKSG5AdWOJ4VbkZOCItKl1FSIKtTxCuHsAjgQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3058.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(4326008)(55016002)(9686003)(2906002)(86362001)(6916009)(83380400001)(66476007)(64756008)(478600001)(66446008)(316002)(71200400001)(33656002)(66556008)(8676002)(8936002)(52536014)(186003)(26005)(76116006)(15650500001)(966005)(7696005)(5660300002)(6506007)(85182001)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?TFJzOUZKbmNvSy9KRnpxZTRVOFNoTlMxc2Uvd2M1emw5Y05NSGxGam1YSnpEaGVR?=
 =?big5?B?ZWxEcklFYlgrQjlsQ1FXdDMwbVh2NWlVdXY3bXVRd1J4QTFlVVI3Y1FiU1lSTTkv?=
 =?big5?B?eHU4SkVzcVVPaFIxQ0ZFYVJIaDMwUFNIc2NBYkVTOENqb0t2S1lxRUR4QkxDZFhn?=
 =?big5?B?b3Q0amR0NFhkbVpSTU5DUGhQV3NCczYyaUhwR1dLWVM1SUEwUXRGR1ZxME5ETGlL?=
 =?big5?B?S1FKczdQUnNRYzJaRGRpcHlWNlpYMElOTzg3bXJpSURzSmlTTTJYWkNsaHpacE11?=
 =?big5?B?dE9NbTJpVzdlTjhOc3RxVmZlVm5YdXlPZ0pZYmJzL3I5N1ZRMHlycStQQWNYSWlD?=
 =?big5?B?dGR3b3Q2ZXNLV2ozSnQvZzg5MDVsNlVhS0RtT2FSUWFsdlpPajY5Y3pqdFpFa3Y4?=
 =?big5?B?OVIvQmJGeExzVFVGR25qSWhWdGJScW9MM0gxTTdPMVRsa0FLcHl1dXRVcW8rWnFT?=
 =?big5?B?ZURzZE5DYUZML1d3b09XVStHSEU1ZmI4Tms4TDB5QlNBZzZBYlhBWWEzNWtQR2hl?=
 =?big5?B?THZvbjNxNkUyRmhtbTZpZUkzWFQ0MjlWdkw2K2RPTHRvQ0hublhGZWtFUXFjL0Uz?=
 =?big5?B?TVlLcHNHMHpDNG1NMjYwZkVLdFV2NkUvSDEwb2wrR3R4ZkEvRjJkWURQVUJGWnlY?=
 =?big5?B?TzE3SkxXdEZtWk82bHlOcmF0OGlYQnFya3Q4Yks3RDhEOGRzZ1FCV01iemdXRmV6?=
 =?big5?B?N3phNS9Kc0hNZUQ3Z3U3c0dvZE1WTFZHZlRMYzY5WlY2QXRzSDVrdXRXbWRSc2RM?=
 =?big5?B?YTcydHkwY3Y5Mmp0MGlBR0xmNndUMWtueFNXTG9FWForZktMaGppVXZIcUQzUVpK?=
 =?big5?B?Q1gzZHBZUEZCQTl4WVZjK3hvRzZOM3JENllwWHh3MzkvekRBRlMzQkhlYXNXcDRD?=
 =?big5?B?TEd4aXp4VzZrVElLL1JFWUEyRmVJWlI4NVNxdDVSeUxPWW1qdjJlTVBjZkZCeTFR?=
 =?big5?B?S04yZzkwZEMvb3owSDZ4TFdpOHlBYTRyYXd0RUExcllPZjBNbTArcVYxNklDNHNO?=
 =?big5?B?ejh3cXFuMlNZclphcUdVdzJ5OEQ2WWFSSGkxdHQ3UDJrQ0oxYWRiOFljYTA0S1F0?=
 =?big5?B?cWJRLytSTUQzd2Z0RGJkbnh3REFjZEZjQUg1SkVOS3NrdEJGL0FpRFlKNTEvMy9S?=
 =?big5?B?UDgvU0J6SUs2cklIcyt4Qk4xTmFBTk1xNWVVaHhJNTVERkNkNXlGTDFwNS9hd3FX?=
 =?big5?Q?/uAXZSWPmL6dpUpTqiLncFJYR0q3jpY1xfqSsefT2l8=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3058.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da2d330a-6176-42ab-c6e5-08d8a728b5b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2020 09:54:16.0595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QlzAgZdqoLTuBzqd6EvbX77OYcgHxwTQGkRGfG+/O0YwW5fnDUpiLLmE4nr4mgY7YcCmvKRlUV7F7uMQTU+D6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2772
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQW5kcmV3LA0KDQpJIGRpZCB0aGUgUmVkZmlzaCBjb2RlIHVwZGF0ZSB3aXRoIG11bHRpcGxl
IGZpcm13YXJlIGF0IG15IGVudmlyb25tZW50Lg0KU3RlcHMgYXMgZm9sbG93czoNCg0KVGhlcmUg
YXJlIHR3byBkaWZmZXJlbnQgaW1hZ2UgQSBhbmQgQi4gDQoNCmN1cmwgLWsgLUggIlgtQXV0aC1U
b2tlbjogJGJtY190b2tlbiIgLUggIkNvbnRlbnQtVHlwZTogYXBwbGljYXRpb24vb2N0ZXQtc3Ry
ZWFtIiAtWCBQT1NUIC1UIDxpbWFnZUE+IGh0dHBzOi8vJHtibWN9L3JlZGZpc2gvdjEvVXBkYXRl
U2VydmljZQ0KDQpjdXJsIC1rIC1IICJYLUF1dGgtVG9rZW46ICRibWNfdG9rZW4iIC1YIEdFVCBo
dHRwczovLyR7Ym1jfS9yZWRmaXNoL3YxL1VwZGF0ZVNlcnZpY2UvRmlybXdhcmVJbnZlbnRvcnkN
CnsNCiAgIkBvZGF0YS5pZCI6ICIvcmVkZmlzaC92MS9VcGRhdGVTZXJ2aWNlL0Zpcm13YXJlSW52
ZW50b3J5IiwNCiAgIkBvZGF0YS50eXBlIjogIiNTb2Z0d2FyZUludmVudG9yeUNvbGxlY3Rpb24u
U29mdHdhcmVJbnZlbnRvcnlDb2xsZWN0aW9uIiwNCiAgIk1lbWJlcnMiOiBbDQogICAgew0KICAg
ICAgIkBvZGF0YS5pZCI6ICIvcmVkZmlzaC92MS9VcGRhdGVTZXJ2aWNlL0Zpcm13YXJlSW52ZW50
b3J5LzU4MDVlODBlIg0KICAgIH0NCiAgXSwNCiAgIk1lbWJlcnNAb2RhdGEuY291bnQiOiAxLA0K
ICAiTmFtZSI6ICJTb2Z0d2FyZSBJbnZlbnRvcnkgQ29sbGVjdGlvbiINCn0NCg0KY3VybCAtayAt
SCAiWC1BdXRoLVRva2VuOiAkYm1jX3Rva2VuIiAtSCAiQ29udGVudC1UeXBlOiBhcHBsaWNhdGlv
bi9vY3RldC1zdHJlYW0iIC1YIFBPU1QgLVQgPGltYWdlQj4gaHR0cHM6Ly8ke2JtY30vcmVkZmlz
aC92MS9VcGRhdGVTZXJ2aWNlDQoNCmN1cmwgLWsgLUggIlgtQXV0aC1Ub2tlbjogJGJtY190b2tl
biIgWCBHRVQgaHR0cHM6Ly8ke2JtY30vcmVkZmlzaC92MS9VcGRhdGVTZXJ2aWNlL0Zpcm13YXJl
SW52ZW50b3J5DQp7DQogICJAb2RhdGEuaWQiOiAiL3JlZGZpc2gvdjEvVXBkYXRlU2VydmljZS9G
aXJtd2FyZUludmVudG9yeSIsDQogICJAb2RhdGEudHlwZSI6ICIjU29mdHdhcmVJbnZlbnRvcnlD
b2xsZWN0aW9uLlNvZnR3YXJlSW52ZW50b3J5Q29sbGVjdGlvbiIsDQogICJNZW1iZXJzIjogWw0K
ICAgIHsNCiAgICAgICJAb2RhdGEuaWQiOiAiL3JlZGZpc2gvdjEvVXBkYXRlU2VydmljZS9GaXJt
d2FyZUludmVudG9yeS9kY2UzYmYzMiINCiAgICB9DQogIF0sDQogICJNZW1iZXJzQG9kYXRhLmNv
dW50IjogMSwNCiAgIk5hbWUiOiAiU29mdHdhcmUgSW52ZW50b3J5IENvbGxlY3Rpb24iDQp9DQoN
CllvdSBjYW4gdGVsbCB0aGF0IGZpcnN0IGltYWdlIHdpbGwgYmUgcmVwbGFjZWQgYnkgdGhlIHNl
Y29uZCBvbmUuDQpEb2VzIGl0IG1hdGNoIHRoZSBzaXR1YXRpb24gZGVzY3JpYmVkIGluIHRoZSAi
RGVsZXRlIGFuIEltYWdlIiBzZWN0aW9uIG9mIGZpcm13YXJlLXVwZGF0ZS1vdmVyLXJlZGZpc2gu
bWQ/DQpXaGF0IGlzIHRoZSBleHBlY3RlZCBiZWhhdmlvciB3aGVuIGRvaW5nIFJlZGZpc2ggY29k
ZSB1cGRhdGUgd2l0aCBtdWx0aXBsZSBmaXJtd2FyZT8NCg0KVGhhbmtzDQpCZXN0IFJlZ2FyZHMs
DQpUb255DQoNCg==
