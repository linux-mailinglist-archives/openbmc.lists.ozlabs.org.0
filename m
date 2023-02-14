Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6616957AD
	for <lists+openbmc@lfdr.de>; Tue, 14 Feb 2023 05:03:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PG6xw0szZz3c9H
	for <lists+openbmc@lfdr.de>; Tue, 14 Feb 2023 15:03:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=W5qLUhJ0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amperemail.onmicrosoft.com (client-ip=2a01:111:f400:7eab::70a; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=thang@amperemail.onmicrosoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=W5qLUhJ0;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2070a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PG6x66HFcz2yHZ;
	Tue, 14 Feb 2023 15:02:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gv9saCFBz3qAzwTyIvWE+dikeIQaG0O0dxCcg5Zy690s68nZv8AIMMcWPypmX0ETVqT4Za+zS1xqbkHqi7XcCnMwGzJIiKhFLovZnqBqCegU5vrdb5kr2ndWiVcSiPouliM2UxL9xctsifp9dDactc7L+w4CqaBnJ5EJq7xqtsJi6uXGX5+anpouHG3hujFQcQVI6wASN1WTkDOE5L6F+D3DzTIKu4ExRsbMqrRuw6hWuTSG5LXpHcYzbFaLlphhdzN6RI0eRcUe/fSWiPYbSggvUDxPBdTl9KmxPzK09Cbln1GabZIsWvQLixrXeox+8E1V1TzXPyTkpyFPdVS+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eV0pVzVRhcccpOxHeMsKIOtyyFrh5ujz8AuMjiXNZJs=;
 b=kmqiK7kdkY2P+PG8T6TSUoi/gIhPhcejJfZ89sP/cky4P1Yv644yN+8cB1/phcW3sIGoqe9WIYGMMjqXxbM5+Ppe0wBRUUvPKG6qfvmOcLM01CMArZ0aoRKX021H5hrFs5BzF9E3d6akRnSYKWR5Lrnx5Ja5dqGvC5umeJ84imC+iqmL8SmwLkWRHY9ESUuZupH6mZ60OCDVMHztcGMb8WMSDpSreHWE15ClsQkdt38eFaekQWWwGmcSRzqlL5Y16wkPSNCzJuAZqyCfJg4UCkJ4U+V3kick9P/xT/F8joRJggplKF3fc8Xvminxt+LfU2GAFIHFD14T2e9w6WtBwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amperemail.onmicrosoft.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eV0pVzVRhcccpOxHeMsKIOtyyFrh5ujz8AuMjiXNZJs=;
 b=W5qLUhJ0Vofc3kcteopN2OBVkiTVoUoLqdHiqGzgyHJGcrCyLqkLw92wza+tnZZA4Nn89mEzACLUzc+/BxhvigsGTfxMWjRnYlU3DxcSjyTdVDFNJJkkMgfYL1JlyMbOak0lrBwPUIk24xSogDeMa74ZvzWOsPy2sU2YFFQJos0=
Received: from BL1PR01MB7747.prod.exchangelabs.com (2603:10b6:208:39a::12) by
 MW4PR01MB6308.prod.exchangelabs.com (2603:10b6:303:7e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.22; Tue, 14 Feb 2023 04:02:07 +0000
Received: from BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::312:9731:3f7b:1945]) by BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::312:9731:3f7b:1945%6]) with mapi id 15.20.6086.020; Tue, 14 Feb 2023
 04:02:07 +0000
