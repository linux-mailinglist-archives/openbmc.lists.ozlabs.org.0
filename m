Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7100044F0B2
	for <lists+openbmc@lfdr.de>; Sat, 13 Nov 2021 02:58:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hrdrx2SWJz2xtf
	for <lists+openbmc@lfdr.de>; Sat, 13 Nov 2021 12:58:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=l0/ytF0g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=2951e43199=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=l0/ytF0g; 
 dkim-atps=neutral
X-Greylist: delayed 5232 seconds by postgrey-1.36 at boromir;
 Sat, 13 Nov 2021 12:57:38 AEDT
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HrdrL37v0z2xDC;
 Sat, 13 Nov 2021 12:57:37 +1100 (AEDT)
Received: from pps.filterd (m0105196.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1ACNheHo024559;
 Sat, 13 Nov 2021 00:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=4A9Pues6LSGMukRLEqwP55OoZa28n0TnE+PEJ8epx58=;
 b=l0/ytF0gThPOb7ZC4fo9Pd7/BfA//uMp+sMnDqAbdcxxlFYceL1RQ3bVwIHUmPeKCly8
 HU5YhqC+OwpDhnyeGIT7x+vPjY3CgEPT1Hr5V4Hpm3vtKxQHy0Tvl8bpmqZOKq+1YqNE
 vlmaxhYF14FMMSzlABZOWuLjX5e1UF6woxqis12kIh8/lWZ0GgwI/yJEGPEn0NtSyrv4
 A79axUwn9mky4OQ920mDCm1qGBG9sXRmo9o6T/xe3xDNdL9E3lTo2ero8sOPPEuNtth8
 cKRIKM9B2gF0iqlLgUQoMisUg46VtGGkOl4xsNBJlnS39YZg6BcNUeSXkJ8O6mBOUtfE PA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3c9y170px2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 13 Nov 2021 00:29:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsTz8jIiLQCM5Msuaz02io0+PeX9eoa5qJAgOaPNjAZRsgaNkGYyrNZG7NcEQtItZhcRu+jQmOBuFVM2N6tPvK+rpy5/Pleiqtqj6sGXxxMdcyWwnGxGPlp50TDOVM3Nqcw9L+5i3KujKxItZjykZVLLwDP0tSSg4HCEU9KfJTFBgAIZkI9Mt3ZV6uMa8/ozKGarEDr01ApKfKju+7tv7tKLSWOuKzhnONAKO44DtiPItU1bOhdSO8qyNF3d1DTBcJ4RQ+r5vaV8Y/TaQ+W38jFh+G/2WTQrC4LqDZnMtRxcwAKIgUmIqV7D2rsF//cRFowa5df+zV4qZg47wyfBWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4A9Pues6LSGMukRLEqwP55OoZa28n0TnE+PEJ8epx58=;
 b=NSQ6uLJXON32jzPkq8uPqgj9KgSIzbKc2LPs/Acym8vb5nTd8wVr0YyonjtQ9sq+Ue67e5rkMClFkXgUq3TTrJmA/7+OBV6oVxp344dL3evhkb8h95kE4w7HZUhWFIjGcdwS0Orga2fLOnW+DIhgbm808tf/Dpq+mTTDzBQzi73gXvRxAJObyarHi6rZAQXbUAJ25ajpoEuaxtP2kyu3sITsM4pyHqfJ1P8iox9hnG35CgQI2zuXQnFGL0Jd2fnO89YbAd2Nn1PxvxaWzpF1WjCnwZ/hgxdlZPE3BBQNA827W4J5gRNLRXI5cP/lrPs1pF5y5G/mw4BT34+3QnIQNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB8072.namprd04.prod.outlook.com (2603:10b6:8::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.16; Sat, 13 Nov 2021 00:29:49 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::61fc:37a:892f:c6b9]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::61fc:37a:892f:c6b9%8]) with mapi id 15.20.4690.019; Sat, 13 Nov 2021
 00:29:49 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Adriana Kobylak <anoo@linux.ibm.com>
