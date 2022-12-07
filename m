Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D9A64570E
	for <lists+openbmc@lfdr.de>; Wed,  7 Dec 2022 11:05:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRtFb1P8dz3bgP
	for <lists+openbmc@lfdr.de>; Wed,  7 Dec 2022 21:05:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CBnviMOx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::631; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=ropai@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CBnviMOx;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20631.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRtF132Swz3bP6
	for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2022 21:04:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/CPzcjxw8JAtoF5RGuJlkHgssE23KC/3RpBqYnJ00wiB/sAdR0eM1ampo7BoxlN0aGJ3LNTFKLFTJsmRz4K9/kNDc+PYUhDd4tLCgXEW8NvmyW/EaOEnai6OD/VYcYriQVKM66sL6slKGDP6mCAFFD+uiMFFJ0ISvuCGsfvGzjHkAPKHe20ABrVXsT2PEymlmbGUyEGjXP06vHCfNHnx+AkxOl7NuNv975OErUK3G6ie5tEqC/gKpUaT2Sp5m0JXmSq19bAiAKx+WXT0aH/3u512Bmc5kXZDcg4naCUOxSfg8oqLgONVEJO1XJlKI5qPqnHyr306IDJaaB94ZRLHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlXrXb92gjoxqmzVkwpwYbhGrLhNG4k9qWkmZj2Cb9A=;
 b=EmZWP7oMoDaoYHi+TiG4YtM1zCrxxIZNMXDQKnmZEZZ36bYPIs/RjZkxRIrerTcMjfgfmlSec/fT+iwgMjR/y2+798+eGcF/346t0Xs1detPbw9fKAvftmUvSPHSN03O+tRIpZ4vosV+mXUQwkjvAShkAao3znI12ovg4L3lUuz2Fmol+iM5rVAF1dmyuYWEigelzpCiJfP7wD3bZFf55vYN+j13A5ziPOoRyY+JqS2EiYkycA0ZmrnPqziZdi7n/qegnjHxhrXd0LIRByUhyacTNk9T76EeKKE+GWeG1ZCwlV6WTREiEV+RGmzZHsEtW4WIyXEb2MlPKAz+0KeK5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlXrXb92gjoxqmzVkwpwYbhGrLhNG4k9qWkmZj2Cb9A=;
 b=CBnviMOxgaTyp3KRQBQrbPh0DKNljdrUF/jYWUIqikc6gCRR6nEc2aNzBRfcxVqNiTuqO1UjBsEZWFqEnxD82JcRgTTs1AWiBMtPi+WIDDQabQ0kwn20R3tAUHuLF2It1PC+czMQrfw1OTK5Y3DE3iNA1ZWT17pNVtCxocj1rMj/HfvRcEHP+WfS7PLMDsjaFhdro6m4Zn9PpybQO+VGkNgFDw2I/w3vOduDDSXDL8Yt9rfQJ5grKH86ArBAQhIuyI5VCX+rkdIui3PyKm1i55iF6gwGnL6MaXfE45fiqiqCINlTPQ5ZjBtQMYPEwX0hrbkGRHU5W9jop7XCCnKpeg==
Received: from LV2PR12MB6014.namprd12.prod.outlook.com (2603:10b6:408:170::18)
 by MN0PR12MB5980.namprd12.prod.outlook.com (2603:10b6:208:37f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 10:04:30 +0000
Received: from LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::3b0:528b:6b8e:7e02]) by LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::3b0:528b:6b8e:7e02%3]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 10:04:30 +0000
From: Rohit Pai <ropai@nvidia.com>
To: Milton Miller II <miltonm@us.ibm.com>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: RE: [jffs2] handling flash corruption
Thread-Topic: [jffs2] handling flash corruption
Thread-Index: AdkJqILm4mUCK9dWS6uTwPMluau1bgAHaidNABLGExA=
Date: Wed, 7 Dec 2022 10:04:29 +0000
Message-ID:  <LV2PR12MB601457EBBB307CC6357F984FCD1A9@LV2PR12MB6014.namprd12.prod.outlook.com>
References:  <LV2PR12MB6014DB772E0529929A1C3091CD1B9@LV2PR12MB6014.namprd12.prod.outlook.com>
 <DM6PR15MB41210ADFE04E00AA9635F34D8B1B9@DM6PR15MB4121.namprd15.prod.outlook.com>
