Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5CB6D3B2E
	for <lists+openbmc@lfdr.de>; Mon,  3 Apr 2023 02:47:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PqXKh172vz3cF8
	for <lists+openbmc@lfdr.de>; Mon,  3 Apr 2023 10:47:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=RRyqDvkM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::720; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=RRyqDvkM;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20720.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::720])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PqXJz1N3Pz3cBj;
	Mon,  3 Apr 2023 10:46:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g03uMy0fBtnZto0pvsLhFIKU7oh8Vroz9FV/pfNBGMtBRVjP9SQqlyHW/BIoQYZhZeaE9Oo9b7Ymu2Oole2oarLdNXMJi3x6PJcFY3duSl5hTMs5dJg+jJXXj7ZkIXcE/+ydGnHKqeSj3afbCPwOv6BsOboBX+zv35PdxMzgmbQmOsk0NhxPYqAAsLKBRhAP5+lmJsgnGLuoBccEuVLlK0BrYYGvZjDLTntYpNjBGnfTj8S9TZ8L9fKbTw4X8jPOuFHxta0mrRNW0dG2S/fa7zi5ZV3zPw/y8bMC8LeTT5qXnJhAKtIzgy3mUPqxUM2pcJvMhz3s01k0RpYZ7Q9zcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPcv5+dMCRsz0y2MKdB1Y/OZ6YRHWbj+KFGenTYKrhw=;
 b=ANEkyLJn5F2PhPm2W5N5fSU7UKaAQ/7MC2bH760ytsfCBdRhsMKwLM6dfdCV1H3QJD1/PyVG00IfuxjHJQnc03zQpN/xgUjgG6yozCdnwWOOGaU4cBQ/33pcoa/iRbTOZR1pp5iyRNz/dvMdI4Pn+2t9CZJRLWlcYZU6wjfQKmreG74EldG8UHloRTFFLypj1ZpXwxGJ/1PhLKLSHhz4MmxVdFigX91GNDgortyILZM9EZvOhsDg56Ly9Ivr8tPbL2COzdNq8fz2BTRix4XZZRUGtWpQEIkeQDiJ2oPypg/urOJ06Cr3MGKEUWyJEcmQKuBkR3QEIVSkZ5cVdvde+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPcv5+dMCRsz0y2MKdB1Y/OZ6YRHWbj+KFGenTYKrhw=;
 b=RRyqDvkMEMd6zzREnV4K9s7FMmoFmtZdz4VQc0Vlgam/PSgW+3bj4IAcfuvQkQe3SF0j4cjvz/QEo7p4vU8QXs/d2MhvcXU9u0TI2Ouc2r9XZISH0PApDfaajddTW4KnNsr7JiU8V2AkeR1CYfeVbJePXWpYvcktNriRuBNrKf1Ez2iVoLduEt4XokQ7NQtijGrJZhfGgtbOCSl8xY/Iha+trW22lM9irIsgSLA9W5osNcH5EbzOOCCWWXeyPW4D2R/jfnkF8ABbtpnNwJHAWc/EzJmeQBAeWxBSgU7m1NESuBf95eXvOB+jklUOmiT0tgkzX+F4tybfevBPyIiGeQ==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PUZPR06MB5721.apcprd06.prod.outlook.com (2603:1096:301:f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.29; Mon, 3 Apr
 2023 00:46:12 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6254.028; Mon, 3 Apr 2023
 00:46:12 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Subject: RE: [PATCH v8 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v8 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index: AQHZYtneonMxIe0/pEexazmStsWR9K8UjbEAgAQ3gnA=
Date: Mon, 3 Apr 2023 00:46:11 +0000
Message-ID:  <SEZPR06MB52699A4CC7FBC97507C70D74F2929@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230330073259.485606-1-ryan_chen@aspeedtech.com>
 <20230330073259.485606-2-ryan_chen@aspeedtech.com>
 <a4f12cc9-d9d2-2805-f9fa-58eafe0b976c@linaro.org>
In-Reply-To: <a4f12cc9-d9d2-2805-f9fa-58eafe0b976c@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|PUZPR06MB5721:EE_
x-ms-office365-filtering-correlation-id: d4eb0650-d199-4bdd-2371-08db33dcd28b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  5Y3jSpQiJNJ6K32k+0O2SwW1F6YDntFUdyHZpGN3c4RcijpRlIixeQ2luMpQzMO41wP40y8euTJ6ZoIB6gV4lUFYCYm9y48wGQEcJW3bFccAu/oxq6u2iHZb6gJ7UJFjJp+0iyb0wZTXNYfAt3StFYkPnIn0vIjhI9qz0eczkCpL05Fjl39yPwfuW93cX0S/rXMY8/JYzbrfxnPAfcOssfv48CELRlbmF1O7SPoNv0sIyRXBHpxlS6lu9JryX9Qm5D+I6RXdnNxhN9sBlOfVHB3t75qr4mg01EwsuUk+GLEtlnrRvy8FWFwh24vDWde1mIiw9C5fWniWwVy3qvq9DFLNULzE1EXSrVwliKQwFL9L1cG6Ya6DcNFXl1QD/s3d806DUQ9xywyp/GKJ/VHIlpVp6lnXHb7OVkxfJ9V0ZzjjjMOd/aNp4p4gzHo3qu5995eDI9MbmFc7BJnU+EU8qkwmkfAyRlH/q8UjdsUnVpaKzAtH9g2236CS9yRrNZz+9ugTRPXcRd64EoEMDzCcbH+VMs5/MhmMCvZ+Vi2pPy1bVYILWXTSn/pcOLeUM8U046NZ+9YISyFh3q8KpcyUVcjiTk1aVqZ0H7D7uaMqDN1SNa3+LIjzbaWNIaAZP9MX
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39830400003)(136003)(396003)(366004)(346002)(376002)(451199021)(38070700005)(478600001)(316002)(110136005)(7416002)(38100700002)(5660300002)(52536014)(8936002)(66946007)(76116006)(921005)(2906002)(41300700001)(122000001)(64756008)(66446008)(66476007)(66556008)(8676002)(9686003)(55016003)(26005)(6506007)(53546011)(33656002)(86362001)(186003)(83380400001)(966005)(71200400001)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TEloQUJUTlNNMVJQa0VLNjd3RFJHQldRZThrajJNOWZka0RZZDJGMFFQY292?=
 =?utf-8?B?SnlMaWtlQmg4M1VnYlhyQWFlc0poY3B1OW94RDJTNEFiUElTVmV4NldvK1ZQ?=
 =?utf-8?B?aEtKdndsSzNoZ1JYRFJhNDR1dTZvWnhORzR2WUw2dW9mVExHNHB6Q3BlVW53?=
 =?utf-8?B?cU1qdGllenNybzNrSGhSMDZEdW52MGdMeGM3Uzh6UElod2YvMWNVblo0Mko2?=
 =?utf-8?B?cGF3MW93Z0xyaHRGU0RYSWREQS9GT3F1azZ2U1hWNktPWVN0TDJVdVVxQnJD?=
 =?utf-8?B?cWIvZkRLY0cyRjhTS3dUM0YxU2hRdGRPektwRlpydFR6YnVQUldzZGJNeWo4?=
 =?utf-8?B?b0pwOVlPRWF3aEFPa2hVd2tHOTJKZ081ZU9UUks1UkMxR2J2Njc0V1UraTV5?=
 =?utf-8?B?VEZnbDFpOG5ZTEhhcytlL3dRbVVzby84WFhDMkdsN3dMRStXNDNmQ04waE1C?=
 =?utf-8?B?Q0llcW9VUGF3Yno5VVJBeVhHaFE3YldhSElaQmV3amZUdVBVWWdDZHY2QjNk?=
 =?utf-8?B?YjZ6UnVjUHEyUnlveGtHR3lEQW8yQlgxb2dPc3BwN1FFN1Vrakc4OVFZbzFU?=
 =?utf-8?B?Mm81dGdVQmRaYzBlMVc4RE9xQ3pTL0llejFLOGhXMHFxY2RrS1hHVktLT1Er?=
 =?utf-8?B?RzhsMHBDMjc4SjJKRGJPM1lVOGF1RHZjd21Od3YrcWRxamMvWmZldlJlbWY5?=
 =?utf-8?B?bCtUQ2ZzUm8rZGxwbnhJNVU4WDlZNElEK0N2bnFPRGd6bTd2RjhVUzBCQXY4?=
 =?utf-8?B?OTZiVWNxdUN6Y3ZrTm43aXhCNDhkWnRqOXd5N1VGZlF6bzM3ZTNpckY1YzBP?=
 =?utf-8?B?MUFpbFFVbUd4U01ZUWhVRUdDVFhTY2tvdmxVYzBpRW02RlhjeDFsTCtPTE5X?=
 =?utf-8?B?M3ZLdHBRM0o5RzVvVzJhbnZYOGhqZDRRM09vb1hyWmNJMlNaWmNtcGJ2Rlkx?=
 =?utf-8?B?dUEveVM5VjNsUW5ZOUlMUkxKZ0pUTXFoa3ZFdnJIZk1QZnlGWW9BYXlmZ1hN?=
 =?utf-8?B?TjFhdHVwNkduWjJIUGJMUVhvTEUzenFXVUNaSG92OXZ6OTBPR1hqR292cDBx?=
 =?utf-8?B?ckdBWWlCZDNJOHRNUURGSnIrNElOMlBuM0dlZTUyR0xGYjRRS0NaZTRCTXA4?=
 =?utf-8?B?NVJ3bGZ1TmcramVFQ2ZUTGFzczRzSitWZ3RlSVpvOVlsQUdoRlFXWG42RnFI?=
 =?utf-8?B?dTJhb1BzSEJCbHZuT25zWEg2TlN3OUQwQktDdE1MeTJLZDhGc1FtRm1BaXVV?=
 =?utf-8?B?V1hTdElqNlNlS1lvd1d3NFVaVzRHbHdUMEdBeXgzdmlpcmdIUlAvem51a3Ny?=
 =?utf-8?B?cmRJSDE2MDBuNExOSWNvajFob3FqVGZMdG81WjdUR1NYcW1Wc0RSNmVpSzVG?=
 =?utf-8?B?QkxINUZTdDhKVGxaVk9Fcm1EVUpRTDVOMmJSdjJVNjFGVFF0TWhxTExYUzBs?=
 =?utf-8?B?TTlSZk1zdnZTQWNhYTdOL2E1c1ovcFRsMFRLWGVTY0FSOVA4cUhpK2JCQ0U5?=
 =?utf-8?B?V0FTNWxPcGU1OFREVklLS3E1YnVRaDNOTUNDelJUR25rd3Y5Q282aUFvUHZN?=
 =?utf-8?B?UGtpZ0JVeUJCMFZxR1hxME9pYUJ3L1oxRGRhR3VjamRDK0Fid3djMXc3SnlN?=
 =?utf-8?B?QTQweTc1NXVEbHVqcGdNR3R3M2xuQ0FEOTMxZnFWcmQ4cU5jRWRMa3NaR2dY?=
 =?utf-8?B?L3NaL1VFdmI2bDlPUXdwejFMNHBQbDYzem9ReUNrdk5uRjNEd0NxK25USWsw?=
 =?utf-8?B?Sms2WWplUk5ObTJ2a04wampyQnlqWEhkaUw5cGFtak9xNXIzaDZhSlpTZ1Iz?=
 =?utf-8?B?NGY5VFZaNnRobFIvWVdaL043bmp0NTNvQmRaSjJLRkxQVEtsNG5VWEJhYVpz?=
 =?utf-8?B?Z3Q0OW51L1owVDd1MnVxNUlwWTB0TklEOXBKZUphbkdaOTF5TjFDK284bDBG?=
 =?utf-8?B?QVVhMmV6cmtzUFNyWDdXVndjMzIyM1QzK29pZUcwOS9CT1JIbnBpRWMvRmw3?=
 =?utf-8?B?b0E1aVU4S3JPalZvWGdMK0pXd0R4am0yWGNTZk1VUnhZalNPeDZqeTUwbjVW?=
 =?utf-8?B?SjczU0dpLzRkdm1ZeUFhNWFiczRlakxRVEk2RHVVakkyVDM4NVc5dmhhdmpS?=
 =?utf-8?Q?1fZoGH/a5qKPLSI8tVQkLWMut?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4eb0650-d199-4bdd-2371-08db33dcd28b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 00:46:12.0192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wo8hWnwg0K/rHPMMXRvJiIc5fB3HFCc8JMDqGowyd5GFI6BOwrutPrgiUqORJ3tfufdqlh3k1lPQ1EQwcMMIRYWZINBVbQ1YVfEl/qqYDlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5721
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGVsbG8gS3J6eXN6dG9mLA0KDQo+IE9uIDMwLzAzLzIwMjMgMDk6MzIsIFJ5YW4gQ2hlbiB3cm90
ZToNCj4gPiBGaXggdHlwbyBpbiBtYWludGFpbmVyJ3MgbmFtZSBhbmQgZW1haWwuDQo+ID4gUmVt
b3ZlIGRkcmVzcy1jZWxscywgc2l6ZS1jZWxscy4NCj4gDQo+IFR5cG86IGFkZHJlc3M/DQo+IA0K
PiA+IFVzZSBDb21wYXRpYmxlIGFuZCByZWcgYXJlIGFsd2F5cyBmaXJzdCBwcm9wZXJ0aWVzLg0K
PiANCj4gSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgYXQgYWxsIC0gd2hhdCBkb2VzIGl0IGV4cGxh
aW4gaGVyZT8gSXQgbG9va3MgdW5yZWxhdGVkLCBqdXN0DQo+IHJhbmRvbSBzZW50ZW5jZSBpbiB0
aGUgbWlkZGxlIG9mIGNvbW1pdCBtc2cuDQo+IA0KPiA+IEFkZCBhc3QyNjAwLWkyY3YyIGNvbXBh
dGlibGUgYW5kIGFzcGVlZCxnbG9iYWwtcmVncywgYXNwZWVkLGVuYWJsZS1kbWENCj4gPiBhbmQg
ZGVzY3JpcHRpb24gZm9yIGFzdDI2MDAtaTJjdjIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBS
eWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaTJjL2FzcGVlZCxpMmMueWFtbCAgIHwgNTYgKysrKysrKysrKysr
KysrKystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlv
bnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaTJjL2FzcGVlZCxpMmMueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2kyYy9hc3BlZWQsaTJjLnlhbWwNCj4gPiBpbmRleCBmNTk3ZjczY2NkODcuLjgx
ZThjZWQ2NDkwMCAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaTJjL2FzcGVlZCxpMmMueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pMmMvYXNwZWVkLGkyYy55YW1sDQo+ID4gQEAgLTcsMTAgKzcsNyBAQCAk
c2NoZW1hOg0KPiA+IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1s
Iw0KPiA+ICB0aXRsZTogQVNQRUVEIEkyQyBvbiB0aGUgQVNUMjRYWCwgQVNUMjVYWCwgYW5kIEFT
VDI2WFggU29DcyBEZXZpY2UNCj4gPiBUcmVlIEJpbmRpbmdzDQo+ID4NCj4gPiAgbWFpbnRhaW5l
cnM6DQo+ID4gLSAgLSBSYXluIENoZW4gPHJheW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCj4gPiAt
DQo+ID4gLWFsbE9mOg0KPiA+IC0gIC0gJHJlZjogL3NjaGVtYXMvaTJjL2kyYy1jb250cm9sbGVy
LnlhbWwjDQo+ID4gKyAgLSBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCj4g
Pg0KPiA+ICBwcm9wZXJ0aWVzOg0KPiA+ICAgIGNvbXBhdGlibGU6DQo+ID4gQEAgLTQ5LDYgKzQ2
LDI1IEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICBkZXNjcmlwdGlvbjoNCj4gPiAgICAgICAgc3Rh
dGVzIHRoYXQgdGhlcmUgaXMgYW5vdGhlciBtYXN0ZXIgYWN0aXZlIG9uIHRoaXMgYnVzDQo+ID4N
Cj4gPiArICBhc3BlZWQsZW5hYmxlLWRtYToNCj4gPiArICAgIHR5cGU6IGJvb2xlYW4NCj4gPiAr
ICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gKyAgICAgIEkyQyBidXMgZW5hYmxlIGRtYSBtb2RlIHRy
YW5zZmVyLg0KPiA+ICsNCj4gPiArICAgICAgQVNQRUVEIGFzdDI2MDAgcGxhdGZvcm0gZXF1aXBw
ZWQgd2l0aCAxNiBJMkMgY29udHJvbGxlcnMgdGhhdA0KPiBzaGFyZSBhDQo+ID4gKyAgICAgIHNp
bmdsZSBETUEgZW5naW5lLiBEVFMgZmlsZXMgY2FuIHNwZWNpZnkgdGhlIGRhdGEgdHJhbnNmZXIg
bW9kZQ0KPiB0by9mcm9tDQo+ID4gKyAgICAgIHRoZSBkZXZpY2UsIGVpdGhlciBETUEgb3IgcHJv
Z3JhbW1lZCBJL08uIEhvd2V2ZXIsIGhhcmR3YXJlDQo+IGxpbWl0YXRpb25zDQo+ID4gKyAgICAg
IG1heSByZXF1aXJlIGEgRFRTIHRvIG1hbnVhbGx5IGFsbG9jYXRlIHdoaWNoIGNvbnRyb2xsZXIg
Y2FuIHVzZQ0KPiBETUEgbW9kZS4NCj4gPiArICAgICAgVGhlICJhc3BlZWQsZW5hYmxlLWRtYSIg
cHJvcGVydHkgYWxsb3dzIGNvbnRyb2wgb2YgdGhpcy4NCj4gPiArDQo+ID4gKyAgICAgIEluIGNh
c2VzIHdoZXJlIG9uZSB0aGUgaGFyZHdhcmUgZGVzaWduIHJlc3VsdHMgaW4gYSBzcGVjaWZpYw0K
PiA+ICsgICAgICBjb250cm9sbGVyIGhhbmRsaW5nIGEgbGFyZ2VyIGFtb3VudCBvZiBkYXRhLCBh
IERUUyB3b3VsZCBsaWtlbHkNCj4gPiArICAgICAgZW5hYmxlIERNQSBtb2RlIGZvciB0aGF0IG9u
ZSBjb250cm9sbGVyLg0KPiA+ICsNCj4gPiArICBhc3BlZWQsZ2xvYmFsLXJlZ3M6DQo+ID4gKyAg
ICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlDQo+ID4gKyAg
ICBkZXNjcmlwdGlvbjogVGhlIHBoYW5kbGUgb2YgaTJjIGdsb2JhbCByZWdpc3RlciBub2RlLg0K
PiA+ICsNCj4gPiAgcmVxdWlyZWQ6DQo+ID4gICAgLSByZWcNCj4gPiAgICAtIGNvbXBhdGlibGUN
Cj4gPiBAQCAtNTcsMTIgKzczLDMwIEBAIHJlcXVpcmVkOg0KPiA+DQo+ID4gIHVuZXZhbHVhdGVk
UHJvcGVydGllczogZmFsc2UNCj4gPg0KPiA+ICthbGxPZjoNCj4gPiArICAtICRyZWY6IC9zY2hl
bWFzL2kyYy9pMmMtY29udHJvbGxlci55YW1sIw0KPiA+ICsgIC0gaWY6DQo+ID4gKyAgICAgIHBy
b3BlcnRpZXM6DQo+ID4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gPiArICAgICAgICAgIGNvbnRh
aW5zOg0KPiA+ICsgICAgICAgICAgICBjb25zdDogYXNwZWVkLGFzdDI2MDAtaTJjdjINCj4gPiAr
DQo+ID4gKyAgICB0aGVuOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIHJl
ZzoNCj4gPiArICAgICAgICAgIG1pbkl0ZW1zOiAyDQo+ID4gKyAgICAgIHJlcXVpcmVkOg0KPiA+
ICsgICAgICAgIC0gYXNwZWVkLGdsb2JhbC1yZWdzDQo+ID4gKyAgICBlbHNlOg0KPiA+ICsgICAg
ICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIGFzcGVlZCxnbG9iYWwtcmVnczogZmFsc2UNCj4g
PiArICAgICAgICBhc3BlZWQsZW5hYmxlLWRtYTogZmFsc2UNCj4gPiArDQo+ID4gKw0KPiA+ICBl
eGFtcGxlczoNCj4gPiAgICAtIHwNCj4gPiAgICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9j
ay9hc3BlZWQtY2xvY2suaD4NCj4gPiAgICAgIGkyYzA6IGkyYy1idXNANDAgew0KPiA+IC0gICAg
ICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiAtICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+
IA0KPiBXaHk/IEluZGVlZCB3aXRob3V0IGNoaWxkcmVuIHRoaXMgaXMgbm90IHJlYWxseSBuZWVk
ZWQsIGJ1dCBpdCBwb2ludHMgdG8gdGhlIGZhY3QNCj4gdGhhdCB5b3VyIGV4YW1wbGUgd2l0aG91
dCBjaGlsZHJlbiBpcyBub3QgZW50aXJlbHkgY29tcGxldGUuDQo+IA0KPiBBbnl3YXkgeW91IGFy
ZSBkb2luZyBub3cgd2F5IHRvbyBtYW55IHRoaW5ncyBpbiBvbmUgcGF0Y2guDQo+IA0KPiBodHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xOS1yYzUvc291cmNlL0RvY3VtZW50YXRp
b24vcHJvY2Vzcy9zdWJtDQo+IGl0dGluZy1wYXRjaGVzLnJzdA0KPiANClVuZGVyc3Rvb2QsIEkg
d2lsbCBrZWVwIHNpbXBsZSBmb3IgdGhpcyBwYXRjaC4NCkZvY3VzIG9uIGFkZCBzdXBwb3J0IGFz
dDI2MDAtaTJjdjIgcGF0Y2guDQpPdGhlcnMgdHlwbyBmaXggd2lsbCBiZSBhbm90aGVyIHBhdGNo
Lg0KDQpUaGFua3MNClJ5YW4gQ2hlbi4NCg0KDQo+ID4gICAgICAgIGNvbXBhdGlibGUgPSAiYXNw
ZWVkLGFzdDI1MDAtaTJjLWJ1cyI7DQo+ID4gICAgICAgIHJlZyA9IDwweDQwIDB4NDA+Ow0KPiA+
ICAgICAgICBjbG9ja3MgPSA8JnN5c2NvbiBBU1BFRURfQ0xLX0FQQj47IEBAIC03MSwzICsxMDUs
MTMgQEANCj4gPiBleGFtcGxlczoNCj4gPiAgICAgICAgaW50ZXJydXB0cyA9IDwwPjsNCj4gPiAg
ICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmaTJjX2ljPjsNCj4gPiAgICAgIH07DQo+ID4gKyAg
LSB8DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIv
YXJtLWdpYy5oPg0KPiA+ICsgICAgaTJjMTogaTJjQDgwIHsNCj4gPiArICAgICAgY29tcGF0aWJs
ZSA9ICJhc3BlZWQsYXN0MjYwMC1pMmN2MiI7DQo+ID4gKyAgICAgIHJlZyA9IDwweDgwIDB4ODA+
LCA8MHhjMDAgMHgyMD47DQo+ID4gKyAgICAgIGFzcGVlZCxnbG9iYWwtcmVncyA9IDwmaTJjX2ds
b2JhbD47DQo+ID4gKyAgICAgIGNsb2NrcyA9IDwmc3lzY29uIEFTUEVFRF9DTEtfQVBCPjsNCj4g
PiArICAgICAgcmVzZXRzID0gPCZzeXNjb24gQVNQRUVEX1JFU0VUX0kyQz47DQo+ID4gKyAgICAg
IGludGVycnVwdHMgPSA8R0lDX1NQSSAxMTAgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gKyAg
ICB9Ow0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K
