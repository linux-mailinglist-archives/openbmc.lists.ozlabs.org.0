Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7CA63F236
	for <lists+openbmc@lfdr.de>; Thu,  1 Dec 2022 15:05:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNHrw1GF0z3bY1
	for <lists+openbmc@lfdr.de>; Fri,  2 Dec 2022 01:05:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Lef7A2Hp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::60e; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=ropai@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Lef7A2Hp;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNHrH578Wz3bXL
	for <openbmc@lists.ozlabs.org>; Fri,  2 Dec 2022 01:04:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaqWBWS7rpLibBm9Bm+hm7RrQaZdnbkgMoCA98KpZLqZ8pbqLcYnwOJl50McAYnq5JrTc++IogaN2mwLdyfJOAUn5TTyIoMmGxr72wt906adWzUrVkPkH8PUhp48kyBoCW4sa0jfi8rMtvoU7jrCEOMJz87VkmY2E0xgz7GzbnYD3qptyv1F8Q97gjTnMbA2qm2QEa1KfRNwC0FcL0vpX8E6FabQ34F8TA9z2zMhqa6d8rv4q9+w1AzWU3ebplFeyH7GzWlQvrLy5BsMmu83oF6aF3Y+vfw2ZQeK+B3Geh71XRCyAZuvbt+dP6i8kd8cdlPJPe+P68P6Dj9jGDYldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLXgKsqgCtCvH98GnGsLwON7yA6kAO/p0vYYhUacF9o=;
 b=NszdnsavnaaHmdjrvFXSi7DZmQNzAx5/L6Pvk6NLmiJXjSezJp71SDMsXkKvU44RjdklqmqD+uRFBuIj6xzAiuQF8afARV/V5+9A5SnGI8yORx1/K/6InKNXzMfx+xg2z1Mf3Pl5CSQZ1p6NUR3jWhU3RynQxjjVc/ntfEoqtSXpFghkMjHsfTSSvdg39w9YMF/vtp2pScaFi3nfJzjR83I28IvbtdT1tPSs8SGSMHyPByc4qohioj/Ixy5N7VHFKF3U2GAdoSmDHzqYwqqTKYzWLxpPYYqeJa1GrEDmsXBzoN5fahca43+B4rA2JCe7ntuEvBreKOircl1NPYplqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLXgKsqgCtCvH98GnGsLwON7yA6kAO/p0vYYhUacF9o=;
 b=Lef7A2HpKugZvzA303T77gY70NtKJucvkTD6me4A6awhbN83v+HGs2oxB5mR3yoXkegY+Ofo47saWTl4Q2cT3PxfrT88oEr/PhM+LD2/LJNowwWNy0DTRETDZwWnQf87vPIM32KIhXzc/M0JzhRJJahui1tbfBxT/3hFLxz8MnBWiEnoHVsCwn6NvCA4DJ7GL6uTSY5zfwqJGTd6I2V32Fo9cTg6GLUQ8r9MF6jvpmiTnrHDiuB68q23saSjMapOy/3uxM9H6eNN6etrSAf2SC1zYK1X/WnYe4HtFeBLzUStD1wrGodmTOyyvfGqUCxGzePSnC33JlfToKXbbIvOZA==
