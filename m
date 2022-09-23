Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 322695E7CC2
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 16:20:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYvSx0FhSz3c7y
	for <lists+openbmc@lfdr.de>; Sat, 24 Sep 2022 00:20:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xsfiq3+b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xsfiq3+b;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYvSS3C3Bz3c6x
	for <openbmc@lists.ozlabs.org>; Sat, 24 Sep 2022 00:20:23 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28NDoeh9016467;
	Fri, 23 Sep 2022 14:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=rIALfHi8LeCfcvNXxPXno+g/RYsaX1erCgL4qet9oos=;
 b=Xsfiq3+bioYddJCUSo4FRMAOems5OoYcbrE6JRxieYwJKVMt3rp1EVzbiTZdAWyVoBxF
 dQcRZ/IzNuv9YXfQMb2Nl8U/e56iKz5Qj/S5Pkj4Z+L0QZGhfOI+QeKBvf8PEV1PW/fB
 5qm6dkkiZIKWHnipImPoH2zUVKC3RPA7Pgbn91LbnxWoJcrr9JIADYQsBFDTLl/vDvJO
 r2Z9AggV8n2NcFyz26H+YrpS8n+HgVkUvVCj2X+xOjzUKdkGob+sVCcRteBIaQDDkS7S
 KbHlOXqbADTtF5195d+idutToP06sL80v7OQl47ZyRrvMJSMeNNgB24Yp7BdCXW11qy8 Kg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3js8nek3vb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 14:20:08 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28NE58Fu027009;
	Fri, 23 Sep 2022 14:20:07 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
	by ppma02dal.us.ibm.com with ESMTP id 3jn5vaj521-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 14:20:07 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28NEK6cs58196430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Sep 2022 14:20:07 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D7BA458062;
	Fri, 23 Sep 2022 14:20:05 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4027D58060;
	Fri, 23 Sep 2022 14:20:05 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.160.76.237])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 23 Sep 2022 14:20:05 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] ram/aspeed: Re-init ECC
 if requested but not enabled
From: Adriana Kobylak <anoo@linux.ibm.com>
In-Reply-To: <20220921074629.2265812-1-joel@jms.id.au>
Date: Fri, 23 Sep 2022 09:19:54 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <3C808E7F-2F2A-4B77-98FF-87C1863A84CE@linux.ibm.com>
References: <20220921074629.2265812-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T_7ShvMnMzCgv422vNv3YtJvnj2_FEnO
X-Proofpoint-ORIG-GUID: T_7ShvMnMzCgv422vNv3YtJvnj2_FEnO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_04,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209230092
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
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Sep 21, 2022, at 2:46 AM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> If a machine has a new u-boot installed that enables ECC, but it has =
not
> had a power cycle since being updated, the DDR will not re-initalise =
and
> ECC will stay disabled.
>=20
> Similarly for the reverse case, where ECC was enabled but a new u-boot
> disables it.
>=20
> Detect if ECC has been requested by the firmware and check against the
> hardware state. If it does not match, and the DDR has already been
> initialised, proceed as if the DDR has not been set up.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Adriana Kobylak <anoo@us.ibm.com>
Tested-by: Adriana Kobylak <anoo@us.ibm.com>

