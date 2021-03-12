Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1C433845E
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 04:34:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxWf24NCQz3cLN
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 14:34:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=moH1piM2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=698a99c3b=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=moH1piM2; 
 dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Fri, 12 Mar 2021 14:34:34 AEDT
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DxWdk1JWfz3cKK
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 14:34:33 +1100 (AEDT)
IronPort-SDR: w4iWfMQLnnd4/0pB+AXT16SyKcfc4oUAlwFhVmBxFVcwHjyM49K8SFVv+bSsz7lnNZV08dFrRH
 UP7zslPr8t4Q==
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx02.quantatw.com with ESMTP; 12 Mar 2021 11:33:26 +0800
Received: from mailbx09.quanta.corp (10.243.91.106) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 12 Mar
 2021 11:33:26 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (10.243.91.252)
 by mailbx09.quanta.corp (10.243.91.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Fri, 12 Mar 2021 11:33:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7CUBFxQxT3649mw1gQipYWd4LB6+5PkYCLO87U8FwefbAOyq17uSiwbGQI/KIwQy7o4eoLCQ8684ba62to2FQ5cOFtZKwszJSmwWStRmao0358tO2vnvbq3FpJq2j2AGlmml0CIH7OqQM+qhTLoEhkqkjwJxb8fT4AfppeXNGDheWeKDDOWKLtjEPt2Tcm3w6yI+wOkii695/3asUrwZGf+W06c2ORe9SL28/8P0XJAPNXfoZ3jDFJg7l6gluy97K5INxVMObJDUVixqEPWy9Qv5/+Tf1wFOQyO5SJGS3q7eay14K2omrh4olpTpu2dBo/ptSESP712z7pSwHaBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fgmyKy5VJvNY5QLWpcYBPX9u80J7tUVlWdWvtrYzYE=;
 b=PLaZ9nPKDWGyh5urYbmHVSPbkat/8qtpPRvq/k4F8a73a0CbSr2dE+4bFBrXsUqp6sVpHM4RE8lfx/g3FJLpBXrLaRPOFBSBLKu1b7rx7xyUP6Rugv8i/msc28cPakU4jwXH8w9l8HIZPZGVBhIfLWXjWEUJpfuB4jGokWxZRiz3s6QOeY4JUxlE7j2Nj39yvQbg1hZUA4xmZhleopXD113B5wV9Oi3xvzRuzx1ZwQcCV238B7yfw4kP2G24vdLb0GaPteVIvZd+XgxXVYAAlhDe/iumZuJA5oaKjZ9bcCaa1/ZpMiCp03sKwq4PPN5Nuk+YpdUexTy+1r1dMmAGZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fgmyKy5VJvNY5QLWpcYBPX9u80J7tUVlWdWvtrYzYE=;
 b=moH1piM26tjJlSvU0FCoegZpDnvEd5U1zARUfJ/2dkykVy5ant///0RgvOOqRkW9pHQm0v/mDRB9l9jNzf88wZdbqt4wV7Jdhd3C57lOeI9zal/k3fAv6nvIXwuDdM/J+p8ihIxILG5JWB/Hzl4XBQHflUtVq4iPOYf4IB1hQdk=
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com (2603:1096:203:46::21)
 by HK2PR0401MB2020.apcprd04.prod.outlook.com (2603:1096:202:11::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 03:33:24 +0000
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::5d93:7698:49bf:3a21]) by HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::5d93:7698:49bf:3a21%5]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 03:33:24 +0000
From: =?utf-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH dev-5.10 v1] ARM: dts: nuvoton: Add Quanta GBS BMC Device
 Tree
Thread-Topic: [PATCH dev-5.10 v1] ARM: dts: nuvoton: Add Quanta GBS BMC Device
 Tree
Thread-Index: AQHXFt4ZoZpSr2EHMEiwSfZ/RxcQUap/qbPw
Date: Fri, 12 Mar 2021 03:33:23 +0000
Message-ID: <HK0PR04MB23396E1279E403671775CA3D8F6F9@HK0PR04MB2339.apcprd04.prod.outlook.com>
References: <20210310030952.26090-1-george.hung@quantatw.com>
 <CACPK8XfW-ZMkJbfemDMiJPn=i8sSiQ8nexwj6Q0c_x68Enn5+A@mail.gmail.com>
