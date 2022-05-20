Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1686B52E2A2
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 04:47:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4B3J6Fkkz309j
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 12:47:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=C04dZ7hU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::706;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=C04dZ7hU; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::706])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4B2n1Cwjz2yxT;
 Fri, 20 May 2022 12:47:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F37BhgUEUpX2+wim+f/cEYdDvIoKxGKh9Nal+lwXgEsEAwvnyHJGufNSnSKv83bXD60+ud1R943xy5rjdM4GPZKfLXDUwQYe6BgFFyzAEhjpvmArtfEG8a+b14jsgorFCrg+xJX7rJZdlAI14aPl03GMplDjLYdng9GDFeyvM8xfizOGowh0IQ85oMJR2Gp+b5B9VFXTLc37EbDmz1fcEYror+AsYI6vbhSUWY0Ycvv5+9poKkEZy2wj5tK1jhByJzP3WXwVo3LVNxK6rk7zLWpz42786BjE8kizTEs2e339eeiblB1XBYGS05II25OVxxg8id1N5lVnbXy/RKax+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jQONYIxOXlP2D8a1GcUxfsTH4MrdBlQi17CxePZV3k=;
 b=foimB0sUNGra9dTKlCv1AfEdwCm5fyEzZi5aJAHzpLvO851q4syGuDvSZZSgnASYxZm3Myau5CPU4FJ0/6ZpfdT7Ig389TejCSRURzs6DkqO96n3tpoz8ZfPyu5Iwi2j08XJF9EaFEoH9rSw9Kwea651BMkJ5gzeqdVEX7VuwI1ZegzMnzVzEZPfKnaIgncfdcsvO3phovPkWNJzXgGHpWDLclF1Axv8PAV8O0pxPOkGgTGaliwm1o17qE3EZdveC+8NL9OBNZJdWW09PrXSaASjJWiNaKFOlte79A6uA8FGXA9fk/xdHjsbv1/ci/+OXT5bFybMfALG9tM8L/dbGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jQONYIxOXlP2D8a1GcUxfsTH4MrdBlQi17CxePZV3k=;
 b=C04dZ7hU6MSVmBwqMeD3vIJho4J9Uvb2XUAJs6KvNo51woWIDpzewWlRMK98fcwSdClMGTKT8IhlouTp3/rMzzliSrIaLbYYmogKIdBcTz4OJS/qIEtNtdLCq6C9C51xbT7RUtxzq/ZSiDqtrD6TRlbJNsbv40pVrY0PqgSPHLP4gIs8sKdcJM/dCMuEHquFplm/jJWyVm/WJqpLOPOvaGL8JsX4mw5FVkjgvIzqlRKlUzUFTYkXIqjoL9qUtrh19BsV3DfRcX0nC0BFxxiDEo9RdelfvqSbAmH/MfFrQup8R9yZULsdYYoTddeixzTZI1yNitKLg8oWrHlaDsOW5w==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4164.apcprd06.prod.outlook.com (2603:1096:820:30::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 02:46:49 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8588:9527:6e72:69c2]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8588:9527:6e72:69c2%6]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 02:46:49 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Peter Delevoryas <pdel@fb.com>
Subject: RE: [PATCH v3 0/3] Add ASPEED AST2600 I2C new controller driver
Thread-Topic: [PATCH v3 0/3] Add ASPEED AST2600 I2C new controller driver
Thread-Index: AQHYaPELfXUHpGiIjU+wemSHG6ilNa0moycAgABySEA=
Date: Fri, 20 May 2022 02:46:49 +0000
Message-ID: <SEZPR06MB52697491CF6D06ECB85F0FB7F2D39@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20220516064900.30517-1-ryan_chen@aspeedtech.com>
 <DDAAA045-3BDE-4712-A6CC-B1A52713634A@fb.com>
