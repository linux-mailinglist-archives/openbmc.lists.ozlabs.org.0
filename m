Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4364F5096ED
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 07:42:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkRJx11HFz3bWD
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 15:42:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=RZLQJ6zL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=7110779bee=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=RZLQJ6zL; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkRJ22ZlSz3bWM
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 15:42:10 +1000 (AEST)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 23L1UwR0004488;
 Thu, 21 Apr 2022 05:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=dYNpQUqd8FvTiW2q6CA+1+45brEsTWLsTOXbritRW2o=;
 b=RZLQJ6zLTV6NSQt9Qzm6ppE7aq5Lac0swJhc8soDPTUM8T4/jeIF/ZGjtJhxlqrQVV9Y
 jan9fZhSAD2DqWChCR0iCsfFcusnOTcAnsCkdmo/6JdT7xwcnAtplot46qOZ2kppJO72
 Mor6fLsQcAqOumnz6GWSsghhUGu3yvsg2y4d6lMrNE1FESEfa2xT2OmOZxzBb6TXwInj
 kfNgx/06bJpQHZ0qq9vtKsqJ9F1xPLrnMXI2ux4eLywSLFlsp+XbT2QfkY3ZVDTijxLo
 +rLbiPsqqpIv4ZpiNwPtZqs8FxPf8N4HJO85Q0HNkw55hf2CjWgIXuPUe+FjtgSOsUE1 UA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3fjqrk1j10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Apr 2022 05:42:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccI1ERF3n0yE0XiUPZkyFXITpYSIw8Ms55HKfLrypKQlqRvJjHFFqrN4BaqNZzjs0qLIMLHuqjuL0fsli33bZaweAcsIoqjzcIsPPsPtckqWMtVTOeobqWHfVSGeWG/bcBaYhR2E2K7hjzTGFqT6dOlgcGXCDiOEiBiTCEK3N5FXIthHU+md3Uu8tX+YxmzScakPqVSolAdF8Mfk5SzJ/WKSsr7U46FDTuREoTvyFABlUVKb6dWcZEqOLZqj/rlUvjmy/t+fOenbOaerdSucsZbAdp+qhOUlXOErO7BXXKPMb7vzRYnIY1vFXV49LfwzmnDR36lvEsteSeBEjX7vpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYNpQUqd8FvTiW2q6CA+1+45brEsTWLsTOXbritRW2o=;
 b=TPjce+bcgGPY9ZEdYUvRbI7x5iEWOL+TYqSyI7chK466sYrasy3ob9ZpsX9pURgNY2mwBRdZYG+qZcowosn4okbuNJPi5hFd6+fj6ltHYgSjjyDeIVYNM2GVMMM+mZJJiy19oV7vjfBi7p0GTqabkxWiSMRHJbUpGs4DAGUPEMhb05Iy7KPYT7iGh99XJYwJlwaXLzPFur2FkiHEXaSgt+e4L6haJZUy9uM4D3YnQwoxYP0j2NwFnjK8Dj66oHoCzEBfpCDka1OVGUsKUdWdrQjpNbWZgvbvlXV4X0uYhcK7pGPTsiHMhKhslkZcBt8jYUggKXo96H7LHu7k8gUltQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from CH0PR04MB8002.namprd04.prod.outlook.com (2603:10b6:610:f8::16)
 by SN6PR04MB3853.namprd04.prod.outlook.com (2603:10b6:805:44::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 05:42:04 +0000
Received: from CH0PR04MB8002.namprd04.prod.outlook.com
 ([fe80::9df7:c5d7:9aad:24f6]) by CH0PR04MB8002.namprd04.prod.outlook.com
 ([fe80::9df7:c5d7:9aad:24f6%7]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 05:42:04 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 2/4] arm/mach-aspeed: Add
 support for CONFIG_DRAM_UART_TO_UART1
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc 2/4] arm/mach-aspeed: Add
 support for CONFIG_DRAM_UART_TO_UART1
Thread-Index: AQHYVUKIBZpVqFFhREa0sK6cSsu5Lw==
Date: Thu, 21 Apr 2022 05:42:04 +0000
Message-ID: <20220421054204.GB11809@packtop>
References: <20220420102502.1791566-1-patrick.rudolph@9elements.com>
 <20220420102502.1791566-2-patrick.rudolph@9elements.com>