From: Thang Nguyen OS <thang@amperemail.onmicrosoft.com>
To: Quan Nguyen OS <quan@os.amperecomputing.com>
Subject: Re: [PATCH] ARM: dts: aspeed: mtjade: Add SMPro nodes
Thread-Topic: [PATCH] ARM: dts: aspeed: mtjade: Add SMPro nodes
Thread-Index: AQHY+xo50tnf92VNAEmBHAe6iIQcqa7OW/MA
Date: Tue, 14 Feb 2023 04:02:07 +0000
Message-ID: <32FE8D60-98AF-4134-8FB0-46B0CE7CA420@amperemail.onmicrosoft.com>
References: <20221118065109.2339066-1-quan@os.amperecomputing.com>
In-Reply-To: <20221118065109.2339066-1-quan@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR01MB7747:EE_|MW4PR01MB6308:EE_
x-ms-office365-filtering-correlation-id: 6bd6404f-72c4-4325-2d75-08db0e403d74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  n8KnRAWcv1I6b1xXWjA5Z0fWlhvkiBbf8uZnISy7cr8BnQ7A13rSVDBh2rFqw/sccpbgbYYhzK+9QPzgOVX0TfpOkdQ5iWJexjJ0tv13H4F9piSL1Nv2TL48pbFSvOb4NRyoNn+hV0h1y9Xj40BtjXk5JzPuGVhuWS/vZwW2U/+5fX7Sd3uLDU/Vr9B2YYgfjub0cGoU+qMTyWZ0W3C8AC2SYs2xC99MR6kuAc57g6HUXNmHINL3dUZl5I1Wo09/2+6HBO7wpZgCRqDozLBTzXieNOhQ57erTaaQo8J794pes4fm2Z04UtEirRE2K5o3jMPvQL/CsaUR+tNbLc9jXNoUU1ZRNKk8Rib0QvbgdhnzFzVohT9PyKgYKWekDFzTuEmXppp5nfk10VV+I2BjYYoMXSfnXd1BBxV5nA7GzdwD09C5q0Jb3OGnIQh305eqeKhLjYy3ywM4/SdogY8JHS5u9z6VEsAJpD5lf9b3/vlzPLVoumFWJJ5HAw6CiiXQhsuPaTZ+vkSH1iG4lC2uKCYq6XCWwkZ0QRZNjt860MOw7OIUshMepZnwkzbfNwiMudZeuYclQx+N0kn+6sw94i55b9Gu2Id46cd/CWVPeRaTJgcz5jvHnTOAYQCRx/pYi8kgp4/Q9vWoqDJ+bMwTUHve+TEaqyQZJzeLShIl71ylUq31ts21ECVdjOwx8JPr
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR01MB7747.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(39850400004)(346002)(396003)(136003)(451199018)(966005)(64756008)(66476007)(76116006)(6486002)(54906003)(66556008)(8676002)(4326008)(66446008)(91956017)(316002)(166002)(38070700005)(86362001)(478600001)(33656002)(2616005)(6512007)(53546011)(26005)(66946007)(186003)(2906002)(6506007)(71200400001)(8936002)(6862004)(41300700001)(107886003)(122000001)(5660300002)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZlNxaS9wL1BOV1lOMTg1WVc3MlN0OUkvZy9reURzd1ptNktLbDJENlBWZ25r?=
 =?utf-8?B?emZrakV1STBleGN4ZUJ6eGJzUGlUK2RUYUhtanh0NFRtTmk0cDZKa3Btcm15?=
 =?utf-8?B?aFpWR1ZMNVpxWEhQbWpTM294UjRFN2RCL3hOQlNUMjdtZWhvUDI4WTZTK25Q?=
 =?utf-8?B?Rk1XaDZDY0ttUXIwTHZ0eTVuWjhNanFFcnVkYy9SWEM5YksrMGNXaVVhTVY0?=
 =?utf-8?B?ODgzazhNU3NaMEdSTzV4cjFEMWxtTC92T3haOWNpZGZHWVFya3JzeDhEem9L?=
 =?utf-8?B?YVBHTXFTcG1tN0x0eGhOTHI0VllpSFhWNUdpeW1tejM4VENYVE9NbG1yc2xE?=
 =?utf-8?B?TitVQjV0WXl0ejdiSFd0ZVhNMS91TnBSRlBGOGh1WWlneHg0c2t1NU9KSlo5?=
 =?utf-8?B?NHhOWGxQUmo2dFJRZkZPU0lYNDRWczVSSDhiS2RCMHFYMnB2a1BRclVZbkp1?=
 =?utf-8?B?ZGRvN09YcTdaT0NtM0llSVJEZWxQRDFYYUVPOHJhdUJaTlhBREZ4M2xaSDM3?=
 =?utf-8?B?SUZjcUMwcllUTy9JdE1XSUIrYTVpZUNYNXpvMDN3QlRWYVo4Z1BRMFZpUUhC?=
 =?utf-8?B?NVBJaC9HYVBtZVVIQ2FGVGdKbWRYWHY5Y1huYWZRemgzZ0RTeFRURlBvZ3d6?=
 =?utf-8?B?dlhiSUNGZXNQeFkycGJmQnd6QmNYQ2xLZi9UUWJNL3NTRWIvQW1RcjNYbWZD?=
 =?utf-8?B?VFBjWVFmRTM4YXZMeWN4Q3FnR0tMbUdmbVozcjl1VzZmSU5XbytISzZxM1pw?=
 =?utf-8?B?SmNqWTRiYkZmZDdsc2ZOc0pEODJqeWUwTDRZM2F5THVqSUZ5TlRxWFp3cUla?=
 =?utf-8?B?cWt4d0xiWUdZYy9GUFJSN1IwKzF1bVRhc3dmVS9DWXVEWU5YSzA5cDdTQW9X?=
 =?utf-8?B?cTREMFk0OVpGUjFybEQrN0pDeWZSOXNJTW1XWmdKZ21ObkxFK0RoT09qT3Ev?=
 =?utf-8?B?Q3pBMmE3N1NTdE5leUF1ZzJ2dWIyNXJCNlFTUTV5TGlKZE9CMlY4QWhrbjc3?=
 =?utf-8?B?K21hRXNDODRkY0VIZG5qYkZUVStyMm10U3pBTVhjTWdxendVUnhlcGcyNWNP?=
 =?utf-8?B?ek1YNTBKYk5JbEU0czVMWERlUmFFTWFiQmZORjdETDZETVNTZ3lreDFuc1ZH?=
 =?utf-8?B?TnRjNWRZdjVEVlEwa25OWHpubm9jK2t1NFVOS2ErT0RvVXJhZTNjazVVWHNB?=
 =?utf-8?B?Y1BHQUJMZkNRVVhsK0tjVlhhdXNDb0JwdEw1TkhNQlNDelFlTkNFRHhKQlZk?=
 =?utf-8?B?enFJVGJsVzN3cTVabGwvazl3bXBLa1ZIZlowTEErMHRBWkYrbWtUUkRjTnpi?=
 =?utf-8?B?WUlPTnYwcDdIcXJ0MURIWUwvbGZIMWM4bEFXdVZhK3hZRkR0dzhqMVFydE01?=
 =?utf-8?B?Mnd2UURmT3dnaEZhRTlpQkdZK2VLYlJReTFUYmZNSkNFSnRvM0JCUzAwY2Nt?=
 =?utf-8?B?cEpTb3kvWGRGaUZreUt5eThzdTRIOGc1aTlDMFNqeWV4eHcwV3k2V0NhZFZF?=
 =?utf-8?B?OVJrMklWVVpSY0lNZm9SSkRQNnhEU05HbWRsV0RzYk5aYTVYU2pYczJQeC9R?=
 =?utf-8?B?R1gzWUlUNEtzYTFocysvZ1gwYmh2UUNJamJtMTc5RHZPM1d5QTZ0OGwydmNq?=
 =?utf-8?B?QXppV2tNNjNMNUk3a0R3RHNzdDRmQTNzTHczSFJOYW5TRDRWeGlIbGhnUUpy?=
 =?utf-8?B?S3ZTVjh2RkNRZmVERk1qWm1rNU1iQ054K1NPTE9UcTE2eUo3NmZ5czgyeXhF?=
 =?utf-8?B?aTJqNTljSjJpUDdoYnNXN0xqdTdwd0hiKzkzTE11U0crU3d2REZ0RERLR2gw?=
 =?utf-8?B?cTZhcVFSYnRyclNVekJIbDg3OXdndUVyL29iNUdablhNS1BGaUF4US9uQTlT?=
 =?utf-8?B?dGUyelVyUFBYZXVISG9SdU1rNTU5RXlOVVNVTmoyZUxqSUtQeFJ2U09sYWxL?=
 =?utf-8?B?Sms1cFFBd3h1eEpKMnViTTJrWm9wRndET1RqbEdVeldrVXRWUnV5cXkycW1M?=
 =?utf-8?B?NDFaV2ZjOXRjZ3VidWU5QjhkVE1EOVV5cFpmeUphZ2Vwc1dzRm5ERFNCd1pF?=
 =?utf-8?B?K2FrV0I1RTg3a2tHSFU5ajhVM21XYTAxTERHR1JFNFZFWVJyaDdmQ0o2cjgv?=
 =?utf-8?B?WjIwN2VkN3VUV0ZDUW9WRTkraWcvTDJLRGdCT1gzcmdYY2QvZTlpZCtqZ1A1?=
 =?utf-8?Q?z04Pi1yOQgy6OdBde24sIQU=3D?=
