Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B17E4D9055
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 00:27:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHXl461knz30RJ
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 10:27:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.a=rsa-sha256 header.s=selector1 header.b=EbBPXFkH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=prodrive-technologies.com
 (client-ip=2a01:111:f400:fe0d::705;
 helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=govert.overgaauw@prodrive-technologies.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prodrive-technologies.com
 header.i=@prodrive-technologies.com header.a=rsa-sha256 header.s=selector1
 header.b=EbBPXFkH; dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0705.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::705])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFSLB0vGZz2yjS
 for <openbmc@lists.ozlabs.org>; Sat, 12 Mar 2022 01:02:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOzkwx9bcStUdWiLbj8OZOmr0eLZJB66+hUka4hSmvsDxU1Xpt8Mk/CpM3wYC03eAT4Qb4BSOqty/PGGf/fFwNmsdpxuDbeDAyCq+k4YJ75TdnHKn/ULQAvagEdwQoORYC2h2EbbyGiZAokxyr296W7IPV3f922qPrhgOLlt+IGuehYcIL1wKiPiJf9pWiQwAw55yeHdKj2A7jXRY0/YWnp5AeXRaAIoisScdXy9Y4ywZqERQ09nfcY2usWSWAtVGEZ9FP54OBG5CSiKUHaqw1Y9Xv8OwmMRdK7LcW6ncaOsvn9sKgv2NRSHpj3fho6VTbDGEl3gnmTKHYxMEkyTEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wy7kLQcdI5mrhG4/bw03O1W9KVmP476jBso+Xip8WM=;
 b=iZjNXsspZHjWTc16slhjItyy1SACbaBJsCJgDaSu/+WUiBw2ky14yB51P9+ndp4qZxuNsFn6DOu+8nfoUtao2uZ7/5Bk2F7LIweI5ripLIaVpyLYRo9ZPDlAWO3R5PIQ2yBFl7dApqlgdZawV4cqYFknbZYDrK0YypgR/7/nGNNEIFw16rm2Avqavd9opBhtQaxhquZHLKX9cCyiiLezLUAbTFEqUtpOCLbMDydeoa8CfjADY2cYjY1Dnm2ctzEkVvlcoCMVlFSCVA8QFeN1IBeXZ8ytDcuB+nRnOTTC4YqrAQfdEeL0MLHJODqCixEegQNet+ygxB3VVlitqGeBdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prodrive-technologies.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wy7kLQcdI5mrhG4/bw03O1W9KVmP476jBso+Xip8WM=;
 b=EbBPXFkHKIMT2FjQXJNfizbauiwKYjx5SCgconcFYvofXB8h7ETRcaQnl736Ii6jRCjp54cfWnNP7ydbAgBRab5v5nxjQ556NZJGpD1q7QxnzL3h/q2Oly9CLAaWbeBkaSYa+8WhG7Yn1X/EP0dSelKc3buzbz8NbCgO0XkgqSc=