In-Reply-To: <20220420102502.1791566-2-patrick.rudolph@9elements.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f347c57c-f7b6-4f27-2794-08da2359aaaf
x-ms-traffictypediagnostic: SN6PR04MB3853:EE_
x-microsoft-antispam-prvs: <SN6PR04MB385367DF98CF4FD4BF8B4DEAC3F49@SN6PR04MB3853.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jOVT5l56ZC1UxP/knNLgnr4C365FPnQj5S2df04H9pXeDzyDWsEWQfhl+CZcHYI3o7pMZlAaPoWqoSY3OsjK6gAhZdriZqwR++noPqcQgzS0/VvFVaKfSHpvpZRk54IEwOdYini8I8RI92vjsRjrpTi/H302G8iOzEJkX19OToE1zC7p0MNYEuAcjxaOJPyW+kNDDux3Xpp8MmK/AhHic+i68DCiOPxvvkMXXuWXUOsPCVP5dlObC+/X5y3cU8gIgA02vGoz0+5frz9Nvdj9wmmRIIa2CoXXeI883tLTLIvK29Qej2jlgLSmMGKOitHgFYwRsmyk96fm36xOuI5zJt8ifCQYqyWbeG0PEHXEgHR47ZaGR8aOk2BUpCpWYiXYvO+HcChzOuyAVMWuIvAHB/R43WudkGqT+zj+xHsRhsR4aQG9GuKLRxizUCCq81M5svVPz0H/p53XWMJygW2rfGIGXtIG56Eutv0w4u3RPTz7ejx9rXCMsfT6Ba+S04NasIzMKJkABPrZ89yaFR3cGFKgHNkVuypewgBuSyuzwiXWV3gEpbBx+cbjWp3WORPlCS4WNonOezgAEJpgYH6H5lMR12l06zG6INM+tcLFDWR8c8DxocMoHIGbpcGEOPpyWv3EQyJkon/GsxR6n7L/8Fb3m3K/WzU4Iu9/82VS/UrRgXroK23VHSXoRn2urEdVV1e/O8Kg014a7QdUCYniRg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR04MB8002.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(8936002)(83380400001)(66446008)(64756008)(508600001)(66556008)(4326008)(26005)(33716001)(2906002)(66476007)(91956017)(8676002)(33656002)(316002)(38100700002)(122000001)(76116006)(5660300002)(6486002)(6506007)(6916009)(6512007)(9686003)(186003)(1076003)(71200400001)(66946007)(54906003)(86362001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tpXxtVBkJGKa5XxiOHRs4JQI4V7FdioKe9yvcojuHqw27AJ8i+6nnqmwW+xH?=
 =?us-ascii?Q?Gr1PT58mskfPAwI0fTXvhtwsm5RntNbmh7wnmbMJO0qpsdlwniYfB1BUwkEq?=
 =?us-ascii?Q?lkC24SBwui+ocp8PWs0K4BjAr3vkQ+WdRZ4oaZ9XZiK57zxNzZrx2gogjTqk?=
 =?us-ascii?Q?Rad4vbUE+4vu64Uiv8x61rRIuBZtrnvvfrWm2uRxQImVIvKvzE/JRmCc52aX?=
 =?us-ascii?Q?iH8vpsdKXqJJXQq6wtj7n3oNuDRxthIk0jcB/R3QT88m0erbGNx0ucIkrEF6?=
 =?us-ascii?Q?sxc46SkLP5GELg0brzAqcLEBCoDLsLNwr4Qlifywk17K6mhOPJwYhQO6cb07?=
 =?us-ascii?Q?am2YX8Y9VpadWMW+pbEcrnmv/Y4hs71hkE14ezrV04pXoQVFx/gPO5WZH5BS?=
 =?us-ascii?Q?b4mZ8BGtGJ2fa5FYe5GQ7gf5DnPWe1oWd88Cugh08wTFKbxQCz9q707OBwXL?=
 =?us-ascii?Q?DaHAljKuSOgVKGi6fTaG2Vl/Sq/LGf4TGoqYXIPzSSmLHUsbDPoBT0CGFQGV?=
 =?us-ascii?Q?aSzQAAUz9TRDors4OtnhfP8ptOWLIA+9/dfWpYht7p3668pLnox1TTxU3tFW?=
 =?us-ascii?Q?Kk74vBGJuyQHRQ9LZwQkTNnDRGu6NfHTFg98ku07wSZQkrpigY6HzJsFUfbY?=
 =?us-ascii?Q?b3A8MXevhz3Ajdw5iXMkbhfa+SRKjymCemDzho3sA1gmNyUorzti5/4de5/B?=
 =?us-ascii?Q?8XicKeniE7tArSkycXgditZXO+NRPTN9Sa/uD+M5W5M8WnbC7GxCEN1vs9Bh?=
 =?us-ascii?Q?+lQiPu91zAIb/bDFTio7LD/euUTpJJCidqUURZpNCmil4924rWx5/BgTS4gv?=
 =?us-ascii?Q?nQNQxXvmB+uEEf91owgdnpnKT0PEpgKp3Jzoy3KHCliVmvjYmw3MF/nLiPvr?=
 =?us-ascii?Q?t+vcLUmdUso8f/HedPXE5Me97kYM9f56J3dHwAupF51qddTOnKBS0qxgTs1R?=
 =?us-ascii?Q?6je3NZU2/iweRjUuN9eaF9QatIB6CLS9KgZ/OFXlyhgtXpqtJUEIY5Nmu3k3?=
 =?us-ascii?Q?z+grSD2VmBptaOsh9HTRZRnkXGOMusKN3vbVjRqqVY8plZ/AKuDVEOUUEQol?=
 =?us-ascii?Q?cIIRo4bLiey3fuijH89+VOweYEDfHMKXs2XhI64CTXNoMHZyMjgV4kQenv2R?=
 =?us-ascii?Q?zy1X6BwWdHAV0oOdQ/F3sMK801jZrbDbCGFF0Ez+b+dzAY2Kn40RWY4Ab54q?=
 =?us-ascii?Q?bLtQOjVhBJzwt4ZJ6DCvgz3bqGhor4sQ+ygHt4zozY/hBouMhqaoReuw8xFK?=
 =?us-ascii?Q?3Efs0X5BUN86j0Ip0V1eKxt9zGuf+6cTMAlSSbZwG2JQ4u70n1YxItCSKF9G?=
 =?us-ascii?Q?fVdIYmkxEXX3Jugh/PR1vUehXRZoswlOGVubYUcuEGdFCUxsCLSc/K32GlFW?=
 =?us-ascii?Q?c7xBCdWAohY891n8qITChML/O2t/YZ8CmKeWoP6gW5Xx6ECU3S6s3aVhbI5N?=
 =?us-ascii?Q?2+3wh0UxZfxIHyHnEiplY+fQhQuttKjABMA9yU6G4gOGKbJzO6c9jExSSKdD?=
 =?us-ascii?Q?irQ0PL1HgZHZusH9V1PwAazg3zH+Fz4a2ZkuOP1yETAi284UMHfJckxWWCmE?=
 =?us-ascii?Q?Fzi1LpkvigbLJLlYg9nyjriK/iHzW1NZ8Yocg/vCX/1GjG+hcbVzzyepF7Jv?=
 =?us-ascii?Q?FcXd8wqZqVztZqrTCoEuSdfa9dHlZAloq2WCyebGT3UU0ibAxU8rz+lTek7w?=
 =?us-ascii?Q?HiTZ54FBxCDAdwS1idilRAt9HrEEv6TUjLaZlfA/RCykFdnVH/6Df7vWQwLH?=
 =?us-ascii?Q?PU9nE6gaZH3d+rfpq+5Q3TwoEa1fF08=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7C2059D6D6FA7A4E8DAFBDD75D9CA91F@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR04MB8002.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f347c57c-f7b6-4f27-2794-08da2359aaaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 05:42:04.8857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mQMvUhso2o6Y5tN7/jV7nlO1ZB3YuOwQRnbZEw3dIU1/iXK0k7ysK69R1ACEKY233C33B8AbR30sgEY2gsXxLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3853
X-Proofpoint-GUID: 0lqvAEa7XW9QC36VzPDQ2lkoDmtsx4I9
X-Proofpoint-ORIG-GUID: 0lqvAEa7XW9QC36VzPDQ2lkoDmtsx4I9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_06,2022-04-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204210029
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
Cc: "christian.walter@9elements.com" <christian.walter@9elements.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "takken@us.ibm.com" <takken@us.ibm.com>, "joel@jms.id.au" <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Apr 20, 2022 at 03:25:00AM PDT, Patrick Rudolph wrote:
>Update the Kconfig and allow a board to use CONFIG_DRAM_UART_TO_UART1.
>This is required on IBM/Genesis3 as it uses RDX1/TDX1 as debug uart.
>

Since I was a bit confused at first at seeing a new Kconfig symbol with
no accompanying code to implement its functionality (until I grepped
around a bit and saw why), it might be nice to note in the commit
message that the logic to support this already exists in the ast2500
platform code and just didn't have an accompanying Kconfig option until
now.

>Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>---
> arch/arm/mach-aspeed/ast2500/Kconfig | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/arch/arm/mach-aspeed/ast2500/Kconfig b/arch/arm/mach-aspeed/a=
st2500/Kconfig
>index 81c4fd0c2f..232117b43c 100644
>--- a/arch/arm/mach-aspeed/ast2500/Kconfig
>+++ b/arch/arm/mach-aspeed/ast2500/Kconfig
>@@ -27,6 +27,12 @@ config TARGET_IBM_GENESIS3
>
> endchoice
>
>+config DRAM_UART_TO_UART1
>+	bool
>+	prompt "Route debug UART to UART1"
>+	help
>+	  Route debug UART to TXD1/RXD1 pins.
>+
> source "board/aspeed/evb_ast2500/Kconfig"
> source "board/ibm/genesis3/Kconfig"
>
>--=20
>2.35.1
>=