In-Reply-To: <DDAAA045-3BDE-4712-A6CC-B1A52713634A@fb.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cb949d2-7205-4a3d-1d73-08da3a0afcec
x-ms-traffictypediagnostic: KL1PR0601MB4164:EE_
x-microsoft-antispam-prvs: <KL1PR0601MB416412A38BBCB6040B433E20F2D39@KL1PR0601MB4164.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aJDKmlHivUgiT3H3ZO3v7BaMR7llMhCwzRB643uVubSnQaW5yTUOSVh20gdsj/B+yNoyfcMzivckbsibeHljhHdCnE+8LXhrxGsE0p8LIWgXWVMCSQA/i8d6tybpJmDgoyBPZRa6+iZj4jeOyGu+waMapzEF0jO748UT5c6J03BJUDFhRE+snLferIo6MIV6EvjWa7rMQVIF8X2a2nFYIvszFMDrIKGL2wweht4XPp/+35mjpgP29KTIx0S/TmQMMwWdWR6RKC3qWwb+SPflxX2l/hWJL59bJE33XkeAS7cSd4rbfKoM1JK2nAdI77chrBEQx2zcqL2yo7TWoMEhfQ2NJNGbMbg4Fh7uVr7jW3x02oMUfdQ+aXFYBtiI5GkwMu39k72dhH87Q1xKx657azn0egaoHjHlFed4FEQ0cQs6ZJmpVFXQDCKSAwzGa/ipmfcP9F0ad4i1jjvnqxyNV5ZCvfZrm8hJrdq/hwP5IXm/ZgD8TCyQDa4Q/mfvAPxiriEu1C1lVGlk0tcmAWwo3ofCUEy+3epzdAwtgZYwI4o7gBuyM57qBMF6iiSnCeMkcBXUf3B77/MIRijBuVGGXsNhYXRCBEMegPhhV4GY8Z+vIfkOV7LNmPcpzZxgtNdj2dIkQM3J1tiwtLEsN/T8xXteNXsVRyQaNha+eK54YVrUavaI3aXNgUZGikOrv7Uncr0m55Nttf/wODU4pAnrJVyfoakT9OJI6EfqJQN0KKJVSO9Ley4cxBsvcs8JTGTPFqXrU0lwSWuKrZb0GTFCy78wFNMyu6T/aNSQDhH+B87Z6fm3XafO9rj1K7xhVDF6Iu3EzHN+hxlHV6izo5Cudw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(376002)(346002)(366004)(396003)(39850400004)(136003)(55016003)(6506007)(26005)(9686003)(53546011)(966005)(71200400001)(33656002)(7696005)(508600001)(38100700002)(38070700005)(122000001)(76116006)(186003)(83380400001)(107886003)(86362001)(66946007)(2906002)(52536014)(8676002)(4326008)(66556008)(64756008)(66446008)(66476007)(316002)(54906003)(6916009)(8936002)(5660300002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3hQcFk4cFYwVU55aFgveTBuejNzallyTUswVUZzV3lxY2VLYlRjajByM1pU?=
 =?utf-8?B?NHBkV3RzaEswdDBQZDJTenUydXVFVHB6N2dXSnFuUmk1dW9rb2U2WXcyVHI5?=
 =?utf-8?B?enJaK3FTd3dMcGw3R2lyNUlDbk92eWVRcmtEUmFZWlFEeTRubnlGMFBhRFJi?=
 =?utf-8?B?RGh3b0k1NGVMdjJPWkp4b3ZnSGw3aXo2T0pTYmdpYUl5ZEs2NTcvcDFpSEZJ?=
 =?utf-8?B?WVJzVlNycnJEV0ZCb1hUZUROMk51Q2EvdWVyVkZoSGFrUUwyTE1pYlcxVU9v?=
 =?utf-8?B?ejJRVHU2Q2wvK2JVMzBKK3lxSnBPNWQ3M1drT3NIMFNPeXE0SUxaVmNpclJJ?=
 =?utf-8?B?alM1TGh1bXNNY1IzdVdmRFNFVGg1QVN3WWNaakZ3UXpmNGJoVWF6Nk95dUEy?=
 =?utf-8?B?S2t0NE1kSnpMd2dVZ1Q4K1h1MURqMW0rVzdNUHRlcXZjSThEOEhVZGVPZmY1?=
 =?utf-8?B?NU9yUFFjajZXajJmeXc1cUF6Ui90WDZUOGJmRXI3aXl6L0pXdHZDTFdYaDRW?=
 =?utf-8?B?VS90RjV3bVcyOHBPRk9TR2dabWppcXdOcVRhK1Q3c3dteS9TcXpDbm9qaTBF?=
 =?utf-8?B?V0MrYThHR2JqbHJVR1NyWUR2L0ErS2VyeUh0U1JrRjYxNldDVlVvL1M2MUNO?=
 =?utf-8?B?RVBoQTZmdGlMVHdkK0YwMVNUaFJzaU85QjBvcXU3bmh6YWdvWUxXTFovVGpL?=
 =?utf-8?B?ZmVrTUlkeUEwVWN0MjlzcXNaRzcyOXhydXBwN3ppQWtoQWlVczh5Vk8ycEtH?=
 =?utf-8?B?MnAxaXNIV3dLalNvZ25FM05vM3RBSU9YMjIxVk4xSHdwb0pPZUNvM0k4NnFC?=
 =?utf-8?B?WVkyMENYK05rZ1Erb0ZVZk1mSjF3MWpkem1zNEdpemZTYVVqYkhocEoweEE4?=
 =?utf-8?B?amcxNHVLU2JNdFN0N0xjRzhWdnhLdTBJVE45NDdJbFN3RU83Qm1BU1JLRkdQ?=
 =?utf-8?B?OFJGOFdTeWpncW5iSnhrbXJRNkRZT2lzaUZFVC81bmtiRWVaeEw5Uk5ETGlQ?=
 =?utf-8?B?SFJUYXdBQ3AxTTM1cDY5MTQzQVRNclVMMlp5MnNpcDE2cFI5MGY5Q2pJRkZW?=
 =?utf-8?B?dHdJVU1rVXZKNHhLR2hkOTI5TXlEcmRUM3g2Qis5WThWQnZkQ05MTUlWSlBH?=
 =?utf-8?B?RS9WOHBxYW5TWDU4amNDVHZTKzJLWldUS1F0YU45OUpVd2hzYjFTb3VxajRm?=
 =?utf-8?B?NVN0S29xNE16cVVkcTAwRGdkL2FUVGxCZDQ3dXEwNUQzU2xSVnBscmxOamZ3?=
 =?utf-8?B?NXV2T3pvcUlZeUlNYllMQjdEQVJVNWxwVjF1K2dEbXFWY3VubWxrWkRzNkRQ?=
 =?utf-8?B?SmNBU1B0MEc5OWpEQTBHNUdoSmVEVGt4eWNLKzc3SDU4M2RkeXV4bDEvN3FX?=
 =?utf-8?B?Z2NyakE1bm96NDhhVHU3RmhUU2NNR21VK0YrV1Myck54MUg1UkpoUWlMQUZq?=
 =?utf-8?B?NEt6ekVOYWdsNndmUTFhR1JXSVpvRlR0QlgvN2U1bVpXWmdab2dyMFpsTGFJ?=
 =?utf-8?B?ckUvcXVkMzlOcm16aGxleWN0V0dmbFFNNUNneVFvQzQyTEUyRGduU3JiM3pI?=
 =?utf-8?B?WHIrcFZJem1OZUVxWlY5Q2xnL0pyMHo0OG5aZUIvdnd3dHQwRU9wV2ZEbGZa?=
 =?utf-8?B?YlA4YnV0Vi9XUVBickRmZkFBNHN2Z21wZ2llNTVFdmREVG0wTXE4QkpaNFBY?=
 =?utf-8?B?T1Z2YWhwaG1EejZUNmk0cU42K2Zsc29PZkc1eHRacWFSdHlVTFJaYjAvVmUr?=
 =?utf-8?B?THFiLytJREFUbU9EZjBIMzdpTFRybUZVSXFuMzNrN0lRb2N6YnlUY015NTYw?=
 =?utf-8?B?UU82RUpaMHA0djBZaE5ESm84S2RzOW1kd3RXM1FQeGc4c1FQWmIwR0ZQZGEw?=
 =?utf-8?B?SlhWU1hzbXlvYzJFVmFtQzA3cDVSUjFvVW04VjZMMDFJdTdrbXhyYnlRODVm?=
 =?utf-8?B?eGdQUTMrbWEyOEltdWdodU5LNmduRU9RMlBoQ21FKytSeW8zSXVJVXNVRXBF?=
 =?utf-8?B?NmllMkxMVE5PZ3hpdWZhNFNSZ3luK3pRM1orY1l3UFFNQzkxd3o2ZUh3d0pz?=
 =?utf-8?B?SDdrK0NhNGpjcG92NktXbzhFVmZra2hLQkpIRDQ1VFNpY2lFenlHVzN4SGFL?=
 =?utf-8?B?WHIxY0cyZWt3cWVnT3ZGZGdoVHJxM0NVRjNKNFdaKzhCWkdRTHpCNDFSaDRJ?=
 =?utf-8?B?MW5yUUYwL01NL3d2QXYwM09jN3d6QnkvdjhHeENEVGdJa3lqM1RlZlUwMTBJ?=
 =?utf-8?B?RlJDN2xDY1A2OERoY3RpVkpDczAycnJEZTlHOHpEbE9WMUxEa2dHWTNnWUhD?=
 =?utf-8?B?bWR6bGhtVmlickdxejgzOWN2SVp0cm0zWmNLSGdVaWdBNHVaYmVIOWx0RXRE?=
 =?utf-8?Q?CDFaIS6Go/sf9Sug=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb949d2-7205-4a3d-1d73-08da3a0afcec
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 02:46:49.3138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lO873qlXBGK+vkPoQPUTqhRp099r5ufqoZfn0WjOmN4uEYjXooBJaypPiO7XhniVlqZumWtY1SjXCt+MXLfUlkFlXZa+Hi5Xfw16jgB3d2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4164
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC List <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Joel Stanley <joel@jms.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGVsbG8sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgRGVs
ZXZvcnlhcyA8cGRlbEBmYi5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTWF5IDIwLCAyMDIyIDM6NTYg
QU0NCj4gQ2M6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+OyBBbmRyZXcgSmVmZmVyeSA8
YW5kcmV3QGFqLmlkLmF1PjsgUGhpbGlwcA0KPiBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5k
ZT47IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgtYXNwZWVk
QGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IE9wZW5CTUMg
TGlzdA0KPiA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPjsgQk1DLVNXIDxCTUMtU1dAYXNwZWVk
dGVjaC5jb20+OyBQZXRlcg0KPiBEZWxldm9yeWFzIDxwZGVsQGZiLmNvbT47IFJ5YW4gQ2hlbiA8
cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDAvM10g
QWRkIEFTUEVFRCBBU1QyNjAwIEkyQyBuZXcgY29udHJvbGxlciBkcml2ZXINCj4gDQo+IA0KPiAN
Cj4gPiBPbiBNYXkgMTUsIDIwMjIsIGF0IDExOjQ4IFBNLCByeWFuX2NoZW4gPHJ5YW5fY2hlbkBh
c3BlZWR0ZWNoLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBUaGlzIHNlcmllcyBhZGQgQVNUMjYw
MCBpMmMgbmV3IHJlZ2lzdGVyIHNldCBkcml2ZXIuIFRoZSBpMmMgbmV3DQo+ID4gcmVnaXN0ZXIg
c2V0IGhhdmUgbmV3IGNsb2NrIGRpdmlkZXIgb3B0aW9uIGZvciBtb3JlIGZsZXhpYWJsZSBnZW5l
cmF0aW9uLg0KPiA+IEFuZCBhbHNvIGhhdmUgc2VwYXJhdGUgaTJjIG1hc3RlciBhbmQgc2xhdmUg
cmVnaXN0ZXIgc2V0IGZvciBjb250cm9sLg0KPiANCj4gSGV5IFJ5YW4sIHRoYW5rcyBmb3IgdGhp
cyB3b3JrISBUaGlzIGlzIGEgbGl0dGxlIGJpdCBvZmYtdG9waWMsIGJ1dCBhcmUgeW91IG9yDQo+
IGFueW9uZSBlbHNlIGF0IEFzcGVlZCB3b3JraW5nIG9uIGFuIGVxdWl2YWxlbnQgUUVNVSBwYXRj
aCBzZXJpZXM/IFdpdGhvdXQNCj4gaXQsIEkgZG9u4oCZdCB0aGluayBRRU1VIHdpbGwgd29yayB3
aXRoIHRoaXMgc2VyaWVzIHJpZ2h0PyBJIHRoaW5rIFFFTVUgb25seQ0KPiBzdXBwb3J0cyB0aGUg
b2xkIHJlZ2lzdGVyIHNldCByaWdodCBub3cuDQo+IA0KTm8sIHRoZXJlIGFyZSB0d28gc3VibWl0
IGluIFFFTVUgYWJvdXQgaTJjIG5ldyByZWdpc3RlciBtb2RlLg0KT25lIGlzIEFTUEVFRCBzdWJt
aXQgOiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvcWVtdS1kZXZlbC9saXN0
Lz9zZXJpZXM9NjI2MDI4JmFyY2hpdmU9Ym90aA0KQW5vdGhlciBpcyBHT09HTEUgOiBodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvcWVtdS1kZXZlbC9saXN0Lz9zZXJpZXM9NjI3
NzA2JmFyY2hpdmU9Ym90aA0KDQo+IA0KPiA+DQo+ID4gdjM6DQo+ID4gLWZpeCBpMmMgZ2xvYmFs
IGNsb2NrIGRpdmlkZSBkZWZhdWx0IHZhbHVlIC1yZW1vdmUgaTJjIHNsYXZlIG5vIHVzZWQNCj4g
PiBkZXZfZGJnIGluZm8uDQo+ID4NCj4gPiB2MjoNCj4gPiAtYWRkIGkyYyBnbG9iYWwgeW1hbCBm
aWxlIGNvbW1pdA0KPiA+IC1yZW5hbWUgZmlsZSBuYW1lIGZyb20gbmV3IHRvIGFzdDI2MDAuDQo+
ID4gYXNwZWVkLWkyYy1uZXctZ2xvYmFsLmMgLT4gaTJjLWFzdDI2MDAtZ2xvYmFsLmMNCj4gPiBh
c3BlZWQtaTJjLW5ldy1nbG9iYWwuaCAtPiBpMmMtYXN0MjYwMC1nbG9iYWwuaCBpMmMtbmV3LWFz
cGVlZC5jIC0+DQo+ID4gaTJjLWFzdDI2MDAuYyAtcmVuYW1lIGFsbCBkcml2ZXIgZnVuY3Rpb24g
bmFtZSB0byBhc3QyNjAwDQo+ID4NCj4gPiByeWFuX2NoZW4gKDMpOg0KPiA+ICBkdC1iaW5kaW5n
czogaTJjLWFzdDI2MDA6IEFkZCBiaW5kaW5ncyBmb3IgQVNUMjYwMCBpMkMgZ2xvYmFsIHJlZ2lz
dGVyDQo+ID4gICAgY29udHJvbGxlcg0KPiA+ICBkdC1iaW5kaW5nczogaTJjLWFzdDI2MDA6IEFk
ZCBiaW5kaW5ncyBmb3IgQVNUMjYwMCBpMkMgZHJpdmVyDQo+ID4gaTJjOmFzcGVlZDpzdXBwb3J0
IGFzdDI2MDAgaTJjIG5ldyByZWdpc3RlciBtb2RlIGRyaXZlcg0KPiA+DQo+ID4gLi4uL2kyYy9h
c3BlZWQsaTJjLWFzdDI2MDAtZ2xvYmFsLnltYWwgICAgICAgIHwgICA0NCArDQo+ID4gLi4uL2Jp
bmRpbmdzL2kyYy9hc3BlZWQsaTJjLWFzdDI2MDAueW1hbCAgICAgIHwgICA3OCArDQo+ID4gZHJp
dmVycy9pMmMvYnVzc2VzL0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgICAxMSArDQo+ID4g
ZHJpdmVycy9pMmMvYnVzc2VzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgIHwgICAgMSArDQo+
ID4gZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3QyNjAwLWdsb2JhbC5jICAgICAgIHwgICA5NCAr
DQo+ID4gZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3QyNjAwLWdsb2JhbC5oICAgICAgIHwgICAx
OSArDQo+ID4gZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3QyNjAwLmMgICAgICAgICAgICAgIHwg
MTcwMw0KPiArKysrKysrKysrKysrKysrKw0KPiA+IDcgZmlsZXMgY2hhbmdlZCwgMTk1MCBpbnNl
cnRpb25zKCspDQo+ID4gY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2kyYy9hc3BlZWQsaTJjLWFzdDI2MDAtZ2xvYmFsLnltYWwNCj4gPiBj
cmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aTJjL2FzcGVlZCxpMmMtYXN0MjYwMC55bWFsDQo+ID4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtYXN0MjYwMC1nbG9iYWwuYw0KPiA+IGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzdDI2MDAtZ2xvYmFsLmgNCj4gPiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3QyNjAwLmMNCj4gPg0KPiA+IC0tDQo+
ID4gMi4xNy4xDQo+ID4NCj4gPg0KDQo=
