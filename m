Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 130D753EF26
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 22:07:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LH4Jz04wKz3blW
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 06:07:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=d/+g6hD2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.159.192; helo=mx0b-00268f01.pphosted.com; envelope-from=prvs=91568dad4e=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=d/+g6hD2;
	dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com [148.163.159.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LH4JQ5qXgz2yLX
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2022 06:06:40 +1000 (AEST)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
	by mx0b-00268f01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 256FWPKP009932;
	Mon, 6 Jun 2022 20:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=+f4exxI5kSd8GdXzLVnWOOYy2cTFPz0waN4NZkWLlns=;
 b=d/+g6hD2oVtwbXYiqihK4RBRpBJGHYSbN0uupyMSZu4jvajLBkwyg2h1EiByTljQ+coj
 v5j3TIZImJPku9ZisZNe/5Ha6+/acYfFxkhDn1gpvwSSvSlVK6fYc0OYn6hVyxwWIPTY
 BrceamNTEsB9ZxERJLifii5T2NI6dxX6A3cOH7lz6TzdHj+IFLj+4rYf7pe2IOaRMtBc
 szSMPV3Vlq5kGzRRDXVgnASqGHcmK3kfN3MVJr3glPcsYxNm1FJlWytOypGksy9uJS+F
 zBYkvJanb05Pyv7eu9eP02f3ZQVRUYAY6T0vobYTx9VzaLmhfMHq1sos4uQjIBCiJeAk Ag== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3ghmagrvt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jun 2022 20:06:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rt7x9Hh+o2CC8fb7SH6/Fm7uLrkffgBJk1BbPWZb2ilSJf5h5uiGJ9Ja02OrtCkxct7H+/i5JEkQ+bDmkMTbHz3KYID7mp3gCrI8UqTcyZwLNi+A6vyYUwN9KwTY8uaZrrNizuS+GoK6nuHWdEdolniESDBNGGaEixVWeD0NV77/vZLaXm1gtz64W8JSrPcDy6TY3iX2B+KbkqzWq/Uj75Z5YFGQhwWPq/XWv02fzQD2m1HMEnb0rkIJCz9OMAPZkv+yOuo1iua4Le/Iyxm/oh1qraxZL9vB7a1neXAyPJl2kAUBb0kBLhJxYuOqrqSUGLXkvfTzeH6o9jIAbjjojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+f4exxI5kSd8GdXzLVnWOOYy2cTFPz0waN4NZkWLlns=;
 b=e3s5/ui6i+oYP6aIvInbw/aOl7HTTHzfx6Edk9WLm4kePEBlBCbZzSOXIQbXHfh4VT/4lr83+CKT5uIKL54SEngyZipGFmsY2mL0CMLnjcHVqroms+rZ2ys8jHf7gb47vP1NR4faWrKEirPagyBt9ER4G2cdqBE/gW28azn12/9/bxqNOVlR7HmGt+rnStqtK89414zZhrt8NZdvAtWhHkU4ZPH80yXyKGuNXaMlfzSFLoC37pwNH+3wvGjVc3kUg6D17Q0RLip1xIs8rjAqQsYmxeDZBUpCqdmvIoNGNz5aoVZzUtqZ+t43XGsby8skaH+6l19fiMILPriw/+638g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by BY5PR04MB6407.namprd04.prod.outlook.com (2603:10b6:a03:1e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 20:06:34 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::3cb6:207c:de36:12f5]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::3cb6:207c:de36:12f5%6]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 20:06:33 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 2/2] ARM: dts: ast2600:
 Fix indentation
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc v2 2/2] ARM: dts: ast2600:
 Fix indentation
Thread-Index: AQHYeeDruMPG/IO/JkGWOcoxNGbyOg==
Date: Mon, 6 Jun 2022 20:06:33 +0000
Message-ID: <20220606200633.GO11809@packtop>
References: <20220606000434.1399583-1-joel@jms.id.au>
 <20220606000434.1399583-3-joel@jms.id.au>