Content-Type: multipart/alternative;
	boundary="_000_32FE8D6098AF41348FB046B0CE7CA420amperemailonmicrosoftco_"
MIME-Version: 1.0
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR01MB7747.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd6404f-72c4-4325-2d75-08db0e403d74
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 04:02:07.4620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WcRO+8sh5ZCmLmDd95Li8hLIyH81pbGJSV9hymSfji0zvNREYi3f0OoqlaG2u9glLYa1FpMcCXW/pnogcCvBi7PbVx2QBwVG+tZpQr0ahW1iKCiLjQovP/GYA/CvPkWu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6308
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_32FE8D6098AF41348FB046B0CE7CA420amperemailonmicrosoftco_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIDE4IE5vdiAyMDIyLCBhdCAxMzo1MSwgUXVhbiBOZ3V5ZW4gT1MgPHF1YW5Ab3MuYW1w
ZXJlY29tcHV0aW5nLmNvbT4gd3JvdGU6DQoNCkFkZCBTTVBybyBub2RlcyB0byBNdC4gSmFkZSBC
TUMuDQoNClNpZ25lZC1vZmYtYnk6IFF1YW4gTmd1eWVuIDxxdWFuQG9zLmFtcGVyZWNvbXB1dGlu
Zy5jb20+DQotLS0NCmFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtYW1wZXJlLW10amFkZS5k
dHMgfCA4ICsrKysrKysrDQoxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQoNCmRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWFtcGVyZS1tdGphZGUuZHRzIGIv
YXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1hbXBlcmUtbXRqYWRlLmR0cw0KaW5kZXggMzUz
MzU5ODIyZDdiLi4wYTUxZDJlMzJmYWIgMTAwNjQ0DQotLS0gYS9hcmNoL2FybS9ib290L2R0cy9h
c3BlZWQtYm1jLWFtcGVyZS1tdGphZGUuZHRzDQorKysgYi9hcmNoL2FybS9ib290L2R0cy9hc3Bl
ZWQtYm1jLWFtcGVyZS1tdGphZGUuZHRzDQpAQCAtMzU0LDYgKzM1NCwxNCBAQCAmaTJjMSB7DQoN
CiZpMmMyIHsNCnN0YXR1cyA9ICJva2F5IjsNCisgc21wcm9ANGYgew0KKyBjb21wYXRpYmxlID0g
ImFtcGVyZSxzbXBybyI7DQorIHJlZyA9IDwweDRmPjsNCisgfTsNCisgc21wcm9ANGUgew0KKyBj
b21wYXRpYmxlID0gImFtcGVyZSxzbXBybyI7DQorIHJlZyA9IDwweDRlPjsNCisgfTsNCn07DQoN
CiZpMmMzIHsNCi0tDQoyLjM1LjENCg0KSGkgSm9lbCwNCkNhbiB5b3UgYWxzbyBwaWNrIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4
dC5naXQvY29tbWl0Lz9pZD03YzA3NTUzODA3YzUxMjVjODlkZTI0MmQzNWMxMGMyMDZmZDhlNmJi
IHRvIGZpeCBVU0IgZ2FkZ2V0IGlzc3VlPyBJdCBpcyB0byBzdXBwb3J0IG11bHRpcGxlIGRldmlj
ZXMgKGkuZS4gdmlydHVhbCBtZWRpYSwgVVNCIEV0aGVybmV0LCDigKYpIGF0IHRoZSBzYW1lIHRp
bWU/DQoNClRoYW5rcywNClRoYW5nIFEuIE5ndXllbg0K

