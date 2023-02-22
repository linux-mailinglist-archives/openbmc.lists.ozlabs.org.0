Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C6169F2BD
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 11:32:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMCC90yYwz3cD7
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 21:32:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=ZhRZXVhR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::70e; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=ZhRZXVhR;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2070e.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::70e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMCBL720Mz2ynD;
	Wed, 22 Feb 2023 21:31:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awXQKcqDWmE5Siw/gQh9vVIltX6TVHIpb6D3jltenhFYY2dDvE7iRb5W+BhaPKOL208hnqHtzr7GgCCyifBTVnFt53RsyuJu4e2Y5p/gy6KbggGy47yubRkmbKVjtZcBtXaZmcdFPfq4iXyyWkp3F0LOFrYZh+fxit1QOE6mCBL8R+GatZneadm+nQW9ZSiVu5SmAGLenWThzdLNTAX1kiAMRU0i00xGpswZem7XMxMyY//xwW+OecDaUwSp++AhZ+RF9S5c3lb68hClspbZ71bgtBvK+8zydQAPo90Pkbpr0aEnvYV3arzBSv6T4RL1GyEV2uYQTp6Mvcw7jTNZaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqZR8tn0xef5qDgopGrCdgeoG0exy++Byx9qG2jvzv8=;
 b=Sxf68A3+zrZ0vYQfxySvjVODuPGQ4bpVm+nq0tycYGes10KizfJswnmxAsyFJYY4Ybokfva8P+sMI9yiKQFac1dYxqcSfTTK5H8w9+pkPaXrmMSVjAXtcP2dBSAis+KtKt2tUd6f/i11wDqzwhJm6DtRyNGwmScJkCnTwY922Etw7xWqabyexoPlqIYbvRiEIbWP9itclSNe8aDw0+0QIL5hVK8S6qSc2OacWGqrmIuU3hbtxOt5m4Mq2R86w4aWb2FJ768Cs/ZtHAOr6/uF4mNDdBRUnj8ozUlO2abHFPppQMRRhXt0D23cY2z+tEEmdDnwdHWlWrs2zLNuMCD1AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqZR8tn0xef5qDgopGrCdgeoG0exy++Byx9qG2jvzv8=;
 b=ZhRZXVhRnNXaBz+KdIPhVFD/xvkSsZ+fqBzmQ6V3QseKqW+xl4zBBkCAgxELlwVck4A/WZcZjZPkLP/PGN06DT07bFzd3J3GXuvmhBmofOxEfiWTuSX87Jp8QLgmK2CyHmakyqwXYFZPj+uN7lkb1nAg4oyIfZRGePxlbfNkqe+D9bequJAhH+G/EtrKwLTDFkUh9fN5W9KFvWqJ9PL5DjfPazeqn2DFK4uQ3QwLdnUAsB7yQP8QicQI81om6rqsfynEtIoWy9/jb+22wB7srtw4FzBSEw7ezA4U5b45ueK4tTAPj//r6JqZ2l4clPmOliyBKmkC9TO53HHXWaw6AA==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB5864.apcprd06.prod.outlook.com (2603:1096:820:9d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.13; Wed, 22 Feb
 2023 10:31:18 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6111.010; Wed, 22 Feb 2023
 10:31:18 +0000
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
Subject: RE: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
Thread-Topic: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
Thread-Index:  AQHZRPMR/TOuXj0GdEGWPZ2JFslGsK7Xgo8AgAEkZWCAAIA2gIAABk2QgAARNgCAAQdUEIAAXpcAgAAiCSA=
Date: Wed, 22 Feb 2023 10:31:18 +0000
Message-ID:  <SEZPR06MB52696835ED8E2709D6A454DAF2AA9@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
 <20230220061745.1973981-2-ryan_chen@aspeedtech.com>
 <676c7777-635c-cc1f-b919-d33e84a45442@linaro.org>
 <TYZPR06MB527427ADCCD29DFD77FB0EE3F2A59@TYZPR06MB5274.apcprd06.prod.outlook.com>
 <80d873d4-d813-6c25-8f47-f5ff9af718ec@linaro.org>
 <SEZPR06MB5269502D7CBCD5698B65FF9FF2A59@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c0ac0ab3-87fc-e74a-b4e2-3cf1b3a8a5e2@linaro.org>
 <SEZPR06MB52698CCA6AE59DDC6C15CBE4F2AA9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <94238c42-1250-4d51-86e5-0a960dea0ffc@linaro.org>
