Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A4942861D
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 07:08:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSRdj0gxdz2yY7
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 16:08:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=synnexcorp.onmicrosoft.com header.i=@synnexcorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-synnexcorp-onmicrosoft-com header.b=CroPCQav;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hyvedesignsolutions.com (client-ip=198.235.15.15;
 helo=smtp1.synnex.com; envelope-from=jannya@hyvedesignsolutions.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=synnexcorp.onmicrosoft.com
 header.i=@synnexcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-synnexcorp-onmicrosoft-com header.b=CroPCQav; 
 dkim-atps=neutral
X-Greylist: delayed 905 seconds by postgrey-1.36 at boromir;
 Fri, 08 Oct 2021 20:24:57 AEDT
Received: from smtp1.synnex.com (SMTP1.synnex.com [198.235.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQjT52J0gz2ymb
 for <openbmc@lists.ozlabs.org>; Fri,  8 Oct 2021 20:24:56 +1100 (AEDT)
Received: from FCA-EXCH9.synnex.org ([10.88.32.37])
 by smtp1.synnex.com  with ESMTP id 19899jDZ017479-19899jDb017479
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=CAFAIL);
 Fri, 8 Oct 2021 05:09:45 -0400
Received: from FCA-EXCH8.synnex.org (10.88.32.36) by FCA-EXCH9.synnex.org
 (10.88.32.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 8 Oct
 2021 02:09:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by FCA-EXCH8.synnex.org (10.88.32.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Fri, 8 Oct 2021 02:09:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8I3Of1dnLooEAGOaBU20lVzg7c0MYqT+lFe2qvx1U9GW4N88LDQA4D9doQuVfxdjqXjmE4beJqBNc4GLFp24rarsDppJLnhM0bQ5rwdWyaCopYykzBK8FHd3XuETvEmPeg9Y6IuaJo1TKnNsinSuHfQoiNlrkRJ+7751in9Y+2g1235rGgPzm7g+RaCIbl94jKNojlqM8GqpJC8LvBV4F+Iop1tvYLTEOSfz57hbyEH5zdbJdPmP+nSfkNQNHa5EiDH+3ZfpYj0DJKDZi9tlWc/5BKgoaDG3u52mMxxzZjBViGC53Icd2pMW8ORHOxAE6xmKdXlhPP7CcRGLFM6EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzMN+0T0R5KqafxscuQFO7C/ZIHCDMhjLvONAVKv96E=;
 b=QSMru4s4R2pJMI/dhLnYLy6Qpa0GL5GCBgy+yLeHaVkhO9RjvqlerUoH2/oM4JhOFeISHQnWUKRAbg3LQjYcfun9hdqFJ6m5QE7HNyRn00/NN9x7GgjC43N7eH3rySR680utgy72p33LV4CEL7aQF0ZcN3SWx7o9jgz55JH6LyHBn7QJcOHBV1y/LG1DK3TsQnGW30BFcDSBYqU3LtM3KN1xoA9ZT2WApQPdF6mwBCTOUSpVGM0ggRm6Sks+gMzgqrVNQ/Q7drP9OZ6lY2zXI0KmrP8qoTCXQS3i+I5PLX89q8IOCBnGQJc2/wAlY31Xx/EhNrDOBVLF86+TfQtWEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hyvedesignsolutions.com; dmarc=pass action=none
 header.from=hyvedesignsolutions.com; dkim=pass
 header.d=hyvedesignsolutions.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synnexcorp.onmicrosoft.com; s=selector1-synnexcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzMN+0T0R5KqafxscuQFO7C/ZIHCDMhjLvONAVKv96E=;
 b=CroPCQavHZ9/fptE+BDFUBL+4rbphIOnXifPK575dxB2D+z8nWHnW+jluewvqvHCOH0RMlQjA1C77fUtG+2PM+pAqhucHwr0zvJK0EIDBkhced3VC4dy1bCC6+iak8uIzbKs4UaIdBZPjUkKVjdoq9IfCUjZN1uRGbf/XKGKxeI=
Received: from BY5PR04MB6421.namprd04.prod.outlook.com (2603:10b6:a03:1e7::11)
 by SJ0PR04MB7423.namprd04.prod.outlook.com (2603:10b6:a03:29c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 8 Oct
 2021 09:09:43 +0000
Received: from BY5PR04MB6421.namprd04.prod.outlook.com
 ([fe80::e072:5322:1983:4989]) by BY5PR04MB6421.namprd04.prod.outlook.com
 ([fe80::e072:5322:1983:4989%6]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 09:09:43 +0000
From: Janny Au <jannya@hyvedesignsolutions.com>
To: krtaylor <kurt.r.taylor@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: OpenBMC
Thread-Topic: OpenBMC
Thread-Index: AdcJSJktyx08QJFNSieADzNCxn+SRgAoqCjQADjSxgAsVVRScA==
Date: Fri, 8 Oct 2021 09:09:42 +0000
Message-ID: <BY5PR04MB6421D6EB8BF4D9EB43BE0024DCB29@BY5PR04MB6421.namprd04.prod.outlook.com>
References: <BN6PR04MB02751CA806D404FA7CA19855B9819@BN6PR04MB0275.namprd04.prod.outlook.com>
 <BN8PR04MB6164B5E8966F9438F0180DB8B9809@BN8PR04MB6164.namprd04.prod.outlook.com>
 <17a3b0e5-4613-8388-ad69-427c41439343@gmail.com>
In-Reply-To: <17a3b0e5-4613-8388-ad69-427c41439343@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=hyvedesignsolutions.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c76bdc5-1678-472b-0a39-08d98a3b5dbf
x-ms-traffictypediagnostic: SJ0PR04MB7423:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR04MB742363C2ABECC77B8161F7B2DCB29@SJ0PR04MB7423.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fQ3Yts6oo5/+LD/KkvJT74VfHGp8mPatw4rEYt/4jdvUjRgAwdPkAag7PdTbTx+Gq2V6poQsE3oY1jt/qedIelmfWSoZfKgJKGUwr+PLZUZkfGuJsHHpHlMqAgyNN1QIoY8moV0OPPTCF+rK17HP8Ij9OO+DXw6pBaRuTkYde8QcZ1juk5Q2GbAWWFmkCwM5WpUMQz0Y4+l1QS6b/jB8gKnECPH/B/01X7fgPGoZpEqjW+mojA9s1hMvk2K0S18HfQRRwCzAqObbwoS01byrCE2ex0QopX1TxnOSH+6Fe9rV2LLTrvTRad3MLWqc9idPgMO0qazqBESPkMca3wAypXhR0IHP40FUhhjk4hW9QnHxQa3scxCenB23cp6uBpv3q9LsadtRpVl+my97NVm2j9A55ILJZSqSXBEFKIZzw2NQEAky4tLXV5uu7FFW9TbnmtQMJCO9JgxS4gK1I7CZYnzFtmikmkUXwbJWgCmAtCLIJEinaELph0aLFaWaVM8hDe29MB3GnIsCVy5Z/+LHkVSif8ycPAp2UlGCgmhnhKTv82JuyOeu/h7qcuX3aHe856i/xrxjoKnY39jlYGUjYp5nbzEOVBypoFy87z9nV7yu9FvM+m4zVoK6nWmLGZmJ4nr+BDlUubBYmVajEVQa9eT+Ug/N04gGfIklAuS6jKeDbJd5O5L2+iV1tIGSvIJhZGavl4lR6fmGN42B+um/XVqchPKPD9BhMeBz+dvTDLsaemrII6dShxnHxiQDrJ5H4iThc1zMHse1bSsiBgoZRdHOYBxiZSBur31kbvA1AcM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6421.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(40140700001)(8676002)(7116003)(107886003)(4326008)(8936002)(508600001)(110136005)(64756008)(76116006)(66556008)(66476007)(66946007)(66446008)(316002)(33656002)(6506007)(5660300002)(53546011)(9686003)(38070700005)(71200400001)(52536014)(86362001)(55016002)(83380400001)(122000001)(26005)(3480700007)(186003)(2906002)(7696005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Lzy1wFAdZKBC4nkWUQ18Rc6AXuxw3hu3vu0K1bVR0n7+E1ogQuYgc6RWRycX?=
 =?us-ascii?Q?Wu/Y86NazAEUHytIm9e+0eidOiAlLy4aX730Ahwa0FC8DXOLA2ikTgeBRh+q?=
 =?us-ascii?Q?FmfTCn9UUz4SiZJGPOrlCDuENvSzmaM53zuEErt5G4Fr9moRzbjcBWsp+Ocx?=
 =?us-ascii?Q?0Alo1cspgIGaNwOLBNrxZb/jWqlLnswzvE3cVCSN9QmMgD7o4wOo8uDisjG7?=
 =?us-ascii?Q?zwFd76SmSccvw/kc+9lqazhuJL+UodvkiCYV2d0V0JDx3N6ElZMctr+Y0hFo?=
 =?us-ascii?Q?2txaUSrO4Ur1andpxidDfTWQJRgiktx79TIX4WNnvbPVPxDxwWIb2BmR0KzT?=
 =?us-ascii?Q?JCO1Y13EUn8AZeNa/LaG4gwOD454wtsRFH1Wse+K9/3rWnSQ0eYWgxxyaPUr?=
 =?us-ascii?Q?+KHXHyKiVPLgKtxCEv4lZfSEDVpgx6DcmFpejctNKiihKP37X7BPVxMSbTBL?=
 =?us-ascii?Q?pq+ULl1mFGKmYk+Thocp63Y6twxLCUQyBNaygb9eIheU3mlN+0jtUYqo8C2y?=
 =?us-ascii?Q?uE8Q0b3I0jhG9WyJZlYq/Lg26giy5dAflKcqlXVXah+joKIWBWu5HtKJCP+b?=
 =?us-ascii?Q?euWDy7IV41FOXTePtBhYmqPkpaaMNCLQ8lJ8KLmoqC5llKm+lXmhEyrhgkDK?=
 =?us-ascii?Q?Ck4IeUxdZm9Hn2XxqF9rkBEg1doVrTiNBzTGZStiIZ0egGxF+pIVglRbuzK6?=
 =?us-ascii?Q?PKBZfjeuH3At68evE439mHGybU1vVoFbFecJFj0LOvdQQuS9wYIeN7uEjeE4?=
 =?us-ascii?Q?GhoKsnnhwe6M6sltBLSRhGmM5Y+IqPZTbo9u49Wd1ihfMndeXxo4RGQJkUkd?=
 =?us-ascii?Q?7m2noe9sVBhmkc2xAbWt+5xYZvBEqejoT0ArCiSPGfpyoRsg0sGVGb/lbyed?=
 =?us-ascii?Q?wF3JeSXDMroD6FUk/PrQ6Wi+kc/Z++JlX0rovdur6LHCG2UDMpPb5XbGxLva?=
 =?us-ascii?Q?2JPhGAMcKx63vaefw0JbEBZNPlyFciwEXAOPXznMNtup/tnco0OfFABeDjLZ?=
 =?us-ascii?Q?uT6NPqtbqUhMR1OYl7RcV8A+x9RxqRYM+zh9ym5ilyeOOTa/4GLf+YeFE28j?=
 =?us-ascii?Q?EdoQMWUDb9naVqcPnodGUM83WrvT5C06HzvT3iHSu8AHYB3QgC4/Ftgh3FZj?=
 =?us-ascii?Q?4dMkHyUmZuf6Qxpinswy+kSWWvgdFZSM8FJhzftlqn1dYM53/VKpcfeWPR5C?=
 =?us-ascii?Q?9+iMbedZ9azdFfuYvbZNr52vrFvSpNnG2vryD5goT4JyGV4j8iThTIe4TNpL?=
 =?us-ascii?Q?smyxAl03cmGl6EmHcPjBAhAZ2FdaQYScd8qyX4Wtx10SoHc/L4wi46PF+8AY?=
 =?us-ascii?Q?9NZBHx+4k6/MBwNktREtfAyR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6421.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c76bdc5-1678-472b-0a39-08d98a3b5dbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2021 09:09:42.8637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 972a0e27-c355-4fd7-9225-9266c8f332ac
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LnzjnskT5BSuRYOhnQKR7vbq/Rj5qoE050A4QKSP+tCceSONptYpieOzrX2jCer2w6qVekqlwUmQMrs6BSiGsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7423
X-OriginatorOrg: hyvedesignsolutions.com
X-FE-Last-Public-Client-IP: 104.47.58.171
X-FE-Policy-ID: 5:24:1:SYSTEM
X-Mailman-Approved-At: Mon, 11 Oct 2021 16:05:27 +1100
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
Cc: Eric Kuo <erickuo@hyvedesignsolutions.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear OpenBMC team,

I am the current CLA Manager for Hyve Design Solutions.  Would you please h=
elp me change the member list?

Janny Au (CLA Manager) <jannya@hyvedesignsolutions.com> (removed)
Phil Yeh <phily@hyvedesignsolutions.com> (new CLA manager)
Jennie Ho <jennieh@hyvedesignsolutions.com> (removed)
Luke Lin <LukeLin@hyvedesignsolutions.com> (removed)

Regards,
Janny

-----Original Message-----
From: krtaylor <kurt.r.taylor@gmail.com>=20
Sent: Thursday, February 25, 2021 1:00 AM
To: Daniel Brennan <danielbr@synnex.com>; openbmc@lists.ozlabs.org
Cc: Janny Au <jannya@hyvedesignsolutions.com>; Eric Kuo <erickuo@hyvedesign=
solutions.com>; Legal <Legal@synnex.com>
Subject: Re: OpenBMC

[External E-mail] CAUTION: This email originated from outside of the organi=
zation. Do not click links or open attachments unless you recognize the sen=
der and know the content is safe.


On 2/23/21 7:55 AM, Daniel Brennan wrote:
> Attached please find the signed corporate CLA for Hyve Design=20
> Solutions with the completed Schedule A.

Your CCLA has been accepted. Welcome Hyve Design Solutions!

Kurt Taylor (krtaylor)

> Best regards,
>=20
> <https://nam05.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fhyv
> esolutions.com%2F&data=3D02%7C01%7Cdanielbr%40synnex.com%7C9027edb06a284
> 6bd6ac708d850d7d026%7C972a0e27c3554fd792259266c8f332ac%7C0%7C0%7C63734
> 8235423425833&sdata=3Dy5vwFB0yKhuH92k0A98BiAuuub2WOou3C%2Blcg9YvCQk%3D&r
> eserved=3D0>
>=20
>=20
>=20
> *Daniel T. Brennan*
>=20
> Vice President & Senior Counsel
>=20
> Direct:  864-349-4801, ext. 49-4801
>=20
> Mobile: 864-376-4111
>=20
> Fax: 510-360-6613
>=20
> 39 Pelham Ridge Drive, Greenville, SC 29615
>=20
> *From:* Daniel Brennan
> *Sent:* Monday, February 22, 2021 1:30 PM
> *To:* openbmc@lists.ozlabs.org
> *Cc:* Janny Au <jannya@hyvedesignsolutions.com>; Eric Kuo=20
> <erickuo@hyvedesignsolutions.com>; Legal <Legal@synnex.com>
> *Subject:* OpenBMC
>=20
> Attached please find the signed corporate CLA for Hyve Design Solutions.
>=20
> Best regards,
>=20
> <https://nam05.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fhyv
> esolutions.com%2F&data=3D02%7C01%7Cdanielbr%40synnex.com%7C9027edb06a284
> 6bd6ac708d850d7d026%7C972a0e27c3554fd792259266c8f332ac%7C0%7C0%7C63734
> 8235423425833&sdata=3Dy5vwFB0yKhuH92k0A98BiAuuub2WOou3C%2Blcg9YvCQk%3D&r
> eserved=3D0>
>=20
>=20
>=20
> *Daniel T. Brennan*
>=20
> Vice President & Senior Counsel
>=20
> Direct:  864-349-4801, ext. 49-4801
>=20
> Mobile: 864-376-4111
>=20
> Fax: 510-360-6613
>=20
> 39 Pelham Ridge Drive, Greenville, SC 29615
>=20
> [External E-mail] CAUTION: This email originated from outside the=20
> organization. Do not click links or open attachments unless you=20
> recognize the sender and know the content is safe.



