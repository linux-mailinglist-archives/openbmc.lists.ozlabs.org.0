Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 353346A3A0B
	for <lists+openbmc@lfdr.de>; Mon, 27 Feb 2023 05:14:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQ6ZH5qF4z3cGV
	for <lists+openbmc@lfdr.de>; Mon, 27 Feb 2023 15:13:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=CQ0BfOxA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::701; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=CQ0BfOxA;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQ6YV1Wydz3bT1;
	Mon, 27 Feb 2023 15:13:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1W/CTCQE2E2mVV6nR5CzW+T6hPgRhEhEzBFqs5Qd0lboOshn3afV474KR53kyqpR3/3kljY4WQmrRQ3jFoNuSbdgZRfsGBMJadTw6c0a/gex6b62jZr5ZitlCuerc6qGIeHm/dzNJAeioyWaw0/8mzxnEgrSRICO2mdgp7JBbNnLqUIBa87QZXbfiqIZvn7KIkkrREL/ptaf4lbyFFWcUPhCTcyYifqiquO/R1hSmD+47urTJGMPeu4k4FSYGZZenzQKAHKYti/fYPtfG04D3SLxzRcg5+o+uymPYchqJ/34XEYc4tJ0U8OnSccJmRuMaP1Ef4jGjPnB5ISHAzt4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Jy3hYfLBIUTo1AeOL0Ot1AVcMV9BjcPHG71brugZnQ=;
 b=AhwJjkIWrNusaCxx/MmW98e7y5yMvss6t8AuRAWUqtvXtRKJU95H8PIVHf/yVUz12ODWBR0zPNzjmAM+m1tid2lclUhUDrFCaxjhpsU+1JqWBJlXYuLBXfpLbVkBZ4ZlrqRLQr6/L9LLiTT+pfmR1G1M5NXHEspWTCFf/lV8B06Dbe1YadBQ6ja3Qep/KxqEHt2OJ4pQ0EZwTOYbD4PxRDfPHUbcjHrQn0g+ZVFpJ3DIKsE3vW9o8LyKlFWhpBR1FHiXsHQANsY84C2Spk4G/JneR41HBz6QmF1U/DVSJJdA/SS7rVHIPeWwU7ugYvm8BLenymkXn13YMM5EbPU60g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Jy3hYfLBIUTo1AeOL0Ot1AVcMV9BjcPHG71brugZnQ=;
 b=CQ0BfOxAf7wS7wxy0eBIV/6kwyYAeyBNF0UyFWIc04b1t8LRtKCqrvpK3gRCG30Kpb6Oequ+O8fiVN6JyL5aagxhcObMTFIha61L4VUFvY30Syn/sRE+1pwe9PzgGIubnvydEB7d6UV9UMAjssinChZa9o72sNbwISEHK6WQjFCc4yVsTV9ZtKZxmWKW3BtJFYzC9DesIdqE+iCNwi/x91uU0tz8tGa6odPWXaUTfFRP9enNAjwEnrmgnoNSGkG1D5WFDlpaqfyVwIYN/5QmknD9GjhHMYSPbBjiNjRmPWktMkYv4MShXEPxRHo8wOUHwXznpEmgrxj1oiqqmatacA==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5467.apcprd06.prod.outlook.com (2603:1096:101:b6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.14; Mon, 27 Feb
 2023 04:12:53 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%8]) with mapi id 15.20.6111.010; Mon, 27 Feb 2023
 04:12:52 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Andrew Jeffery <andrew@aj.id.au>,
	Brendan Higgins <brendan.higgins@linux.dev>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index: AQHZSZBNCqcj9BIMLU6U/5WV2MINja7gzfMAgAFcBjA=
Date: Mon, 27 Feb 2023 04:12:52 +0000
Message-ID:  <SEZPR06MB52699858C92383E8E07D0832F2AF9@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
	 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
 <8999ef4a57b035a81b086d8732d119638d46968c.camel@codeconstruct.com.au>
