Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BADAA3B8C6B
	for <lists+openbmc@lfdr.de>; Thu,  1 Jul 2021 04:49:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFjMx4tPvz30B2
	for <lists+openbmc@lfdr.de>; Thu,  1 Jul 2021 12:49:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=cErEYX0I;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=88169fba27=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=cErEYX0I; 
 dkim-atps=neutral
X-Greylist: delayed 389 seconds by postgrey-1.36 at boromir;
 Thu, 01 Jul 2021 12:48:44 AEST
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFjMc6X04z2xtl
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jul 2021 12:48:43 +1000 (AEST)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1612WZ2G025202
 for <openbmc@lists.ozlabs.org>; Thu, 1 Jul 2021 02:42:09 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by mx0b-00268f01.pphosted.com with ESMTP id 39gqvnat4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 01 Jul 2021 02:42:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ay7T3SYlFc9e+eW3S3vBgb/vPivVJ1EaH4JfaDUy2c3p2O74tNt9A77xr68MAGhuT0hzspprV5qIT4gC29JwkE+JpDl75JuikJGoVzZHPSdKsb6clFoaEEvybpFJdRLBgHEtoFnfyGZ8dCiQGRLHNQeS5Is4UEQnO8/YY0MKnYm2kC64mc113MCniZTR4auuYsXwKCDpmcM9EtP0lr3QzxVMNeG2GLQfR4qHXv5Zf+ZivusdhOiVN/v7bPIEGZXSFexpe1xQ6cDp65cs2KErStSKlyhC3qpRIjbU3f/GhQBzgIcpG4PwIsvZqFZh++tydxpSohEOQ7Qn2CGRuSB9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynB/75jrpRjBV9vL7WJvi2H8mvUOesWndOXXfMFBkw0=;
 b=k4YTP8F2/k4IHLCcHUbm0pVqxsDaUVSFg18ub6wy/YDu3M7h7+QfqSDupcRQfKp7zdeStdBAJfAnnH99yA4WGeFl9hfIXu/LAtpVApZbZc09L2WxFu07+URc9ZkmJ+S19bpi5QTNJlviF+h7ttGWj0LA6IkTbcsX2mqgQCa2RRC9o7MY0jMzJlcd2K11I47xSQtRMPZmFFr8dDVtAW6DmbnM1SFLIp5pUrqFqqmqktLLze+FpMNRLajbbnkmM7XDuvnZOfDuVJsVpQas3OSoBcWTNk7MdyHSVLobrSaoPAWe7sENBvb7BJ5F2P0Df3ntAepIyibXNjKULFsYk6pFlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynB/75jrpRjBV9vL7WJvi2H8mvUOesWndOXXfMFBkw0=;
 b=cErEYX0I4uHV0StyL9037lghmo6tB5h15Y+cZm+c7Ao66iX4RGU4aN5kiT0z7cpHApXTM/jcetA9fwS5NLyezh/o7ss0GXc7xFc3tjMX6k1xfLfgfF1kobS3xbxGcgsNitQ5lZqsD8h3s8QKzjjTODEbrHOVF5aAy2fXgnZrEHw=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM5PR04MB0300.namprd04.prod.outlook.com (2603:10b6:3:74::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23; Thu, 1 Jul 2021 02:42:07 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::e500:d29e:8a54:6303]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::e500:d29e:8a54:6303%3]) with mapi id 15.20.4264.026; Thu, 1 Jul 2021
 02:42:07 +0000
