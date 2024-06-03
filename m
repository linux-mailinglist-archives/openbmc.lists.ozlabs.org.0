Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1BA8FA693
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2024 01:35:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=smartm.com header.i=@smartm.com header.a=rsa-sha256 header.s=selector1 header.b=Pu+LLDtc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtVTY74QMz3dBt
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2024 09:35:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=smartm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=smartm.com header.i=@smartm.com header.a=rsa-sha256 header.s=selector1 header.b=Pu+LLDtc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=smartm.com (client-ip=2a01:111:f403:2416::701; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=rajesh.ananth@smartm.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtVT05mJmz30Vh
	for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2024 09:35:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/7ViSgW/rk/q1h73SZuDa7UM+Pwe8UygJhpTgvwZO48KM+7HMR+c7vM84kd+Vo7UR6MAPFdH0Yg11Nz0CHSvZZ8AXuTkX/ceo5PZ3rESk66C8kp7Wd/qEYjRx0A1pKSqSLxeWB3boS4V66z69rYxuHtE6djmsVsznK1GQqd1CSpW3aapAt4iWg0AoBZikx52B4U8w2QaVhEibwh5E9WnXHSTYKGjltwDUc6fKsivZIEqUWMATTiJK9WBvkh4Zf2bM8nUfd+tQl268tXaWx3o3nnvqGqo6ydSJrX3q3YX14m5R72FqGPbPzLRZzp64x5LdKy26KRz4PRfMnWrwNoSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5fd0GihEaplL7GOwEsHXCIAAWLvTUZdIna8ILU2M0U=;
 b=mFs1FotkllS6o5tqfUqI0K4R+3vOft9lgoNelzUmK5wr9/FvajdPDy9OwcS/R88EtCokSYJNUE1UiF0V0Re+59tfwZQ7OfE8rdEkEnhICOopABZENsOMzzXoh4KazQ6QEat/gtMVcpI9fJ/H59zd0sSMpJtJaERs1RfmJ5h2wf27xuEOXQl/eN7xoB+rW4amTajtUZINGMHpM3bXt5u0QqEeicjPPPeo4xnFgtNBsGwNzV5F1NAXJbd4VH6CKMemJmSlOAfpZHocDPLkLYOuQMtYZpVqcFgRlDC4XNHwFn4FTBvqRyC+Tv1mu9gWZKS+lIdggGIA6qKnoGNRD23M6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smartm.com; dmarc=pass action=none header.from=smartm.com;
 dkim=pass header.d=smartm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smartm.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5fd0GihEaplL7GOwEsHXCIAAWLvTUZdIna8ILU2M0U=;
 b=Pu+LLDtcMntVQDHZ1Pa1ogNQmEnSvmKDFdU/y/sfHbv6hVE837gTMDsSRo+ldO4FP5oyC/vzw5b6nClTqnYAqLpIOsk7NavEX7NyVNoZsjg8sK6iuJxQ+k6BL2JGIZh3hOONKpc/SzRvWL/O5aG8FmGGL+dR1Zq0Etu/ksbV1VEF1ivpg8tHj1I7De9SmR0H81Mw7p4BGmqtanJw4rIf19RoZBbPX9AGQyM1PMh6T49IPPDGw2mE9ZJUSQ7vYjnhMh+mhnQkhniBZ412SHe/481uawlp3TELExMPAiKKNC/K0km9HIsUVnBV5Cev7ulr4wThrLYrCQR9dsKpfkaOMg==
Received: from BN8PR04MB5906.namprd04.prod.outlook.com (2603:10b6:408:a7::27)
 by SA6PR04MB9325.namprd04.prod.outlook.com (2603:10b6:806:43e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Mon, 3 Jun
 2024 23:34:52 +0000
Received: from BN8PR04MB5906.namprd04.prod.outlook.com
 ([fe80::15ff:a949:91cb:8bf3]) by BN8PR04MB5906.namprd04.prod.outlook.com
 ([fe80::15ff:a949:91cb:8bf3%7]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 23:34:52 +0000
From: "Ananth, Rajesh" <rajesh.ananth@smartm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Build problems
Thread-Topic: Build problems
Thread-Index: Adq2Dc6PySfkF0+WQ++lCFGz/q+qtw==
Date: Mon, 3 Jun 2024 23:34:52 +0000
Message-ID:  <BN8PR04MB590628BC7BC726C6F3B089A794FF2@BN8PR04MB5906.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smartm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR04MB5906:EE_|SA6PR04MB9325:EE_
x-ms-office365-filtering-correlation-id: 5e3de63b-fe1d-440c-84ef-08dc8425c46f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info:  =?us-ascii?Q?ZDRpTQH51n7romDpXGT8ig7/1ONsG3M5mDsErysY4wBJ0yT3jSB++dc0SDaE?=
 =?us-ascii?Q?Ppn6vAXTRqUfMmIy8sosWzKxXWBZRWj3Nd0bnFOQil1lih7S3sXop6dkiLaf?=
 =?us-ascii?Q?UJXCdfxx/Cu7cz1wThGhTq7QMMDtlnxMTaFPwICizs7dIeB0qbkx503NEm7c?=
 =?us-ascii?Q?azgGpidJ9UdF/XFWpynM5EbaMyIhAzGvBSrlmFZwYj3i5IjW2/TiiAf84zRZ?=
 =?us-ascii?Q?NwO1UlTrhk/XrMUfzrug7vlw0y6eetOiOyB37ZZInLNIHaA/iZGZB4pmGLon?=
 =?us-ascii?Q?OuoFMLEbsz7fy1B45D2eCPmuA4MBRn9vo7/EgBb/9/xAXD8l++EfUJ/ERMVM?=
 =?us-ascii?Q?BHrjLXqxwGwt59U5f+z2m3mv9p/ufLiG29XpNNpyoaAw52jBJmVbLPHbsDjb?=
 =?us-ascii?Q?TSD5/4x8FfJg15nSWdR0JJHHXceBqBIAusLWgwG0ZM184khWkWmO1tktRi74?=
 =?us-ascii?Q?/P0Al0PnAMIoIyEkbFeGo7XLroiIcTGkLSkp1rix8s7cOtAii4emNQhcuYkF?=
 =?us-ascii?Q?1XD5aJCvEikMohCYHYoqhdBPXQpb63qZjEtJpGQry41BEcfLmnBaLfTO6jKE?=
 =?us-ascii?Q?ouICVssOjpVFwZ2ZTZ2G0q4MsYFcswah0SLfWNZ5qoygM8g7Nb3nKm73NDKQ?=
 =?us-ascii?Q?V0fTFAHeUNc53RfmoSzaG6+PovmdGK/bdne6VEzWN8riLNjN4v+4uY6YUump?=
 =?us-ascii?Q?ENnKYPa6VFtwWGeu/5puggNwTs0A4ZwoFQxMlo9vapHbzWT+FXuVhyoEPkl0?=
 =?us-ascii?Q?+IXVprnKT0h7rAGbd7wdq41lLNsu4jRMFZlqAHHs4i7c9u4tQv7pmUSNvgAt?=
 =?us-ascii?Q?fGFx/YW2bKW8FLYZFlxBg1bl/ZjVa+mKk8FaDr2Jdo803NepX1oEouCm0e77?=
 =?us-ascii?Q?rMVA+sJJP5znFQfBosaOQAVH7EogR3wTxXgL4MC8CJM1lGe8d1Y3rRrl3CiT?=
 =?us-ascii?Q?Lf1zKCNecPLuOsmlpG1gCA20uw8HmzqIf41ZBVUeX02HONlrZcfa54eyv9Y/?=
 =?us-ascii?Q?XPHpKZJcKuIJ64Ei3W+m66jbfJN1+45MFsVji6eJ/s9k/kvBpbuNAW23aEG5?=
 =?us-ascii?Q?ZJGcxsey+9vvu/aKlvmBYBVLj3+mFaW4iAcHUnSsSM6dvSWiiTN0HJ1fL+u+?=
 =?us-ascii?Q?FEu7dcFwbFacsEKVyKclvZxL3+puPbvNu+ttZlPPkCyFWA41dKzreNa2YkBm?=
 =?us-ascii?Q?kVojHgWoLBsVaWzutR6hSmrSqFn/S51yJj458xaUoQVQOJd/Wq9/IFb/9Vuh?=
 =?us-ascii?Q?snebEP7p9i5J5a/RTwe1ykj2N86G0XpS0ktXhUQ+XXze/aa9oJxV47tQdD1I?=
 =?us-ascii?Q?5HJ0FozFVZsnIflnjhWbyHbrz3dCTH0z+SPgL+i1Nu2MaA=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR04MB5906.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?vuWjOUbxEqJn7PTz5MyXEJT52jk5LvwBp/OPrI44hUtjGAFQlaKSDc/tK1SK?=
 =?us-ascii?Q?zQguFOGkhPl9Wz7AJvrcrkwtlKqv7+Y4p15iusWF2OnpBF7H03LaYXEegpoE?=
 =?us-ascii?Q?mKBaEQrzuqhGtyndOn2jdhDjUFZKoPZHacekHxnFKWoJf64+BuPuNn+uL9+C?=
 =?us-ascii?Q?01H4SKyc4JQn85avDgBEAsJGzw/iZo1F0fY72BDcttAAzxeD6NamXE9whano?=
 =?us-ascii?Q?SDBA4jXyt96u18gmmFT60yrgxy1l2+wGGu2j5sqEJbbeKy0FRmb2Heh6M+oq?=
 =?us-ascii?Q?09WDmPQXkt8PfN7Dz2oofk/E59xWoCmYYRDRmbpoAAhntLJH7LdkRO7G5riG?=
 =?us-ascii?Q?vHxnIYXWO3NNqPZ8bofxDJq9fB00Ai1Ej7yAjVKwLCD+vQkDlHtefcN2899X?=
 =?us-ascii?Q?s4mIB1vMotXH+YrO/7pHAxUJwHxHJ5hMDAKaF4hjv2Br5LFby1wnEvdLNAz9?=
 =?us-ascii?Q?a1xY7KTF4xQYeeUTs6tioImyU+dg3SKX1Uh/+v4EwgiXjGFRqcj65BmLj37l?=
 =?us-ascii?Q?rwlUShr9LwNXsBI0f/0BXfhy0AeGyO6a8pNfTUsKeV+W/FZLVE5dfk5zPxLa?=
 =?us-ascii?Q?uH9vlHnUc8e26XfoXMsNxEb26HqqD575cTJnCV9vpJwXX/Jg88+/e6L7PaD3?=
 =?us-ascii?Q?TSdV9gAMjXFSlttLa97ReUBSN+u7WZegvI+XSVvQrHvXX2AQZYYYWV9mdCPk?=
 =?us-ascii?Q?NV3ro02Tb3tImuGAjiS6Wo2Gn5rG50rFk6UE3YSQxBN8UDC+52/D61BZi51f?=
 =?us-ascii?Q?2EWVkARIW9fSEKjAk9FfM+gQ4VChpc0t4Us2sgSSFdcKgXAtPDfjOToOBzaH?=
 =?us-ascii?Q?RZxuzbkQfSnbIyIsbArrKk8wg41CS+bXH1mTbkPM2O/E8OinR3KTUpCaCQrj?=
 =?us-ascii?Q?2vsPzwB6uI5F3A0x6OKbQP88JlPJtKg/89MChd/Lxbaul4FYiS40qbE9dWdg?=
 =?us-ascii?Q?XMpuq7/zH8TFVTcpw604roKnZ/Ku7xubnaBpPGpHWSvH8BseFQVVFv/ktFgS?=
 =?us-ascii?Q?gjURJYbBOFaQ9OrppxfoEW/kkxTo0Vr9FM/6WBC7fLQKHgmrQSXfJZBfmSaC?=
 =?us-ascii?Q?+YTnBodyIXsBBaFQUQ6mbsodURNQbZYHlU/1M6olwd7OJJAE6KltZ0IL3sCV?=
 =?us-ascii?Q?1JXnd9C9VKIXsLXhpKM3p0OiVRoDxhP9+O2OLhvuKZKzb44ulz0o7joyQ/4F?=
 =?us-ascii?Q?oOpH6n408nwxz5mZTuFKoJlyz2fie4HOPbWZw5X2LW5CWXMYQqgkbfoOkQAk?=
 =?us-ascii?Q?rBCdQiv2h1V6/gG091tkjrppTQ9o3UeJEvp9iAabt8mN/J8lgktP3QhNgAsk?=
 =?us-ascii?Q?0yeabUS+qqfNk6gtkmYKg5+cAwKuvSI3E8FLmk+WzJjFVeobp/ciJhwKdH+H?=
 =?us-ascii?Q?7cwWxrsxI5t1KaaL/AaG3tn7gvqhc4DGUdFjNVxrIj3arV8vUPg2kVxNuVwb?=
 =?us-ascii?Q?Jy4Culn4WGYDl5y4VGKVhybd5/P5jncaB/0fxtL6qlNFuCgjbys4/jyO0ULQ?=
 =?us-ascii?Q?EOZW6+gLAvMVO9w4yQH6E+qnT5aQDdKyA6bAzAeY96PTE8p90aOE94P2xMB3?=
 =?us-ascii?Q?CWlylpwbmsFY21zm9vS9ZrVAaVbm9vPK+yjM1G38?=
Content-Type: multipart/alternative;
	boundary="_000_BN8PR04MB590628BC7BC726C6F3B089A794FF2BN8PR04MB5906namp_"
MIME-Version: 1.0
X-OriginatorOrg: smartm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR04MB5906.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3de63b-fe1d-440c-84ef-08dc8425c46f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 23:34:52.3665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f0fd7909-cd13-4779-b0f9-5ced6b7a2c68
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nBQ0xHZkAolrwga74ldEbRy/S6df1O7ycjSnW2cMPTT1oEgQ+9sK8nynME3qSTOinAsn/j3cgE1uOFW8jvlMPWmD/ZWH6ZijHZCiGUXtfMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR04MB9325
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

--_000_BN8PR04MB590628BC7BC726C6F3B089A794FF2BN8PR04MB5906namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,


I am new to the OpenBmc development, and as a first step I am trying to bui=
ld the "bitbake obmc-phosphor-image" for the s2600wf platform. I have follo=
wed the instructions as per the OpenBmc git page.



I could see that the build is not validated for Ubuntu-24.04 and it fails w=
ith some network related errors. I don't have any firewall restrictions. Fo=
r a starter like me, what would be the ideal base Kernel/distribution to ge=
t started with?




My build environment is:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Linux bld-ub24s-openbmc 6.8.0-31-generic #31-Ubuntu SMP PREEMPT_DYNAMIC Sat=
 Apr 20 00:40:06 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux



Output from the bitbake:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
WARNING: Host distribution "ubuntu-24.04" has not been validated with this =
version of the build system; you may possibly experience unexpected failure=
s. It is recommended that you use a tested distribution.
Loading cache: 100% |######################################################=
##################################################| Time: 0:00:02
Loaded 4747 entries from dependency cache.
Parsing recipes: 100% |####################################################=
##################################################| Time: 0:00:00
Parsing of 2864 .bb files complete (2863 cached, 1 parsed). 4748 targets, 6=
73 skipped, 0 masked, 0 errors.
WARNING: No bb files in default matched BBFILE_PATTERN_s2600wf ''
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           =3D "2.9.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "ubuntu-24.04"
TARGET_SYS           =3D "arm-openbmc-linux-gnueabi"
MACHINE              =3D "s2600wf"
DISTRO               =3D "openbmc-phosphor"
DISTRO_VERSION       =3D "nodistro.0"
TUNE_FEATURES        =3D "arm thumb arm1176jzs"
TARGET_FPU           =3D "soft"
meta
meta-oe
meta-networking
meta-python
meta-phosphor
meta-aspeed
meta-intel-openbmc
meta-s2600wf         =3D "master:ecb9886523248ce726b2a452d12a48234d126fc5"

Sstate summary: Wanted 2809 Local 0 Mirrors 0 Missed 2809 Current 2 (0% mat=
ch, 0% complete)#######################           | ETA:  0:00:00
Initialising tasks: 100% |#################################################=
##################################################| Time: 0:00:04
NOTE: Executing Tasks
ERROR: PermissionError: [Errno 1] Operation not permitted

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/rajesh/openbmc/poky/bitbake/bin/bitbake-worker", line 278, in=
 child
    bb.utils.disable_network(uid, gid)
  File "/home/rajesh/openbmc/poky/bitbake/lib/bb/utils.py", line 1696, in d=
isable_network
    with open("/proc/self/uid_map", "w") as f:
PermissionError: [Errno 1] Operation not permitted

ERROR: PermissionError: [Errno 1] Operation not permitted

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/rajesh/openbmc/poky/bitbake/bin/bitbake-worker", line 278, in=
 child
    bb.utils.disable_network(uid, gid)
  File "/home/rajesh/openbmc/poky/bitbake/lib/bb/utils.py", line 1696, in d=
isable_network
    with open("/proc/self/uid_map", "w") as f:
PermissionError: [Errno 1] Operation not permitted

ERROR: Task (/home/rajesh/openbmc/meta/recipes-devtools/quilt/quilt-native_=
0.67.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Task (/home/rajesh/openbmc/meta/recipes-devtools/quilt/quilt-native_=
0.67.bb:do_unpack) failed with exit code '1'
NOTE: Tasks Summary: Attempted 5 tasks of which 3 didn't need to be rerun a=
nd 2 failed.

Summary: 2 tasks failed:
  /home/rajesh/openbmc/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_=
prepare_recipe_sysroot
  /home/rajesh/openbmc/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_=
unpack
Summary: There were 2 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.





--_000_BN8PR04MB590628BC7BC726C6F3B089A794FF2BN8PR04MB5906namp_
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
@font-face
	{font-family:"Lucida Console";
	panose-1:2 11 6 9 4 5 4 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<pre style=3D"background:#F6F8FA">I am new to the OpenBmc development, and =
as a first step I am trying to build the &#8220;<span style=3D"color:#1F232=
8">bitbake obmc-phosphor-image&#8221; for the s2600wf platform. I have foll=
owed the instructions as per the OpenBmc git page.<o:p></o:p></span></pre>
<pre style=3D"background:#F6F8FA"><span style=3D"color:#1F2328"><o:p>&nbsp;=
</o:p></span></pre>
<pre style=3D"background:#F6F8FA"><span style=3D"color:#1F2328">I could see=
 that the build is not validated for Ubuntu-24.04 and it fails with some ne=
twork related errors. I don&#8217;t have any firewall restrictions. For a s=
tarter like me, what would be the ideal base Kernel/distribution to get sta=
rted with?<o:p></o:p></span></pre>
<pre style=3D"background:#F6F8FA"><span style=3D"color:#1F2328"><o:p>&nbsp;=
</o:p></span></pre>
<pre style=3D"background:#F6F8FA"><span style=3D"color:#1F2328"><o:p>&nbsp;=
</o:p></span></pre>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"color:#=
1F2328">My build environment is:
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">Linux bld-ub24s-openbmc 6.=
8.0-31-generic #31-Ubuntu SMP PREEMPT_DYNAMIC Sat Apr 20 00:40:06 UTC 2024 =
x86_64 x86_64 x86_64 GNU/Linux<o:p></o:p></span></p>
<pre style=3D"background:#F6F8FA"><span style=3D"color:#1F2328"><o:p>&nbsp;=
</o:p></span></pre>
<pre style=3D"background:#F6F8FA"><span style=3D"color:#1F2328">Output from=
 the bitbake:<o:p></o:p></span></pre>
<pre style=3D"background:#F6F8FA"><span style=3D"color:#1F2328">=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></sp=
an></pre>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#F2F200">WARNING</spa=
n><span style=3D"font-size:9.0pt;font-family:&quot;Lucida Console&quot;">:
<span style=3D"color:#C0A000">Host distribution &quot;<b>ubuntu-24.04</b>&q=
uot; has not been validated with this version of the build system; you may =
possibly experience unexpected failures. It is recommended that you use a t=
ested distribution.<o:p></o:p></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">Loading cache: 100% |#####=
###########################################################################=
########################| Time: 0:00:02<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">Loaded 4747 entries from d=
ependency cache.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">Parsing recipes: 100% |###=
###########################################################################=
########################| Time: 0:00:00<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">Parsing of 2864 .bb files =
complete (2863 cached, 1 parsed). 4748 targets, 673 skipped, 0 masked, 0 er=
rors.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#F2F200">WARNING</spa=
n><span style=3D"font-size:9.0pt;font-family:&quot;Lucida Console&quot;">:
<span style=3D"color:#C0A000">No bb files in default matched BBFILE_PATTERN=
_s2600wf ''<o:p></o:p></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><b><span style=3D"font=
-size:9.0pt;font-family:&quot;Lucida Console&quot;">NOTE</span></b><span st=
yle=3D"font-size:9.0pt;font-family:&quot;Lucida Console&quot;">: Resolving =
any missing task queue dependencies<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">Build Configuration:<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">BB_VERSION&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;2.9.0&quot;<o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">BUILD_SYS&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;x86_64-linux&qu=
ot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">NATIVELSBSTRING&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; =3D &quot;ubuntu-24.04&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">TARGET_SYS&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;arm-openbmc-linux-gn=
ueabi&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">MACHINE&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;s2600=
wf&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">DISTRO&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;=
openbmc-phosphor&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">DISTRO_VERSION&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;nodistro.0&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">TUNE_FEATURES&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;arm thumb arm1176jzs&quot;<o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">TARGET_FPU&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;soft&quot;<o:p></o:p=
></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">meta<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">meta-oe<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">meta-networking<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">meta-python<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">meta-phosphor<o:p></o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">meta-aspeed<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">meta-intel-openbmc<o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">meta-s2600wf&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;master:ecb9886523248ce726b2a45=
2d12a48234d126fc5&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">Sstate summary: Wanted 280=
9 Local 0 Mirrors 0 Missed 2809 Current 2 (0% match, 0% complete)##########=
#############&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 ETA:&nbsp; 0:00:00<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">Initialising tasks: 100% |=
###########################################################################=
########################| Time: 0:00:04<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><b><span style=3D"font=
-size:9.0pt;font-family:&quot;Lucida Console&quot;">NOTE</span></b><span st=
yle=3D"font-size:9.0pt;font-family:&quot;Lucida Console&quot;">: Executing =
Tasks<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#FF7676">ERROR</span>=
<span style=3D"font-size:9.0pt;font-family:&quot;Lucida Console&quot;">:
<span style=3D"color:#D42C3A">PermissionError: [Errno 1] Operation not perm=
itted<o:p></o:p></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A">During handl=
ing of the above exception, another exception occurred:<o:p></o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A">Traceback (m=
ost recent call last):<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A">&nbsp; File =
&quot;/home/rajesh/openbmc/poky/bitbake/bin/bitbake-worker&quot;, line 278,=
 in child<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A">&nbsp;&nbsp;=
&nbsp; bb.utils.disable_network(uid, gid)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A">&nbsp; File =
&quot;/home/rajesh/openbmc/poky/bitbake/lib/bb/utils.py&quot;, line 1696, i=
n disable_network<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A">&nbsp;&nbsp;=
&nbsp; with open(&quot;/proc/self/uid_map&quot;, &quot;w&quot;) as f:<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A">PermissionEr=
ror: [Errno 1] Operation not permitted<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#FF7676">ERROR</span>=
<span style=3D"font-size:9.0pt;font-family:&quot;Lucida Console&quot;">:
<span style=3D"color:#D42C3A">PermissionError: [Errno 1] Operation not perm=
itted<o:p></o:p></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A">During handl=
ing of the above exception, another exception occurred:<o:p></o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A">Traceback (m=
ost recent call last):<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A">&nbsp; File =
&quot;/home/rajesh/openbmc/poky/bitbake/bin/bitbake-worker&quot;, line 278,=
 in child<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A">&nbsp;&nbsp;=
&nbsp; bb.utils.disable_network(uid, gid)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A">&nbsp; File =
&quot;/home/rajesh/openbmc/poky/bitbake/lib/bb/utils.py&quot;, line 1696, i=
n disable_network<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A">&nbsp;&nbsp;=
&nbsp; with open(&quot;/proc/self/uid_map&quot;, &quot;w&quot;) as f:<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A">PermissionEr=
ror: [Errno 1] Operation not permitted<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#D42C3A"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#FF7676">ERROR</span>=
<span style=3D"font-size:9.0pt;font-family:&quot;Lucida Console&quot;">:
<span style=3D"color:#D42C3A">Task (/home/rajesh/openbmc/meta/recipes-devto=
ols/quilt/quilt-native_0.67.bb:do_prepare_recipe_sysroot) failed with exit =
code '1'<o:p></o:p></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#FF7676">ERROR</span>=
<span style=3D"font-size:9.0pt;font-family:&quot;Lucida Console&quot;">:
<span style=3D"color:#D42C3A">Task (/home/rajesh/openbmc/meta/recipes-devto=
ols/quilt/quilt-native_0.67.bb:do_unpack) failed with exit code '1'<o:p></o=
:p></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><b><span style=3D"font=
-size:9.0pt;font-family:&quot;Lucida Console&quot;">NOTE</span></b><span st=
yle=3D"font-size:9.0pt;font-family:&quot;Lucida Console&quot;">: Tasks Summ=
ary: Attempted 5 tasks of which 3 didn't need to be rerun and
 2 failed.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">Summary: 2 tasks failed:<o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">&nbsp; /home/rajesh/openbm=
c/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_prepare_recipe_sysroo=
t<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">&nbsp; /home/rajesh/openbm=
c/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_unpack<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">Summary: There were 2 WARN=
ING messages.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">Summary: There were 2 ERRO=
R messages, returning a non-zero exit code.<o:p></o:p></span></p>
<pre style=3D"background:#F6F8FA"><span style=3D"color:#1F2328"><o:p>&nbsp;=
</o:p></span></pre>
<pre style=3D"background:#F6F8FA"><span style=3D"color:#1F2328"><o:p>&nbsp;=
</o:p></span></pre>
</div>
</body>
</html>

--_000_BN8PR04MB590628BC7BC726C6F3B089A794FF2BN8PR04MB5906namp_--
