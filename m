Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03306465DA3
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 05:59:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4Nzk5srmz2yZ2
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 15:59:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=U33AJCys;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.255.90;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=U33AJCys; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2090.outbound.protection.outlook.com [40.107.255.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4Nz951Jvz2yMc
 for <openbmc@lists.ozlabs.org>; Thu,  2 Dec 2021 15:59:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmTApq38ZRlcxoL+ZooX8484ky66tltgWp2Sap0fBxGS300oJiIey+IeAxEuRLNaekVa/G2SUlynq+Nzd0u89quH8ptgCNng/FSQ0Cz5Fz+etuTu0HZZn7DLQgfrQ7XaIqyRKaDcnStbtowZ8+Asg0QJ9p9XyGvp96eg5jE0Jt60UfdWvN4sqzhnBagiGF0ZKZ/lWBbaZc3zJamirA9W5ONemn1gMA4+fV6giSVP6EQeVQIa3and3MmNEg+69oZOPRWdMwuBP80/4vYOVSt9ZiRpTsSTqHcuyphZF7jIZ2dFDN3WO4Us32TrBf5MKZhllA/HvCNBmm9HEsr7JAh8tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1ZXD+avEQHiJbRyEfd0YYBdtHFNTkgWKJfj9Z7eze8=;
 b=FT5bfs+pctt9pbT0hFHyFlIZZH9WK+zCuyMGnZK/SulaHwV6CqF7V7JQ13FoIonp/86a77qYo6cyuyP3BJmMpEuRQy9wOTIrZfDu1p+AWBq/sfdHDcjfKCf8V0PiLLqprofWMTx8Hr29mYuDniXimbIfPSGND1bTiAU0s/QL3lYJ+4VDF6tAhfFh5J1r30imTRpVgrdZ280y9Pqw2ZKOngAcBX/TAhOTKx91f+y7pUw3nvOP0EBgT+ag9Akxc/YqBpNvEs1hUwp4EwF7TAZrv+EUp5/xkx0t4Sf7sUPQyqAUC50w69o4uXMolZjJPaCkA74/O254W2Dei7cxem8vmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1ZXD+avEQHiJbRyEfd0YYBdtHFNTkgWKJfj9Z7eze8=;
 b=U33AJCys/Hh8ShOqLueTvr0tJ/lRYUw76OjgleOh0t9qUuizgTxXGa9n0qpASdJ9AoBNWBII9sAZaDt4PF1zck17iQG+flR75OU0jO4Oe6flkac2kP87Pze0d7Wpn/Tlkumjn9bnbn5wqEq8t1Z9wNQagXgQi2U559aIIO5a3m5cOXYFLpMZJI8rurNrNurb2LIpag0Xi820joi3WDanNNfbut8rSJMeAuPuBUe6qMVnoXQIW7rCgb9i07jNiUMgXF4xbCMwi+uJHbzUrkmDwe4kGQt5985hzhiFb9Lt0CAbHMivwWIlRbyyBLMvp8/7bQau21nqVhLgiHvzKuLhfA==
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com (2603:1096:4:69::12) by
 SG2PR06MB2778.apcprd06.prod.outlook.com (2603:1096:4:23::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23; Thu, 2 Dec 2021 04:58:55 +0000
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::b066:63b0:ffa5:6a7b]) by SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::b066:63b0:ffa5:6a7b%3]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 04:58:54 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>,
 =?utf-8?B?SG93YXJkIENoaXUgKOmCseWGoOedvyk=?= <Howard.Chiu@quantatw.com>
Subject: Re: [PATCH linux dev-4.7] Porting tach driver for ast26xx from Aspeed
 linux
Thread-Topic: [PATCH linux dev-4.7] Porting tach driver for ast26xx from
 Aspeed linux
Thread-Index: AQHX5yRTG4aKUrRiCkmZjjhUIiH5qawek70AgAAINwCAAADtgIAAjY2A
Date: Thu, 2 Dec 2021 04:58:53 +0000
Message-ID: <70AF2EA6-A267-41BA-B90D-7730A918AC34@aspeedtech.com>
References: <20211202022623.182903-1-howard.chiu@quantatw.com>
 <CACPK8XcWt18nm0+BYomnWkRCRBqhYJ04y4c_P1nTczLpjyVXcA@mail.gmail.com>
 <HKAPR04MB400364D203AA1D050B753B2196699@HKAPR04MB4003.apcprd04.prod.outlook.com>
 <CACPK8XeCHTDCCd=087BSYw3mq=Hjx=vgCrM17r4ZFtVCazhfHw@mail.gmail.com>
