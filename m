Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C812E7DE0
	for <lists+openbmc@lfdr.de>; Thu, 31 Dec 2020 04:38:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5v4y6mL7zDq63
	for <lists+openbmc@lfdr.de>; Thu, 31 Dec 2020 14:38:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=627c32753=scron.chang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=abIGyHVN; 
 dkim-atps=neutral
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4D5v475T2pzDqKM
 for <openbmc@lists.ozlabs.org>; Thu, 31 Dec 2020 14:37:39 +1100 (AEDT)
IronPort-SDR: t/H2/QvD5MKuai5+qP3QLrilXUrRJMFC/NNU6up+BlKpUQ3oUsFlR+aLTzK4WCcQ/ewQeQ4P5X
 5NkihM8R15SQ==
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx02.quantatw.com with ESMTP; 31 Dec 2020 11:37:36 +0800
Received: from mailbx06.quanta.corp (10.243.91.101) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 31 Dec
 2020 11:37:34 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (104.47.125.51)
 by mailbx06.quanta.corp (10.243.91.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4
 via Frontend Transport; Thu, 31 Dec 2020 11:37:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYzQDtquG5mPV4Htiomwtnj1vt42lcIlZWAj078mXIx3q5SQmaIZGeN3YrD8xdoZwL+O+m/kj9PwWZPm9vEfMLSzcPn/0yi1OLxWuczehMIhwgTs8ydM2IzE3EmRah9v4a87RvuHtLhRffRC1YxKtg1Gqh231H35Srn4jPeTS/YArhsehD/wDqgjTiVd8NEOyiubE4Jls/nzZpzGs9BInlXDudhtEF8WW81ZKnAAxLBQCp87GlMhIFy4fCAAYKJ6l7bQC9p2WfCjX+hbkNL6222eRhHwyDbhXRih+J2J9+o4F+jxFhK2BkEhxBYsCMz5xBaLKjvl3A3TNdek+2Ar8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bbbp5sL6MZrLPuB0YDhrOOBf5am5o7ysv3OyVVa5+Vo=;
 b=dQ5DXlHb7oOnpDRGYGu7IXYeuASlmtu+lB/Z8hVkbGfhvsfx3CQqtU11sww1wZH6VY0Aq0SJI8h5Sa+D/hCUhRsic9QRvvSmI+FlXS1mgQv5tUmEmLe0ABd40n7oE1+hTYe4zY/YQkKYfZFfuZ9Crkg8Ndp0W3UeeLsy7+pCOT0HB9k+aKw2XdOdW7S/0rJukT07lwlAtmNDm5FHeWSFA+cv7w6s/Jeb/L6N7ev7W2syjoY2wm690ienbndWE+swOJF3mz7oiZIRAJh6dwb7xo/Uzp9enKiJYBgPIto2LNfF8ReIwLyzSPadMRNykEh6/13xwoyYXPwvPwAWWLDiiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bbbp5sL6MZrLPuB0YDhrOOBf5am5o7ysv3OyVVa5+Vo=;
 b=abIGyHVNWcat1cXi+ibET8SPw0Zfh07ECydoVzJR1j0F3UBqXwmhYUyVtlI1WPwMnPvTORI5qbZJ+V4r7oM0u0I83y8acigbgpTPR5t/NNb24eY/bBNfgxonS35mlfdB3pq6GzyTtc+FLI9MPlaOA4sEpzfoEa5ZNQwfGX83bJg=
Received: from TYZPR04MB4416.apcprd04.prod.outlook.com (2603:1096:400:21::10)
 by TY2PR04MB4048.apcprd04.prod.outlook.com (2603:1096:404:8002::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 31 Dec
 2020 03:37:34 +0000
Received: from TYZPR04MB4416.apcprd04.prod.outlook.com
 ([fe80::e455:cdf7:7a3a:6e9b]) by TYZPR04MB4416.apcprd04.prod.outlook.com
 ([fe80::e455:cdf7:7a3a:6e9b%5]) with mapi id 15.20.3721.020; Thu, 31 Dec 2020
 03:37:34 +0000
From: =?big5?B?U2Nyb24gQ2hhbmcgKLFppfKptSk=?= <Scron.Chang@quantatw.com>
To: Ed Tanous <ed@tanous.net>
Subject: RE: [entity-manager]Should I add min,max to legacy.json?
Thread-Topic: [entity-manager]Should I add min,max to legacy.json?
Thread-Index: AdbdH6A8Opx47rgpRCuwFHgpVjfezAAJ6NUAAHYCR8A=
Date: Thu, 31 Dec 2020 03:37:34 +0000
Message-ID: <TYZPR04MB441610CB2A8BA480892C824086D60@TYZPR04MB4416.apcprd04.prod.outlook.com>
References: <TYZPR04MB4416F10FB143300652DAF8E286D90@TYZPR04MB4416.apcprd04.prod.outlook.com>
 <CACWQX82esvMYwAdGpSkb+EX0d8g+C84cFUU0oCDe6Kca4rfNKw@mail.gmail.com>
In-Reply-To: <CACWQX82esvMYwAdGpSkb+EX0d8g+C84cFUU0oCDe6Kca4rfNKw@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [60.251.243.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60082cc0-8f01-4a89-d8ce-08d8ad3d6929
x-ms-traffictypediagnostic: TY2PR04MB4048:
x-microsoft-antispam-prvs: <TY2PR04MB4048FCD8FC3D3EBB2AFC884486D60@TY2PR04MB4048.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: au/9CZae01/nEhTE6THNVRDrz3Lb8/NlJfDdbfXyR9wR4GhMymRD/A38+5GVFxbcXk/k6qGM5WNuScdq3txeS9R9mnDkIkQhEJGU+EbRt+Oeu2z9unPfbilwHvz9rNQ2BQ+AuAI1YpY6vfkME2XM928QSocoaUkZN7dVaOr5tclmWdSq1CnmfK/zhAgqKWkIXEjR4ICJVtIKTI2i0ahZ4KPpb5zXc51xRzIAYAsC31FbFtrhsNbQwA9HF8TIs3QCIA9Zfi3XEuDQ6RBLAGYdXsyHyT2h4uPECo0xhPAsRdzVUSjAf6eqOFM/EW6zEnPjcragfK4wEEorN+dz9ZNzQ54Lx39F2TpY7vMSpr4h9jRqRPa6Z9EbmZHEphDhI7sWnQEJ5z7B1JLEauTvWbfSgQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR04MB4416.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(478600001)(8676002)(64756008)(4326008)(33656002)(66556008)(55016002)(26005)(76116006)(71200400001)(2906002)(66476007)(66946007)(5660300002)(316002)(86362001)(6916009)(52536014)(966005)(7696005)(83380400001)(66446008)(186003)(53546011)(8936002)(9686003)(6506007)(45080400002)(85182001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?T3VwQTFud1JrdmFmdzBCYTJURjBXUTUzd2QxMUIwL1cyc095NmU4b0FLMlE0T0g4?=
 =?big5?B?dHJLVE03WWExbTQzRnh2RnhKQTFqVXR1dDFvd1JVT1pvcHR6b1JiUzJLR2J6bmFn?=
 =?big5?B?eEdyRzB3R2dPL2tNZHFmYnJ1dm53WlBVemtGZUwxcFZSejdHVkhGV28xT3R1QWJT?=
 =?big5?B?WDFZWnlaVXlhR0trMVcyR3Y5ZDM2OUpxNXFUTisvdnRYY1BZRlZzSXZST1dhUW9S?=
 =?big5?B?djZPYlFGN1NMOStJUnpJYkxWalhVU1ZHZk5VaUg4WnF4Qy9BazhiNm9mM3hBbkly?=
 =?big5?B?dGN2MEJTQ09DSVJzckJ3WTR1a0FRekloT2J3azhGSUp3QTg5SlUyWitPMTB3NitJ?=
 =?big5?B?RURWNTZPeEFuelJZRS9DREtneHc4UitkMithZTJsbE9lamcvNndYMW9TYS90aTEr?=
 =?big5?B?Qkg2QndONGVKUXU2S1lCK1J4TnRsRGxTSERveVFOd1F3WXJZbkhvSVdNaFZRQWlZ?=
 =?big5?B?NWZtbDN5dmRSbk5LcXNkU2ZYWGZ4UTBwU3M0cG5NRmovT1BjU2c1bXUzRTl2Zmtp?=
 =?big5?B?SnZDc1h1M21RdVlydHE3ek4weHFpbkplT3Z6Y1QyUWMwcjl4aXBGcFZpTUNFaC9Y?=
 =?big5?B?Z2xKVHFiMXdsTmRURGxKbHJxZXhhRmlJcHNmb2NOSzZTeHJ1aVZtaGxwMHNTQU5J?=
 =?big5?B?L0dEQy9VN21QTnlLTDJaeGJVLzBpYnVWVFMwalQyZVU1aDFBUmg5WjBjeWh5aW1Y?=
 =?big5?B?L1I2cjZlTzBUVEhIT3dML2JWMmp5ZFd5VmU4OCt4YVFEK1Jza3Axdm9TaXhJMlBR?=
 =?big5?B?NXBFZ1VxSzJaaG9ocFZFV0ZmV0tyWEN5ODlERlZMUkxGbjIvc25BeGFMYmc4RmMx?=
 =?big5?B?ZTJMa05ZV0lZTHN0Mm40R0V6Y3EzWE11MWE0c2N0T1p4SklVd2xpSEx4ekJjQTRy?=
 =?big5?B?V1JpSE5JcVRCSkpiRFFXUWpCSFpkcjczbi9JQ3dpNDVpYTRycUZnLzRCdFhDQWN1?=
 =?big5?B?cFBJRnhRUzVCNVJWQ3JKOTMyWGVNMnlvRWxVM1FwUDl4WVFuWmY3YWdFUGQzTllk?=
 =?big5?B?djNsK3JSNWJSZTRKME1BcXJudTJRRVNlcXZidWp5ZFhSVDZLVFlhalNyckkzZDhm?=
 =?big5?B?UUt3LzdMUmtUUUxjTlF4TXRCbS82OEI4eG12TWFaZHRSeERpRkFDTlNkRWxKTDZz?=
 =?big5?B?ZUhBcGlmUlU2ckxSdXNHRGpQM2MxekM3TXFqcEFvNkZsQmlGYmZvM2c4cHhRNklq?=
 =?big5?Q?7i4V1cSBMThf2/ORFeumzUUYnZqKNpdjtgj+mNEPH9w=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB4416.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60082cc0-8f01-4a89-d8ce-08d8ad3d6929
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2020 03:37:34.0710 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x33uCYBnIbe45OfHGWdLmLt16GG98xCLHD9E68sNyhI3D5dP3NHOPjSkhl8iHpGsMX84abqI3s6qPgWj5b5J/dUXnajOqmYNrblDICZUNLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB4048
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

SGkgRWQsDQoNClRoYW5rcyBmb3IgeW91ciByZXBseS4NCg0KSSBoYXMgc3VibWl0dGVkIGEgY29t
bWl0LCBhbmQgaGVyZSBpcyB0aGUgbGluaw0KaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0
Lnh5ei9jL29wZW5ibWMvZW50aXR5LW1hbmFnZXIvKy8zOTI4Nw0KDQpQbGVhc2UgdGFrZSBhIGxv
b2suIFRoYW5rcyBhZ2Fpbi4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEVk
IFRhbm91cyA8ZWRAdGFub3VzLm5ldD4gDQpTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAyOSwgMjAy
MCAyOjI5IEFNDQpUbzogU2Nyb24gQ2hhbmcgKLFppfKptSkgPFNjcm9uLkNoYW5nQHF1YW50YXR3
LmNvbT4NCkNjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBbZW50aXR5
LW1hbmFnZXJdU2hvdWxkIEkgYWRkIG1pbixtYXggdG8gbGVnYWN5Lmpzb24/DQoNCk9uIE1vbiwg
RGVjIDI4LCAyMDIwIGF0IDU6NTcgQU0gU2Nyb24gQ2hhbmcgKLFppfKptSkNCjxTY3Jvbi5DaGFu
Z0BxdWFudGF0dy5jb20+IHdyb3RlOg0KPg0KPiBIaSBhbGwsDQo+DQo+ICAgSW4gbXkgY2FzZSwg
bG90cyBvZiBkYnVzLXNlbnNvcnMvUFNVU2Vuc29yIGFyZSB1c2luZy4gUmVmZXIgdG8gdGhlIGhp
bnQgaW4gUFNVU2Vuc29yTWFpbi5jcHAgTDU3NiB0byBkZWZpbmUgdGhlIHZhbHVlIG9mIG1heGlt
dW0vbWluaW11bSwgbG90cyBvZiBvYmplY3RzIGxpa2Ugdm91dDFfbWF4LCBpb3V0MV9taW6hSyBh
cmUgZGVmaW5lZCBpbiBteSBjb25maWd1cmF0aW9uIGZpbGUuIEV2ZW4gdGhvdWdoIGl0IHdvcmtz
IChjaGVjayBieSBpcG1pdG9vbCBzZW5zb3IgY29tbWFuZCksIHRoaXMganNvbiBkYXRhIGNhbid0
IHBhc3MgdG8gZW50aXR5LW1hbmFnZXIvc2NyaXB0cy92YWxpZGF0ZS1jb25maWdzLnB5LiBUaGUg
cmVhc29uIHNob3VsZCBiZSB0aGVyZSBhcmUgbm8gb2JqZWN0cyBvZiBQU1Ugc2Vuc29ycycgbWF4
aW11bSBhbmQgbWluaW11bSBpbiBlbnRpdHktbWFuYWdlci9zY2hlbWEvbGVnYWN5Lmpzb24uIFNo
b3VsZCBJIGRpcmVjdGx5IGFkZCB0aG9zZSBtYXhpbXVtIGFuZCBtaW5pbXVtIG9iamVjdHMgdG8g
c2NoZW1hL2xlZ2FjeS5qc29uIGFuZCBzdWJtaXQgc2NoZW1hL2xlZ2FjeS5qc29uIHRvIHVwc3Ry
ZWFtPw0KDQpJIG1pc3NlZCB0aGlzIGluIGEgcmVjZW50IGNvZGUgcmV2aWV3IHRvIGRidXMgc2Vu
c29ycyAoSSB0aG91Z2h0IHRoYXQgaW50ZXJmYWNlIGFscmVhZHkgZXhpc3RlZCk7ICBZZXMsIHBs
ZWFzZSBkbyB0aGUgYWJvdmUuDQoNCj4NCj4gUmVmOiANCj4gaHR0cHM6Ly9hcGMwMS5zYWZlbGlu
a3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0aA0KPiB1Yi5j
b20lMkZvcGVuYm1jJTJGZGJ1cy1zZW5zb3JzJTJGYmxvYiUyRjIzYzk2ZTdjMjQ5YjQxZWZlY2Mx
MGJhN2FjYmE4DQo+IDI2MDNhNTRiOTk2JTJGc3JjJTJGUFNVU2Vuc29yTWFpbi5jcHAlMjNMNTc2
JmFtcDtkYXRhPTA0JTdDMDElN0NTY3Jvbi4NCj4gQ2hhbmclNDBxdWFudGF0dy5jb20lN0MxMTVm
MWZlMDk0OWI0MzhmNjY4MzA4ZDhhYjVlNzE5MiU3QzE3OWIwMzI3MDdmYw0KPiA0OTczYWM3Mzhk
ZTczMTM1NjFiMiU3QzElN0MwJTdDNjM3NDQ3NzY5NDI0MzA0OTE1JTdDVW5rbm93biU3Q1RXRnBi
R1pzDQo+IGIzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklr
MWhhV3dpTENKWFZDSTZNbjAlM0QNCj4gJTdDMTAwMCZhbXA7c2RhdGE9UElRcHhqd0JyS3kxNzJJ
YngzRW5mdWdkeXA5STNob3hwNThnUnJDanNybyUzRCZhbXA7cg0KPiBlc2VydmVkPTANCj4NCj4g
SSB3b3VsZCBhcHByZWNpYXRlIGFueSBzdWdnZXN0aW9ucy4NCj4NCj4gU2Nyb24gQ2hhbmcNCj4g
RS1NYWlsICBTY3Jvbi5DaGFuZ0BxdWFudGF0dy5jb20NCj4gRXh0LiAgICAxMTkzNg0KPg0K
