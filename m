Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC776B1FAE
	for <lists+openbmc@lfdr.de>; Thu,  9 Mar 2023 10:16:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXNpV1d4cz3brQ
	for <lists+openbmc@lfdr.de>; Thu,  9 Mar 2023 20:16:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=QorLUlHk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::72b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=QorLUlHk;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2072b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::72b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXNng1ZJwz3bgv;
	Thu,  9 Mar 2023 20:15:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n90isLar3dFcirZbwZDiEST6rdbnWN+N6lSI2Tl97J3/6EU/7OozkKgWUPArvAEpUeOGZ7J8WauFAl0NbOWEGJumqK0WcHheE+Xqc+G+G/g/HiXufGJisIh9vNFMG38zwpzM6yrHI6wJT1TwFNEBDsk/UzgKsnSwQrvMt87WtFZgnR68nevL8llqX8WSXRVXxVLKuuGg5tGj6qLpFJuSUidCZaAbr6eXcjQLo6ERhuN1UbdVY3fxOYMjFf7wyXJr/4rhup9Zi/Y5/D74Mrt5FNwb+Zx2O3o8AIPwNusDCpQ7AGfHmPRdNsW2sAdvWMZd94iDbFl82spmLzja2NvQvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSBIKYqCWzFiLEYmH/r8mKu7U5AhlgD2YCvarLDgHKA=;
 b=aRZK4grKAwHNhsRgmecYSUnDw8H4Hb8CkvCK44nSI4cFDWGd9kyj2Xixp9g3tKX4IXyEn8koi/g8Agc8/0UiNTYku12fG+CMbEAzctv5ceAsQEGoTx2v69rwq1GcRQ2CI3FqGdZzmcp5DwqV2F5RH1LKMHrxyoqUHtWmzMEqhLwLdvBTyprM4QSgIL3pGVD/2BtrEQgbhv0LXk2RUvpBRrPx0c1J+ejiUBvh0geyx2Q3dkT1fpX2RmPDDNBVU6Tj/uh7mYJuSoJstyMh9vxhAUhLkOfugySv37WJZeYpi/vrAb7Uu2xb2V7bN9uVPkHbdaD0GTp+gyzZbJ7ro8eaig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSBIKYqCWzFiLEYmH/r8mKu7U5AhlgD2YCvarLDgHKA=;
 b=QorLUlHkO1GmyCjW5p8ceoeiEsrIFEomJwdULSD2/Xg90dxYm1Qc9cQWzNvz3ClZIJnELvOlQA2uWL317fL4NuETMsGQSc9cZKMxR4R/BUJwGqaRuFzTsSUGQprm11CZ+fY0daIDSLI2ndMNi3tazlFLke8xHCKJA4gsMIxXUc6/qxaJveh5Q0E4ji/wUaS1Mla3A1ckIng6AwzyVr6xHVw9mtNwY1T8x8B7tP9WOCAPEfN6jQt1LLfwmVF9q0CxCG39175MyYSWnwo9066boU9mnOATSPjTdXvZOUTnedJik1jiQ8j775QpduDsG74F3Xn1fd9ahzm8qos9XE/W5w==
