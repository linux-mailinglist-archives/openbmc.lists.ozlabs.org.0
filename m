Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95062698FC1
	for <lists+openbmc@lfdr.de>; Thu, 16 Feb 2023 10:27:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHV382qW1z3cdg
	for <lists+openbmc@lfdr.de>; Thu, 16 Feb 2023 20:27:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=HF8aH+BY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::717; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=HF8aH+BY;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20717.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::717])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHV2T0Qd0z3cH9;
	Thu, 16 Feb 2023 20:26:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQxPozULysqjrXzXqeBn44+OGvYF/B6P6W7cQ4qq88Z4/z9T4XBAXhubdC+BPc8VSVhzJSzXaT6aIgC1iMpTwqcDE7ZmnJxA/gWulUUeG2WTyyxf3ejRJtYe6kzfZcHRQOhVb65ZWejBXGaAQIFpPyKIETnEn3Nfuphfz9sAPH0F6Wit5MlNqIpnuFhXs8G/KFBA01jhpzhM1rvGhkqfax0tawRe9DIdG6mR1pjMKnpsSE9cBjQ4K+wJb+nHzDnBjjdNGLPahAD9Vyx9tix0gx5BCixQpTe0Mb+qUElRQ+9MI8t5u0KEqr+XVKKY5BdRxIeX2JOwpl19ed9VZbrwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g38FmdhRdefM/TAwdI6sQhQ9Eg+qWGH1u7Zdr8gBwiE=;
 b=j9suxGd9gnfx4/OhINpAqhAEp9S+BwUA0LdghbwTPJ16+bcVQeiGQ3ZmyrGhSvZG+4im5x4U7z18xVC5FiOgLi1bzjXu91oSIRbhxp4T1ejSCjCWOwXL9CGqMKnXCsVY1sr4KxVXR63fKjX3u3Bxe/5QMDe0KpYC8E2+8h9Hvn8bZYxC+bG8tMqlMx0aJV0DDK9I0jadjDMW0VmjtkmeNxCfJSQKexQPC5twLft73M9Iqq4jEhZuXocbejKbDtvQ+7OW++NgJiiqtqJ8p+Qeq/EvWosZHA2IFgAPbYcWHzBUSrz4OAmB+4ntvF4VrqgXbzaaMxeajpY9wHKF132OQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g38FmdhRdefM/TAwdI6sQhQ9Eg+qWGH1u7Zdr8gBwiE=;
 b=HF8aH+BYPC2H9rTJC7VQ3Yr/ZLbaunMmafVtI4Fu4jX8GoiqNalXdpCV3Vw34jYNx9muF82zsWra2eLEDwk0KmUn0cuZJWYb5EYknOvSLoRUmWafQGCSlwlR1heTdFHcpJd/CLLQp0jyzg+EZ6CDxc3XGk52mmETCR5121pFewQ2vELNKXifoaSfsyT6HHdov1Wn6UtQ5gRIUtAp938raMk3wgpQYWFTTfZWzHieK3njvoURWWxe4CHdw87/5UFGehwaJfP0dC6mZzB4X3a3SrTVYj9mTfkCDneLPr3a46Y2XuDANjxG7ClzNhRUgP95xTPey/huYNyS1aPyunWmRw==
Received: from TYZPR06MB5274.apcprd06.prod.outlook.com (2603:1096:400:1ff::14)
 by KL1PR0601MB5550.apcprd06.prod.outlook.com (2603:1096:820:c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Thu, 16 Feb
 2023 09:26:37 +0000
Received: from TYZPR06MB5274.apcprd06.prod.outlook.com
 ([fe80::e7c2:8fd8:5892:6687]) by TYZPR06MB5274.apcprd06.prod.outlook.com
 ([fe80::e7c2:8fd8:5892:6687%9]) with mapi id 15.20.6111.009; Thu, 16 Feb 2023
 09:26:37 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 2/3] dt-bindings: i2c-ast2600: Add support for AST2600
 i2C driver
Thread-Topic: [PATCH v4 2/3] dt-bindings: i2c-ast2600: Add support for AST2600
 i2C driver