In-Reply-To:  <8999ef4a57b035a81b086d8732d119638d46968c.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|SEYPR06MB5467:EE_
x-ms-office365-filtering-correlation-id: 279ef6f1-52f2-4e9a-2c3b-08db1878e578
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  q7y/OGk9ymXwTXW4uHQlF8mWUH09mA82GRYP40uOZPfZAopIZ+k/ktTKAskMlfUL5u+bW4Gn2bgENNizA8OPqRwqygVvjoIz+TRsyy2RIB75MvmZnafAINwzpV6AAQ82KqLNlg/tKlOxFSB0NkZkVunzrYn7f0T0fp56Hk810q3fUsmHSabZiGWjuUfQh9Zl2UTeMG2U29ViaXySifQVTKyBgufrgnlVY7YxuEcBzzVevoWO3o5zEOBQCe8lglPL6NFzDAiIZQOQXNXGBOc/cXy100p1sgVXmjITbqjuBMgieo6SmZ3qUKOXmcG36E7jhx66zUaEAvDfsrPo4RnvtGDbcHKJKVipirVT9YagbTjF4Kd2zRLB29lkIrnQcKA1WHgTHcUIwQPGRG5tkNFyywN9vudzQ9Zqt9G5N3xNaY9Z0bwPlScJWhjPjDfBgZR7cO/cmV6URuJP9hPGg7y8jezwmTk1AK05NYhqabSRHEbxTAgqsvyflHxS2xbttxbdcbawNyWOaud1aQUtKygYL6pNwGIv72wg4qVOHTpOjVP11p4NEKKKmLC6ppyC71WvLb6IzRP5owaiGApQ3+6NmmwFaf2fIa4Fc/Xw9+T9sQdGNI9l2XdKqXW/sCRCdKwdP/MaAgXinLckaJwQA2g79A6r05CZRNA9SgAjNz3MqOrbwcvzfuLaYIEtTC7CGZV5bZLRIkvqBwuSfgyBiFINAqPH9FqVycQbAFzSiFUxFvyond6EAjVOzsT3jnqjWQPaIdYCh8mGbRFetd/49UWVRw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(346002)(366004)(396003)(39830400003)(451199018)(921005)(478600001)(110136005)(71200400001)(86362001)(316002)(9686003)(38070700005)(53546011)(7696005)(186003)(26005)(6506007)(55016003)(966005)(38100700002)(76116006)(2906002)(41300700001)(8676002)(64756008)(66446008)(66476007)(83380400001)(8936002)(7416002)(5660300002)(66556008)(52536014)(66946007)(33656002)(122000001)(533714002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cmVpK2ZSL2daSHBpakEyQ2pjTk94UklmSUtmR0hjRDhvaVhMWVJZSjRVQ2Q4?=
 =?utf-8?B?ZnYvM1R2dW9KUzg1TXQ4YjRKMkxIMnB1UGYvTUorVmxSaWlOSEM2K0VVYjVJ?=
 =?utf-8?B?czF2bUNNamJoS21KUnB3VWRPT2RQZXNOQU5COU9CYWxwcHJXaW0zZVNCZlVH?=
 =?utf-8?B?QmpmWGRsM2VGUStuUkIrcCsyVWVPeGxGaVdYOXRwNFovUjhraGsrWXY1ZmYw?=
 =?utf-8?B?dXdrRWVBbHhqNVJCUXhSclcwWjRBWkxFeUZpWk42dUFhT3U2L3JLZityMUJs?=
 =?utf-8?B?V25TeGYxak9SRlVkdUt0bFhsZnFVam51VndIVjJ5OUhnU0w4Z3c1SS9LbDhV?=
 =?utf-8?B?cWNFaFd2UENNdHozT2J3ZXBXR0tZSENmbng0SUtmWjlpL1M3TTZxQlFJSHVW?=
 =?utf-8?B?ZUhISmVxSVpNTDR1ZCtFQk5jOFlueStMY2wraEJ5L3EwWjJMRjFZL21GdXUz?=
 =?utf-8?B?OU1SdU5XWW9hWU1hWjEwdVp6WTU3NEdQUm1lMWhuL20yTlhLdGNzSnQzWjBt?=
 =?utf-8?B?dGg2TFZoN1BGcnB0UFhEbFdNcytQU3d5dlRwTFQ1S2psZ1ErakJHSkFBY1ZM?=
 =?utf-8?B?V2ZTdHBNTUJpSitLT3AyU3h2dC9qaTM3VjdwVERydmM5bHhXYVM4bTVpWXJL?=
 =?utf-8?B?U3VhWjVDUmc5SnFpVElKaDM2dEVwZmpOeUtlNnJ1N205UW1vTFZyYjNoeStO?=
 =?utf-8?B?bDd6elpocWdnbVBqY2lUWlFuc2w5bEFSWk1VaERLNUdqdlpNNGl1eHNOL1pz?=
 =?utf-8?B?L2hHNVN1QkFUbVhUeTV6Vkl3TXIrMmxxTkIyN2E0bzR4VzFpS3FRckJJK2lC?=
 =?utf-8?B?NmU4RnV3QVY0ZXFqMmpvQVRTQjVQelBpcTZ1ZUJCVks1OFFHR1B0cFdjNmky?=
 =?utf-8?B?aDVOZUhuRjhXVEl0TXRLV0pqMzhCR0oybG5UeUIxTWZlTC9Ca3BlZjcvc0Nz?=
 =?utf-8?B?a01CRnZVdHFWRVkwdit3N0o2VzBhUythZFp1RlRjQ3NxNDJRRm52eWViMTc4?=
 =?utf-8?B?aWxJd3A1NUdQeVEwQ1E1ckp1d05jdCtJVmFMVFFQN3hLTksvZlV3VDVIZUFJ?=
 =?utf-8?B?VUFrVzBpWWhtSjZNaTNDdGxXcjhLN0JQNVQ4ekFRSnY5NGt5R2NsWmJnQTZZ?=
 =?utf-8?B?cG0yaGVuM0JvU2FrNHVNYjhpYlpkZHkzb2F2NXoyMis1TTdTQW9WcDdkdnda?=
 =?utf-8?B?MTdHdzRkRFI0WjZxMGFDeVRDeFFnbmNGb3htdWp4ZXp1S05QVm11aVpiSDE0?=
 =?utf-8?B?VFpVUWc5RWxnWU1RcUNHUUtIQ2JJcWNkeDA5NTFWcFhYTkFmNlZVSW9nYlhs?=
 =?utf-8?B?OTlLcHRrbEpCdnhlNWIwaGtUb2hsNmFIUmoxd0crbHY2NVM3UFFRcTdGWnBz?=
 =?utf-8?B?ZTlmbjZoM25wRXA4Zm5UVllnQ3VBblhNVGYxOCtFODhlN09zSUtGTUpTemNv?=
 =?utf-8?B?NmJtNzRyVVlsRFpiQ3h4NW9DMkNsNEpKZDhxNlBsZFU2SkdrVkRhWEw4SXJy?=
 =?utf-8?B?VHFNZWJqVkE1V1JqdEk5cDVwRnEwUTJtWVZzZzV4TDZPeGQrOTBPRW9lK2x1?=
 =?utf-8?B?Y1BFU25PVkFyUWRLRkxWdTZKYjNDQUhWT2hhVjNPU05JbzM4T3NGVitlWU80?=
 =?utf-8?B?a0lLYzJ2OXAyUHVYczRXZ1ZxQ2RnaUdtWGc2N1E3K3VpMjIva3FpRG0yM2Rr?=
 =?utf-8?B?MGpzRDRDZmszM1ZENUcxemc4bFZMS3RWb0VoZWlZMjR5bG5uYjVRRE94SVlT?=
 =?utf-8?B?elRObUtvVlIzaXRNRE0wdFl1NzcybjB6Y1dWanFGMVN3Zmg2K242VHpkMFBK?=
 =?utf-8?B?Tlp6cGE0b2FzWmI1Ni9SaTdMYVJDQzZFNnV4RjVuRmswMk55eU5jSUpmSzdW?=
 =?utf-8?B?L2wrSEl3TVpMMlYzUG9OWk8vTEdIYWtaSHFpRVNPdHN3dVhuY1MyMEhnaVRm?=
 =?utf-8?B?WVVQUDNYcWU0M3JpQXFJQVFpSTljZDV2OHBwZURDbVNTaEtwWG4zdGFXeHNP?=
 =?utf-8?B?ejVmWXY2dTRnQ0hybjNoSEdhZElXR0twM3U1SVMvdFZuOUVZU0ZSRlFsSGN2?=
 =?utf-8?B?Q2RxbUw0U3RMVFZVTGZkQXRmdEZaVklNZExIYW15c3dhNnl5cHZNTlhiWlM3?=
 =?utf-8?Q?BtXzVzzvbGZHMiXkPz/wBEAjC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279ef6f1-52f2-4e9a-2c3b-08db1878e578
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 04:12:52.7744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aWM1WKbcAXFS5GFOYuyrxEBNYdDEz7s+VScS92kEMDehP0PMAFeyo+KL/hAfQbA1TrTIw0gHd/GaFGK0AAvHcnpXtJ3mGwbHT6TWYP4rjUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5467
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

SGVsbG8gSmVyZW15LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpl
cmVteSBLZXJyIDxqa0Bjb2RlY29uc3RydWN0LmNvbS5hdT4NCj4gU2VudDogU3VuZGF5LCBGZWJy
dWFyeSAyNiwgMjAyMyAzOjA0IFBNDQo+IFRvOiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0
ZWNoLmNvbT47IEFuZHJldyBKZWZmZXJ5DQo+IDxhbmRyZXdAYWouaWQuYXU+OyBCcmVuZGFuIEhp
Z2dpbnMgPGJyZW5kYW4uaGlnZ2luc0BsaW51eC5kZXY+OyBCZW5qYW1pbg0KPiBIZXJyZW5zY2ht
aWR0IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+OyBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlk
LmF1PjsNCj4gUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3ps
b3dza2kNCj4gPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IFBoaWxpcHAgWmFi
ZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Ow0KPiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3Jn
OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWFzcGVlZEBs
aXN0cy5vemxhYnMub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjYgMS8yXSBkdC1iaW5kaW5nczogaTJjOiBhc3BlZWQ6IHN1cHBvcnQgZm9y
IEFTVDI2MDAtaTJjdjINCj4gDQo+IEhpIFJ5YW4sDQo+IA0KPiA+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvYXNwZWVkLGkyYy55YW1sDQo+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3BlZWQsaTJjLnlhbWwNCj4gPiBA
QCAtNDksNiArNDksMjUgQEAgcHJvcGVydGllczoNCj4gPiDCoMKgwqDCoCBkZXNjcmlwdGlvbjoN
Cj4gPiDCoMKgwqDCoMKgwqAgc3RhdGVzIHRoYXQgdGhlcmUgaXMgYW5vdGhlciBtYXN0ZXIgYWN0
aXZlIG9uIHRoaXMgYnVzDQo+ID4NCj4gPiArwqAgYXNwZWVkLHRpbWVvdXQ6DQo+ID4gK8KgwqDC
oCB0eXBlOiBib29sZWFuDQo+ID4gK8KgwqDCoCBkZXNjcmlwdGlvbjogSTJDIGJ1cyB0aW1lb3V0
IGVuYWJsZSBmb3IgbWFzdGVyL3NsYXZlIG1vZGUNCj4gPiArDQo+ID4gK8KgIGFzcGVlZCx4ZmVy
LW1vZGU6DQo+ID4gK8KgwqDCoCBkZXNjcmlwdGlvbjogfA0KPiA+ICvCoMKgwqDCoMKgIEkyQyBi
dXMgdHJhbnNmZXIgbW9kZSBzZWxlY3Rpb24uDQo+ID4gK8KgwqDCoMKgwqAgLSAiYnl0ZSI6IEky
QyBidXMgYnl0ZSB0cmFuc2ZlciBtb2RlLg0KPiA+ICvCoMKgwqDCoMKgIC0gImJ1ZmZlcmVkIjog
STJDIGJ1cyBidWZmZXIgcmVnaXN0ZXIgdHJhbnNmZXIgbW9kZS4NCj4gPiArwqDCoMKgwqDCoCAt
ICJkbWEiOiBJMkMgYnVzIGRtYSB0cmFuc2ZlciBtb2RlIChkZWZhdWx0KQ0KPiA+ICvCoMKgwqAg
aXRlbXM6DQo+ID4gK8KgwqDCoMKgwqAgZW51bTogW2J5dGUsIGJ1ZmZlcmVkLCBkbWFdDQo+ID4g
K8KgwqDCoCBtYXhJdGVtczogMQ0KPiA+ICvCoMKgwqAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvbm9uLXVuaXF1ZS1zdHJpbmctYXJyYXkNCj4gDQo+IFRoZXJlIGFyZSBz
dGlsbCB1bnJlc29sdmVkIHF1ZXN0aW9ucyBhYm91dCB0aGlzIHhmZXItbW9kZSBwcm9wZXJ0eSBm
cm9tDQo+IHByZXZpb3VzIHN1Ym1pc3Npb25zIG9mIHRoaXMgYmluZGluZy4gV2UgZG9uJ3QgeWV0
IGhhdmUgYSBqdXN0aWZpY2F0aW9uIG9uIHdoeQ0KPiB0aGUgbW9kZSBjb25maWd1cmF0aW9uIGlz
IG5lZWRlZCBpbiB0aGUgZGV2aWNlIHRyZWUgcmF0aGVyIHRoYW4gc29tZXRoaW5nDQo+IHRoYXQg
aXMgc3BlY2lmaWVkIGluIGEgZHJpdmVyIGltcGxlbWVudGF0aW9uLg0KPiANCj4gQnkgbm93LCBJ
IHRoaW5rIHdlIHdlbGwgdW5kZXJzdGFuZCB3aGF0IHRoZSBtb2RlcyBhcmUsIGFuZCBob3cgYSBk
cml2ZXINCj4gaW1wbGVtZW50YXRpb24gbWlnaHQgY29uZmlndXJlIHRoZW0sIGJ1dCBub25lIG9m
IHRoYXQgaGFzIChzbyBmYXIpIHByb3ZpZGVkDQo+IHN1ZmZpY2llbnQgcmF0aW9uYWxlIG9uIHdo
eSB0aGlzIGJlbG9uZ3MgaW4gdGhlIGRldmljZSB0cmVlLg0KPiANCj4gVGhlIHByZXZpb3VzIHRo
cmVhZHMgaGFkIGEgY291cGxlIG9mIHBlbmRpbmcgZGlzY3Vzc2lvbnMsIGZvbGxvd2luZyB1cCBv
bg0KPiB0aG9zZSBoZXJlOg0KPiANCj4gQSkgWW91IG1lbnRpb25lZCBpbiBbMV0gdGhhdCB0aGUg
RE1BIGNvbnRyb2xsZXIgaXMgc2hhcmVkIGJldHdlZW4gYWxsIGkzYw0KPiBkZXZpY2VzLCBkb2Vz
IHRoYXQgaGF2ZSBhbnkgY29uc2VxdWVuY2Ugb24gd2hpY2ggbW9kZXMgaW5kaXZpZHVhbCBkZXZp
Y2VzDQo+IG1pZ2h0IHdhbnQgdG8gY2hvb3NlPw0KDQpZZXMsIEkyQyBjb250cm9sbGVyIHNoYXJl
IHRoZSBzYW1lIGRtYSBlbmdpbmUuIFRoZSBvcmlnaW5hbCB0aG91Z2h0IGNhbiBiZSBlbmFibGUg
aW4NCmFsbCBpMmMgY2hhbm5lbC4gQnV0IGluIEFTVDI2MDAgaGF2ZSBFUlJBVEEgIkkyQyBETUEg
ZmFpbHMgd2hlbiBEUkFNIGJ1cyBpcyBidXN5DQphbmQgaXQgY2FuIG5vdCB0YWtlIERNQSB3cml0
ZSBkYXRhIGltbWVkaWF0ZWx5IiwgU28gaXQgbWVhbnMgb25seSAxIGkyYyBidXMgY2FuIGJlDQpl
bmFibGUgZm9yIERNQSBtb2RlLg0KSXQgbWVhbnMgb25seSAxIGJ1cyBjaGFubmVsIGNhbiBiZSBl
bmFibGUgRE1BIGZvciB1c2UgY2FzZS4NClRoYXQgZm9sbG93aW5nIGV4YW1wbGUgZm9yIGJvYXJk
LXNwZWNpZmljIHNlbGVjdGlvbi4NCkl0IGlzIGRlc2NyaXB0aW9uIGluIGNvdmVyLWxldHRlci4N
Cg0KVGhlIGZvbGxvd2luZyBpcyBib2FyZC1zcGVjaWZpYyBkZXNpZ24gZXhhbXBsZS4NCkJvYXJk
IEEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJvYXJkIEINCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0gICAgICAgICAgICAgICAgICAgICAgIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KfGkyYyBidXMjMShtYXN0ZXIvc2xhdmUpICA8PT09ZmluZ2VycHJpbnQgPT09
PiBpMmMgYnVzI3ggKG1hc3Rlci9zbGF2ZSl8DQp8aTJjIGJ1cyMyKG1hc3RlciktPiB0bXAgaTJj
IGRldmljZSB8ICAgICAgICB8ICAgICAgICAgICAgICAgICAgIHwNCnxpMmMgYnVzIzMobWFzdGVy
KS0+IGFkYyBpMmMgZGV2aWNlIHwgICAgICAgIHwgICAgICAgICAgICAgICAgICAgfA0KLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLSAgICAgICAgICAgICAgICAgICAgICAgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQoNCi0gaW4gYnVzIzEgc2l0dWF0aW9uLCB5b3Ugc2hvdWxkIHVzZSBETUEgbW9k
ZS4NCkJlY2F1c2UgYnVzIzEgaGF2ZSB0cnVuayBkYXRhIG5lZWRlZCBmb3IgdHJhbnNmZXIsIGl0
IGNhbiBlbmFibGUgYnVzIGRtYSBtb2RlIHRvIHJlZHVjZSBjcHUgdXRpbGl6ZWQuDQotIGluIGJ1
cyMyLzMgc2l0dWF0aW9uLCB5b3Ugc2hvdWxkIHVzZSBidWZmZXIvYnl0ZSBtb2RlDQpidXMjMi8z
IGlzIHNtYWxsIHBhY2thZ2UgdHJhbnNtaXQsIGl0IGNhbiBlbmFibGUgYnVmZmVyIG1vZGUgb3Ig
Ynl0ZSBtb2RlIHRvIHJlZHVjZSBtZW1vcnkgY2FjaGUgZmx1c2ggb3ZlcmhlYWQuDQpCdWZmZXIg
bW9kZSBpcyBiZXR0ZXIsIGJlY2F1c2UgYnl0ZSBtb2RlIGhhdmUgaW50ZXJydXB0IG92ZXJoZWFk
KGludGVycnVwdCBwZXIgYnl0ZSBkYXRhIHRyYW5zbWl0KSwNCg0KLUJ1dCBpZiB5b3UgbW9yZSBi
dXMjNCB0aGF0IHN0aWxsIGhhdmUgdHJ1bmsgZGF0YSBuZWVkZWQgZm9yIHRyYW5zZmVyIChtYXN0
ZXIvc2xhdmUpLA0KaXQgYWxzbyB1c2UgYnVmZmVyIG1vZGUgdG8gdHJhbnNtaXQuIEJlY2F1c2Ug
YnVzIzEgaGF2ZSBiZWVuIHVzZSBmb3IgRE1BIG1vZGUuDQoNCkJlc3QgUmVnYXJkcy4NClJ5YW4g
Q2hlbi4NCg0KPiANCj4gQikgWW91IGltcGxpZWQgaW4gWzJdIHRoYXQgdGhlIGRpZmZlcmVudCB0
cmFuc2ZlciBtb2RlcyBtaWdodCBiZSByZWxhdGVkIHRvDQo+IHdoZXRoZXIgdGhlcmUgYXJlIG90
aGVyIG1hc3RlcnMgcHJlc2VudCBvbiB0aGUgYnVzLCBidXQgdGhlIGxvZ2ljIGJlaGluZCB0aGF0
DQo+IGlzIG5vdCBjbGVhci4NCj4gDQo+IEMpIEluIFszXSB5b3UgbWVudGlvbmVkIHRoYXQgdGhl
cmUgbWlnaHQgYmUgc29tZSBEUkFNIHNhdmluZ3MgYnkgdXNpbmcgYQ0KPiBwYXJ0aWN1bGFyIG1v
ZGUuDQo+IA0KPiBhbmQsIG1vc3QgaW1wb3J0YW50bHk6DQo+IA0KPiBEKSB1bmFuc3dlcmVkIGZy
b20gWzRdIGFuZCBbNV06IHdoYXQgYXJlIHRoZSBoYXJkd2FyZS1zcGVjaWZpZWQgcmVhc29ucyB3
aHkNCj4gYSBEVCBhdXRob3Igd291bGQgY2hvc2Ugb25lIG1vZGUgb3ZlciBhbm90aGVyPw0KPiAN
Cj4gSWYgeW91IGNhbiB3cml0ZSB0aGlzIG91dCBpbiBzb21lIGZvcm1hdCBsaWtlOg0KPiANCj4g
IC0gaW4gaGFyZHdhcmUgc2l0dWF0aW9uIFgsIHlvdSBzaG91bGQgdXNlIERNQSBtb2RlDQo+ICAt
IGluIGhhcmR3YXJlIHNpdHVhdGlvbiBZLCB5b3Ugc2hvdWxkIHVzZSBieXRlIG1vZGUNCj4gIC0g
Wy4uLl0NCj4gDQo+IHRoYXQgbWlnaHQgaGVscCB1cyB0byB1bmRlcnN0YW5kIHdoZXJlIHRoaXMg
Y29uZmlndXJhdGlvbiBiZWxvbmdzLCBvciB3aGF0IGENCj4gcmVhc29uYWJsZSBEVCByZXByZXNl
bnRhdGlvbiBzaG91bGQgbG9vayBsaWtlLCBvciBldmVuIGlmIGV4aXN0aW5nIERUIHNjaGVtYQ0K
PiBjYW4gYWxyZWFkeSBwcm92aWRlIHRoZSBpbmZvcm1hdGlvbiByZXF1aXJlZCB0byBkZWNpZGUu
DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiANCj4gSmVyZW15DQo+IA0KPiBbMV06DQo+IGh0dHBzOi8v
bGlzdHMub3psYWJzLm9yZy9waXBlcm1haWwvbGludXgtYXNwZWVkLzIwMjMtRmVicnVhcnkvMDA5
ODc2Lmh0bWwNCj4gWzJdOg0KPiBodHRwczovL2xpc3RzLm96bGFicy5vcmcvcGlwZXJtYWlsL2xp
bnV4LWFzcGVlZC8yMDIzLUZlYnJ1YXJ5LzAwOTg5Mi5odG1sDQo+IFszXToNCj4gaHR0cHM6Ly9s
aXN0cy5vemxhYnMub3JnL3BpcGVybWFpbC9saW51eC1hc3BlZWQvMjAyMy1GZWJydWFyeS8wMDk4
ODAuaHRtbA0KPiBbNF06DQo+IGh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9waXBlcm1haWwvbGlu
dXgtYXNwZWVkLzIwMjMtRmVicnVhcnkvMDA5ODcxLmh0bWwNCj4gWzVdOg0KPiBodHRwczovL2xp
c3RzLm96bGFicy5vcmcvcGlwZXJtYWlsL2xpbnV4LWFzcGVlZC8yMDIzLUZlYnJ1YXJ5LzAwOTg4
NC5odG1sDQo=