In-Reply-To: <20220606000434.1399583-3-joel@jms.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c2269cb-6fea-4814-1f01-08da47f80dee
x-ms-traffictypediagnostic: BY5PR04MB6407:EE_
x-microsoft-antispam-prvs:  <BY5PR04MB640756A70B7D94391D46CC9FC3A29@BY5PR04MB6407.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  nWuUbAtjmfOUqpJPmp4kFBsnPYLdFJVYP1/0tgTrEdKwfYaPM3xOEywOiTPnFxxoAtogROUjJASteDnNzfTdspX6gN+9vtr01opLGeEpMVFLyv9LJYtIvzj167YpIc5XYwvVCY1oi+Mu0DCNNc+VUM3SCbaDNqRDSPB68jT88bLbtOylmj+pPSEXGFQIfW5wup3mF64Tarsh64ZF31S34r7akM17IBU7NjcBNPAFLTYvZaQS1td+Hz7InOy3duEVzBEE4LYtkrZCBCfimrLnrLr0CNikDrCibmQgNuAsxV42Xwz1Sc7e0H7fITqX63oFwcB8YDOEjpWEr2ybKxWqWN5JACD5yndXVVeb+AFBUHGzPShNKgZILILjpHGhnZNoGHXACHJENL8BaWjqM655+OKdHxm/ZfGqu0IfyweQVuduE0gPCfHvvLBqLhkjftgQtaHhi5V2kdplBp+WrvOgv/WAhCem3zWVPgaM1ukz/zL3c1VkF17eBS7uo6RoUzPbje9WCFg7JagYYYX4dqJ/WaTPDLC90qwiPWs4I9gM5N7o7khqvmUp9CiLajnnW6XU+SDMV4qRIDu9F3iw/0EtN+t6LG6qBUMpyTraV/V5ee4Map6hY+1YoJ8SlKT2J24mZBV2iCpLBCGFP1gbck6xQGNy33wCdxOAI4fFWI4+al52ubR1+8XTjIv1HePNlwb22gDEjx5OQdbG+7GkR0jz5A==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8936002)(4326008)(66446008)(76116006)(66476007)(91956017)(5660300002)(38100700002)(508600001)(6486002)(86362001)(122000001)(8676002)(66556008)(66946007)(64756008)(33716001)(71200400001)(38070700005)(2906002)(83380400001)(186003)(6506007)(33656002)(6512007)(9686003)(26005)(6916009)(54906003)(316002)(1076003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?UF11XmDZ4cXR5ZD3kRxETUClMKLbvDP5K96dYarDPT1/N+C7s8qs/3Go8l3O?=
 =?us-ascii?Q?n/plaQcXZo8fpWbO4QRiqNYHhn7Y0ykPVylBeQFxqqqQBjpgwMYttEZnswpz?=
 =?us-ascii?Q?l6yvRL3dnf65TN2k05GEP35YTqpAO1nQsqkuPwphy2NYEVEoWNRJpo527BpP?=
 =?us-ascii?Q?302cCv9eO13/XsmbhTYfymKSpF3A+wvZC1s5bvR70AuaZ7AOBgm98ILdiA4u?=
 =?us-ascii?Q?0X+onUM3FKdwsW9wZRny043X82aPYwetIkFeQsriR4Qa7H/6NoPXIhSPsZJX?=
 =?us-ascii?Q?7xL+boI63/v2KBGSj0tKQhu+NT5f5yPmtTmfbJK5UmYA7vZLyTWKOlauvxxQ?=
 =?us-ascii?Q?AQam0CPAEHHWplxBYvL8A4G6zEChLpnVofRp3oG9u1Xh2usGk0BD6b6StzHw?=
 =?us-ascii?Q?wR9YFCIkQXAb1C2I1X0zkfxRMxS69kBHAJq0OSUhF1GiKC9p2Rm2S98rK4N3?=
 =?us-ascii?Q?0zOywjrVB4OrArrFohULC8n52PNBNwk6Nj6o8cKF4ArmVcda7k/8x4bP8rU9?=
 =?us-ascii?Q?8lKpzKNZx5mfu1Qbrk5GNR2MvK0vnaLoSu/WQTkMWY2IQOplwXu3YghVrio1?=
 =?us-ascii?Q?M9wfqU/vi63BiiywvQgUhH+gtY/biRTJ/Onc9aQxa8S3NAOtz6bTxpP2Y5KG?=
 =?us-ascii?Q?U+YGMwQGF7LSX8iwQ4VghS3M/nviiT1JIZ/Zg79JDDBdbl9WA52IKvAxbPq0?=
 =?us-ascii?Q?CqmGEQPIO35hKtQplxPkv4TFGot9zbw+0tDx7O7iEy1G+hyMp+DurE8Gw7K+?=
 =?us-ascii?Q?pv8+KMZ+ksyg9yB7sScCfrT67gKLeFDI42sr2/3aAO50bOqRh3ejzj1Lg6IG?=
 =?us-ascii?Q?Az7XRjn4MLKQ8/PM099D4uHOJ2Npfv+902r1uwTGGo4ERwd/JZzQ3AiWXATf?=
 =?us-ascii?Q?q0dA0z3N7AZv6/leIPPSYog3RhNNrQxa3Jj8BxPqQaCtCHHAe9ehSWp6M/15?=
 =?us-ascii?Q?sxQh1fUk0vLaOG+ci3tUhfdyxLZ9/78ThGS4iI0pi/iwwfWicYHsQjBYa2et?=
 =?us-ascii?Q?DFzNARUPvg5raKPYjHzKMXITE6FxH9RRH3Sfj5YwXAuR20atbn786ACtFo/2?=
 =?us-ascii?Q?SXXp/z+7pkEyGODNTOrRiTt5ZOBUfTIix4zLL6UYyWJ0UsgwHNntPocbES2p?=
 =?us-ascii?Q?GCpLgqbpicJO38SbctG0eeu37FLtUy89z0WuggblEVzzJ+iI4D+/xAg+SWfm?=
 =?us-ascii?Q?44R5qCB0mxhJK+MzJiHWRNgS78EC84pl5QudlQYJuOmLPt0wgy61XFQw+z91?=
 =?us-ascii?Q?Ak2NWMVJMtdZnKpEGza92NbOKEAPon724rGwwUow6T7KbfXWseuanY5DJuMl?=
 =?us-ascii?Q?BZnDy6DQUOKrIbI8jvkR+TMdiKALvPy7IkpNSFtUZmyFi3Wr6OYUwQsbEWdJ?=
 =?us-ascii?Q?oJtBGGVGisTSnBEB7W7Xz4+2nPwe4xArZIHvrORR970SdGRbXSrqeFHLFzv/?=
 =?us-ascii?Q?Qe8d3hRFl/LYfwHhlyUiYP48O8elWJskBC/JqD9veRq821a9myBxZcFs6S1J?=
 =?us-ascii?Q?STR1opyH9T/46v/x01BdFUekWanSZX60BBCaHDHDLDx0s5UC+JX1m9UwSZ1L?=
 =?us-ascii?Q?3Wtt2c+D59w7z4lf8bsbmPnqzZd3lawQklnYE09sQN2zMesC5fTj0cizoPpS?=
 =?us-ascii?Q?z3a/UJ6HJuhTwioBPHerw0MuwTsF4O35Q2LdHuld1EcdBJ9oTFv2rKfaazL4?=
 =?us-ascii?Q?rpQ8ODu0OGwTd5ThEe5uVRin6ovuZsEF7wTMPbIYKZzowcYzYQMIEwpEo9t4?=
 =?us-ascii?Q?DtwH1m0uiA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <49DB8A255B3C844089C86ACA1749C027@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2269cb-6fea-4814-1f01-08da47f80dee
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 20:06:33.6892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nEi+wipWPLd9C8Wdwb7AnNOkXvp0/AseiCEfIV7BcPNayjuN/xZpi+M42NvtIFRvPFFGsXL9tFUDzF/xK8OuhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6407
X-Proofpoint-GUID: eXafT66bHv87tM8bqLUx-dDYV6NuLXqq
X-Proofpoint-ORIG-GUID: eXafT66bHv87tM8bqLUx-dDYV6NuLXqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-06_06,2022-06-03_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 mlxlogscore=614 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206060080
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

On Sun, Jun 05, 2022 at 05:04:34PM PDT, Joel Stanley wrote:
>These lines were mistakenly added with space indentation instead of
>tabs.
>
>Fixes: ba6ce6626286 ("aspeed: Add machine names")
>Reported-by: Zev Weiss <zweiss@equinix.com>
>Signed-off-by: Joel Stanley <joel@jms.id.au>
>---
> arch/arm/dts/ast2600-evb.dts    | 4 ++--
> arch/arm/dts/ast2600-fpga.dts   | 4 ++--
> arch/arm/dts/ast2600-ncsi.dts   | 4 ++--
> arch/arm/dts/ast2600-p10bmc.dts | 4 ++--
> arch/arm/dts/ast2600-tacoma.dts | 4 ++--
> 5 files changed, 10 insertions(+), 10 deletions(-)
>

Looks like this doesn't fix up all the files that got spacified in
ba6ce6626286; shall we also cover these while we're at it?

ast2400-evb
ast2500-evb
ast2600a0-evb
ast2600a1-evb


Zev

>diff --git a/arch/arm/dts/ast2600-evb.dts b/arch/arm/dts/ast2600-evb.dts
>index 3aeef78df22d..515afa83af69 100644
>--- a/arch/arm/dts/ast2600-evb.dts
>+++ b/arch/arm/dts/ast2600-evb.dts
>@@ -3,8 +3,8 @@
> #include "ast2600-u-boot.dtsi"
>
> / {
>-        model =3D "AST2600 EVB";
>-        compatible =3D "aspeed,ast2600-evb", "aspeed,ast2600";
>+	model =3D "AST2600 EVB";
>+	compatible =3D "aspeed,ast2600-evb", "aspeed,ast2600";
>
> 	memory {
> 		device_type =3D "memory";
>diff --git a/arch/arm/dts/ast2600-fpga.dts b/arch/arm/dts/ast2600-fpga.dts
>index be0788d92473..069a41185597 100644
>--- a/arch/arm/dts/ast2600-fpga.dts
>+++ b/arch/arm/dts/ast2600-fpga.dts
>@@ -3,8 +3,8 @@
> #include "ast2600-u-boot.dtsi"
>
> / {
>-        model =3D "AST2600 FPGA";
>-        compatible =3D "aspeed,ast2600-fpga", "aspeed,ast2600";
>+	model =3D "AST2600 FPGA";
>+	compatible =3D "aspeed,ast2600-fpga", "aspeed,ast2600";
>
> 	memory {
> 		device_type =3D "memory";
>diff --git a/arch/arm/dts/ast2600-ncsi.dts b/arch/arm/dts/ast2600-ncsi.dts
>index f55294cdf95e..dbe888a945e3 100644
>--- a/arch/arm/dts/ast2600-ncsi.dts
>+++ b/arch/arm/dts/ast2600-ncsi.dts
>@@ -3,8 +3,8 @@
> #include "ast2600-u-boot.dtsi"
>
> / {
>-        model =3D "AST2600 EVB w/ NCSI";
>-        compatible =3D "aspeed,ast2600-evb", "aspeed,ast2600";
>+	model =3D "AST2600 EVB w/ NCSI";
>+	compatible =3D "aspeed,ast2600-evb", "aspeed,ast2600";
>
> 	memory {
> 		device_type =3D "memory";
>diff --git a/arch/arm/dts/ast2600-p10bmc.dts b/arch/arm/dts/ast2600-p10bmc=
.dts
>index d1d78d5c3545..aa9edcd66507 100755
>--- a/arch/arm/dts/ast2600-p10bmc.dts
>+++ b/arch/arm/dts/ast2600-p10bmc.dts
>@@ -5,8 +5,8 @@
> #include "ast2600-u-boot.dtsi"
>
> / {
>-        model =3D "IBM P10 BMC";
>-        compatible =3D "ibm,everest-bmc", "ibm,rainier-bmc", "ibm,p10bmc"=
, "aspeed,ast2600";
>+	model =3D "IBM P10 BMC";
>+	compatible =3D "ibm,everest-bmc", "ibm,rainier-bmc", "ibm,p10bmc", "aspe=
ed,ast2600";
>
> 	memory {
> 		device_type =3D "memory";
>diff --git a/arch/arm/dts/ast2600-tacoma.dts b/arch/arm/dts/ast2600-tacoma=
.dts
>index 67b3e3013c6b..76f987052140 100755
>--- a/arch/arm/dts/ast2600-tacoma.dts
>+++ b/arch/arm/dts/ast2600-tacoma.dts
>@@ -5,8 +5,8 @@
> #include "ast2600-u-boot.dtsi"
>
> / {
>-        model =3D "Tacoma";
>-        compatible =3D "ibm,tacoma-bmc", "aspeed,ast2600";
>+	model =3D "Tacoma";
>+	compatible =3D "ibm,tacoma-bmc", "aspeed,ast2600";
>
> 	memory {
> 		device_type =3D "memory";
>--=20
>2.35.1
>=
