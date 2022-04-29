Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5407B5155F9
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 22:42:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kqkv30mYrz3bfb
	for <lists+openbmc@lfdr.de>; Sat, 30 Apr 2022 06:42:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AiZME0Ul;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=przemyslaw.hawrylewicz.czarnowski@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AiZME0Ul; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqktX4JX4z2xBV
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2022 06:41:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651264916; x=1682800916;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=iqFzysgpmx/niEXjFB3aHRaSVPO1fKi0NU5paBaGRDI=;
 b=AiZME0UlrUDZeaqJckNJpJHWInK7m/gV8Cs6IJtkYYlNRf+YXzuAby8F
 ojJ29ZHETbxYVPI+0LRbIFTlek7G5qOUU5akIQDB5akXmaRjqDU77w/dr
 LRhbJWGnFHRICiF6oP4eh+WGmcPtGAxPrHjyomAK7VlxISeRyzz0hUnaF
 TAl2lBoTyQ5+n9+P21m8TTCDxeRxUKWD59rxKB7VWDRGP1hkoYQeAEg4b
 a5wkG/jEgxzWjBTrVL+kLURdM+b0WRe+OlPzUFNPfrVcqLvnC1nwZMFnK
 tUOMkWALrTAhWBorB/WZG2LV0u9UDoqnqQwTBijBa/oX7WIw2UamZO+dp Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10332"; a="264352462"