From: Zev Weiss <zweiss@equinix.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: U-boot version selection
Thread-Topic: U-boot version selection
Thread-Index: AQHXbiKuM/tNElKriESXH2Sam3v34A==
Date: Thu, 1 Jul 2021 02:42:07 +0000
Message-ID: <20210701024206.GH8018@packtop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08561972-c743-4617-1e07-08d93c39d177
x-ms-traffictypediagnostic: DM5PR04MB0300:
x-microsoft-antispam-prvs: <DM5PR04MB03001C554D4DDB205585376DC3009@DM5PR04MB0300.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AAx4jakUMXEj1NVLjZ0Cg52NsibmMlppA6h7NQxS29e7O77MG+vlsCENB/VtKVJb+JBCF4wEOHjaAAMhObqYLzoHhagJHj+02sQI/ctR+9/ULKZI0HgEPEASudt/2FgUg4UuwElVFxAoR5jcQVNg8K23hvJkrhOWlhITvRabCyV1iBaIGvaOqjGTNP+wcBbvbEktV4qyrzqwpoZ3krBxUj4abF/RdmBzj3RBMe07cVUO8onzVYJmd/eA1ee6Qixn+JCCM5oe4tdpB6BRIyYd7RYC5j8/ChxJPgJNF5vVucLCffJLbzlwsnohZMpw0hkYXGCt/eDkSZH2WTo4caJ3/PcgdKOf44s/XfnX7QAadoXUKfxog9VLInA7zD6D2JKV4YiNg7Ixe3uMBemjQXQzjZs9pQearmtk89N0go3tZeO27toTtAzcRFi/xhAsZ1H9w04LGvAPoTOFn8nJkwA+aSzbLRIkuWfniyI8lVKhtTBCl1kYVqgPJmT+IAknbHTel/DaDAFkgFWRqtTbOEPpEu39hRjnE9gn7bGnIulPrKcW+bXZb1Pli55rSxGC0PNUejhHCNS94z7Ug3nxr6MIyD+syRQa+5dFZyCK5o02Zs4cLmTY8HOFz2lX9U2D3D692CXMY6FzJJGS1E8hpUgEeh/XfgjbyjiteeQbrgQkWw0FRgX4MyJzuh/aUkcrSZccibgULbLVSh2v4NjLZG11IlCJlM4elAx+zAs1jZQngI9G8F01AnW/SM9X8lfOfggkDbnXvVzjvrfk2lYvCbJmRQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(83380400001)(4744005)(66476007)(66946007)(76116006)(64756008)(66556008)(66446008)(122000001)(33716001)(2906002)(38100700002)(186003)(9686003)(6512007)(71200400001)(316002)(1076003)(26005)(86362001)(6506007)(3480700007)(5660300002)(8676002)(6486002)(478600001)(33656002)(8936002)(966005)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3LuEBc5Qv1GT5srj4xIwvzXIGwdj9UCj8XLu4vTu5hK3N1kVdngaEbeh8brl?=
 =?us-ascii?Q?+xLm3g8+CdKWIYA81pg/sMUxLbVf7YRpTiaMt+16TPvKXjqLIDKEcfLWtH6k?=
 =?us-ascii?Q?/Y2JcmI2zeFsH6bzUenzsNjf0qOjxEFFIVdRTIQs8OTklu7rrxXzDvIrQIpJ?=
 =?us-ascii?Q?lCWSTiOLG21j/CWgD104qEzX4DpYcG4Dy5jB6sIOrwEnFfI+MJfzhwVPUcGf?=
 =?us-ascii?Q?dn1S4vkNt85PG4FM+0wKF+vr477pr5rD0JGwd0XrfD2LSD9hzWp7s/kEPK2Y?=
 =?us-ascii?Q?z6t/N7r5k6vMzao+lkD6grtbCA4HQ2IaQXsPE1pvYPiuzBF8oL62ZYoaQP0B?=
 =?us-ascii?Q?K4HSUe0iRlyfxXFqMwgC30eocdtbbu0xIxHdzPNAKBNqJ4YE7Lj85N9v0ek8?=
 =?us-ascii?Q?YFKXq0XHqmeQX+mp64cyMngiFmAkOaGInmhpu70NMQmENZbWD7uhew+tMU5d?=
 =?us-ascii?Q?TOADFr4sQjEZoYNorEXcUxG9GYbZlOoJQXIuL0BvTQFNHn/c5DquzUeuZUVy?=
 =?us-ascii?Q?OJxD8rkKi5sJUkc692LpSQ9XNgxWhVJXSsWOKwYG3nrmticM+YeIbBnuHHfz?=
 =?us-ascii?Q?CKoNnElrRsQXFK+l3l3+aO4XThVnBxGK2kPEkUPPukyA+RiuoW8VDoho7133?=
 =?us-ascii?Q?Vq2nu/BkHlxkENfCKMmrWxcjMlSRO1AjCjcQfwpkPrQWcwpG8AEM8te8ImtC?=
 =?us-ascii?Q?eU8Coy7SLs7RqvlNAlw2lfOBQak4b7BwWANPZcE5dDyStHIMLX7FggfCHTKu?=
 =?us-ascii?Q?79DonOlkRCx/UP2Uo62U+IpWTv1YoV7me/9NIm3hLZFyT6o1/HyFSuJYm8DP?=
 =?us-ascii?Q?cQ3GTYmCCa3UvOVvk5Z8wSmXhYxSdp7voPK/vPE2zc6XyD2r2Sg1ZG1ibGM4?=
 =?us-ascii?Q?PLsMnWRfJt/bR+pMfUH/8c84kxOFIPLi1bSWnlrS2bYzu1Vk6qRbUa5HajuC?=
 =?us-ascii?Q?iUjv1dc50GfVeJgDHtlTUj0TVv00iMb65i7TGdeZaSN+rDX6Ns0fUAVoHWEA?=
 =?us-ascii?Q?hOXw73plsCaP3sILuI4JG8BQg5zzlXuECWTNsA4/EAso/fNu2crqFFXwsYqI?=
 =?us-ascii?Q?KdpPUdwDDCVfrcEdSWeyze/tBZmYGrWYsGS6yM+2yLYdmUkr2HmgYVtZkFDN?=
 =?us-ascii?Q?Uo3wEXfnugoZRy2iS2T0g3OlXncjjxQFHROv9x8R78U5zp0PqAOWN0PXtdml?=
 =?us-ascii?Q?/SutVejOled5w82oi14E94iGx20YcYz5UApHPZIEZHMtg2DKkKeLkckgOwc5?=
 =?us-ascii?Q?in0KTuNTRLeHqXnHP9CmZcY7GCZLK8AEzddoLVjw0GZDBJmns5uEp4u6LLnB?=
 =?us-ascii?Q?wyQWrgwxOoINnSmHmVelyhwPNVZtsf0G0IpCDyfmDVehMg=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B82F3FE9936BD849A618FE6FD68C15D4@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08561972-c743-4617-1e07-08d93c39d177
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 02:42:07.3103 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R62zGkGgyI/aIiVly8LMnCNZKVR5xXgkxH9S0I0iparDk1OEIG5e35LOBoGGVROeqOgAI5TgKTiTCD05oTu1vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0300
X-Proofpoint-GUID: KH9nou1tNmG_rpuy4BamfBVNugg58w6A
X-Proofpoint-ORIG-GUID: KH9nou1tNmG_rpuy4BamfBVNugg58w6A
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=889 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010016
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

Hi,

I recently found myself needing to make some tweaks to u-boot to
accommodate a new board I'm targeting with a larger flash part, but in
going to do so I remembered that I'm currently using u-boot v2016.7,
whereas new development is strongly encouraged to use v2019.04 [1].

As far as I know that happened entirely by default (i.e. I didn't go out
of my way to use the older version), so I hunted around a bit for how to
override that to use the newer one, but wasn't able to find anything
obvious.  What's the recommended way to go about switching that for my
board?  And do we want to consider changing the default to the newer
branch?


Thanks,
Zev


[1] https://lore.kernel.org/openbmc/CACPK8XfcTXsdSviy1WGdXgkrHYQR924bpst7ze=
eK0bxT5MOTAw@mail.gmail.com/
