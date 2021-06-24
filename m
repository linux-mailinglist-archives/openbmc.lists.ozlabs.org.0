Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC523B26B6
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 07:20:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9T4Q3DX4z305n
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 15:20:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=Z4U4+bd+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.130.121;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=Z4U4+bd+; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300121.outbound.protection.outlook.com [40.107.130.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9T451KWHz2y08
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 15:20:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcbVXLlZVD78mWY5ix+AIUPDa17lSywVLqUBVYRhTwR+gVzhGaAIrJ8ExF+gPgTnplLqZNWKQmKsxiXN/qoQFlOYqBWdijjcqDzt+Bjk4NcUEN+6w1mOtAd2YFxyH8zx8nW6S40Ukil0uzSV1ZIvL5RSpIIgW5bqOrwfrR9VtdTLP9LMG1XOYLLCHlGVbXPDZnVoFQZ9Ah35t0HCSriZzS7EHnypE31ZYcVYSkfNkqNR0FF9UL8jR4HC6LB6mYixzCCAG2n1ZsXRYO9xtlezW+IU68gfQB3PLtPXrZisq1T8ROTYFVKLiGc99UifE1tGFyhuKf+AzuGKXSAvnrZJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5jQP6bOp8DXLPt1bMSOQgF/wlcbvkoIlR6m8tf+47k=;
 b=Q/VElEnGs/8UB84qYQXtj6zNY20FVCjlYIYPSGql6ilnJqFS/d8sv8MksCw2uBo9DAFzAEQpGe3ttTiX89/LJbVzbNz+vvimJKplu8XOsfqz39pP5f509VyVKovTeYXMBgKa+tjHoFL1ckPO9VXeYy7TT9apSTfsvD7+HXwrhP/7Ht62Q2ht9qzmWlaxHAYcQ6XZ5ZNXZNfYM/VwWynOJ7frOnZtAQUlIipsUZ2p44nyjQsfz+/vqKsA4L2wMg6nePjEtG5/4o1833ZiH/y8cqVMkeY6BuFb6kSlhIsYuNdnDo/ncxflqucfueFb5UbZmAxZZ91YP8X996/3CjNv/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5jQP6bOp8DXLPt1bMSOQgF/wlcbvkoIlR6m8tf+47k=;
 b=Z4U4+bd+XAx4R2j/dS0eKhg2ZaiKl9JS+VFL+LJYHtvkE+H5336o7zAIxelhGTTyCZovLSP8PBfaWN+O9eLkesK4u7rTNsGWE9FrbzsGo6A4L26h1NmwrS9MKWh7YCJHsnpGsHWJ8GcyCI3kLcpUzsRkBQCCVVeTYFjve6JUER8=
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com (2603:1096:203:46::21)
 by HK0PR04MB2547.apcprd04.prod.outlook.com (2603:1096:203:48::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 24 Jun
 2021 05:20:24 +0000
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::413b:f02:85d8:d3c4]) by HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::413b:f02:85d8:d3c4%7]) with mapi id 15.20.4264.019; Thu, 24 Jun 2021
 05:20:24 +0000
