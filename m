Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFF131D603
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 09:04:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgVjt1Cx4z3ccR
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 19:04:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.124;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310124.outbound.protection.outlook.com [40.107.131.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgVjg0TfQz3cWr;
 Wed, 17 Feb 2021 19:04:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWb3iqOIe3fmf9X9oyBu+kmN97tml8Jat7d+f8hiLLNcCA9QDQDOt0QbQyiSkmAEdOyyvSENA+xzdIAPKeh+RHqJQRU9B/p2tTIgh2FpW24BwRpuKyS5xyaA7FBAq9O/0bk2k6CgCGMVGz89C4/xRcb1eOSsH9sfp6QEs/oUkgBLSq2aQchFH7qCzylL2bwOznbj9e5wf5auSZygUiCwEzNAIJQAWLZpNlpTJwojPdZsNAhQgLKBpfdatgY9koBwIhZjJg3dBVyFFyP2kN04wJlgueWxf6aC50aS7s7Hd0EcYVi9/xfFbSja8U1ho7474n1niORQ0g+E7skhG0Ur7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWHsubXMInCaHDxmj5Gcl5m54riZn8yPXHKIE3s6yBc=;
 b=D3ehbZdMMOK1AusjL8k4an9osrQKc8TB27RlpUEHFvebDAab3cdqS8OERhQgNuGEyFMhd5CogVFept+ZbAqMrCyoNlgr1xt1rToLgYs/7+0nj/tCRBBl7HN7NymcXrpZh8kEoTBUF3c8INmqr8K4+YClnzW2sz71v9dbdjOICTo51SAFRhGffshbyv/yLwSH4SXop/ad8ftIclYDpYt77WE8iOAjB4bs+B+vTyRHpFkraanse+IpO8ldGQ/XS2F2aJR6oweC4N3Oa90uOQ7D44YJUNXz4lNAYAwtYX8r4Hh1Kqlc1XKFt7gtqi1Q0n6ENd+SEJX4DTwM6UBnfZrv6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK0PR06MB2113.apcprd06.prod.outlook.com (2603:1096:203:47::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.28; Wed, 17 Feb
 2021 08:04:17 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::394c:29f2:cb4c:55ed]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::394c:29f2:cb4c:55ed%3]) with mapi id 15.20.3846.041; Wed, 17 Feb 2021
 08:04:17 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH v5 1/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