In-Reply-To: <94238c42-1250-4d51-86e5-0a960dea0ffc@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|KL1PR0601MB5864:EE_
x-ms-office365-filtering-correlation-id: c90435be-755a-46eb-3eaa-08db14bfef3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  rVRVPFnuB4WYHhGbV86kZlW6zdw/LfgbfqsIIcPGhUFljkDMVwFmRJaezeB/TSqpKxssShD7V3joovu1unt71v9Vd1x+oIQaivBy2Oqp917jiXMZYu+CUQgAzdCrF92jqIEu0aCSsetD/kkmX9Vqn1Zd9T3W4uGU4O2xt1xCM3ECvXXuc5KAlTLDLIXzDa5a4bLeXxzhqVpIgxumPqziGdarwIds5hSOEUCG716q9GYnHpt5rhMeLCL9/za+PaVmepZ4vGe3eKQb1WakleDWYX3dR4Zn+83UdW+xPCbAX9my3GSoYSXcG3meNXlpHyqPY9cWWq2RLJ07xk8LhsRoeOsLkij/T4EvcwggcmX1dcuxhabhM6vPtFylJ7jFGmkrmTEYUJhcEKw4bLswTafkGDZ918L23NS8E+twE2LjNiWTiRIzYDi4B/SOZ+6V/9p26HHchsiPv5orxqy77K1GvCQotVqzJajehYppuw1x1Kw7/fhnDWYk6dIEVr48u7bDnt1ZcHpXmUyv9yg8axVD4hYaSIow9Fyn9S8+UxjyueZQtHH8Uzu/IZexvb2qAWc2uYNEiNLLEFGNkEAyjt0Jo+PJgB8kAJUdTw3zaU0qaRJKubZPH8JnrJWO0d4AmfGlHqJ76kenCKT2aB6csM9ESWJDpcZEN4jvJY9wkHbhyQzJUl0E9dEwr5Mh0LjGHzKxJeqEkxEcSL1uoWt2iewgz6zbsdkEWyViMTP+YnNfd0M=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(396003)(366004)(39850400004)(376002)(451199018)(6506007)(66476007)(66446008)(9686003)(7696005)(316002)(83380400001)(66946007)(66556008)(52536014)(7416002)(5660300002)(41300700001)(8936002)(76116006)(8676002)(64756008)(53546011)(110136005)(71200400001)(55016003)(26005)(921005)(33656002)(186003)(38100700002)(478600001)(86362001)(38070700005)(122000001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aUx4V3pTekdvV3QydHhUVjA4c05RWGx1SjRMVGpyWlhpeTBOanNHQ3BVSkNo?=
 =?utf-8?B?d0dLZXNVOFZFZUpyUFNFckRNamxQdkhhcGNYYmdXeVFtSFZDMnhGNmF1bDk4?=
 =?utf-8?B?SlN3Yjh3UVMwV3BGVW9vWE8xUEFkd3BQYlFrdmFSdzJ5UURJS1JtcVVTOTU5?=
 =?utf-8?B?UDl2eFoxeVRwNGs1ZzJ5dTlnSnNEeGJpZEp2RjB5R1ZUTjFMeVZEM2NIQm9S?=
 =?utf-8?B?YWZHeFFLQVNkOVo1T3J5L3Z5MG5wbmx6eExQZC9jS1dYcENtaTlOS1RvQk9p?=
 =?utf-8?B?eE90L0JmcEhlUHF1dmVpSko5MmhWQUtPZmNvRlJYQmszODRGYWc5VVczQm1j?=
 =?utf-8?B?WTVQMVlDQmtHYWNwdFdhNGlicGY5RnhtV2s3eGd2VUlsYm9sYXJhUHBBL2FJ?=
 =?utf-8?B?RTU4WEk3YTdlMVpvYmtvbGg2c0o5RU8wcDREalA1VngyQUhkUEZJeGY2R010?=
 =?utf-8?B?U2pCd29LSkpPQ1d3TC92UjE5cVZRWmJOUkxkbWRyNk14ZkZIeTV5Z1QxQ3FG?=
 =?utf-8?B?UDlvNWJPZ3BKTy9xdkduTjNHYVdiTW5RWW51Qm42ODdoTlZxcmUzdStLSmZM?=
 =?utf-8?B?dHVPL0IydkR6S01RcFNROVluU3lYQU5hUVdPUUQ1Q24zSnBNejNzZnZpbVk1?=
 =?utf-8?B?eTFsMkViamV3RFBzSU50WHJUVmlDdmtoSjQwUUZ4WHo5R0drcHlXakZJT3oy?=
 =?utf-8?B?R1ZjUzVxWTduZ295aUloRXRGMVdzbU90aHJ6d1J4c3NITC81dDA4c1U1ajhl?=
 =?utf-8?B?UldEOVZRUysrM0JRWUN1VHYrWWJBb09lL3RGWFVaRXhlOHVVaW1ucVEwKzhv?=
 =?utf-8?B?TG4ySXJxNFV3b0JyZkUxa0dPbUNCM1FqVzM1ZjlUM1MvWFpONDExS1c5ZTF4?=
 =?utf-8?B?d3Q0YnZTY0I4OGM5U2EzSWhRTlVNb3BWbGV6OW1SRnBTbDZqdHk1M0xOckxN?=
 =?utf-8?B?b2FmTy9reHJnUUNZa2JlRjhjNjQ4TU9sMnBkNlR6NjVqWUJ1TjNtN1M4Qy9L?=
 =?utf-8?B?ZHlNR2F2ZmQzWUxybmwzUjltZHJZMHFhL1R2ZFNvWGcvNFhuTTdWTHIwUTd5?=
 =?utf-8?B?cFlFNExYQmtuc2tKMVNoQWpXZmszdzl2MGNYTmtUKzZod0V0WW1tclJmQitZ?=
 =?utf-8?B?UjRjaEVSeXRPdkMrWVJZUTJhN2pkdmZEeUErQUl2Sk5yeW1obG1pZG9CTGlV?=
 =?utf-8?B?TjluK2U0TTJRdnEyV2UzdUtlcmI0ME9LaVdoc1o2eDdJd0xQa2c5WnFJMmVz?=
 =?utf-8?B?TXNJRWc3aUtzdm5VU0hybWZ5dTR6NHhsRWVLa2pDbjRnemFvSERMZVNyU3o1?=
 =?utf-8?B?MXVEczlvUm1UQzRYZHQ3WkVOK0MxMHR2aldsOUQ3TStrZ1V3bHhLN0dpZ21v?=
 =?utf-8?B?TjgxVWtWRXlCcFRzdlZveEdGTFlRcnBuREVjUDFqNXRlMDFETE9tYXNQVnR0?=
 =?utf-8?B?UVVDblRFb3FQcHpnYnM3L2FudlBjNEFOdzRTbFFiTXJXdTVnTkNtTzl5dzZS?=
 =?utf-8?B?Ryt3NnhFQnVDVkN4RjdEdzY3TFVkU2RRSG9xditaaFRCYmVzRUZsaGlQRjE4?=
 =?utf-8?B?YzBOelc4WVV6N1V5TDlTWkl0YTRSS3EyaHRrZnY5b0xlVThKQjltSnh4VWFF?=
 =?utf-8?B?NWptRXZ4WGo1Q2lJWGQ3QVo2WXdvSE16Umd5ZlpaaFgrNTBDTnpHblUwLzFn?=
 =?utf-8?B?bEJYcURrM050ZjlTYW5IWTBkYVVCY3NBN2MySkZHeDFYSXQrZ1hjN05vUTVx?=
 =?utf-8?B?cEF3V013SUFtYlZiRVo2d0FQa1JGSXV0c3B6OGc4eklTanRsSXVIVllReUJR?=
 =?utf-8?B?ek50czRIVWJ1aGliTFhlNjNDK05zdTZHbjF1akhKNlQraERoVUN1bWJIVEdI?=
 =?utf-8?B?b2s1WTNkRVl6NFp2Z0kySFVEZmFnZXBQK05PT1NBM3lOeE83ZHZSdStGUk9Q?=
 =?utf-8?B?dFcza1dNdmFWVmVJcW1oMVQ0RnVMZ1l6UVZraVpDV3VHcWNJdkNLdnpRL0kw?=
 =?utf-8?B?eTVGS1UzTkFubXd6UlVxRDdjUEpmbTRnMU0vNy9xVmJZMWJsS21LQ0JWd3ZD?=
 =?utf-8?B?QWZROTkwM0cvRXovd1E2enBZR3ZmMUx2cDBrenNjTERiRFBpQVQwQ2NKRExE?=
 =?utf-8?B?blB4SXBQNktuU2xjUU5CWGVneUcyVWN5SUhwOHV1bjNEcnA2bG4zRlZxRys0?=
 =?utf-8?B?cEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c90435be-755a-46eb-3eaa-08db14bfef3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 10:31:18.8043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gl+OsZLQSt40syk1Y9+tVwWTvwnq+OZSR2nWdSGFJvS+rcfwYOsNOPlaAujC2NDn20E0sixUJruTe3Loc5k/YfjfvZW/tmP2/JK25QGtTRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5864
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
U2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAyMiwgMjAyMyA0OjI2IFBNDQo+IFRvOiBSeWFuIENo
ZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IFJvYiBIZXJyaW5nDQo+IDxyb2JoK2R0QGtl
cm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnp5c3p0b2Yua296bG93c2tpK2R0
QGxpbmFyby5vcmc+OyBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PjsgQW5kcmV3DQo+IEpl
ZmZlcnkgPGFuZHJld0Bhai5pZC5hdT47IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9u
aXguZGU+Ow0KPiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAxLzJdIGR0
LWJpbmRpbmdzOiBpMmM6IEFkZCBzdXBwb3J0IGZvciBBU1BFRUQgaTJDdjINCj4gDQo+IE9uIDIy
LzAyLzIwMjMgMDM6NTksIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPiBIZWxsbyBLcnp5c3p0b2YsDQo+
ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiA+PiBTZW50OiBU
dWVzZGF5LCBGZWJydWFyeSAyMSwgMjAyMyA3OjA1IFBNDQo+ID4+IFRvOiBSeWFuIENoZW4gPHJ5
YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IFJvYiBIZXJyaW5nDQo+ID4+IDxyb2JoK2R0QGtlcm5l
bC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+ID4+IDxrcnp5c3p0b2Yua296bG93c2tpK2R0
QGxpbmFyby5vcmc+OyBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PjsNCj4gPj4gQW5kcmV3
IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT47IFBoaWxpcHAgWmFiZWwNCj4gPj4gPHAuemFiZWxA
cGVuZ3V0cm9uaXguZGU+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7DQo+ID4+IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gPj4gbGludXgtYXNwZWVkQGxpc3RzLm96
bGFicy5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gPj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2NSAxLzJdIGR0LWJpbmRpbmdzOiBpMmM6IEFkZCBzdXBwb3J0IGZvciBBU1BFRUQN
Cj4gPj4gaTJDdjINCj4gPj4NCj4gPj4gT24gMjEvMDIvMjAyMyAxMTo0MiwgUnlhbiBDaGVuIHdy
b3RlOg0KPiA+Pj4+Pj4+ICsgICAgdHlwZTogYm9vbGVhbg0KPiA+Pj4+Pj4+ICsgICAgZGVzY3Jp
cHRpb246IEVuYWJsZSBpMmMgYnVzIHRpbWVvdXQgZm9yIG1hc3Rlci9zbGF2ZSAoMzVtcykNCj4g
Pj4+Pj4+DQo+ID4+Pj4+PiBXaHkgdGhpcyBpcyBwcm9wZXJ0eSBmb3IgRFQ/IEl0J3MgZm9yIHN1
cmUgbm90IGJvb2wsIGJ1dCBwcm9wZXINCj4gPj4+Pj4+IHR5cGUgY29taW5nIGZyb20gdW5pdHMu
DQo+ID4+Pj4+IFRoaXMgaXMgaTJjIGNvbnRyb2xsZXIgZmVhdHVyZSBmb3IgZW5hYmxlIHNsYXZl
IG1vZGUgaW5hY3RpdmUNCj4gPj4+Pj4gdGltZW91dCBhbmQgYWxzbyBtYXN0ZXIgbW9kZSBzZGEv
c2NsIGF1dG8gcmVsZWFzZSB0aW1lb3V0Lg0KPiA+Pj4+PiBTbyBJIHdpbGwgbW9kaWZ5IHRvDQo+
ID4+Pj4+ICAgYXNwZWVkLHRpbWVvdXQ6DQo+ID4+Pj4+IAl0eXBlOiBib29sZWFuDQo+ID4+Pj4+
ICAgICBkZXNjcmlwdGlvbjogSTJDIGJ1cyB0aW1lb3V0IGVuYWJsZSBmb3IgbWFzdGVyL3NsYXZl
IG1vZGUNCj4gPj4+Pg0KPiA+Pj4+IFRoaXMgZG9lcyBub3QgYW5zd2VyIG15IGNvbmNlcm5zLiBX
aHkgdGhpcyBpcyBib2FyZCBzcGVjaWZpYz8NCj4gPj4+IFNvcnJ5LCBjYW7igJl0IGNhdGNoIHlv
dXIgcG9pbnQuDQo+ID4+PiBJdCBpcyBub3QgYm9hcmQgc3BlY2lmaWMuIEl0IGlzIGNvbnRyb2xs
ZXIgZmVhdHVyZS4NCj4gPj4+IEFTUEVFRCBTT0MgY2hpcCBpcyBzZXJ2ZXIgcHJvZHVjdCwgbWFz
dGVyIGNvbm5lY3QgbWF5IGhhdmUNCj4gPj4+IGZpbmdlcnByaW50IGNvbm5lY3QgdG8gYW5vdGhl
ciBib2FyZC4gQW5kIGFsc28gc3VwcG9ydCBob3RwbHVnLg0KPiA+Pj4gRm9yIGV4YW1wbGUgSTJD
IGNvbnRyb2xsZXIgYXMgc2xhdmUgbW9kZSwgYW5kIHN1ZGRlbmx5IGRpc2Nvbm5lY3RlZC4NCj4g
Pj4+IFNsYXZlIHN0YXRlIG1hY2hpbmUgd2lsbCBrZWVwIHdhaXRpbmcgZm9yIG1hc3RlciBjbG9j
ayBpbiBmb3IgcngvdHggdHJhbnNmZXIuDQo+ID4+PiBTbyBpdCBuZWVkIHRpbWVvdXQgc2V0dGlu
ZyB0byBlbmFibGUgdGltZW91dCB1bmxvY2sgY29udHJvbGxlciBzdGF0ZS4NCj4gPj4+IEFuZCBp
biBhbm90aGVyIHNpZGUuIEFzIG1hc3RlciBtb2RlLCBzbGF2ZSBpcyBjbG9jayBzdHJldGNoaW5n
Lg0KPiA+Pj4gVGhlIG1hc3RlciB3aWxsIGJlIGtlZXAgd2FpdGluZywgdW50aWwgc2xhdmUgcmVs
ZWFzZSBjbGwgc3RyZXRjaGluZy4NCj4gPj4NCj4gPj4gT0ssIHRoYW5rcyBmb3IgZGVzY3JpYmlu
ZyB0aGUgZmVhdHVyZS4gSSBzdGlsbCBkbyBub3Qgc2VlIGhvdyB0aGlzIGlzIERUDQo+IHJlbGF0
ZWQuDQo+ID4NCj4gPiBMZXQgbWUgZHJhdyBtb3JlIGFib3V0IHRoZSBib2FyZC1zcGVjaWZpYy4N
Cj4gPiBUaGUgZm9sbG93aW5nIGlzIGFuIGV4YW1wbGUgYWJvdXQgaTJjIGxheW91dCBpbiBib2Fy
ZC4NCj4gPiBCb2FyZCBBDQo+IAlCb2FyZCBCDQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gCS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gfCAgICBpMmMgYnVzIzEo
bWFzdGVyL3NsYXZlKSAgPC0tLS0tLS0tLS0tLS0tLS0tLS0tPiBmaW5nZXJwcmludC4oY2FuIGJl
IHVucGx1ZykNCj4gPC0tLS0tLS0tLS0tLS0tLS0tLS0tPiBpMmMgYnVzI3ggKG1hc3Rlci9zbGF2
ZSkgfA0KPiA+IHwgICAgaTJjIGJ1cyMyKG1hc3RlcikgLT4gdG1wIGkyYyBkZXZpY2UgICAgIHwN
Cj4gCXwJCQkJCQkJCQl8DQo+ID4gfCAgICBpMmMgYnVzIzMobWFzdGVyKSAtPiBhZGMgaTJjIGRl
dmljZSAgICAgIHwJCQkJCXwNCj4gCQkJCQkJCQl8DQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gCS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gSW4gdGhpcyBjYXNl
IGkyYyBidXMjMSBuZWVkIGVuYWJsZSB0aW1lb3V0LCBhdm9pZCBzdWRkZW5seSB1bnBsdWcgdGhl
DQo+IGNvbm5lY3Rvci4gVGhhdCBzbGF2ZSB3aWxsIGtlZXAgc3RhdGUgdG8gZHJpdmUgY2xvY2sg
c3RyZXRjaGluZy4NCj4gPiBTbyBpdCBpcyBzcGVjaWZpYyBlbmFibGUgaW4gaTJjIGJ1cyMxLiBP
dGhlcnMgaXMgbm90IG5lZWRlZCBlbmFibGUgdGltZW91dC4NCj4gPiBEb2VzIHRoaXMgZHJhdyBp
cyBtb3JlIGNsZWFyIGluIHNjZW5hcmlvPw0KPiANCj4gSTJDIGJ1cyAjMSB3b3JrcyBpbiBzbGF2
ZSBtb2RlPyBTbyB5b3UgYWx3YXlzIG5lZWQgaXQgZm9yIHNsYXZlIHdvcms/DQoNClllcywgaXQg
aXMgYm90aCBzbGF2ZS9tYXN0ZXIgbW9kZS4gSXQgaXMgYWx3YXlzIGR1YWwgcm9sZS4gU2xhdmUg
bXVzdCBhbHdheXMgd29yay4gDQpEdWUgdG8gYW5vdGhlciBib2FyZCBtYXN0ZXIgd2lsbCBzZW5k
Lg0KDQo+ID4NCj4gPj4+DQo+ID4+PiBTbyBpbiB0aG9zZSByZWFzb24gYWRkIHRoaXMgdGltZW91
dCBkZXNpZ24gaW4gY29udHJvbGxlci4NCj4gPj4NCj4gPj4gWW91IG5lZWQgdG8ganVzdGlmeSB3
aHkgRFQgaXMgY29ycmVjdCBwbGFjZSBmb3IgdGhpcyBwcm9wZXJ0eS4gRFQgaXMNCj4gPj4gbm90
IGZvciBjb25maWd1cmluZyBPUywgYnV0IHRvIGRlc2NyaWJlIGhhcmR3YXJlLiBJIGdhdmUgeW91
IG9uZQ0KPiA+PiBwb3NzaWJpbGl0eQ0KPiA+PiAtIHdoeSBkaWZmZXJlbnQgYm9hcmRzIHdvdWxk
IGxpa2UgdG8gc2V0IHRoaXMgcHJvcGVydHkuIFlvdSBzYWlkIGl0DQo+ID4+IGlzIG5vdCBib2Fy
ZCBzcGVjaWZpYywgdGh1cyBhbGwgYm9hcmRzIHdpbGwgaGF2ZSBpdCAob3Igbm9uZSBvZiB0aGVt
KS4NCj4gPj4gV2l0aG91dCBhbnkgb3RoZXIgcmVhc29uLCB0aGlzIGlzIG5vdCBhIERUIHByb3Bl
cnR5LiBEcm9wLg0KPiA+Pg0KPiA+Pj4+DQo+ID4+Pj4+DQo+ID4+Pj4+Pj4gKw0KPiA+Pj4+Pj4+
ICsgIGJ5dGUtbW9kZToNCj4gPj4+Pj4+PiArICAgIHR5cGU6IGJvb2xlYW4NCj4gPj4+Pj4+PiAr
ICAgIGRlc2NyaXB0aW9uOiBGb3JjZSBpMmMgZHJpdmVyIHVzZSBieXRlIG1vZGUgdHJhbnNtaXQN
Cj4gPj4+Pj4+DQo+ID4+Pj4+PiBEcm9wLCBub3QgYSBEVCBwcm9wZXJ0eS4NCj4gPj4+Pj4+DQo+
ID4+Pj4+Pj4gKw0KPiA+Pj4+Pj4+ICsgIGJ1ZmYtbW9kZToNCj4gPj4+Pj4+PiArICAgIHR5cGU6
IGJvb2xlYW4NCj4gPj4+Pj4+PiArICAgIGRlc2NyaXB0aW9uOiBGb3JjZSBpMmMgZHJpdmVyIHVz
ZSBidWZmZXIgbW9kZSB0cmFuc21pdA0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IERyb3AsIG5vdCBhIERU
IHByb3BlcnR5Lg0KPiA+Pj4+Pj4NCj4gPj4+Pj4gVGhlIGNvbnRyb2xsZXIgc3VwcG9ydCAzIGRp
ZmZlcmVudCBmb3IgdHJhbnNmZXIuDQo+ID4+Pj4+IEJ5dGUgbW9kZTogaXQgbWVhbnMgc3RlcCBi
eSBzdGVwIHRvIGlzc3VlIHRyYW5zZmVyLg0KPiA+Pj4+PiBFeGFtcGxlIGkyYyByZWFkLCBlYWNo
IHN0ZXAgd2lsbCBpc3N1ZSBpbnRlcnJ1cHQgdGhlbiBlbmFibGUgbmV4dCBzdGVwLg0KPiA+Pj4+
PiBTciAoc3RhcnQgcmVhZCkgfCBEIHwgRCB8IEQgfCBQDQo+ID4+Pj4+IEJ1ZmZlciBtb2RlOiBp
dCBtZWFucywgdGhlIGRhdGEgY2FuIHByZXBhcmUgaW50byBidWZmZXIgcmVnaXN0ZXIsDQo+ID4+
Pj4+IHRoZW4gVHJpZ2dlciB0cmFuc2Zlci4gU28gU3IgRCBEIEQgUCwgb25seSBoYXZlIG9ubHkg
MSBpbnRlcnJ1cHQgaGFuZGxpbmcuDQo+ID4+Pj4+IFRoZSBETUEgbW9kZSBtb3N0IGxpa2Ugd2l0
aCBidWZmZXIgbW9kZSwgVGhlIGRpZmZlciBpcyBkYXRhDQo+ID4+Pj4+IHByZXBhcmUgaW4gRFJB
TSwgdGhhbiB0cmlnZ2VyIHRyYW5zZmVyLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBTbywgc2hvdWxkIEkg
bW9kaWZ5IHRvDQo+ID4+Pj4+ICAgYXNwZWVkLGJ5dGU6DQo+ID4+Pj4+IAl0eXBlOiBib29sZWFu
DQo+ID4+Pj4+ICAgICBkZXNjcmlwdGlvbjogRW5hYmxlIGkyYyBjb250cm9sbGVyIHRyYW5zZmVy
IHdpdGggYnl0ZSBtb2RlDQo+ID4+Pj4+DQo+ID4+Pj4+ICAgYXNwZWVkLGJ1ZmY6DQo+ID4+Pj4+
IAl0eXBlOiBib29sZWFuDQo+ID4+Pj4+ICAgICBkZXNjcmlwdGlvbjogRW5hYmxlIGkyYyBjb250
cm9sbGVyIHRyYW5zZmVyIHdpdGggYnVmZiBtb2RlDQo+ID4+Pj4NCj4gPj4+PiAxLiBObywgdGhl
c2UgYXJlIG5vdCBib29scyBidXQgZW51bSBpbiBzdWNoIGNhc2UuDQo+ID4+Pg0KPiA+Pj4gVGhh
bmtzLCB3aWxsIG1vZGlmeSBmb2xsb3dpbmcuDQo+ID4+PiBhc3BlZWQseGZlcl9tb2RlOg0KPiA+
Pj4gICAgIGVudW06IFswLCAxLCAyXQ0KPiA+Pj4gICAgIGRlc2NyaXB0aW9uOg0KPiA+Pj4gICAg
ICAgMDogYnl0ZSBtb2RlLCAxOiBidWZmX21vZGUsIDI6IGRtYV9tb2RlDQo+ID4+DQo+ID4+IEp1
c3Qga2VlcCBpdCB0ZXh0IC0gYnl0ZSwgYnVmZmVyZWQsIGRtYQ0KPiA+Pg0KPiA+Pj4NCj4gPj4+
PiAyLiBBbmQgd2h5IGV4YWN0bHkgdGhpcyBpcyBib2FyZC1zcGVjaWZpYz8NCj4gPj4+DQo+ID4+
PiBObywgaXQgbm90IGRlcGVuZHMgb24gYm9hcmQgZGVzaWduLiBJdCBpcyBvbmx5IGZvciByZWdp
c3RlciBjb250cm9sDQo+ID4+PiBmb3INCj4gPj4gY29udHJvbGxlciB0cmFuc2ZlciBiZWhhdmUu
DQo+ID4+PiBUaGUgY29udHJvbGxlciBzdXBwb3J0IDMgZGlmZmVyZW50IHRyaWdnZXIgbW9kZSBm
b3IgdHJhbnNmZXIuDQo+ID4+PiBBc3NpZ24gYnVzIzEgfiAzIDogZG1hIHRyYW5mZXIgYW5kIGFz
c2lnbiBidXMjNCB+IDYgOiBidWZmZXIgbW9kZQ0KPiA+Pj4gdHJhbnNmZXIsIFRoYXQgY2FuIHJl
ZHVjZSB0aGUgZHJhbSB1c2FnZS4NCj4gPj4NCj4gPj4gVGhlbiBhbnl3YXkgaXQgZG9lcyBub3Qg
bG9vayBsaWtlIHByb3BlcnR5IGZvciBEZXZpY2V0cmVlLiBEVA0KPiA+PiBkZXNjcmliZXMgaGFy
ZHdhcmUsIG5vdCBPUyBiZWhhdmlvci4NCj4gPg0KPiA+IFRoZSBzYW1lIGRyYXcsIGluIHRoaXMg
Y2FzZSwgaTJjIGJ1cyMxIHRoYXQgaXMgbXVsdGktbWFzdGVyIHRyYW5zZmVyDQo+IGFyY2hpdGVj
dHVyZS4NCj4gPiBCb3RoIHdpbGwgaW5hY3RpdmUgd2l0aCB0cnVuayBkYXRhLiBUaGF0IGNhbmUg
ZW5hYmxlIGkyYyMxIHVzZSBETUEgdHJhbnNmZXINCj4gdG8gcmVkdWNlIENQVSB1dGlsaXplZC4N
Cj4gPiBPdGhlcnMgKGJ1cyMyLzMpIGNhbiBrZWVwIGJ5dGUvYnVmZiBtb2RlLg0KPiANCj4gSXNu
J3QgdGhlbiBjdXJyZW50IGJ1cyBjb25maWd1cmF0aW9uIGZvciBJMkMjMSBrbm93biB0byB0aGUg
ZHJpdmVyPw0KPiBKZXJlbXkgYXNrZWQgZmV3IG90aGVyIHF1ZXN0aW9ucyBhcm91bmQgaGVyZS4u
Lg0KDQpObywgVGhlIGRyaXZlciBkb24ndCBrbm93IGN1cnJlbnRseSBib2FyZCBjb25maWd1cmF0
aW9uLg0KDQoNCkJlc3QgcmVnYXJkcywNClJ5YW4NCg==
