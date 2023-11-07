Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E088F7E7785
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 03:30:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=k7uueDaE;
	dkim=pass (1024-bit key; unprotected) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=DO0GS/nf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRN8G5mz0z3cZd
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 13:30:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=k7uueDaE;
	dkim=pass (1024-bit key; unprotected) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=DO0GS/nf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.154.123; helo=esa.microchip.iphmx.com; envelope-from=marco.cardellini@microchip.com; receiver=lists.ozlabs.org)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPj4D5Ccbz2xPd
	for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2023 20:05:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1699347948; x=1730883948;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pN2iU+gPYyCPEjtjky5ABNwut8MSEX2mXxNdNkP9x7g=;
  b=k7uueDaE+y0usc+E6hRsvDVSknDNLO97TRSK0YCBUBf+R2M5ubhQnprI
   C+Lcj6qD9QcKSVe8T9fwt0yAbIcpLJVPvlWwVR8Mr+T4Lws3Uzrsokpak
   wcFIMNoNGsYPyptHdwb7ewPmtMkxdYSqd0btUAnh6nLxxbtI8qwXMG03M
   FEvoTkVW1vBn4C20EQOLPlkTOqEDDpGbJwIUQcNGOFY2e/Vg+uWDFzjhu
   z1NAxB4KKbh0ipk2aJEUEbcZuOQio/PEd5SEilHNxA8azqLZrIsOoueWf
   mkoz+hcju7Bm/KyzM05Pknst5YdnbjwoGEqz2cesQQr4Y8Ssf5uSfRlLo
   w==;
X-CSE-ConnectionGUID: pVeQ/ctsRBud/5CTwKzmuA==
X-CSE-MsgGUID: Kba30xEiSJ2V9XGsQ45w7w==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="178438517"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Nov 2023 02:05:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Nov 2023 02:05:36 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Nov 2023 02:05:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/skFyQRtecv3Fendzs4L0EcD4jouYoFxyu2+KT07Z/uPlL9Is8IUgwQaUEB+xmYtk8rTxP38VYgP8cyu1T3jsReWPcHvgblThb4obAHSyr0/QT69BNAVuo3CYeqgvSQOnCyppMGNbMTTCkxZxYyedd2vl+CxFTsTAcW5pakz4rrYiXZM17UlC+8RiczkMEYNR6g46kOw7W+TaxZyg+LznXq44qKQr2XA5EUNN31Q5ArbP4u6b2HxkIAyq6pNvAzqxZRbJbZhkzr4HxThbp3inx84uGy2897XW1IhKBHapv0izBuXbT4VyRlFwsltp6/JpPNCL6Zv+iO0vRzoQOYHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIh2w0oDC5eRY/dpNsua3r7zXBWbfn3ct+ibp8XIeoc=;
 b=k5D65y5XT9piigwpyg2S1xIrpYs9lfeLxDPxsEktU5TMGkv0IIhN0BM8RvMBGwruGMmdSBYWCafir+GfmbTZxUq3cl/+60KzG0+qlDr+ArkYj+UouUuNS+DYpqg51LWe2gd6puj4/ThIElgJH5xcryrv2h+qi26/n+vXyf1X5KDr0mFCTmgMVRzZ4FtOUpUD0Ij95gTdqLBRVw0SrC63+/cYUWrgAEPYCDZnGCKpIL4Px4L1MsFE/rALWiyoKtE7eFy0q5lu+8GSLnyzgsKtW5904Ku+5Q7UU5arOC3Mz66R8v/IdB3CG9vWrvr+mjVK/eRM6KJoj9sPP6XOocOyJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIh2w0oDC5eRY/dpNsua3r7zXBWbfn3ct+ibp8XIeoc=;
 b=DO0GS/nfUcuxD7Cht4Cj6YuXEGHmzpLYQXaIM7y+j46xR36pEwk/S5nDBoFOtpndaj59Vmrg+t2w4dcsxjDFQrAq35nKb0z5/vDe8CLd/v95g4fPB9KWJU0Sojl1LeDoYQ/P4PrrwrDMZiGBdBlxhWA355E5xMykeC865Jk+HIQ=
