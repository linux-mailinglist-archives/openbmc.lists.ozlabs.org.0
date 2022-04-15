Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 835AA502689
	for <lists+openbmc@lfdr.de>; Fri, 15 Apr 2022 10:12:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kfpvm2W4Sz3bZ2
	for <lists+openbmc@lfdr.de>; Fri, 15 Apr 2022 18:12:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=kPZCJGZm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::726;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=kPZCJGZm; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20726.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::726])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfpvD58tkz2yZc
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2022 18:11:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1x0KFLymbRhsYsLTVlLWQ5jDdaOVW820fQBALsp8hXZy8f9xcHSoOo8UriPoy8VP0ZlLOstHl4MdNSdwL9NZYZojF2f8AsKqHcrLaPq/6qx+cTY2M4j4r8fXCdxFhsE7gkdRU8F4HEXIcA2KvJGNaG7+BxOTfLOg63/MhEKJGr6xlSeQm3qxo4ojF8BOtc7H79Y9nqdoGE9/x0DHkrCpuaExnBF1qAUU8MkvjaUuroHBKnbzBaefKTsFCEICHMUVqNUrsFJ21FURFvpOjdQiepXxvehaZejXPuxT/S0EaQhNgyapI7NSiWZrvQP6Cen84MrhruezhgiMRwC748CCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcGEUcUwjFN7Tm//O199XCnbdUMX39zVu2CBRmG+HIk=;
 b=Npgfd81SY3GbHHRhJukuxGlsfhwYlJq1xwiiUlSn3I/43OW9zIAlDJGItgJo4jwOKVQPjUo8NNPLPfuwCtK3/luiBqymRPzEob3XZwugxMzUilhB9X4CcC/VVPrHHlCWSFC7Jx7dHQfX9VW+vNEAM13xzxuAzkVyiHO46PGnvMzCJwLY1xJrAyv0od7cOduKYLGUpb9p9OURSuYGVdu6CFU4+r4nQpI12VJLhDnoogOBeGvlksjHmlFM0M+nsTwXz3vhyGdeb9Jtl3rMhSvI2cgNzcQAp1R43Qesf9niQx9/VLet29jhZlqYz5o2FAhl4HEvmRn9s1bCVj3jNN8yzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcGEUcUwjFN7Tm//O199XCnbdUMX39zVu2CBRmG+HIk=;
 b=kPZCJGZmd30jO+lyYEOVqwGp3KTHPOffXzzCecZDWUdWQU1/99QxjD3OHe2Djb6yMeZd42YVPcUxGatSvBgWkY2UKXRr7wT3rX/PhVmDOTk7BWU8yXFugcLXbSSIBeUvzM/KX50IQNM5KjHRvUsSVoTPFUn4P0TK5+KvR8R9mx8LH147jRxSdaX4RGqbF6fh/be/kcCnFdnUqBMU3eIdAYSDzw5CcOuewoIEPDu3JwSuXPcFWoX2jBYoxMdaq3oEveT+xCMIZopffk1psZwUIUw7eYi7Oat3lddqZXboJe/scMC0i4GvhSeZ0fbFGF2PhP5yp0yfKX6Plxwy11IDPw==