From: =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
To: "yulei.sh@bytedance.com" <yulei.sh@bytedance.com>
Subject: IPMI SEL logs from phosphor-logging
Thread-Topic: IPMI SEL logs from phosphor-logging
Thread-Index: AddorFgGhia7RR/HS3OBZTqnX6OaRA==
Date: Thu, 24 Jun 2021 05:20:24 +0000
Message-ID: <HK0PR04MB23393424624A1F752D3BDAAB8F079@HK0PR04MB2339.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bytedance.com; dkim=none (message not signed)
 header.d=none; bytedance.com; dmarc=none action=none header.from=quantatw.com; 
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b429539e-386b-4406-3ede-08d936cfc565
x-ms-traffictypediagnostic: HK0PR04MB2547:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR04MB25478500F8A83D14A8A1AC738F079@HK0PR04MB2547.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UmvNV0bTdd61nP/8UMz4nt6e/EUFlpq4Lm4x8NFfr/Qxy6m5GcNvF/rXStkefz+ulwq5TYnuIT+vI6hSgOkMPHNBwrzb/R5abSEt6rALiE3xuRQyC1Qw/9rdC4BW3hALqcZr8cp4xmPjpt/PtBsvRQpLg2ariLyZQ7VTgDErY5QV6tgQXnrJLSwxa7nMdB5PXAQ1KTtG6EYY/MaYL8/wkB5UvYpXBRIaoeZ6awQ7+F/TRyvJfVKqx9XjW3xUeYYbDYMdgMyHnGVj43+8Li4P7F4m1iM+yZuvwUOR3S+bWlmT9ubO7E3LdGiKLJDujYOLwvBVXr5hfbZktPF1+uKhUR6q88xo80f53iFq5uu0ugnbxy6TM7akhFaZK4l0wz2ZjwMTdZzxP2/vFB82d3GM4SJr9pHs4vu3AS8WG5udsnpGL4z4HA5XvL3hsn2l4Kc7vU9tSj2vMlwGfPIwNQke1ypC+TRVpuFtrF7PA648/ZrcAf6cdiQc6kunAh/B8zPUSTLGyvgHxUrTKvz3tfttm0b9D+EXzmWe4OgL5W5gV6mgImZ18S/7Jv8vf+T2vBfH6fxovosZntsGt1Jl+4Zx50gh2xqZ+u0XliavwJfZfbk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2339.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(316002)(186003)(478600001)(4326008)(38100700002)(26005)(6916009)(33656002)(6506007)(8936002)(122000001)(107886003)(86362001)(8676002)(7696005)(9686003)(76116006)(2906002)(55016002)(54906003)(5660300002)(85182001)(66446008)(52536014)(66556008)(71200400001)(64756008)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?TXhLMHIrZHp1ZzNDUC96RXlxN2VHWUl6eU8zdlhIVm5vSnR6QmdqM2lmeC9lZWRK?=
 =?big5?B?L1dnejhMeXVMSmdKT2h2SmQxc0ptaStZeE42MjBGbEkyMWcrMm1UZjE3S2J0M21O?=
 =?big5?B?SjhYcHZWRFpwd2N6NmJOK0hWTkpoNmpyblVTdkhqQkdoUlhPVWlzYXZpMUZvd1VK?=
 =?big5?B?bXROVDFRUldJMXFURnBGRWd2aGgwVklwdEpyNkpSTGVhcVJqQ1I5Ri8wUDJ1Q3Fo?=
 =?big5?B?MzRWbWw0Yi9MRVY1cTRCd1B0T1JRMEdVbHdIbXY1ekIzUW0vM05DOEkyVjVnVjBq?=
 =?big5?B?YktRK2lwY29RWUp6YkFrZDZrTTY4b2tRQjljdXljSFcrQkowZGVNV2N3SVZkMUl5?=
 =?big5?B?NnlneWlpa2hldDdMbDUrV2lYOGJGQXVXQzNvaDZyR21zSXA3SElhL3dOTjlWUHBw?=
 =?big5?B?emhTYTRrOHZXU2F4d2MrVUZyZU9PYkEwaUxUeWFIaHNXOFJJSXZtbnRTYnU1aUcy?=
 =?big5?B?OW9YbnpIWk5wSUFuaWo5NXlFM0xLZmVHVGJyQWw1WlE2NG82cEk4RVBVTVloaXpL?=
 =?big5?B?QTFjc2dZdnRvQTRzTGVWK05ES3E4VmJYbEJUcVRrVHBvdHVBbnI0Z0Vjdklkay82?=
 =?big5?B?NEJYWVNDWmZlWFBnQWxnNVM1UjkwWmlrcDN2K2xBVUwyQlIxL0JzSzhOQ05xKzJH?=
 =?big5?B?dmFDd3VlMEZsN0RyTTZxMzY5M3MyeWVrcDdKeVdqWWtkRUIyZldTRU0xdzc1VDlk?=
 =?big5?B?amR1Njl0MnRrK2NITklzUjRvZEhtWEVSeVZHZXlvWUZ2WHcwZ1NzTG9oL25qSGUz?=
 =?big5?B?M3ZWZDBuSjBFd0xkcE1jTzB3ZTYzTzBpNzdyMEVmUTNpTVFIWGVycWdwU1pmUGdx?=
 =?big5?B?MlMzemhEbjdYNWYxbU8vQmt6ZGpOd1FJMVFzQ3lqYyt2MHFqQnEvUzRQd1hXUWFh?=
 =?big5?B?UHJtZzRzazE2RWwvaXppVHdkMzhObnZmQ1hLeCtsZUt3eE80a3pob00xY3NMOVVE?=
 =?big5?B?a044QUxKR2dDRzZVNnZHMDhBWW5VRERxbWNwRlhxT3JJRTZaWjVsN1VjanUxVGNP?=
 =?big5?B?QmRUWXNETGZvSWpIR1poU1gvKzlCRHBDQXFHc3RMWHZsOG9vWGlEaGx6T1RQY2VH?=
 =?big5?B?bi9uODl5MFM4enZKMEE3MDlGYzJiMWJXRlRFSnhOMHlTVzBJcVFnZVk4aU96U2M4?=
 =?big5?B?bnUzK2dXckZpaTdkV1V1WCtxRzNKelBtOFZ6dVZsWWg3Z0tuQU1kZ0l1aFlDRFUz?=
 =?big5?B?R2ZDcDBLWTFSWGxTanN5OGZvaWFHN1k3RVNDdGJOeW9vTzJ5NXlVY1oyNk85RHll?=
 =?big5?B?MU9BcVlQQnpxUWVwckNRczAxTTRSV3pUeE1tdVczZmk5TEJ6K1BsZFhCWUJOb25M?=
 =?big5?B?RXlzR2NqZUlSNkNReUdJUnlEcDhFWUZsbUw4M01Edm5zYlZXTS9zMDd1SlJxT3BE?=
 =?big5?B?dEo4RytQOVpHVGo3NEQwdW9qKzNIMXI3QktiZnV3T1VHUW45WUg3bjJQdWdZZHRU?=
 =?big5?B?aTdvMTJ6dng0WTZnQ3gyRTdqTk9ub3FqZ2F5eCtNVy9MZ0UreWEyS2t4c3NnTHA5?=
 =?big5?B?dDBUeFY3aEtWWlo5Q3Z0endkMGxpeFd4dEFtYXg4a3diNjhyTkErTkt2dWs1TENK?=
 =?big5?B?bXBPNFIyR3ZGd2M0STBpWWdNVUdQTFU5ZFFCK3hWT1A0V3RUZEZScXV3NzJGUkxw?=
 =?big5?Q?yR0j8vtJO/giiqBq3S+nRUL2jQsmlLdtdKqIdYUTIu/X0aik?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2339.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b429539e-386b-4406-3ede-08d936cfc565
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 05:20:24.6043 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fhH9GSJY++4sMTc0CLnFdr6Y2tJsmVnDHbQLxTGUaW07FxnQ+D1tbXRFN5CWqP4R8VqGYJlDLPJv5g6BCPanYQaJmUVIo27qn2SzkgM1KN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2547
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>,
 Brandon Kim <brandonkim@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgTGVpLA0KDQpJIGVuYWJsZSBTRUxfTE9HR0VSX1NFTkRfVE9fTE9HR0lOR19TRVJWSUNFIG9w
