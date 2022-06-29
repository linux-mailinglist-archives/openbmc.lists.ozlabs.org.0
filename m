Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC9655F302
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 03:56:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXl1n1kHfz3cgK
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 11:56:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=Fbb6iRq1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nuvoton.com (client-ip=40.107.117.41; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=Fbb6iRq1;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2041.outbound.protection.outlook.com [40.107.117.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXl1G1v01z3bls
	for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2022 11:56:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtsJfzhSdyoce1cBZKJUCMtmqIctbcVR7jWmEO5neOBmXLOjBtDNz+ce+Gub3vxyQhLbwTht/rhqgLxG6vGEl8KzaLr+3T6hhL8lcxY90J9mk5tY/GwAVM4jKZ2ASsnrmxMUUrh2yxz5HhiSkpsKg/tXGLh1fylsBjOYCuW1TJium0Zj0W3QkaPDDuyQToQ6E0KbyvCKtm/9+phvc/KeURrZfAkIJGZGM1stjZ3p96NDYna+5MpO42XIzWrbPpS4Z6NZQ0e3Si2UE7Z6oAEDTjG/gSc+ptoNrYLAMBKTBX4HxgyZcmlvtSDYlV+Ag2+MlAeK2sP0ZilBwdJw604U5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sv9eszVGHGcLuo9EmiABX+lIS9Bi4v9u9KDgvlvwE44=;
 b=LhbNkMsCLjNXZLJ1p7RbZ5WMkkrPyp1JdeNiAzHhsdSQa8t8BFLk1z0HQtX+6Hh+zKpzaY9edd8VFKezB1txdzEGdO2d/F5L7TbSoN+LbFAuvygAkEtp5Cl+T5+r0TymCKtS4NeGg+VsFKOKNJtmjr1kgBb21NZHhH2a2hMtXK32HktN1/MidayatKtrXtJ592vmcVCAIHfFGsNPrWcJGDfP3FU/oOBokFLgdeEGRSaMNGVgOzdRE6Na0K3PVn76xg63C2DEPOB/hSWpTeRZF/TS1ssL6NR0WiUk1OelXYLkC7s/nYUQrJS/PClEe1VN4s+jUMStngGjub4mY6d2Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sv9eszVGHGcLuo9EmiABX+lIS9Bi4v9u9KDgvlvwE44=;
 b=Fbb6iRq1Cq9hHFtf6zqYJWdvW9V8IaUoMtyjMJmmkTrzTNq3+TU0UPBQfIMxeDOeIhAQupPealWUGKeUhIOqBzUOpFf2v+mcV+KLMZt8bwVsFbrDU6dunabU43wS3/XTXxXtT16U7aDg0/YNwPzz/bqNtseuHOwr+kbOblDS7u0=
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com (2603:1096:203:bf::11)
 by SL2PR03MB4492.apcprd03.prod.outlook.com (2603:1096:100:66::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.13; Wed, 29 Jun
 2022 01:55:39 +0000
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::5048:ee25:8e0d:5f7f]) by HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::5048:ee25:8e0d:5f7f%5]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 01:55:39 +0000
From: "CHLI30@nuvoton.com" <CHLI30@nuvoton.com>
To: "CHLI30@nuvoton.com" <CHLI30@nuvoton.com>, Patrick Williams
	<patrick@stwcx.xyz>
Subject: RE: [phosphor-ipmi-host] static assertion be raised in aarch64 build
Thread-Topic: [phosphor-ipmi-host] static assertion be raised in aarch64 build
Thread-Index: Adh7E1A0RBnDUQomT8akrW8kFEDvBAGzl48gACGr2YAABVmKoAI3LacQ
Date: Wed, 29 Jun 2022 01:55:39 +0000
Message-ID:  <HK0PR03MB50909EFE7DD31C072520A51CCFBB9@HK0PR03MB5090.apcprd03.prod.outlook.com>
References:  <HK0PR03MB5090481BE38DBC9CBC513F99CFA49@HK0PR03MB5090.apcprd03.prod.outlook.com>
 <HK0PR03MB5090F2D83AD05E5774A65910CFAF9@HK0PR03MB5090.apcprd03.prod.outlook.com>
 <YqytgdIR0kZUXZMN@heinlein.stwcx.org.github.beta.tailscale.net>
 <HK0PR03MB509008115E6018186A1C81D8CFAF9@HK0PR03MB5090.apcprd03.prod.outlook.com>
