Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B0242861E
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 07:09:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSRfX2C7Jz2yZw
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 16:09:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=synnexcorp.onmicrosoft.com header.i=@synnexcorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-synnexcorp-onmicrosoft-com header.b=IZImaSxO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hyvedesignsolutions.com (client-ip=24.159.132.13;
 helo=smtp4.synnex.com; envelope-from=jannya@hyvedesignsolutions.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=synnexcorp.onmicrosoft.com
 header.i=@synnexcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-synnexcorp-onmicrosoft-com header.b=IZImaSxO; 
 dkim-atps=neutral
X-Greylist: delayed 903 seconds by postgrey-1.36 at boromir;
 Fri, 08 Oct 2021 20:27:16 AEDT
Received: from smtp4.synnex.com (smtp4.synnex.com [24.159.132.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQjWm5ZYmz2yPK
 for <openbmc@lists.ozlabs.org>; Fri,  8 Oct 2021 20:27:16 +1100 (AEDT)
Received: from FCA-EXCH9.synnex.org ([10.88.32.37])
 by smtp4.synnex.com  with ESMTP id 1989C8DM004746-1989C8DO004746
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=CAFAIL);
 Fri, 8 Oct 2021 05:12:08 -0400
Received: from FCA-EXCH8.synnex.org (10.88.32.36) by FCA-EXCH9.synnex.org
 (10.88.32.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 8 Oct
 2021 02:12:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by FCA-EXCH8.synnex.org (10.88.32.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Fri, 8 Oct 2021 02:12:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFoLleYASUcn4nhCvNHnJwl8fKoiEsjsfS+vFYm1D6VTSUshg9tIpzjynBbu+a2Nx0C2heKjzvqqNCAhzU7u11QYn/0YC+1nD5X+vvmiEHxKWdBdnbe3KTxn5uqSfItFsjjHllKeKvXx/NIv7ovl6dRC9Vvt+rHu630UVrWzsP4ZksEDdQz/VZ5kNGhVCH8fbkS5IcNipPYzOAP6se8UinGrFM5P2EoXT4cdKHOoAJPvuWQLcuZfU4j7GdCkTFoRHeO9LcX1jqnbcJ8GzC5xqWhrYXsFiEOdgFbc88WlsYbByl2ZisXYsuxLrMwHORou2l0MBJMWDIekcZaQaAygCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vzS/W0UrgXNBaiU99eKj8R+6jaQJVwM1LuvWHSA8i4=;
 b=mfBBIxbmSxkwK/9NzTdw7Hbd67EmDDm8JIAwR4sJnIRK7MPwvFXwHy0yiaSgT9Lwxp1I+2eh0tNuMFYRV0pN9McScsqA1shpbk0ptW4IGLJb6PGyorYsAslZlOVXSokZh6PO3rgbtck+KI7wGfFfuaeEuzjkHJeT+1RrekhzAJ9dbUh3BCwLnqh8ffuy3VjhJ+4oaiCzzqpd1IFZZJCvKxe49eUmeQnMR/0l/Bh8cQhUBC92SJkLIkSgZ+WBHGCBn6V1shu/+GLWMOr05oKFmmWODuW8GnLjDziUETS7dDWw/MJIQDeQYmt3HDYzXuiLSRj25ato27ChZXSBbwE9tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hyvedesignsolutions.com; dmarc=pass action=none
 header.from=hyvedesignsolutions.com; dkim=pass
 header.d=hyvedesignsolutions.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synnexcorp.onmicrosoft.com; s=selector1-synnexcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vzS/W0UrgXNBaiU99eKj8R+6jaQJVwM1LuvWHSA8i4=;
 b=IZImaSxOkaYCz9IjoqbzErJMJQ9vkKtDoOFVmwTc4hyEVtv8WeJVctlPGtinh2+4GVyeMGpLRBVDfzkIlh/cgZMeLqVacmcN51S15sizhdUhDsjZ+DUk22ikSQmYHwx1U8zDMnDFgHWApJL2N/mp+Q0RI7h2iEt0/riT+dP2/9g=
Received: from BY5PR04MB6421.namprd04.prod.outlook.com (2603:10b6:a03:1e7::11)
 by SJ0PR04MB7423.namprd04.prod.outlook.com (2603:10b6:a03:29c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 8 Oct
 2021 09:12:06 +0000
Received: from BY5PR04MB6421.namprd04.prod.outlook.com
 ([fe80::e072:5322:1983:4989]) by BY5PR04MB6421.namprd04.prod.outlook.com
 ([fe80::e072:5322:1983:4989%6]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 09:12:06 +0000
From: Janny Au <jannya@hyvedesignsolutions.com>
To: krtaylor <kurt.r.taylor@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: OpenBMC
Thread-Topic: OpenBMC
Thread-Index: AdcJSJktyx08QJFNSieADzNCxn+SRgAoqCjQADjSxgAsVVRScAAAKc7w
Date: Fri, 8 Oct 2021 09:12:06 +0000
Message-ID: <BY5PR04MB642185E5B4FFBAFCAC253259DCB29@BY5PR04MB6421.namprd04.prod.outlook.com>
References: <BN6PR04MB02751CA806D404FA7CA19855B9819@BN6PR04MB0275.namprd04.prod.outlook.com>
 <BN8PR04MB6164B5E8966F9438F0180DB8B9809@BN8PR04MB6164.namprd04.prod.outlook.com>
 <17a3b0e5-4613-8388-ad69-427c41439343@gmail.com>
 <BY5PR04MB6421D6EB8BF4D9EB43BE0024DCB29@BY5PR04MB6421.namprd04.prod.outlook.com>
In-Reply-To: <BY5PR04MB6421D6EB8BF4D9EB43BE0024DCB29@BY5PR04MB6421.namprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=hyvedesignsolutions.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc609d4d-0782-4662-afcb-08d98a3bb337
x-ms-traffictypediagnostic: SJ0PR04MB7423:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR04MB74233F83A86D5926EA574966DCB29@SJ0PR04MB7423.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jAydx11LiOGd9bU9urxYZUiJhqdCDeI7zxODzBLubiJnHv6S3TaUeygXyOGZ10qQh7ZQyLYzpL0IAJQFoR807qt9zIOWABFSFgN1IYARczQ3kCaGRcYsc15z+k6yc8Giva63Z/wokJ85BURAgL5uKS6qGFYWra3dwygg0emaLOq06PDjbXDO/mb3gUabf91ibImQiZK52sm9tZfDKB1Kag/RF8TmxdSybdVbAI1LgdR9I3HgCJ0wOL4YoQr8wvPrT5q+2Kb/RqUfhGulJOU/SRLcPUHPPH0DpvyHwOYxHHN5IEHFZDNRkKsieLI8GmrW3ootqEy9lgWrwTQnctxlDS1RBcrp1nijZqfGnNOAOLoW/Ac+wRrt2pahROOTMXuDIl0VrcZslcjsSLf4G0rPdajkfBHCnUljYXXbYWbOi98Hl/zGTXSTd4rOJW444E37Ng6yDavvbWZyDHwTnHwQ+qw6GJsU5Ma9jzZQZqv1lcN3hofs/oA5L1Hta59aRbSqtFD++719QUVIKCzX36Zv8pwIMRkAZQOjbQQmFc2cisU/UOfjzRkRt6kTIDYEYdHPsusTQSeEBt2LnKEpo1bBTnLMnxLAUSGvS6WFwALtGy892uv13x6SOxBj2tF9d/zO1+9tK/SB1vnzIHNVhS7k/u2X2lM6m7l3kziIKyDr+6hLGMD8C0uoIFqCF7erPCJuXD1HdFap3VKUnbJuAjcR4rjmKsaLXHFx0yCarfNtU69pWn1jj0RmjWAazkFIQYnuNaaToAcl7P/+eXYjd88+O6aoIY26FAMAE1qyf7OKdQM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6421.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(40140700001)(8676002)(7116003)(107886003)(4326008)(8936002)(508600001)(54906003)(110136005)(64756008)(76116006)(66556008)(66476007)(66946007)(66446008)(316002)(33656002)(6506007)(5660300002)(53546011)(9686003)(38070700005)(71200400001)(52536014)(86362001)(55016002)(83380400001)(122000001)(26005)(3480700007)(186003)(2906002)(2940100002)(7696005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q8L1NtEnioxWmzIe8fDCklN9CCDsrvFOne6EBcAZPxGMm1Qf/TxeWPnjyOEd?=
 =?us-ascii?Q?AEkckXB1YJGjntTOXjzi/oT1wPmZh4tB4dFYrfFetswWOVK2LZOaEtMawfIF?=
 =?us-ascii?Q?CVwl2UM2T/RKDvBEHYAASA/spjKPUM0xFfMtMCdg6hS7LDCzmbMl9s0lUMNH?=
 =?us-ascii?Q?Il/kvjztdp2a/4vkobxeuzSxZtw65N0kuonK432G4mihwXq86H7hlZSDVph3?=
 =?us-ascii?Q?e/VuafMeVOnjVeOE10TF7Sjdo0Pbl2Q3bfQZ4lRZ64RXzClf03I+6lx4oYLM?=
 =?us-ascii?Q?eP+FHuyxj+SstVQWsAzXjsSAFOeEqVNd3IpsyK985SziuvjVfK0hVY4LsCqJ?=
 =?us-ascii?Q?EGTeMKHSjRMKar+2t++o5+FjwhMrUJhWVsItXm4JjmJ45T3mRCqu31DwekuR?=
 =?us-ascii?Q?4sww6uDPYgAdk9qv4QDRigtUW7fk4AAaOaqy+mYPaO469bYyqTWlEGVcJ0UG?=
 =?us-ascii?Q?RAHrVqnMau0IgLOE1y27IVdmN+H9+sCbP3ukZwp8U8pI0YgYn2JqvQCmAWoB?=
 =?us-ascii?Q?860upQDne+jBA/vBCUv7ezip5QdiuzwUVXfnVzLTf9AfmQosewiZJSdy3b++?=
 =?us-ascii?Q?wWTCEQz4HeQ3IFGlmSr2CV9f9eMAHoYV0PLu/LmHVhibCOsnqElRTLPvjHm4?=
 =?us-ascii?Q?8fVgFEiNr5FYVW2AvOn/gKOX/iCRv+QboAtISUhjyNal5d83Yg6PrjB/vZZz?=
 =?us-ascii?Q?ixss3sc9MYCbFfI/ZsInaeMuvTiIAnI/HTCPDps0KelBVlgRI5abvc7FIPCc?=
 =?us-ascii?Q?hPIoj8mO+2POBUTDAkxSRGzcDxibbVComJeXClLaNXDJY5OsKiFSZUOGdLHI?=
 =?us-ascii?Q?lzcPsHZhYu/abTnnl2yHGo7ZFU8NHPWklmYzJ5RDMZdwkqdlqKib71Jg9Xew?=
 =?us-ascii?Q?Sqp6ty4pO8DQoztWTJR1m9l+SfMBv1z+8fCEDAr9N5T9/f8D/hzI1txmBGxW?=
 =?us-ascii?Q?5lL10vFS1hrZdmv2yKS012r6w2tLwZUY1dxrmeFeM2nNpilTgqUogKvIDxMj?=
 =?us-ascii?Q?46UeK56oPN7Db2rNXnQXXdo9Rp489PyfjAdRDc4EcNGD7SRj0qvs6PpVdZ7e?=
 =?us-ascii?Q?EomuTxbBjnkxZ68QzBqRHQeFKOc/k/Hg+f6HD15T3PLxPfvjxfaF8rFx2mUg?=
 =?us-ascii?Q?+xr34I4liiqi2eS/Z10zKWhYtnCIZSEJRW8YJFT6AtXS1IBsgQOcI0U5zyJn?=
 =?us-ascii?Q?8IItZOqNGZ3wq9QZL7hRW8efH6ywOYLPNWouHa1viGIAl71dLtMiZC3HomnJ?=
 =?us-ascii?Q?cUzEmxOttJHwJnX5H1ajj53st4Zqld934kTB8m/FtdsVLKvhDp2DmXQ7ozlI?=
 =?us-ascii?Q?8dCie3in46sGav8vQ8IEd7st?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6421.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc609d4d-0782-4662-afcb-08d98a3bb337
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2021 09:12:06.3324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 972a0e27-c355-4fd7-9225-9266c8f332ac
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HyOO1NnZG+n6Q+Z1YPNUYc9+/4uWCUYOrcaLvprzOrRU2yXplbGNfpvtaPxxby+a2j8WkxL76nrh0Rk/MmqHPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7423
X-OriginatorOrg: hyvedesignsolutions.com
X-FE-Last-Public-Client-IP: 104.47.58.168
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
Cc: Eric Kuo <erickuo@hyvedesignsolutions.com>,
 Phil Yeh <phily@hyvedesignsolutions.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

(Sending again for clarification...)

Dear OpenBMC team,

I am the current CLA Manager for Hyve Design Solutions.  Would you please h=
elp me change the member list?

Janny Au (CLA Manager) <jannya@hyvedesignsolutions.com> (removed)=20

Phil Yeh <phily@hyvedesignsolutions.com> (new CLA manager)=20

Jennie Ho <jennieh@hyvedesignsolutions.com> (removed)=20

Luke Lin <LukeLin@hyvedesignsolutions.com> (removed)

Regards,
Janny

-----Original Message-----
From: Janny Au=20
Sent: Friday, October 8, 2021 5:10 PM
To: krtaylor <kurt.r.taylor@gmail.com>; openbmc@lists.ozlabs.org
Cc: Eric Kuo <erickuo@hyvedesignsolutions.com>
Subject: RE: OpenBMC

Dear OpenBMC team,

I am the current CLA Manager for Hyve Design Solutions.  Would you please h=
elp me change the member list?

Janny Au (CLA Manager) <jannya@hyvedesignsolutions.com> (removed) Phil Yeh =
<phily@hyvedesignsolutions.com> (new CLA manager) Jennie Ho <jennieh@hyvede=
signsolutions.com> (removed) Luke Lin <LukeLin@hyvedesignsolutions.com> (re=
moved)

Regards,
Janny

-----Original Message-----
From: krtaylor <kurt.r.taylor@gmail.com>
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