Received: from TY2PR06MB3391.apcprd06.prod.outlook.com (2603:1096:404:97::21)
 by HK0PR06MB2657.apcprd06.prod.outlook.com (2603:1096:203:54::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 15 Apr
 2022 08:11:09 +0000
Received: from TY2PR06MB3391.apcprd06.prod.outlook.com
 ([fe80::6ca0:894d:97e2:f667]) by TY2PR06MB3391.apcprd06.prod.outlook.com
 ([fe80::6ca0:894d:97e2:f667%7]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 08:11:09 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: RE: [PATCH u-boot v2019.04-aspeed-openbmc v2] aspeed: add
 CONFIG_ASPEED_ENABLE_BACKDOORS
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc v2] aspeed: add
 CONFIG_ASPEED_ENABLE_BACKDOORS
Thread-Index: AQHYUFCjQ4cXcwiUTUOHxDLCRcfyL6zwTs5AgABPPACAAAG4UA==
Date: Fri, 15 Apr 2022 08:11:09 +0000
Message-ID: <TY2PR06MB33910DF8FDDE1072646911B4F2EE9@TY2PR06MB3391.apcprd06.prod.outlook.com>
References: <20220414224004.29703-1-zev@bewilderbeest.net>
 <TY2PR06MB3391889683F53ACE067875ADF2EE9@TY2PR06MB3391.apcprd06.prod.outlook.com>
 <Ylkm5L2wPl/OYR9g@hatter.bewilderbeest.net>
In-Reply-To: <Ylkm5L2wPl/OYR9g@hatter.bewilderbeest.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce4d8e34-7073-4689-3797-08da1eb77f81
x-ms-traffictypediagnostic: HK0PR06MB2657:EE_
x-microsoft-antispam-prvs: <HK0PR06MB26575D1F579E126AEB439AD7F2EE9@HK0PR06MB2657.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PS5MHnt4PZELVSMSRTlK4YR1G01baAdGH1/+HnXFOtt1pAdNdyveAQZiyTMmYdM2aKiYyLj+69plzwER8AAwmz65h39T+2OdhDY6oGYjzD6QJHncecO11f4WgrSMJh/9SuS4KL7EdZabw+ET1J8+RQrvq12QZvISPoPFMfMbVSFXF2fcfQnZlr1G7nHQu9xD1yN+0s2DZNIOGyLkmiprQ77pl+/GWAx5QllMoqZDxOfZpi3JRI1GA850nROjgJLdN4Ftgwd4cPphcXyrOPe/gfMjS8nAP4brtV8yc0M1XEISy87F3duCfkQY1n0K3MymzJcku5D27IzoLEGYmLKxYBku4hdpntqcOpSImNkUCB4mFKtoXpMEmAHvITzw0aFqxEBTszwDVn+gsavldKDbO6GuQwyHVhWhmwzNVcrSQCpNM0tZRjK2RHDZAQy5SRXIj8Ak8+rqtuux5U7qvmOdtZhhGBJ/ndCoYjhvGcSvIc2sfTsIHNHs89frgfi1L3gb8Wz6+JRCdWBFjAX27wSWQxMOIW9BihaCkpNYWsDyfUPX/ab7DU1XKXzlpg6h4MaaW5rqKkI6Pmdjh85UZFuMQGaWXTNXs/yhU+kx9pdGVSvkXZq/5mkMV4HcT/IXFR5ncWV3YCrGn2r+FlN4em5aPzWv6O2BWu/ZRH4CrPJhWxm+7EX8zduLWg6/rvdFLTj0OODL5McnoJfnriBfbEnrcw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3391.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(376002)(396003)(39850400004)(136003)(346002)(366004)(508600001)(5660300002)(26005)(2906002)(6506007)(316002)(6916009)(38100700002)(38070700005)(54906003)(83380400001)(64756008)(66476007)(8676002)(76116006)(55016003)(86362001)(33656002)(66446008)(8936002)(4326008)(66556008)(66946007)(9686003)(122000001)(52536014)(186003)(53546011)(7696005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U0fIqlVagomOKLy/aa0Fe5ESnUA4jYUfq2yiBhccJoxFb0emW5vz40jly8Bf?=
 =?us-ascii?Q?tBgSjPmPaQbVOImj2WdoQvSuV0kuCaiOP6FbOzCWgi1wm+E9rDdlhauen+EQ?=
 =?us-ascii?Q?LM8o4EZ8QCtw50lSkA5Rpn+9b6nDB5sFoHRgbsbGwuZkHDcWWTVng17YD/4t?=
 =?us-ascii?Q?xlo4BhfVcNezD0+HWPaGCY2QDoKimuOKCT/M1CK+c2N7dK3UxhP3ehKHlzfR?=
 =?us-ascii?Q?dPuLxQNpdYV0w9qDKOR8It4wfADgRcKdWJuruCagbL+qYN/hPEqoIPQqHOEi?=
 =?us-ascii?Q?oIbybncG98BwQQI4sNmOgu0uTenSyGmmaeRU7pOxwuGCEfr3RwuRpuAg4CmU?=
 =?us-ascii?Q?dYelhQMH+Vb3IY5RHT/OlX05xH81cjyUNp978hhnbvevQv25z7jHYACKLYcG?=
 =?us-ascii?Q?XoFkBXxi48o/5JY/yDjLoXzxKn0Ed939ptLqQ0BcglHlZXL8Qgnst0FGekoi?=
 =?us-ascii?Q?dT28Tf5JHFVcCoxOGo8nT5PderR0nAYle+9jZZ1LW59FPby/Gi7K3ftAH2Oj?=
 =?us-ascii?Q?QcrQKRgkpbB0g/iyR30a0O+YgLTeW8P5GZu/zTObZRnyCvKMB96aS6HwmR0T?=
 =?us-ascii?Q?EmyUuF64HEH7PA+7rCbz31j9xKek55Yj/RxE7k/3fHB/UBkwxjZSYawiJDNA?=
 =?us-ascii?Q?HCVKtJKYfgzCVfvCplbpiKlomGKzyWOXopzs5WQ2QnN/0xRdD6dQw1oJvqIU?=
 =?us-ascii?Q?vHPYu+h9Qkd/qkHLp8bbJYent/46L4kHYZJhO5Y0N73ZRRTXOF7yxeCWJM3V?=
 =?us-ascii?Q?qMMrgpUr5vsy9+1tL+06dgPUjCct4MzeIW5dAONsZHnfspynIYFU2zDPiF85?=
 =?us-ascii?Q?NdzkDxR5ioIHfMylCnGEOIjyvfbv7UX3BRVMvWm+ad5xpUuthIWOcBJxjPSK?=
 =?us-ascii?Q?NhcHSNKeR1a0k8BFupX0jUiy8yPghBq5Lteuflr743cAS5saOMgRAGaC8ZBT?=
 =?us-ascii?Q?No1d0LeFX5324uocGhHT9ytrV8+T/thsDsB7gz99s0eAtQQpj5ohvtnSEXEu?=
 =?us-ascii?Q?m0efvtFHIjO9UE2UZocjEGDSVxY7Kq2vimqqJP2OErKhRlXoV8P1nfrWdfom?=
 =?us-ascii?Q?xzutzYnSbi0SfmTNr80daQ0aLZHtsiO4/2oe2koyCyykEb6bDN/GQAPW2hfs?=
 =?us-ascii?Q?Fz0pT2Rhqlz4tEodi1e50BZGmIWe8vCuq8uSyzqigOh7WyHxdSZnPLkORRQm?=
 =?us-ascii?Q?kGrFdDZqxU390IRRFR9xNsstmZdjqYSzuqST+0aI/XOMC07j6Oiy1Uoq5gjq?=
 =?us-ascii?Q?cdMbfXle4UGzlaQh2+j6ydOlSAkHElFZgDSB7Zw4eN43fOXbAETt3VUGqeh6?=
 =?us-ascii?Q?lE/Nrrb/zaHQGcMSDM+QsYtzZgETOJlMJ0K/koXKZkCG+Xmf9U9Kv8JNrzF9?=
 =?us-ascii?Q?B6jPrippJizcQAS71jEMO6Un3GT/uaKTmFeKjNY7YzDesFCtDfR3xwbFnNya?=
 =?us-ascii?Q?GiIA1F5H1qVRP/Zr9f7i/44ayFPM1zHo/f7XBgK1Ec0uqJImXNXmlm+G1MdD?=
 =?us-ascii?Q?MhtlyLDEsDwolzV4C8fHUFaGG19DP933af6e4fUiMUE69ISi+vKbp4w3wMcz?=
 =?us-ascii?Q?XFxle6ohLD6EABwl8qXx0tumKf2BMrnLwdqbnSjKoNPMjCJcAWAAp5B0axLk?=
 =?us-ascii?Q?+H7CcUJfrSX3DVXuytBYhLnkCVvH8oWA7xzqsepgLoj7oHaZk49fq7w5VfPw?=
 =?us-ascii?Q?LVUQdmfTR8HDq1SJIZjCMpXBwR1/O5DPiNhrnEMYcRSdMLDd4Ad79slPRPs/?=
 =?us-ascii?Q?b5yq/9JRmi76QggM7nLgWDqmeWjI2zE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3391.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4d8e34-7073-4689-3797-08da1eb77f81
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 08:11:09.2744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r2FMvW8Sd1r1OPGjC0lgWVoz4KfFUG1N4ABuqJDccw3qihAe30rLnPRtf+IndHebS62sQxf+GcnEHJkjMiAwk4Qk/lOECVPLomxxDyAADaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2657
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,
	Thanks your response.
	And yes, I prefer apply patch without any config to disable it.

Ryan

> -----Original Message-----
> From: Zev Weiss <zev@bewilderbeest.net>
> Sent: Friday, April 15, 2022 4:04 PM
> To: Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: Joel Stanley <joel@jms.id.au>; openbmc@lists.ozlabs.org; Andrew Jeffe=
ry
> <andrew@aj.id.au>
> Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] aspeed: add
> CONFIG_ASPEED_ENABLE_BACKDOORS
>=20
> On Thu, Apr 14, 2022 at 08:21:00PM PDT, Ryan Chen wrote:
> >Hello Zev,
> >	I don't think it is good to send a patch to enable security backdoor.
> >	It should not be enabled, even it user aware it.
> >	That will cause big issues in BMC.
> >
>=20
> Hi Ryan,
>=20
> To clarify, the current state of the code leaves the backdoors enabled on
> ast2400 and ast2500 (insecure/debug mode), with no easy way to turn them
> off.
>=20
> With this patch they'll be turned off by default (secure/production mode)=
, but a
> user that wants to turn them back on can still do so if they explicitly r=
equest it
> via the new Kconfig option.  The name and description of the option I thi=
nk
> make it pretty clear that it's for debugging only and shouldn't be enable=
d on
> production systems.
>=20
> Is your opinion that we should apply something like this patch, but witho=
ut any
> configurability at all?  I think having the option available to leave the
> backdoors on could be worthwhile (I've found the debug UART useful now an=
d
> then during my own development work, for example) as long as the security
> implications are clearly indicated.  It wouldn't be the first Kconfig opt=
ion
> that's really only appropriate for development and shouldn't be enabled i=
n a
> production build (e.g. ASPEED_PALLADIUM).
>=20
>=20
> Thanks,
> Zev