Thread-Index:  AQHZNii3UFiZnjoVzEOnbd7WD7fD4K67XHWAgBQ23XCAAPWKAIAA2h/AgAAA9ACAAAA2YA==
Date: Thu, 16 Feb 2023 09:26:37 +0000
Message-ID:  <TYZPR06MB5274B15C35A6030CB49BFD23F2A09@TYZPR06MB5274.apcprd06.prod.outlook.com>
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
 <20230201103359.1742140-3-ryan_chen@aspeedtech.com>
 <b0f55494-3a17-4d87-7b8f-5b078503cb53@linaro.org>
 <SEZPR06MB52690A1D06F3CFEAAF1FDBDEF2A39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <b58fad13-12d5-346b-9452-d345c7bf5327@linaro.org>
 <TYZPR06MB5274C8D759C5C762C12A1CE9F2A09@TYZPR06MB5274.apcprd06.prod.outlook.com>
 <c5aa358d-6fb8-9d4d-eef7-d3a8268229e8@linaro.org>
In-Reply-To: <c5aa358d-6fb8-9d4d-eef7-d3a8268229e8@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5274:EE_|KL1PR0601MB5550:EE_
x-ms-office365-filtering-correlation-id: 21f783d5-16f7-4795-7413-08db0fffe765
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  9BFGye4OqToDpPNvfSalVZxFrysXMTcKRsHczFy6M9f0btGCu0DjVooe3tsgDHFFO+5wS2qk/EPtFQgN+OwibXKsXJMkYpU2aCnaISXTdlAEWKV20iKlE0rxHC+IL3UjEvHMgrvLrCXOAzD1a1Fg7tiILkkHnQ6B0oU9VEDYQUDRoP53zdhJ67YTI7cQysr5DWloYEr8+9aYQmoowpuFEYThay2xNgcEYrss04HPNysDgXF1nT1kodPfnWwlyMnqRIWtwvEgOEwrruIgmfnsytnpwwszhRw3F70f2HJ7SZAGFxVFy3weYG5ou4V1S8R0cYaM+QvLUHipwxQJvYPsRhJHtP5PEwFxuG6+Maktu05OfljY8lKtcpDc9o5eoGD6hsuh83yYCgJo5UUocnzMH5R3w85x6fY5ehPArFaE3GNa94fz+dbpdA9YKC6i2+FYckPOdIUGHurkuYLjii4Sl/BeZRKwPXNor3OVF/5K4+gAiMgylXKIJ590dIUFLsfs7uuIpQcXoE5zacP5q8G6ReOnQBfgJsFwFKUqMdk0vCjFj9Uv/dntVpkCyRnIpyGNZhjBLa7cfTA9FztuyjNXRCGm6v+DWaS9/Hd6cBLtWQYL+euWl2FT6nR73myb/A/f9laYGdn7gnRnzcg53kmSdIe1bEJXdbm5ia25Kbqk8YSPQERYqc6UYTlAnhl0k0d8OvgBRi1tMppPigd6WmP6fJPaRd7fp0aEc3QZIAxkUdA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5274.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39850400004)(346002)(376002)(366004)(136003)(451199018)(2906002)(6506007)(83380400001)(7696005)(33656002)(53546011)(26005)(71200400001)(921005)(86362001)(9686003)(41300700001)(66446008)(478600001)(8676002)(64756008)(55016003)(52536014)(316002)(7416002)(66556008)(8936002)(5660300002)(122000001)(38100700002)(186003)(38070700005)(66946007)(110136005)(66476007)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bmlwS3FFWG55VlB3OG1jM1dvaytKMVpsNWI4NGR5VTZaYVAyRlZyZE9iM1Mv?=
 =?utf-8?B?S1pjR0hCNWZQTUw2R0RYZ1FjZXZzRGtGNkdOOTlTMkFoSFNqaFVzL2c0bHFt?=
 =?utf-8?B?cTV5WkZyWC8yd1Y1VTRiTU5USkdqOHg4ZjhDeXFyYXpkdEc0MkdhdUFsNUhH?=
 =?utf-8?B?bmVwdTdpQnBmaUlJR0RRY1BCcDY3VDZxa1NtRHRING1kMTVDdGJmOHpXbDBT?=
 =?utf-8?B?ZEpoZDBQWE91dXNsRUVQYkhRYlRWcUU0d3A1S21pV0hObXRkQzYxcjdDMGhl?=
 =?utf-8?B?KzZ2c0FEbEt6SUpSVmZQaGZXK0djMldxMDZyY2dGckhUZmhjL0VPZUNSdm5X?=
 =?utf-8?B?Y3JoSXB5QVg0UDd0NkE5bFVzQlZUSGFyQWhvZXo5SXNhRUxMZUZKOFJON0xL?=
 =?utf-8?B?TWVhaUt5cC85blR5Q043dWQvOXBFL2M1dkNDRFdTMHlmZTRlOHFuWGJVMzNP?=
 =?utf-8?B?QzFRQmdSQ3hvMGRUYU95Mk5KL2RaVHZzcUJKMUJhOExORmZvd3c3bVpPZEJt?=
 =?utf-8?B?T1BWbGxjRmo2Tll1YzJHcmw4RFNhelh4ZUpwVWNwMlkwOHJZcUlYN3BKS3Uw?=
 =?utf-8?B?OGhHdE56NU1OTHhHQ3pTbzR3b3k1blJYRzNRcWJqdU1qUnkyYUI5bEMvajMv?=
 =?utf-8?B?bG53RWpWRjhtQUpnazl5UkZuQnpEZ2xvcG16M3BmdjNuTERhNW9PTUpGcDZP?=
 =?utf-8?B?eE9ZTEJOY1IxR0p0VjV1TlBNaklTb2Z0aHVXWUJxL21aRGJJT1hpZ0doUjNr?=
 =?utf-8?B?Q0Q2cFp6NEYyak1lZHg1M3ZHUHhPM0J3Y3c1a0JNaTFsenMxQ0VpQ1RtcFcx?=
 =?utf-8?B?bzNITitsaWFxYzZWRXZqNW1sc2hmdm9ZOVFTUDJVdFN0aVJYSnQvNmpBdFNj?=
 =?utf-8?B?QWVjeHR6Z3N0OUw4TFQyYlUzeU5NK0lPK3JsbkJHWmh2Q3Z0OVlHTDEwQXYv?=
 =?utf-8?B?VzlpSnoxTkZVQXRHWHoxdWp2ZHRlbVM4ejMvZnZYOFYzUGdlWjZtNk5OMW9P?=
 =?utf-8?B?ejdmSnp5QkNRYWV2QlNmbTdVN2t5UXlQVDRkYVordUhQVGVwRytaQzAwOFRj?=
 =?utf-8?B?QWZ4MFVMUXI2dWxvc2VQYjBSbjdSeXcvbFBVdlpKdTYxUy9ycXZ6Vm43UUxn?=
 =?utf-8?B?d2NyR3oxN2ZMM21TMzB3Z2FCN3FSRlQ3bGY2YTZRTHZhWk5TSzJ5Nlo4ZEFt?=
 =?utf-8?B?b0pGRHRqaEh5TnRSTHhtckdzSk5BS1BTMTdWdlV1dnpuaWNtTU15bHdGM2tU?=
 =?utf-8?B?NStQSUs1SjNoeHY0QmkzQW93SXlocFpraVdPUVVOd2JMOWFXQm5tdjhRK1du?=
 =?utf-8?B?VFpJMFZHR3BvM3hCaG90eHk2THFkREZkU3dITkltZWZuVlhIUmQwNHRLSStn?=
 =?utf-8?B?ckx1dUdjNG5IQlBudldHS0xPNVB5VUYvaXhRblNsb3FRaE1GNi8zcmRhN3dq?=
 =?utf-8?B?YUxGVHVuTVFPNHpXSHdxOTI2bXo3ZWxLK0pqVU9vK3JPTFUxOGI0eHYyV3JP?=
 =?utf-8?B?ZWRYbDZvUTNCMmovL2RvMWFWUHRkL0pHa2JTTDVWbGZBYTdlTXFSVjhNSk5s?=
 =?utf-8?B?NGVKdXJHSWUwQ2VSb2RjanNaR0ROYWRHcVlMeFozVi9JVUd5T25OcHIrOGRR?=
 =?utf-8?B?OGlwMFI2VEJRZ1czdGxYdEF1S0RXU1BaSXhvdWkranRLclpqTEdyaDVrWTZX?=
 =?utf-8?B?OUFDNS96dG1NTWR1ZDlPc0VVeVhZbjg2S3FqWHltV2o2NjJsK0N5WmRTclNN?=
 =?utf-8?B?QXZXT214R0p2OHFwRUQrNnFkaVBiU2hWNU8rNTl2VnJMbTN2SkV0STZtNENp?=
 =?utf-8?B?c1RYL0QrTDZwK1hDMTBSMUZVS0Q4ajZMZWt2VDJGOGFSQ2R0cmVGZitlZkNk?=
 =?utf-8?B?QVJ0VGxOVjhDM0lHTXNqWmExbFlMdkQ0Y3NUMCtrS0gwU1FtUmtkZUY2TTlS?=
 =?utf-8?B?YWN0Z2tLeElaN2l6ODM2QVd3dDE5cXRyVWIyMmdWRGxEYVlIU1lYY2xqVGhU?=
 =?utf-8?B?L3RkSExKOWN6VzdSd3JhVWdkMW44cExkMVo0R2RGc1VyU0o3QXdJdkdRbzRy?=
 =?utf-8?B?VlFUc0F0M1l3U2pnZURrUlNqZXcvb1hiRHJSV2ZxbmtIelBuR0p1V2FyQkl3?=
 =?utf-8?Q?0UggTDjJlGvbS0qbrttL6FOJn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5274.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f783d5-16f7-4795-7413-08db0fffe765
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 09:26:37.5695
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7nx6Xap0C/RTe7sy6WrFbXgg3Z8XNyxWHHaAAr9adX9nuqoGb27hNFGyrsqDRmm9iBrv8/cPii5mn71LQeRcbP4LO3AUaOq2YrJcR1BaUXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5550
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