--_000_32FE8D6098AF41348FB046B0CE7CA420amperemailonmicrosoftco_
Content-Type: text/html; charset="utf-8"
Content-ID: <B09E2DBF3E90174AB8D9B4D977A159C3@prod.exchangelabs.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJvdmVyZmxv
dy13cmFwOiBicmVhay13b3JkOyAtd2Via2l0LW5ic3AtbW9kZTogc3BhY2U7IGxpbmUtYnJlYWs6
IGFmdGVyLXdoaXRlLXNwYWNlOyI+DQo8YnI+DQo8ZGl2Pjxicj4NCjxibG9ja3F1b3RlIHR5cGU9
ImNpdGUiPg0KPGRpdj5PbiAxOCBOb3YgMjAyMiwgYXQgMTM6NTEsIFF1YW4gTmd1eWVuIE9TICZs
dDtxdWFuQG9zLmFtcGVyZWNvbXB1dGluZy5jb20mZ3Q7IHdyb3RlOjwvZGl2Pg0KPGJyIGNsYXNz
PSJBcHBsZS1pbnRlcmNoYW5nZS1uZXdsaW5lIj4NCjxkaXY+DQo8ZGl2PkFkZCBTTVBybyBub2Rl
cyB0byBNdC4gSmFkZSBCTUMuPGJyPg0KPGJyPg0KU2lnbmVkLW9mZi1ieTogUXVhbiBOZ3V5ZW4g
Jmx0O3F1YW5Ab3MuYW1wZXJlY29tcHV0aW5nLmNvbSZndDs8YnI+DQotLS08YnI+DQphcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQtYm1jLWFtcGVyZS1tdGphZGUuZHRzIHwgOCArKysrKysrKzxicj4N
CjEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyk8YnI+DQo8YnI+DQpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1hbXBlcmUtbXRqYWRlLmR0cyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL2FzcGVlZC1ibWMtYW1wZXJlLW10amFkZS5kdHM8YnI+DQppbmRleCAzNTMzNTk4
MjJkN2IuLjBhNTFkMmUzMmZhYiAxMDA2NDQ8YnI+DQotLS0gYS9hcmNoL2FybS9ib290L2R0cy9h
c3BlZWQtYm1jLWFtcGVyZS1tdGphZGUuZHRzPGJyPg0KKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMv
YXNwZWVkLWJtYy1hbXBlcmUtbXRqYWRlLmR0czxicj4NCkBAIC0zNTQsNiArMzU0LDE0IEBAICZh
bXA7aTJjMSB7PGJyPg0KPGJyPg0KJmFtcDtpMmMyIHs8YnI+DQo8c3BhbiBjbGFzcz0iQXBwbGUt
dGFiLXNwYW4iIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPjwvc3Bhbj5zdGF0dXMgPSAmcXVvdDtv
a2F5JnF1b3Q7Ozxicj4NCis8c3BhbiBjbGFzcz0iQXBwbGUtdGFiLXNwYW4iIHN0eWxlPSJ3aGl0
ZS1zcGFjZTpwcmUiPiA8L3NwYW4+c21wcm9ANGYgezxicj4NCis8c3BhbiBjbGFzcz0iQXBwbGUt
dGFiLXNwYW4iIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPiA8L3NwYW4+PHNwYW4gY2xhc3M9IkFw
cGxlLXRhYi1zcGFuIiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj48L3NwYW4+Y29tcGF0aWJsZSA9
ICZxdW90O2FtcGVyZSxzbXBybyZxdW90Ozs8YnI+DQorPHNwYW4gY2xhc3M9IkFwcGxlLXRhYi1z
cGFuIiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj4gPC9zcGFuPjxzcGFuIGNsYXNzPSJBcHBsZS10
YWItc3BhbiIgc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+PC9zcGFuPnJlZyA9ICZsdDsweDRmJmd0
Ozs8YnI+DQorPHNwYW4gY2xhc3M9IkFwcGxlLXRhYi1zcGFuIiBzdHlsZT0id2hpdGUtc3BhY2U6
cHJlIj4gPC9zcGFuPn07PGJyPg0KKzxzcGFuIGNsYXNzPSJBcHBsZS10YWItc3BhbiIgc3R5bGU9
IndoaXRlLXNwYWNlOnByZSI+IDwvc3Bhbj5zbXByb0A0ZSB7PGJyPg0KKzxzcGFuIGNsYXNzPSJB
cHBsZS10YWItc3BhbiIgc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+IDwvc3Bhbj48c3BhbiBjbGFz
cz0iQXBwbGUtdGFiLXNwYW4iIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPjwvc3Bhbj5jb21wYXRp
YmxlID0gJnF1b3Q7YW1wZXJlLHNtcHJvJnF1b3Q7Ozxicj4NCis8c3BhbiBjbGFzcz0iQXBwbGUt
dGFiLXNwYW4iIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPiA8L3NwYW4+PHNwYW4gY2xhc3M9IkFw
cGxlLXRhYi1zcGFuIiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj48L3NwYW4+cmVnID0gJmx0OzB4
NGUmZ3Q7Ozxicj4NCis8c3BhbiBjbGFzcz0iQXBwbGUtdGFiLXNwYW4iIHN0eWxlPSJ3aGl0ZS1z
cGFjZTpwcmUiPiA8L3NwYW4+fTs8YnI+DQp9Ozxicj4NCjxicj4NCiZhbXA7aTJjMyB7PGJyPg0K
LS0gPGJyPg0KMi4zNS4xPGJyPg0KPGJyPg0KPC9kaXY+DQo8L2Rpdj4NCjwvYmxvY2txdW90ZT4N
CjwvZGl2Pg0KSGkgSm9lbCwNCjxkaXY+Q2FuIHlvdSBhbHNvIHBpY2smbmJzcDs8YSBocmVmPSJo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4
LW5leHQuZ2l0L2NvbW1pdC8/aWQ9N2MwNzU1MzgwN2M1MTI1Yzg5ZGUyNDJkMzVjMTBjMjA2ZmQ4
ZTZiYiI+aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4
dC9saW51eC1uZXh0LmdpdC9jb21taXQvP2lkPTdjMDc1NTM4MDdjNTEyNWM4OWRlMjQyZDM1YzEw
YzIwNmZkOGU2YmI8L2E+Jm5ic3A7dG8NCiBmaXggVVNCIGdhZGdldCBpc3N1ZT8gSXQgaXMgdG8g
c3VwcG9ydCBtdWx0aXBsZSBkZXZpY2VzIChpLmUuIHZpcnR1YWwgbWVkaWEsIFVTQiBFdGhlcm5l
dCwg4oCmKSBhdCB0aGUgc2FtZSB0aW1lPzwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+
VGhhbmtzLDwvZGl2Pg0KPGRpdj5UaGFuZyBRLiBOZ3V5ZW4mbmJzcDs8L2Rpdj4NCjwvYm9keT4N
CjwvaHRtbD4NCg==

--_000_32FE8D6098AF41348FB046B0CE7CA420amperemailonmicrosoftco_--