Received: from TYZPR06MB5274.apcprd06.prod.outlook.com (2603:1096:400:1ff::14)
 by SEZPR06MB5319.apcprd06.prod.outlook.com (2603:1096:101:7e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Thu, 9 Mar
 2023 09:15:10 +0000
Received: from TYZPR06MB5274.apcprd06.prod.outlook.com
 ([fe80::e7c2:8fd8:5892:6687]) by TYZPR06MB5274.apcprd06.prod.outlook.com
 ([fe80::e7c2:8fd8:5892:6687%9]) with mapi id 15.20.6156.028; Thu, 9 Mar 2023
 09:15:10 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Wolfram Sang
	<wsa@kernel.org>
Subject: RE: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index:  AQHZSZBNCqcj9BIMLU6U/5WV2MINja7idvcAgALva/CAA1hsgIAAAQawgAAHfwCAAAAwwIAACb6AgAANnCCAAAdYAIAA+HuggAIdpoCAAPm8QIACD6wAgAAcw9CAAxMXgIAAAvUg
Date: Thu, 9 Mar 2023 09:15:10 +0000
Message-ID:  <TYZPR06MB52746773023B98DF000224BDF2B59@TYZPR06MB5274.apcprd06.prod.outlook.com>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
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
 <SEZPR06MB5269CA376D572B6241FCAD4DF2B79@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <f17f09f9-ffd0-bd2b-7343-e468f83dd6e7@linaro.org>
In-Reply-To: <f17f09f9-ffd0-bd2b-7343-e468f83dd6e7@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5274:EE_|SEZPR06MB5319:EE_
x-ms-office365-filtering-correlation-id: ee4b8a43-ba3f-4d51-73c1-08db207ec867
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  EG1YD4TsPlOAHHFVJCO1v6ahuoCGWqp9MeRlVwPHf4/9SrY6uEdIgn++nvoSK0N223ibkcL+pPN1vtk7S3mjuVAhLOr09cugggOmuclhvWBbHumgK3Bb/RgfK168mQvTuevFn68OZheFfDvcPWPkEpPIeAAPB53N/tMTG5wc8EGRUCpNsz+ZnRaEdI6V0rgXrJGpyil/tsPtm0IkCs4sikCjh+YjBUWrLgrtG5AnqwpKKbdLGVcqZ/VPriF8KsiV5Wzt8Xht4b9ZpBg+GM3CRPNiLIH6WJNi/yvsjKwEQqXnzVfpoz6crL39lFb6Za6/cbPke1HTaNHqdOS9gEPWS6TxlTOwjYO8q+I2+30CCm+Vpb6GJFMjpKiskBlEum8yP2c05htX7Kff5MJyjQjBADJkJZ3tS2zTH7pqGDqkp5zLX2juuJG6bV4fOAdm1QVZuxK5aY2oZtgukMy8QWFcdQItsVZnqYwlOx9KqiaREwGGvxPCeqW6cb8MN1nEO8GFDVgMjO4KXXaBAreOecR2MjG7xvSD2CMoz3ZZm2MUbzZPXRymkiWj3k/OP31l1qp2/rhrJCPj5ulaIE+RuK5EG7TdQIgIyhGZ7x6SdKhDxiAagf3oZr/zsmag7zSnd8nOtzxsqm2bbjAYf5AJel1TKCNdiR2xftnlsQfZDxuhmGMTrvaF4HgtV1sEdoom5uqs/j3OTOef4lRab8r+gYMk6kgrvRp97qTHLWUA8yubjwM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5274.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(39850400004)(376002)(346002)(396003)(451199018)(33656002)(110136005)(316002)(9686003)(54906003)(966005)(76116006)(478600001)(8936002)(7696005)(7416002)(41300700001)(5660300002)(55016003)(8676002)(66556008)(2906002)(66446008)(64756008)(66476007)(66946007)(4326008)(71200400001)(26005)(122000001)(52536014)(86362001)(6506007)(38070700005)(186003)(53546011)(38100700002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QjM2WG1Nd1FHaXhSakJNYkEreUw0c1UyekR0VkZzeDdYV3pTc3N2RXhvTDRG?=
 =?utf-8?B?eXdjZDBLRlUyWXcyT1R2VDRubU5TaG5QMFp6dDNaVVlxNXRLYit6Qi9FRjd6?=
 =?utf-8?B?dldRSnB3VXFGZnZSUXRWeWY0VHgrZDBvTUpZYWNsRXVSajNYS1pZaDVjcmFJ?=
 =?utf-8?B?aGM5WGxxTlpnSVczdG1Nd3VHMmtXcjV5QVU0KzBDQ3QrRVZDQW9ZQmJqaCtj?=
 =?utf-8?B?ZGdoQllVU3lVcXNFbWI3N0d5aUtxMWNVMFcwVTJ2ajhRZHRWRitKRUlWekND?=
 =?utf-8?B?OEdTdGw1K3hzOHFnNk1yTlowYVpwRXY2Zmx5Vyt5MlZTUk5UQU1tQXJXTG53?=
 =?utf-8?B?U3lXTnJXMm0vSy95UzRBeVhxSEhnejMzdG01eG9lU3hUTHl4bE9wVjJTKy90?=
 =?utf-8?B?VmhkeGdPRHdCRmd5ZGw0NTIrUkdtbHQzM2pJMG1ZSWRaQjM2UTZyT1JGQ3JH?=
 =?utf-8?B?THd2WnRzRmZIOG5hQkZ2WmlQbTJyK1FXTXFUNHNKMWtPMVErRXN6bjU0YlZV?=
 =?utf-8?B?WnF4ck5EcjJqNmdHUXRTbm44SWhheURDOE5QL2NjWnMrdjE5ZTZnUXpQNHZt?=
 =?utf-8?B?TGxRT2w2aWgrQ0lhK2RoUFd6dENTUDVPSXdJV0NmYUlmdm0veWtLME9BdHYw?=
 =?utf-8?B?R3lJTE5rVTRyYUpuZUNsTWMxODFaVnVmS3dSalV5WDJVejJaNlJFOUZlR2Qz?=
 =?utf-8?B?cVlCU0ViU2hpdHA4dDBEcUtjd2FnMnB1NTg0OEwrVVNWS2lqbnJTYTRyd1RV?=
 =?utf-8?B?TFpNVnJLWEJyb0U3TW1FM3BWL0tCZlZNUlJ3Yk94UFVlUWdvZkQ0MUdGYlZB?=
 =?utf-8?B?dnJ0Vk5BSFZ2VmpxazAwa0FSb0JKNUdrL2FoWUpOeUhvZG0vZnBqUHVUeWlQ?=
 =?utf-8?B?d1ZvSVNEOXVqcXpuNDN4SkQvUlAySUd4N2RmbW5qUEpWTHVUMWN4NGN0TTZL?=
 =?utf-8?B?OFNpODJRa3hhMTlodFJiM0Q4T3d4K1ZnY3pIcWljdHZsNDdNYjNHV1phVjdR?=
 =?utf-8?B?RS9TVlRab1lUNkR6NjBkMzBNRUlBUzZJQzRQMWFhbVgrSmRpbG5TbWdvbkFW?=
 =?utf-8?B?WUJrZzdzbnNEdjZBVEYvLzFqL2hZRDRkZ3pjYVM0NkZhTktKeFEvbStYZUwy?=
 =?utf-8?B?UjVGTHF5VmNOZ0tnV1J2ek1rcU1jV3J0SmhJM3ZHSHZsVk9EUkxnSXZrZnVC?=
 =?utf-8?B?aHQ1V3gremU4UXMxdXVOSFVOeUNsWG4yQnl4N1lPWVgvVlpMT0lUcnVUV0c0?=
 =?utf-8?B?ZUZsK3dvbzVzOURNRXBDNlVuZGhHQk1ncUhWdDFDTm1NVnljdkFFUGRINllV?=
 =?utf-8?B?bi9KN0YzRTVtbjZhcDQyc3pXNE9qYWw3OThBTHlaN1pWVGkvUkw5K0FxNWIr?=
 =?utf-8?B?NUdBcmtmcnd0WFF4WFU3YTBvNkFUQ0ZvY1hUTTFuNTcvZW1TZ0szNHdTV2NS?=
 =?utf-8?B?MStPMWdzdGp5aE8rNWRhbmNYU01XeFQyeFBDN2haUGQyQXk2TmgrRmtsUkRh?=
 =?utf-8?B?ODdDQk5xdzJNcno0a1ZFVExtSWR3TndwTzNPVU9lanMrMTJkSHdDeEpBSUky?=
 =?utf-8?B?NW9lVlIwQ1JKNXZuU1J5eXcrOU1hb2FpR1JwaDFtbkxFdjUzU1hCdkJnSXpQ?=
 =?utf-8?B?MUFMd05aU25GaWljQWZoMVc5SWFBV0EwZFBDTHFjbGI1VExjcWUycVltdnNG?=
 =?utf-8?B?U3BYcENIYm0rQXE0cGtNWXcxSms5RFRBRFExZ0xlSzM3WGJVZE9Zdm1QN0lO?=
 =?utf-8?B?czhYenYwMzVKNkRsdjV3V2RkYkprWENhRHZuMVNDb2FuZ3FBbXMvS0xWWkdu?=
 =?utf-8?B?SEJpRjAranZGaFN4dVB4MnRuVmFHZnNQSWJHZHkwb1lnZ255TGY2dnR4dXpB?=
 =?utf-8?B?Tm9pcnJSekVuUm1LcWlxR1FaelUxUUw1VndjeGpMeW80Nzhvd01KcWxxcWIr?=
 =?utf-8?B?VDF3MEo4OGJ6MTlONDJ0dTlIRE5Rckpldml2eUhhRlUrZUwzb0pFRWlqUC84?=
 =?utf-8?B?NFNBclFsMmRtTFhYVDk0YndlY09qUm52U1pLbTJDelMyQUI4T29tUjhVVlZz?=
 =?utf-8?B?Nnh3WFF0UUk1cGZZRVhCZTJ6TWU2YVp6Tk5hdjcrR3NUQ0t4SjkzOHluakEv?=
 =?utf-8?B?cTFvbGRLUEFXWmp0UUFWNEIyWkxXRFFzY0dkS0FqczhvZnVYaE45Zk5sTWRm?=
 =?utf-8?B?VlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5274.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4b8a43-ba3f-4d51-73c1-08db207ec867
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 09:15:10.3092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M/eZHdhz2aXBGcF0J8yeUiaxu766tcFYTXzzAlJW2WGDfVuYCjEtspv0cynoHUKS/YBMAj/kfM3zkgifBBCI054tDRtDRE5obtKbxbdxgyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5319
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
U2VudDogVGh1cnNkYXksIE1hcmNoIDksIDIwMjMgNDo1MiBQTQ0KPiBUbzogUnlhbiBDaGVuIDxy
eWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+OyBXb2xmcmFtIFNhbmcNCj4gPHdzYUBrZXJuZWwub3Jn
Pg0KPiBDYzogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT47IEJyZW5kYW4gSGlnZ2lucw0K
PiA8YnJlbmRhbi5oaWdnaW5zQGxpbnV4LmRldj47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGty
enlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdA
YWouaWQuYXU+Ow0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgUGhpbGlwcCBaYWJlbCA8
cC56YWJlbEBwZW5ndXRyb25peC5kZT47IFJvYg0KPiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5v
cmc+OyBCZW5qYW1pbiBIZXJyZW5zY2htaWR0DQo+IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+
OyBsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZzsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBvcGVuYm1j
QGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2NiAxLzJdIGR0LWJpbmRpbmdzOiBpMmM6IGFzcGVlZDogc3VwcG9ydCBmb3Ig
QVNUMjYwMC1pMmN2Mg0KPiANCj4gT24gMDcvMDMvMjAyMyAxMTowOSwgUnlhbiBDaGVuIHdyb3Rl
Og0KPiA+Pj4+IDIuIFdoeSB3ZSBkbyBub3QgaGF2ZSBpdCBmb3IgYWxsIGNvbnRyb2xsZXJzIHdp
dGggU01CdXMgdjM/IFdoeQ0KPiA+Pj4+IHRoaXMgb25lIGlzIHNwZWNpYWw/DQo+ID4+Pg0KPiA+
Pj4gTm90IGFsbCBidXMgaXMgY29ubmVjdGVkIHdpdGggc21idXMuIE1vc3QgYXJlIGkyYyBkZXZp
Y2UgY29ubmVjdGVkIGluDQo+IGJvYXJkLg0KPiA+Pj4gVGhhdCB3aWxsIGJlIHNwZWNpZmljIHN0
YXRlbWVudCBmb3IgZWFjaCBidXMuDQo+ID4+DQo+ID4+IFRoYXQncyBub3QgdGhlIGFuc3dlciB0
byBteSBxdWVzdGlvbi4gV2h5IG90aGVyIGNvbnRyb2xsZXJzIHdoaWNoIGNhbg0KPiA+PiBiZSBj
b25uZWN0ZWQgdG8gSTJDIG9yIFNNQnVzIGRldmljZXMgZG8gbm90IG5lZWQgdGhpcyBwcm9wZXJ0
eT8NCj4gPg0KPiA+IEZvciBleGFtcGxlIGZvbGxvd2luZyBpcyB0aGUgYm9hcmQgc3BlY2lmaWMg
Y29ubmVjdGlvbi4NCj4gPg0KPiA+IEJvYXJkIEEgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEJvYXJkIEINCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tICAgICAg
ICAgICAgICAgICAgICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiB8aTJjIGJ1cyMx
KG1hc3Rlci9zbGF2ZSkgIDw9PT1maW5nZXJwcmludCA9PT0+IGkyYyBidXMjeCAobWFzdGVyL3Ns
YXZlKXwNCj4gPiB8aTJjIGJ1cyMyKG1hc3RlciktPiB0bXAgaTJjIGRldmljZSB8ICAgICAgICAg
IHwNCj4gfA0KPiA+IHxpMmMgYnVzIzMobWFzdGVyKS0+IGFkYyBpMmMgZGV2aWNlIHwgICAgICAg
ICAgfA0KPiB8DQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAgICAgICAgICAgICAgICAg
ICAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4NCj4gPiBCdXMjMSBpcyBtY3RwIHRy
YW5zZmVyIGZvciBlYWNoIEJvYXJkQS9CLiAoTm90IHNtYnVzIGNvbm5lY3RlZCkNCj4gPiBCdXMj
MiBpcyBpMmMgZGV2aWNlIGNvbm5lY3RlZC4NCj4gPiBCdXMjMyBpcyBpMmMgZGV2aWNlIGNvbm5l
Y3RlZC4NCj4gDQo+IFlvdSBhcmUgcmVwZWF0aW5nIHRoZSBzYW1lIHN0dWZmIGZvciBteSBxdWVz
dGlvbi4gV2hlcmUgZG8geW91IHNlZSBvbiB0aGlzDQo+IGRpYWdyYW0gaGVyZSBvdGhlciBJMkMg
Y29udHJvbGxlcj8gSG93IGRvZXMgaXQgYW5zd2VyIG15IHF1ZXN0aW9uPw0KPiBZb3Uga2VlcCBy
ZXBlYXRpbmcgc2FtZSBhbmQgc2FtZSwgc28gaXQgd29uJ3Qgd29yay4NCj4gDQpTb3JyeSwgbXkg
bWlzLXVuZGVyc3RhbmQuICANCkkgZG9uJ3Qgc2VlIG1hbnkgY29udHJvbGxlcnMgc3VwcG9ydCBm
b3IgdGltZW91dCBmZWF0dXJlLg0KSSBkbyBzdHVkeSB3aXRoIG90aGVyIGNvbnRyb2xsZXJzIHRo
YXQgaXMgaW1wbGVtZW50IGl0IGJ5IHN3IGltcGVsZW1lbnQuDQpodHRwczovL2dpdGh1Yi5jb20v
dG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tbHhiZi5j
I0wzMDItTDMwNw0KaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVy
L2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW1nLXNjYi5jI0w1Mi1MNTUNCmh0dHBzOi8vZ2l0aHVi
LmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW9t
YXAuYyNMNTg4LUw1OTYNCg0KU28gSSBhc2tpbmcgZm9yIGFzcGVlZCx0aW1lb3V0IHByb3BlcnR5
LCBJZiBpdCBub3QgYWNjZXB0YWJsZSwgSSB3aWxsIGRlZmF1bHQgZW5hYmxlIHRpbWVvdXQgaW4g
ZHJpdmVyLg0KVGhhbmtzIHlvdXIgZ3VpZGFuY2UuDQoNCg0KDQpCZXN0IHJlZ2FyZHMsDQpSeWFu
IENoZW4NCg==
