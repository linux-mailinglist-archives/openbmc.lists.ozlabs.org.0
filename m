Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C05B15B9202
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 03:09:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSfH33sgbz2xGH
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 11:09:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=atos.net header.i=@atos.net header.a=rsa-sha256 header.s=mail2022 header.b=GbEiqGNa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=atos.net (client-ip=193.56.114.177; helo=smarthost2.atos.net; envelope-from=francine.sauvage@atos.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=atos.net header.i=@atos.net header.a=rsa-sha256 header.s=mail2022 header.b=GbEiqGNa;
	dkim-atps=neutral
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir; Thu, 15 Sep 2022 00:17:48 AEST
Received: from smarthost2.atos.net (smtppost.atos.net [193.56.114.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSMqc5f2Bz3010
	for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2022 00:17:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=atos.net; i=@atos.net; q=dns/txt; s=mail2022;
  t=1663165069; x=1694701069;
  h=from:to:subject:date:message-id:mime-version;
  bh=WhuW//2yqNzneFMi6rdZdMmMOZFxpflXZ4a8XKyAQyA=;
  b=GbEiqGNaN2fGpjZwZ1b1RmnqEKgS4wt1pcxxC13MTVuL2YFmXXkQ1C1F
   J12/nk3Ge6BqTb5xYuOGAaFJMixwjqle1pTCcjzQp9Ar0LCobICkSBQwn
   lYiHG8pv/0O+C+3jbNzZaQBgT3KQFwLtgImqsTGbgDcaqvUZXr2EtwC2d
   TP0gCtKrLKgkWk/wLydIu+GGTotvoQjNew4/1Lnq269ThKPMW0SZ9srt+
   wftAmkwApKpOPHtWtv/uxCkENjPYIDU0HyiPH+5iyY3ODI9QMGbvl5C+A
   T3O073dnEt6JadiQAyyc4V7jYNOcEDTL3VnQl+lcm/QTbOVopJCf9UUF9
   w==;
X-IronPort-AV: E=Sophos;i="5.93,315,1654552800"; 
   d="png'150?scan'150,208,217,150";a="396789399"
X-MGA-submission: =?us-ascii?q?MDF2i/fV8NaaidquGR/AqvmMq2EpBCUEJKA5Hi?=
 =?us-ascii?q?/v7dxbynjhNGNGExwoRjFlT1FblG2D2SmFqPmb2QugMnM8bm65w/J5IV?=
 =?us-ascii?q?ADMKUKAkqk+IJw61JjGWwwOHJaiG2kxKm5Fr2LtRy809ND1DzTaptcQm?=
 =?us-ascii?q?MJ?=
Received: from mail.sis.atos.net (HELO GITEXCPRDMB23.ww931.my-it-solutions.net) ([10.89.29.133])
  by smarthost2.atos.net with ESMTP/TLS/AES256-GCM-SHA384; 14 Sep 2022 16:16:29 +0200
Received: from GITEXCPRDMB24.ww931.my-it-solutions.net (10.89.29.134) by
 GITEXCPRDMB23.ww931.my-it-solutions.net (10.89.29.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 14 Sep 2022 16:16:29 +0200
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (172.16.214.171)
 by GITEXCPRDMB24.ww931.my-it-solutions.net (10.89.29.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24 via Frontend Transport; Wed, 14 Sep 2022 16:16:29 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIDH/tw++EfAuqTYHj0YLXfYaBAajbFKoXAnWi2NTanDJe7sMoeoaT7woH/OtH1eAhT4c2d5+ZxsxbaKsk6lxAzGU3+geq6Dpte7XfDUkTaPdRxOO1/FHYTe5mz0n5FPAK1qjfYSOIVmsREST/k1SSRRo2cr3NoVNCsEoXJdYdQrcWRBmUHJxDENJSa64iSvKmZA4LToGQUF6jitK7EJweCRMb54CfKnulk5B3Bj/sgu2arPwl1Xz8FTuMK2wvlploeGiFIH+L/8o+XESXEOVQrPxEbAsoB9ALSLGf7pvoJjXePBG94i2jhswGTF9hcaiJ2eXBYcYqoMqPGrb/15yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhuW//2yqNzneFMi6rdZdMmMOZFxpflXZ4a8XKyAQyA=;
 b=VI+h8DdPKi6RwWAMILymr/Yv13hogZNqpl8giDHtrtxrDtlcq64cR6jfCeihGrbFv/iaL7WUk7K82GTwGDMK7QdgEw7tpkxHV0RMH/K1dIr4rBLs+283MvC4Dtc+b9UpiZRf1vwnUbnw9RfR5LhZN7IuY9N8Vh4WHb815Di6rR3uSFqLLw3r1+lbPbLvICb5nHcN2E3agN6UfjFyU9vFlDyb9MeQburKjYJO5fqYlv5ol40Rx+9udWmmhaOWNEMu/CUoNf31F0vtbaToFFtwbfd3PCbWGlVYUmJJYdN6ao1bMzJMGd0c6/XPDtypG5NxvaOeNGIfCbiV2v3WkHb5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atos.net; dmarc=pass action=none header.from=atos.net;
 dkim=pass header.d=atos.net; arc=none
Received: from PAXPR02MB7680.eurprd02.prod.outlook.com (2603:10a6:102:21f::7)
 by PR3PR02MB6059.eurprd02.prod.outlook.com (2603:10a6:102:68::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 14:16:28 +0000
Received: from PAXPR02MB7680.eurprd02.prod.outlook.com
 ([fe80::cde7:7ad9:917d:e3b4]) by PAXPR02MB7680.eurprd02.prod.outlook.com
 ([fe80::cde7:7ad9:917d:e3b4%6]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 14:16:28 +0000
From: Francine Sauvage <francine.sauvage@atos.net>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: What is the purpose of  xyz.openbmc_project.Inventory.Item.Global
 interface and getGlobalPath in HealthPopulate ?
Thread-Topic: What is the purpose of
  xyz.openbmc_project.Inventory.Item.Global interface and getGlobalPath in
 HealthPopulate ?
Thread-Index: AdjIRIAgvZs9s8gJT3iRrOr9D3eOFw==
Date: Wed, 14 Sep 2022 14:16:27 +0000
Message-ID: <PAXPR02MB768047479061D2A85A63A2B5E4469@PAXPR02MB7680.eurprd02.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Enabled=true;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_SetDate=2022-09-14T14:01:06Z;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Method=Standard;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Name=All Employees_2;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_SiteId=33440fc6-b7c7-412c-bb73-0e70b0198d5a;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_ActionId=cc3e273c-4c88-4c09-903c-f03922ae2be7;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_ContentBits=0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR02MB7680:EE_|PR3PR02MB6059:EE_
x-ms-office365-filtering-correlation-id: dfc42491-50ce-4231-cd5a-08da965bb6d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M8ehT0NCtFosuJYBVci0WYY7Y5sx8tNZP+SYi6RhTvJAugXyL4CdQOcY5Y9Fzd9VUtUJpSk4xtZtJh7H7aYvQgz/9FuNaFe+3D8ji+zvib8lbD20DUGsXY36pN1MOkoTOyz+O6P8Z0DT+lKX7Af15NOkJ02JpleA1Pu1LasIYgL5G+Y6MTrhOJM5H6PtsQflbrRIxcIhNn0kINx+NxAUs7H4mIKXZWONw5cO1WxrWAPi/H5bfDL0YMJj2G9wdev7+sAZJAyWjRRduf6fncIkcDwk3MsI4Ey+GgsJjcv+MmbHxLp/v5b9Dhqv0xH/00ugtnIYF+FZkESV4aA7mgID9IdqfplVyQZao5zQOsXO1khlgbCsMT5FqLDUSD/VzkQNcH4pSXwBNu4MC1c8DAqY6IzNFNXqdzucBC7snpBqn3R5HDtahqpJ79wYX1bYCtQJliJ/ZZLdAHT6qQsLhBdDLV5y1WmkzS2sp7xFoV2fkHU+XcM4F9wHQ1gt4l5brAfSWweuX6drKq3Oim7Bz9VaFIPFwu4ChHtr3yKCr7e/NWqlVT8za6WNyNVtQFJ9Z7QPB09cvkIglcBbWcRPakzHUUvCp2j4nRAKWneTkDZc25NXppsCH/D7PDOkpl1F13pTx5j9tRm66j2/QIOLLKBK0h1HO6uwX0cBd8QTq49+eH5a6Z4GRWU4DFMeh6z8OzX7hc6ZOVpwSAGkV1rcAojcXdBE1J0K/cQagMaVBKC8KWkZ3AyG1xX+FuWhCpL0eEm3zEVEMXveMYTWS8lUVQpnCaWq12Dv4oHULyqVOgEc9AjV3HHuewjv5l5QJsNw0DaCSVxWvC6+sXPcZuouKSnlGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7680.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(451199015)(6506007)(41300700001)(8676002)(55016003)(7696005)(86362001)(66476007)(38100700002)(66946007)(4744005)(66556008)(44832011)(38070700005)(316002)(186003)(9686003)(83380400001)(19627405001)(82960400001)(33656002)(52536014)(2906002)(8936002)(26005)(478600001)(64756008)(71200400001)(166002)(99936003)(6916009)(66446008)(5660300002)(76116006)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Q+rPjEeYr4zSrqeElNGj5Tmi87y/fWrgTuCAlsDTkRLBEZumqItpN+T0Ya?=
 =?iso-8859-1?Q?qR63r1jW/203v3eiWLH/5IxECatTSRc2gH0D0lPAMLsbASjwbaqP65ntHK?=
 =?iso-8859-1?Q?WC2+yV+r5VDBzKhCXIPHkpAX1TyFI6WyyyhVTjYDoQPWqlXeB04oFkC+PL?=
 =?iso-8859-1?Q?bti7CDtkNXJ/02WYgm2IaXWOWWaSrqN6SA1YqYTA3mOQpSd0qSRyRp5QCY?=
 =?iso-8859-1?Q?8mC57Zm7HhwvB/4FnkNmyzzw7eIlqXdjC5lbAJqTMCIw8WwQTa6UbCLul+?=
 =?iso-8859-1?Q?rbugrF1IIH/jE/UJVkVDVGRFqqod8sCJ/Ba1LBWaEMOpXsDoVfPD4Uvmsp?=
 =?iso-8859-1?Q?gvKTzhfwj1hbV79/tAxbxKVRj1EqGoMnKmVnM0LcMbtJWwiRhcT3a/+pMK?=
 =?iso-8859-1?Q?U2LM5zTE2xqL5NUjIimJC7Jy3zhpoxyRf6SCzq15sk2jXyyqP9fesBhgpP?=
 =?iso-8859-1?Q?o0iMdC8r0IrdnYkjyogQXKZ6hWGmBbkipXiKDebV6hoEBFRi3Bo93NKrjW?=
 =?iso-8859-1?Q?+wkORimTxths5SImiuhOkDnkUwZGRCL24DkY9I6YbDRdr9A7lOgBIgXv0j?=
 =?iso-8859-1?Q?iHIqqrkodXqADJuXStkaJgh8yBT3VHtJ+SJbqiVuoRW0dm1EWpawzswyBA?=
 =?iso-8859-1?Q?liHQcfCCLRTYTyDJiMoCllysG6Gc2UJ8/m9L4N2T2Oaq6umCXLZV4ew2bm?=
 =?iso-8859-1?Q?kvtzMlpz9OXCXDmPTAejOMZEnyEyEZf31AciDz/ZmYoEDZ0ShHw/vu8H7N?=
 =?iso-8859-1?Q?NjxfETh2Z19rT7M3ISUhFntsYVDpdRSmWJTUHZifmy82lGAuanULGFhrTG?=
 =?iso-8859-1?Q?nRU1Copeivvz3f9hnkyGs/lvgOiQnYXlc0XFWmnhz30LIsYtQ6IcZq+gtZ?=
 =?iso-8859-1?Q?k5BWr6em0UtvoMUGc8c99FE5Wz6uuDecxmNfgNXxxGrxLMQ4DnjhYHw2fm?=
 =?iso-8859-1?Q?2hKKJeAipSZMmBs9KrQdKC1X7xsSDB67oP0ts0f9yQCNT91sRViqyWcU3/?=
 =?iso-8859-1?Q?lCbpkfbmvchfCT42kZpQMnDvRwSxDhslgxWKFWZh86J/sqhgbjhpYpWZAn?=
 =?iso-8859-1?Q?yK3lLQfxWlRWv3pNWO8jOElkejfJCgfS6Ol6EkZj3b3kKBx0MWLzekBCYU?=
 =?iso-8859-1?Q?6efJhx6Ho5vHIdw2NCpVh8BNvS2uDKTNVxNFhjB6LiLJ7U2Q/hUkjo5DjG?=
 =?iso-8859-1?Q?Bfy3aPsAGu96zXrilKwzKcMi85gQoTytBbInvvL3FJBVwOeGAf0q7Je4MW?=
 =?iso-8859-1?Q?xP/55ASvMNWjIDfZcsb8rMslKKjx0qUpUxBRW3A4k65F4jHiGaIRpehrMw?=
 =?iso-8859-1?Q?VwUKnK+aHy2EM9kXOwR6wdSSQz18bZnsrtktjm20PpThjmZ6UKRyOAOiCR?=
 =?iso-8859-1?Q?oIBdEmMeBRVPsGZnTEdZ8yub8Rz2fe3B1bqys2HOUYB4tdOW+FSGKGlv6q?=
 =?iso-8859-1?Q?s4dvBaFmvZsYKajHeVqzFB1R/nepk0utE2p8/CTZS5tI3YsGhE1KwtIeSU?=
 =?iso-8859-1?Q?Ijh6GW34i6GU/s4+/FUZIikKSxQySToBumq60hhdCtOGgRZjdridhRSP8m?=
 =?iso-8859-1?Q?6dSI2m5bjoP44b021AOOIivOhJdEuuC9cw+H0y0bnfczxBwfpnA2/P4+9V?=
 =?iso-8859-1?Q?unCSv4jjt6dyBBXliBvHccLWKQbthdx1LH?=
Content-Type: multipart/related;
	boundary="_010_PAXPR02MB768047479061D2A85A63A2B5E4469PAXPR02MB7680eurp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR02MB7680.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc42491-50ce-4231-cd5a-08da965bb6d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2022 14:16:27.9795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33440fc6-b7c7-412c-bb73-0e70b0198d5a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RSJPlEiFTMRH0OvWgvx7Y1NS1ObKoVcy7fd0mzkYEEX2A6hIgrvH7gkeTlTcL4brzhN6lJrGMcVGqeSrhawfCmZKWdoyG2TO3qiIKLYKP/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6059
X-OriginatorOrg: atos.net
X-Mailman-Approved-At: Thu, 15 Sep 2022 11:04:43 +1000
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

--_010_PAXPR02MB768047479061D2A85A63A2B5E4469PAXPR02MB7680eurp_
Content-Type: multipart/alternative;
	boundary="_000_PAXPR02MB768047479061D2A85A63A2B5E4469PAXPR02MB7680eurp_"

--_000_PAXPR02MB768047479061D2A85A63A2B5E4469PAXPR02MB7680eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

I would like to set the Status/Health of a target directly that target is n=
ot a sensor.

I saw HealthPopulate, composed of 2 parts:

  *   getAllStatusAssociations like all_sensors =3D> linked to a rela senso=
r =3D> not interested
  *   getGlobalPath =3D> cannot understand how it works ? Should I add this=
 interface to a dbus object, and the magic appears ?

I would be grateful if you have any example !

I apologize for my French, do not hesitate to ask me if my question is not =
understandable,

Kind Regards,
[Atos logo]
Francine SAUVAGE
Team Leader - R&D, BDS
Atos France
Mobile: +33 6 21 43 11 21
R&D, BDS<https://www.youtube.com/watch?v=3DP5g8tSWkCkU>
Avenue Jean Jaur=E8s - France
atos.net<https://atos.net/>
[LinkedIn icon]<https://www.linkedin.com/in/francine-sauvage-consultant/> [=
Twitter icon] <https://twitter.com/fsauvage>  [Facebook icon] <https://www.=
facebook.com/Atos/>  [Youtube icon] <https://www.youtube.com/user/Atos>  [c=
id:image006.png@01D8C853.AC14BA70] <https://github.com/frsauvage> [cid:imag=
e007.png@01D8C853.AC14BA70] <https://hub.docker.com/u/francine78>




TT: [Thursday - Friday]





--_000_PAXPR02MB768047479061D2A85A63A2B5E4469PAXPR02MB7680eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:inherit;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:571309897;
	mso-list-type:hybrid;
	mso-list-template-ids:1935558618 1029613974 67895299 67895301 67895297 678=
95299 67895301 67895297 67895299 67895301;}
@list l0:level1
	{mso-level-start-at:2;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"FR" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I would like to set the Status/=
Health of a target directly that target is not a sensor.<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I saw HealthPopulate, composed =
of 2 parts:
<o:p></o:p></span></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 =
lfo1"><span lang=3D"EN-US">getAllStatusAssociations like all_sensors =3D&gt=
; linked to a rela sensor =3D&gt; not interested<o:p></o:p></span></li><li =
class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 lfo1=
"><span lang=3D"EN-US">getGlobalPath =3D&gt; cannot understand how it works=
 ? Should I add this interface to a dbus object, and the magic appears ?<o:=
p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I would be grateful if you have=
 any example !<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I apologize for my French, do n=
ot hesitate to ask me if my question is not understandable,<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"168%" style=3D"width:168.62%;border-collapse:collapse">
<tbody>
<tr>
<td width=3D"1120" colspan=3D"2" valign=3D"bottom" style=3D"width:839.7pt;p=
adding:0cm 0cm 0cm 0cm">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"168%" style=3D"width:168.62%;border-collapse:collapse">
<tbody>
<tr>
<td width=3D"1637" colspan=3D"2" valign=3D"bottom" style=3D"width:1228.0pt;=
padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:7.5pt;font-family:&quot;=
Verdana&quot;,sans-serif;color:#1F497D;mso-fareast-language:FR">Kind Regard=
s,</span></b><b><span style=3D"font-size:7.5pt;font-family:&quot;Verdana&qu=
ot;,sans-serif;color:#005493;mso-fareast-language:FR"><o:p></o:p></span></b=
></p>
</td>
</tr>
<tr>
<td width=3D"21" style=3D"width:16.0pt;padding:0cm 15.0pt 0cm 0cm">
<p class=3D"MsoNormal"><span style=3D"border:none windowtext 1.0pt;padding:=
0cm;mso-fareast-language:FR"><img width=3D"70" height=3D"24" style=3D"width=
:.7291in;height:.25in" id=3D"Image_x0020_11" src=3D"cid:image001.png@01D8C8=
53.AC14BA70" alt=3D"Atos logo"></span><span style=3D"mso-fareast-language:F=
R"><o:p></o:p></span></p>
</td>
<td width=3D"1616" valign=3D"bottom" style=3D"width:1212.0pt;border:none;bo=
rder-left:solid gray 1.5pt;padding:0cm 0cm 0cm 18.75pt">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.0pt;fo=
nt-family:&quot;Verdana&quot;,sans-serif;color:#0066A1;border:none windowte=
xt 1.0pt;padding:0cm;mso-fareast-language:FR">Francine SAUVAGE</span></b><s=
pan lang=3D"EN-US" style=3D"font-family:inherit;mso-fareast-language:FR"><b=
r>
</span><span lang=3D"EN-US" style=3D"font-size:8.5pt;font-family:&quot;Verd=
ana&quot;,sans-serif;color:black;border:none windowtext 1.0pt;padding:0cm;m=
so-fareast-language:FR">Team Leader&nbsp;&#8211; R&amp;D, BDS<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:7.5pt;font-family:&quot;Ver=
dana&quot;,sans-serif;color:#005493;mso-fareast-language:FR">Atos France<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ver=
dana&quot;,sans-serif;mso-fareast-language:FR">Mobile: +33 6 21 43 11 21<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:FR"><a href=3D"h=
ttps://www.youtube.com/watch?v=3DP5g8tSWkCkU"><b><span style=3D"font-size:7=
.5pt;font-family:&quot;Verdana&quot;,sans-serif;color:#0066A1">R&amp;D, BDS=
</span></b></a></span><span style=3D"font-family:inherit;color:#4472C4;mso-=
fareast-language:FR"><br>
</span><span style=3D"font-size:8.5pt;font-family:&quot;Verdana&quot;,sans-=
serif;color:black;border:none windowtext 1.0pt;padding:0cm;mso-fareast-lang=
uage:FR">Avenue Jean Jaur=E8s&nbsp;&#8211; France</span><span style=3D"font=
-family:inherit;mso-fareast-language:FR"><br>
</span><span style=3D"mso-fareast-language:FR"><a href=3D"https://atos.net/=
" target=3D"_blank"><span style=3D"font-size:8.5pt;font-family:&quot;Verdan=
a&quot;,sans-serif;color:#0066A1;border:none windowtext 1.0pt;padding:0cm">=
atos.net</span></a></span><span style=3D"font-family:inherit;mso-fareast-la=
nguage:FR"><br>
</span><a href=3D"https://www.linkedin.com/in/francine-sauvage-consultant/"=
 target=3D"_blank"><span style=3D"font-size:15.0pt;font-family:inherit;colo=
r:white;border:none windowtext 1.0pt;padding:0cm;mso-fareast-language:FR;te=
xt-decoration:none"><img border=3D"0" width=3D"15" height=3D"15" style=3D"w=
idth:.1562in;height:.1562in" id=3D"Image_x0020_12" src=3D"cid:image002.png@=
01D8C853.AC14BA70" alt=3D"LinkedIn icon"></span></a><span style=3D"font-siz=
e:15.0pt;font-family:inherit;border:none windowtext 1.0pt;padding:0cm;mso-f=
areast-language:FR">&nbsp;</span><a href=3D"https://twitter.com/fsauvage" t=
arget=3D"_blank"><span style=3D"font-size:15.0pt;font-family:inherit;color:=
white;border:none windowtext 1.0pt;padding:0cm;mso-fareast-language:FR;text=
-decoration:none"><img border=3D"0" width=3D"15" height=3D"15" style=3D"wid=
th:.1562in;height:.1562in" id=3D"Image_x0020_13" src=3D"cid:image003.png@01=
D8C853.AC14BA70" alt=3D"Twitter icon"></span></a><span style=3D"font-size:1=
5.0pt;font-family:inherit;border:none windowtext 1.0pt;padding:0cm;mso-fare=
ast-language:FR">&nbsp;</span><a href=3D"https://www.facebook.com/Atos/" ta=
rget=3D"_blank"><span style=3D"font-size:15.0pt;font-family:inherit;color:w=
hite;border:none windowtext 1.0pt;padding:0cm;mso-fareast-language:FR;text-=
decoration:none"><img border=3D"0" width=3D"15" height=3D"15" style=3D"widt=
h:.1562in;height:.1562in" id=3D"Image_x0020_14" src=3D"cid:image004.png@01D=
8C853.AC14BA70" alt=3D"Facebook icon"></span></a><span style=3D"font-size:1=
5.0pt;font-family:inherit;border:none windowtext 1.0pt;padding:0cm;mso-fare=
ast-language:FR">&nbsp;</span><a href=3D"https://www.youtube.com/user/Atos"=
 target=3D"_blank"><span style=3D"font-size:15.0pt;font-family:inherit;colo=
r:white;border:none windowtext 1.0pt;padding:0cm;mso-fareast-language:FR;te=
xt-decoration:none"><img border=3D"0" width=3D"15" height=3D"15" style=3D"w=
idth:.1562in;height:.1562in" id=3D"Image_x0020_15" src=3D"cid:image005.png@=
01D8C853.AC14BA70" alt=3D"Youtube icon"></span></a><span style=3D"mso-farea=
st-language:FR">
</span><a href=3D"https://github.com/frsauvage"><span style=3D"color:window=
text;mso-fareast-language:FR;text-decoration:none"><img border=3D"0" width=
=3D"17" height=3D"17" style=3D"width:.177in;height:.177in" id=3D"Image_x002=
0_1" src=3D"cid:image006.png@01D8C853.AC14BA70"></span></a><a href=3D"https=
://hub.docker.com/u/francine78"><span style=3D"color:windowtext;mso-fareast=
-language:FR;text-decoration:none"><img border=3D"0" width=3D"17" height=3D=
"14" style=3D"width:.177in;height:.1458in" id=3D"Image_x0020_7" src=3D"cid:=
image007.png@01D8C853.AC14BA70"></span></a><span style=3D"mso-fareast-langu=
age:FR">&nbsp;<o:p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal" style=3D"vertical-align:baseline"><span style=3D"fon=
t-size:13.5pt;font-family:&quot;Verdana&quot;,sans-serif;color:black;displa=
y:none;mso-fareast-language:FR"><o:p>&nbsp;</o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"684" style=3D"width:513.0pt;border-collapse:collapse">
<tbody>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm"></td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><b><span style=3D"font-size:7.5pt;font-family:&quot;=
Verdana&quot;,sans-serif;color:#005493;mso-fareast-language:FR"><o:p></o:p>=
</span></b></p>
</td>
</tr>
<tr>
<td width=3D"605" style=3D"width:16.0cm;padding:0cm 15.0pt 0cm 0cm"></td>
<td width=3D"515" valign=3D"bottom" style=3D"width:386.1pt;border:none;bord=
er-left:solid gray 1.5pt;padding:0cm 0cm 0cm 18.75pt">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:FR"><o:p>&nbsp;<=
/o:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal" style=3D"vertical-align:baseline"><span style=3D"fon=
t-size:13.5pt;font-family:&quot;Verdana&quot;,sans-serif;color:black;displa=
y:none;mso-fareast-language:FR"><o:p>&nbsp;</o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"1057" style=3D"width:793.0pt;border-collapse:collapse">
<tbody>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm"></td>
<td style=3D"border:none;padding:0cm 0cm 0cm 0cm" width=3D"373">
<p class=3D"MsoNormal">&nbsp;</p>
</td>
</tr>
<tr>
<td width=3D"582" style=3D"width:436.15pt;padding:0cm 15.0pt 0cm 0cm">
<p class=3D"MsoNormal"><i><span style=3D"font-size:9.0pt;color:#90ABDC;mso-=
fareast-language:FR">TT: [Thursday - Friday]</span></i><span style=3D"mso-f=
areast-language:FR"><o:p></o:p></span></p>
</td>
<td width=3D"476" valign=3D"bottom" style=3D"width:356.85pt;border:none;bor=
der-left:solid gray 1.5pt;padding:0cm 0cm 0cm 18.75pt">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:FR"><o:p>&nbsp;<=
/o:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal" style=3D"vertical-align:baseline"><span style=3D"fon=
t-size:13.5pt;font-family:&quot;Verdana&quot;,sans-serif;color:black;displa=
y:none;mso-fareast-language:FR"><o:p>&nbsp;</o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"684" style=3D"width:513.0pt;border-collapse:collapse">
<tbody>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm"></td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:FR"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PAXPR02MB768047479061D2A85A63A2B5E4469PAXPR02MB7680eurp_--

--_010_PAXPR02MB768047479061D2A85A63A2B5E4469PAXPR02MB7680eurp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=3376;
	creation-date="Wed, 14 Sep 2022 14:16:27 GMT";
	modification-date="Wed, 14 Sep 2022 14:16:27 GMT"
Content-ID: <image001.png@01D8C853.AC14BA70>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAEYAAAAYCAYAAABHqosDAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAywSURBVFhH
7VhrcFXVFf7O854bYh5ETCAkMTQqFKroIBaKztgBUQEHUStj62Napq1ax451HG0tx0OrlRkVp0Ct
2pb6aKf4mmnFN3ZKa32gVKtgrICBhEsgGBIk5L7Oo9/a595wExIHfthf3TNnknvO2nuv9a1vPfY2
Pc/D/8eRCJjDgeL2TxqFA5nLEKISehgcIRPqOnTkYeMvXk1baiRg3VTz8VzjYq5xHGUC6KaOMHzO
q2/7+H/lDHdzIonjxk2kvqdBiyZC06r510cQdfLddqq1E/B3wGns9mo2Zot6DQsMejIVQHgvnONG
I58BomiwHYYGmAmg/2AFarD8c4wcByO6C2YZAfIBwwJyh/ZS/gsHxk3VOUDiWxhtXokomA7dcPgA
mh6rq9Pf4vNI92EkP0Vm3xPu5s03eVOmKCIMDwzSRMLpISgOAt/mYpQrAUf+FbA0bYGbmrnSq3+9
fwRwMpTLIwopz/1i7h36otnidjefwD0egGkvoo7FfQdvKwBp1EswsMvq0P/ZqbjsiQity5Tc8MC0
N+7HhH1XwM8kERkrYRhfQZAnykRcGUlQhEmacSbQeQbXea24q1s13caWfRVI9wRIkk+gYoynGEg+
oV7hpiZVAj2kTzKe5vQc8Gp6ucHh4XZX8Xt1NUO1y+1ougp24kzqcJDgboee3+TV73pvOIDd7ukJ
ZLtWIjFqEXLpWF9ht88oCYM2KvFpQSHqgGYCl4hti3q81mUKqRGB8WZszPHjRnfn+Ckw9fGxUUQ4
9A/wH1qj2eqdZdsE75JSYNC6ZxZ069coqw4p43DjMWRdDExAyugRQy/9Y6JhgKmKymbQV301anrf
HQC3o3E2dO2H8PELN9PcAEN7EFbSUaHoU7VI/9TtnLABueiXXlPb3wcB1L/3fBj6N5AnEAKKkD3I
vcSN7oeT20Jn9CEjEZFMkjFrYTpnq/kh6OnDY4RQKghYxtWwnGq1iUFRP1rF3c6Cac6GT5TF2Ei7
gNRdRs/2xLOMCtjJk5RSIR/x1ECOorxpjyXzxipRYWBWojAqk59km4ktXbcj4dyKfLoNZnoTAVzN
9RykxSdknwoB/XjqQ4fk55JNy3Fe2V1ea2vsbU07l6HBdRmxwpQg+y76tW96Le3dQxjW6+5u0rl2
/Dp7aIAtIzJGKSkVBeHcGHUq4+f2w9ceg6l1UbHZMcpkgq6fhP5gDoPmCfXOFzQkYUtiG5K01Xch
o7IgBiYMMzCt+OXmPcthj7qJv2lz7hk4yRpkwnMV42REVEZjLRFwctzDMMthOz/DK+ly92H3NrYe
Eb8zfItbSBhHfZjWewC9A2/VP+7SpRq+/+jHXKdKKMgU+lGpxOcxZgZDYrJihiga+G+Rtv9heDEZ
4zMaVaGyul3GEty/wJ006SnlNV1/G35wCbM+ATLqualHA2qUrArH4G6+e1O5PwyoEEundrDV7Wi+
BpZ5k4p3SfRh9AHxrSV6jQoY0xaw3qEz7uPvG+jprykmC7imdQuW/P5DYOej1K3AXHECv2vmTGyp
WuHCudOr37OnaLy3bFnkRnXXoStpY+weAzVjjzaUaJyR0AtJSzz8tFq0vO8jZCo3MOYXIMcwCJSz
5+LFgxPQhG3sUTr5+xnlle66BmQYFioBy1CJeINX3/5iqXfIznHMPUtjZhIYYaIJGhGOZjozBkDV
ta3euB1rWYpfgW8+rKqOGG85GkH/KZM69+1/lYDdELNRymBkUO4HzFez3VTTY0RyHdp7PvRm9PoE
KgN51BhMqeEbvBQNgjZXLSwb+P5uOpgJDJDq4aYq1xGQBYoBklBNewxD4gJ+XllqMDJJ6YcKjUPx
i1Y+SCb+cTEZ0KyqSMyM95HU/o1+fQas0tAPVS6iQfvdbVXXIln1ZSbkiTE4dgsddTnKah9Heu9z
7MHmKcdJKhAWmjabO/1Oyt6Mpup3aMN6fljH6kamHTmGD6UwOQ+mUac8J8kp8J8nE3Ydnq4/z3e7
YNjjY8aQCYa2iOH0K4bTkZ3ycDsX3nGOjlT664W+qNB0Rb/zanb0sCJ1E/g0ncO2QRI9TnG3Ndd4
LW3dXktvF417iA67b2B5Xb+A3etvydRrkTFWEayLVFhKKBZzm2FWU+85tG0O393qdrb8GblgJdPE
v0rVPAIY1T/omK/yii/9ipSN6I+lkwQkd9eJT1OpGxUoKtHq07D+4JmoB/PHMYz1KKPuLSU5KA1b
j0uwg23IaK1kxRnKMDNxMpLZi/nlN/EOwT/IhjT1KJSWqIXHmaRX09rhbp60GNWHroJmfZvKnc7Q
p0G0R9YJaJJUOJ0gWfY1zOTz3Y7GW7yG9jVFzY9kTF85exfMipMgJ4f5Pv4znRNb2FtQXo+YWHME
r0zJqLQhSdgpRy6cz1/HBoyTsZhkC4apXJSGn+5VIVPT1u2mTnyWRrCJVBXOJHtud/c2b/Jq29j3
WN1k0iE2moX5XGd3powwp70prYxLPMiz0uOoHH8OovSFDKWZDC2CxJwkuktEZPlYCVZgezVLf4fX
sJMhNlzna1rnU7BSdbZqaCeQPXdz88E0UAuXRI3qiLV5TID3ePWtyrCjGhmHC6X7lQfVGgTcSo7m
XHapav8H2dMs5rtTVM6wnCay+BkacTOdI13sKNVZQ85BPG5kdg86nnhTpKHZ/gIFXmC/xfJvTGX4
L2ZOvILVks4lMFLd7FFJAvVdhvZfpboOYgyzPZNbeKlSUDwkXaM0dgNVpcRU6ULjrjLuV4SiunEa
osxXKTWo6gwCSDqG0tFDhlRhK4E/jeyU/RxWpnMowuZOEm1bJ0v5jdDya2GV0WGSoK0TKbOWG7Ny
aQ5LO/emcBhtJRDClGGHMJAfXpXHTY1/EoG+hmE6TrEnrq4TuWuCrkkPCaXELNLt1Lga8VPo7+Wz
me+kvS/W3HjTiAcfLRIKn8XvlgLTMjUCdOkAMH5eYxI/PE8d6AZ3faR84HY2v8zNFnEerzPkPBZ8
hyV8LUHZrcBpaHuJobyEOqxCoqxWNXcaBTW9XoWDrCt4a3hlJFCGvmc1eplh+jwT8ZLDDSRDtadH
IzBDD5HaQlLVVGEk7XToL/fqd64YaTO3ezHzw5vr6eVz4jOMhEJ4Ho0ar6pY3NHG8SZ4SJ8S6FP5
S/U5AyPEOkS5HZSfUOhLJpMZq6W6eDVxU8bE+BSbyw+4wI+IwOV82GAWOmLRNZdphcYQS9VVIkzM
hm2/69Vu/WRE3VN14wgkSVCMDjlqkIGTMzlpaQYYw/irpvYsY3IEkJY8yxjPPv55HvBq/pRnrD9E
Cp9NrzGhEQPDakA+P4fz1mDymE/wYVc3WcCyLnSV7lf7ntvZtBFhdj3aG0Oe4hspez03rY0rE70v
MW85C5HVmtiU3Q+U/ZMn8EMw/YPs1/5G+XkEuUIFpYR0wPKpRUtVf5NqupEn8RV0VCcdtJHe3UjZ
VoZpJ8wkE7tfRV7yVgBXqtBXZVzOYNIQYp3X26vQNtXdRYZ5BSFvuPQWFWvq+iXK8CB9ORd/nd4f
VOOLYJHec7kgk1k+z4rFEzdBVYVLu47zqpDaxxCJ/kBjZe24ChjWCZR/krX4NTR0BTx/TSVTauM+
ReZTThdwpDzbp9NRjyBMd7GD3s992QmzGMgQEA02gxJFQXYZu+mnuOep/HWbcpLkDk1fyEUXFnJm
nnlJUBgFvTiPP2U/dejsex1Z/ZGibSaFJ8AqX60Eiidh6UtMcxLDaSUn3EHhYYERAFBWcRHSn8We
Vkqq8jeNVWQa+nt+gvbae9DYNR+JcoYbQ1QdPHmbZto8iEo7IAbSWzlSOAqW8mOWutyBRLIy9iYB
EzAFkAHwCjeI+Qwv0/I/Z5gVm7wFCmRVQQmy7FVMabpQC/LEOoq+Fi/5ROccjxG+f73XsmvgBE73
WnnmFMm2sljcf6u6wVY+TrgjZnl+6yeYTMy0rrTW+DmpvbJgJHc7ZOUVPNZ71OJSgsJ7ZEmwclCk
goHvIzQ2MMzuZw+xTnam598iUNdx3QspS5ZI/BcSrLrOCLqRyz6HKLvKa9j1dtHLVPUBnoneh+5f
xPXP5jNBFQaJAMlvyrbCvqGEhraJ4K/Fgdwab8oeevfwMLHP+Qhj/FnI+Kwg0uqWjJDaONmdg94N
+qG7NIDnI7/0QBMDyzYQjq7mFi7Ml9DgFWTFTHpnMr8Ln7czZt6A3bPJG9s7cBHN0H2D096g/Mlc
+iwY2amU57lLO0BU3iOab1Fm61C9JMfw3bPyMAmzFzJPRmDxbsj/En0+hmsIlXgzEPGKQX8f3R2t
qs/hyXDoMFku5Q722LrVwiqF2/6jvtimPG/QIM9RjZL1eSo+tlEASewa2TZeiow0/gvf3KOtecFl
pwAAAABJRU5ErkJggg==

--_010_PAXPR02MB768047479061D2A85A63A2B5E4469PAXPR02MB7680eurp_
Content-Type: image/png; name="image002.png"
Content-Description: image002.png
Content-Disposition: inline; filename="image002.png"; size=663;
	creation-date="Wed, 14 Sep 2022 14:16:27 GMT";
	modification-date="Wed, 14 Sep 2022 14:16:27 GMT"
Content-ID: <image002.png@01D8C853.AC14BA70>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAIXSURBVDhP
bVNLaxRBEP6mH7MZZpKQxDUQUIKERATfKIgX0VM8mJsIPvDuH4h4COvNkwchd0EvnhTFiFdxQYnx
QTTegtmNj4jJktnHvHbH6p4Zlh22Dj1d3VXf93VVjcCdF49gWnPwW9BmMFo6yT5vXBqI4ypYeKHE
VjYFuLwK3+/GsxhgnNLom7cOgVrODLzmYTBQchCGgwNCPr1+Go2gjcuPl+G12wRg9GePQnUeqUUg
amNybBjnD4zp4PFhCz/+1lP2/vnZqYDk+PZrF/Ovv6MVdlD51yBckhcSO92B1Ggr0F6IHjTtcQr6
/NtFSEkxZ7h4bBxDpsC7Sg1XjkyA0RMefqiguk1FNbv5Ap0Yo5bA0o1TCKIY9t1XuD97CNN7bLh+
hMFCwnbt6AROPHiDFsV3ZdNO+SEtNU8XA9ut5Pt1q46Xa38wf24KB4sOju8bQXndVZXS1vuIFDIr
9K3nq1hZruLM5Chmp4vYa0vqYI45X1NmJG3yqICwTbiB7gx1r7d9fZkzMJ5K4LkkqqCm18kKT1Kg
Y6rJIjLVooyJZFpSjSwFKzAl22uKhXsLhlCZARWrvLGDXS/Sd+83a1pqXckVHF+ojUW7gK1GoCfP
2fg4NQOUaUik3GkGOLv4Ni0hw80nn5LR5oTsmLi9tJb4itkeQn3/yfVLpZJLfW4/gxyYQ5z+VYne
BCh7a+YLmhC/+RMFrKrr//fjuZXP4ZXnAAAAAElFTkSuQmCC

--_010_PAXPR02MB768047479061D2A85A63A2B5E4469PAXPR02MB7680eurp_
Content-Type: image/png; name="image003.png"
Content-Description: image003.png
Content-Disposition: inline; filename="image003.png"; size=624;
	creation-date="Wed, 14 Sep 2022 14:16:27 GMT";
	modification-date="Wed, 14 Sep 2022 14:16:27 GMT"
Content-ID: <image003.png@01D8C853.AC14BA70>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAHwSURBVDhP
jZPPaxNBFMe/szPZbNqmjb+wBipCwNqjJ0EPnooKQsWz/Re86NleeyqeRBBPxWsPIhW8eKkgohYK
Cq0iorRBi+2mMdnd7M5M35uEmKSH+JZdltn3ee/7fqy68vTTDemPLZs0PmGNxjATnoTw83smSe4o
WLFiTRZYnQFCDGPBfkKr4/SyooSUgWnFDrT2KB9lBpm2KOQ8F1vSg/2FUoGymqR2MibagHMHynMK
mqnBzKkCysUcPlYboDjQlMGSF3OKnTgjH92/PInnm6FzFHTNVsaxdP0slCewU29hvdrE4loVhgCP
EjqYLUotpk8GeHz+HJ582MXqlxA3p0sOZCsXfaxu1dBoGRQ6yrowK/8etnDxzCjukYK7l047Nb22
9qPe1xcHM8hSqiQtpebkpHA3femy9UST9BS+O29bNzM36dnGHm7NHHMSB+3FVujgUiCPwlzbAUVf
eL2DB1fLmJr4F+DzboRH735j1G9PoS+z7Qx47kIJ1yoTXZBH9eprDQ/f/kKT5jRC6nq70KmZBk8B
3m83EEYaLwmICPy2n7ibSxoEXc20YbBZ5uZWI9lvfv6lZaA1oL7kqTnj+XaNfX2nRLRh4A2LPT9w
K8oBRnJD9psXxA9g0iRWEPa28NSykOr//ipJiKf+QMTzhwar2PjRdxjwAAAAAElFTkSuQmCC

--_010_PAXPR02MB768047479061D2A85A63A2B5E4469PAXPR02MB7680eurp_
Content-Type: image/png; name="image004.png"
Content-Description: image004.png
Content-Disposition: inline; filename="image004.png"; size=530;
	creation-date="Wed, 14 Sep 2022 14:16:27 GMT";
	modification-date="Wed, 14 Sep 2022 14:16:27 GMT"
Content-ID: <image004.png@01D8C853.AC14BA70>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAGSSURBVDhP
jVM7S8NgFD3plzRpq31bdHHTQYouxUUQZ10VXHQTRKSzo3+gu7jo4qCLiN10UsTBQlGHWqiCgyjY
gkrFNubhvUkVoU31QPg+knvuOfcReWr54MIn/BnL1NENtu1+lSSA4kHxBdkhGk33bQdYlo36xyeE
T6IQCXRAU21KoGZkR7EL0STywvQwxkdS8Cs+FErP2M6XEVB1yN2svpNidn4Ui0T+hqYKbO6XiAxv
smnaiIZVzEwMOryrSg3503tUXxsIaq6mp3JDNxAMaI5Vxu5RxbHbnwgi0uMHN7CNzE3l8IFkCPEI
eWshFQtgbCgBRRZ4qTepcVI72TQtaJqCjbVJJKMaZOEqr86lsTKbxt7xLXI7l466p+1wSCEVl8gQ
lETQWaOaWyNvJ/M8dcNENneGODVsfSmDUEDB1uENToqPDrk3qHRuGC8CN6NYriJGZIPKYNw9vOH8
+gl9VLtCLljd0zaPgx9OxlD9wnHAPfC0/VPkPy682+i22x1zUF0+WQXvdoEuf/5Vv5MwkXlftu2C
5gLVKzUAAAAASUVORK5CYII=

--_010_PAXPR02MB768047479061D2A85A63A2B5E4469PAXPR02MB7680eurp_
Content-Type: image/png; name="image005.png"
Content-Description: image005.png
Content-Disposition: inline; filename="image005.png"; size=623;
	creation-date="Wed, 14 Sep 2022 14:16:27 GMT";
	modification-date="Wed, 14 Sep 2022 14:16:27 GMT"
Content-ID: <image005.png@01D8C853.AC14BA70>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAHvSURBVDhP
hVNNaxNRFD33vZeZTEpTUhRpIXVR6N8QdeHCdUUoooJSCf0NLlyI4tqPdRYu9QeI+hd0GQoqtFjB
kEkc6DSTmXe9N5l8WCse5jEf95x735x7n+OtrTDJ+KUF3RiyrzIg19kggEKioWe8Hf3q3ne9oX+x
6tzdOM//rSpzadYhc63h3E6vfs46Itzql0KWO0YjwHupr3uQJYTJMkClIsuhJzx5u+mY2bIE+OQE
VK/Drq8DSzVQEADWAkUBzjLg+BjF9yPwYACqViUvw0lKjzQ1dnMTy6/bsBvNSaXTEHJxeIhk5zaK
zj4QVVUsu5OslcuXYC9uzCXTLU+/SELbbCK4egXpp89zscbNauOPWunzV7LFPqK9FmhlZRajhvDK
fowrj6FmLIB/dpE8egjfi7H09DHIlVQxbIr5k7q8ALpwHstPniFq7c6FGl/gzcRaYRFR68Hfpqk/
cV8MnYTGYqrVMPrwEcWXOzBiGmmLToGlZf7gANm794DwSzEbRBGKr98wuHYdZm1NkkWA9FmTqAjS
Z05T+KMf4CQRpyMY7TOBcmIOfBiOCUWnIxOm0yVTNoX23UwmjIQnfGjUCa0ts3pPZxvi6MzVM/5Y
O6S/K3zERd523dDsVbLChWS25VQF/z9VJkvy/E1s/e5v6x7I+ZCd+icAAAAASUVORK5CYII=

--_010_PAXPR02MB768047479061D2A85A63A2B5E4469PAXPR02MB7680eurp_
Content-Type: image/png; name="image006.png"
Content-Description: image006.png
Content-Disposition: inline; filename="image006.png"; size=600;
	creation-date="Wed, 14 Sep 2022 14:16:27 GMT";
	modification-date="Wed, 14 Sep 2022 14:16:27 GMT"
Content-ID: <image006.png@01D8C853.AC14BA70>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAYAAAA7bUf6AAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAASdEVYdFNvZnR3YXJlAEdyZWVuc2hvdF5VCAUA
AAHPSURBVDhPlZKxamJBGIUvIjayRDAaoia4xi2yhYig7CMoyRMESRkkTUSxEmyynVX2Aax9ArEV
kaiIhcRtFQXtVBQ79aznz3WiWbnsfvDDeOaco+OMhk/UajWk02lEIhF4Ly9luKbGvWOoktVqhcdE
AmcOh+HQQ+8+UkIxGo0eDR0beveLpCTx8CCbtzc3aLVayOVyCAQC+LE9BsftciGfz6PRaIiHXmZ2
aM1mU31DKpUScbFYYLlcyprw82azkTU9Oz+zRNv/H9rttohGVKtV5WeWaKFQSATX+Tn6/b6IRgwG
A/EywyzReF4KwWBQhH+BXmaYJZrH7RbB5/NhvV6LaAQ9X71eyTBLND4kCpxSqSSiEeVyWfnD4bBo
WvLpCY7TU5jNZjjsdtRfX2XjGI16Hd+vr1VJMpkUXet0Ojj5cgKLxQL7tsRkMsFqtarrI5VKBU6n
U4V30+12ZV8e2+7uf7+9oVgsIhaLodfriYHw6m0220FBNpvVd/USwpfov7rCcDjEbDbT1Xfm8zku
PB5VcB+P6zvvqBKSyWRwtv3Z3/x+jEYjXQXG47Eq+Pn8rKsfHJSQXy8vcpzJZKIrwHQ6RfzuDoVC
QVcO+avk/wH+AB6TTgm/9Q5CAAAAAElFTkSuQmCC

--_010_PAXPR02MB768047479061D2A85A63A2B5E4469PAXPR02MB7680eurp_
Content-Type: image/png; name="image007.png"
Content-Description: image007.png
Content-Disposition: inline; filename="image007.png"; size=656;
	creation-date="Wed, 14 Sep 2022 14:16:27 GMT";
	modification-date="Wed, 14 Sep 2022 14:16:27 GMT"
Content-ID: <image007.png@01D8C853.AC14BA70>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABEAAAAOCAYAAADJ7fe0AAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAASdEVYdFNvZnR3YXJlAEdyZWVuc2hvdF5VCAUA
AAIHSURBVDhPrZLLaxNRFIcn1dSg0J2gf4VuFNSFSxVBorRuimA3bqoLqQvRvbhxY2Jr0sTiwo3E
B4JpGkN9ER9QKYo0EdI0aZpMMpPElljbksfnvXcmMVZBF/7g8DvMOfebcx8a/0F/hYy8X+F8/Cut
Vsv+As2fqVIHIptkrSm8IbrafupZhWOTJk2Rd3F+0W+TXBB/3Xs/R3/U5NDjAu4pg+MR065CvdEi
kql1ppGuIDLJf6uTrG5w5W2FE08LDL8qMzClc3baZDBm8KW6zpLo+VBaQwsW8X1eURCpziRX31Xo
C6Q5Oamz/0GegViZg48KaitHwgZ7QjruWJVZY52tgRy7gymORipcn122IOHsKiPxMu6wztC0QX+k
yNBzk9PREmfsSQZjJc69LHNtpoJrNInmz9IbWMTzyYbsnMji8GXYEVig1zePy58Wnla+zQ6XX9bS
aL4s2miKGx+X0cX2pBRkXyhHz1gKx805HJ4EmnAVHtvtcHrn2OJb4MDDvFosJW9RQS6+NqzxvAkF
2Rw93qQAiFz6eJa4/l09iUZTcSxIQtxKXzCDNjavQM5b1qJ29MiJbmfYfifH3YR1K91vRkGkQqka
u+7paOM5tEBexFLHneKcDj8pEV1cVb1yC91SkPangjioiWSNy28Mhl8UuRQ31OnPmBtq/LW69ao3
qzPJn4r/JvgBYIEli4jlAtMAAAAASUVORK5CYII=

--_010_PAXPR02MB768047479061D2A85A63A2B5E4469PAXPR02MB7680eurp_--