In-Reply-To:  <HK0PR03MB509008115E6018186A1C81D8CFAF9@HK0PR03MB5090.apcprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b379571-90f5-4f31-7bf4-08da597277ac
x-ms-traffictypediagnostic: SL2PR03MB4492:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Lp19OiOYg9K0EuHnEfWMzlAXghA0KstjWhTeSX0uYkblKzh0rMiJq8Jhr8/TuKc5+/vAM/9njbLr8Ln53y8HvO0CMvhAHCvXtBquGsxHJGxsgNjpqffINsXTeoXJzE5yzx5TkAQvCiG0IMcPVuZWp7MQt4M0d+Q2Rizcy3IS4SZ2/3qBd29xoPX4W5jyZPjUqtB7bN7wld9I9FiWEckdKDflzFqwvGwrcsC7xBr6IpGbis6jzskXGyWA71qMZ1qjANsj5XtqPQllS6vLcLVRymq01LZU3qHKIhJjcMqsgYtHIEauxGvdBgMuZuW0JGUenhgx+u+vskSHwbpJ4O0diUPvh/9UvYP1JRXZjA+OG83JuBXqynzWMC6Bahvck74lVjkfUx9Gh1VJL/bEI7ipJ8b1Qh6hThF4mCU+xnm1TUsDOS9tBSSG3x9Hu7YPB5M1jf/QSLTfsHlGeRYrG4DBGoHFx4ISuYbsGFS1Eb9Dty31Bl2l2l3dh8ARPPS6S5Zz5sq34TayeOGf/JKZV7/OLUWJf/yNl/Y6dGvxkfzGThjbxeqktUoEMY4T0tmp3yXSqkNyoz+oaU5oHe+PrGnGEeIo43Bg/zKAN/n6g3Lk0adECBncc9tQ2fKf0/o04FtrNN+cNXHnIGvIe+JFtegykXZua1A1OCE90WjXLzPgSOf0684Q0gU/+tdiaIbf8KB7kxIP8yxcjRtQd13oJa9e8XKEXIAio3LbxCqqlwDQhHjH1QpI4i2ZUFGfqq96vb4QvdGaUDwPAEFEI6bqQyTO5nHEUYHPp9n4w8zPVpRfd+fd6zmEZ3/PcgeW+6Lnth2BiX9y+BKuuNDXQfZTHtMXnvQNnYH6WsaFohWSeeIMWdYbV6ldeDVGrlDvgsEu4gphTN3ShNcS283E+sKtr3mfbhbZpIRnpIRbqN64Bgdip34=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR03MB5090.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(52536014)(478600001)(8936002)(966005)(122000001)(55016003)(71200400001)(6506007)(5660300002)(7696005)(86362001)(9686003)(186003)(41300700001)(83380400001)(53546011)(26005)(38100700002)(8676002)(66556008)(66476007)(38070700005)(33656002)(64756008)(76116006)(316002)(54906003)(2906002)(110136005)(4326008)(66446008)(45080400002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?VpEFE7OKqy8eD7snDFQOs5etjc28D44V8O7Wg6uHuRU66pfBhY5EdqlEL+QY?=
 =?us-ascii?Q?BnTvrNNbpSXbD4sshfZNrj0HWS5QBv7GOcBV0L7jN4AEtCVsY0P1bviMw85/?=
 =?us-ascii?Q?Q6jbQEiXttvUUYgqcRwNuYvArFcliYlHaPgpQBuVx6CyC7HHyVaC1lT4Xb+7?=
 =?us-ascii?Q?l0p1ssMznPJIssRgmB2I7bR2sjkFuQvLRC0PLkK3U2Ebxmg4Qqt/6WqU0+kZ?=
 =?us-ascii?Q?PE5qtTXo0iPmKV4duYehB7wkqnh27w/I5wjslrj0a7fO7eF90ec23iLl4wBG?=
 =?us-ascii?Q?dikbE3AJ/ipqpOlWXACkqQ1nHIiOllSZJeXchAnT4YnvTMbdqiPhd7hBu1ko?=
 =?us-ascii?Q?qgylQT2p7l6iSifBN9AFypwqZ1a0mgXLT3uWwH+JtScKIQcsyZugNPdS4nQw?=
 =?us-ascii?Q?2y7zgxYEnmpWJrvIyYCC+SXLgqop1FIgwG9rMSCCEcKWHfMf75MWvgSlwbor?=
 =?us-ascii?Q?0mKs9ubRbDWs3STne/hXw0bxgpECr3m4dvvuoro4xSXPb2nwgOHSo7gxTJJB?=
 =?us-ascii?Q?uIwMK2i984yq6zLLpw+JoOTEa3uib/0zCXUSD1cZVt9Y9ABT2x2eXMMOdODs?=
 =?us-ascii?Q?mOJAX0qhgyCJDhCzM2dPCQwCtS2QrrzEqyrwvfB4G3KN8MkSpBhsZ4GBEG2b?=
 =?us-ascii?Q?0NXIM7IRdMOUdnYJ2m5L4spQwuiZwLtGn7frAAQWuxz9rne0w2vESIVye/Cv?=
 =?us-ascii?Q?iPpU8elbywk88pZkhcRs++pRJLHxgI70uzMF215KWLAiWWhS5nvFOGYDf0Jv?=
 =?us-ascii?Q?9I5QHmd/MXQP6wG2K//B8pv2fB6xAebBeZv0rs4dhmauQFD6Loou3BhwmNA4?=
 =?us-ascii?Q?05Z0NKgfExrKYUTy1OZwWsmHjGLeN4ypZLown4q+JhE45a2WKQbctXGeV4Cx?=
 =?us-ascii?Q?ZElplB5jGqnltJC9nygl7SgVg1OcsuzvaAZlNHfWlQbidk1RXG42haqU0LOT?=
 =?us-ascii?Q?AZUnU65Y1xS+DVO2YtLL82FsS/0WmfnYVr58clN6yHkGC2qgbZqeO0bj9yQP?=
 =?us-ascii?Q?28P3UlusgK2XZkvYZct7E4CNrUrxL2Q8eyUDjE7HvVmXKtkHjAvMMKJlKZ6n?=
 =?us-ascii?Q?T4JaPv9jFQlhUKuEKUjx+TNUkPbAXNDKU2ng6QRvahjqMrG930cWk2dU26Ex?=
 =?us-ascii?Q?Sy7OEbxLkRmlAmDUhYaFGF8yVo8HBXlQKPfmYv0Ny8LNNfzzj4Hcf8LZtn4C?=
 =?us-ascii?Q?O6LYavZHTFpdelT7udPAbc1WNqGo2gGDi7qDtiad4JLpN5sJP6kz3pXjazbK?=
 =?us-ascii?Q?7ruUjYoBYQHqw3f1iA1mV5RnoaHONGaLCP+zG4OFtttotM/6dDsNKWhxfRdV?=
 =?us-ascii?Q?+XwsfQD5YJktH4vuP2D1hJYD/M4BEROacnqo2zFP/IBo5QTyc9LGeBMAwfaP?=
 =?us-ascii?Q?gw6ZHFCIo94+BBRWQIvcQYS5OB2vbmXVTnP2L51ALzEWPUSmXoZBQbn/f+El?=
 =?us-ascii?Q?6sgiZuQRuE4uM1ptmUGBCJXF/0K2NGZoDrPSXcs/Om6YMFIPrSP5fe0xR/0b?=
 =?us-ascii?Q?1781tmJ80EuGOIOloTfWrKeZFQ9p8JTwpxonOE2HvcodNJ9ivOtabH+O0Ijh?=
 =?us-ascii?Q?wGhyH0DLoJsMm/itXYAWGy/q3j5LttBgBAko7Atj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB5090.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b379571-90f5-4f31-7bf4-08da597277ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 01:55:39.5126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rh8Rw5ZEfMPcLvkbSx2KknWQcibsIAFVpmPIQ33vLHaGH9HeFgnWoYihulOUz5kK3VgArYjguwjwRm7vDhX4PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR03MB4492
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
Cc: Tim Lee <timlee660101@gmail.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "john@johnmaddock.co.uk" <john@johnmaddock.co.uk>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Patrick,

We have submitted this patch in ipmid gerrit. https://gerrit.openbmc.org/c/=
openbmc/phosphor-host-ipmid/+/54692
The PR already be closed. https://github.com/openbmc/phosphor-host-ipmid/pu=
ll/183

Could you help us to review it and see if can be merged for ipmid? Thank yo=
u very much.

Sincerely,
Tim
-----Original Message-----
From: openbmc <openbmc-bounces+chli30=3Dnuvoton.com@lists.ozlabs.org> On Be=
half Of CHLI30@nuvoton.com
Sent: Saturday, June 18, 2022 3:28 AM
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Tim Lee <timlee660101@gmail.com>; openbmc@lists.ozlabs.org; john@johnma=
ddock.co.uk
Subject: RE: [phosphor-ipmi-host] static assertion be raised in aarch64 bui=
ld

Hello Patrick,
No. This PR was submitted by boost/multiprecision maintainer @jzmaddock.
Due to he seems cannot submit via gerrit. Just, I help him to submit this P=
R via gerrit.
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgerrit.=
openbmc.org%2Fc%2Fopenbmc%2Fphosphor-host-ipmid%2F%2B%2F54692&amp;data=3D05=
%7C01%7Cchli30%40nuvoton.com%7C3399be844b7f4e06ca6c08da5097a331%7Ca3f24931d=
4034b4a94f17d83ac638e07%7C0%7C0%7C637910909465356845%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000=
%7C%7C%7C&amp;sdata=3D9%2BrrcTk6OAzkSdvvHK7sn6vc12sNNNMy9haaMjaS3IA%3D&amp;=
reserved=3D0
Please help to review and merge it for fixing this compile error in ipmid a=
t arrach64 platform. Thanks.

Hi John,
Thanks your great help to resolve this compile error.
If there is any suggestion, welcome to discuss with us. Thanks.

Best regards,
Tim
-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz>
Sent: Saturday, June 18, 2022 12:36 AM
To: CS20 CHLi30 <CHLI30@nuvoton.com>
Cc: openbmc@lists.ozlabs.org; Tim Lee <timlee660101@gmail.com>
Subject: Re: [phosphor-ipmi-host] static assertion be raised in aarch64 bui=
ld

On Fri, Jun 17, 2022 at 03:20:04AM +0000, CHLI30@nuvoton.com wrote:
> Hi All,
> Share the root cause about this kind of compile error in ipmid at aarch64=
 platform.
> After debugging with boost/multiprecision owner, we have found the root c=
ause why boost v1.79.0 got this compile error in ipmid.
> More detail you can refer from
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fboostorg%2Fmultiprecision%2Fissues%2F472&amp;data=3D05%7C01%7Cchli3=
0%40nuvoton.com%7C3399be844b7f4e06ca6c08da5097a331%7Ca3f24931d4034b4a94f17d=
83ac638e07%7C0%7C0%7C637910909465356845%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp=
;sdata=3DTR%2Fle56CCGwfBzUi37%2BQNm524R2ZL7%2Fn%2BHvVU5vIDoM%3D&amp;reserve=
d=3D0

Hello Tim,

I saw a PR that someone submitted related to this problem:
    - https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
ithub.com%2Fopenbmc%2Fphosphor-host-ipmid%2Fpull%2F183&amp;data=3D05%7C01%7=
Cchli30%40nuvoton.com%7C3399be844b7f4e06ca6c08da5097a331%7Ca3f24931d4034b4a=
94f17d83ac638e07%7C0%7C0%7C637910909465356845%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%=
7C&amp;sdata=3DhyWLpT32cXnto5Qo0VvLa8VQ8exlVb1k13%2Ff3V1zVIQ%3D&amp;reserve=
d=3D0

Was that from your team?  Can you have someone resubmit it by Gerrit as we =
do not accept Github pull requests for the project.

--
Patrick Williams
________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