Received: from PH0PR11MB5062.namprd11.prod.outlook.com (2603:10b6:510:3e::12)
 by PH7PR11MB7607.namprd11.prod.outlook.com (2603:10b6:510:279::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 09:05:35 +0000
Received: from PH0PR11MB5062.namprd11.prod.outlook.com
 ([fe80::87f0:1510:414f:d6ff]) by PH0PR11MB5062.namprd11.prod.outlook.com
 ([fe80::87f0:1510:414f:d6ff%3]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 09:05:35 +0000
From: <Marco.Cardellini@microchip.com>
To: <patrick@stwcx.xyz>
Subject: RE: FW: OpenBMC support for SAM9X75 - follow up
Thread-Topic: FW: OpenBMC support for SAM9X75 - follow up
Thread-Index: AQHaDaewtlGOK5Q9m027XMHYz8VJErBnxqAAgAB7sPCAAAAaMIAFrhUAgACnUpA=
Date: Tue, 7 Nov 2023 09:05:34 +0000
Message-ID: <PH0PR11MB506228485FF916211F211F419EA9A@PH0PR11MB5062.namprd11.prod.outlook.com>
References: <SJ0PR11MB5056283972C71AD9B030327F98DDA@SJ0PR11MB5056.namprd11.prod.outlook.com>
 <DM4PR11MB54700AF4648C4A892E0DE879EEDDA@DM4PR11MB5470.namprd11.prod.outlook.com>
 <IA1PR11MB7918002DB77F28F1D584A232ECDDA@IA1PR11MB7918.namprd11.prod.outlook.com>
 <DM4PR11MB54704F112382D43BDFC2F898EEDCA@DM4PR11MB5470.namprd11.prod.outlook.com>
 <PH0PR11MB5062973F2689347ACBB44B369EA0A@PH0PR11MB5062.namprd11.prod.outlook.com>
 <DM4PR11MB547038DD545F8C702FA6011BEEA7A@DM4PR11MB5470.namprd11.prod.outlook.com>
 <PH0PR11MB50623E55C582689F9A7336199EA6A@PH0PR11MB5062.namprd11.prod.outlook.com>
 <DM4PR11MB5470969CC94F9A219F5DFF9DEEA5A@DM4PR11MB5470.namprd11.prod.outlook.com>
 <PH0PR11MB50621C4604EFE68563B3E8069EA5A@PH0PR11MB5062.namprd11.prod.outlook.com>
 <PH0PR11MB5062741391DA033DA8BB240F9EA5A@PH0PR11MB5062.namprd11.prod.outlook.com>
 <ZUlxgh-hMJXl_LMe@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZUlxgh-hMJXl_LMe@heinlein.vulture-banana.ts.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5062:EE_|PH7PR11MB7607:EE_
x-ms-office365-filtering-correlation-id: 435826dc-6f4d-4897-6ffa-08dbdf70b3db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Aay2LsfBNmMh12DjonJw3rJ6jC+87ylzF96ce4aM6QKtvuurdG/mTa0RyDE44hQE5xjhpYAn4Z7nGm0nJZFqo2M2OtZEfaFGWvWq3d83qFC3hRI3shqtxX56VZixqjjdv0qgzctMxskz2Cs++o53HBIivbnkcqLVsr3zTYs+txWIb/E7F0BmcrVlkDfJ2DmLLpUwqXHIc6B2jtxUAMzL9vk+j5xKxRA4Hz03/p7dPvOX3CZen/lwD+IhUaF4ZGcMxdqHfXCdYjQtUKPNAKxOFVwayo4FQ33WSmI3qJekrZ8NLlmf9QqeHC049yp672Sa3hmeVK27vELXCUwWz+YM0BJCH5U42k2nuF/x8EByX5X8ezVl2QThYMCcgdZkYAIEPEWhjc/tlGALvIOHAyVO8KbJt7S1ec6dUUdF3B9VG5JnWJ7nX9aHxFLXh5EkIe3fq5N6IiaZBNIHVWYkHyfUGAprWrSCMOMYFgT8oLSwldhwC6v0qD9H8fEz9hlX0WgiUeChkvFFI8I56IQ9UQeziKGJthVDizY+zDnXYYi8hw9bYRF/agwW85azfnOi6PaFi1pKNSGrd8EbZmd6TTFaI4AGYXkiB1uVhnn+W93BYAr3mdlsirlk3Ay1sOHqh+TaE4vSF7Ai27Zw6TnIpCn+KQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5062.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(55016003)(83380400001)(33656002)(52536014)(8936002)(38070700009)(478600001)(4326008)(86362001)(41300700001)(8676002)(15974865002)(2906002)(53546011)(71200400001)(966005)(6506007)(38100700002)(316002)(6916009)(122000001)(7696005)(5660300002)(64756008)(54906003)(76116006)(66446008)(66556008)(66476007)(9686003)(66946007)(107886003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NrX5a6+tPZa/C7WhIaBWwjVZpVbXvSrDkatbUDrmih01HvVDrAgJqGCFDP0F?=
 =?us-ascii?Q?38IO+8wtVMwryWOQDzp4yVNekSFPSOI3ddwxM9QoI2WLV/JqbjGr26544Mpr?=
 =?us-ascii?Q?HNzhTkSS8Nuuqt5qc/DjkhGKNhs1pZtpVV6gE/0YUbNDsYLrR1YkM55jP4YI?=
 =?us-ascii?Q?ee48eVFPMjPKSizhaDTZGYlbXHMmXI+7/O3TM32aAYFRredUxP6jxpa7sGu+?=
 =?us-ascii?Q?ZdyIDUNhVEfTzBVGtiGWCRpfSa4meapXMoyZF/J9F118wPVgil1PAmxQI3K0?=
 =?us-ascii?Q?Rz/rbZahNLcIj8Al/zgvjn3mnGdHBR1L0Xis6e5ZyZ4x08hYRDsamG1REtSl?=
 =?us-ascii?Q?bueu5jU4StaSEf6eqHAi1VfD3JT0GF5lxFLChK+LnfZimkghIxbusvwPvDdS?=
 =?us-ascii?Q?HqMsD8FMBW+k9ZXm/gp3hW/41CoR2RJS/Kjt5d3iv7SNBfttNH2m2aHh2hkp?=
 =?us-ascii?Q?E8BwsQzE/OB12OBPNHRgmgDYQKVTyon9EPrZZk6eHAKw2jPrZGeuLJoTw13X?=
 =?us-ascii?Q?d0hC/WyABmA1vDKF80lGCj1lTcVrjZmG5cHucHLXv8w8n7Orxc2B78xyv7At?=
 =?us-ascii?Q?zm04y+RDCjfHa/BLJnb7bKjcgAl71uxSynr2GgN23FfX75VOgtc0kTHwiqoA?=
 =?us-ascii?Q?CvsKEJEyShP+hzZiowYeswdNJrHnJ9Sr/5LpTS8ZIsGsLrC80QF+r7P1nL6+?=
 =?us-ascii?Q?AEFewrncT7EZQBw6TzX21SYxmoKTEzlxjqWFUcY8uHa+IH6z+vcdKOXid1vE?=
 =?us-ascii?Q?eTNrd6ZZ8Ck4pxOOFjkbEjP2IEH+DqppTAlLGj/Hfj7SDm2vkxUZcJWHwNd5?=
 =?us-ascii?Q?EQ/sg3SxVOfTN8CzJZy7uG4WBZGcYpp9UtlbbfbzKynDM5CHbNXzJ+sOjK1c?=
 =?us-ascii?Q?Y7B1sLcPQBEE5Un41dnb8CuY8ceF4tXZ1RSWSzWadUT+mq0UD8gPnauQ5yyr?=
 =?us-ascii?Q?Ux/xUsa1FNmImgvxNzctbU0izNbH1AwFi3gxK3Wrc01L1whRg2jViHLrkvvJ?=
 =?us-ascii?Q?TTcE9pcHtBVHLQQY2iNQCj9XM/JI7HNtURprXxBfv+g3SDeVtZrwCFKOB/QD?=
 =?us-ascii?Q?ZQtMCMK63XcFpqFLhxV5AvZtXEeRZX4xvmUqZz4QOJm6w8wluD5RwYzlSDm2?=
 =?us-ascii?Q?lYYuS2eWtQVOSq/ixOWM0z3bRKhSpnbFN4niaF/kXDbU6eXGMkuPuC63HP/c?=
 =?us-ascii?Q?aS6Ax6PSCX1lLe46f7O6GIhMWF4+ouFAHnjkF8qEqWKHe9sPTfBEi9lBjOT9?=
 =?us-ascii?Q?PVEEi4N+7g7pV9327/v+RyGgYj/N4K7SSPKJFCkjXhOfMwNAmNac4TcYTNJU?=
 =?us-ascii?Q?3Hz7csel0wejQbw7uMKM5CQOYmaXK2ocsG+kE3LMMCjVn/KrRlewwR9chA3O?=
 =?us-ascii?Q?eAC7NOZNWgNewANcXHzB4RWko9y0dOcn+k2vMyS5YIsYumhulhY/iu6Z2Vvk?=
 =?us-ascii?Q?hehrn/1hd3mB3jZv7APx02bWpqYrRo2CmYDcz/b4udrq4HJSI0I3ynEMw123?=
 =?us-ascii?Q?QQXeoMfFOrUaDL1C+RY9kNj+pu1n6msruXYpZwCM5nC51tqvFGpOHv1ywp2F?=
 =?us-ascii?Q?ZV3hsrdbrKwpOINg7AmDllSYpyqCe6MHkn59OInm5ZTwNU28ZxbX5XBPzoNl?=
 =?us-ascii?Q?QQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5062.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 435826dc-6f4d-4897-6ffa-08dbdf70b3db
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 09:05:34.9887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cgZLfhBug+nUOMF2bI1cLyI+Fe3wQGWHuga5zuYfppF38udedseCHEKb6H7P/rTWctECw3Fx1uG+c29JnsW9FyjdvR6fAlCdIXZKwLQBI48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7607
X-Mailman-Approved-At: Fri, 10 Nov 2023 13:23:51 +1100
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
Cc: Hakim.Cherif@microchip.com, openbmc@lists.ozlabs.org, Marco.Cardellini@microchip.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Patrick,

Many thanks for your feed back
I will discuss now with our Linux

Regards
Marco

Marco Cardellini
Manager-Applications Engineering
Tel: (+33) (0) 6 72 86 84 83
marco.cardellini@microchip.com=20

Microchip Technology Rousset
57 Avenue Victoire, 13790 Rousset, France
Fax: (+33) (0) 4 42 53 60 01
www.microchip.com



-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz>=20
Sent: Tuesday, November 7, 2023 12:07 AM
To: Marco Cardellini - M43165 <Marco.Cardellini@microchip.com>
Cc: geissonator@gmail.com; openbmc@lists.ozlabs.org; Hakim Cherif - M69710 =
<Hakim.Cherif@microchip.com>
Subject: Re: FW: OpenBMC support for SAM9X75 - follow up

On Fri, Nov 03, 2023 at 08:37:55AM +0000, Marco.Cardellini@microchip.com wr=
ote:
> Hi Patrick, Andrew
>=20
> Many thanks for your feed back but we are not sure to understand your ans=
wer.
> .
> Does it mean openBMC team will keep updating their code based on any yoct=
o release?

OpenBMC only does development against the Yocto master branch.

If you look at our Kirkstone branch you will see it is 3592 commits behind =
master and was last touched in April 2022.  That means it is missing 1.5 ye=
ars worth of BMC code development.

https://github.com/openbmc/openbmc/tree/kirkstone/meta-phosphor

>=20
> Checked the wiki, kirkstone is the latest LTS version of yocto.=20
> https://wiki.yoctoproject.org/wiki/Releases

LTS releases mean very little for OpenBMC.  Most OpenBMC uses take a "live =
at HEAD" approach (or something very near to it).  We do not maintain past =
releases and we certainly do not add new code to them.

>=20
> Did openBMC team mean if we want to put our meta (meta-atmel) to openBMC =
github, we have to follow every version from yocto release?

There are two approaches:

1. You add the bare minimum of meta-atmel recipes to support your SOC into =
our tree (this was Andrew G.'s suggestion).  We need to understand what the=
se recipes are.  You will probably end up with a similar set as what is cur=
rently in meta-nuvoton.

2. You ensure your own meta-atmel is a well-maintained Yocto meta layer (by=
 ensuring it always works against Yocto's master release as well) and then =
we can add it into our subtree import tool.  This is how we keep meta-arm, =
meta-raspberrypi, meta-openembedded, etc. updated.

> Is there any quick way if we integrate our meta to kirkstone branch?

No.  And even if we did, it would provide no value since our Kirkstone bran=
ch is using relatively ancient code.

--
Patrick Williams
