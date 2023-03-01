Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 382C46A677C
	for <lists+openbmc@lfdr.de>; Wed,  1 Mar 2023 06:58:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRNpR07kpz3cKk
	for <lists+openbmc@lfdr.de>; Wed,  1 Mar 2023 16:58:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=iVedkiyF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::723; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=iVedkiyF;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20723.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::723])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRNnd6Gtrz2xHH;
	Wed,  1 Mar 2023 16:58:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8QySlKbaT+zHR4oaCUzQsAkiUdhW2WmlIEIonwLR2nD5RRMIfibXvZhES38WeQbrngXjVLx14OhCJxEvTQBwBYacnq7kYFeqVWDjbbvMG7C5HmQNEIKkATrrmyy565WVZAiHcJfraexW+SeTIiRI/fHuZiPm5IIspwP41C2CSyL4D5/Ql5/e2MW+ZvH8m6yuV9gat9Mph4HR2qHAc/LPxz3pJbC20NJ+wqFnUtGpi3tZAyEp4/5vw08Ub9U71/fFUHHfaIc+LP0hsiuAmLm7Lmkw1GEE020W4BJMttM1eJ6iw71P+FkcQP6jiwW/+vdy6wEfKs3tvPq4aJNGW+0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCEZ5ZheDprmoeAq6zUfIVuHPeI7A8RjAs/vixf/f/Y=;
 b=D/YsOIGPzfP9c61WA8pyO0EZqOGM/yt2K/D6LBi0JZsWJIxXrKggE94HKdWQSxIPtOGF87XmMfz514yn1fM1aCpeBfqEWzJQ8AGZzyL5COuLlT6Pnwgn03lPq7HIs+y5aHxfvngApNb2qQGc4gpbai9IXlul8+l1Gwc6yQL3rHmarP67lBhaoN1Cr9sERpXX90rFYI/o58IBFYbK7yujkahWdlxH7m/3W/FLqVjswiVJQMKlPtlO9eu243jlk+Jvs6iWXnn+gzkWG4d5xpoGrxdUJdN1r/9tsG1qSkP0e3+ZmlMQDO2PktgPhJY0WQ1Yk+VAHwH0lEMMZz0vqQTWlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCEZ5ZheDprmoeAq6zUfIVuHPeI7A8RjAs/vixf/f/Y=;
 b=iVedkiyF2GSPg6zIo7ODezgJEFiSvomY+Og9SxmRCmAX+BEkuJ4ldVbn5/0/vYjgu+YVoZ0MEwcJbIbgQ6i1PFpYxeYGxjci3YxlPhVQpnMyJxSIB4krsqubtISifjUDGFtt88qy1ljUsDHLy+39V/KNr3FnJ5q/n/+NTMCIXeRoQJ0tNueUbtcCh8y5uVmtl9CyzAwyeF0GWmJjnI+Ys7+0VLSLy+3bXbU1126EXo6gp24sNAeo5Gs5bn9qnUBNDWfYumN357LSj1mbmgF1vBfLLOeGijCnsSvW0gxc77vOzhU0WbmEtW6CRBJE90l1K9uyRPQwgUXM+1aZMifHeQ==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4332.apcprd06.prod.outlook.com (2603:1096:4:151::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.16; Wed, 1 Mar
 2023 05:57:45 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6156.016; Wed, 1 Mar 2023
 05:57:45 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andrew Jeffery
	<andrew@aj.id.au>, Brendan Higgins <brendan.higgins@linux.dev>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
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
Thread-Index: AQHZSZBNCqcj9BIMLU6U/5WV2MINja7idvcAgALva/A=
Date: Wed, 1 Mar 2023 05:57:45 +0000
Message-ID:  <SEZPR06MB52699DEB2255EB54F35C2A59F2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
 <53090449-58c9-bc03-56df-aa8ae93c0c26@linaro.org>
In-Reply-To: <53090449-58c9-bc03-56df-aa8ae93c0c26@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|SI2PR06MB4332:EE_
x-ms-office365-filtering-correlation-id: d2f718bb-7814-4f01-d107-08db1a19e125
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hK0U0NG8S6uT4SM50Sdh8PLAn9HIVPnzlqh6lIRQsdXHjPPtsyhvWo+8MgTYAsX9thxj93Tl2VRrlc3KQEroUMSJh/Gacnu5seMTz98GyfdOTlr/qb6b+D936t8f0C+bx+fgKoCtcLVr0qPdp5XHGeJJiu8dqWhPvBgog8igrY140JETxICJBsVoPnot7cm20AA3kNX44LsgtcF8TTSxkeKLtqKQrFGnOkp3B4dkjUUcLJMMTYrW6SQbmoz8MEfJp/cMfNLzrzgausR6SgN+5zkTaFggNNtBDIBOR5h1GtUW2L8YFMAMzZnl4FQPf2qp+vrfi3mkQezM93K6WdNMQUeD+FNslp0wQ6fB7ZFqU/RRDC6FMuNqIxT8ymIMSqxaDKgqqAKFIf3X004YTdqDzwskPInKIWYWZQnvBG8TnGmnA7SJ7qjDliB4ufwTjaVRmxeQoCseUBQtgxQwHjRjXcDXpZDCLuGlJHRq1GlmyowfELfqoOC0V5j64u9TyZrU2oB5bcezHT71GCsVsFpqxEIzdxHo/41ttxZxSD/MJhZkHtUjxfFsGbGjn2h5YVK+HOhV2BaljxZvxHxvXZavRJ6G+dx13pdxoy7Ve/Kh0QHXIrEFSpaUlMOJaJUo2xrCpIyIrHEd7vMBoYougMeBIxlBxBPRndCvYKJSX4XIXrvBCxuChbH4iTTGFtyAHNPoeQCKczfn4HF7HP3Ht+yTIdJVDKMRgR2TctQBrjSxPPA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(396003)(346002)(39850400004)(366004)(451199018)(33656002)(110136005)(316002)(83380400001)(53546011)(9686003)(7696005)(6506007)(186003)(478600001)(26005)(86362001)(8936002)(41300700001)(38070700005)(921005)(66446008)(66946007)(66476007)(5660300002)(7416002)(2906002)(66556008)(52536014)(38100700002)(64756008)(76116006)(71200400001)(122000001)(55016003)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cjZuQXd3ZlhWdU5zK0JwT0pKcjdxZkJhVG1KRy9OWWtkZEdNYkhncWdxdnB6?=
 =?utf-8?B?REplSkhGQ3lhYlltbzJtR25BVjZHUXNzYjU2UCtpbThYSDNjNjZrdDB4OGdR?=
 =?utf-8?B?eFlkQWtSVXNuRFpCbFI4OTlKV1lVMWZudEF2VXhOTEdpM2JmVi9CTm9kbisv?=
 =?utf-8?B?OXVlTGFHckNTYVcxZ0NkZmFBUHFCYkN6ODVZV2Y1a3pFZ3I2NTdmSlBpdTZS?=
 =?utf-8?B?dWx0ajFyMGplOEpweTFjVnQ0S2JiRUxXQ3B6d295OHU0V3Q5aFgzYUVieHBu?=
 =?utf-8?B?RWhQSHBydTZXQXljb29FWTNZWXBuQVZkSGlXbUlXRUlUUEVKV1pVeEt1T09T?=
 =?utf-8?B?UWlxZ0cyUUFYbjJOM3JKUlpwaWtSTEtEbkRROFAyZ3pPWm1ZNjIrdmZ2V013?=
 =?utf-8?B?VS93VHk4QmZkSEdRRU1tTjFIb2ZTS0l5RDRDWTJuN0pad0hOMUZ2bllHS0xF?=
 =?utf-8?B?VUIxbXVyR2NQbnFtVElUaWFleXFIR1BnMmZpNlp0aFRJbVFicDFsNnIxZjRF?=
 =?utf-8?B?Q1VHclR2M2tXMU9YckY2b2JCdERKckJWM29ZbWlIYjd1ckV2K0kvd0c3aTQ2?=
 =?utf-8?B?OHNLcDZkTSsxS1M0Sk9Selp6MFBYSEduWWI4UTJ3VGFLUW94dE9kdFllS21h?=
 =?utf-8?B?U3ZZUkZ0eTBCTkVVNzFqaURMMW8rSXlZQyt4ZXJMY3EvNGxjVjZnZWxzWHZi?=
 =?utf-8?B?MGtMN254eis5U3R0Rmk5UWc3ZHdKS20yQjZnVnplYk1hbG9JMFNoZGdTMVRD?=
 =?utf-8?B?WmdiMjJhNUVralgrY0JDL0M1eGwyNksvUU9EZHduTHZKdFB3Kyt5cytjd0h4?=
 =?utf-8?B?Q2tCT0lrZzNLcG5jbURDeUFMZU1GMURWY05sclMzK3JCa2dzQ1BST1dFZCtm?=
 =?utf-8?B?M3VXTmpxK0tyUTZ5RHNSOVh6Q2FBeHdrcUU5N1FVdzNoK2NFMFBxUjJMQUZu?=
 =?utf-8?B?bnQrNThwV053cURCWkRxRCtXYWFYWHZLTHBySFZ2T1g2K2Qwb0RKOWJWQTF5?=
 =?utf-8?B?VlFsQitycUp5cFZ0MzRSa1IyVy9mZjd3MWM2eE1JUWZUUlE3eFBDUnJFTkVT?=
 =?utf-8?B?V2FuSGlmV043UE50T3FaVWsxK2VEVzY5cGhTQk16ZnJ4ZHhWZnpaVmc4T254?=
 =?utf-8?B?Qi96OUM3Z0Q4UjNTcFRqWVVENGFvempwOVBZNDFCUTdHQjRpTWJ5WEJrK1NW?=
 =?utf-8?B?VVRNelpEVk5LNWdJdCtRZTlERyt1cXJNZ2Qya2ZreUEyTitsTXZWY1NjL3BH?=
 =?utf-8?B?WHRTRjRNNm9FUzJ2djBiVkVmUk5DZHNra2FRanV3azM3ZndIdzMyUEZmMW1t?=
 =?utf-8?B?ODVjVlJyQTJsY2ZxNEVmOXBpbFRRaTc4ZE5kb0plbjVVWkg1TlJZT2tDd0Jx?=
 =?utf-8?B?MDFQR2txV05sSjZJR2RuSGI2VkxEakQ2MHZRQUY4SFdYOHliU2JvZlJlT29k?=
 =?utf-8?B?cmdPcElXaVNYQmJhVFdsVkF6MWUyOHNYeXhIcXVaR3lrdVpuejBUSzJ2a24y?=
 =?utf-8?B?Wk10bk83VDI3amFvUk5xeVFDWHd6djBXTndkTThiME9DR3BNZG42RHBiL0s3?=
 =?utf-8?B?V1FtSUhjL21VU3JSTHdHQXlLWHlwaUNjQXRFUC9rd25WWTJ5QWp4TUMyMTl1?=
 =?utf-8?B?a2pjU0laNmlRWE9PME80Y2tON21zZjN4YWJWQzRQVTBHblFiV3BINXQzRDFQ?=
 =?utf-8?B?VFpkRjlBQlRUdmlGMDcvODQrWVpPdVNQQ0ZIQVJoRG5uR3RYZldtRmZoOTVt?=
 =?utf-8?B?VHRuZXhPckpvcnFRRGNMSVcwSzRQMzhLWDloampwc01kMnZOUTlUcGFrUHA4?=
 =?utf-8?B?bzR5Q0g4bHVVRGhGaHl4WkF3UUdlanJyNWhzZ0hkdjRNbTdicHJHM21qa1FV?=
 =?utf-8?B?dFBFb2dNZHczRi9GUzJaelNxTktJNU9oMTl4WEwrUzhrSWRyUFA5a1c2TEEz?=
 =?utf-8?B?UlIxdldBeTRkU2hwOGVMc3ZoeDlLZTVSNEd1QnArcWhFeDJIR1h5ZWpYbU1J?=
 =?utf-8?B?cmxsT2tUNS83VGxkdExDTHQzZklSRVY3VXB2M1dEY3FlT200N2V2RUFKTDJL?=
 =?utf-8?B?NkNjTTVzQ1JLTjJvcWJiVVRad3BlQk9nQ2Z2ZDhlU05pMWpxMG41RHN5MjYv?=
 =?utf-8?B?ZU8wZ1J1RkZ1QlBIbVF3bWQwbFAwek9ENkxGMFRWazJYQWYxOVJXVDcwckpx?=
 =?utf-8?B?d3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f718bb-7814-4f01-d107-08db1a19e125
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2023 05:57:45.6601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9JQRW+HClOD2ha1gtW8mBDiOwBB1W2t17AonAWcIW/wA12d0+S4cmYj8odn6J0XZojimJKsq1Uu94flyoNrRZ0kls/O1p9M2tXRguhdZnZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4332
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

SGVsbG8gS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4g
U2VudDogTW9uZGF5LCBGZWJydWFyeSAyNywgMjAyMyA0OjI1IFBNDQo+IFRvOiBSeWFuIENoZW4g
PHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IEFuZHJldyBKZWZmZXJ5DQo+IDxhbmRyZXdAYWou
aWQuYXU+OyBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW4uaGlnZ2luc0BsaW51eC5kZXY+OyBCZW5q
YW1pbg0KPiBIZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+OyBKb2VsIFN0
YW5sZXkgPGpvZWxAam1zLmlkLmF1PjsNCj4gUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9y
Zz47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJv
Lm9yZz47IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Ow0KPiBsaW51eC1p
MmNAdmdlci5rZXJuZWwub3JnOyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7DQo+IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7
DQo+IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMS8yXSBkdC1iaW5kaW5nczogaTJjOiBh
c3BlZWQ6IHN1cHBvcnQgZm9yIEFTVDI2MDAtaTJjdjINCj4gDQo+IE9uIDI2LzAyLzIwMjMgMDQ6
MTMsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPiBBZGQgYXN0MjYwMC1pMmN2MiBjb21wYXRpYmxlIGFu
ZCBhc3BlZWQsZ2xvYmFsLXJlZ3MsIGFzcGVlZCx0aW1lb3V0DQo+ID4gYXNwZWVkLHhmZXItbW9k
ZSBkZXNjcmlwdGlvbiBmb3IgYXN0MjYwMC1pMmN2Mi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvYXNwZWVkLGkyYy55YW1sICAgfCA0NCArKysrKysrKysr
KysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3Bl
ZWQsaTJjLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMv
YXNwZWVkLGkyYy55YW1sDQo+ID4gaW5kZXggZjU5N2Y3M2NjZDg3Li43NWRlM2NlNDFjZjUgMTAw
NjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3Bl
ZWQsaTJjLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aTJjL2FzcGVlZCxpMmMueWFtbA0KPiA+IEBAIC00OSw2ICs0OSwyNSBAQCBwcm9wZXJ0aWVzOg0K
PiA+ICAgICAgZGVzY3JpcHRpb246DQo+ID4gICAgICAgIHN0YXRlcyB0aGF0IHRoZXJlIGlzIGFu
b3RoZXIgbWFzdGVyIGFjdGl2ZSBvbiB0aGlzIGJ1cw0KPiA+DQo+ID4gKyAgYXNwZWVkLHRpbWVv
dXQ6DQo+ID4gKyAgICB0eXBlOiBib29sZWFuDQo+ID4gKyAgICBkZXNjcmlwdGlvbjogSTJDIGJ1
cyB0aW1lb3V0IGVuYWJsZSBmb3IgbWFzdGVyL3NsYXZlIG1vZGUNCj4gDQo+IE5vdGhpbmcgaW1w
cm92ZWQgaGVyZSBpbiByZWdhcmRzIHRvIG15IGxhc3QgY29tbWVudC4NCg0KWWVzLCBhcyBJIGtu
b3cgeW91ciByZXF1aXJlIGlzIGFib3V0ICIgRFQgYmluZGluZyB0byByZXByZXNlbnQgaGFyZHdh
cmUgc2V0dXAiDQpTbyBJIGFkZCBtb3JlIGRlc2NyaXB0aW9uIGFib3V0IGFzcGVlZCx0aW1lb3V0
IGFzIGJsb3cuDQoNCkFTUEVFRCBTT0MgY2hpcCBpcyBzZXJ2ZXIgcHJvZHVjdCwgaTJjIGJ1cyBt
YXkgaGF2ZSBmaW5nZXJwcmludCBjb25uZWN0IHRvIGFub3RoZXIgYm9hcmQuIEFuZCBhbHNvIHN1
cHBvcnQgaG90cGx1Zy4NClRoZSBmb2xsb3dpbmcgaXMgYm9hcmQtc3BlY2lmaWMgZGVzaWduIGV4
YW1wbGUuDQpCb2FyZCBBICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBC
b2FyZCBCDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tICAgICAgICAgICAgICAgICAgICAgICAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCnxpMmMgYnVzIzEobWFzdGVyL3NsYXZlKSAgPD09PWZp
bmdlcnByaW50ID09PT4gaTJjIGJ1cyN4IChtYXN0ZXIvc2xhdmUpfA0KfGkyYyBidXMjMihtYXN0
ZXIpLT4gdG1wIGkyYyBkZXZpY2UgfCAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICB8
DQp8aTJjIGJ1cyMzKG1hc3RlciktPiBhZGMgaTJjIGRldmljZSB8ICAgICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgIHwNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gICAgICAgICAgICAg
ICAgICAgICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQphc3BlZWQsdGltb3V0IHByb3Bl
cml0ZXM6DQpGb3IgZXhhbXBsZSBJMkMgY29udHJvbGxlciBhcyBzbGF2ZSBtb2RlLCBhbmQgc3Vk
ZGVubHkgZGlzY29ubmVjdGVkLg0KU2xhdmUgc3RhdGUgbWFjaGluZSB3aWxsIGtlZXAgd2FpdGlu
ZyBmb3IgbWFzdGVyIGNsb2NrIGluIGZvciByeC90eCB0cmFuc21pdC4NClNvIGl0IG5lZWQgdGlt
ZW91dCBzZXR0aW5nIHRvIGVuYWJsZSB0aW1lb3V0IHVubG9jayBjb250cm9sbGVyIHN0YXRlLg0K
QW5kIGluIGFub3RoZXIgc2lkZS4gSW4gTWFzdGVyIHNpZGUgYWxzbyBuZWVkIGF2b2lkIHN1ZGRl
bmx5IHNsYXZlIG1pc3ModW4tcGx1ZyksIE1hc3RlciB3aWxsIHRpbWVvdXQgYW5kIHJlbGVhc2Ug
dGhlIFNEQS9TQ0wuDQoNCkRvIHlvdSBtZWFuIGFkZCB0aG9zZSBkZXNjcmlwdGlvbiBpbnRvIG9y
ZSBhc3BlZWQsdGltb3V0IHByb3Blcml0ZXMgZGVzY3JpcHRpb24/DQoNCj4gDQo+ID4gKw0KPiA+
ICsgIGFzcGVlZCx4ZmVyLW1vZGU6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogfA0KPiA+ICsgICAg
ICBJMkMgYnVzIHRyYW5zZmVyIG1vZGUgc2VsZWN0aW9uLg0KPiA+ICsgICAgICAtICJieXRlIjog
STJDIGJ1cyBieXRlIHRyYW5zZmVyIG1vZGUuDQo+ID4gKyAgICAgIC0gImJ1ZmZlcmVkIjogSTJD
IGJ1cyBidWZmZXIgcmVnaXN0ZXIgdHJhbnNmZXIgbW9kZS4NCj4gPiArICAgICAgLSAiZG1hIjog
STJDIGJ1cyBkbWEgdHJhbnNmZXIgbW9kZSAoZGVmYXVsdCkNCj4gPiArICAgIGl0ZW1zOg0KPiA+
ICsgICAgICBlbnVtOiBbYnl0ZSwgYnVmZmVyZWQsIGRtYV0NCj4gPiArICAgIG1heEl0ZW1zOiAx
DQo+IA0KPiBEcm9wLCBub3QgYW4gYXJyYXkuDQo+IA0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMv
dHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvbm9uLXVuaXF1ZS1zdHJpbmctYXJyYXkNCj4gDQo+IFdy
b25nIHJlZi4gVGhpcyBpcyBub3QgYW4gYXJyYXksIGJ1dCBvbmUgc3RyaW5nLg0KDQpTb3JyeSwg
SSBjYW4ndCBjYXRjaCB5b3VyICJvbmUgc3RyaW5nIiBwb2ludC4NCkNvdWxkIHlvdSBwb2ludCBt
ZSB3aGF0IHJlZiBJIGNhbiByZWZlciB0bz8NClRoYXQgSSBjYW4gY2hlY2sgaW50byBMaW51eCBl
eGFtcGxlLiBUaGFua3MgYSBsb3QuDQo+IA0KPiA+ICsNCj4gPiArICBhc3BlZWQsZ2xvYmFsLXJl
Z3M6DQo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFu
ZGxlDQo+ID4gKyAgICBkZXNjcmlwdGlvbjogVGhlIHBoYW5kbGUgb2YgaTJjIGdsb2JhbCByZWdp
c3RlciBub2RlLg0KPiA+ICsNCj4gPiAgcmVxdWlyZWQ6DQo+ID4gICAgLSByZWcNCj4gPiAgICAt
IGNvbXBhdGlibGUNCj4gPiBAQCAtNTcsNiArNzYsMTkgQEAgcmVxdWlyZWQ6DQo+ID4NCj4gPiAg
dW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+DQo+ID4gK2lmOg0KPiANCj4gVGhpcyBz
aG91bGQgYmUgdW5kZXIgYWxsT2YgKGluIHRoaXMgbG9jYXRpb24pDQo+IA0KPiA+ICsgIHByb3Bl
cnRpZXM6DQo+ID4gKyAgICBjb21wYXRpYmxlOg0KPiA+ICsgICAgICBjb250YWluczoNCj4gPiAr
ICAgICAgICBjb25zdDogYXNwZWVkLGFzdDI2MDAtaTJjdjINCj4gPiArDQo+ID4gK3RoZW46DQo+
ID4gKyAgcHJvcGVydGllczoNCj4gPiArICAgIHJlZzoNCj4gPiArICAgICAgbWluSXRlbXM6IDIN
Cj4gPiArICByZXF1aXJlZDoNCj4gPiArICAgIC0gYXNwZWVkLGdsb2JhbC1yZWdzDQo+IA0KPiBl
bHNlOg0KPiAgIGFzcGVlZCxnbG9iYWwtcmVnczogZmFsc2UNCj4gYW5kIHRoZSBzYW1lIGZvciBv
dGhlciB2MiBwcm9wZXJ0aWVzDQo+IA0KDQpEb2VzIG1vZGlmeSBieSBmb2xsb3dpbmc/IA0KDQph
bGxPZjoNCiAtaWY6DQogICBwcm9wZXJ0aWVzOg0KICAgIGNvbXBhdGlibGU6DQogICAgICBjb250
YWluczoNCiAgICAgICAgY29uc3Q6IGFzcGVlZCxhc3QyNjAwLWkyY3YyDQoNCiB0aGVuOg0KICBw
cm9wZXJ0aWVzOg0KICAgIHJlZzoNCiAgICAgIG1pbkl0ZW1zOiAyDQogIHJlcXVpcmVkOg0KICAg
IC0gYXNwZWVkLGdsb2JhbC1yZWdzDQogZWxzZToNCiAgICAtIGFzcGVlZCxnbG9iYWwtcmVnczog
ZmFsc2UNCiAgICAtYXNwZWVkLHRpbWVvdXQ6IGZhbHNlDQogICAgLSBhc3BlZWQseGZlci1tb2Rl
OiBmYWxzZQ0KDQo+ID4gKw0KPiA+ICBleGFtcGxlczoNCj4gPiAgICAtIHwNCj4gPiAgICAgICNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9hc3BlZWQtY2xvY2suaD4NCj4gPiBAQCAtNzEsMyAr
MTAzLDE1IEBAIGV4YW1wbGVzOg0KPiA+ICAgICAgICBpbnRlcnJ1cHRzID0gPDA+Ow0KPiA+ICAg
ICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZpMmNfaWM+Ow0KPiA+ICAgICAgfTsNCj4gPiArICAt
IHwNCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9h
cm0tZ2ljLmg+DQo+ID4gKyAgICBpMmMxOiBpMmNAODAgew0KPiA+ICsgICAgICAjYWRkcmVzcy1j
ZWxscyA9IDwxPjsNCj4gPiArICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+ID4gKyAgICAgIGNv
bXBhdGlibGUgPSAiYXNwZWVkLGFzdDI2MDAtaTJjdjIiOw0KPiA+ICsgICAgICByZWcgPSA8MHg4
MCAweDgwPiwgPDB4YzAwIDB4MjA+Ow0KPiA+ICsgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkg
MTEwIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiA+ICsgICAgICBhc3BlZWQsZ2xvYmFsLXJlZ3Mg
PSA8JmkyY19nbG9iYWw+Ow0KPiA+ICsgICAgICBjbG9ja3MgPSA8JnN5c2NvbiBBU1BFRURfQ0xL
X0FQQj47DQo+ID4gKyAgICAgIHJlc2V0cyA9IDwmc3lzY29uIEFTUEVFRF9SRVNFVF9JMkM+Ow0K
PiA+ICsgICAgfTsNCj4gDQpCZXN0IHJlZ2FyZHMsDQpSeWFuIENoZW4uDQo=
