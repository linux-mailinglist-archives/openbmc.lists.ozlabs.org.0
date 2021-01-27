Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5EE30572F
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 10:45:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQdxP2fZHzDqtR
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 20:44:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.128.111;
 helo=kor01-ps2-obe.outbound.protection.outlook.com;
 envelope-from=troy_lee@aspeedtech.com; receiver=<UNKNOWN>)
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1280111.outbound.protection.outlook.com [40.107.128.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQdwJ2qYxzDqjn
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 20:43:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/srcFh34qaeYw3jfUNSAaYz8JBy5Bz5Nv/pduW5JHLtVNodiaiPC43+jaqs2uRkPwzTVtuQ/Q4TK5ybbofPksBsUtHGq3J7+2E7UH8afTo/bnn5fWc7kySgRlfCyfd4H31hDqW+i/HYfyIPgIA/NGmqz/9HB8XBiMAAZza+hv3/a3pL3y8Sa1p6kkHbl2iW8CiuUX7b8OnUIp1jYKEMCac9jknkgHFM6mXdjcPIn4JctDw5+0yd5NeDk207T/FZXbKO25JVrPA2w7gLxYsHktCSpHcuVCng3loJZjgB7BBn5UoTQNgU1KIHGImoZe/xVMR215JLSDhNA0/GDdGuZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3NHd3FIwOUZbdsxfe9w+QpcKR52s0cebn4ws7mBVpM=;
 b=fM4jP7wGoeSfpckMi5YcbuB8pNwHQzbM7VxvNnnQw4qPqwrhlpR8FUIUF1onQyfi1VBvJPgKwwYBpuqHONkraJi8AGu0w9+jTGfDkniVAn3b45IlHXbi78421sntIKckWTk5Rvt81Vj555bBZbmvi1F1fECqHBwhC/x3pFpRHinv/LuPfs12fRziLdNVLlt8f1FeTKiACPLFJHPxd0t7DXB3PS/rPCTwKvgsQ64uhesvYnQXYUhUGABDuW+kFPqcouSsbbGCurxtYrVaKCXKfSCYTh7N63Vhx7Ej0UppScU85r86jtF2/zo13AZwnVeABURCa9rRD84pn/qkOb6HQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from PS1PR06MB2600.apcprd06.prod.outlook.com (2603:1096:803:4d::19)
 by PS2PR06MB3256.apcprd06.prod.outlook.com (2603:1096:300:68::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Wed, 27 Jan
 2021 09:43:45 +0000
Received: from PS1PR06MB2600.apcprd06.prod.outlook.com
 ([fe80::6031:184a:88fe:5667]) by PS1PR06MB2600.apcprd06.prod.outlook.com
 ([fe80::6031:184a:88fe:5667%7]) with mapi id 15.20.3784.019; Wed, 27 Jan 2021
 09:43:45 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Supporting new interfaces in phosphor-ipmi-flash
Thread-Topic: Supporting new interfaces in phosphor-ipmi-flash
Thread-Index: Adb0kMgRe/E68DmNSuSkTCeSdy9fVA==
Date: Wed, 27 Jan 2021 09:43:45 +0000
Message-ID: <PS1PR06MB260095F62386276E75ADC5708ABB0@PS1PR06MB2600.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=aspeedtech.com;
x-originating-ip: [118.99.190.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff8e80b7-18f3-4511-40fb-08d8c2a80a14
x-ms-traffictypediagnostic: PS2PR06MB3256:
x-microsoft-antispam-prvs: <PS2PR06MB3256A8218FFEA6F00A7E52C38ABB0@PS2PR06MB3256.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9+infXMAWF6nQ10ReMMRwYWt6tFco0IekW528+HVsHx+asVPZ828+HduS9fr23ZWwbEGzriOQRVwJYJiTpZh4UMia7Mvm9vY31I4yApI3DcwaONkYoCC4wYjmYpZHzCdPZfZS8KWNBhSPOlpT/+laWzhi52xw8yDYDEU3SE5hlqKx91XnJqZuyyFo2M71TRcMQrHNiP2iCL7xaEgS7B1i5DyUwj2FHBOx8TgU3cm8ns0Cb4dW6GW0RSsOXg/lOluFyQ8XMPaP0y1e5FT6chapICtnYvCliZYp4thbAh1G7W1M9WSIYemBJ3z6f4HJmzeBJ9UAvx1AKl3ofnCt0h2qptUzLylJ+bR9TbtewZNjactl6u9+BnOMB/JAbiQOtcfax7l1JAfTTGKg2Blx8wx/Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS1PR06MB2600.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(39850400004)(396003)(346002)(376002)(55016002)(71200400001)(6916009)(86362001)(2906002)(478600001)(8936002)(9686003)(8676002)(33656002)(316002)(66446008)(6506007)(66946007)(66476007)(66556008)(26005)(64756008)(186003)(76116006)(7696005)(83380400001)(4744005)(5660300002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Ur3wqOLIxNLgP7ne5HWqyi4EXP5lxj9J++4W3A44tnPIYBVmTqKVtu8FQp7s?=
 =?us-ascii?Q?nU0orYViofVm8q71ckNnIjaoRAketP7qzB62PrbD9GMO4s+2tmpObjWLkuvO?=
 =?us-ascii?Q?ZU9355tG/6D8QnMTJv3SpNUwcbe6rpiVwrOkpbRY1WhfQKXOhvd4430vwhaD?=
 =?us-ascii?Q?CrEo0mgtlhEucKgxt/D7WbcA+7VDfoJ5eKpW2H8cGUrBjvxPB2ALLnStDte5?=
 =?us-ascii?Q?R3wdV+DdZX6rNT+Ny9KG1Gaz2XFvjlFGbS2IlRHVUEdsOaEAHt2/hOSHdof/?=
 =?us-ascii?Q?LRo6W2t953t0fLH4rh8idO9OH3OSkRzj8YC5PZ7W/A6QgNlbAXp8X6PBvK3l?=
 =?us-ascii?Q?leAqI/SHZPzqaEn9f0nwwj6ogCS8SRt9WP3LnYXx/DbKL9FTj7ZGeQdw8zia?=
 =?us-ascii?Q?zkQ30ViUQNWNufxfL0qwZwia/SuQziizPg8o+whP5jpqs+ArfMh+sjPIWh+2?=
 =?us-ascii?Q?+VK1agotxSdmcDy54XNXAH2/J6M4zeJgZaQxyayEby7yYMUl9n5U67up5y/k?=
 =?us-ascii?Q?8j4CwnapZkoMRgLEYBaUyi9gg92/vCZQsdXfTnrJEvt06Ko4P8ofvRQ+MsXM?=
 =?us-ascii?Q?/PwJMgiIEbWYVxRWJSbSSBidGeOoeecly+L3Q3hfB6EQJ3CBzjj9C1HMbh9h?=
 =?us-ascii?Q?o5XFF9TIehZKAXLSrtZVWQAMe+R+06tAoUl/+5cdeE87ZvYguWpUKgHR9OwD?=
 =?us-ascii?Q?gpZhQMuwEauI6EccHS60iy5ux5Z8P3ab++k3fKbrHAv5rU4HoO668AhQz5T+?=
 =?us-ascii?Q?qpg7mGAfyKtuObVs1oUgaxho9fiRGkQ96I5Y2LNG5q/dultsSFjQ9E1nnQea?=
 =?us-ascii?Q?TIGa69FNON/vJW/G+Q0vOR6boSxeBUqJ+P7Rw1VVRPSzOYx3aR6AP5TXgqJM?=
 =?us-ascii?Q?Gz2MONHpFOBMH9Ntf/tE2eMGMtsMd4Mj0+WbRhugIWHu+nAZuUgmWN9kV6Pn?=
 =?us-ascii?Q?i1qaWuQESbmXSI+/QicEaO6EO3QTZlsVuF2tMra3sIVY2DlFd1u/ZM9u/87L?=
 =?us-ascii?Q?EJUPFz/spbFDv3PEBYOR9ObouDC3DCdWSWH3HQiqTvJCOvnMn7tbbh49E12v?=
 =?us-ascii?Q?Xh0oFswj?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PR06MB2600.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8e80b7-18f3-4511-40fb-08d8c2a80a14
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2021 09:43:45.0520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4vsF+mV0Ii15sTAES5p3CNLkkJ2uPqRh7G7jETg5mU/GQT7DKdIIaRu3urxr3CJ6ZS6vWgjxw7LIALpwmWO/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR06MB3256
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

Hi team,

For security consideration, user might want to disable AST2500/AST2600 P2A =
functionality by default. To compensate the effect to phosphor-ipmi-flash, =
we're planning to support two alternative in-band firmware upgrade over PCI=
e for AST2500/AST2600 (AST2520 and AST2620 are excluded):
 - Through a reserved **VGA** memory on BAR[0], or
 - Through a reserved **PCIe** shared memory on BAR[1]

The usage pretty much the same as P2A, but it runs on different BAR, offset=
 and length.
This will involves modifying phosphor-ipmi-flash/[tools|bmc]. Should I crea=
te new **interfaces**, e.g. astpcie/astvga?

Thanks,
Troy Lee