Received: from LV2PR12MB6014.namprd12.prod.outlook.com (2603:10b6:408:170::18)
 by BY5PR12MB4998.namprd12.prod.outlook.com (2603:10b6:a03:1d4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 14:04:07 +0000
Received: from LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::3b0:528b:6b8e:7e02]) by LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::3b0:528b:6b8e:7e02%2]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 14:04:00 +0000
From: Rohit Pai <ropai@nvidia.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [OpenBmc][JournalD] Persisting Journal Logs 
Thread-Topic: [OpenBmc][JournalD] Persisting Journal Logs 
Thread-Index: AdkFjbCrabD490h1TBytiH0FZvC7fg==
Date: Thu, 1 Dec 2022 14:04:00 +0000
Message-ID:  <LV2PR12MB6014244EC8301F492BB8BF84CD149@LV2PR12MB6014.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB6014:EE_|BY5PR12MB4998:EE_
x-ms-office365-filtering-correlation-id: 7f07c465-4551-4c1d-7125-08dad3a4e5c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  O+BYpUKpsllPA/GTUVaZ00y3bL+aviEvt8ZCqR/PcLF9AliPzSVignRjdRtgHjMNL2BcwD4oHBHCR3nM79j8oQw4cnTyyu9gNECcfSsVTkK+M74frcfa4Va0QeF9BK7tjFh2cSYfqotOc0zRqqjOWnmHDJzSQ/nbiqjrqPuj7cY+kKJ/jD22ojunawKdrwToJKwaopntcVjT/vHEkWJ/aL23xFJ1VsghxG21rPBjcURW5Zje/UUWYgk3mtTVU5Ne1VXYfWSQ2mFJ0ac60ASU1gzI82ExITfuNaeNnpMbCv4qNo3cDDC/FyxPb6C7NVfw6+t6uO1ThzKCAHMT4UIHZ0s4V7HDix/OxfYr9snqXiM3uF84bv969bm2rq5BN53Di+7CVejs1HZkfOdkcpODuhHdEvKE2ew1R8DySKO5oMl1PVWbaw/WH0LvgrdKbLFS+Z5S/37+Ulu0+Zn/avXlZIFMiuzntEkka3oiV5bvu7oTJyUokXFi1su38+KPE1Eb8nWVjAJ+4X0bEXtekzw6P0ea2pvRD+tODJPferRrNuVdt0NwlXLNAApBbGkiDNYHtth1LrVSjDNXoZ5iowUiHBHSTSUQxo0vJ2jlpkaXEIcmh9bbjeQq5E8C1u5aciWhGhWwWKGXoyMUOET7uNgw9DBBWQAB08VYOzv1exQoD+R3AQJP5gTgTk4j3SDdyB0jeQddkdK0iQap0ri29HtDBQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB6014.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(451199015)(316002)(66946007)(76116006)(478600001)(2906002)(6916009)(71200400001)(86362001)(7696005)(38100700002)(55016003)(122000001)(33656002)(26005)(38070700005)(186003)(9686003)(6506007)(4743002)(5660300002)(52536014)(8936002)(41300700001)(66556008)(66446008)(8676002)(64756008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?iaa60P8vgVB1YLhK3Q/ilm/d0NpiyI1fM/gfvx2P0Xe66OC33x4VUPFjlG83?=
 =?us-ascii?Q?/GWYkNv7Hs0rYmjXn8hqiLVQfyVsnVfjINTS3NhBmynSlNsI7UvHp8n+rktF?=
 =?us-ascii?Q?V7tV+n0nMDZyFAf1OLqJ9y3kvTMGOP+kzwEQdHQY2DRe+qMLVYhmb+PkJtDc?=
 =?us-ascii?Q?lJWVjwOP6zj8W9KYZBwI0rdMNFlmUQqQIZ70Degx7D4ht0qGVzxdrOF4SiLi?=
 =?us-ascii?Q?jY5bRF5MQK51qG//aKSeQoZcdm0sse3SvBm/s+wErLeORLVhFjJyuUuv6xzO?=
 =?us-ascii?Q?0vq4D4oJdawu2bdhDio+D8omBQi/yaHLeSGxwLrf6IjRtGQjnjcHINg7IpIV?=
 =?us-ascii?Q?4kpv4fBBBoSRNHtBJvcVI25ECahJ6NvHEBGfiyJdmgl+dHwFvlCd/l2DeEd2?=
 =?us-ascii?Q?VW0Sx/Aq7MML2mqvSeGIe8lNOA9tRFsVTBsz+TuC+1oepOb4dRJoBgG2CAqq?=
 =?us-ascii?Q?f4a/Tq5+9CjdHVxhJeL6Ut+P9aY8zXS+joKRDmpjBs05OEXgL3oKnpbI41MK?=
 =?us-ascii?Q?w7TFzQp6k9Q3jHqeBGPiUkxuauK0arvbrmhjNbaxp/CaOMu4qyl19b1e+qst?=
 =?us-ascii?Q?1gAH1nBPtkscENCKIbNyBt1zxc9t1CiD/S2eVT9LFKspAVX9mZPaQl57F0by?=
 =?us-ascii?Q?P+dGqGylX7tuRHWUv0139dbG15KknQwOpkhLQ4h72NmsrCrme4RiHrBKqeVE?=
 =?us-ascii?Q?N6LsLmt16K/mxDzgB0IrZWt0PUQAntSe0J6cYdTuRczU1L63MWAUysM7QqDm?=
 =?us-ascii?Q?krXc6GF9BYCT6Xb36KlFu4wy/bGsSBE8ROE4CkzrVR4aytRVGT+iBLUf7BdE?=
 =?us-ascii?Q?WlMsjcEtYh74x9K3mzw0NQS3NLViXqTedVy8KLxM3Lxz/j3VMEWxRNnNw/3P?=
 =?us-ascii?Q?bPMIGKMcnjM8pnXZiG6gPs6lVPJHkn3FXWR4/bo49mZD7mbwdMWET7egN9Pu?=
 =?us-ascii?Q?IUyRtuY0mVA/woR44Vw2jDIww5++0zabiXN5M7QpV2J6Hcj4k0sXn6lCekNc?=
 =?us-ascii?Q?tVsB41lfVm4xFAHRwsa7lfve7XONLKh/A9SU7Z1u7zV9AIqn4sDoRw2wukZc?=
 =?us-ascii?Q?HQobxS7nGk88IAOeA2aiFlX9d9tVnpF5lWQ80d2g9/S/cJ4JeerKHOxiVP8o?=
 =?us-ascii?Q?Vf6XSqcrmMKpg+wix19FoG4lP2w5U63DxCVnTEL8VHkFvaKFYFtd+g9aTtQj?=
 =?us-ascii?Q?7gdogRlUPowVFz4if8Uhc5EUhflk/gsnQeOsfm7hQdhbAv9cPu7cVeAcr/J5?=
 =?us-ascii?Q?AY35toxkH0nROnt2g9/ZX3J0qsOMVY8zPw15RcdtupnCB8uAG2NXo2PCAD1y?=
 =?us-ascii?Q?OpjByGanZM881Vx9eoDgGM1QVARb6ADhRYJ+pa3Epa9CaGmYcvHiDPQhdjGE?=
 =?us-ascii?Q?f+shALCkROwlZ/VdA0mi+5clxQisJ3gsqpAIGbI8txvKdbu5Cko6yORS3s2R?=
 =?us-ascii?Q?Gw3vnGcFMj/nERtBuQDWNsAM6XM6l8jsGTl6PZErak+Z155Ac1IDanNFsDtN?=
 =?us-ascii?Q?y3aAlLv9QXhfm4hIcumxthAvag5dyoO3lgN4JSo7m+3iTrOGbigw3GkvlPAW?=
 =?us-ascii?Q?KENs7ak/4wmi7A1onRY=3D?=
Content-Type: multipart/alternative;
	boundary="_000_LV2PR12MB6014244EC8301F492BB8BF84CD149LV2PR12MB6014namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB6014.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f07c465-4551-4c1d-7125-08dad3a4e5c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 14:04:00.8766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Da+jA5nGHPltHi+Q+FwVWEoBXgbDR23dEm7n2WXbPWt65nxhzvViOa50Evvb+uyVPGLXwwP4oP3ZQK7aEDe5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4998
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

--_000_LV2PR12MB6014244EC8301F492BB8BF84CD149LV2PR12MB6014namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am running open bmc with Linux 5.15 and systemd 251 (251.2+).
I have configured persistent logging for journal.
/etc/systemd/journald.conf
[Journal]
Storage=3Dpersistent

Created folder /var/log/journal. This is mounted on mtd flash partition.
The rootfs has overlay with RO filesystem and RW filesystem coming from mtd=
 partition.

ls -alt /var/log/journal/
drwxr-sr-x    2 root     systemd-         0 Jan  1 00:03 2b4305f670484d1fa6=
b9c4deee336b91

Jouranld creates a folder under /var/log/journal but I dont see anything ge=
tting stored here ever.
I don't see journal being persistent across reboots.
Journal logs are kept only in /run/log/journal, and this is tmpfs in the sy=
stem and gets erased on each reboot.
I have tried journalctl --flush to see if anything gets pushed to inside /v=
ar/log/journal but nothing is stored apart from the folder name.
journalctl --rotate also has no impact.
I seem to be doing everything as per the journalctl documentation but still=
 it's not working.

Anyone else has seen this issue, any help?

Thanks
Rohit PAI

--_000_LV2PR12MB6014244EC8301F492BB8BF84CD149LV2PR12MB6014namp_
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
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I am running open bmc with Linux 5.15 and systemd 25=
1 (251.2+).
<o:p></o:p></p>
<p class=3D"MsoNormal">I have configured persistent logging for journal.<o:=
p></o:p></p>
<p class=3D"MsoNormal">/etc/systemd/journald.conf<o:p></o:p></p>
<p class=3D"MsoNormal">[Journal]<o:p></o:p></p>
<p class=3D"MsoNormal">Storage=3Dpersistent<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Created folder /var/log/journal. This is mounted on =
mtd flash partition.
<o:p></o:p></p>
<p class=3D"MsoNormal">The rootfs has overlay with RO filesystem and RW fil=
esystem coming from mtd partition.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">ls -alt /var/log/journal/<o:p></o:p></p>
<p class=3D"MsoNormal">drwxr-sr-x&nbsp;&nbsp;&nbsp; 2 root&nbsp;&nbsp;&nbsp=
;&nbsp; systemd-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 Jan&nbsp=
; 1 00:03 2b4305f670484d1fa6b9c4deee336b91<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Jouranld creates a folder under /var/log/journal but=
 I dont see anything getting stored here ever.&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">I don't see journal being persistent across reboots.=
<o:p></o:p></p>
<p class=3D"MsoNormal">Journal logs are kept only in /run/log/journal, and =
this is tmpfs in the system and gets erased on each reboot.<o:p></o:p></p>
<p class=3D"MsoNormal">I have tried&nbsp;journalctl --flush&nbsp;to see if =
anything gets pushed to inside /var/log/journal but nothing is stored apart=
 from the folder name.&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">journalctl --rotate&nbsp;also has no impact.<o:p></o=
:p></p>
<p class=3D"MsoNormal">I seem to be doing everything as per the journalctl =
documentation but still it&#8217;s not working.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Anyone else has seen this issue, any help?<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks <o:p></o:p></p>
<p class=3D"MsoNormal">Rohit PAI <o:p></o:p></p>
</div>
</body>
</html>

--_000_LV2PR12MB6014244EC8301F492BB8BF84CD149LV2PR12MB6014namp_--