In-Reply-To: <CACPK8XeCHTDCCd=087BSYw3mq=Hjx=vgCrM17r4ZFtVCazhfHw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5e3af1c-8552-4503-18cc-08d9b550709f
x-ms-traffictypediagnostic: SG2PR06MB2778:
x-microsoft-antispam-prvs: <SG2PR06MB277801D311BA35C375A5725B8B699@SG2PR06MB2778.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KJt219MXZXniUuIB0dhXSI7CFNJI6kus7VzfHdu0vG1GzOYHv2n1+vxRasFJNzljyuH1Vf6GtkpQbU0HgEP5TxfdSQOfTkyCS1A4wplOzIU1ZKV8tjiwtF4zLWISEZpQTKQ4e42xONfveRHgAZTc4q3ueiQjL5oyxE+qAPzDnZ7uM00qIDXfVnYHUsV3u9notGARpi1jC2GuLksk7N1oofvWPuNb8AJqW6j85KBB6CaZcLJ84qyJi5fsLQwM0GgMNftP9UD8+X7bYsS04bWw2BgW1kvksh3e0DLgqiYFWiiVmw15smYshs9ua5CDjtSG+U5TC+fcpAUvZADZyQFu3+1oZgE6pQyyGbA0+H6f++TzCEsZIQ6F/eMgcN51kpVYHdiKFuHDzYo+Cu03v7m17+u4fPDRs81U2gZWmxhKw4D6P5gBF6gPyxDElFjZhUCK2FCUFbw/+UdKuzTW7cVLepeWZTGfLM7OTk0PvHLgTpnYT5N0KpBPdqMrD6it3BWp8d8HD2IKqg9g1ozEQDXD2vM7vpBJ5hMExrAasrJh4s6WGAydIpXr6BWRz5ZE2OPZ/JWJeN0jtn5aIaZ+QlEfNLuztvDtMM/g+oDIKNINn5y8XhhWDbJRSYumeUhaltc+tuH2s99oxw44X1kRPLHsuMgAqBmUXa3pTyAeAXMdR0Ea8STHs930CB0dsc9m49zbCeO8gopxODJ8k5KUIq+mISUg99MoXjdBJszVHQlX29iLUd4f50CFmHaSrv4OVssL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3365.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(136003)(396003)(39840400004)(66476007)(4326008)(66446008)(64756008)(8676002)(110136005)(54906003)(66556008)(33656002)(5660300002)(316002)(6486002)(91956017)(66946007)(508600001)(38070700005)(26005)(53546011)(76116006)(6512007)(186003)(2906002)(83380400001)(86362001)(71200400001)(4744005)(122000001)(38100700002)(6506007)(2616005)(36756003)(8936002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3NUWkliNGFwTVhhaUxzbGRldTFENVN5bFRsMUMvaUl1QkplRGpBUDBWd0Jz?=
 =?utf-8?B?YzJHVkdUYmdiQTZITTl5T3UvZHNMamQxYTd3blJPNU9ZN3ExZDdpZ2dkbHZp?=
 =?utf-8?B?dmtCZnFVbm10QmV4bmpBR3owdWxrK2h0MU5sWWFoclp1dUVLbG9FUVNJTG05?=
 =?utf-8?B?dUViRlh6TW56TmRtVTBHT3E2MVVYWDVWb0tWNGdVVzZQMENvbWJpVU1ZKzk5?=
 =?utf-8?B?ZEM2UWFZVndQV0k1K0cyeWNPU01wT0pUeFpkVkk1d0RQUGkrSFp1b0xjRHZT?=
 =?utf-8?B?YzlUTUxWYzh1a3MrNGViSUtMaUwyN1ZldFd1YWtCUGhBd0xwdERYZWJsZDNF?=
 =?utf-8?B?THFYYXBzdU16TDEzblpPQVpNaW9HdFNCQjl4cGErcE5kRzcwS2pNeDhmMFNv?=
 =?utf-8?B?MWs3dW0wMExEQUlnVElCYmtuV2M0bjQ3SzJ3ekNWY01lMk1lTDJXVXllSWNz?=
 =?utf-8?B?RUlRRFlYQ1d4djZ6b2lwL0wwSTNVYXJzUUd6V0NEYWlPT3BKQXVUU2g5NXJR?=
 =?utf-8?B?ejZ6Unl3S2NRbW1lUFpKcHVFYjhVZnlFdE8wUkQ2THY1djF6Tm1FaWhsYjVj?=
 =?utf-8?B?aWVDN3BQdG50Q3JBMkgzVEh6ZG9zSWZmNCtQVFZ2SmlzeEJ1TVhaZ3IvWWJ1?=
 =?utf-8?B?djBJbFJ3RUVTR0RGQmp0RDkrNThOdlJzRmYxWVYrWXRqWWJhb2hsN2VyN1dx?=
 =?utf-8?B?TjlUOVF6dGMxWng0WUsxc05xeURURXVjdThsempxdjdjZnJkRUdBSjg5OXRT?=
 =?utf-8?B?ZHdkU0ZCRXgvYTd4eFdXR3RWMXRKb1FpRzJqbVRPWWZCU0I1cTRoanVvQkJY?=
 =?utf-8?B?eEtpVWVZaTZlQ3NTWncvZGFkQnVTSTJ5R0EyaTg3SHZKbUpYOW1CWDdhT1N2?=
 =?utf-8?B?Q1hCN3NmMzBJRElQRG1uUlpZOE5PMlB3N29WZm9iTldCN2JiYWNzTGVyOHZE?=
 =?utf-8?B?YVlrVE9KNlVqOXNFTHJNOEdTcnlOTVVkZWhCUHpCREQvNU1KQ0UrYWZGckE0?=
 =?utf-8?B?eDU5d042RzNrUkh6TUlGYWVWR3JodFd6aDlvNm1XcUVJS3g5dU1iS3U5MzU1?=
 =?utf-8?B?cGVJcE9PWkoyaUhPdjYwaHptY0JUTlE5L1NPSksyQWNVbVd6Q1k0d2JhZVN1?=
 =?utf-8?B?SFZXR3FtZjRLWVJ4c29SUm9PVGdJcnRINlNFejZWVXFGS1A3dXJPaVZYbG0x?=
 =?utf-8?B?TFU3S3pQRytxMWxGMndpZ3pwVy9SajlWYUlPNitzcElxRS92UGJTZ253cjFy?=
 =?utf-8?B?MCswa0xlZnlQNkRqblJ1d25Ea3I3QmlwTGgzdUFaOVpaOVdhRlFQUnNZUk9X?=
 =?utf-8?B?OTF5SlhESm5PTWh4WklPMytwOU5SYzNubEw5SmZ3eVV4NGJnQVNMM2x2UXFm?=
 =?utf-8?B?bXpZQnE2bCtRWTE0S2F2UWNBZzYwZndNVlY0MTVWS3dIWUFYcFlWeVVUSEZh?=
 =?utf-8?B?SmNvNm5PaVUweng0KzhZMVVDdkd0RFFCME1HUjd6SGVESVRvWlhMSUdHVGZY?=
 =?utf-8?B?ei9HZWdjMEVtc09BZ1JSSTFLTElSS0pDUGxGYWh5WER4cjh1R1dlUnF3eGp2?=
 =?utf-8?B?aVRCUkhsUnA1b2UvSmVlcy9sdW5NbitibitxUVgycWF0RmJpUjVYYU5BL3Bs?=
 =?utf-8?B?YUJ2dnVmM044bnl3amdPNitUSGs3QW1ZcGh1WTh3MmVWTGQvWmE0dXl5Ui9r?=
 =?utf-8?B?R3MyQXhvMGFDQitHank5YTFSdS90eE9FY1Q0U203bUNrd2RtQmVPY0YrTEU5?=
 =?utf-8?B?YkcraVAzZ25WenYzU2ZWSmZwZG9PMFJsRWdnQTdGMFIzVXN5OGxoeFc0U2hU?=
 =?utf-8?B?bDhWaHdqY29Dd3BWK243NkRxYTRFOUFPMXJkbW5vcTlYSG43UG9pT1NOaXFR?=
 =?utf-8?B?OW52M2FlWUJ0dmNDWEkrS1ZZeXY4V3B0QlRlaEVEMTdLL0FHb0hsNGtaWWw4?=
 =?utf-8?B?T0tLMkhmb0tyWm1USW1lcGx3QXFJNWRybHNtSXc3N0tpMFVHQ1NhVUUvbWFi?=
 =?utf-8?B?ZSs2ZzI5WnZCdUJSQ3kzWkhTMlJBU2E1WlNEWDhpYldlS1BiRnh3OWFRMkVK?=
 =?utf-8?B?UW93RGtLYUJPWVR2WDg0M0I2QXRVYTBNUFRmb0YyK3BRT0tVRXUxejQ0Nk9G?=
 =?utf-8?B?T0RpblNYejYzSGdJMjVVUWJ0allYV0lUWnBTNXdnQXVoK0c4dHZLSHhXcEUx?=
 =?utf-8?B?eXdocGNhSnU1M01CNTlPdmMvd1IwR20raCs1N3RueUFsUk1vL3U4T3RrMTlx?=
 =?utf-8?Q?WBhBKlZKFxlKtkCC+v8kLYy6GkpTtQukhqYzeg8dys=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D6752CD6F50FE43B1EBFAC03D143551@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3365.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e3af1c-8552-4503-18cc-08d9b550709f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2021 04:58:53.9112 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rj1BGBd8+xURmdT6zERE4Rng3dW4Uru4PX1jBnMaPl2rUGd7+ubQusgjp1/DIfhtuoVWokfPFDrBjcOsjfQh9IB0Fqb2YEyIUf3zukz2HAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2778
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
Cc: Howard Chiu <howard10703049@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?utf-8?B?UG90aW4gTGFpICjos7Tmn4/lu7cp?= <Potin.Lai@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSm9lbCwNCg0KT24gMjAyMS8xMi8yLCAxMjozMiBQTSwgIkpvZWwgU3RhbmxleSIgPGpvZWxA
am1zLmlkLmF1PiB3cm90ZToNCg0KICAgIE9uIFRodSwgMiBEZWMgMjAyMSBhdCAwNDoyOSwgSG93
YXJkIENoaXUgKOmCseWGoOedvykgPEhvd2FyZC5DaGl1QHF1YW50YXR3LmNvbT4gd3JvdGU6DQog
ICAgPiAgID4NCiAgICA+ICAgPiBIaSBKb2VsDQogICAgPiAgID4NCiAgICA+ICAgPiBZZXMsIHRo
aXMgcGF0Y2ggaXMgdjE0IEkganVzdCBkb3dubG9hZGVkIGZyb20gcGF0Y2h3b3JrIGFuZCB0ZXN0
ZWQgaXQgd2l0aCBGYWNlYm9vayBCbGV0Y2hsZXkgcGxhdGZvcm0uDQogICAgPiAgID4gSSBhbSBu
b3Qgc3VyZSBpZiB0aGVyZSB3b3VsZCBiZSBmdXJ0aGVyIHJldmlzaW9uIG9mIHRoaXMgZHJpdmVy
LCBidXQgbXkgcGxhdGZvcm0gbmVlZHMgYXN0MjZ4eCBQV00vVGFjaCBkcml2ZXIuDQogICAgPiAg
ID4gSSB3aWxsIHN5bmMgdGhpcyBkcml2ZXIgd2l0aCBCaWxseSdzIHdvcmsuDQoNCiAgICA+ICAg
PlRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLiBJbiB0aGUgZnV0dXJlLCBpdCB3b3VsZCBwYXkg
dG8gcmVmZXJlbmNlDQogICAgPiAgID50aGUgd29yayB5b3UndmUgYmFzZWQgeW91ciBwYXRjaCBv
biwgYW5kIGtlZXAgdGhlIG93bmVyc2hpcA0KICAgID4gICA+aW5mb3JtYXRpb24gaW4gdGhlIHBh
dGNoLg0KDQogICAgPiAgIEJpbGx5LCBhcmUgeW91IGhhcHB5IHdpdGggdXMgcHV0dGluZyB2MTQg
aW50byB0aGUgb3BlbmJtYyB0cmVlPw0KDQpTdXJlLiBEbyBJIG5lZWQgdG8gc2VuZCBhbm90aGVy
IHBhdGNoIGZvciB0aGUgb3BlbmJtYyBvciB5b3Ugd2lsbCBhcHBseSB0aGUgdjE0IGludG8gdGhl
IG9wZW5ibWMgdHJlZT8NCg0KQmVzdCBSZWdhcmRzLA0KQmlsbHkgVHNhaQ0KDQoNCg==
