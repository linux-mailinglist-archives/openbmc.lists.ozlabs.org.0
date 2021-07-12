Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1441A3C45A8
	for <lists+openbmc@lfdr.de>; Mon, 12 Jul 2021 08:41:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNZ0d04tzz304j
	for <lists+openbmc@lfdr.de>; Mon, 12 Jul 2021 16:41:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=O4NXvDe/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.132.135;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=O4NXvDe/; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320135.outbound.protection.outlook.com [40.107.132.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNZ0F4BM0z2yMx
 for <openbmc@lists.ozlabs.org>; Mon, 12 Jul 2021 16:40:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVw3YoY3gLM6YWegbIzHek3KPgg8D8DyrOefnBKAW4o5DarjmUF2SJQBy1kuMKp0O3Hbi1OkXcIpk5gGNM6FinWjhRObvEoAUNQQOCBZPKUEteKS8h1HI5rNf1/j28C3oBzTyWlCxxuQaGAQiM89N/i3ef6UObSB2hKOgLWww9WwE8UQ+JAgbIr+5z6PILhBDWFZyASactRF0vGh8rU0+oo7C+xcmMOTDn3F+nYeEiQiJDcYLs+s8CuGTaHARviKhonnpDtR/C+t5ORiNAZauD/h+Du4dNDsBYoG1RpdyYQGTqGP/yIwY3IEJ5OjvQulr8er04zVy2MK5xlIcS0yjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mndW68DVAwczrErIFbSJZ4k4FJGnUq1feC8R0UnuJUE=;
 b=B3CsrjKq0Q/4fXkfylmi/Shh6oD33pgZtMWz6uWJoBg2iovAseWqc4dmDGOkZq8MgY+25BxFQ5XYR5adAEQbpp81y3LcD9zLJgZS41WO2QroYPrEjSsnUStpn/sKcTLgFfydu4UaR023LQMB+wu4xAMY7WbFnazv+dFbP9vsAGY3nrC3WFHPh8LdeYNYo0mblJ6kM/HewlJCqX5ad/A3v82B1RjRk7gPbdXtsadBwXNcCunUupBft87577EnPlXg3aQnsGetOa84XW5zY3d1XKhA5UF70Q6GTIT8LYPeX2KrYjHhUPjqTVmHR8wAaF9XiSgMNOG9H5izrFiJfcM/ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mndW68DVAwczrErIFbSJZ4k4FJGnUq1feC8R0UnuJUE=;
 b=O4NXvDe/9h+9rc7VgZcrU2ILCKwycM5CpeB0KVfW56FaQBhSUXLEZtHdpW/YPf+6jKERVvjeEW6L70EUlZIi6NVDqWhw2WSlPrYZhTESdYxb2BDyvPR21h+OSww9vqHsGUqeNk4ECW2z72D66pkLhnVovkqDUg2QKblIA/LlXkc=
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com (2603:1096:203:46::21)
 by HK2PR04MB3617.apcprd04.prod.outlook.com (2603:1096:202:2f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 06:40:22 +0000
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::c839:705:b535:18fa]) by HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::c839:705:b535:18fa%7]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 06:40:22 +0000
From: =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
To: "cheng.c.yang@linux.intel.com" <cheng.c.yang@linux.intel.com>
Subject: Serial over LAN by phosphor-net-ipmid issue
Thread-Topic: Serial over LAN by phosphor-net-ipmid issue
Thread-Index: Add25u9TlLzwQ6GkSiaqg6uygkfoEw==
Date: Mon, 12 Jul 2021 06:40:21 +0000
Message-ID: <HK0PR04MB23393580CABB710F96FA97118F159@HK0PR04MB2339.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1253e628-6c1a-4387-4fae-08d944ffec42
x-ms-traffictypediagnostic: HK2PR04MB3617:
x-microsoft-antispam-prvs: <HK2PR04MB3617EDDA8835BC4EBCB565768F159@HK2PR04MB3617.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vUufcArdIHe7j1wBmm1SEP33/er08ZR96R+UMCDpJPkcZIzafyCjqJ6cLX7hTbv31jFb4Dc9dzIoup1tMafFvSmOioIjtLK15t2kq7isGCIRT+Y5+SZUyywbUpqw1alvDJgjLrGtKHHqEaklLDezQ4mNCnB7wbSxPwYytOV9BJ7PuFLlE5iqXOJ+m6K3QgS0cFbmLOuaAQ++HDZHtpU1in+8HoV3bLb2lIFGR+vzFasBwnzAWHuoxZwPBSn0HPXTN12faubM91hV2ErAMnaWIt5LHX1hTuiv5KnaaONPP9Nxk67Z2NfaEnHfMYsszWNc7WUNCGaJfr9zfmd6Ic5FfEgqOk91ft3EtbtKD8+jrRHH9xJBWicgKJBr9+vHySKDsW9l066PzYpE2ZaNaHZbqp8SyYzhw27RXgkDofZ/tTkFyGfOGqZ4Ahk95FIsyvYMypVi3P0tq+y9lMNzKhR40x8qqlBd3DQ8NytJzm6DHMgUpjoKRakvCHJOqwRERdnfeASdNIp9e41BJLasZNzLC3pxtWgvaCh3G+pSqPCIkO5Rmweu1mvRP3gTCZr86qM5A/l7F1a3VaIlUm+QNZMnyxDov9y99AI+CXZx0Gsuq6dJD0JkZI7I1V0s07CdH+UuIzF8m8HT0+E5p3zaZZJ/7obmJ/l0OM6sG3K+BkE7QbKF6yQNIW2BLxoiJc55ioX3JXEpM9jNshxt/RQHApJHwOIlOBbH56ZBxvUskGM6BjA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2339.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(26005)(122000001)(2906002)(4744005)(64756008)(52536014)(66476007)(76116006)(83380400001)(55016002)(66556008)(38100700002)(66446008)(966005)(8676002)(66946007)(5660300002)(4326008)(9686003)(7696005)(6506007)(316002)(6916009)(86362001)(71200400001)(478600001)(8936002)(85182001)(33656002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?TWxvTlBEOGw5aU5DVW1YU2pZZW1nbnozaE9hRnZQdXF5eGNvN29RVHlBeEVIZzcv?=
 =?big5?B?WVhSUFVxMVRYLzRCWlppTjV2bnYvTlRWMEZyaVNBU1h2RTRZbHAzdVJLTC9pNEJG?=
 =?big5?B?cXo4SHFvTm8reUNaWjlPbnk0Y1FPeWZua3VzSHhRTTFPaFlMUjAyM0JCTncvNnp1?=
 =?big5?B?dDhld0ViQlF3bUhHWUxBR2hRaE51L3Z2VHlKQW1zMWFKaFhxWGlQc05RU2FFZENK?=
 =?big5?B?ajMvSlpod0xVTDk1ckx4WTJoZ295SmZueVQ4VDRUS3Y5eGQxdWd3YWtKUXFxRTI0?=
 =?big5?B?RmhUalNRR1RYOU1KMHMzUnVabGZxRzhELzVldUVqL0FUek5QeHV3aHFVMUhFNFN6?=
 =?big5?B?RUhsMHdEQXRJb1VRL3REcEJxUkZGSWc1ekkxZU05V1d3N3p6MDdSZUJqampEbWFW?=
 =?big5?B?Y3FGcFpQcndrS2ZGang1VDhWK0N1SFNraWVDNnZvejNkckFPTHl5SWlvRjdKMDdR?=
 =?big5?B?R3prMU5IbWJydzRsZnZCcC9qWVdhckxaZTI4R3A1TmF1cGpaeDlYcnVGbUF0TkpG?=
 =?big5?B?aVFaVDFwMnJHUnlFb1d1WjdjRVpkMUpSZ29DTFkrVGFmSEVRZ2crVENudXRXY1pD?=
 =?big5?B?UUg1anovVFhkNHh5UDdLeWExcVQzQlFSTmJsSEhIZjhLbm5SWnRoVDhUeEQwNXZj?=
 =?big5?B?bjJKa1orZTJhdU5WOEVTNkNDWFlPZHdDRkhDUXp6S0JrS2NJdk1TS3ppejgvRXlJ?=
 =?big5?B?T0R5K01ORXNNbDh4VW5uK2Z5SDZWMHF1V293dG5QT0E1ekhmQUlOUzQxSVlXNnJi?=
 =?big5?B?VzdpWk1BMHMvN1M4Q2c3QTJGdXFxeXZObC9KcnhlZ1RJUnZmT3lUeFc3aFBUVzQz?=
 =?big5?B?WGFnQTZWQWdua0VrbzM0Tk9DNGI0S040QUs0enljZVZOVDNKQS94QzZqVm02a3Jm?=
 =?big5?B?Q0wvR3hhMjIzSW5JKys3T29RWndMQW9YelgzWlBmYUZKZDdQYkhEYmVaQldTTzNS?=
 =?big5?B?ZVE2M29FYVVsMGdmM0w1S1BVZHRUZElVU3lrWGFndDF0THVEQVh3MS83MVhFQm1X?=
 =?big5?B?QTIrd0Fya0JodllISUJFYzBYYm5wR1BPYkpKNzRVNkFxNTdyTXYwamVpRUlNL25M?=
 =?big5?B?VWxTK2lveEgrbmdaazl3d3dRSkdPU2ZjTGVwSWpSdjhzU09yeG05Sjh4UWV6Y2t6?=
 =?big5?B?bHUxOURsL3h2d0FmMzhzZ3FGZ2tUcEswNTZGaEdONUJ4WExlRmlWbk5ETGZTSExl?=
 =?big5?B?OFk0cGNxVFlWY2dGMnA4VkpyVnh4Yyt0L1kxeE0rOGRlQUppRTVjdXVhZjEwaWdT?=
 =?big5?B?cTRiRC9RUWE0TjQ5WUlTZzA3bXRmUHJ4dmRaOFYxV1ZHckFaTGtzYVlmeFRCeDBQ?=
 =?big5?B?VVYzRnVGWkFLaTV4aTUwalpza0dldVlxelZZVzUyT1oxYWJwWUNnU3Z5SVhUZWlv?=
 =?big5?B?RnZ2ZXdwRGw5N1FUN1MyRFhXeVZ5VUhPaDgxUkZtU2ppQThTYXRTeFd0aGhmM2tW?=
 =?big5?B?Q3RXYkM5a0loUElHdzFXQkJRZThKNGVrUUFlUlRKQ1RUa0F0Z0RvbXdZUEZSMEds?=
 =?big5?B?SXhYQTZJdXJLeTNtcCtiN29Qdm9IOE52amJrVEVVSmhmYm5ab1plcU1NUmNmUEd3?=
 =?big5?B?eVNIV0ZGbVZqN0xIVFdmRnFKTDc5TCtNUlU0bURTY2x5eUQ2REZ4QUxUeFRmZDFQ?=
 =?big5?Q?Q0rPtESxh3iFqrup5lMKUiJ7/Ivs1tbRHgAdUfouXwZfyS5r?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2339.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1253e628-6c1a-4387-4fae-08d944ffec42
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2021 06:40:21.9494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0o+kSkv9eYDhTMuga0qylZ132nA2nefc5pRt7LKwmkxdCnGjYPwwNC7YxCnpc/d5yvyEo/f6XcZNJOnBn9vdBKdfjdgQd73jLS6rYLFEIs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3617
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQ2hlbmcsIA0KDQpJIHRyaWVkIHRvIHVzZSBTT0wgZm9yIHRoZSBsYXRlc3QgcGhvc3Bob3It
bmV0LWlwbWlkLCBidXQgaXQgY2FuJ3Qgd29yay4NCg0KSSBmb3VuZCB0aGUgY29tbWl0IGZvciBT
T0wgY29tbWFuZHM6DQpodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJt
Yy9waG9zcGhvci1uZXQtaXBtaWQvKy8yOTcwMw0KDQpJdCByZW1vdmVkICJzZXRDb25mUGFyYW1z
IiBmdW5jdGlvbiBhbmQgYWxzbyBkaXNhYmxlZCB0byByZWdpc3RlciBzZXR0aW5nIFNPTCBjb25m
aWd1cmF0aW9uIHBhcmFtZXRlcnMgY29tbWFuZC4gKGkuZS4sIGlwbWl0b29sIC1JIGxhbnBsdXMg
LUggeCAtVSB4IC1QIHggcmF3IDB4MGMgMHgyMSBjYW4ndCBiZSB1c2VkKQ0KDQpJbnN0ZWFkIG9m
IHRoYXQsIGl0IGNoYW5nZWQgdG8gdXNlIHRoZSBkYnVzIGludGVyZmFjZSB0byB1cGRhdGUgU09M
IHBhcmFtZXRlcnMsIGJ1dCBJIGRvbid0IGtub3cgd2hpY2ggcHJvY2Vzcy9zZXJ2aWNlIHRvIGdl
bmVyYXRlIHRoZSByZWxhdGVkIGRidXMgcGF0aC9wcm9wZXJ0aWVzIGZvciBTT0wgcGFyYW1ldGVy
cy4NCg0KRG8gSSBtaXNzIHNvbWV0aGluZyB0byBlbmFibGUgb3IgY29uZmlnID8NCg0KDQpUaGFu
a3MuDQoNCkJlc3QgUmVnYXJkcyANCkdlb3JnZSBIdW5nDQoNCg==
