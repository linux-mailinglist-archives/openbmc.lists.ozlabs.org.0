Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5197F53B370
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 08:23:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDGDG3NrKz3bmL
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 16:23:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=kfTVXGw6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.159.192; helo=mx0b-00268f01.pphosted.com; envelope-from=prvs=9152f9d2ee=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=kfTVXGw6;
	dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com [148.163.159.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDGCk6p5Sz307C
	for <openbmc@lists.ozlabs.org>; Thu,  2 Jun 2022 16:22:55 +1000 (AEST)
Received: from pps.filterd (m0165120.ppops.net [127.0.0.1])
	by mx0b-00268f01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2525H3OV022109;
	Thu, 2 Jun 2022 06:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=FSYqCAdoj4IJaUZIHO5JJrgCa3cqWntfSqmgjokg3/E=;
 b=kfTVXGw6uvfehV00Oakx8m2iH41KSy5lWTa7KMDOUPDnXuMx+Tb94xszPsCjumTWZuMs
 PHI+VWOmeduPU3R8V30B86Yzn3FHX6ux0Ep0vcd1E6MaiiHgqVuPeC3+UKHxOogQKMrH
 wMo5/TaiO77b5uQhsIRxB68p24MSWBRaiwxG4rrdirknxjYkLGn9pz+2Q1M4mkqM6wBu
 WXueRoPaEdFsHnAMm/dvUFdkNgPQeKeJ7L2MuHg4ZX+xAlZxPjrdlWU3kjxPNmC1NQAW
 m3y8G+Q5tXPgcA0MLt7Ih4l94E+UOte4Xi4CTYGvfPvwDhrBISczSfBX3yHzdVeRcdiC ug== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3gedp59s64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jun 2022 06:22:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYhm2JMcWvbYnMwG7tFFYCClpTZ3X3kH1z7RDu3U9u+LtNhVLaTRCIyYJGRBgZ1ToWGada7OeQdgIzkz7JW3v6XR8y492AZm/XU7dvMIYirMaa3zrBGa7LEuCA8l/GodfjyYcFQZ/X8quHUOiKhFb1DEQtFYNqDHURmTbSKRcdcjIklhVoiG2O8FG1fYAz+PPl1+PHDs4V8t5QA3ofSSHEAXsd2U01GVbypW6susI7DaNGMynbrAzVn++Nu1lYUrF9VquSxXxel4CNqjejVdD/Jh9GxfcllVRBlDwtpVZsqlMK9jkzHq7SraaoosHh1JdmDOCDxexM+KiNk0j//GMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSYqCAdoj4IJaUZIHO5JJrgCa3cqWntfSqmgjokg3/E=;
 b=izt0rTEydjotqzcaVWxvdr9ybttDTG4U/wnvT2CVWgrY42XSkYhm7DgiY70QlPcCaTjt3S/I5CBt9mX+XvpSmX2r21eO81TNuXT4/UyCxSI/o9nl8mvi+iAyoSBZ1cSoHWacDHuoQ/JqVmCcd+tt1z09b5GzVksK43y4rlVNjtz1+sFBwh8VShqVoymgeMgKoOY6lR4YdnmkNIQlAUGyttLB+qJMbPkTF7kH+GrSfaRdXbxt82DvXBGD7mNBzeNMwfqqvdA882KJJZ7XHUKsc1WO1b6bdM22ksmO4O4snXafsJJ0UetCpHVRVrg0VTBopUn5PTxKz3ZDjpB8eVgqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by SN2PR04MB2208.namprd04.prod.outlook.com (2603:10b6:804:e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.17; Thu, 2 Jun
 2022 06:22:42 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::3cb6:207c:de36:12f5]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::3cb6:207c:de36:12f5%6]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 06:22:42 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: Rename Rainier
 to P10 BMC
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: Rename Rainier
 to P10 BMC