X-IronPort-AV: E=Sophos;i="5.91,186,1647327600"; 
 d="scan'208,217";a="264352462"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 13:40:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,186,1647327600"; 
 d="scan'208,217";a="732265382"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 29 Apr 2022 13:40:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 29 Apr 2022 13:40:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 29 Apr 2022 13:40:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 29 Apr 2022 13:40:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 29 Apr 2022 13:40:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyNJp0Q/cMYqg49HU94Bfva6iP8VHUTW5gzEyB77kg3OetLmMxExaS73h7HaJVGL0mWUSTm2c9hxLm6rgVN8Yc/ZCH6dn95Ql00s5sGBOOPfx512Zwc/PRWsdsxm/v9zxPhRaSJn+BUb/N3uNy+JH0Gwsxm8mctTaAFBGw+yUYsN31YQzrGGJjC7Y0jT4IfZYJVpfwjCpVCgs75TJwjrMQeuijiBnc2w/Rb7tsUpV7uxJLqAKFz1PS33P2e7v/awKdJtOxWsGUnbxGTtjMzdvae4y7PecJmmMTZRtGjoCQRItRJAtXSh1VKDyB+4LZzdsHQkJPPTVIUi1gWm2mDW4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fpotoc8aea2IR0vl8ADE0+WcnTy01z5x8UyehNYRGwU=;
 b=cBK4M4Ep5eLied0uHYOzMcS21SxnRO/mH+akLSk1dvhrnpvskor/B18eL9uCYrTqDzJzdiPCnGX2uF6Hw64B/2YRhbxby4eHIZWGR8Oh81G+qvY1qZvvihz0QLWWRaKJaU5vvRshl6N+OQ20XpGF4s27DHrWDUEJuEYOC16IAhoFMCqjDxlIe5T4SezLS5CcyzZ0x2pVNrXTW/zSIpLaGvBwZGoBaQqCVEBvvR75IJLMYeGjGp/SXFKp1pmMShk/qQ9Ig4qu9hENB8EiECN1aZKi5WMCJT9h7PMfaLFVroOk689dpL+BRw+SOr95LA1Pt4aa/Nolnlj67HpT9/G3mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5247.namprd11.prod.outlook.com (2603:10b6:5:38a::20)
 by SN6PR11MB2912.namprd11.prod.outlook.com (2603:10b6:805:cb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 29 Apr
 2022 20:40:49 +0000
Received: from DM4PR11MB5247.namprd11.prod.outlook.com
 ([fe80::dd26:ff:61ab:852f]) by DM4PR11MB5247.namprd11.prod.outlook.com
 ([fe80::dd26:ff:61ab:852f%9]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 20:40:49 +0000
From: "Hawrylewicz Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Ed Tanous
 <ed@tanous.net>
Subject: Virtual Media upstream status.
Thread-Topic: Virtual Media upstream status.
Thread-Index: AdhcCSidtWfW5zwbSAm4k5MjLblAWw==
Date: Fri, 29 Apr 2022 20:40:49 +0000
Message-ID: <DM4PR11MB5247C11F5DAB40B354BE4088B9FC9@DM4PR11MB5247.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.401.20
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d534f46a-5212-435a-5c11-08da2a208b93
x-ms-traffictypediagnostic: SN6PR11MB2912:EE_
x-microsoft-antispam-prvs: <SN6PR11MB2912F3E383B3DE0159AE44C2B9FC9@SN6PR11MB2912.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B6fKis8Ti2KYK25Q13ymfEqEkDQiGxoVIU9YtjG6nR8x/2gxze8u+zmCG4RnvpMkSx3+Bd+N25MZCDGIpMiYeEdcQoIfruXWqbi8gCl+UAhNgkNJqjys+A6SUpFUn/iHAypIuLYuT1328d6ARWvw404BEXZi+euzanuosoWhzZQlbhYZMyZzIKdk3ufzBA+VJoesfsN98tRd1QKlQ89r2NrQ690i3lQcB7mkn9aUdYXfek/1G93s5bXDw282flfA0DsX+nmCK7BopULThV75+Z1DL6FNNh/t34SXs2rxtfrud9ggHA21vwudI4BKunatwENaP7g4GsnRE4NmrVsb7TSAcDhvIhYq28clqVVPlscQwuuSq1d80NnowKqjwXOtTR4xLzrB/vaBcVU9P97Ksgs9b/pJZAiA29V6rmjZt+S8bjVsMfUilBThevhaJ9IZZRVsHiPMpDgib3f8KC84zjbU2t2zO7TYltrrNYgBjNfiDGSVDCu0f+a25k3YcJea0f7FZ7jmaBtDbiEphwl564p2ikrz9NNVMOPWf5SKM1N/ZOQ7b9tOx7UTu+3+rH6GpwTtakP1o03AzSRQGqWbnaN2/FLpHOzvryolmQ8EfD+gbUxOIJ94Gxl1BhTGNT6NyL+V0L+D7lvOYkNPdb5L9QtFVji+8KBb4JIrD5Puoxb3Is5vX8RAPgZzxyV5ve0YdcrluC/W7LaN3jANjjK/5tpJesFTpUO/Tohi2WBlUGQyfJmNQV7RZN4LU4VZJUaG2wdjiH57cx5SX7XMLKrk6ml5xk2bIZzGG98s9yYLg4U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5247.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(55016003)(122000001)(26005)(7696005)(9686003)(33656002)(110136005)(4326008)(166002)(3480700007)(66946007)(76116006)(66446008)(8676002)(66476007)(64756008)(66556008)(316002)(82960400001)(52536014)(83380400001)(2906002)(508600001)(6506007)(38070700005)(38100700002)(966005)(8936002)(5660300002)(186003)(71200400001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?miYlKyNW15COtO5MUVzCOB6BcRwAoXEF8OBQneQgMoxhKu4xlXwMfY5rK6Cw?=
 =?us-ascii?Q?zaIZ+Vfd9zwBHv6JS+A8MpZGNF2bTxE6izHQHwo3CFVDWXA70OR1zG4ZCIRK?=
 =?us-ascii?Q?zJYAPwnC0sR2PE8KEsPDSaDLC9P8B8tKDBIzeNdGlPwBmgu7cwb4f982hrbR?=
 =?us-ascii?Q?BtdPdfRIvqEKjcu6Cs6KTCOT2szn/q940CTpg3gyEzdFvSkKB8Xw1HTlgiok?=
 =?us-ascii?Q?HcAFcxHsfS7Zw+T+LOeiHT2mCgbY+wEXjkHLkvM3v3GYCGp78xO3MmLJdPDu?=
 =?us-ascii?Q?d5HCInsgqxyGRZrxFNIm43TClpHfQuVLXpQfnel8vZwxUZu/1E/8Aw25LLsD?=
 =?us-ascii?Q?vAsTzr9hLxpFb2Ci6qUlHbGfFAvKP5f/XaOhSM48fzhFQZQgfBAr46naqjNp?=
 =?us-ascii?Q?AoJWhAPIgJjfx2fNLcs7AtQbmtpg6BHV9Q79ifuhXTCZTGk7v86P2e1y5lhb?=
 =?us-ascii?Q?FNtvvfsCnITQazqIcQJTLQnBZ06YWlQjZijKOR+sikG7dmQs1RxGYWK/kacI?=
 =?us-ascii?Q?ckrxkxkKScdJm9dbw7O6AJ5cycaJ5D0iABDUBHWsP3iwRASOQE0eU3bTc2aJ?=
 =?us-ascii?Q?BPvztpYGqtk8WgHJjngSBurNh8KEUf5nnUZWlJokFLVXNgtBQWBUSVHXjCNM?=
 =?us-ascii?Q?674I3bRsUE/uSFuoEoqK28kPNPrOY/FXxnC/NGG4+lQ7GuEurK00xAW75ZlG?=
 =?us-ascii?Q?S3xq9XesEqH28+2DA8UhbxkLxo57PspFy4r1WjpMIC/eEhpv5BCefi9HB2w8?=
 =?us-ascii?Q?KKPKQcQZgr6FiB6XvGlv/qimk/wBFgeaz+FVz9qlkQwluA+8cwmleTcIkxGy?=
 =?us-ascii?Q?+ATjSzP7FerDB+wG7yxAYQKqhjoEdBwc+6UaJgkLZ9kcWoFM2TQSoxJEv6iF?=
 =?us-ascii?Q?vROcWrITQX//cS0CEjyUE/qvnNCGOgKrX/3Gbvxi6v5k0wqq2RVRu2tCubkO?=
 =?us-ascii?Q?JiBo4vi7XPUi1VtEast65bLNH+4mXMuxVLMhmcCu3uSIwCGTK6CwpSMqebLm?=
 =?us-ascii?Q?I56f7+5o6I2IJScZWX+vGgo2COwz2cMouIh8Ij5A7RGjPs/NuaDLSZiwNurZ?=
 =?us-ascii?Q?6tIfL3cZ0MOuyDX4zSt3E7vOoOJJIHnfW6cIfYWLzbgs5/tWli4K0o8+A4oX?=
 =?us-ascii?Q?MqjfeKjrj/b3stAi8UC783yysg76xsZumuwlA0qI+/xkNjoI9SjXtWaxI4bK?=
 =?us-ascii?Q?ES7P/NnUs6aYFF8bNPswdtxBbHpol8bd+abMwQPt/u+g53VefG8mc0c8xa8P?=
 =?us-ascii?Q?N6gwYpBrTkBsQ/pHXBfZsb0vk9/kMoW+YqJQaAWLnh44/+qRSt0vUUosRYdi?=
 =?us-ascii?Q?TAFHTuvC2TZaSW4Cu15zckczgdDU/G4l3iPX6JFdKbRX6Jhawko5mGfbp2EC?=
 =?us-ascii?Q?+4WSwbgQtN/7UeisYN7u4QoE3xcTP6CtGmLo41C1s41oU7X0jHkyDjAdpj4F?=
 =?us-ascii?Q?YF03vqRjJum7nAqIFToTI2N+ln0jZ2lXbPTjKdU1qzLKC4eukRn3k8mJ2M5R?=
 =?us-ascii?Q?i7aZdSOXJPKl+JClZFmBrMz+HEzJjWQiyR7tB48+h48uZS+Di3MAzRrU8YQj?=
 =?us-ascii?Q?W3L4NgxcCo+icv5F+yvs3Q+129VWqah1awW5B7d/Nyshdklnt+BEWratnGN/?=
 =?us-ascii?Q?9I0BJ/2PX7YJ6WRgvfioi9GZ54yzUThn9XV7hIdXkFkKgwQB4cd11wMHCuyT?=
 =?us-ascii?Q?fLlCXUc8rbCKjbCqmyLrPLpJbEagyvjbJ0VIexlloM0R+I/MYeZI/Yd0fzxE?=
 =?us-ascii?Q?Or4eZsPZyYB+PYbAUoyDwKvdZ/Y6i/KBd9ck9jdQihE8VWh3ZvPztjs8E1D6?=
x-ms-exchange-antispam-messagedata-1: 4eamKw6MHpEmIQ==
Content-Type: multipart/alternative;
 boundary="_000_DM4PR11MB5247C11F5DAB40B354BE4088B9FC9DM4PR11MB5247namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5247.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d534f46a-5212-435a-5c11-08da2a208b93
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 20:40:49.4888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d6QA6GvN2Cml3wWmZ8sZNe0iOrrQw4dVpd/s623FpU+aNMH231i6r7sIH8cxODfAjANqBF8gkLX9dxyxC6fdZ1R7O/qsMEyCBw3gb8qZSrxTKmOXc9ZyUPh1NckS9GdyvcvL0GW5KAkbnMlIX0eaKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2912
X-OriginatorOrg: intel.com
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
Cc: "przemyslaw.hawrylewicz.czarnowski@linux.intel.com"
 <przemyslaw.hawrylewicz.czarnowski@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_DM4PR11MB5247C11F5DAB40B354BE4088B9FC9DM4PR11MB5247namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi.

In response to Ed's request, I started this topic to discuss upstreaming ac=
tivities (to both existing and new code). And to make update seamless and e=
ffective.

As service upstream is little stalled waiting for UT to be completed (almos=
t completed), I wanted to attack the problem from another surface. I've pus=
hed bmcweb patches as it got old since first submission.

There are two blocking problems I am aware of in current nbd_proxy code. Fi=
rst is that compilation fails. The second is a race appearing sometimes dur=
ing disconnection. But those are the simple ones.

There is more to rework for redfish part. There are two patches
* Make status of InsertMedia action consistent (I29d53483) https://gerrit.o=
penbmc-project.xyz/c/openbmc/bmcweb/+/53343/1
* Apply async dbus API (I1d016126) https://gerrit.openbmc-project.xyz/c/ope=
nbmc/bmcweb/+/53345/1

First one addresses simple problem with inconsistent responses from rest ap=
i calls connected with actions. Proxy mode does not support InsertMedia act=
ion, but is implemented for legacy so response has to be applied accordingl=
y. It has been fixed with some code generalization.

The second one applies latest design changes (https://github.com/openbmc/do=
cs/blob/master/designs/virtual-media.md, dbus communication part).

Those are must-have changes to work with the service state we upstream at t=
he moment.

After service upstream is completed changes removing nbd_proxy option in me=
son has to be reverted as the last part.

No more activities are planned now from out side, but later on we may focus=
 on adding privileges support for websockets (AFAIK it is not supported on =
level of web server yet).

--
Best regards,
Przemyslaw Czarnowski

--_000_DM4PR11MB5247C11F5DAB40B354BE4088B9FC9DM4PR11MB5247namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"PL" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi.<br>
<br>
In response to Ed's request, I started this topic to discuss upstreaming ac=
tivities (to both existing and new code). And to make update seamless and e=
ffective.<br>
<br>
As service upstream is little stalled waiting for UT to be completed (almos=
t completed), I wanted to attack the problem from another surface. I've pus=
hed bmcweb patches as it got old since first submission.<br>
<br>
There are two blocking problems I am aware of in current nbd_proxy code. Fi=
rst is that compilation fails. The second is a race appearing sometimes dur=
ing disconnection. But those are the simple ones.<br>
<br>
There is more to rework for redfish part. There are two patches<br>
* Make status of InsertMedia action consistent (I29d53483) </span><a href=
=3D"https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/53343/1"><span la=
ng=3D"EN-US">https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/53343/1<=
/span></a><span lang=3D"EN-US"><br>
* Apply async dbus API (I1d016126) </span><a href=3D"https://gerrit.openbmc=
-project.xyz/c/openbmc/bmcweb/+/53345/1"><span lang=3D"EN-US">https://gerri=
t.openbmc-project.xyz/c/openbmc/bmcweb/+/53345/1</span></a><span lang=3D"EN=
-US"><br>
<br>
First one addresses simple problem with inconsistent responses from rest ap=
i calls connected with actions. Proxy mode does not support InsertMedia act=
ion, but is implemented for legacy so response has to be applied accordingl=
y. It has been fixed with some code
 generalization.<br>
<br>
The second one applies latest design changes (</span><a href=3D"https://git=
hub.com/openbmc/docs/blob/master/designs/virtual-media.md"><span lang=3D"EN=
-US">https://github.com/openbmc/docs/blob/master/designs/virtual-media.md</=
span></a><span lang=3D"EN-US">, dbus communication
 part).<br>
<br>
Those are must-have changes to work with the service state we upstream at t=
he moment.<br>
<br>
After service upstream is completed changes removing nbd_proxy option in me=
son has to be reverted as the last part.<br>
<br>
No more activities are planned now from out side, but later on we may focus=
 on adding privileges support for websockets (AFAIK it is not supported on =
level of web server yet).<br>
<br>
</span>-- <br>
Best regards,<br>
Przemyslaw Czarnowski<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM4PR11MB5247C11F5DAB40B354BE4088B9FC9DM4PR11MB5247namp_--
