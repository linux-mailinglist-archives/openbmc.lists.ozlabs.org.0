Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7C26FB61D
	for <lists+openbmc@lfdr.de>; Mon,  8 May 2023 19:52:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFTQB31t6z3cjM
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 03:52:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=icILCjix;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::629; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=ropai@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=icILCjix;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFTPY0nZ4z3bjX
	for <openbmc@lists.ozlabs.org>; Tue,  9 May 2023 03:51:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8pycAv4qI+CiSR91W4dd8TGvxB7lmEjfJXGqiWXP7YBEj1UsJQ9CNQbqPjsaj4Dx0twlKER0XI8Q7fYwYHo9mRzytuAWIgNKbvsprlvd+RjYIDi8PB31Yy5AOk5tOYvQWFWEVbwIqNO4G0vlwevCXnKv6iEpkU0cEHxAUEiynlgVBXjXXcU+D0PtGEjkqobi6zE/QHevXCtm+D2QNhphhNizAHJLc9nC8KHJ2LfkXY4uUIjD5QKUCqECm25FjUjdIYKHcX2OUhKsCJxcAropJ6AT+WpW1WnSXao2DY3Z90L4j5WD92QlDjdM24JkJ7LiYuHx0bNPA4Syk8qLTEXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAgAQUtNm0+/XCuXww2N+f9SkWAU1+0QcBgqSNN2k/g=;
 b=H159W7szr6AtLInQRj1awi7kITtEgqiSvdwkbjTTYIRzavBqU28HonqbMzxlMgR/D/O9pIcNSHgR/OWLJV4/miRHwj2g/HQcWlvMvSdG74Xb3pjL5RVHOzrpEctQ0nzEV5/BAViCPmCruX6LKwMf97vP6CFOS/L9llpeJhJ0ikroODPebIkD3VujA8fqttofjSzmnrt6ro2SsOn/Bp3Fr0PN4oWytzE23tQZyb5Lh/zA8y541+AL4vORs0UUd1El1mx8eaKP7+t9JNV/d6BpCBl/xnQ++QoH1jgPZFRR9wL/zcHWdUFT6Nymsmkx7bsVZkeCmfzHGVJb88wQUf7szg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAgAQUtNm0+/XCuXww2N+f9SkWAU1+0QcBgqSNN2k/g=;
 b=icILCjixtC36h8N7Qx2rmACXY4/KxDmjUWJxmRYNz+y+itNMlFPrKTeJl3HcNdWkyHOa4he3ITSkYptLHfZAAwdX2iTiyLOje/dDP3NPnr8NhRC/iM/roLUlxARCQvXXISgViVoIi0FrWM7BMTBupypXnDj9kFkDU870XU37uewozYLMFHaIsoIbN6HH+CCWjLz1s0PzCiUIVYplnN6qH9A6wrs8Gacj/6h6yK0LvPmJR2nIdgpoETeMccGBwtzW6s1bAz/e+kRxiPwU3GblNPgLHWPu0xOldQVSar3wveQtVUhTpM9EgC+VRBiqA8Su+e8Tx0AF1knmTF+DEecA9w==