> ---
> v2:
> Add ast2500 too
> Fix logic for if (required) test
> ---
> drivers/ram/aspeed/sdram_ast2500.c | 23 ++++++++++++++++++++++-
> drivers/ram/aspeed/sdram_ast2600.c | 27 +++++++++++++++++++++++++--
> 2 files changed, 47 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/ram/aspeed/sdram_ast2500.c =
b/drivers/ram/aspeed/sdram_ast2500.c
> index c8eee32da698..f89dd78487e9 100644
> --- a/drivers/ram/aspeed/sdram_ast2500.c
> +++ b/drivers/ram/aspeed/sdram_ast2500.c
> @@ -409,6 +409,27 @@ static void ast2500_sdrammc_lock(struct dram_info =
*info)
> 		;
> }
>=20
> +static bool ast2500_sdrammc_init_required(struct udevice *dev)
> +{
> +	struct dram_info *priv =3D dev_get_priv(dev);
> +	struct ast2500_sdrammc_regs *regs =3D priv->regs;
> +	bool ecc_requested;
> +	bool ecc_enabled;
> +	bool dram_ready;
> +
> +	ecc_requested =3D dev_read_bool(dev, "aspeed,ecc-enabled");
> +	ecc_enabled =3D readl(&regs->config) & SDRAM_CONF_ECC_EN;
> +	dram_ready  =3D readl(&priv->scu->vga_handshake[0]) & BIT(6);
> +
> +	if (!dram_ready)
> +		return true;
> +
> +	if (ecc_requested !=3D ecc_enabled)
> +		return true;
> +
> +	return false;
> +}
> +
> static int ast2500_sdrammc_probe(struct udevice *dev)
> {
> 	struct dram_info *priv =3D (struct dram_info =
*)dev_get_priv(dev);
> @@ -437,7 +458,7 @@ static int ast2500_sdrammc_probe(struct udevice =
*dev)
> 		return PTR_ERR(priv->scu);
> 	}
>=20
> -	if (readl(&priv->scu->vga_handshake[0]) & (0x1 << 6)) {
> +	if (!ast2500_sdrammc_init_required(dev)) {
> 		ast2500_sdrammc_update_size(priv);
>=20
> 		if (!(readl(&priv->regs->config) & SDRAM_CONF_CACHE_EN)) =
{
> diff --git a/drivers/ram/aspeed/sdram_ast2600.c =
b/drivers/ram/aspeed/sdram_ast2600.c
> index 5f7b160faddf..66b5dd1fe6a9 100644
> --- a/drivers/ram/aspeed/sdram_ast2600.c
> +++ b/drivers/ram/aspeed/sdram_ast2600.c
> @@ -891,6 +891,30 @@ static void ast2600_sdrammc_ecc_enable(struct =
dram_info *info, u32 conf_size_mb)
> 	writel(0, &regs->intr_ctrl);
> }
>=20
> +static bool ast2600_sdrammc_init_required(struct udevice *dev)
> +{
> +	struct dram_info *priv =3D dev_get_priv(dev);
> +	struct ast2600_sdrammc_regs *regs =3D priv->regs;
> +	bool ecc_requested;
> +	bool ecc_enabled;
> +	bool dram_ready;
> +
> +	ecc_requested =3D dev_read_bool(dev, "aspeed,ecc-enabled");
> +	ecc_enabled =3D readl(&regs->config) & SDRAM_CONF_ECC_SETUP;
> +	dram_ready  =3D readl(priv->scu + AST_SCU_HANDSHAKE) & =
SCU_SDRAM_INIT_READY_MASK;
> +
> +	debug("ECC: requested %d enabled %d dram ready %d\n",
> +			ecc_requested, ecc_enabled, dram_ready);
> +
> +	if (!dram_ready)
> +		return true;
> +
> +	if (ecc_requested !=3D ecc_enabled)
> +		return true;
> +
> +	return false;
> +}
> +
> static int ast2600_sdrammc_probe(struct udevice *dev)
> {
> 	struct dram_info *priv =3D (struct dram_info =
*)dev_get_priv(dev);
> @@ -913,8 +937,7 @@ static int ast2600_sdrammc_probe(struct udevice =
*dev)
> 		return PTR_ERR(priv->scu);
> 	}
>=20
> -	reg =3D readl(priv->scu + AST_SCU_HANDSHAKE);
> -	if (reg & SCU_SDRAM_INIT_READY_MASK) {
> +	if (!ast2600_sdrammc_init_required(dev)) {
> 		printf("already initialized, ");
> 		setbits_le32(priv->scu + AST_SCU_HANDSHAKE, =
SCU_HANDSHAKE_MASK);
> 		ast2600_sdrammc_update_size(priv);
> --=20
> 2.35.1
>=20