In-Reply-To:  <DM6PR15MB41210ADFE04E00AA9635F34D8B1B9@DM6PR15MB4121.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB6014:EE_|MN0PR12MB5980:EE_
x-ms-office365-filtering-correlation-id: f57a5ea8-ea06-48fd-004f-08dad83a6e7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6lxrOVeZVUZA/mm4JT6FUPtqy2J8uIL5S7yrO+5OYjGkTNiZW6OE64gG14wXmFqHAtmT7Y3u8gWj/gMRte76gfgES/I473LlK0krSgFn5DNGfPxqUUhhNAJIZevtQyBXEaeEMqYVBXpnsWGYnrK/cqh8jQrcwGWAlyNEtNVU82qRzz8HtqMI+R2bDKU9ZWvMs4W2f20Ql9/ifsgikDtVtXFNucMPKUeviwlg+DC7Mq6rGD0DSv24gH8FB2bjmz6rX5HiNAnL/AIQyig68ZkjOXCCtqC2rCsNE2C/dyHtzGAG1QDg6Y7wBk+UE1gY4Ol9U9PzIoq2XEnv5UTiQFkjFfxd32n77vcb9tSseBz53h7/PlIEBHSgt5WzXXjBovRd/R4FswxBpk37CPM0wPzWraQSKNWEPN+kgnTkNTKvA2Qi06Wj2H/4RlKiZhMb8Gh2WWxDN7LPGkKbwe+a8rL2WcfC7c0rc3Fg3wDGjwbThVvUhiSO0m+qIjaolRKImFMrvxYz8kRn1lfC2STCI0G4JqahPMEkwhoFHdsLBH0aG8jufoA18RA7thBFO3eZMK458m0TIhjiVl4Js+qGb8qtRkbVfpDx+uCAXt412vRdsdBiBf6TmkdW5lhLvEVaUbPPZYJpeDTGPvijGxz5Krj6tYywq32R3/xP0TwJLPK2z+g/tRzPYI4vfnVtNi4KELDkQAyIumSqyy4mHSGO84DG/gfkYTNv5oP810IQ4t4lz29TUdmsjGU4FMQuv9cCWxamCwvFe7lhCJAoMekwVl36T50nR//wz4rPnDcmxnlOkFw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB6014.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199015)(38100700002)(66476007)(38070700005)(86362001)(122000001)(52536014)(55016003)(8676002)(66556008)(8936002)(2906002)(83380400001)(33656002)(76116006)(66946007)(110136005)(186003)(316002)(71200400001)(478600001)(5660300002)(41300700001)(966005)(7696005)(6506007)(9686003)(26005)(66446008)(64756008)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?uz1lXOn9AOOFv6Z6K1vdM86rxbXJgCxcPdi5IQ9r1OjphAB/8ptJ9ZCSqGbl?=
 =?us-ascii?Q?sRsHengi2L91FcrfZDWOAoEemwOEz39yy99xxQt/64ogALZJj0dyUTO8FCbB?=
 =?us-ascii?Q?Cb8rsVF89/LRkh4uglGqu5+DuDlQ+vv6k+8qldJ/UPxYrdTaEjiXenUY2qXS?=
 =?us-ascii?Q?yh1daQ12LJFsYG816vBH4H0WZ1JhVKClXKwmzIA0d/pmBMje5q7zfjed21Ag?=
 =?us-ascii?Q?x5xaPvQuA4DfVPU1aoGnH+WCYnCzTqFqJhAAsIMoRcvbcFgyfP1YNzUKy0i4?=
 =?us-ascii?Q?FV4MML8Hz3ogYICWOAaCnUtemF966zJeyppt3QZm6i84LswMuBHmHJA/CdWo?=
 =?us-ascii?Q?YnvYx1VI9FMSuiK9M1wijbPPvIQNEYQSGPyM5W1lNgTtpcflHIiAIHXHzox4?=
 =?us-ascii?Q?dL39+NKZnXXQuvGz8OIKCN7CsgACA17yMZCo9cz2wzMYZHjbWqVPCoNhbQQf?=
 =?us-ascii?Q?EsF8Qa6FxpCmGl22v5sDC/GhQjVBFNEnDiDQyTPYQr8MK3tmCpLoQYrVCFlN?=
 =?us-ascii?Q?BGBfZY8fDGjPRhdmg2JyanL1EwOl7nV1CrojazNYF5zmYCPq5z7Hf0mbuR9X?=
 =?us-ascii?Q?L/9HEoYn/B6pYbA62deYAh0syM3TU6CMbBBEcUKVF+RtFxIDBFZ4xjgYG0ih?=
 =?us-ascii?Q?1DiAtCU79PspPldiEHJLdf4vTiyP644dnebdEkRmL1NweuvpWcVUiuX4J4Iy?=
 =?us-ascii?Q?Ue3bOpqWnzO44CqD2Vw+pBv3jYZzkXRsn3JSGxHRidKxX2DEk+ryj7TMB+99?=
 =?us-ascii?Q?1gSOQYNIto2qgPzQoy3R78WCuqr5q72mgX5FEIrzWsLjLfoainYBJIBMk+1P?=
 =?us-ascii?Q?HOEshd9flZOSnYd2Ocfzo7ct+eD1fLf3OZQu2drhsa1bhyUx49LUj7zIx3Uj?=
 =?us-ascii?Q?2TlIZCEAzWy9JuR8rGBUCQaEr3kIeqVDaOk+GYP0GCAzIqoXSy1kfgvNRK8P?=
 =?us-ascii?Q?KhUEfz06SM7JtP1PQnX1euX/i7K3EyAPqAKh5r46bHW6rWXjt/iua4MOLOYm?=
 =?us-ascii?Q?hFaYQLy2aDZTASRRVMd73rYN/JMaW1/mXDJ0nwpO2xzAxYMzAFWPdfjw83GL?=
 =?us-ascii?Q?zKpNmkB0W1c1g5WHE6Ja3q70IizxaDQpCkblncX8w7FolhPI3V63laGATc8f?=
 =?us-ascii?Q?dGZaMgSZjVoLvW029uEw+n51RSy/CjNClcatKeFE5t4TPIap5J3Hq8dOuXco?=
 =?us-ascii?Q?AjS0zkEzaKY6BtpoCQv4KGvIf1cf0umxwZdNvjtSfV08kal8HTu9SlLkR7jB?=
 =?us-ascii?Q?tPMKJc/CSmasJm7QDmaLgrfhPGdBLUHL4VGmy+QhufmzMiZLqjLjuGYxfKXH?=
 =?us-ascii?Q?DMWnmCQB3tjXcm07ClrKV9KbOG43xcDKXHqE9kP97fnCSH7PvNSmO1mqIWKF?=
 =?us-ascii?Q?dCpVqckPQnI3DpQ+PLT+cCeOCJj6edOSJFKRR1gwUpF9VHM61rmuWVzDxED8?=
 =?us-ascii?Q?Qj66RqIG/A1JktvypWS3lUjzXpXARowRqYxjGRKU4cjQCy2x9YA0Ndu6Z08N?=
 =?us-ascii?Q?1zRyuPiwsdQ4waQDkcsRDtMLG4/839xcTWFsGex0LL1nXTofkjmsKtAghyOT?=
 =?us-ascii?Q?3kjYiKJjM69s/wABjJA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB6014.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f57a5ea8-ea06-48fd-004f-08dad83a6e7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2022 10:04:29.9110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DtuczLrU1amonksP5NXIXVY9ePiPHRnRiD7HPYBtkk7wYykfNqjylNZjFqPnPSHhRewIVUQQiTsijZZ1NjI5zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5980
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