dGlvbiBmb3IgcGhvc3Bob3Itc2VsLWxvZ2dlciBhbmQgdGhlbiB3b3VsZCBnZW5lcmF0ZSBJUE1J
IFNFTCBsb2dzIGZyb20gcGhvc3Bob3ItbG9nZ2luZyBzdWNjZXNzZnVsbHkuDQoNCkJ1dCB0aGUg
cGhvc3Bob3ItbG9nZ2luZyBzdGlsbCBoYXMgb3RoZXIgZXZlbnRzIGlzc3VlZCBmcm9tIGVsb2cg
ZnVuY3Rpb24gYW5kIGFsc28gcHV0IHRoZW0gaW4gdGhlICIvdmFyL2xpYi9waG9zcGhvci1sb2dn
aW5nL2Vycm9ycyIgZGlyZWN0b3J5Lg0KDQpGb3IgZXhhbXBsZToNCg0KMDAwMDAwMDAgIDAzIDAw
IDAwIDAwIDAzIDAwIDAwIDAwICAwMyAwMCAwMCAwMCA2NyBmZiBlNiAzOCAgIHwuLi4uLi4uLi4u
Li5nLi44fA0KMDAwMDAwMTAgIDdhIDAxIDAwIDAwIDMyIDAwIDAwIDAwICAwMCAwMCAwMCAwMCA3
OCA3OSA3YSAyZSAgfHouLi4yLi4uLi4uLnh5ei58DQowMDAwMDAyMCAgNmYgNzAgNjUgNmUgNjIg
NmQgNjMgNWYgIDcwIDcyIDZmIDZhIDY1IDYzIDc0IDJlICAgfG9wZW5ibWNfcHJvamVjdC58DQow
MDAwMDAzMCAgNDMgNjUgNzIgNzQgNzMgMmUgNDUgNzIgIDcyIDZmIDcyIDJlIDQ5IDZlIDc2IDYx
ICB8Q2VydHMuRXJyb3IuSW52YXwNCjAwMDAwMDQwICA2YyA2OSA2NCA0MyA2NSA3MiA3NCA2OSAg
NjYgNjkgNjMgNjEgNzQgNjUgMDEgMDAgIHxsaWRDZXJ0aWZpY2F0ZS4ufA0KMDAwMDAwNTAgIDAw
IDAwIDAwIDAwIDAwIDAwIDA5IDAwICAwMCAwMCAwMCAwMCAwMCAwMCA1ZiA1MCAgfC4uLi4uLi4u
Li4uLi4uX1B8DQowMDAwMDA2MCAgNDkgNDQgM2QgMzggMzcgMzUgMzQgMDAgIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwICB8SUQ9ODc1NC4uLi4uLi4uLnwNCjAwMDAwMDcwICAxOSAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAgNzYgMzMgMmUgMzcgMmUgMzAgMmQgMzQgIHwuLi4uLi4uLnYzLjcuMC00fA0K
MDAwMDAwODAgIDJkIDY3IDY2IDMyIDM2IDM5IDM2IDM5ICA2NiA2NCAzNCAyZCA2NCA2OSA3MiA3
NCAgfC1nZjI2OTY5ZmQ0LWRpcnR8DQowMDAwMDA5MCAgNzkgNjcgZmYgZTYgMzggN2EgMDEgMDAg
IDAwICAgICAgICAgICAgICAgICAgICAgfHlnLi44ei4uLnwNCjAwMDAwMDk5DQoNClRoaXMgZXZl
bnQgdHlwZSBpcyBub3QgSVBNSSBTeXN0ZW0vT0VNIFNFTCwgc28gImlwbWl0b29sIHNlbCBlbGlz
dCIgd291bGQgcmVzdWx0IGluIHRoZSB1bnNwZWNpZmllZCBlcnJvcjoNCg0KIyBpcG1pdG9vbCBz
ZWwgZWxpc3QNCkdldCBTRUwgRW50cnkgMCBjb21tYW5kIGZhaWxlZDogVW5zcGVjaWZpZWQgZXJy
b3INCkdldCBTRUwgRW50cnkgMCBjb21tYW5kIGZhaWxlZDogVW5zcGVjaWZpZWQgZXJyb3INCg0K
SG93IGRvIHlvdSBkZWFsIHdpdGggdGhlc2UgZXZlbnRzIHRoYXQgbm90IGJlbG9uZyB0byBJUE1J
IFNFTCBsb2dzID8NCg0KDQpUaGFua3MuDQoNCkJlc3QgUmVnYXJkcyANCkdlb3JnZSBIdW5nDQoN
Cg==
