Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A001644D10
	for <lists+openbmc@lfdr.de>; Tue,  6 Dec 2022 21:09:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRWj12F4gz3bbF
	for <lists+openbmc@lfdr.de>; Wed,  7 Dec 2022 07:09:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=L35LK6sI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::631; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=ropai@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=L35LK6sI;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20631.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRWhM511zz3bWv
	for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2022 07:08:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5ySOLCitj2epP719NTfrn856krUWhpWJ3cAzvEKQX2G0Ng9mTfnoP0AeXRi+Slxb4dlrcsdGi6zJcqKIfNWUT+N4rB7cgSZXIq8QWgQa5GsLIvs62vVagQ9W/viI1TDnAF8FH9yxwScQ6bN1u3GHQfHhsDzd2dvXbnaxNxnQS9CEyvqezBtJATWzLXAcXIlK+WaqDuUqWVTkF8QkmCiczFxKBHQid4+jfOvhyHd44HrQza33NmAHaFAvm0VyN7JZpfeEONt02YwxYyxJUd9rE4yiaZ8Zt/zctCfVeW3L4Nz/8cqyQkD0pHj8aaiMZ1/RciqV09Uf2CxHGJ+p+4Lhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNgKoAiLjOlGH8h0f9lD9iFv9zmelEAFSgifhS1EW6Q=;
 b=a9seB5PJKMizCDIESPtvsmF03MH9gkSIpzM5Rtcu5AeeiAjYSQyRyhQAYVnFZY9B5J1Ie1XdP4ypyAp058/1OW5O7f9nUmVIw5cUtyQvgJ5QVjgBbz3aBAD9fvDSKwF6GfSHWk/lk77EaQJTcGKPYix2hY5LKro0K4QRY6O/jBVs36tlXGwoS76KC+4ZVrD991WHXQY5egjhX2UNbrfW1h3SgMBXjciCkIOS9wqLJvcmeSivhOaq6QxnN4VK8kalPJmIJtktkK9EutxvZNrUzG+jtXF+Me7YcTZzr841DZpgexYZq3Kq7Md+aEuSnQI5yyT/9gevyDF6QxLPhMl/6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNgKoAiLjOlGH8h0f9lD9iFv9zmelEAFSgifhS1EW6Q=;
 b=L35LK6sIdqcCWTbXFeB0VMlsGLYWyy+HywW3+cbHm/Trz/h7yoFvYJJwvTI03j+FP7MP7NJ/YJR+AkS10qSvdfbD1YDCUR00FWf0o6w03XHP8Cup5CsSA3g4H/heerg+pGDJyEgzDBXDbm+WM9IFjUulrlZhxo4WIHNLLvoyIbU2bmn8bxvQoc48SpHfnpv8Kg9Xsw67PWRgXY6FJKXUL5hSWmkP7A2Zq9L5TnwT6sfJsSfVaqUO1DgHTIT6EqwQuYFuqF4uVtgDajxWoXU8o4/N19tTsjD7zJw192IxxHce3h9QijV0OYFSGFn+T/9mDxHJ2t/TS3cL286iNQtJug==