Received: from LV2PR12MB6014.namprd12.prod.outlook.com (2603:10b6:408:170::18)
 by BN9PR12MB5305.namprd12.prod.outlook.com (2603:10b6:408:102::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 17:51:24 +0000
Received: from LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::507:bce:e64c:f3fe]) by LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::507:bce:e64c:f3fe%7]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 17:51:24 +0000
From: Rohit Pai <ropai@nvidia.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: IPMI Sensor Name limitation of 16 bytes 
Thread-Topic: IPMI Sensor Name limitation of 16 bytes 
Thread-Index: AdmByrjOuIQMIt8TQumDRuD60B0ugA==
Date: Mon, 8 May 2023 17:51:24 +0000
Message-ID:  <LV2PR12MB60140D575EA40854D74472F4CD719@LV2PR12MB6014.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB6014:EE_|BN9PR12MB5305:EE_
x-ms-office365-filtering-correlation-id: 4acdc4ea-d923-49fd-da8d-08db4fecd70f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  WKS9EtugxGuvsMjXjj2lYJDHvc/Z0VDAe0tkbCNZ8YRV/ma2uYkuPSM/WTgZruRqMoOrfUJ9csFlFkT1BgSQJcC8t+I1yT8oZMjVXJ7J4r9kGr3nL1nff1nCd9BDZcFNGceLV+Ai+DLfh6J8XUJMTDv+yeUm0lIF4UEwQXZpddt141nsXDe+/7XuuIXXRS0T+VMh0A+zSt+KR16HPSF1cvxXMWahbnKMlwaLdSpKLrTShmFm8cUgAaygZKdHR8E54i+mdvQgW+JwAmCZK/9bGD8qgPNCMS4TdusDAaSWgdHQvc/yWnVG1+nYhFDU8v55HYsGSMqq140gBkjGSXqh9ci26ZKRi7u1qOlhjURq7MXxrv6GeMUpbBnR/DcZkQ+uGi5byP0ABAKA+BTfE6By2+Uq77MBQUjBh1WAKmTnaffKGrb2XehRLJ6lULCQefGDSmZpIaFHM4dCMhM5QeMRq3KnoGaTJrt6w2R2V9Kkstz8+gz2AdUJ21WaIPmPLz7FEwnznhlV/kp4KQpu2i6VpELBsfubaPaMXWfBD6H8FTDC+SDleuDak2Z683cgaghlTI0ljRGOBJfChbWrcn3mDM8NWMzdg2UcHMjX42Fk3WxdxEHWu7SkukgLhZB64stU
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB6014.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199021)(2906002)(8936002)(316002)(9326002)(478600001)(64756008)(66476007)(6916009)(5660300002)(66446008)(66556008)(8676002)(41300700001)(71200400001)(52536014)(76116006)(66946007)(7696005)(26005)(6506007)(9686003)(186003)(4743002)(99936003)(55016003)(83380400001)(38070700005)(38100700002)(33656002)(86362001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?JPER45rA6XzpZGaJFQvne6SAzW3aCg3C39A1OBKmmAtOocfz+UbB8kK/yO6O?=
 =?us-ascii?Q?LrTJoeV7AWN+Y9dcRLspmDVzbjEUMNmPjhaWZ0DHewURdq5LQm8s60WNyMax?=
 =?us-ascii?Q?CjsCLZc0fyUIFH0plplHDN1rc71OUOseakVEPOmRaK5CpLyI/5sAOHC2mnHg?=
 =?us-ascii?Q?SlUd8vxJJT42A/L05+kOeaWQE2G2sMw52NavFVBW/UHy5TGy1odhtqR1/cqh?=
 =?us-ascii?Q?zTqPly523BeMerJ36rJqfMMJ9S1sI7QgQQS8ltcSBfxhFGEyFziWSdiTEqXM?=
 =?us-ascii?Q?LVWRQEnIm9E9TJFVm3jXy9lcqLLXMMMiZ7rsDk9eu108F63CGr0aZ4rYn9df?=
 =?us-ascii?Q?GJwfYXNFhM11yW4DI+7+oUhDgzGE/EZmi3EckqDQkEuBRM5cKuRrRR9Hx+we?=
 =?us-ascii?Q?PsqvBs03D1QJ3meI59/grdeacrm1iwKynhModQE39XzgVw/catIyJkkLbqQk?=
 =?us-ascii?Q?RCIPPaCjj5vdnFKtO03u6VNHPUxaI/2qui3jvu56FdiCb9bMlSGlHDfyOGFX?=
 =?us-ascii?Q?YAZj802n6I1s4O0/L5kHjdPAT2+X2VLh+sZKWIbZrL7UG8uHJzpnOu8PBQYc?=
 =?us-ascii?Q?u0GTaWdx7CBdXyHhPz68AhRj0qGz0vRcfcgAu3IW9SD8p5bJypABROCg7a6+?=
 =?us-ascii?Q?AGUEBsYMeWjocIwdtHsvEgOzfFKcSFg3094YkjHO5L1isNAWM1yQ+2FTXIQh?=
 =?us-ascii?Q?TMG8/zUVV7GAH4SFNb7QIoEZIi+4ZbQ5VqWR5lHFTq3iidtwNAFN40q3QzpE?=
 =?us-ascii?Q?vwb1Cl9zXCRKSO2jEyGgGsSKBlOXNXXERuhy31gTxf7xoKvP0QfNmrVizz4d?=
 =?us-ascii?Q?8swywinLze7Ecub+TiOIBY2P+NPXUiPjmSK2pT8PQImkqf+b7Lg6ScWHrk3X?=
 =?us-ascii?Q?IsLtRSKdgoa2EzMds5EzS+RZ0yZNEGFllgM/VwSq2vzz5elJC1XpqgWyTNjv?=
 =?us-ascii?Q?m8A8PcqZZp6UqBxPxaflCe+6RQZFmI2vHDTteVBBXsjD3oJueFZeFAZ/GOnA?=
 =?us-ascii?Q?AnM8TXIEc2TPBmjHwaA/PoWQWRAQmAB2vo31lg8rgQAbSzbPPGC7V0Rh4ZwC?=
 =?us-ascii?Q?wjCXPotW3JQuzgb6OVZDK/aRhSZcUI5Kn4VvcTmPJODC7Qizwg2S4rvWkRH3?=
 =?us-ascii?Q?uoV79K6ZLXSHV6avXo+o2XO02hoIq/05DqqeYWc1hjwFgUfU38p6haDZfEG4?=
 =?us-ascii?Q?pASK+L15/dtAG+93hCuDw7eeVBzIvurFzBgzY18yaFYC4FMPvQbB0eFpAyOW?=
 =?us-ascii?Q?O/mqlJkiJdrZccKQOavpiMprkGcdkZ+I4dTP2iNegyXEkt9soKKmC+87oF80?=
 =?us-ascii?Q?PFoE0267+w3tY59BJkANrtViTNMMbgwksvuj9Ln22V4d6QjgmIgrnvUDTL3E?=
 =?us-ascii?Q?nHIeZLTPYtHVytws2oFfsGZS2vxDtQiu3Y6i2LLZ+rVbEPTfa0n/z31EbY2n?=
 =?us-ascii?Q?v52gOLW1k31alaWXMRaeiTzBrsMPnH9xXCbhW9d0Q2U9tiqpmurLvK5VOBFj?=
 =?us-ascii?Q?eSQBoWcE/WzltzQOP5E1N4jyzPstYkuZ0nD+qYkClwfjOFmyIcbeS1hTlGHp?=
 =?us-ascii?Q?WPXQg7vzAWThk8t0S1I=3D?=
Content-Type: multipart/related;
	boundary="_004_LV2PR12MB60140D575EA40854D74472F4CD719LV2PR12MB6014namp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB6014.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4acdc4ea-d923-49fd-da8d-08db4fecd70f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 17:51:24.1767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G+4k/FTea8HG3Mo+DiRz1SUzpg1lKEnUDSOWHuniAq4Hqy8nbrHbQqucif5vZEI24YJFws9cAvikg1Ilfg5t6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5305
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

--_004_LV2PR12MB60140D575EA40854D74472F4CD719LV2PR12MB6014namp_
Content-Type: multipart/alternative;
	boundary="_000_LV2PR12MB60140D575EA40854D74472F4CD719LV2PR12MB6014namp_"

--_000_LV2PR12MB60140D575EA40854D74472F4CD719LV2PR12MB6014namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,



In our current system we use both Redfish and IPMI for reading sensor value=
s from the BMC.

The sensors are populated over dbus by different bmc internal components an=
d aggregated by bmcweb and ipmid stacks.

The name of the dbus sensor is picked from the dbus object path.

In our system some of the sensor names are very long and have a common plat=
form (or associated entity prefix) which is common for sensor belonging to =
an entity (parent chassis).



Redfish has no limitation on name of the sensor however ipmid/ipmi tools wi=
ll only consider the first 16 bytes of the sensor name.

The limitation of IPMI is coming from the spec and the length is restricted=
 to 16 bytes.

[cid:image001.png@01D981F8.F632D7E0]


So when we query sensor list from over many sensors names appear as same/du=
plicate entries because many of them have same first 16 chars.
Example showing the issue.

IPMI ----------------------------------------------------------------------=
--------------------------------------------------------------------

FREQ_MEMCNTL_MEM | 0xff              | ok

FREQ_MEMCNTL_MEM | 0xff              | ok

FREQ_MEMCNTL_MEM | 0xff              | ok

FREQ_MEMCNTL_MEM | 0xff              | ok



Redfish -------------------------------------------------------------------=
----------------------------------------------------------------------

/redfish/v1/Chassis/CG1_Module_PG530_1: FREQ_MEMCNTL_MEM_00_00_176_1

/redfish/v1/Chassis/CG1_Module_PG530_2: FREQ_MEMCNTL_MEM_00_01_4272_1

/redfish/v1/Chassis/CG1_Module_PG530_3: FREQ_MEMCNTL_MEM_00_02_8368_1

/redfish/v1/Chassis/CG1_Module_PG530_4: FREQ_MEMCNTL_MEM_00_03_12464_1

Since there is nothing much we can do about IPMI spec and we also don't wan=
t impose limitation of 16 bytes on redfish, I was thinking of adding some s=
ort of auto short name conversion in ipmid to avoid names coming as duplica=
tes.
Would like to receive feedback about this solution and any alternative that=
 may exist to solve this problem. Any pointers on existing patch also would=
 be helpful.

Thanks
Rohit PAI

--_000_LV2PR12MB60140D575EA40854D74472F4CD719LV2PR12MB6014namp_
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
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
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
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
p.xxmsonormal, li.xxmsonormal, div.xxmsonormal
	{mso-style-name:x_xmsonormal;
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
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
<p class=3D"xxmsonormal">Hello, <o:p></o:p></p>
<p class=3D"xxmsonormal"><o:p>&nbsp;</o:p></p>
<p class=3D"xxmsonormal">In our current system we use both Redfish and IPMI=
 for reading sensor values from the BMC.
<o:p></o:p></p>
<p class=3D"xxmsonormal">The sensors are populated over dbus by different b=
mc internal components and aggregated by bmcweb and ipmid stacks.
<o:p></o:p></p>
<p class=3D"xxmsonormal">The name of the dbus sensor is picked from the dbu=
s object path.
<o:p></o:p></p>
<p class=3D"xxmsonormal">In our system some of the sensor names are very lo=
ng and have a common platform (or associated entity prefix) which is common=
 for sensor belonging to an entity (parent chassis).
<o:p></o:p></p>
<p class=3D"xxmsonormal"><o:p>&nbsp;</o:p></p>
<p class=3D"xxmsonormal">Redfish has no limitation on name of the sensor ho=
wever ipmid/ipmi tools will only consider the first 16 bytes of the sensor =
name.
<o:p></o:p></p>
<p class=3D"xxmsonormal">The limitation of IPMI is coming from the spec and=
 the length is restricted to 16 bytes. &nbsp;<o:p></o:p></p>
<p class=3D"xxmsonormal"><img width=3D"680" height=3D"63" style=3D"width:7.=
0833in;height:.6583in" id=3D"x_x_Picture_x0020_1" src=3D"cid:image001.png@0=
1D981F8.F632D7E0"><o:p></o:p></p>
<p class=3D"xxmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">So when we query sensor list from over many sensors =
names appear as same/duplicate entries because many of them have same first=
 16 chars.
<o:p></o:p></p>
<p class=3D"MsoNormal"><i>Example showing the issue. <o:p></o:p></i></p>
<p class=3D"xxmsonormal"><span style=3D"font-family:&quot;Courier New&quot;=
">IPMI </span>-------------------------------------------------------------=
---------------------------------------------------------------------------=
--<o:p></o:p></p>
<p class=3D"xxmsonormal"><span style=3D"font-family:&quot;Courier New&quot;=
">FREQ_MEMCNTL_MEM | 0xff&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; | ok</span><o:p></o:p></p>
<p class=3D"xxmsonormal"><span style=3D"font-family:&quot;Courier New&quot;=
">FREQ_MEMCNTL_MEM | 0xff&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; | ok</span><o:p></o:p></p>
<p class=3D"xxmsonormal"><span style=3D"font-family:&quot;Courier New&quot;=
">FREQ_MEMCNTL_MEM | 0xff&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; | ok</span><o:p></o:p></p>
<p class=3D"xxmsonormal"><span style=3D"font-family:&quot;Courier New&quot;=
">FREQ_MEMCNTL_MEM | 0xff&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; | ok<o:p></o:p></span></p>
<p class=3D"xxmsonormal"><o:p>&nbsp;</o:p></p>
<p class=3D"xxmsonormal">Redfish ------------------------------------------=
---------------------------------------------------------------------------=
--------------------<o:p></o:p></p>
<p class=3D"xxmsonormal"><span style=3D"font-family:&quot;Courier New&quot;=
">/redfish/v1/Chassis/CG1_Module_PG530_1: FREQ_MEMCNTL_MEM_00_00_176_1</spa=
n><o:p></o:p></p>
<p class=3D"xxmsonormal"><span style=3D"font-family:&quot;Courier New&quot;=
">/redfish/v1/Chassis/CG1_Module_PG530_2: FREQ_MEMCNTL_MEM_00_01_4272_1</sp=
an><o:p></o:p></p>
<p class=3D"xxmsonormal"><span style=3D"font-family:&quot;Courier New&quot;=
">/redfish/v1/Chassis/CG1_Module_PG530_3: FREQ_MEMCNTL_MEM_00_02_8368_1</sp=
an><o:p></o:p></p>
<p class=3D"xxmsonormal"><span style=3D"font-family:&quot;Courier New&quot;=
">/redfish/v1/Chassis/CG1_Module_PG530_4: FREQ_MEMCNTL_MEM_00_03_12464_1</s=
pan><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Since there is nothing much we can do about IPMI spe=
c and we also don&#8217;t want impose limitation of 16 bytes on redfish, I =
was thinking of adding some sort of auto short name conversion in ipmid to =
avoid names coming as duplicates.
<o:p></o:p></p>
<p class=3D"MsoNormal">Would like to receive feedback about this solution a=
nd any alternative that may exist to solve this problem. Any pointers on ex=
isting patch also would be helpful.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks <o:p></o:p></p>
<p class=3D"MsoNormal">Rohit PAI <o:p></o:p></p>
</div>
</body>
</html>

--_000_LV2PR12MB60140D575EA40854D74472F4CD719LV2PR12MB6014namp_--

--_004_LV2PR12MB60140D575EA40854D74472F4CD719LV2PR12MB6014namp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=20712;
	creation-date="Mon, 08 May 2023 17:51:23 GMT";
	modification-date="Mon, 08 May 2023 17:51:23 GMT"
Content-ID: <image001.png@01D981F8.F632D7E0>
Content-Transfer-Encoding: base64

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
AJ9qk0IIHkrKAAAAAElFTkSuQmCC

--_004_LV2PR12MB60140D575EA40854D74472F4CD719LV2PR12MB6014namp_--
