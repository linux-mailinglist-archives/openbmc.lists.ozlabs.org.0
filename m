Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4F03618FD
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 06:46:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM3Zl0XjBz3br1
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 14:46:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=SpbagMxi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.132.93;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=bruce_lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=SpbagMxi; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320093.outbound.protection.outlook.com [40.107.132.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM3ZT4jznz2yyC
 for <openbmc@lists.ozlabs.org>; Fri, 16 Apr 2021 14:46:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPmDsP5rT+h40dYiCNzhAgWQHdLIRh+W/wMgR4BKOlwQMd7Ru06IvTdjiZWc5gbNZBfUZC3KdJr3c+e46ofSfVBFtKplEi8ETopxUyUe1UnKPxxAGRU1zVkovP1LTW6LKSoINlcoiu1kKXSUneHbE9GxsaY7SZTM3HFuCSKBGw0o+r2L7Vq04kJ7nksGsCw16vY1DxxDoyYmWhVN+XqGOmQpAbkYUMFbMB4JPgoYgC4jf7tKMWNrXmFdtP0vFaau1mbuswC82IxTcmUBINq2kerVUksFWwv5y2MEs/8cZJcWcC/fN6PNViTbbcOSplVHgJxqUPtWbIoBuaoXI8Li9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxdeZIbANu9ULX7X2u2Rd7R8PS4pqFx0kk6bZFC4NDE=;
 b=jZFHrrqTOUgNT7EKxUemVr1zZIKbflPffmOCWyQSbhxw794ZrsfGWv+tyGEb9WFVBbLjPXqBl5/2UPe08j1Nhjib6t1vfBKFhARTUrNx2Ocz0jQ6uEoGNl2WAw2tLJqlMz9D/eL2RsiyKCVercJlCV4gNIdVnykhH60Cw/K48VWxD+fvnDzc7ZUEqBqvwjcv3c2dWljWLP+jTv1FKDInX4zVH9rD5/ROyxBpbmeEoPNKJ5a04bpdEFkAM5sf6o1zuaJJg9l25M9yYDivBqPZdjtGH7E6LR2IqA1L0RMIMnLfhrBOo3rp1VfTxq0agM8/JNCX0N16/83dh+DnrndCqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxdeZIbANu9ULX7X2u2Rd7R8PS4pqFx0kk6bZFC4NDE=;
 b=SpbagMxi8uU/8SjO62ALndmfMDCFtmYhvbxfVfl39Jsi0TP7jD37Wt2osl5CUP79Ienh2+dEDt+4GhaH9NkdHnWX0Y2V1QUeseAxLOydg1hh+4ia8Qzo/cND2fEpobKWrVh3uJRujRk2E2S7T1vOsXvpphjyKqueiXNb27tl/lM=
Received: from PSAPR04MB4231.apcprd04.prod.outlook.com (2603:1096:301:30::14)
 by PS1PR04MB2758.apcprd04.prod.outlook.com (2603:1096:803:49::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Fri, 16 Apr
 2021 04:46:01 +0000
Received: from PSAPR04MB4231.apcprd04.prod.outlook.com
 ([fe80::4d14:874d:f2cd:e2ba]) by PSAPR04MB4231.apcprd04.prod.outlook.com
 ([fe80::4d14:874d:f2cd:e2ba%3]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 04:46:00 +0000
From: =?big5?B?QnJ1Y2UgTGVlICin9an7rm0p?= <Bruce_Lee@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: How to get the return value using the command busctl set-property?
Thread-Topic: How to get the return value using the command busctl
 set-property?
Thread-Index: Adcye2UidslBHmPwRmChkR5xby3BjQ==
Date: Fri, 16 Apr 2021 04:46:00 +0000
Message-ID: <PSAPR04MB42315F65948C859527E5D8E2F84C9@PSAPR04MB4231.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 025cd0ab-1d0a-4522-07b6-08d9009288a1
x-ms-traffictypediagnostic: PS1PR04MB2758:
x-microsoft-antispam-prvs: <PS1PR04MB275857840BD1870813526621F84C9@PS1PR04MB2758.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EX23HyQ77z+TSSriQ+QvMHxALN5XG/DyUJmCKgokZVxGAvVZpcugtmu5C+Muo8gYXEEZWL/SasUxMK2dI1NpI1kUEHQYvCYW8RgI/b3fvj/qymr1eH9I/O8IJEDpDTU6obzVnAsAPanZezx4YTZZeJBkke6YkS9hvB4FwA/pKa8UmCkopFrhzTE7zAkoDUC5paSqf3zCzkeimlpNfz0EOFZJatYlPH6it2RhtJwZOZ79QxvxjRfuZxVCBmFlNWPcuzH9ru7l1s6iFuL8HBAho8iLipBd4QYVSJeVcv0869ZOWebJMrN8+n1GfXM5ZNx6fJVpKi9H0ko3q3mbMtyK7DrqnJD2aMKvp30i01/uzguCu/WRl82rYzAis4xzYz2CKEPkllrY5z3WNbs75XfYctNiObUbqs/LSvZAsGgE2Pd0oGCnfFbUIFyT7CEAISPx6CHPHr2Fryu/kU0DgkWSl3FOouvlnN/A8dTD+GnyjeCGe0l0Sx78KagMVPRYqTbZH0HAbk5MUZqmzMNvYNJWhLEugky6+hg5GOoVmc4UMYa8rFPXZ7lryApRAhw01aVeOZe5WtXvzE7/jMteoFIoN9/6AqIBz1xfu50HxyJq3+m+mxQYnTyFCI02zbiO3W8E7entlFW8IYUX5zRmKqtKsA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR04MB4231.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(66946007)(66556008)(64756008)(52536014)(76116006)(316002)(7696005)(33656002)(54906003)(19627235002)(2906002)(66446008)(186003)(6506007)(8936002)(55016002)(26005)(85182001)(66476007)(5660300002)(4326008)(38100700002)(122000001)(8676002)(9686003)(478600001)(83380400001)(71200400001)(6916009)(86362001)(15583001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?N1VxdU5QQXhHVERpa2ErTDdraWg2V2VoL3JKSVBZUnhTaEZzN3NaWUZwTUQxSkFm?=
 =?big5?B?L1VDNHd5NHBIYWgyUU5UVFVDWXdxQWtqRXVQK1NhdGN3TmRsNDBlVHU3c3NTamFD?=
 =?big5?B?blNXY0lLdEhyQjc5ekJ6NkMxRVNDQyswNkNaUlo3S1lWbEc4azRvTmJMcmRvaTVk?=
 =?big5?B?SUl1aVByMTd3Tkh4RWhraTRxazdrMHhtSzR4WUtoelp3ekdqVFo0aDJ2QUJieFdN?=
 =?big5?B?eFhQMVlHVTM2VUtVMHBBaWRxTTZja3g3alliTnV6Z3pSNlZEOWp6UGs0NlNKYnli?=
 =?big5?B?WEV0dVM5YjNVSXBwck5zdDZpMGVXNDFaVS9vZUNhNWI5VU5xd0h1WC9VQm1nR2Uz?=
 =?big5?B?bmVGYTZQMjdsaldNN2NsYmRWNjlleDd1djFPWFR2N1NkQnRFV2NYMFhpanRYeEFr?=
 =?big5?B?NEE4NDE4alZjZHZQbk9oaGdhMzU2RWttM1Q5aTRQRXJQeGxTK05oRm9zS0gyVjB3?=
 =?big5?B?RjdiYUhlOExZN1FYaG02YlNFOUtBWlhNNU1DNEtINFZJcDd5N0NyM1ZscGhBRWNL?=
 =?big5?B?dElPWjF5NXZxU3NpeHYzT2kvNzZRSUNIL1BrbVBqbGlIREREQVpIZ3VJMTZ0a01x?=
 =?big5?B?WlRaWm9LR3pIRmJ5NG16bXVkRlFZTzlPb1NqVmEyQ3JFRCtpQ0JyNlF5ZnNVZ0xE?=
 =?big5?B?S1g4SXVueDlCbHdOREtQZnJzeDJZem9seHVyK0lpdG5VYWNGcXJ6N2NrYTlhRTdF?=
 =?big5?B?b1FCNjYybUpNQXh5SkZZbHE5akR3VTFkODdmWlluM1BaWmM1ZGpFQncya2JkbFNO?=
 =?big5?B?L3h0eTlOejRMbTN1MXpjL0RvRjZsUmE5cXVaVjl4emtLNUhwcytRMTlMb3RzcG5O?=
 =?big5?B?V1ZKSUlSNXFhTnhjU3ArZi9DTVFBVjRNcDVrSEhubXgwdTAyQnBqQ0ZtVVRHa3JJ?=
 =?big5?B?dHZaQ0tvS2dqalhpV1lFZXk0TkhsQ2JSTHZIeHdPZU9TemlWN1VDY1IwOG9wVmYx?=
 =?big5?B?SUR1Tllobi9GbVFsMlloaTdodVhicTZLYXkrVWp2K3FzVmRacTdmbElLTGpjQ3NG?=
 =?big5?B?N1VxZno3U2JXWU41RW1Tcmtmck9FOHFac0FOdC91eUNraDl3NTlMQTMvdEowMzQy?=
 =?big5?B?ZzJuOWVKeVNvMTZubFI2UFBUa0FFeHlWclU2cHBwQ1FKTGdkblMvSENiOHg0N24w?=
 =?big5?B?MGJ6WmVnWUlLMzBqWmZUNk95U2hSUVpXQjI5L2tTRzhhbndSZVp5QVJRMG1OZWtv?=
 =?big5?B?MW9mQVBkL0tEWktSU0llMXlnMElDYzUzeFhzVzNnb3RMOTU0Ykt5czR5Y1h1eitu?=
 =?big5?B?aUl5cG0xaGUvb3Q5cFFweGZYbDlJZUtRVkdkNlp3TlpxTmliQUVFMTJrOXo0VERP?=
 =?big5?B?SkVJY28vZ0RKU0k1NHVtRHg2OUZZczNtQ01lejRWWkwvVHQzTkJFL1R1MXBzd0M5?=
 =?big5?B?V3o2aXltZHRyTHF2N0hKVzRUNUFkaEpGQzlYeWpqL001NytoelQ5TUxrWmVqRWx4?=
 =?big5?B?bFlzRFZkdDF3bXRHVTFTdVA0UmpOOE9ad3ZqbXV5ME8xdUZPZTdackxYN0VjRnVV?=
 =?big5?B?RHVybXdhRjA2Z1lhdlhzNmFHQVcwdjlTUFpxcnk3Ull6SmF3blBwSjFiUUVOSnQx?=
 =?big5?B?WUZ1aVVEbzRZWWE3Q3RNdVpZS09SY0lKcllBdWs2aTJ4VTdwSUdSa3RrMkJjM004?=
 =?big5?Q?CBBeW/+v0n9AYIyozfMJ5SYJdDYXfgeZgevURQqRTgwftcbg?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR04MB4231.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 025cd0ab-1d0a-4522-07b6-08d9009288a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2021 04:46:00.5811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n3h8jZF51A2h+B7HLLfLKIiRx3zPMTKemApPNdh1n8ubgRO7m4ty385GpGYt8K7t9pTSqujMKdHZ6KkIeZrYYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR04MB2758
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
Cc: "edtanous@google.com" <edtanous@google.com>, Nan Zhou <nanzhou@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

RG9lcyBidXNjdGwgc2V0LXByb3BlcnR5IGNhbiBnZXQgaXRzIHJldHVybiB2YWx1ZT8NCkkgdXNl
IHRoZSBiZWxvdyBjb21tYW5kLCBhbmQgSSBmb3VuZCBpdCBoYXMgbm8gcmV0dXJuIHZhbHVlLg0K
RG9zZSBzZXQtcHJvcGVydHkgZG9lcyBub3QgcHJvdmlkZSBhIHJldHVybiBtZXNzYWdlIGxpa2Ug
dGhlIGdldC1wcm9wZXJ0eSBmdW5jdGlvbj8NCklmIGNhbiBnZXQgaXRzIHJldHVybiB2YWx1ZSBm
cm9tIHNldC1wcm9wZXJ0eSwgaG93IHRvIGRvIGl0Pw0KDQppLmUuDQpidXNjdGwgc2V0LXByb3Bl
cnR5IHh5ei5vcGVuYm1jX3Byb2plY3QuSHdtb24tMzY4Nzc2NDUyMi5Id21vbjEgL3h5ei9vcGVu
Ym1jX3Byb2plY3Qvc2Vuc29ycy92b2x0YWdlL3ZiYXQgeHl6Lm9wZW5ibWNfcHJvamVjdC5TZW5z
b3IuVmFsdWUgVmFsdWUgZCAyMg0Kb3INCmluIGJtY3dlYiB0aGUgY29kZSBhcyBiZWxvdzoNCmku
ZS4NCmNyb3c6OmNvbm5lY3Rpb25zOjpzeXN0ZW1CdXMtPmFzeW5jX21ldGhvZF9jYWxsKA0KCVtz
ZW5zb3JBc3luY1Jlc3BdKGNvbnN0IGJvb3N0OjpzeXN0ZW06OmVycm9yX2NvZGUgZWMpIHsNCgkJ
aWYgKGVjKQ0KICAgICAgICB7DQoJCQlCTUNXRUJfTE9HX0RFQlVHDQoJCQkJPDwgInNldE92ZXJy
aWRlVmFsdWVTdGF0dXMgREJVUyBlcnJvcjogIjw8IGVjOw0KCQkJbWVzc2FnZXM6OmludGVybmFs
RXJyb3Ioc2Vuc29yQXN5bmNSZXNwLT5yZXMpOw0KCQkJcmV0dXJuOw0KCQl9DQoJfSwNCglpdGVt
LnNlY29uZCwgaXRlbS5maXJzdCwNCgkib3JnLmZyZWVkZXNrdG9wLkRCdXMuUHJvcGVydGllcyIs
ICJTZXQiLA0KCSJ4eXoub3BlbmJtY19wcm9qZWN0LlNlbnNvci5WYWx1ZSIsICJWYWx1ZSIsDQoJ
c3RkOjp2YXJpYW50PGRvdWJsZT4oaXRlcmF0b3ItPnNlY29uZC5maXJzdCkpOw0KDQppbiBkYnVz
LW1vbml0b3IgLS1zeXN0ZW0gSSBhbHNvIG5vdCBmb3VuZCBpdHMgcmV0dXJuIHZhbHVlIHdoZW4g
SSB1c2Ugc2V0LXByb3BlcnR5IA0KZGJ1cy1tb25pdG9yIG1lc3NhZ2UgYXMgYmVsb3c6DQptZXRo
b2QgY2FsbCB0aW1lPTE2MTg1NDcxODMuMzEzNTQwIHNlbmRlcj06MS44NyAtPiBkZXN0aW5hdGlv
bj14eXoub3BlbmJtY19wcm9qZWN0Lkh3bW9uLTM2ODc3NjQ1MjIuSHdtb24xIHNlcmlhbD0yIHBh
dGg9L3h5ei9vcGVuYm1jX3Byb2plY3Qvc2Vuc29ycy92b2x0YWdlL3ZiYXQ7IGludGVyZmENCiAg
IHN0cmluZyAieHl6Lm9wZW5ibWNfcHJvamVjdC5TZW5zb3IuVmFsdWUiICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0K
ICAgc3RyaW5nICJWYWx1ZSIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
DQogICB2YXJpYW50ICAgICAgIGRvdWJsZSAyMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICANCm1ldGhvZCBjYWxsIHRpbWU9MTYxODU0NzE4My4zMTcxNTIgc2VuZGVyPToxLjQ1IC0+IGRl
c3RpbmF0aW9uPW9yZy5mcmVlZGVza3RvcC5EQnVzIHNlcmlhbD0zNSBwYXRoPS9vcmcvZnJlZWRl
c2t0b3AvREJ1czsgaW50ZXJmYWNlPW9yZy5mcmVlZGVza3RvcC5EQnVzOyBtZW1iZXI9R2V0Q29u
bmVjdA0KICAgc3RyaW5nICI6MS44NyIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgDQptZXRob2QgcmV0dXJuIHRpbWU9MTYxODU0NzE4My4zMTc5Mzcgc2VuZGVyPW9yZy5m
cmVlZGVza3RvcC5EQnVzIC0+IGRlc3RpbmF0aW9uPToxLjQ1IHNlcmlhbD00Mjk0OTY3Mjk1IHJl
cGx5X3NlcmlhbD0zNSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICANCiAgIHVpbnQzMiAwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIA0KbWV0aG9kIHJldHVybiB0aW1lPTE2MTg1NDcxODMuMzMwNDQxIHNlbmRlcj06
MS40NSAtPiBkZXN0aW5hdGlvbj06MS44NyBzZXJpYWw9MzYgcmVwbHlfc2VyaWFsPTIgIA0KDQpU
aGUgc2V0LXByb3BlcnR5IGNvZGUgYXMgYmVsb3c6IA0KaW50IHNldFNlbnNvclZhbHVlKGNvbnN0
IGRvdWJsZSYgbmV3VmFsdWUsIGRvdWJsZSYgb2xkVmFsdWUpDQogICAgew0KICAgICAgICAgICAg
DQogICAgICAgIGlmICghaW50ZXJuYWxTZXQpDQogICAgICAgIHsgIA0KICAgICAgICAgICAgb2xk
VmFsdWUgPSBuZXdWYWx1ZTsNCiAgICAgICAgICAgIG92ZXJyaWRkZW5TdGF0ZSA9IHRydWU7DQog
ICAgICAgICAgICAvLyBjaGVjayB0aHJlc2hvbGRzIGZvciBleHRlcm5hbCBzZXQNCiAgICAgICAg
ICAgIHZhbHVlID0gbmV3VmFsdWU7DQogICAgICAgICAgICBjaGVja1RocmVzaG9sZHMoKTsNCiAg
ICAgICAgfQ0KICAgICAgICBlbHNlIGlmICghb3ZlcnJpZGRlblN0YXRlKQ0KICAgICAgICB7DQog
ICAgICAgICAgICBvbGRWYWx1ZSA9IG5ld1ZhbHVlOw0KICAgICAgICB9DQogICAgICAgIHJldHVy
biAxOw0KICAgIH0NCg0Kc2Vuc29ySW50ZXJmYWNlLT5yZWdpc3Rlcl9wcm9wZXJ0eSgNCgkiVmFs
dWUiLCB2YWx1ZSwgWyZdKGNvbnN0IGRvdWJsZSYgbmV3VmFsdWUsIGRvdWJsZSYgb2xkVmFsdWUp
IHsNCglyZXR1cm4gc2V0U2Vuc29yVmFsdWUobmV3VmFsdWUsIG9sZFZhbHVlKTsNCn0pOw0KDQpU
aGFua3MsDQpCcnVjZS4NCg==