Received: from LV2PR12MB6014.namprd12.prod.outlook.com (2603:10b6:408:170::18)
 by PH0PR12MB8152.namprd12.prod.outlook.com (2603:10b6:510:292::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Tue, 6 Dec
 2022 20:08:26 +0000
Received: from LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::3b0:528b:6b8e:7e02]) by LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::3b0:528b:6b8e:7e02%3]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 20:08:26 +0000
From: Rohit Pai <ropai@nvidia.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [jffs2] handling flash corruption
Thread-Topic: [jffs2] handling flash corruption
Thread-Index: AdkJqILm4mUCK9dWS6uTwPMluau1bg==
Date: Tue, 6 Dec 2022 20:08:26 +0000
Message-ID:  <LV2PR12MB6014DB772E0529929A1C3091CD1B9@LV2PR12MB6014.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB6014:EE_|PH0PR12MB8152:EE_
x-ms-office365-filtering-correlation-id: fd324c1b-3f86-46ca-2f4d-08dad7c5a29f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  5Cq3A2HBDqMfziwnlcfoh3YvYLgTG2D3OnIGcFTVt9bEC6ZatQm+owN1vmkI2BUMj8h+UKKmSVH1nklXfVk/tsG+VdAg9k6yfCSV0QlNj+hUsduPO5Bf47zxBBuHXfYsNqH2ExerzTQDxkRu1x10G6WeU3gP8jEQDXgP3R6COmaB9dq3rc0WJraD+KjFTL6d/+AgxCgBeSeD5PuedGH+SvCiGPbsINlJ8kewBx/utvV7lDwDHL7YTk71xxBpY9MU1CDcDKXG6fa0B5FprNUXw8JSjs6U79t8Pow7KCLZ6ux7TPgfaj/mpsNshJbZd2vCKG4nNJVZGDvFprmsDlS2ZShwAP280AGsSlsfVgeBLmu25vx1LjntwP/08pPVBhrXGS3ROG3NrDXvEsGIf16EvDKNlp8aHGYp0Pzj4zPZ/1XTtMAP5bEv8KQUoef2fzD6da1lMIiJp0QmqJO1sj9JEjFv9bCU7bnQGAp40uNu/6KQfbGfZGlK+F21d2V9lYvlcNDPw7bTnFBZePeGCASlFxI46nwFEKjsoTRlUjW8PssjHUl8DcH2OBn3bVT6BdQtSwYKji0fDNBJ1rq+LcEuS2LDiuSgw34ho21fqjGQoI5ao1tCc9Z/cb0KM2+30PZ6tdvK9wVjIsFNeriN4660AUktAcv3+cdxkvNioKVyLSlWQtRRARfNXwB1LaanthE/pqppuJ6YZDeZiBwP73XaJYe8oDpjyvgu7Qx2czl1l3WXfLLlWWJe6hnjw0vn6TsYPDWiiaHXFpF7TMFEZ/2zbEJxxsdWnV5HMoszmCD12i9PP+sOJsh+h+9GsTBk+HgmAN5jLw4Iiw0FfJX4G8CzxQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB6014.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(396003)(376002)(39860400002)(451199015)(26005)(9686003)(6506007)(478600001)(316002)(166002)(6916009)(66556008)(66476007)(76116006)(71200400001)(66946007)(8676002)(66446008)(64756008)(7696005)(52536014)(5660300002)(8936002)(83380400001)(41300700001)(38070700005)(186003)(2906002)(122000001)(38100700002)(33656002)(55016003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?QT+/0RloEqxU/cf0y0DijAid1L2yR5hSSjChummiHgDCf8eqqP5RO1weM/iQ?=
 =?us-ascii?Q?JHZIha/FXMNNmvWqTF9JdIj5n5jzecvX2O2ZDOFtrl6JnWIB9P/oE3IKeH4R?=
 =?us-ascii?Q?nDK5dscm82gQ2o7mWX9zLnOd2JX0A4uAA2pAdyvfhaiRNJy78pJfy/mLsjZD?=
 =?us-ascii?Q?4LL/rI85Vh0oJyPYfYX787arHapZUAWuR8Le9VOvMSEWkqxyxo+jmE0VK1rF?=
 =?us-ascii?Q?T7FJlNrftFl7K1zSnBkbu618iwi5nW8hvnr7lw7i0cJkbtdybecWC0QiVWf3?=
 =?us-ascii?Q?Vvyb0srAyftxB3yjR3iOJwmiitFsRn8Rl8vntWfhsV/XZ9HbA1Ej6CVZGlLh?=
 =?us-ascii?Q?vvIxXbSFA93WjNif8HLQUKRNrOhrMXnldY9Nfw57s7JEKkIXXx6lXrKaqzaw?=
 =?us-ascii?Q?zkEoDK2DMJgoxMA6qyjfDSF0NQDgFOLfvmOUcC8CMGgJajN5vE/fr3axg5x5?=
 =?us-ascii?Q?t967hIlRJGmJ1gURqIHXN258reUZb9IIRDyDxoYs31qVJwOG6c4hrmXRhMs/?=
 =?us-ascii?Q?JC/wrIcBK7sWOMKJyje07Emig3AYl9SnCvY3Vkzn1WSdVXNj1Mm/4XKwb/Uh?=
 =?us-ascii?Q?XiwlciPNESN497wzQFfKYB4tTl1ohZLfIPNv+jiLC/FXJtSzSyyuztVirMjn?=
 =?us-ascii?Q?19tcyIIXF4DH6NQ9pQl0sMLjVwLgaBcMrBW6aKlnZicLEFBwmax0apelEbS/?=
 =?us-ascii?Q?tYc0pnoHTspVwhsprgoFJyED7oE8SA590EZSxbkDB9hrc9/lZ/+XRsWaOuXe?=
 =?us-ascii?Q?g05vjc1IzFk1uEsI+whQhMCvGbcwrx459COG4Z1n8Z40hcV1/sLn3QYTCqNt?=
 =?us-ascii?Q?3eJwigNWUkslswZ/zsafYvDhA1+YCX6f4eOJJxXUXs0cEQZiO1IYJBgJ5eNr?=
 =?us-ascii?Q?GY/nJe4fQK3JbPGet3tOPgIhA2RPTI9r/IquZCx/C81ucm30M3Pn0u4uDrRS?=
 =?us-ascii?Q?VehQKSdnNT2ECnRPdOMfobJSkrlun5kNqV4F/yOkcepgPOzxuZHnvciYhhx0?=
 =?us-ascii?Q?XPOP5tPoww4MJ5atC2p6R0zxwym309/n4OsDeqLsUbtuwsHicFHJLXtWyjoe?=
 =?us-ascii?Q?o2MmLf2qGkIB7z1Tinla023xBecuPE63re6xJHFxkD4qbOhJnR6+MTkExusg?=
 =?us-ascii?Q?InbLVEMS4FRG3rWq6I+d4tAbo18blQRcDlfPMTKUpnZdVS4HfLOme5IGKhak?=
 =?us-ascii?Q?mv8NOuGFMj0qO3kEAJmJx3cyvHUdYc3bgmb/fqJVlDyeZkc9m0LIfZUPqRG4?=
 =?us-ascii?Q?f+vN2vZuzDfTwBMlMjHol2nDzOcCI6ONRbv03rwAuLfX95sJxNj5kRfg5848?=
 =?us-ascii?Q?QhyGmN8YBKqB3TmhO2P/L8VpGQCGwMJqkioABTBZ21gflffJylEHkfCO8NdH?=
 =?us-ascii?Q?tNjnk8Qon2ullfkEVQlkIr27vK/QZ+f5oY/R1iG+OvYCkCAiRBvlYSnCoFtc?=
 =?us-ascii?Q?L7t2Eq5dhH/+xvFK2uQp8LguNCh0fHnMvQk3bWb2IZ/QLL4ca/sD2EahwYCo?=
 =?us-ascii?Q?J3XIQQP0y4P94HfGfIoLA20tVKuDGruXILJJREPRI637hpT7bhh2R0mZwlQo?=
 =?us-ascii?Q?vp131kGzoqs4nEAF9Ks=3D?=
Content-Type: multipart/alternative;
	boundary="_000_LV2PR12MB6014DB772E0529929A1C3091CD1B9LV2PR12MB6014namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB6014.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd324c1b-3f86-46ca-2f4d-08dad7c5a29f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 20:08:26.2592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FUhgI4g2+8LrbBnLb+f9upSToF3WvpE02LnZZvKWoiaQNV6D2bR7e1RyP+vxQxDXKbIYlzNIAEW6qh7HPFbpeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8152
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

--_000_LV2PR12MB6014DB772E0529929A1C3091CD1B9LV2PR12MB6014namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear Team,

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
nd at 0x06f90020: 0x8504 instead
[  279.805319] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x06f90024: 0x75a3 instead
[  279.805327] jffs2: Further such events for this erase block will not be =
printed
[  279.817370] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x06fa0000: 0x0b14 instead
[ 279.848078] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not foun=
d at 0x06fa0004: 0x1baa instead
[  279.860240] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x06fa0008: 0xb9c1 instead
[  279.872368] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x06fa000c: 0x4d18 instead

These errors start to come when any file system related commands are execut=
ed from the obmc-init.sh<https://github.com/openbmc/meta-phosphor/blob/mast=
er/recipes-phosphor/initrdscripts/files/obmc-init.sh#L417> file.

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

I see some reference to fsck<https://github.com/openbmc/meta-phosphor/blob/=
master/recipes-phosphor/initrdscripts/files/obmc-init.sh#L378>. This is not=
 working in our platform because we don't have fsck.jffs2. It could be pack=
aging issue which can be solved.
Can we trust fsck to capture all possible flash corruption ? Could it be po=
ssible that fsck does not detect anything but when jffs2 mounted then it ca=
n start to fail ?

Thanks
Rohit PAI





--_000_LV2PR12MB6014DB772E0529929A1C3091CD1B9LV2PR12MB6014namp_
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
	{font-family:"Abadi Extra Light";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Dear Team, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We have 256MB of spi nor flash on our platform. <o:p=
></o:p></p>
<p class=3D"MsoNormal">Its split into multiple partitions as mentioned in t=
he table below.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoTableGrid" border=3D"1" cellspacing=3D"0" cellpadding=3D=
"0" style=3D"border-collapse:collapse;border:none">
<tbody>
<tr style=3D"height:20.65pt">
<td width=3D"132" valign=3D"top" style=3D"width:98.7pt;border:solid windowt=
ext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:20.65pt">
<p class=3D"MsoNormal">Block / size<o:p></o:p></p>
</td>
<td width=3D"57" valign=3D"top" style=3D"width:42.4pt;border:solid windowte=
xt 1.0pt;border-left:none;padding:0in 5.4pt 0in 5.4pt;height:20.65pt">
<p class=3D"MsoNormal">File system<o:p></o:p></p>
</td>
<td width=3D"609" valign=3D"top" style=3D"width:457.1pt;border:solid window=
text 1.0pt;border-left:none;padding:0in 5.4pt 0in 5.4pt;height:20.65pt">
<p class=3D"MsoNormal">Usage <o:p></o:p></p>
</td>
</tr>
<tr style=3D"height:14.35pt">
<td width=3D"132" valign=3D"top" style=3D"width:98.7pt;border:solid windowt=
ext 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.35pt">
<p class=3D"MsoNormal">/dev/mtdblcok5 (0.5MB)<o:p></o:p></p>
</td>
<td width=3D"57" valign=3D"top" style=3D"width:42.4pt;border-top:none;borde=
r-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowt=
ext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:14.35pt">
<p class=3D"MsoNormal">None<o:p></o:p></p>
</td>
<td width=3D"609" valign=3D"top" style=3D"width:457.1pt;border-top:none;bor=
der-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windo=
wtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:14.35pt">
<p class=3D"MsoNormal">Stores copy of uboot env<o:p></o:p></p>
</td>
</tr>
<tr style=3D"height:23.2pt">
<td width=3D"132" valign=3D"top" style=3D"width:98.7pt;border:solid windowt=
ext 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:23.2pt">
<p class=3D"MsoNormal">/dev/mtdblcok6<o:p></o:p></p>
<p class=3D"MsoNormal">(16MB)<o:p></o:p></p>
</td>
<td width=3D"57" valign=3D"top" style=3D"width:42.4pt;border-top:none;borde=
r-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowt=
ext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:23.2pt">
<p class=3D"MsoNormal">Jffs2 <o:p></o:p></p>
</td>
<td width=3D"609" valign=3D"top" style=3D"width:457.1pt;border-top:none;bor=
der-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windo=
wtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:23.2pt">
<p class=3D"MsoNormal">Read write file system <o:p></o:p></p>
<p class=3D"MsoNormal">This is overlayed with read-only file system from th=
e image and mounter at &#8216;/&#8217;<o:p></o:p></p>
</td>
</tr>
<tr style=3D"height:23.2pt">
<td width=3D"132" valign=3D"top" style=3D"width:98.7pt;border:solid windowt=
ext 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:23.2pt">
<p class=3D"MsoNormal">/dev/mtdblock7<o:p></o:p></p>
<p class=3D"MsoNormal">(200MB)<o:p></o:p></p>
</td>
<td width=3D"57" valign=3D"top" style=3D"width:42.4pt;border-top:none;borde=
r-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowt=
ext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:23.2pt">
<p class=3D"MsoNormal">Jffs2<o:p></o:p></p>
</td>
<td width=3D"609" valign=3D"top" style=3D"width:457.1pt;border-top:none;bor=
der-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windo=
wtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:23.2pt">
<p class=3D"MsoNormal">Log partition <o:p></o:p></p>
<p class=3D"MsoNormal">Used for storing logs and bmc dumps <o:p></o:p></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are seeing flash corruption in few of our shipped=
 products which undergo repeated power cycle test.
<o:p></o:p></p>
<p class=3D"MsoNormal">The continuous power cycle test seems to somehow cor=
rupt the data flash and on the next boot either we end up in kernel panic d=
uring init or there is recovery tried by the file system which never seem t=
o end successfully, and the application
 don&#8217;t start well. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">When the flash is corrupt, we repeatedly see jffs2 e=
rrors as shown below.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Abadi Extra Light&q=
uot;,sans-serif;color:#203864;mso-style-textfill-fill-color:#203864;mso-sty=
le-textfill-fill-alpha:100.0%">[ &nbsp;279.805305] jffs2: jffs2_scan_eraseb=
lock(): Magic bitmask 0x1985 not found at 0x06f90020:
 0x8504 instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Abadi Extra Light&q=
uot;,sans-serif;color:#203864;mso-style-textfill-fill-color:#203864;mso-sty=
le-textfill-fill-alpha:100.0%">[ &nbsp;279.805319] jffs2: jffs2_scan_eraseb=
lock(): Magic bitmask 0x1985 not found at 0x06f90024:
 0x75a3 instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Abadi Extra Light&q=
uot;,sans-serif;color:#203864;mso-style-textfill-fill-color:#203864;mso-sty=
le-textfill-fill-alpha:100.0%">[ &nbsp;279.805327] jffs2: Further such even=
ts for this erase block will not be printed<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Abadi Extra Light&q=
uot;,sans-serif;color:#203864;mso-style-textfill-fill-color:#203864;mso-sty=
le-textfill-fill-alpha:100.0%">[ &nbsp;279.817370] jffs2: jffs2_scan_eraseb=
lock(): Magic bitmask 0x1985 not found at 0x06fa0000:
 0x0b14 instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Abadi Extra Light&q=
uot;,sans-serif;color:#203864;mso-style-textfill-fill-color:#203864;mso-sty=
le-textfill-fill-alpha:100.0%">[ 279.848078] jffs2: jffs2_scan_eraseblock()=
: Magic bitmask 0x1985 not found at 0x06fa0004:
 0x1baa instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Abadi Extra Light&q=
uot;,sans-serif;color:#203864;mso-style-textfill-fill-color:#203864;mso-sty=
le-textfill-fill-alpha:100.0%">[ &nbsp;279.860240] jffs2: jffs2_scan_eraseb=
lock(): Magic bitmask 0x1985 not found at 0x06fa0008:
 0xb9c1 instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Abadi Extra Light&q=
uot;,sans-serif;color:#203864;mso-style-textfill-fill-color:#203864;mso-sty=
le-textfill-fill-alpha:100.0%">[ &nbsp;279.872368] jffs2: jffs2_scan_eraseb=
lock(): Magic bitmask 0x1985 not found at 0x06fa000c:
 0x4d18 instead<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">These errors start to come when any file system rela=
ted commands are executed from the
<a href=3D"https://github.com/openbmc/meta-phosphor/blob/master/recipes-pho=
sphor/initrdscripts/files/obmc-init.sh#L417">
obmc-init.sh</a> file. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Abadi Extra Light&q=
uot;,sans-serif;color:#203864;mso-style-textfill-fill-color:#203864;mso-sty=
le-textfill-fill-alpha:100.0%">mount -t overlay -o lowerdir=3D$rodir,upperd=
ir=3D$upper,workdir=3D$work cow /root<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">So basically, it appears like jffs2 is trying to rec=
over the file system but because of the type of corruption it could not, an=
d we are starting the overlay in a bad state which can subsequently trigger=
 a kernel panic. The flash corruption
 is mainly happening because of repeated power cycle test and some of the a=
pplication (logging, debug collector, etc) trying to write something into f=
lash and causing a corruption. The reproduction seems to be very difficult =
we saw one failure after 5K loops
 of test. We also tried to manually corrupt the flash by writing junk data =
to it, but it did not recreate the same issue.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Has someone seen similar type of issue ? <o:p></o:p>=
</p>
<p class=3D"MsoNormal">Do you any recommendations to solve issue ?<o:p></o:=
p></p>
<p class=3D"MsoNormal">Is there a way to recreate such corruption manually =
for testing purpose ?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">One solution we have in mind is to check the return =
status of all commands in obmc-init script around rwfs and when these comma=
nds fail try to boot with read-only file system.
<o:p></o:p></p>
<p class=3D"MsoNormal">But we are not sure if it can work in all cases, if =
the commands work and still jffs2 causes kernel panic in the background syn=
c then we will have the same problem.
<o:p></o:p></p>
<p class=3D"MsoNormal">Any thoughts of how to detect the corrupted flash in=
 obmc-init and avoid using it ?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I see some reference to <a href=3D"https://github.co=
m/openbmc/meta-phosphor/blob/master/recipes-phosphor/initrdscripts/files/ob=
mc-init.sh#L378">
fsck</a>. This is not working in our platform because we don&#8217;t have f=
sck.jffs2. It could be packaging issue which can be solved.
<o:p></o:p></p>
<p class=3D"MsoNormal">Can we trust fsck to capture all possible flash corr=
uption ? Could it be possible that fsck does not detect anything but when j=
ffs2 mounted then it can start to fail ?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks <o:p></o:p></p>
<p class=3D"MsoNormal">Rohit PAI <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Abadi Extra Light&q=
uot;,sans-serif;color:#203864;mso-style-textfill-fill-color:#203864;mso-sty=
le-textfill-fill-alpha:100.0%"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Abadi Extra Light&q=
uot;,sans-serif;color:#203864;mso-style-textfill-fill-color:#203864;mso-sty=
le-textfill-fill-alpha:100.0%"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_LV2PR12MB6014DB772E0529929A1C3091CD1B9LV2PR12MB6014namp_--