Thread-Topic: [PATCH v5 1/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
Thread-Index: AQHW6ndtLpV90qI+i0aaOeinwbKhAKo6sL2AgCF0F+CAAAfHAIAABOBw
Date: Wed, 17 Feb 2021 08:04:17 +0000
Message-ID: <HK0PR06MB37793DD6817B097B7B085CF291869@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210114131622.8951-1-chiawei_wang@aspeedtech.com>
 <20210114131622.8951-2-chiawei_wang@aspeedtech.com>
 <85f00459-4a39-441e-8119-8e12f8132cfe@www.fastmail.com>
 <HK0PR06MB3779B25984A461E4A1ADEF1191869@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <CACPK8XdFLKg9k6snLSZrRzorxBeg1fLoqakm6J_8VCXh_=JEQA@mail.gmail.com>
In-Reply-To: <CACPK8XdFLKg9k6snLSZrRzorxBeg1fLoqakm6J_8VCXh_=JEQA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 593c0bd7-f2f4-4a22-0974-08d8d31a9fba
x-ms-traffictypediagnostic: HK0PR06MB2113:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB2113F6AB3DB1F2B8B86958CC91869@HK0PR06MB2113.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l4BssK2z1B12tanwp6Ji3REEuhci92tkg8/2wt2Qce559OJIWHDwjBiOtXdAXi4aC/laqogJBD/H8w3lBAMHz76aM1QavDcahakqI+VjRcZWK7OD7z1C9PfnOE/ML+tDSPfcFzkoGDQ5BovK4PEbWToMUBfq0ezPtadNujwAUe+T8vCOZSKt+e7YqqOkxbSTzMJ51O0h8XnikWVsg4oiu+iEF6ap1qu9XQ/Ja0CgbIMMSkF/v6NSmjOHCCgd+UNJ7plEA+tjN3IkjTuwGYQ2vlVvcY/0xpK+T4wfOhKhctaJ6+5PaavQXTEmaGtM6eRPZmZmQpH1vnK+t5zC3NydQlBSeAfJ3eWa8YLW1rtMsQWfakE3yxFImzFqBKpjlusWwrwn2BtQHvO0uxRT3T/Kvjh8kNH78UNdMmtC0QLPyEi+44THE6/gR4xH55rfXSVROERs6GfVHdZ0JfQJi9LAC7Tc1eK+gvkGWx0vAZKT3E5cXThK7n8ced2NTyy+MwssBWNvBfpvr5ExIhMqFlZtXQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39850400004)(396003)(136003)(366004)(4326008)(316002)(83380400001)(53546011)(7696005)(54906003)(26005)(8936002)(2906002)(33656002)(7416002)(76116006)(9686003)(66946007)(8676002)(64756008)(6916009)(66446008)(86362001)(52536014)(66556008)(478600001)(71200400001)(186003)(5660300002)(55016002)(6506007)(55236004)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NmdQMHM1UWRYclNGVTlBZHZVOUFPVkpmZE92bTJuZ3dYbTk0SXUvOEwzUVBL?=
 =?utf-8?B?T3FUS1gzUVJBTExHSHo3dmJTSXlyWlplcDR1UHFYR2kwNWFPWXA4Ykt6cWlF?=
 =?utf-8?B?dmIxRGhVMmZpb0xURHpRU0NaYkhRVHZZTDB4eGFUbGJVS3MyTWV4V2VNeHNN?=
 =?utf-8?B?bnUwMFJjL2U1SGZrRi8wUDZxMFhjVndhVkFJVWNid1A4dnYvcDhwZHFBQllF?=
 =?utf-8?B?ZHRleGNKOEdGS0V0ZVpFbkFyaGcrSUw4RkV2Y3FpUWZJRDkxcHZtbHNpMDNT?=
 =?utf-8?B?QWQ4c204V3hucGcxdy95cEtpL3JDekI2VzFCSmt2dEJZNVp2SGpsd24vOHpI?=
 =?utf-8?B?bmw2SHM4VzVlS2Z5NWhwNXlDeUQ1RDF2ZVA4bHY5R2xKeHhsNFovSDB3Vmsx?=
 =?utf-8?B?NkVQYXpDcmo5RjBWNGNXdEN2eXdmcXc1dXN0WW16aEV6TGd0OXBqcDM5NGxi?=
 =?utf-8?B?RmhYZHByTSsrVGpnMmNzaVhHOWZvK2ZGNG4rYUNSVlZjVFNjcUMzamZENFBw?=
 =?utf-8?B?WGhpN0x2aVpjNDg3bWlOQU5BSlEzeng1M0k0YlhOSW9zcmJSUVF2akJDdTAv?=
 =?utf-8?B?MU50N1ZhU21VbVUxcEdZUURqSlo4amlOZmNzRUJGQmFtc252UkdDblRGQW9K?=
 =?utf-8?B?b2szUndKeXFZQXZZejJ6eEI1cko1ZW9ublhOZUVqU0I3RTNNakhJNmpZM2dW?=
 =?utf-8?B?U0ppdjVEN0hrQmJvYkhPUTduaVhIMUd3RFJ2MDgwT1Z4a3hEVEV5NGo0WnBr?=
 =?utf-8?B?UWtlT0JEb3c2Vm4wclczRWc3Q1FITWRZZTExZjJ3OWJ5dUhjYXNLV3Q3NVlU?=
 =?utf-8?B?VFJQRzY3akpoYVg5R0RFM2ZwL3dTcTFiTmpMUVZEOVczRnUzMG52WDQwVlBB?=
 =?utf-8?B?V2FKREMydEVaaUNPZU10Y1ZFNmlGWVN1dzQ5MHhYZ2lmWk5HazRBYm5DQXk1?=
 =?utf-8?B?bjNYUUNVdHZhVGdUMDlPaDYwajR6Njdxdnc1M3J4ZDk1SC81WE41SXZFVHEv?=
 =?utf-8?B?bWdFT2tkQVRZRnhSemswT20vMHg0TTNBZEs2RzFXZXFXeXhkUDdsazA4ZXZs?=
 =?utf-8?B?cU1yam9lTVY5NUIyMitNVmE0NjB1eWdGUHhSVThHVFl6UFp3TExUQ24zTFQx?=
 =?utf-8?B?V0t0OGRNRkRGQnpNNHprWG5QckY1Ry83MDI0ZjZZZU5SdSttWCsvUWZkU3V4?=
 =?utf-8?B?eVJsaW5hVStxZXY5Z1V5N0ZlN0NNaitUcEZHaHRUZHVZVklseTIyTzZOTUJL?=
 =?utf-8?B?TlhYQUU0NTQzcEJNc0tHeStpVk00UXpzT2FVdmsrNUNhNjBXSUtOcGhHdUht?=
 =?utf-8?B?ckhCU0ZRUnpWQS9mMmxyZTJ1WmZhcC9JVmxiTFBHSmR3TE5WUFZYaFFEaUM0?=
 =?utf-8?B?NUYvRmtCdjlGSEptbkJSVWthNWYyTmcvT2dwdHRUdlhHWHRuOHA2ejgyOFM4?=
 =?utf-8?B?UHA3NlBVRU9iaWt1R2luWnJVSUUrSFNNQWRWWGNUVGVsWTM4ZUxMMU5xTFlI?=
 =?utf-8?B?eEpRV3lZOHkrNEhXV0JHSkpVa3g3b09UL2puM3B1UENtQVc5YmJqVXc0dmxj?=
 =?utf-8?B?S0hMQzMzWmN3eFpOc3Q2NStIV2FobmRlbU9WVlJOMzFROEpSL1FwRzJwTytq?=
 =?utf-8?B?K0VqWG1ON3BnMC9kYnl0b1Jkamt5Z1NYbzRYZ1lTWXpldDdpZEo3MEorSUts?=
 =?utf-8?B?SGZFN3pnNGQ2MDBsdVFIMEVqRmI3R3g1Z2dCdUVkb29JWFhscGRiSmo3ZUtv?=
 =?utf-8?Q?MD9K8AObl5nKvtdKNWokCHGdF/7nOHK1u5l6Vkl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 593c0bd7-f2f4-4a22-0974-08d8d31a9fba
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2021 08:04:17.4295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AfXnYMXSOCEMhtnUU+IkMYBlxydwbwmMSxmuckSAUvCceH0tW7k6MaOvnCZajM5o+LsZLcn6BPzmPU4Pqbetgqk8ZTvT9QAOC5KTm5vGdko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2113
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Corey Minyard <minyard@acm.org>, Andrew Jeffery <andrew@aj.id.au>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSm9lbCwNCg0KVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLg0KUmVhbGx5IGFwcHJlY2lhdGUg
YWxsIHlvdXIgcmV2aWV3IGVmZm9ydC4NCg0KQ2hpYXdlaQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgRmVicnVhcnkgMTcsIDIwMjEgMzo0NSBQTQ0KPiBUbzogQ2hpYVdlaSBXYW5n
IDxjaGlhd2VpX3dhbmdAYXNwZWVkdGVjaC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUg
MS81XSBkdC1iaW5kaW5nczogYXNwZWVkLWxwYzogUmVtb3ZlIExQQyBwYXJ0aXRpb25pbmcNCj4g
DQo+IEhpIENoYWl3ZWksDQo+IA0KPiBPbiBXZWQsIDE3IEZlYiAyMDIxIGF0IDA3OjQwLCBDaGlh
V2VpIFdhbmcNCj4gPGNoaWF3ZWlfd2FuZ0Bhc3BlZWR0ZWNoLmNvbT4gd3JvdGU6DQo+ID4NCj4g
PiBIaSBBbGwsDQo+ID4NCj4gPiBEbyB5b3UgaGF2ZSB1cGRhdGUgb24gdGhpcyBwYXRjaCBzZXJp
ZXM/DQo+ID4gQXNwZWVkIGhhcyBzdWJzZXF1ZW50IExQQyBtb2R1bGUgdXBzdHJlYW0gcGxhbi4N
Cj4gPiBXZSBob3BlIHRoYXQgdGhlIGZvbGxvd2luZyBwYXRjaGVzIGNhbiBiZSBvbiB0aGUgYmFz
aXMgb2YgdGhlIGZpeGVkIExQQw0KPiBsYXlvdXQuDQo+IA0KPiBBbmRyZXcgaGFzIGV4cHJlc3Nl
ZCBoaXMgc3VwcG9ydCBmb3IgeW91ciBjaGFuZ2VzLiBJIHdpbGwgdGFrZSB0aW1lIHRvIGNsb3Nl
bHkNCj4gcmV2aWV3IHlvdXIgcHJvcG9zYWwgdGhpcyB3ZWVrLg0KPiANCj4gV2Ugd2lsbCBzZXQg
dGhlIGdvYWwgb2YgaGF2aW5nIHRoaXMgcmV3b3JrIG1lcmdlZCBmb3IgdGhlIG5leHQgbWVyZ2Ug
d2luZG93Lg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gSm9lbA0KPiANCj4gDQo+ID4gVGhhbmtzLg0K
PiA+DQo+ID4gQ2hpYXdlaQ0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+ID4gRnJvbTogQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4NCj4gPiA+IFNlbnQ6
IFdlZG5lc2RheSwgSmFudWFyeSAyNywgMjAyMSA4OjI1IEFNDQo+ID4gPiBUbzogTGVlIEpvbmVz
IDxsZWUuam9uZXNAbGluYXJvLm9yZz4NCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMS81
XSBkdC1iaW5kaW5nczogYXNwZWVkLWxwYzogUmVtb3ZlIExQQw0KPiA+ID4gcGFydGl0aW9uaW5n
DQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4gPiBPbiBUaHUsIDE0IEphbiAyMDIxLCBhdCAyMzo0
NiwgQ2hpYS1XZWksIFdhbmcgd3JvdGU6DQo+ID4gPiA+IFRoZSBMUEMgY29udHJvbGxlciBoYXMg
bm8gY29uY2VwdCBvZiB0aGUgQk1DIGFuZCB0aGUgSG9zdCBwYXJ0aXRpb25zLg0KPiA+ID4gPiBU
aGlzIHBhdGNoIGZpeGVzIHRoZSBkb2N1bWVudGF0aW9uIGJ5IHJlbW92aW5nIHRoZSBkZXNjcmlw
dGlvbiBvbg0KPiA+ID4gPiBMUEMgcGFydGl0aW9ucy4gVGhlIHJlZ2lzdGVyIG9mZnNldHMgaWxs
dXN0cmF0ZWQgaW4gdGhlIERUUyBub2RlDQo+ID4gPiA+IGV4YW1wbGVzIGFyZSBhbHNvIGZpeGVk
IHRvIGFkYXB0IHRvIHRoZSBMUEMgRFRTIGNoYW5nZS4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogQ2hpYS1XZWksIFdhbmcgPGNoaWF3ZWlfd2FuZ0Bhc3BlZWR0ZWNoLmNvbT4NCj4g
PiA+DQo+ID4gPiBBbnkgdGhvdWdodHMgTGVlPyBJZiB5b3UgYWNrIGl0IHdvdWxkIHlvdSBiZSBo
YXBweSBmb3IgdGhlIHBhdGNoIHRvDQo+ID4gPiBnbyB0aHJvdWdoIHRoZSBBc3BlZWQgdHJlZT8N
Cj4gPiA+DQo+ID4gPiBBbmRyZXcNCg==