In-Reply-To: <CACPK8XfW-ZMkJbfemDMiJPn=i8sSiQ8nexwj6Q0c_x68Enn5+A@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [60.251.243.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a39d0916-b2cb-425e-655f-08d8e5079776
x-ms-traffictypediagnostic: HK2PR0401MB2020:
x-ld-processed: 179b0327-07fc-4973-ac73-8de7313561b2,ExtAddr
x-microsoft-antispam-prvs: <HK2PR0401MB20204B86F807A4413D92025B8F6F9@HK2PR0401MB2020.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DXIrkqu/VPmnJvk04VmhHR315sl294r9rROhbY5p1oggqQnF4oGWW0oEq0XVo3Ez5x7tL3CMxPoGxrRB6/gfpIeVLq/cHfQoF+tfe1I4F+1p2v9p84VCh1m28txxxQN6FVnxBvOovN1UPU6MXW9yRFaovozTc63HqheTZyTEfHAASoaEqz6TRGEpOyDe/YO3k5R6u1vnrutpFB9SH9PPZBVwv4A5sknmmNiv7Qg8CFjgYS5ggGl0poWpBXabfM3O0Iv+ZervOMit1d85a5kjaSedyo1pvZiPW9rLGRx9wv+SkPRUTmEr9JBKVydQBiIlLKtnaLq13Lvo4CT+1Au1MyJTNTucVnytwDJ30J2/uvcdgNI27dgQBPHsX4/Z5X2eb+cXr+tkL4lY74BjbbF//Lod4KUcZhIkWhsDG42xtPciqrdfc00/7VgLqXEBJpcmnxzXVxol13h8uObsUexsv97vJoPLYRuVrHJPmqOQ1lwKnEDBHWIfYGfd6oCI4qaT5WGwKIq4oNQaChPRcLSq/WmQDeV9Ndw17YwMFf8FpyWFhinW7j9D28YAYTz/mWUz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2339.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(9686003)(55016002)(6916009)(86362001)(33656002)(83380400001)(4326008)(66946007)(2906002)(76116006)(478600001)(26005)(64756008)(66446008)(5660300002)(54906003)(66556008)(53546011)(52536014)(6506007)(8936002)(7696005)(8676002)(186003)(71200400001)(85182001)(316002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bVQyclJieFM0eGVMMXB5KzBwOFl3QkJMUlk2S2x1R2ZSRFpVeTNDdTc0dmZ5?=
 =?utf-8?B?cHkrOExJT3FnS3BYOVIvRHcwVGd2WXpLekVJRWJrN2t4R1phVW1XZUpGTlR3?=
 =?utf-8?B?MGtqbHdGd1lYTjcvdGxleXVEcmdkU0RRbmZPZVFmbTlRM3h1NUNhOFRPWnV1?=
 =?utf-8?B?YXYzbWNHTjBHMGVHMXhVYVRSYUFheDdlVzFMQUlQNldDMXhBdlBYaFZvODlU?=
 =?utf-8?B?RmtWcDBGVml2V2FHaTB2MVRTaGJiK2pwVUtnWFVPcThFWmQzTlNtS05sU3Jj?=
 =?utf-8?B?RHB3L01DUmRuQnd2QU95ZlZoTU8rd29YNDBucFYxVEkzRm9ETE4zVEhaSUsz?=
 =?utf-8?B?Y0pWcTVMZ1NVZ0pEcG8vSVZ5elM3elp2enV6ZVFGRHhlNnMvT2Q0aDB0Rksy?=
 =?utf-8?B?NjFreXdFcEpXT0d0MkRMZjJUZkl1aTlxTnpHSWM0bTRXME0rbkNjQVFRM0hX?=
 =?utf-8?B?L1hQUnBMT21yRHlnQXNYZFhvd2Q1UmRxNUswY3pGVFlFbDVkeFpzbEtXRlRX?=
 =?utf-8?B?bkJJeEI5dkdKd2xXSldkb2huOXFPTVNzOE92bnJqajBoSUkzNXcrK2VQZWxB?=
 =?utf-8?B?T1JKbGlianYyOVF1bHZzNmQzS0JZODljUkJ5cnJjK09jbW81R29jbnVBZW9H?=
 =?utf-8?B?M3JpbXRjN1dIdU1MeHkzeU4raGVlazRRenE0N0ZJb05YUmtNUGJTa3ZYMXRI?=
 =?utf-8?B?U1BabWdUeXM2Q0I4VEhQdXhBeE9INHZNQXkreDJkQkpob2ZqN3NVd09qd0gw?=
 =?utf-8?B?dHpCczFwKytLMFFzNEVydHJVRTI0Q3YyTTJzQ0NUbE1jMUZGdWNLNzdQS0V3?=
 =?utf-8?B?azd3M2lYOS9UVi91alBxcVBaRUtobnlWbzQxaVRhdEFuYzU0aHoxRnoxRlBx?=
 =?utf-8?B?RWZGQjJaMS94c0lNd1pNUU95ZDdVSzNjQlg1QTRlZTZSV0gvblVmdmkrWlZ5?=
 =?utf-8?B?RkxtS1RQbWtTU2xtaGxXRzIwRnNKRWFpQjRYRG5YMTdNK0FnZlRMU0dLYUdE?=
 =?utf-8?B?WnIwaFhOdWRqd3hUR3JvY09UVlhCOVdlTHNmc3hpcFpyNUptc0Z0S21iN3JJ?=
 =?utf-8?B?aDRWMFY3c1hqMzk0YS94S29uZUkvbFoycWt0VzF6Z1F0bVMwVVVyTDBjMFpM?=
 =?utf-8?B?OGczeUtYbmVYRk9jdlNyRmNPYVlOaEZyR0FEZUpMNERINHFGL1BQNi92NjJm?=
 =?utf-8?B?MkRCeDl0Z1Z5andKK0RQTWpmaVJUa0xady9OOUt4VktOcWJKRkhlczlzeXYv?=
 =?utf-8?B?RGZycTUwcURzR2VyVG1pVEdqN3hNMm5WUWN6bkpHdVpTZDBHcXE4TmtkM0dl?=
 =?utf-8?B?OW1Dci9DUEM0NjRSdytQeEoyYUVXRTVMNEJIbnk0NFdUZmVkc1VOTEJNcVps?=
 =?utf-8?B?bjZsclFvTzBiZUJNUnphWHJBMkVMa3dRcVl2UkI4TE1MeUFGS3ppUlMvVnFN?=
 =?utf-8?B?Y1N1QjZqeUIzaDB3enlLd2lCNG1VdGJUNUFtMkVDSDFyMzBPTHJKVnNIZ2J3?=
 =?utf-8?B?VzZJeFAveDZFbHNESVNZVnEyQm9KZWhuL05tVzdlaTJYamdKcU5uN2ZUd2Vs?=
 =?utf-8?B?S25nWHVKN2JLUElFOWlnUEJsUkN5TWR2a0FTWXV2Vi9HL3c0akkvRnBadTZq?=
 =?utf-8?B?OFlaSi8vcmZkdlVYaUptcENtaWVUVFArS1FvTStVTXVaTGlXUHpsajRic3RY?=
 =?utf-8?B?bzJlUHhDYjcrNm03bjR6NHMranE2ODkyVDNiTzk0OGtrN1V5RW5BekhxRWtN?=
 =?utf-8?Q?/W/hr/Tcf93ZQsh0SKHZf22kbI7IdkQX0zegowC?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2339.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a39d0916-b2cb-425e-655f-08d8e5079776
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 03:33:24.0246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u3vOn1YL/+CvGqA0gliqSKrdIern1v76VIqImYATNcvvPSULy21pLEQD/mzCnWM3RLNbjADxfbYwY5nHM73QiFRGcExQgtQ8cl0BrHgkNEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0401MB2020
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
Cc: CS20 KWLiu <KWLIU@nuvoton.com>, CS20 YSChu <yschu@nuvoton.com>, Benjamin
 Fair <benjaminfair@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "brandonkim@google.com" <brandonkim@google.com>,
 Tomer Maimon <tomer.maimon@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuYm1jDQo+IDxvcGVuYm1j
LWJvdW5jZXMrZ2VvcmdlLmh1bmc9cXVhbnRhdHcuY29tQGxpc3RzLm96bGFicy5vcmc+IE9uIEJl
aGFsZg0KPiBPZiBKb2VsIFN0YW5sZXkNCj4gU2VudDogRnJpZGF5LCBNYXJjaCAxMiwgMjAyMSA5
OjIxIEFNDQo+IFRvOiBHZW9yZ2UgSHVuZyA8Z2h1bmcucXVhbnRhQGdtYWlsLmNvbT4NCj4gQ2M6
IENTMjAgS1dMaXUgPEtXTElVQG51dm90b24uY29tPjsgQ1MyMCBZU0NodQ0KPiA8eXNjaHVAbnV2
b3Rvbi5jb20+OyBCZW5qYW1pbiBGYWlyIDxiZW5qYW1pbmZhaXJAZ29vZ2xlLmNvbT47DQo+IE9w
ZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz47IGJyYW5kb25raW1AZ29v
Z2xlLmNvbTsNCj4gVG9tZXIgTWFpbW9uIDx0b21lci5tYWltb25AbnV2b3Rvbi5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggZGV2LTUuMTAgdjFdIEFSTTogZHRzOiBudXZvdG9uOiBBZGQgUXVh
bnRhIEdCUyBCTUMNCj4gRGV2aWNlIFRyZWUNCj4gDQo+IE9uIFdlZCwgMTAgTWFyIDIwMjEgYXQg
MDM6MTgsIEdlb3JnZSBIdW5nIDxnaHVuZy5xdWFudGFAZ21haWwuY29tPg0KPiB3cm90ZToNCj4g
Pg0KPiA+IEFkZCBpbml0aWFsIHZlcnNpb24gb2YgZGV2aWNlIHRyZWUgZm9yIFF1YW50YSBHQlMg
Qk1DIChOUENNNzMwIFNvQykNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBIdW5nIDxn
ZW9yZ2UuaHVuZ0BxdWFudGF0dy5jb20+DQo+ID4gLS0tDQo+ID4gIGFyY2gvYXJtL2Jvb3QvZHRz
L01ha2VmaWxlICAgICAgICAgICAgICAgIHwgICAgMSArDQo+ID4gIGFyY2gvYXJtL2Jvb3QvZHRz
L251dm90b24tbnBjbTczMC1nYnMuZHRzIHwgMTIzMw0KPiA+ICsrKysrKysrKysrKysrKysrKysr
Kw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEyMzQgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9hcm0vYm9vdC9kdHMvbnV2b3Rvbi1ucGNtNzMwLWdicy5kdHMNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZSBiL2FyY2gvYXJt
L2Jvb3QvZHRzL01ha2VmaWxlDQo+ID4gaW5kZXggYzU3NzI5ZjQwMTg1Li44Mjc4NWZlMmM4YmYg
MTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUNCj4gPiArKysgYi9h
cmNoL2FybS9ib290L2R0cy9NYWtlZmlsZQ0KPiA+IEBAIC0zNDAsNiArMzQwLDcgQEAgZHRiLSQo
Q09ORklHX0FSQ0hfTFBDMzJYWCkgKz0gXA0KPiA+ICAgICAgICAgbHBjMzI1MC1waHkzMjUwLmR0
Yg0KPiA+ICBkdGItJChDT05GSUdfQVJDSF9OUENNN1hYKSArPSBcDQo+ID4gICAgICAgICBudXZv
dG9uLW5wY203MzAtZ3NqLmR0YiBcDQo+ID4gKyAgICAgICBudXZvdG9uLW5wY203MzAtZ2JzLmR0
YiBcDQo+ID4gICAgICAgICBudXZvdG9uLW5wY203MzAta3Vkby5kdGIgXA0KPiA+ICAgICAgICAg
bnV2b3Rvbi1ucGNtNzUwLWV2Yi5kdGIgXA0KPiA+ICAgICAgICAgbnV2b3Rvbi1ucGNtNzUwLXJ1
bmJtYy1vbHltcHVzLmR0Yg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9udXZv
dG9uLW5wY203MzAtZ2JzLmR0cw0KPiA+IGIvYXJjaC9hcm0vYm9vdC9kdHMvbnV2b3Rvbi1ucGNt
NzMwLWdicy5kdHMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAw
MDAwMC4uMTUzNTdhZTk3ZWM0DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL251dm90b24tbnBjbTczMC1nYnMuZHRzDQo+ID4gQEAgLTAsMCArMSwxMjMzIEBA
DQo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gKy8vIENvcHly
aWdodCAoYykgMjAyMCBRdWFudGEgQ29tcHV0ZXIgSW5jLiBHZW9yZ2UuSHVuZ0BxdWFudGF0dy5j
b20NCj4gPiArDQo+ID4gKy9kdHMtdjEvOw0KPiA+ICsjaW5jbHVkZSAibnV2b3Rvbi1ucGNtNzMw
LmR0c2kiDQo+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4NCj4gPiArDQo+
ID4gKy8gew0KPiA+ICsgICAgICAgbW9kZWwgPSAiUXVhbnRhIEdCUyBCb2FyZCAoRGV2aWNlIFRy
ZWUpIjsNCj4gPiArICAgICAgIGNvbXBhdGlibGUgPSAibnV2b3RvbixucGNtNzUwIjsNCj4gDQo+
IEdpdmUgeW91ciBtYWNoaW5lIGEgY29tcGF0aWJsZSBzdHJpbmcgdG9vLiBlZzoNCj4gDQo+ICBj
b21wYXRpYmxlID0gInFhbnRhLGdicy1ibWMiLCAibnV2b3RvbixucGNtNzUwIjsNCj4gDQoNClRo
YW5rcywgIEknbGwgdXBkYXRlIGl0IHRvIG5leHQgcGF0Y2ggc29vbi4NCg0KPiA+ICsNCj4gPiAr
ICAgICAgIGFoYiB7DQo+ID4gKyAgICAgICAgICAgICAgIGZpdTA6IHNwaUBmYjAwMDAwMCB7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBwaW5jdHJsLTAgPSA8JnNwaTBjczFfcGlucz47DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHNwaS1ub3JAMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOw0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDE5MDAwMDAwPjsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHNwaS1yeC1idXMtd2lkdGggPSA8Mj47DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBsYWJlbCA9ICJibWMiOw0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFydGl0aW9uc0A4MDAwMDAwMCB7DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPQ0KPiAiZml4ZWQtcGFy
dGl0aW9ucyI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNh
ZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdS1ib290QDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGxhYmVsID0gInUtYm9vdCI7DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMA0KPiAw
eGYwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW1hZ2UtZGVzY3Jp
cHRvckBmMDAwMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbGFiZWwgPQ0KPiAiaW1hZ2UtZGVzY3JpcHRvciI7DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4ZjAwMDANCj4gMHgx
MDAwMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhvdGgtdXBkYXRlQDEw
MDAwMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbGFiZWwgPQ0KPiAiaG90aC11cGRhdGUiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDEwMDAwMA0KPiAweDEwMDAwMD47DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07DQo+IA0KPiBJcyB0
aGlzIGxheW91dCBjb21tb24gZm9yIGFsbCBudXZvdG9uIG9wZW5ibWMgbWFjaGluZXM/DQoNCkl0
J3Mgbm90IHRoZSBjb21tb24gbGF5b3V0IGZvciBhbGwgbnV2b3RvbiBvcGVuYm1jLA0KYW5kIGl0
J3MgdGhlIHNwZWNpZmljIGRlc2lnbiBmb3IgcXVhbnRhJ3MgY2xpZW50IG1hY2hpbmVzDQoNCj4g
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGtlcm5lbEAyMDAw
MDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGxhYmVsID0gImtlcm5lbCI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmVnID0gPDB4MjAwMDAwDQo+IDB4NTAwMDAwPjsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcm9mc0A3MDAwMDAgew0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxhYmVsID0gInJvZnMiOw0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDcw
MDAwMA0KPiAweDM1ZjAwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB9Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
d2ZzQDNjZjAwMDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGxhYmVsID0gInJ3ZnMiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDNjZjAwMDANCj4gMHgzMDAwMDA+Ow0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBob3RoLW1haWxib3hAM2ZmMDAwMCB7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGFiZWwg
PQ0KPiAiaG90aC1tYWlsYm94IjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZWcgPSA8MHgzZmYwMDAwDQo+IDB4MTAwMDA+Ow0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+
ICsgICAgICAgICAgICAgICB9Ow0KPiANCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIGdtYWMw
OiBldGhAZjA4MDIwMDAgew0KPiANCj4gUGxlYXNlIHRha2UgYSBsb29rIGF0IHRoZSBsYXRlc3Qg
dmVyc2lvbiBvZiB0aGUgb3RoZXIgbnV2b3RvbiBkZXZpY2UgdHJlZXMuDQo+IFRoZXkgbm93IGZv
bGxvdyB0aGUgY29udmVudGlvbiBvZiB1c2luZyBwaGFuZGxlcyB0byBlbmFibGUgZGV2aWNlcy4g
ZWc6DQo+IA0KPiAmZ21hYyB7DQo+ICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gICAgcGh5LW1vZGUg
PSAicmdtaWktaWQiOw0KPiAgICBzbnBzLGVlZS1mb3JjZS1kaXNhYmxlOw0KPiB9Ow0KPiANCj4g
UGxlYXNlIHVwZGF0ZSBhbGwgb2YgdGhlIG5vZGVzIHRvIHVzZSB0aGlzIHN0eWxlLg0KPiANCg0K
VGhhbmtzLCBJJ2xsIHVwZGF0ZSB0aGVtIHRvIG5leHQgcGF0Y2ggc29vbi4NCg0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICBwaHktbW9kZSA9ICJyZ21paS1pZCI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgc25wcyxlZWUtZm9yY2UtZGlzYWJsZTsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiAr
DQo+ID4NCg==