SGVsbG8gS3J6eXN6dG9mDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiBT
ZW50OiBUaHVyc2RheSwgRmVicnVhcnkgMTYsIDIwMjMgNToyMiBQTQ0KPiBUbzogUnlhbiBDaGVu
IDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+OyBSb2IgSGVycmluZw0KPiA8cm9iaCtkdEBrZXJu
ZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBs
aW5hcm8ub3JnPjsgSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT47IEFuZHJldw0KPiBKZWZm
ZXJ5IDxhbmRyZXdAYWouaWQuYXU+OyBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4
LmRlPjsNCj4gb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnOyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMi8zXSBkdC1i
aW5kaW5nczogaTJjLWFzdDI2MDA6IEFkZCBzdXBwb3J0IGZvciBBU1QyNjAwDQo+IGkyQyBkcml2
ZXINCj4gDQo+IE9uIDE2LzAyLzIwMjMgMTA6MjAsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPiBIZWxs
byBLcnp5c3p0b2YNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBG
cm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+
DQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAxNiwgMjAyMyA0OjE4IEFNDQo+ID4+IFRv
OiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IFJvYiBIZXJyaW5nDQo+ID4+
IDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+ID4+IDxrcnp5c3p0
b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1
PjsNCj4gPj4gQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT47IFBoaWxpcHAgWmFiZWwN
Cj4gPj4gPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7
DQo+ID4+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gPj4gbGludXgt
YXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4g
Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAyLzNdIGR0LWJpbmRpbmdzOiBpMmMtYXN0MjYwMDog
QWRkIHN1cHBvcnQgZm9yDQo+ID4+IEFTVDI2MDAgaTJDIGRyaXZlcg0KPiA+Pg0KPiA+PiBPbiAx
NS8wMi8yMDIzIDA2OjQzLCBSeWFuIENoZW4gd3JvdGU6DQo+ID4+Pj4+ICsgIC0gJHJlZjogL3Nj
aGVtYXMvaTJjL2kyYy1jb250cm9sbGVyLnlhbWwjDQo+ID4+Pj4+ICsNCj4gPj4+Pj4gK3Byb3Bl
cnRpZXM6DQo+ID4+Pj4+ICsgIGNvbXBhdGlibGU6DQo+ID4+Pj4+ICsgICAgZW51bToNCj4gPj4+
Pj4gKyAgICAgIC0gYXNwZWVkLGFzdDI2MDAtaTJjDQo+ID4+Pj4NCj4gPj4+PiBOQUsuIEl0J3Mg
YWxyZWFkeSB0aGVyZS4gUGxlYXNlIGRvIG5vdCB3YXN0ZSBvdXIgdGltZSBpbiBzdWJtaXR0aW5n
DQo+ID4+Pj4gZHVwbGljYXRlZCBkcml2ZXJzLg0KPiA+Pj4NCj4gPj4+IEl0IGlzIG5vdCBkdXBs
aWNhdGVkLCBhcyBteSBkZXNjcmlwdGlvbiBpbiBjb3ZlciAiIFRoaXMgc2VyaWVzIGFkZA0KPiA+
Pj4gQVNUMjYwMCBpMmMNCj4gPj4gbmV3IHJlZ2lzdGVyIHNldCBkcml2ZXIiDQo+ID4+PiBTbywg
dGhpcyB3aWxsIGJlIGRpZmZlcmVudCBkcml2ZXIgY29tcGF0aWJsZS4NCj4gPj4+IFRoZSBvcmln
aW5hbCBjb21wYXRpYmxlIGlzDQo+ID4+PiAgICAgICAtIGFzcGVlZCxhc3QyNDAwLWkyYy1idXMN
Cj4gPj4+ICAgICAgIC0gYXNwZWVkLGFzdDI1MDAtaTJjLWJ1cw0KPiA+Pj4gICAgICAgLSBhc3Bl
ZWQsYXN0MjYwMC1pMmMtYnVzDQo+ID4+PiBTbyB0aGUgbmV3IHJlZ2lzdGVyIHNldCBjb21wYXRp
YmxlIGlzICItIGFzcGVlZCxhc3QyNjAwLWkyYyIsIHJlbW92ZQ0KPiAiYnVzIi4NCj4gPj4NCj4g
Pj4gQmluZGluZ3MgYXJlIGRvY3VtZW50aW5nIGhhcmR3YXJlLCBzbyBJIGNsYWltIC0gd2UgYWxy
ZWFkeSBoYXZlIHRoaXMNCj4gPj4gaGFyZHdhcmUgZGVzY3JpYmVkIGFuZCB0aGlzIGlzIGR1cGxp
Y2F0ZWQuIE90aGVyd2lzZSAtIHdoYXQgYXJlIHRoZXNlDQo+ID4+IHR3byBJMkMgY29udHJvbGxl
cnMgYW5kIHdoYXQgYXJlIHRoZSBkaWZmZXJlbmNlcz8gV2h5IHRoZXkgZG8gbm90DQo+ID4+IGhh
dmUgcmVhbGx5IGRpZmZlcmVudCBuYW1lPyBCdXMgbG9va3MgbW9yZSBsaWtlIGEgbWlzdGFrZSB0
aGFuIGENCj4gZGlmZmVyZW50aWF0aW5nIG5hbWUuDQo+ID4gRm9yIG1pc3VuZGVyc3RhbmRpbmcs
IG9yIG1pc3Rha2VuLg0KPiA+IEkgcHVycG9zZSB0byBiZSBhc3BlZWQsYXN0MjYwMC1pMmN2Miwg
d2lsbCBpdCBtb3JlIGNsZWFyIHdheSA/DQo+IA0KPiBJIGRvbid0IGtub3cuIEkgc3RpbGwgZGlk
IG5vdCBnZXQgYW5zd2Vycy4gSSBhc2tlZCBoZXJlIHNldmVyYWwgcXVlc3Rpb25zLg0KVGhvc2Ug
YXJlIGRpZmZlcmVudCBpMmMgY29udHJvbGxlciwgYXMgSSBkZXNjcmlwdGlvbiBpbiBjb3ZlciBs
ZXR0ZXIuDQpUaGUgaTJjIG5ldyByZWdpc3RlciBtb2RlLCB0aGVyZSBoYXZlIHR3byBzZXBhcmF0
ZSBzbGF2ZS9tYXN0ZXIgcmVnaXN0ZXIuDQpBbmQgZGlmZmVyZW50IHJlZ2lzdGVyIHdpdGggb2xk
IHJlZ2lzdGVyLg0KU28gbm93LCBhdm9pZCBtaXN1bmRlcnN0YW5kaW5nLCBvciBtaXN0YWtlbi4N
CkkgcHVycG9zZSB0byBiZSBhc3BlZWQsYXN0MjYwMC1pMmN2Mi4NCg0KQmVzdCByZWdhcmRzLA0K
UnlhbiBDaGVuIA0K