Hello Milton,=20

Thanks for the reply. Yes, we use Aspeed spi-nor controller driver.
So how did you manage to solve the issue ?  are there any patches to the dr=
iver code ?=20

Thanks=20
Rohit PAI=20

-----Original Message-----
From: Milton Miller II <miltonm@us.ibm.com>=20
Sent: Wednesday, December 7, 2022 4:52 AM
To: Rohit Pai <ropai@nvidia.com>; openbmc@lists.ozlabs.org
Subject: Re: [jffs2] handling flash corruption

External email: Use caution opening links or attachments


Hi Rohit

You didn't say which spi controller you are using, but we did see similar e=
rrors when developing the Aspeed spi-nor controller driver.

The arm io_memcopy is aliased to the optimized for memory memcopy and is no=
t suitable for use with fifo io windows that send data to  the flash, as it=
 will stutter and perform overlapping reads or writes depending on the sour=
ce and destination alignment.  The jffs2 file system definitely triggers su=
ch unaligned writes.

The comment in the older driver explains this (here's a link into v5.0 kern=
el

https://github.com/torvalds/linux/blob/1c163f4c7b3f621efff9b28a47abb36f7378=
d783/drivers/mtd/spi-nor/aspeed-smc.c#L204

milton

PS I'm not aware of a fsck for jffs2.   Another symptom was fsck would show=
 names
with 4 garbage characters for the old files.

-----------  Apologies for top posting and not quoting the reply to: ------=
------ Dear Team,

We have 256MB of spi nor flash on our platform.
Its split into multiple partitions as mentioned in the table below.

Block / size
File system
Usage
/dev/mtdblcok5 (0.5MB)
None
Stores copy of uboot env
/dev/mtdblcok6
(16MB)
Jffs2
Read write file system
This is overlayed with read-only file system from the image and mounter at =
'/'
/dev/mtdblock7
(200MB)
Jffs2
Log partition
Used for storing logs and bmc dumps

We are seeing flash corruption in few of our shipped products which undergo=
 repeated power cycle test.
The continuous power cycle test seems to somehow corrupt the data flash and=
 on the next boot either we end up in kernel panic during init or there is =
recovery tried by the file system which never seem to end successfully, and=
 the application don't start well.

When the flash is corrupt, we repeatedly see jffs2 errors as shown below.

[  279.805305] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x06f90020: 0x8504 instead [  279.805319] jffs2: jffs2_scan_erasebloc=
k(): Magic bitmask 0x1985 not found at 0x06f90024: 0x75a3 instead [  279.80=
5327] jffs2: Further such events for this erase block will not be printed [=
  279.817370] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not foun=
d at 0x06fa0000: 0x0b14 instead [ 279.848078] jffs2: jffs2_scan_eraseblock(=
): Magic bitmask 0x1985 not found at 0x06fa0004: 0x1baa instead [  279.8602=
40] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x06f=
a0008: 0xb9c1 instead [  279.872368] jffs2: jffs2_scan_eraseblock(): Magic =
bitmask 0x1985 not found at 0x06fa000c: 0x4d18 instead

These errors start to come when any file system related commands are execut=
ed from the obmc-init.sh file.

mount -t overlay -o lowerdir=3D$rodir,upperdir=3D$upper,workdir=3D$work cow=
 /root

So basically, it appears like jffs2 is trying to recover the file system bu=
t because of the type of corruption it could not, and we are starting the o=
verlay in a bad state which can subsequently trigger a kernel panic. The fl=
ash corruption is mainly happening because of repeated power cycle test and=
 some of the application (logging, debug collector, etc) trying to write so=
mething into flash and causing a corruption. The reproduction seems to be v=
ery difficult we saw one failure after 5K loops of test. We also tried to m=
anually corrupt the flash by writing junk data to it, but it did not recrea=
te the same issue.

Has someone seen similar type of issue ?
Do you any recommendations to solve issue ?
Is there a way to recreate such corruption manually for testing purpose ?

One solution we have in mind is to check the return status of all commands =
in obmc-init script around rwfs and when these commands fail try to boot wi=
th read-only file system.
But we are not sure if it can work in all cases, if the commands work and s=
till jffs2 causes kernel panic in the background sync then we will have the=
 same problem.
Any thoughts of how to detect the corrupted flash in obmc-init and avoid us=
ing it ?

I see some reference to fsck. This is not working in our platform because w=
e don't have fsck.jffs2. It could be packaging issue which can be solved.
Can we trust fsck to capture all possible flash corruption ? Could it be po=
ssible that fsck does not detect anything but when jffs2 mounted then it ca=
n start to fail ?

Thanks
Rohit PAI