Received: from AM9PR02MB6499.eurprd02.prod.outlook.com (2603:10a6:20b:2ce::16)
 by AM0PR02MB5507.eurprd02.prod.outlook.com (2603:10a6:208:166::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 14:02:02 +0000
Received: from AM9PR02MB6499.eurprd02.prod.outlook.com
 ([fe80::5595:71b6:c5c5:9acf]) by AM9PR02MB6499.eurprd02.prod.outlook.com
 ([fe80::5595:71b6:c5c5:9acf%5]) with mapi id 15.20.5038.027; Fri, 11 Mar 2022
 14:02:02 +0000
From: Govert Overgaauw <govert.overgaauw@prodrive-technologies.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: MCTP LPC FW binding
Thread-Topic: MCTP LPC FW binding
Thread-Index: AQHYNU9GubvxQCJ8q0a6N7Omlm7czw==
Date: Fri, 11 Mar 2022 14:02:02 +0000
Message-ID: <AM9PR02MB6499C2AB30799F6A97D92095C10C9@AM9PR02MB6499.eurprd02.prod.outlook.com>
Accept-Language: nl-NL, en-US
Content-Language: nl-NL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 5d83683e-260c-0238-dbdc-02b1538b7a97
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prodrive-technologies.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 465658af-2df2-46ef-18ed-08da0367b7a9
x-ms-traffictypediagnostic: AM0PR02MB5507:EE_
x-microsoft-antispam-prvs: <AM0PR02MB5507F3D7D2A406A7CAC2C88EC10C9@AM0PR02MB5507.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dHuI/VG3k/ghedQQNE24dzPMowC11I0uOHboz0kgkmcMZv4ehI2DuXQTNg+Q0iWsgptW8l+NMxECHM7MogNwelXiIcm518KmxoK4xS6LgrdaTStIF0w00BVM0pnPNXDkjw/CC/X+L2JLezIVeXxUKD+eBzNoMkmMZbOVwvAkL/4H+j3shny/21iPk1A4LZabgzmfiTRFJF0dVHjtI8Zn+w9HU4BTE9MyvT7vKtO1wslg6aUbh/02tEsXFPNrwABoZqf79qlm4ulT4uDz0+EXLIYpeseHhQpzCU86Br9WeX2avU3nvKaeirN5vL+5aBV00JpWjZ4+RMyu/6mfxXnxlE7w5wM0DT5wba6W5uor6AmB1UlFwKgYU9im2/Xlkut1Efe8lOvM5kO8EY8JXBpxsW1F4bQPwIKKORZ8W9P760rJgtXNhYSg/UcA901aVt52h+YOiw0lkeylgfX+F/xyrWiT1nWKnJgTc9KS5lzneDA6T6atn1QEu24JyUFAJOsNNf9g9DnH9rxVzbQ1SaN34IxeJ1kAyA5MtEYuBEhO2pgGKM7pU//MxRWx5wPqJLVuw6e6CioO5Q0Fh8Sc/Bg6LtctHYxQBWuFnAWwVsTTUBsjGgF7L9A/kEHrVzRM54j075PZIZ2zJ7PEEtXqsDCJtSIWc9P+LH5a49cAHZvXtABsi0K4g2cYvjg+oVXO8Ox3a6JJfkE/dba1ETiwXVw0cA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR02MB6499.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(122000001)(6916009)(38100700002)(9686003)(8676002)(4326008)(64756008)(66446008)(66476007)(66556008)(86362001)(508600001)(38070700005)(316002)(76116006)(91956017)(71200400001)(19627405001)(5660300002)(44832011)(4744005)(3480700007)(55016003)(52536014)(8936002)(186003)(2906002)(7696005)(6506007)(26005)(33656002)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?lS1UGoe8eZq1NYZHh4QqkzJp2O+2UvlGGY9uFBaIMssTpgE5ezKlb82jhM?=
 =?iso-8859-1?Q?5tmwn756IYoq9nyLhDufRjleaPLmXzlbjoT8u8U48EvytqAtiXDO3HB8Ls?=
 =?iso-8859-1?Q?yhws+x0fudVoK1e7THJNdYlGaNdWuTmk2f4L+e1SoZ6xJ2cDoPeeYmnQVA?=
 =?iso-8859-1?Q?g05sGkhlX3OQsAzADj35JYg+qQPmloeq3FXs7MUz1DQYGGyABmujrSpPSa?=
 =?iso-8859-1?Q?oxycRdtjg0N7/RUj+H98SXLhcJskx+EUQbEiHoS8MDwT5Ak79bEwFT7qRz?=
 =?iso-8859-1?Q?MCSEma5fOQC1PtuBy94utp7ACGVXd7EXiKBAyFyeuAqt3RGVmuRHruKVSX?=
 =?iso-8859-1?Q?2E6UYY3k10/xQNJ7LvIgl21OVtbSPLK2ApzeTIBd9WvtrFlsXVOklb+sEO?=
 =?iso-8859-1?Q?eHXdsDsprIem7/jeHUDjh0CZQ6csl1nav/2Js+4PFL7EP6DE20jeI5hfhz?=
 =?iso-8859-1?Q?cxQxtjMsFSzfr4oI1k15vTNuBteHiAfRZFhmamDaU1sEYSnhKUrt4CCY8P?=
 =?iso-8859-1?Q?Yi+fyGvpqjXDxHzUexgrX8b/R1pYAea8C0n3dTUbUg7ONKGHSeMM4vGkqi?=
 =?iso-8859-1?Q?WwC/dAxsQ4uVRvTp+qW07YY/z1yOElX6wYSQ76BUfhrZ08En1pTKtwHmL/?=
 =?iso-8859-1?Q?ifmaizJj/OwP6baSOpns/yPt7jzstlV2pM10vCeX8nTBQHI9gUNrM7mrOw?=
 =?iso-8859-1?Q?8KyjywM9h4av/7eEZAhFfR+YBRcTip8SsaTMIirZUba5BGUGNPKeeG5WkC?=
 =?iso-8859-1?Q?NA3eDDvJv0BxwQeIUyt8kAGKlqZtFVYnyNf+glpTLAOuEEiBVniOxpRkLX?=
 =?iso-8859-1?Q?GE0HwdX9wBlXgVE69hYD9n5u2KDP+49iCyL+A6vVF/mKwrY+85xkG54GuN?=
 =?iso-8859-1?Q?jssNjjZMWKi5odf07khS9Jew5jNYNji96r4Aj59/o4RHnUauTtwYrE7yAS?=
 =?iso-8859-1?Q?uFp1sxqp3owrNYJxme4vHGWMDelCoWGfZarLCjDucySfnwe0ZIDs4Hw3GN?=
 =?iso-8859-1?Q?ATVqXK45XFT5l7oklBWo5zYcLZKIGC0SSMu6Jp1BkGI3Qaurz7BKngaMZn?=
 =?iso-8859-1?Q?unZiZd72g5Z2d282fiyqkMfY/XFmkcJk8URRTNzkYczVmCUy06nOQ3FPJ9?=
 =?iso-8859-1?Q?A9RCEJTPpuDFWlWQJi30JTTChAeB+RnDX3bTyjQUzKEpv8QEye4IUqJ8qm?=
 =?iso-8859-1?Q?xtehcnDxlDNsiKDH99ukur++r+T6yfdGK43vcVRvUszT06pcrQt2DF/mvk?=
 =?iso-8859-1?Q?WK7IoP/X5QLshceGGu9vgk2O9Ty9A1sBpR7iM2q34TVWED5JNuv1RobHVm?=
 =?iso-8859-1?Q?SIeCKSxTgDcvgFy5yt5tvajV2YQWaePXNTfkhurxR6RXmgthQrCn5Rk+xc?=
 =?iso-8859-1?Q?tp6+2NQumpUZvCYRgErdGibs2p8jjyhWK7+KlRSjoz3maNROVH16tpqFv5?=
 =?iso-8859-1?Q?Qe6mmSX8+roedwXToO1EYpUQb+cBQBlBT9uxlNSt8kQYITn/6mtvorlNyf?=
 =?iso-8859-1?Q?EuzYYqOV1GZNEPoor98YtGl7Eyn3rf17Jgu0YBaGdQuXsYktOPbAdYkRAO?=
 =?iso-8859-1?Q?D19oNvA=3D?=
Content-Type: multipart/alternative;
 boundary="_000_AM9PR02MB6499C2AB30799F6A97D92095C10C9AM9PR02MB6499eurp_"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR02MB6499.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 465658af-2df2-46ef-18ed-08da0367b7a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2022 14:02:02.1816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eTcwB1RbzILkdDmPQ0rEeKIKb9+xNtkGR4SrkqV3TGsJo/q6Ip0N8uzN02VMOEile7Iymre25AOs8v56hg9RTpNYvZTuhFoLhbujitw8trl3dudaW7qzLBGGxBieAyrz8cLM43HB3LnLeRrsOvalWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5507
X-Mailman-Approved-At: Tue, 15 Mar 2022 10:24:35 +1100
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
Cc: Stef van Os <stef.van.os@prodrive-technologies.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_AM9PR02MB6499C2AB30799F6A97D92095C10C9AM9PR02MB6499eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I was wondering if anyone is/was successful in using the MCTP over LPC bind=
ing with an intel platform? I read through the documents, it seems to me th=
e binding was designed to use LPC firmware cycles. To me it is unclear if t=
he ast2500 supports memory cycles on the LPC2AHB bridge (datasheet seems to=
 list it in the features, not much explanation).  The problem is that the C=
620 chipset doesn't support firmware cycles (only memory and I/O cycles). A=
nd having a properly mapped window in the C620 chipset and reserved memory =
in Linux. Writing and Reading to it only returns ('1s').

Writing a simple test on x86 that keeps writing a value to the mapped regis=
ters, seems to trigger LAD[3:1] =3D 0xF readout on the BMC LPC host control=
ler register 0 (that has some debug registers to see the state of the LPC b=
us). 0xF is the stop frame of a standard LPC memory cycle.

Kind Regards,

Govert Overgaauw


--_000_AM9PR02MB6499C2AB30799F6A97D92095C10C9AM9PR02MB6499eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hello,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I was wondering if anyone is/was successful in using the MCTP over LPC bind=
ing with an intel platform? I read through the documents, it seems to me th=
e binding was designed to use LPC firmware cycles. To me it is unclear if t=
he ast2500 supports memory cycles
 on the LPC2AHB bridge (datasheet seems to list it in the features, not muc=
h explanation).&nbsp; The problem is that the C620 chipset doesn't support =
firmware cycles (only memory and I/O cycles). And having a properly mapped =
window in the C620 chipset and reserved
 memory in Linux. Writing and Reading to it only returns ('1s').</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Writing a simple test on x86 that keeps writing a value to the mapped regis=
ters, seems to trigger LAD[3:1] =3D 0xF readout on the BMC LPC host control=
ler register 0 (that has some debug registers to see the state of the LPC b=
us). 0xF is the stop frame of a standard
 LPC memory cycle.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Kind Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Govert Overgaauw</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_AM9PR02MB6499C2AB30799F6A97D92095C10C9AM9PR02MB6499eurp_--