Subject: Re: [PATCH] ARM: configs: aspeed: Add support for USB flash drives
Thread-Topic: [PATCH] ARM: configs: aspeed: Add support for USB flash drives
Thread-Index: AQHX2CWQN+kzq+WgkUO16L1HWdMoKw==
Date: Sat, 13 Nov 2021 00:29:48 +0000
Message-ID: <20211113002948.GE14774@packtop>
References: <20211112202931.2379145-1-anoo@linux.ibm.com>
In-Reply-To: <20211112202931.2379145-1-anoo@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca2c00df-bb3a-4f7f-acbd-08d9a63cb39a
x-ms-traffictypediagnostic: DM8PR04MB8072:
x-microsoft-antispam-prvs: <DM8PR04MB807209E0F93FDA98ED317FD7C3969@DM8PR04MB8072.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vUgJJK4nsXOOamf1AY6IrVzcB0QdnuAX8oFOmopmYVBcpv4LbH7lV3C5Dnz8jchIPtLCmQ1X7v9GqYVOJGAKCF7tITGD+Dud7p2lUC+VPYYcX9+RuG/hNkuH7IsMThRfnJJVWYYURpkGt3asqYDJzwnm4eqqTcks1yoLYvZncm0kUPeRW6SVA7wpkeJjOBedc3bQZXDiKb8Wu7WeQNMyv1MTk25nOR04RIioaiOO4Sg6ezDEtvZOosPlicIF2Fc5quQafGX/KmRNOIDfunl/As0+dYGj/jMVMGDn1kMb9xY6RIrDpIHOUsM0+qA7vc9hjHBM88pHysQLqR9MjMiQLmB7wfbkohyTV0p3/AtUR6RFSTT2mYu8IQbBVkLOJ8pb7VHDLsUVZcEerK0b3e+9FafKjrMLw0vW/1JrFOIx+K9nzOJYHwQ5t0yqjS0xvr7iiE3aXE2Sg9lowHPF5WfiPwa9qQZ6YFrqQx2yALxtCbA+bqbtUBqBVoksUHAeOOrHDN+LZomFTyn+M6kGTgwfu/UhJkwIFoKyimXfaVXAerH6CXYOK/tNzT2HvY0ib3+UNF9cpMFgeZtXlDo73ECC5La7PcAcC87xoK/XK6girnafYjZTq08EU9+uMqQPfC4jxfXx1re9HC7/p8LonHNw6Jh5gAwJWetJV4W050nwRJqsh7K2dSKG3ddqEInqK1OqS6h7nhhIOEHauu4/6KQ5Ag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(366004)(91956017)(9686003)(26005)(1076003)(76116006)(5660300002)(8936002)(6512007)(71200400001)(6506007)(6916009)(508600001)(83380400001)(33716001)(122000001)(33656002)(38100700002)(186003)(86362001)(8676002)(66946007)(64756008)(2906002)(4326008)(38070700005)(66446008)(66556008)(7416002)(66476007)(6486002)(316002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?coQ4TnLk9kF2u2fYOaArGROf16aBFQGN2L0no4xSx1ylf2qhqffIs2z+OIbE?=
 =?us-ascii?Q?3plHlzdqpPfC0jv++spzbKipA7CZI5Ph1xQl9jOxI1rp7Duzh7fNheyml6vi?=
 =?us-ascii?Q?C/qTdD+p2E/yS3fn/sZx0PmIpL5B1Y6TAHvSQ49XMPIgKI9Ew5ENtsYNfECt?=
 =?us-ascii?Q?+qvVzoOc3o45EqTow+PdXbyALERBqnCncLiFIlFIfmTPh8cpA7U5o2YueaEm?=
 =?us-ascii?Q?ZZjcmnRLyeHBlTXyGVasUIbkQG1VY7i6xgD3bz01RH2eb3weBPQNJAuwVAS0?=
 =?us-ascii?Q?BG2NqQAF9sjHJxFfEb2vPCQ0q0gGjum72ZYpOwINupWEh3H+Y4XeC6u02o2H?=
 =?us-ascii?Q?Ntb+KMJYiuSoytjgY5192+80SH9ykbRsWIUxE/zLc0xmw9Jjbl3Ji4beJyCP?=
 =?us-ascii?Q?yh4VbaaYiC7v7mO1UEGkPlTRn7MLaR/w3tpthsiGmNPlf+/pJMaB27kJciAE?=
 =?us-ascii?Q?WM+/6c12s7zMF11qw0MXEx/h7s8ALQsnHnNC5nG/TOWh8t9GI41V2eqJgBsw?=
 =?us-ascii?Q?UR+PWCfq5w1vzaHlpqXqyn4ovHwoz2TlYt4mjaENAhknewOE0rmPiP/iARY5?=
 =?us-ascii?Q?A19BxCfJkjeM4yEPak/JmgFVCUtP74Na/A5Icrb+ne6rcpNCE7zrss49WpXt?=
 =?us-ascii?Q?nwv4bqaPaBSiNQY9kFBd173i+QB4caJvuTombVWF73YpkzVl49KLoGBZqVm2?=
 =?us-ascii?Q?+eC0ZybeieVEvHrnt0WQVOYXSmHNpDHKX77LQnb9N0qDtB2czjPSJE7KzReX?=
 =?us-ascii?Q?0ZVGOeh/MTZ5uPt4l1DznHm1WFmjwKjTwcC+iY4G2eQy1hbGDRLsgu7b9/Gq?=
 =?us-ascii?Q?FVtJkgCXiV+lf+LjEELV9OG0VeMKEr9gKOoA5mvLLcg+PX341T2vQAQlse5Z?=
 =?us-ascii?Q?GmUnvrvJ6y5dKAYzBebSgwbNAscxI/SMzYZUn/YLB6lrKQY2JjGn7mseoox3?=
 =?us-ascii?Q?cwQL9sWqDa89xJOvhdW80U6XXXqLw35kPCC2mNXgJ46ZamUe9FGN+Lxpv9/Y?=
 =?us-ascii?Q?NUyuIxq+5slk71k5tZEsowxPMs85brpy8a6t6dPetJAzo/p0/3fEIM5pXuUR?=
 =?us-ascii?Q?JvE7NTBV8y71mnNfE7SFAnD5gjRi2Ybqre06vgJogkmj89wr86wJvQcGL+D9?=
 =?us-ascii?Q?eqsVOmUCyowlz2syCh6gKQgkOO8tduWysBKcj5Ucr7xW2GQtmcsXZwK3BhU4?=
 =?us-ascii?Q?QbDEX5RmLXdnrlRheaASxrmRQmXPCLTBHGE2ngGFeht8BEzIfcfTBLPIAcP3?=
 =?us-ascii?Q?5Rx5P1gKwTOduSvAXB26Bnfr5KxN7FVZeIqybgXRgc/UJ0B4dnSGPk+31TBp?=
 =?us-ascii?Q?r8WWShUNptTcA3ELh2VjghJzZlju0L3W8Y5fWjxXXyc5XXmf6FBGvD285CPk?=
 =?us-ascii?Q?R54TZKyNLC2AXDhl9cR3eomgPeEgSkuPHhF/JKb4WFBLc0MuNdYxgJ53nl5f?=
 =?us-ascii?Q?0ZP2z3qNjTqcAppuMajaxJdJOVl1tY7UuEShemzmtjNJjPND7/9OnjEEKFVP?=
 =?us-ascii?Q?PVnXrscWgis1JyYsQ3fGUDOu+W5Bh/etdVbl+0MvlqmmKGeEYZ34EArotD9Z?=
 =?us-ascii?Q?7sArRPA2uA6ILF2572o5hV5Eh6aPUgNsKBrxBTKITymhYeKrZVoba8VtksV+?=
 =?us-ascii?Q?KbG/K/Yo4cm8E0kYhqh+i94=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1354B30831F79A4D950C2588FDA5F76A@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2c00df-bb3a-4f7f-acbd-08d9a63cb39a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2021 00:29:48.9669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4n2HHvLyafsI3CRs3i7IS1+ObfV3BbHPTvR6zHirVPIWqk7wyqocpbDBbbbCRxZK+Phg37Y3IvKWV5sdBrRl8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB8072
X-Proofpoint-GUID: 7Jr8PpaxYAVg7WofsPXagLItqQ2p5-Il
X-Proofpoint-ORIG-GUID: 7Jr8PpaxYAVg7WofsPXagLItqQ2p5-Il
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-12_05,2021-11-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 clxscore=1011 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111130000
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
Cc: "liuxiwei1013@gmail.com" <liuxiwei1013@gmail.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>,
 "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bruce.mitchell@linux.vnet.ibm.com" <bruce.mitchell@linux.vnet.ibm.com>,
 "olof@lixom.net" <olof@lixom.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Nov 12, 2021 at 12:29:31PM PST, Adriana Kobylak wrote:
>From: Adriana Kobylak <anoo@us.ibm.com>
>
>Add support to detect USB flash drives and create the /dev/sd* devices.
>Also add support for vfat to support USB drives formatted as FAT32.
>This support will be used to enable firmware updates via USB flash
>drives where the firmware image is stored in the USB drive and it's
>plugged into the BMC USB port.
>

Hmm, how common is it for BMCs to have a USB port?  Perhaps it's more so
than I realize, but at least in my (admittedly somewhat limited)
experience I've yet to encounter one that does, so I'm wondering how
appropriate these options are for the aspeed-g5 defconfig if they might
just end up as a bunch of code that's never executed on most BMCs.


Zev

>Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
>Tested-by: Adriana Kobylak <anoo@us.ibm.com>
>---
> arch/arm/configs/aspeed_g5_defconfig | 9 +++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>
>diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspee=
d_g5_defconfig
>index bee9422919aa..1b0d82c64ad4 100644
>--- a/arch/arm/configs/aspeed_g5_defconfig
>+++ b/arch/arm/configs/aspeed_g5_defconfig
>@@ -37,11 +37,9 @@ CONFIG_KEXEC=3Dy
> CONFIG_VFP=3Dy
> CONFIG_NEON=3Dy
> CONFIG_KERNEL_MODE_NEON=3Dy
>-CONFIG_FIRMWARE_MEMMAP=3Dy
> CONFIG_KPROBES=3Dy
> CONFIG_JUMP_LABEL=3Dy
> CONFIG_MODULES=3Dy
>-# CONFIG_BLK_DEV_BSG is not set
> # CONFIG_BLK_DEBUG_FS is not set
> # CONFIG_MQ_IOSCHED_DEADLINE is not set
> # CONFIG_MQ_IOSCHED_KYBER is not set
>@@ -98,6 +96,7 @@ CONFIG_NET_NCSI=3Dy
> CONFIG_DEVTMPFS=3Dy
> CONFIG_DEVTMPFS_MOUNT=3Dy
> # CONFIG_PREVENT_FIRMWARE_BUILD is not set
>+CONFIG_FIRMWARE_MEMMAP=3Dy
> CONFIG_MTD=3Dy
> CONFIG_MTD_BLOCK=3Dy
> CONFIG_MTD_PARTITIONED_MASTER=3Dy
>@@ -111,6 +110,8 @@ CONFIG_BLK_DEV_LOOP=3Dy
> CONFIG_BLK_DEV_NBD=3Dy
> CONFIG_EEPROM_AT24=3Dy
> CONFIG_EEPROM_AT25=3Dy
>+CONFIG_SCSI=3Dy
>+CONFIG_BLK_DEV_SD=3Dy
> CONFIG_NETDEVICES=3Dy
> CONFIG_NETCONSOLE=3Dy
> # CONFIG_NET_VENDOR_ALACRITECH is not set
>@@ -230,6 +231,7 @@ CONFIG_USB_DYNAMIC_MINORS=3Dy
> CONFIG_USB_EHCI_HCD=3Dy
> CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
> CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
>+CONFIG_USB_STORAGE=3Dy
> CONFIG_USB_GADGET=3Dy
> CONFIG_USB_ASPEED_VHUB=3Dy
> CONFIG_USB_CONFIGFS=3Dy
>@@ -277,6 +279,7 @@ CONFIG_FSI_OCC=3Dy
> CONFIG_EXT4_FS=3Dy
> CONFIG_FANOTIFY=3Dy
> CONFIG_OVERLAY_FS=3Dy
>+CONFIG_VFAT_FS=3Dy
> CONFIG_TMPFS=3Dy
> CONFIG_JFFS2_FS=3Dy
> # CONFIG_JFFS2_FS_WRITEBUFFER is not set
>@@ -292,6 +295,8 @@ CONFIG_PSTORE_PMSG=3Dy
> CONFIG_PSTORE_FTRACE=3Dy
> CONFIG_PSTORE_RAM=3Dy
> # CONFIG_NETWORK_FILESYSTEMS is not set
>+CONFIG_NLS_CODEPAGE_437=3Dy
>+CONFIG_NLS_ISO8859_1=3Dy
> CONFIG_HARDENED_USERCOPY=3Dy
> CONFIG_FORTIFY_SOURCE=3Dy
> CONFIG_CRYPTO_HMAC=3Dy
>--=20
>2.25.1
>=
