Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B516ADB7A
	for <lists+openbmc@lfdr.de>; Tue,  7 Mar 2023 11:10:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWB6R62Cpz3chB
	for <lists+openbmc@lfdr.de>; Tue,  7 Mar 2023 21:10:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=sbo0O2hK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::701; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=sbo0O2hK;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWB5m3bb0z306l;
	Tue,  7 Mar 2023 21:10:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ysda5XBLrSrZE/4sRMoRzwkYdLFhvbC009Qu35wzk6T09FIBWAetTZiuphhWb8XaZ7beC+CKDEGk0Pue4hJsy/iWvjppsZ7rhCyYgHHMgWZxHlXfdvbjCE6ujqKK3/y6F3vz3eJaJLDI/CkZv+KRZlNUjvJPfCzQ8rGsiwAZh2msPGy1M6/7ZaTXGnGP/L1WMd38K/vXVRKQxhJ/92ysaF4dNEWnKv/3rFjO2R4qqlj3/GoMExRPrbgWtKCD/k0/f0kx+t78gbDoi7PatY2Hi4Cv/i55+UVlZi/1TaYU8J8M2++PQxsOmPjkw+f8pIVGh16HalelQr2vfy04lZkPHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4241G87oPbZiDWojvcA+rK7HSb09+Shci5HkzGj6qVk=;
 b=IItJzaDfxQDlL+/OvaPdAhvh7DK/E8C0EMFHbKLgKYsdfYXISRYssZwMVjGuooPN334RIQ4WhaOUy6nVcYjGJmgsuvD854poEnG/QRBcYnh2YjEQxSIK3kC55W7gS6fGWajP+x13HOWxax8d9MFDnJE7vH3gUfRO+fi2xLJYo+Ez8VjlkYkxt8ZIKFFDlA8+HMVMPHv0W1RcDcj/MUVV3ONvN509BbNqiB6UxowQd4H4Elw3z7ibqTyE3An74rCopF/u31wv2gMUC7FrVmqm3kVjKKK4YZ9NfN8uZvzJf2990JTbedDrxFvDSKl7ytvBFN8TXoRNEh9ETCgobChiyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4241G87oPbZiDWojvcA+rK7HSb09+Shci5HkzGj6qVk=;
 b=sbo0O2hKzIhQzonlZrnUkkVPRvzts/TJNiPzdLqzb57CIgufEUwhdKODbJDbJEu4Q2d5K/BR0n6eP/NeKd+Rs1KQ7Z96buqn2hmkOGiYSXa1KAFa3CdrDwY81Iazt22xpCZdg8pOO1SUsSnXXKvFvYTCmos2NsRtgynzk9VhPGJncskH03sK8JqPJWECzO0hSLSx4okJrC/TuIebOuRuwdUnnAzkM1mcJB5myr++UN2/xnX8vvqShk310bhvj5sQKLJulKSXRA6FH6eaM2wraOqgWNcfAdU5ZgnY0vkreoruLK8fBBhA/uTIaZAyRq6OiMTc5Rbu2+os8cOctXkEbQ==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4177.apcprd06.prod.outlook.com (2603:1096:820:2c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Tue, 7 Mar
 2023 10:09:52 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 10:09:51 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Wolfram Sang
	<wsa@kernel.org>
Subject: RE: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index:  AQHZSZBNCqcj9BIMLU6U/5WV2MINja7idvcAgALva/CAA1hsgIAAAQawgAAHfwCAAAAwwIAACb6AgAANnCCAAAdYAIAA+HuggAIdpoCAAPm8QIACD6wAgAAcw9A=
Date: Tue, 7 Mar 2023 10:09:51 +0000
Message-ID:  <SEZPR06MB5269CA376D572B6241FCAD4DF2B79@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
 <53090449-58c9-bc03-56df-aa8ae93c0c26@linaro.org>
 <SEZPR06MB52699DEB2255EB54F35C2A59F2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <fc20a2d1-e2f9-c22b-dcdf-153cb527eea8@linaro.org>
 <SEZPR06MB526902637624A97D7DFB8523F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c41ee6b5-ddb4-1253-de54-a295b3bab2cc@linaro.org>
 <SEZPR06MB5269E7B8785B3CB56A63A916F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <a3615fe7-aa2a-53e9-2732-ba4512b9369d@linaro.org>
 <SEZPR06MB5269E7B070B239F8E349C427F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c5cf6e0a-05dc-dff7-6218-df0984d1ba47@linaro.org>
 <SEZPR06MB5269CB53B51B89C3CA039442F2B09@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <e59fe30a-75d1-eb59-52a3-014fe3c961a6@linaro.org>
 <SEZPR06MB5269B541150855BF0DABFACFF2B69@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <d33145c3-e985-4d3c-a08c-6a249a8dc463@linaro.org>
In-Reply-To: <d33145c3-e985-4d3c-a08c-6a249a8dc463@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4177:EE_
x-ms-office365-filtering-correlation-id: 77296484-1f03-454f-5482-08db1ef41789
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  xGK7MWlx8ychgRKNMasG+LX/8gUVa1kEmqMGCvkegzVDTgXgeH1BPtUmVPtWuXtdUjYgnXTZ0krPBY7bNdjnU7OdHBTrfg+PE0Bqaa6NStIVD40gxEsbrREGyrM1JLS9eZGB2iBhdfLpJX2zwc49BScv3m5qrsrLAj1LuYsM60ZXkZDXBGYgUXdolcqE7rcLzf2LInQLf8ytyaiSEZ6963GAF7g1HY4O+s86m+WbiUVtCPty6E8nhakgI0SNlXm7XByfwMZreMVa3LDfUVzH3SSePHiAArCujTgAyrEpe10lNgK+sncvqJDTpyDPnpIncxkfniZAGv+wlqK+PP2o8ubenqaJsrdiK72Y+fJsgxoqurtr5YsAXHe1uZuTz+oOF6FjEL6iraznsk6GcrfZTxd8aNAnpaJ5uuCBYfI8UBT57okSmQE3djtRIne0yD2O/7tXyGKIjp3ENWRns2aIxjY8QWREUvDw4KN9viVoKi+IEuh/p3LtnIupcPIyfDM9Z4tYEF8sy91WFNg75HB8jv+oFWUJ+BbfJpO2/6VioEMKLV6YUwab/fq0wVShs6YHru3nIWOqsbv0PFXjCVhNsLk5/l/aubiQZ1p7e2Wd8XfWNu+3BUxopvZlheM9/FSkUEhcx2uDW+SafzWGsoLirI7VPXfcxXxHUNZ8vilGDMA4YoH64YpfdstjGj0rVpcz
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39850400004)(376002)(136003)(366004)(346002)(396003)(451199018)(122000001)(66946007)(66476007)(66556008)(76116006)(186003)(38070700005)(86362001)(26005)(9686003)(6506007)(53546011)(41300700001)(64756008)(38100700002)(4326008)(66446008)(8676002)(33656002)(2906002)(316002)(54906003)(110136005)(83380400001)(966005)(478600001)(55016003)(8936002)(52536014)(71200400001)(7416002)(7696005)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cHVMWkJ1NkJZRzhXRkFVbVlCWmlpTUdGTi8ycFF2UEF0K1dpb0hmcVBHdEND?=
 =?utf-8?B?K0o4UEQzSGdkKzErMlFBazJpTnBsRkE0REVyZEpnb0pVcUFpZlNTSHIzMitH?=
 =?utf-8?B?Y1YrMUdNczFNaWZvU1Y4bVNIV1B4dFdRNmxZT1B1cmdqRVJsSXhzVUhHcXBT?=
 =?utf-8?B?bEZlTklLWEhidlVPMXdPZjQ0YTVLdXVqckJWVjNKZnZQOHI5dmd5Mi9scXhi?=
 =?utf-8?B?aUdqQnhqQy9BOGhlNEw4TlJJT2xZNVR2WGxyYXd0cVN4N1Y3UXlFemRoNzdH?=
 =?utf-8?B?T0ZQbVpVN2pONktjQ2EvcEhBYjFIRDRCazhQT0dkSjNVQzA5dUhRaFJIeCtq?=
 =?utf-8?B?NU40NFhmdmVBUHU4WmQrTjRROU1tUXJ1Z1J3RFNDejFDaWFPaVVuUG83YW0r?=
 =?utf-8?B?YWJRSWhCSzl2TXVQSU5kSWNtMUZra1dGcHhFcXlpTmNuZkh5L2M5djBXODRE?=
 =?utf-8?B?MElOYUpzWUNwWFpFaExoNDZTVjd1WHNVekptNzBCTS9EcU5SWVlmQ1NQMHJH?=
 =?utf-8?B?SUtraU9oWWw3MXVLdVZON2NOSTZ4a280RlhRM2FqTy8yWlVVWDBvWStzb0J5?=
 =?utf-8?B?U3gyN1BVK3ljK1QrNWlDRnFHd1JBNXc5enBRNFJIQk02YXNoLzFXdThnWXJQ?=
 =?utf-8?B?WTkzaEZMMVQva1RJZ2lQdSswa0xnakloLytyQWdaOGs2NjVIZk5neGN2UXJI?=
 =?utf-8?B?VWJZVXl3Yy9QVU82Y2x2czFpcWJ2ODR5aWlCeUx0NnBjNzVIaDQvSFZacnFw?=
 =?utf-8?B?cmdpaHk5OGpKYWNxdmFOK0daZmtsMER5OFRXN1dpY0JFRml4TmVxSnBWOXJ6?=
 =?utf-8?B?RE1WZS9weHVXbDNjU2oyZ2lkUC8rTzFWMkpiMllqOGI3dkNkUVg5SVp5RjJI?=
 =?utf-8?B?Qm11TUgxS202MlAzU0lQaWpoSXpud3B0Z1Jvc1o1cUYyR01uQUtaaGU5c01o?=
 =?utf-8?B?M2V4MDRDVmpFTEp5V21XaVhWMHpIZFRhbjVnMlo4ZDA3aWRqTkxjWEdtMmJF?=
 =?utf-8?B?VkFIY0ZBb29sRnlzSDB2WCtFbmQ4NTZRWmZKOWNnL1VUTGZTb1Z4YWg0bjJC?=
 =?utf-8?B?azFReTZpb2VNczNnSFBLeGRUTVZBUW11VkJmZTJpLy9UaFlUNm96Uk5MR1lT?=
 =?utf-8?B?bUZyS2xGbjRsT2lPK2lYSTROcTJLSzRHZ2dQUXU4bGVNSTFBa3l5NGtlV2V3?=
 =?utf-8?B?RCt5VnZlbWFhb0ZhdU4vU1Q4d2dMendiaEkrWS8vOGdmZjlQSiszYmZuRXd0?=
 =?utf-8?B?dWZ1TmZPbGRTSFBEcnppemdwK3FpWm51RnhnTlpyY0xrMzlwTk5ZZ0tIZXJ6?=
 =?utf-8?B?SkZvdmxnOGpqd3NoNnZUZGdLYkZkTmlCT3VQTjJUd3pJclhROEJTempsK1VU?=
 =?utf-8?B?UVk4MTVobkdLczdVanpORnBIVmpYL0UvK3FRQjlGdjNlWkhTZGg0SXlqR21G?=
 =?utf-8?B?Y2UvZVB3NWI5MEFHWmlLWndiaVhQOVgyN1h2MldpczhWdEltUVVaUjVhaXo2?=
 =?utf-8?B?Wk1zRllLcG9KSWw3MkJ6MHJMUnNTOUVhM3ZuRENmNHMzQXhGRWEwNW90MEJU?=
 =?utf-8?B?dDdRWkxvaUpqalJ3UXlxSUM4SFNSQmRRVDMxbk84cURpNCtUbnRXR2t3dElP?=
 =?utf-8?B?Z3FEN2hHb3pTUno0WTJReElNY1piRU1LQ3QvZ0pSY2tmZzNyR1Zud1JqaGxT?=
 =?utf-8?B?WjBMa2Z3QUtWNy9EZGpoUjBGazFrSXY0Nk1SYW9YekQ3dk8raGVXSlFTb25x?=
 =?utf-8?B?VVZGZW9Td3RhUkhOb2pCYUFQVEJ6S3FGSDNNNFBuQWJBVkhsODNJaWVJT3lz?=
 =?utf-8?B?YlFKbVRnSmFvYXNUQVhPV2ZBcXBrc1hlMHYrb0hiOXpDRERnUU9MUVYvTitj?=
 =?utf-8?B?YnN3aTJ3SWFnUldZZC9XZzdzZG1LSkIxZUdFejBJbEtlOGFGdTkxVDdMS0RL?=
 =?utf-8?B?SlFFNjRTcjhmZVV1aDFRUnZkWDQzMlY5YnR2Nzh6K0kxV0FlRlorTkJEanYz?=
 =?utf-8?B?djEvbnMzSUhZM0VrM1ZPSGpMR1VyZjRSRmFUSzNSNzVNelZ0MUpQTEJid0hU?=
 =?utf-8?B?NTVNYmxSSS9xRlQrc1NMWEZhb2JBdlYxVjZvY3h2OUtIZ1NEQkZSL3BEK0J0?=
 =?utf-8?B?bVlBRFhKaHhvZkRXczd3OWxlaVFJRDNzOC9XK2tYaFZFSXg3dkM5UDloWUxS?=
 =?utf-8?B?YUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77296484-1f03-454f-5482-08db1ef41789
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2023 10:09:51.8161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9utCQ4NUU6Af8h3DQ6IFYwdQw43u8b/hZEP/EgyCTDZaDPsGqTBxo9i9ys9VU25BRoI0MGFLUSGUt3q1SV5L7GvTsS5H5iMvgYYdcQB4vFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4177
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGVsbG8gS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4g
U2VudDogVHVlc2RheSwgTWFyY2ggNywgMjAyMyA0OjEyIFBNDQo+IFRvOiBSeWFuIENoZW4gPHJ5
YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IFdvbGZyYW0gU2FuZw0KPiA8d3NhQGtlcm5lbC5vcmc+
DQo+IENjOiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PjsgQnJlbmRhbiBIaWdnaW5zDQo+
IDxicmVuZGFuLmhpZ2dpbnNAbGludXguZGV2PjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6
eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnPjsgQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bh
ai5pZC5hdT47DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBQaGlsaXBwIFphYmVsIDxw
LnphYmVsQHBlbmd1dHJvbml4LmRlPjsgUm9iDQo+IEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9y
Zz47IEJlbmphbWluIEhlcnJlbnNjaG1pZHQNCj4gPGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZz47
IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnOw0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IG9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZzsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHY2IDEvMl0gZHQtYmluZGluZ3M6IGkyYzogYXNwZWVkOiBzdXBwb3J0IGZvciBB
U1QyNjAwLWkyY3YyDQo+IA0KPiBPbiAwNi8wMy8yMDIzIDAxOjQ4LCBSeWFuIENoZW4gd3JvdGU6
DQo+ID4gSGVsbG8gS3J6eXN6dG9mLA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lA
bGluYXJvLm9yZz4NCj4gPj4gU2VudDogU3VuZGF5LCBNYXJjaCA1LCAyMDIzIDU6NDkgUE0NCj4g
Pj4gVG86IFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPjsgV29sZnJhbSBTYW5n
DQo+ID4+IDx3c2FAa2VybmVsLm9yZz4NCj4gPj4gQ2M6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMu
aWQuYXU+OyBCcmVuZGFuIEhpZ2dpbnMNCj4gPj4gPGJyZW5kYW4uaGlnZ2luc0BsaW51eC5kZXY+
OyBLcnp5c3p0b2YgS296bG93c2tpDQo+ID4+IDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFy
by5vcmc+OyBBbmRyZXcgSmVmZmVyeQ0KPiA+PiA8YW5kcmV3QGFqLmlkLmF1PjsgZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmc7IFBoaWxpcHAgWmFiZWwNCj4gPj4gPHAuemFiZWxAcGVuZ3V0cm9u
aXguZGU+OyBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgQmVuamFtaW4NCj4gPj4g
SGVycmVuc2NobWlkdCA8YmVuaEBrZXJuZWwuY3Jhc2hpbmcub3JnPjsNCj4gPj4gbGludXgtYXNw
ZWVkQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZzsNCj4gPj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgb3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnOw0KPiA+PiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnDQo+ID4+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjYgMS8yXSBkdC1iaW5kaW5nczogaTJjOiBhc3BlZWQ6IHN1cHBvcnQgZm9yDQo+
ID4+IEFTVDI2MDAtaTJjdjINCj4gPj4NCj4gPj4gT24gMDQvMDMvMjAyMyAwMjozMywgUnlhbiBD
aGVuIHdyb3RlOg0KPiA+Pj4gSGVsbG8gS3J6eXN6dG9mLA0KPiA+Pj4NCj4gPj4+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gPj4+PiBTZW50OiBGcmlkYXksIE1hcmNo
IDMsIDIwMjMgNjo0MSBQTQ0KPiA+Pj4+IFRvOiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0
ZWNoLmNvbT47IFdvbGZyYW0gU2FuZw0KPiA+Pj4+IDx3c2FAa2VybmVsLm9yZz4NCj4gPj4+PiBD
YzogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT47IEJyZW5kYW4gSGlnZ2lucw0KPiA+Pj4+
IDxicmVuZGFuLmhpZ2dpbnNAbGludXguZGV2PjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA+Pj4+
IDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBBbmRyZXcgSmVmZmVyeQ0KPiA+
Pj4+IDxhbmRyZXdAYWouaWQuYXU+OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgUGhpbGlw
cCBaYWJlbA0KPiA+Pj4+IDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPjsgUm9iIEhlcnJpbmcgPHJv
YmgrZHRAa2VybmVsLm9yZz47DQo+ID4+Pj4gQmVuamFtaW4gSGVycmVuc2NobWlkdCA8YmVuaEBr
ZXJuZWwuY3Jhc2hpbmcub3JnPjsNCj4gPj4+PiBsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9y
ZzsNCj4gPj4+PiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+ID4+Pj4g
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOw0K
PiA+Pj4+IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4gPj4+PiBTdWJqZWN0OiBSZTogW1BB
VENIIHY2IDEvMl0gZHQtYmluZGluZ3M6IGkyYzogYXNwZWVkOiBzdXBwb3J0IGZvcg0KPiA+Pj4+
IEFTVDI2MDAtaTJjdjINCj4gPj4+Pg0KPiA+Pj4+IE9uIDAzLzAzLzIwMjMgMTE6MTYsIFJ5YW4g
Q2hlbiB3cm90ZToNCj4gPj4+Pj4+Pj4+Pj4gYXNwZWVkLHRpbW91dCBwcm9wZXJpdGVzOg0KPiA+
Pj4+Pj4+Pj4+PiBGb3IgZXhhbXBsZSBJMkMgY29udHJvbGxlciBhcyBzbGF2ZSBtb2RlLCBhbmQg
c3VkZGVubHkNCj4gPj4+Pj4+IGRpc2Nvbm5lY3RlZC4NCj4gPj4+Pj4+Pj4+Pj4gU2xhdmUgc3Rh
dGUgbWFjaGluZSB3aWxsIGtlZXAgd2FpdGluZyBmb3IgbWFzdGVyIGNsb2NrIGluDQo+ID4+Pj4+
Pj4+Pj4+IGZvciByeC90eA0KPiA+Pj4+Pj4+PiB0cmFuc21pdC4NCj4gPj4+Pj4+Pj4+Pj4gU28g
aXQgbmVlZCB0aW1lb3V0IHNldHRpbmcgdG8gZW5hYmxlIHRpbWVvdXQgdW5sb2NrDQo+ID4+Pj4+
Pj4+Pj4+IGNvbnRyb2xsZXINCj4gPj4gc3RhdGUuDQo+ID4+Pj4+Pj4+Pj4+IEFuZCBpbiBhbm90
aGVyIHNpZGUuIEluIE1hc3RlciBzaWRlIGFsc28gbmVlZCBhdm9pZCBzdWRkZW5seQ0KPiA+Pj4+
Pj4+Pj4+PiBzbGF2ZQ0KPiA+Pj4+Pj4+Pj4+IG1pc3ModW4tcGx1ZyksIE1hc3RlciB3aWxsIHRp
bWVvdXQgYW5kIHJlbGVhc2UgdGhlIFNEQS9TQ0wuDQo+ID4+Pj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+
Pj4+IERvIHlvdSBtZWFuIGFkZCB0aG9zZSBkZXNjcmlwdGlvbiBpbnRvIG9yZSBhc3BlZWQsdGlt
b3V0DQo+ID4+Pj4+Pj4+Pj4+IHByb3Blcml0ZXMNCj4gPj4+Pj4+Pj4+PiBkZXNjcmlwdGlvbj8N
Cj4gPj4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj4+IFlvdSBhcmUgZGVzY3JpYmluZyBoZXJlIG9uZSBw
YXJ0aWN1bGFyIGZlYXR1cmUgeW91IHdhbnQgdG8NCj4gPj4+Pj4+Pj4+PiBlbmFibGUgaW4gdGhl
IGRyaXZlciB3aGljaCBsb29rcyBub24tc2NhbGFibGUgYW5kIG1vcmUNCj4gPj4+Pj4+Pj4+PiBk
aWZmaWN1bHQgdG8NCj4gPj4+Pj4+IGNvbmZpZ3VyZS91c2UuDQo+ID4+Pj4+Pj4+Pj4gV2hhdCBJ
IHdhcyBsb29raW5nIGZvciBpcyB0byBkZXNjcmliZSB0aGUgYWN0dWFsDQo+ID4+Pj4+Pj4+Pj4g
Y29uZmlndXJhdGlvbiB5b3UgaGF2ZQ0KPiA+Pj4+Pj4gKGUuZy4NCj4gPj4+Pj4+Pj4+PiBtdWx0
aS1tYXN0ZXIpIHdoaWNoIGxlYWRzIHRvIGVuYWJsZSBvciBkaXNhYmxlIHN1Y2ggZmVhdHVyZQ0K
PiA+Pj4+Pj4+Pj4+IGluIHlvdXINCj4gPj4+Pj4+Pj4gaGFyZHdhcmUuDQo+ID4+Pj4+Pj4+Pj4g
RXNwZWNpYWxseSB0aGF0IGJvb2wgdmFsdWUgZG9lcyBub3Qgc2NhbGUgbGF0ZXIgdG8gYWN0dWFs
DQo+ID4+Pj4+Pj4+Pj4gdGltZW91dCB2YWx1ZXMgaW4gdGltZSAobXMpLi4uDQo+ID4+Pj4+Pj4+
Pj4NCj4gPj4+Pj4+Pj4+PiBJIGRvbid0IGtub3cgSTJDIHRoYXQgbXVjaCwgYnV0IEkgd29uZGVy
IC0gd2h5IHRoaXMgc2hvdWxkIGJlDQo+ID4+Pj4+Pj4+Pj4gc3BlY2lmaWMgdG8gQXNwZWVkIEky
QyBhbmQgbm8gb3RoZXIgSTJDIGNvbnRyb2xsZXJzIGltcGxlbWVudCBpdD8NCj4gPj4+Pj4+Pj4+
PiBJT1csIHRoaXMgbG9va3MgcXVpdGUgZ2VuZXJpYyBhbmQgZXZlcnkgSTJDIGNvbnRyb2xsZXIg
c2hvdWxkDQo+ID4+Pj4+Pj4+Pj4gaGF2ZSBpdC4gQWRkaW5nIGl0IHNwZWNpZmljIHRvIEFzcGVl
ZCBzdWdnZXN0cyB0aGF0IGVpdGhlciB3ZQ0KPiA+Pj4+Pj4+Pj4+IG1pc3MgYSBnZW5lcmljIHBy
b3BlcnR5IG9yIHRoaXMgc2hvdWxkIG5vdCBiZSBpbiBEVCBhdCBhbGwNCj4gPj4+Pj4+Pj4+PiAo
YmVjYXVzZSBubyBvbmUgZWxzZSBoYXMNCj4gPj4+Pj4+Pj4gaXQuLi4pLg0KPiA+Pj4+Pj4+Pj4+
DQo+ID4+Pj4+Pj4+Pj4gQWxzbyBJIHdvbmRlciwgd2h5IHlvdSB3b3VsZG4ndCBlbmFibGUgdGlt
ZW91dCBhbHdheXMuLi4NCj4gPj4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj4+ICtDYyBXb2xmcmFtLA0K
PiA+Pj4+Pj4+Pj4+IE1heWJlIHlvdSBrbm93IHdoZXRoZXIgYm9vbCAidGltZW91dCIgcHJvcGVy
dHkgZm9yIG9uZQ0KPiA+Pj4+Pj4+Pj4+IGNvbnRyb2xsZXIgbWFrZXMgc2Vuc2U/IFdoeSB3ZSBk
byBub3QgaGF2ZSBpdCBmb3IgYWxsIGNvbnRyb2xsZXJzPw0KPiA+Pj4+Pj4+Pj4+DQo+ID4+Pj4+
Pj4+PiBCZWNhdXNlLCBpMmMgYnVzIGRpZG7igJl0IHNwZWNpZmljIHRpbWVvdXQuDQo+ID4+Pj4+
Pj4+PiBCdXQgU01CdXMgZGVmaW5lcyBhIGNsb2NrIGxvdyB0aW1lLW91dCwgVElNRU9VVCBvZiAz
NSBtcy4NCj4gPj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+PiBJdCBoYXZlIGRlZmluaXRpb24gaW4gU01C
dXMgc3BlY2lmaWNhdGlvbi4NCj4gPj4+Pj4+Pj4+IGh0dHA6Ly9zbWJ1cy5vcmcvc3BlY3MvU01C
dXNfM18xXzIwMTgwMzE5LnBkZg0KPiA+Pj4+Pj4+Pj4gWW91IGNhbiBjaGVjayBQYWdlIDE4LCBO
b3RlMyB0aGF0IGhhdmUgdGltZW91dCBkZXNjcmlwdGlvbi4NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+
Pj4gVGhlbiB5b3UgaGF2ZSBhbHJlYWR5IHByb3BlcnR5IGZvciB0aGlzIC0gInNtYnVzIj8NCj4g
Pj4+Pj4+PiBUbyBiZSBhIHByb3BlcnR5ICJzbWJ1cyIsIHRoYXQgd291bGQgYmUgYSBiaWcgdG9w
aWMsIEkgc2F3IGZzbA0KPiA+Pj4+Pj4+IGkyYyBhbHNvIGhhdmUgdGhpcy4NCj4gPj4+Pj4+PiBo
dHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvRG9jdW1lbnRhdGlv
bi9kZXZpDQo+ID4+Pj4+Pj4gY2UNCj4gPj4+Pj4+PiB0cg0KPiA+Pj4+Pj4+IGVlDQo+ID4+Pj4+
Pj4gL2JpbmRpbmdzL2kyYy9pMmMtbXBjLnlhbWwjTDQzLUw0Nw0KPiA+Pj4+Pj4+IFNvLCBJIGp1
c3QgdGhpbmsgdGhlICJ0aW1lb3V0IiBwcm9wZXJ0eS4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBZZWFo
IGFuZCB0aGlzIGlzIHRoZSBvbmx5IHBsYWNlLiBJdCBhbHNvIGRpZmZlcnMgYmVjYXVzZSBpdA0K
PiA+Pj4+Pj4gYWxsb3dzIGFjdHVhbCB0aW1lb3V0IHZhbHVlcy4NCj4gPj4+Pj4gVGhhbmtzLCBT
byBjYW4gSSBzdGlsbCBrZWVwIHRoZSBwcm9wZXJ0eSAiYXNwZWVkLHRpbWVvdXQiIGhlcmU/DQo+
ID4+Pj4+IEl0IGlzIHRoZSBvbmx5IHBsYWNlLg0KPiA+Pj4+DQo+ID4+Pj4gTm8sIGJlY2F1c2Ug
bm9uZSBvZiBteSBjb25jZXJucyBhYm92ZSBhcmUgYWRkcmVzc2VkLg0KPiA+Pj4+DQo+ID4+PiBU
aGFua3MsIEkgcmVhbGl6ZSB5b3VyIGNvbmNlcm5zLg0KPiA+Pj4NCj4gPj4+IFNvLCBJIG1vZGlm
eSBpdCBsaWtlIGkyYy1tcGMueWFtbA0KPiA+Pj4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRz
L2xpbnV4L2Jsb2IvbWFzdGVyL0RvY3VtZW50YXRpb24vZGV2aWNldHINCj4gPj4+IGVlDQo+ID4+
PiAvYmluZGluZ3MvaTJjL2kyYy1tcGMueWFtbCNMNDMtTDQ3DQo+ID4+Pg0KPiA+Pj4gICBhc3Bl
ZWQsdGltZW91dDoNCj4gPj4+ICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0
aW9ucy91aW50MzINCj4gPj4+ICAgICBkZXNjcmlwdGlvbjogfA0KPiA+Pj4gICAgICAgSTJDIGJ1
cyB0aW1lb3V0IGluIG1pY3Jvc2Vjb25kcyBJcyB0aGlzIHdheSBhY2NlcHRhYmxlPw0KPiA+Pg0K
PiA+PiBTbywgbGV0J3MgcmVwZWF0IG15IGxhc3QgcXVlc3Rpb25zOg0KPiA+Pg0KPiA+PiAxLiBX
aHkgeW91IHdvdWxkbid0IGVuYWJsZSB0aW1lb3V0IGFsd2F5cy4uLg0KPiA+Pg0KPiA+PiBZb3Ug
d3JvdGU6DQo+ID4+PiBodHRwOi8vc21idXMub3JnL3NwZWNzL1NNQnVzXzNfMV8yMDE4MDMxOS5w
ZGYNCj4gPj4+IFlvdSBjYW4gY2hlY2sgUGFnZSAxOCwgTm90ZTMgdGhhdCBoYXZlIHRpbWVvdXQg
ZGVzY3JpcHRpb24uDQo+ID4+DQo+ID4+IHdoaWNoIGluZGljYXRlcyB5b3Ugc2hvdWxkIGFsd2F5
cyB1c2UgdGltZW91dCwgZG9lc24ndCBpdD8NCj4gPg0KPiA+IFllcywgaWYgYm9hcmQgZGVzaWdu
IHRoZSBidXMgaXMgY29ubmVjdGVkIHdpdGggU01CVVMgZGV2aWNlLCBpdCBzaG91bGQNCj4gZW5h
YmxlLg0KPiA+IEJ1dCBpbiBteSBwcmV2aW91cyBzdGF0ZW1lbnQsIHRoZSBib2FyZCBkZXNpZ24g
aXMgdHdvIG11bHRpLW1hc3RlciBkZXZpY2VzDQo+IGNvbm5lY3RlZCBlYWNoIG90aGVyLg0KPiAN
Cj4gRm9yIHdoaWNoIHlvdSBoYXZlIHRoZSBwcm9wZXJ0eSwgdGh1cyBjYXNlIGlzIHNvbHZlZCwg
aXNuJ3QgaXQ/IFlvdSB3YW50IHRpbWVvdXQNCj4gYWx3YXlzIGV4Y2VwdCBmb3IgbXVsdGktbWFz
dGVyPw0KDQpCdXQgZXZlbiBpZiBpbiBtdWx0aS1tYXN0ZXIgYm9hcmQgZGVzaWduLCBubyBob3Qt
cGx1ZyByZXF1aXJlbWVudC4NCkFuZCBpdCB3aWxsIG5vdCBuZWVkIGVuYWJsZSB0aGUgdGltZW91
dC4NClRoYXQgdGhlIHJlYXNvbiBJIHNlcGFyYXRlIHRoZSB0aW1lb3V0IGFuZCBtdWx0aS1tYXN0
ZXIgcHJvcGVydHkNCg0KPiANCj4gPiBBbmQgYm90aCBkZXZpY2UgaXMgdHJhbnNmZXIgd2l0aCBN
Q1RQIHByb3RvY29sLg0KPiA+IFRoYXQgd2lsbCBub3QgU01CVVMgcHJvdG9jb2wuDQo+ID4gVGhl
eSBuZWVkIGhhdmUgdGltZW91dCB0aGF0IHByZXZlbnQgdW5leHBlY3RlZCB1bi1wbHVnLg0KPiA+
IEkgZG8gdGhlIHN0dWR5IHdpdGggc21idXMgaW4gTGludXgsIHRoYXQgd2lsbCBkaWZmZXJlbnQg
c2xhdmUgY2FsbCBiYWNrLg0KPiBDb21wYXJlIHdpdGggc21idXMgc2xhdmUgYW5kIG1jdHAgc2xh
dmUuDQo+ID4gU28gaW4gdGhpcyBzY2VuYXJpbywgdGhhdCBpcyBvbmx5IGVuYWJsZSBmb3IgdGlt
ZW91dC4NCj4gDQo+IEFuZCB0aGUgZHJpdmVyIGtub3dzIHdoaWNoIHByb3RvY29sIGl0IGlzIGdv
aW5nIHRvIHRhbGsgYW5kIHN1Y2ggY2hvaWNlIHNob3VsZA0KPiBub3QgYmUgaW4gRFQuDQoNClNv
cnJ5LCBhcyBJIHVuZGVyc3RhbmQgdGhlIGkyYyBkcml2ZXIgZG9uJ3Qga25vdyB3aGljaCBwcm90
b2NvbCBpcy4gRHVlIHRvIGluIGkyYyBkcml2ZXIgaW1wbGVtZW50LCBpdCBqdXN0IGEgc2xhdmUg
Y2FsbCBiYWNrIGZ1bmN0aW9uLg0KaTJjX3NsYXZlX2V2ZW50IC0+IGNsaWVudC0+c2xhdmVfY2Ig
OiB1cCBsYXllciB0byBkbyBwcm90b2NvbCBvcGVyYXRlLg0KDQo+ID4NCj4gPj4gMi4gV2h5IHdl
IGRvIG5vdCBoYXZlIGl0IGZvciBhbGwgY29udHJvbGxlcnMgd2l0aCBTTUJ1cyB2Mz8gV2h5IHRo
aXMNCj4gPj4gb25lIGlzIHNwZWNpYWw/DQo+ID4NCj4gPiBOb3QgYWxsIGJ1cyBpcyBjb25uZWN0
ZWQgd2l0aCBzbWJ1cy4gTW9zdCBhcmUgaTJjIGRldmljZSBjb25uZWN0ZWQgaW4gYm9hcmQuDQo+
ID4gVGhhdCB3aWxsIGJlIHNwZWNpZmljIHN0YXRlbWVudCBmb3IgZWFjaCBidXMuDQo+IA0KPiBU
aGF0J3Mgbm90IHRoZSBhbnN3ZXIgdG8gbXkgcXVlc3Rpb24uIFdoeSBvdGhlciBjb250cm9sbGVy
cyB3aGljaCBjYW4gYmUNCj4gY29ubmVjdGVkIHRvIEkyQyBvciBTTUJ1cyBkZXZpY2VzIGRvIG5v
dCBuZWVkIHRoaXMgcHJvcGVydHk/DQoNCkZvciBleGFtcGxlIGZvbGxvd2luZyBpcyB0aGUgYm9h
cmQgc3BlY2lmaWMgY29ubmVjdGlvbi4NCg0KQm9hcmQgQSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgQm9hcmQgQg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAgICAg
ICAgICAgICAgICAgICAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQp8aTJjIGJ1cyMxKG1h
c3Rlci9zbGF2ZSkgIDw9PT1maW5nZXJwcmludCA9PT0+IGkyYyBidXMjeCAobWFzdGVyL3NsYXZl
KXwNCnxpMmMgYnVzIzIobWFzdGVyKS0+IHRtcCBpMmMgZGV2aWNlIHwgICAgICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgfA0KfGkyYyBidXMjMyhtYXN0ZXIpLT4gYWRjIGkyYyBkZXZpY2Ug
fCAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICB8DQotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tICAgICAgICAgICAgICAgICAgICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0K
QnVzIzEgaXMgbWN0cCB0cmFuc2ZlciBmb3IgZWFjaCBCb2FyZEEvQi4gKE5vdCBzbWJ1cyBjb25u
ZWN0ZWQpDQpCdXMjMiBpcyBpMmMgZGV2aWNlIGNvbm5lY3RlZC4NCkJ1cyMzIGlzIGkyYyBkZXZp
Y2UgY29ubmVjdGVkLg0KIA0KDQpCZXN0IHJlZ2FyZHMsDQpSeWFuIENoZW4NCg0K