Thread-Index: AQHYdkkq1/DNxQn040yPEuVV5wVDlQ==
Date: Thu, 2 Jun 2022 06:22:41 +0000
Message-ID: <20220602062241.GN11809@packtop>
References: <20220602025030.90710-1-joel@jms.id.au>
In-Reply-To: <20220602025030.90710-1-joel@jms.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb28ce26-2d6b-4a0b-e441-08da44604cb8
x-ms-traffictypediagnostic: SN2PR04MB2208:EE_
x-microsoft-antispam-prvs:  <SN2PR04MB22080AEA71F2455CE8F4069AC3DE9@SN2PR04MB2208.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  qb9VQaDjxiAYvB9d95tHpNnaBtJr+TOVvna6N+9iyl9q01dG3Kq6lJTvH5Bv97YJF5fqOXFK4f6OFQFfflGbkP6TA3nVl5aez+n4wXEGwe20FwpNCz/U7WRqmKvf39bxNOqVMouB4VDHdn72glEBiD9DWbMbiy/pHI76EZRNi+vb6UNy/UMTJbjy25uxC2sZyG2b+ZU5GSZRSI2FGECcExIAGwRLkZnuEl6p876ONbjl2VNW4RcpZ6W3x7NR7amkYlGNBV3HZJbBX0KqV9QLN/IadvpLf2WfzQQzsBs2i59DqMSWfSq5HEM2OaaEqJ4w0+E+cFpYa/XQao0fHZPFaZ/LYmyUPqLOay/qTVbgvInuYA9SOXkfdx0NkZTispnzRJTpySq2HY/c0IdSOa8/fCnuY2mdFaFVi3eScMMc/vF+5BTgLGJSB5ZokzriHAA84XlKzRZRAGYIJSEsytKIgZOckmhnieIRdB/o+mzhsRPbKvEGmDg6sF8hgRrzO02WjsgU+sKMJQGDYy/5E+/lCr8etd/ddbMYC6cAzE01S/qvLl6iivBNxneICNCMVJCPep+OmoRZrPFkPfUjwS4tw8c8dMzcJIQeaAjwHCerm5/MuAAvklQIall5O0Ji4RQjZqGgr4KVbWE2jw88O99Pra9sbMsdII0Y1mPPZ+6lvKzMkbWHDF4ThPsT3fBNYFER
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(66946007)(6506007)(1076003)(38100700002)(33716001)(2906002)(4326008)(54906003)(66476007)(6512007)(38070700005)(66446008)(9686003)(8676002)(86362001)(83380400001)(26005)(186003)(316002)(66556008)(64756008)(6916009)(33656002)(8936002)(91956017)(76116006)(6486002)(508600001)(5660300002)(71200400001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?oOSR8k+NXMRZaDwZWFKQA86TL3CwxcdGi42FMT1gAjvZCC5mvqJ3w1QIUtpq?=
 =?us-ascii?Q?Nywha4L2gqZaAkqeSdvudzB8fiOlFDLkFVSoWUjqJhdG553UQai53OkrfOCN?=
 =?us-ascii?Q?xZA5xoDpxO0ZSPB8Uvxa+htfgNbmGkJ2SKUIsPCOBZdu1xJ+5ZO5HW/kzf+C?=
 =?us-ascii?Q?GQ4cbJR3GlnKd8sEEytcTDP/0fSWoEd4188t6fg+tXiT0YNA+NDbmGApKSJa?=
 =?us-ascii?Q?35ThgrmGOjE3KVh7daCXQnm4gPkuoi3yLCylMulQMHESADoyiyWGwWUqZodU?=
 =?us-ascii?Q?Gim2y+uVcXs4WRu72oe5SMTV0e834S2HsLBuTDRBT73pR+u5Qi6V5ec5RHXv?=
 =?us-ascii?Q?+ouIj0wKQcbJRvO2iOJALhIFRy70DHWNwlgPqyLEpg7uHfeTlkFmoaZc0m0Y?=
 =?us-ascii?Q?2GIAZFOj8+nVDlORjgef72HefCiFHYilYj2ySuGrt2eHPTsp+OXeD78o4PNZ?=
 =?us-ascii?Q?C5PWpQSG+/sZza59yar2jKHFmCtjZi15S1etTx9pKgUF4/IzX5AtuIaQXfDI?=
 =?us-ascii?Q?6/MY/BzztxFSmMJzY0MhWK7E8IVqwwZ+3bAGjBbbJjafm/QiwqrwtgjzfNlA?=
 =?us-ascii?Q?WK745GG4O4HfbaFiqWt/qkGl0iL5vy+ykr+dKdCAjo3gieckFrRG/69RdO9h?=
 =?us-ascii?Q?pNkn+fTSV7kiB+l0N1GG9NLwdh3Aq0MSJlTg0PRq5ZNEviC/9jc+rtcrW6oW?=
 =?us-ascii?Q?EvXEnypVx2DoTmnSNVvao858dMIaHYJzof59WUlVh/SezqCGn8gHyBAZZ22b?=
 =?us-ascii?Q?1LpysvdgplBbs/QQ0/XNVCgv/jSpjMcjlUyyCa3Gx0vx8GJIbJ1Z02nqkwM8?=
 =?us-ascii?Q?FgvOh2ggQkCUQUke8IoUk0mGe+QSSfVdwC/cyIXvlCVI5mOf+tHk40h0IrPe?=
 =?us-ascii?Q?V69TwOpe27cZoU+Y+Tn/QVETl1vsrSIqFnrsqXIeSKV+CwPMcN2cCrFiq1cr?=
 =?us-ascii?Q?tkEDiQZDtbEP83IwdNB3wFil4gCGAx1/JTjUgepmYrqWVWg9F0vC7a9a8v/v?=
 =?us-ascii?Q?hcdutt9bN42KfFK+biyRIwZ/hBlQptTMwTZLZfJ8/+WKhep6K/ymaS95NXJ/?=
 =?us-ascii?Q?j5YDJnjC0dut7YE6QuhLq0nz5oh2rCoGwIs/XssvBFSrxvvvMSkFq+tiuVRM?=
 =?us-ascii?Q?RHuHw5Q7soH8Y7CVoZ1OUEpU5ZI61GJsjFOuf3yRUB+a2tZmZ23K2ZFs7GtF?=
 =?us-ascii?Q?rA5C0iGqakyX5kQP+2bwqyuj8uh7g1Fc7shwYDWIdND592qASRUVfm478yyU?=
 =?us-ascii?Q?xfUqtLpzApL5Pn3nblcKQ3//wd3S2KnXm8L+M6L1akvsc2mO1Pjf/ZGUKXge?=
 =?us-ascii?Q?fQPr0NTPqwF4SLDmyfMVZbHR0NEOY7kW9kc4iopdH0NjQ94/GLFChdUz9552?=
 =?us-ascii?Q?tdCyu27J/kvqbwoZiMbGi6VbUY7OcRzRhWyucG5+3M6wM30KEHTBhHn3CvHt?=
 =?us-ascii?Q?6trFkLCVJnwPs+MlGrxmcSku6KScvwTeYb+sfgml22sgYvVmzeHMJBk2cDPK?=
 =?us-ascii?Q?lXzgIRlHBR6To/fU5TcdHCxPETuPq90+QvCFzL1rCBs5rC1U9XLanUz/dYSO?=
 =?us-ascii?Q?1xKLfOSI3vttXtbadp+6Nwl2HhsHmNhETbwbeZkLrdYI0Sep0WxWa0H+VCXN?=
 =?us-ascii?Q?8hf0H/qVEkLdth7Vue+XkKmfMc9gn3XUVE+CANPhXaetbPOFZBHtUZOvWEpF?=
 =?us-ascii?Q?ImENfxEI9l7SFmXNe9hUGrH6+a4B1XI9N8kynSaIXHm8nXeFzPdCfPNrkj4n?=
 =?us-ascii?Q?k+4nY57IPA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E7F33797E1AF2940928005FC2EAB1472@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb28ce26-2d6b-4a0b-e441-08da44604cb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2022 06:22:42.0612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cMeKwrzFcLoFndZAdcPqMsUSYsObY5dHRRtxMygzwEJyA8HK/ZkNEM3pAiuIC4J2aDqFk4svggvXwWEK6kjbtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR04MB2208
X-Proofpoint-ORIG-GUID: YSxmbMrVHcS5VyD5AqRSahWcbmo6bbA0
X-Proofpoint-GUID: YSxmbMrVHcS5VyD5AqRSahWcbmo6bbA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_01,2022-06-01_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=877 suspectscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206020024
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "eajames@linux.ibm.com" <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 01, 2022 at 07:50:29PM PDT, Joel Stanley wrote:
>The Rainier device tree is used for all IBM P10 BMCs, which includes
>both Rainier and Everest.
>
>Signed-off-by: Joel Stanley <joel@jms.id.au>
>---
> arch/arm/dts/Makefile                                    | 2 +-
> arch/arm/dts/{ast2600-rainier.dts =3D> ast2600-p10bmc.dts} | 4 ++--
> 2 files changed, 3 insertions(+), 3 deletions(-)
> rename arch/arm/dts/{ast2600-rainier.dts =3D> ast2600-p10bmc.dts} (93%)
>
>diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
>index 3515100c65ce..8d05d1e70310 100755
>--- a/arch/arm/dts/Makefile
>+++ b/arch/arm/dts/Makefile
>@@ -686,7 +686,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> 	ast2600-intel.dtb \
> 	ast2600-ncsi.dtb \
> 	ast2600-pfr.dtb \
>-	ast2600-rainier.dtb \
>+	ast2600-p10bmc.dtb \

Nit: to preserve the sorted order, should p10bmc be before pfr?  (s6q is
before slt, anyway.)

> 	ast2600-s6q.dtb \
> 	ast2600-slt.dtb \
> 	ast2600-tacoma.dtb
>diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-p10bm=
c.dts
>similarity index 93%
>rename from arch/arm/dts/ast2600-rainier.dts
>rename to arch/arm/dts/ast2600-p10bmc.dts
>index aa91b12ed399..d1d78d5c3545 100755
>--- a/arch/arm/dts/ast2600-rainier.dts
>+++ b/arch/arm/dts/ast2600-p10bmc.dts
>@@ -5,8 +5,8 @@
> #include "ast2600-u-boot.dtsi"
>
> / {
>-        model =3D "Rainier";
>-        compatible =3D "ibm,rainier-bmc", "aspeed,ast2600";
>+        model =3D "IBM P10 BMC";
>+        compatible =3D "ibm,everest-bmc", "ibm,rainier-bmc", "ibm,p10bmc"=
, "aspeed,ast2600";

It's a bit orthogonal to the rest of the patch, but I notice these lines
are space indented instead of tabbed...could maybe fold that fixup into
this, but it looks like that happened on a bunch of the ast2x00 dts
files in commit ba6ce66262865, so a separate patch to fix them all might
be better.=20

>
> 	memory { device_type =3D "memory";
>-- 2.35.1
>=
