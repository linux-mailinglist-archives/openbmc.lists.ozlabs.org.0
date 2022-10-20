Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0E0606B05
	for <lists+openbmc@lfdr.de>; Fri, 21 Oct 2022 00:10:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MthcH24kCz3drV
	for <lists+openbmc@lfdr.de>; Fri, 21 Oct 2022 09:10:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=atos.net header.i=@atos.net header.a=rsa-sha256 header.s=mail2022 header.b=WKTaWain;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=atos.net (client-ip=193.56.114.176; helo=smarthost1.atos.net; envelope-from=francine.sauvage@atos.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=atos.net header.i=@atos.net header.a=rsa-sha256 header.s=mail2022 header.b=WKTaWain;
	dkim-atps=neutral
Received: from smarthost1.atos.net (smtppost.atos.net [193.56.114.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtLXX4kQNz3c4N
	for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2022 19:35:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=atos.net; i=@atos.net; q=dns/txt; s=mail2022;
  t=1666254957; x=1697790957;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NvsDXBrKOLA/OKYE9KubMqes7cOwOTLgCiSQ7cEm3no=;
  b=WKTaWainLIcAvaaCuNfiZHGGnZqf3L6qgD/o1UrXBFZXnPVDS+4LyExb
   UfJv7zxjCuC2/DAfSrnBHQ++Z2+/t67hX4VSvL6GJjdss+1Z+0YOzfxfa
   gF5Wmk3EV99efI/sx2X0e7Mmo34/H8PdRbVueiHkCwHEQecv0/mlAc9K3
   AlzYx2A68ShAsCDgBHPlN0TG/xze3x/1K8VLvAAqmaoI1bOcNwubh/+Zn
   gfhd2bL0oNFXfh1KBPeE1N+ezAO1swThGerQf0pJjv2Xy8WJhMIsZ9gtK
   +qaKlWLrbtNVQfTc3nkmMHM4pIkunnG7UK1gTRkR+UjY5Y2rkZF7P+2uT
   g==;
X-IronPort-AV: E=Sophos;i="5.95,198,1661810400"; 
   d="scan'208";a="332144656"
X-MGA-submission: =?us-ascii?q?MDHzelaGuZBHdr/812pYhp/kcQ1xxM+oEfys7B?=
 =?us-ascii?q?16BxbuknZdjGhcFjpxSHVjgPkY/gcJ3iapuBBEHEBiBY3pvQJLbYjxH/?=
 =?us-ascii?q?94bRt+NinnVwgGTtNFlEYLeKJL3Mp04y3KFzia7b1ObmvZp+kTGnxRhB?=
 =?us-ascii?q?SF?=
Received: from mail.sis.atos.net (HELO GITEXCPRDMB23.ww931.my-it-solutions.net) ([10.89.29.133])
  by smarthost1.atos.net with ESMTP/TLS/AES256-GCM-SHA384; 20 Oct 2022 10:35:48 +0200
Received: from GITEXCPRDMB21.ww931.my-it-solutions.net (10.89.29.131) by
 GITEXCPRDMB23.ww931.my-it-solutions.net (10.89.29.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Thu, 20 Oct 2022 10:35:48 +0200
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (172.16.214.169)
 by GITEXCPRDMB21.ww931.my-it-solutions.net (10.89.29.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Thu, 20 Oct 2022 10:35:48 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRigHrcBq81LNu5AbBVdb9kGXIBJJrl5YyyKzOy0uouWu4gVazNTwgU8Bd2X/nyKWQh/nymZ8iDgxo5TcBIC0s41e/W+jTwSoO2y3vPiC202bLg6rgff/OElZ/ULMXgX2sG+f9Ixd9wbqg6m744xl842edAscAhIQVOz92pLWqxq2ZcDD72hyQmKmTWvQxYL6busr2HrT9xSK6iXZXx22XEJEdYkeSqQjfn008BSKEbwchd6SNMIliXpaBqEFMJ7m9EBxlpVce4X9ewTFrhf0U6TnRRCPBQPw5axGhlddIxTqk7DCWYODOODRbCYcOAqXoEyyau8napFhGOQY03oBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvsDXBrKOLA/OKYE9KubMqes7cOwOTLgCiSQ7cEm3no=;
 b=nKAUdz3WUz01BzKMOJbVAqAgn61o9WGqOflJsN45bUxNbV0DjeeyeykrtkqNRJkzPE/bKotDGFOZ/qhsY9DHjIYL8rmOFC6ed1bUqbFd8Mai2MqPrKK8TtMEOpomws7K9odjVEN/aYF93VcqvFyMEGhxG92rL8+e4ziKcadHp6xh8YowWuY2COkmmV6XKBd99F+zPTgx23VQFskSue6Bvf+N3+HgtUgEuywHcN5Ufm3iDZRzVJ0SR3rCHmEnexR/anRIx1zRJ+Izt0YBYv44OS4CQqvRxblgkSneABYmxbp2VjI9X8GDqyefy3AWEwJrP3Z3phe3MiWz95kkvvf6Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atos.net; dmarc=pass action=none header.from=atos.net;
 dkim=pass header.d=atos.net; arc=none
Received: from PAXPR02MB7680.eurprd02.prod.outlook.com (2603:10a6:102:21f::7)
 by DB9PR02MB7099.eurprd02.prod.outlook.com (2603:10a6:10:1fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 20 Oct
 2022 08:35:47 +0000
Received: from PAXPR02MB7680.eurprd02.prod.outlook.com
 ([fe80::9105:44af:4934:f5e3]) by PAXPR02MB7680.eurprd02.prod.outlook.com
 ([fe80::9105:44af:4934:f5e3%8]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 08:35:47 +0000
From: Francine Sauvage <francine.sauvage@atos.net>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: compiler error : get_if<> with a variant enum ?
Thread-Topic: compiler error : get_if<> with a variant enum ?
Thread-Index: Adjh/8IAYnQ4mETfS2au9W7IhFbaOgAgaEuAAA+KbIA=
Date: Thu, 20 Oct 2022 08:35:47 +0000
Message-ID: <PAXPR02MB7680EE5542E3508B583D4BDFE42A9@PAXPR02MB7680.eurprd02.prod.outlook.com>
References: <PAXPR02MB768084801092880D4746547FE4299@PAXPR02MB7680.eurprd02.prod.outlook.com>
 <Y03nKztaGeEn1tZg@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <Y03nKztaGeEn1tZg@heinlein.stwcx.org.github.beta.tailscale.net>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Enabled=true;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_SetDate=2022-10-20T08:35:44Z;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Method=Standard;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Name=All Employees_2;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_SiteId=33440fc6-b7c7-412c-bb73-0e70b0198d5a;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_ActionId=b168406e-b47d-40ac-839a-7c5717d13d19;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_ContentBits=0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR02MB7680:EE_|DB9PR02MB7099:EE_
x-ms-office365-filtering-correlation-id: f4bea241-bc18-46d4-2b28-08dab27615f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d6hHz8Hu1kDH7bVM1VOzfqmbIhh0eTr5o5ibjNMNmEpWUmU2y1uvei2XQvOrehkFNjUCi4RUNCUV/tD8Q5VhocO+OBviNCaTsygVVdq2ay4FO/zM4EL81HNWPzsR8yZuo6flI7QyA+2pN0TpULSOl2xF6aAHB7ADBYiAg/FjP2gzeZA+D1bhrdhfQNjqpj+/1AG6XIJvJQTzDQve1ylCrXKX1LVQtoVCdG2JDaKEfF9bFZP8VLBd/pO1iK7/gMsgulZTdFc/omcp8QIJZGsE1aoIAlqrgL6HN3j6EChk2bsltyaM9Fmd/jjKBeX3ihWnwQx3oljfILrOs4ddWyNpvgeYOpZr4e9aSeJNjnhnvJprEML0EUqt3bV7ELN0zIq9yBlNeNsoazl85/wotyuDPIBFJfCULll+dEW/9eqlYagVy3kwMFlWsVOH8+P44oyxIzC+o6N8W6ZLwKJj1TyCEELIC/VFULAr5hCmJ/TU0OGyjpBTfsIs6Nv3v75G29QYhoXlNFsZt9BeFVZjGNDd3ru1S1SuBB8g2Dg97gnC1t9Uf41+hQfJk7OD1RdtlrtQ/Itlk5sBDN/5wFFxwXy4w//Aj2Coh14i83tjamlueaJwWIHNe2rIggJKbC2PImK3B7nLj6tFcNn3KIoVFsc33SbD1KT/IL+aqJk9YFFqTTLStm0OsumyuUtzG7xL19NrWxxVcNP6QCkTwOITPrYQZLY0H7mGSqdh0scD+cVCGCsF/Z0JVd9G3LiJwdMHUteVS8TxepnUfx/+fT8GAmpqZA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7680.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199015)(186003)(2906002)(71200400001)(38100700002)(33656002)(82960400001)(122000001)(38070700005)(478600001)(86362001)(66446008)(66476007)(66946007)(4326008)(64756008)(8676002)(66556008)(52536014)(44832011)(76116006)(55016003)(8936002)(6916009)(26005)(7696005)(6506007)(41300700001)(83380400001)(9686003)(316002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?SAqh9XOKOwn2QfycWWAhteY4lGXKD4f2Q2v6Vws95SwO6iBDU3RAWz/2pe?=
 =?iso-8859-1?Q?VLUkcpyDOu4k30QcpahBTOWcvgu9seMSNi0DTVO4Yj7RL36jIeyKs9HOxb?=
 =?iso-8859-1?Q?1y6decKCnMl1hdVkrfCgaam4Rmb7PjQM42pAvqGZX5vmEB7t5/plJkyFEe?=
 =?iso-8859-1?Q?K6L+/wnZfX6lJz7TQxj5Jftp7ONVJeN2cLIonn7OdTSNbd21ehW6tu4CsZ?=
 =?iso-8859-1?Q?7Hxg4y9lzdiHR+jIWD8IH+P0MubrUOYfDQHoPjXLnGmbRBlDkxhp5T9a3J?=
 =?iso-8859-1?Q?jYTVwVRtzEnooo3Xo8MoVKWFYdIkJEz5ET3s9+//KKeoW+MkRY8m3MXGoH?=
 =?iso-8859-1?Q?c431cKdUhAItQzXZTQCKRwUY5gkPOE1Rs8kbE1/46mgR0cOJPKRbghwZOn?=
 =?iso-8859-1?Q?MC0Db0OgBPk8QXkYv4tbPjL8+8mxgPQbHXOVx9JPXTscwzt9hSWwJ3K4Fm?=
 =?iso-8859-1?Q?mebMKb5pHVsJD+oZ7BnEWKFb0SKe9Uwad5gLc/oxWt2laNyZYE4h/npDKl?=
 =?iso-8859-1?Q?JHPbRx2y4BMlRDKQa6xT/nygDe9EQIcGB5HFIeBFd/bNpz84YHIvX5toXu?=
 =?iso-8859-1?Q?oSRJi/dVApHturkDcwVbYFdmDqdQfPMRzg+f6IsILQ6vLJKKm6Wc/gbja1?=
 =?iso-8859-1?Q?m1MarnoxiVX2vv/3qtMbgXuXsZdDNpMHin3yrerZ13n5Z07ppWjYFavidf?=
 =?iso-8859-1?Q?NmLNEF/gDoYV/Epmcw0fINTr66IxsP7TGuYA4a9cUWUzlHKPfY2T5ohcT7?=
 =?iso-8859-1?Q?Dheq8XYYWM702fi3D5MNAHiIe5i8M8eXdfFUQ2m2cI50c0f+kxbBUskKSs?=
 =?iso-8859-1?Q?gzTl6t+aCXmUiP9gctszHxW9o1qChQijEEL8RgPokZ0rqD4kHmINClBOBL?=
 =?iso-8859-1?Q?UHfSlLjc+cdu1QHRkKro86ocRrVeSeNsjdQtSnnVzEU4ZFiZ3N4JCbDLY/?=
 =?iso-8859-1?Q?xM1E/M2D4Ig5nnsDyueNfvGCM5b/LbGN6zu03/wWFygNIQqYfqmUBHAttZ?=
 =?iso-8859-1?Q?z7tGshkHU+Ivc3jZ0g55Va2fWHALkpQrGedxkEHiCPLSSxIZuGfEh08Y+R?=
 =?iso-8859-1?Q?BidXfu3W+i64X68U+Nyna9LZMKS3Gtw6efLGPFNxYuZbe58/1bUEIxWchX?=
 =?iso-8859-1?Q?h5nYknaPSY6cwb5jOisM3DAdFh2ZuBmUS/F3rqcBR9ZY13q3LUtseNMNNg?=
 =?iso-8859-1?Q?fWZA0ehdqweJbEAqdZWsGLIMyIJkRhCILiZNbYrrHFOEIwtpzsywjraV3y?=
 =?iso-8859-1?Q?8tFmDvJL8sr/3pfmlgufXd6X7QNSuUNwaYZ0Fc2Btkq6NA9cfFvsmiNNGF?=
 =?iso-8859-1?Q?HjeU4WiitojK9n4RPDaZYxBM3jSBFExla+WKcKxiTSxy750OOS0/Hwuk+s?=
 =?iso-8859-1?Q?E2nBP2jVYqun76wowtkoy2PZtg10PZ6PhIsjiqCKS1I0V2ahL/L81Q5Qcr?=
 =?iso-8859-1?Q?921d1fCB5t3ngbW5C2nNyi+EoW4LfaWyYELjnudLuR30uVgcSrzSPJEiwe?=
 =?iso-8859-1?Q?ehrO7X0b/NAJjI7Q/mBZuWkHEBijjWIdKx7DkIQGaHUaUgoq8wj9KSeCFW?=
 =?iso-8859-1?Q?IsYiT8UvoL5K64HLbtwbL7WuNoGNbKH8sV5zBlZWJczw0mqIqxHQ14GOcl?=
 =?iso-8859-1?Q?ErycVay+F9SJYKOhTPStA3JrAOQ3hO7hp93Yi7BImbIy73u9Swd0+FcA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR02MB7680.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4bea241-bc18-46d4-2b28-08dab27615f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2022 08:35:47.0595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33440fc6-b7c7-412c-bb73-0e70b0198d5a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bKkUVvFRWakjP/xQqqSaDDhwXudWyA3iXgvIkVJEdEkI4OSFpxCNGgrXk8y6wSE7Z6WZLK0/oF+kSLxDxZLPpn11TvzFnehodGYhoP11LDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7099
X-OriginatorOrg: atos.net
X-Mailman-Approved-At: Fri, 21 Oct 2022 09:09:53 +1100
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

Hi Patrick,

Many thanks to answer me.

I prepared a mail for 2 days, but ... I am still testing your suggestions.

I included the generated server.hpp but not the generated server.cpp as a l=
ibrary.
It could explain my problem.
I am not able to add my enum (ModulesTypes) in the variant list.

It should disturb the generated mechanism.
So I added the generated library (similar/specific phosphor-dbus-interfaces=
)

I'll let you know,

Regards,

Francine SAUVAGE
Team Leader=A0- R&D, BDS
Atos France
Mobile: +33 6 21 43 11 21
R&D, BDS
Avenue Jean Jaur=E8s=A0- France
atos.net
=A0=A0=A0 =A0
TT: [Wednesday or Thurday(2nd week of month) ] - Friday]=20
OoO=A0: October 31


-----Message d'origine-----
De=A0: Patrick Williams <patrick@stwcx.xyz>=20
Envoy=E9=A0: mardi 18 octobre 2022 01:37
=C0=A0: Francine Sauvage <francine.sauvage@atos.net>
Cc=A0: openbmc@lists.ozlabs.org
Objet=A0: Re: compiler error : get_if<> with a variant enum ?

On Mon, Oct 17, 2022 at 08:13:20AM +0000, Francine Sauvage wrote:
>=20
> const auto* flexible_module_type =3D=20
> std::get_if<sdbusplus::xyz::openbmc_project::Inventory::Item::server::
> FlexibleModule::ModuleTypes>(&flexible_prop_map_iterator->second);
>=20
> ** I tried to replace auto with=20
> sdbusplus::xyz::openbmc_project::Inventory::Item::server::FlexibleModu
> le::ModuleTypes>
> No success.
>=20
> Error is :
>=20
> bmcweb/1.0+git1.0-r0/recipe-sysroot/usr/include/c++/10.2.0/variant:115
> 0:42: error: static assertion failed: T must occur exactly once in=20
> alternatives static_assert(__detail::__variant::__exactly_once<_Tp,=20
> _Types...>,

What type is `flexible_prop_map_iterator->second`?  It seems likely it is a=
 variant that doesn't have the enumeration type in the list of contained ty=
pes.  "T must occur exactly one in alternatives" seems to be saying that `M=
oduleTypes` wasn't part of the underlying variant types.

--
Patrick Williams
