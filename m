Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3BB5A53F7
	for <lists+openbmc@lfdr.de>; Mon, 29 Aug 2022 20:31:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGfD31xwjz3c2Q
	for <lists+openbmc@lfdr.de>; Tue, 30 Aug 2022 04:31:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BYrOD2F4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BYrOD2F4;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGfCd0TmBz305d
	for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2022 04:31:24 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27TIHdlq000963;
	Mon, 29 Aug 2022 18:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=2YZu2JXdtf5rd6Wjtp1QgfsltnJiEV2zMtqZtaF1rLk=;
 b=BYrOD2F4Q+PX5b/SG1sBZ1ePB7FUIF0e5xTECXQn/a6ZxebP39btaGytpokOhmm02+cp
 xdA3qtpcrYzGunv9y+oSUAD5iuyZITqrv5h2N8+MmheAEfnNaB7/xkYG2bviXWInikpj
 BcVkWWzIlnV0ODA2lUrWUWpMsjLPvHabh4/+M3E1257gNAc4dWtfg/ACTBfnNxMXkCmB
 Ir/78qDG5F6W5QCgOuR1oNr/10q3VdjEEAhjIRqO4omEnlz9+ajY/fuDFxM1dHjj/917
 +cge5n7rdbhvclqsnBN19aIIeTnpf1RK9AWQamqtMG4qeOvKQfeBAoYOqeR7nSmIH4wr iw== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j92kw89yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 18:31:13 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27TILvnd013460;
	Mon, 29 Aug 2022 18:31:07 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
	by ppma05wdc.us.ibm.com with ESMTP id 3j7aw9etyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 18:31:07 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27TIV6Io64684510
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Aug 2022 18:31:06 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DACF428059;
	Mon, 29 Aug 2022 18:31:06 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 92BAD28058;
	Mon, 29 Aug 2022 18:31:06 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.160.96.238])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS;
	Mon, 29 Aug 2022 18:31:06 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/2] aspeed/sdram: Use
 device tree to configure ECC
From: Adriana Kobylak <anoo@linux.ibm.com>
In-Reply-To: <20220817015949.16946-2-joel@jms.id.au>
Date: Mon, 29 Aug 2022 13:28:50 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <69899706-70E7-4FB6-901C-3AE0FE2AAA85@linux.ibm.com>
References: <20220817015949.16946-1-joel@jms.id.au>
 <20220817015949.16946-2-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9vZWxzZHQmQzP0bPBSDuMc-yEf9dR2Bd
X-Proofpoint-GUID: 9vZWxzZHQmQzP0bPBSDuMc-yEf9dR2Bd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_09,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 clxscore=1011 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208290083
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
Cc: Dylan Hung <dylan_hung@aspeedtech.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Just a minor comment in the ast2600 file, the variable should be =
conf_size_mb instead of conf_size.

> On Aug 16, 2022, at 8:59 PM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> Instead of configuring ECC based on the build config, use a device =
tree
> property to selectively enable ECC at runtime.
>=20
> There are two properties:
>=20
>  aspeed,ecc-enabled;
>  aspeed,ecc-size =3D "512";
>=20
> The enabled property is a boolean that enables ECC if it is present.
>=20
> The size is the number of MB that should be covered by ECC. Setting it
> to zero, or omitting it, defaults the ECC size to "auto detect".
>=20
>  edac: sdram@1e6e0000 {
>    compatible =3D "aspeed,ast2600-sdram-edac";
>    reg =3D <0x1e6e0000 0x174>;
>    interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
>    aspeed,ecc-enabled;
>    aspeed,ecc-size =3D "512";
>  };
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> drivers/ram/aspeed/sdram_ast2500.c | 14 ++++++++++----
> drivers/ram/aspeed/sdram_ast2600.c | 14 ++++++++++----
> drivers/ram/aspeed/Kconfig         | 13 -------------
> 3 files changed, 20 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/ram/aspeed/sdram_ast2500.c =
b/drivers/ram/aspeed/sdram_ast2500.c
> index 435e1a8cfc1d..ca3b54295bf0 100644
> --- a/drivers/ram/aspeed/sdram_ast2500.c
> +++ b/drivers/ram/aspeed/sdram_ast2500.c
> @@ -279,16 +279,16 @@ static void ast2500_sdrammc_calc_size(struct =
dram_info *info)
> }
>=20
> #ifdef CONFIG_ASPEED_ECC
> -static void ast2500_sdrammc_ecc_enable(struct dram_info *info)
> +static void ast2500_sdrammc_ecc_enable(struct dram_info *info, u32 =
conf_size_mb)
> {
> 	struct ast2500_sdrammc_regs *regs =3D info->regs;
> 	size_t conf_size;
> 	u32 reg;
> =09
> -	conf_size =3D CONFIG_ASPEED_ECC_SIZE * SDRAM_SIZE_1MB;
> +	conf_size =3D conf_size_mb * SDRAM_SIZE_1MB;
> 	if (conf_size > info->info.size) {
> 		printf("warning: ECC configured %dMB but actual size is =
%dMB\n",
> -		       CONFIG_ASPEED_ECC_SIZE,
> +		       conf_size_mb,
> 		       info->info.size / SDRAM_SIZE_1MB);
> 		conf_size =3D info->info.size;
> 	} else if (conf_size =3D=3D 0) {
> @@ -371,8 +371,14 @@ static int ast2500_sdrammc_init_ddr4(struct =
dram_info *info)
> 	writel(SDRAM_MISC_DDR4_TREFRESH, &info->regs->misc_control);
>=20
> #ifdef CONFIG_ASPEED_ECC
> -	ast2500_sdrammc_ecc_enable(info);
> +	if (dev_read_bool(dev, "aspeed,ecc-enabled")) {
> +		u32 ecc_size;
> +
> +		ecc_size =3D dev_read_u32_default(dev, =
"aspeed,ecc-size", 0);
> +		ast2500_sdrammc_ecc_enable(priv, ecc_size);
> +	}
> #endif
> +
> 	/* Enable all requests except video & display */
> 	writel(SDRAM_REQ_USB20_EHCI1
> 	       | SDRAM_REQ_USB20_EHCI2
> diff --git a/drivers/ram/aspeed/sdram_ast2600.c =
b/drivers/ram/aspeed/sdram_ast2600.c
> index 5118b14f8708..6287c45365dd 100644
> --- a/drivers/ram/aspeed/sdram_ast2600.c
> +++ b/drivers/ram/aspeed/sdram_ast2600.c
> @@ -860,16 +860,16 @@ static void ast2600_sdrammc_update_size(struct =
dram_info *info)
> 	info->info.size =3D hw_size;
> }
> #ifdef CONFIG_ASPEED_ECC
> -static void ast2600_sdrammc_ecc_enable(struct dram_info *info)
> +static void ast2600_sdrammc_ecc_enable(struct dram_info *info, u32 =
conf_size_mb)
> {
> 	struct ast2600_sdrammc_regs *regs =3D info->regs;
> 	size_t conf_size;
> 	u32 reg;
>=20
> -	conf_size =3D CONFIG_ASPEED_ECC_SIZE * SDRAM_SIZE_1MB;
> +	conf_size =3D conf_size_mb * SDRAM_SIZE_1MB;
> 	if (conf_size > info->info.size) {
> 		printf("warning: ECC configured %dMB but actual size is =
%dMB\n",
> -		       CONFIG_ASPEED_ECC_SIZE,
> +		       conf_size,

This should be =E2=80=9Cconf_size_mb,=E2=80=9D?

> 		       info->info.size / SDRAM_SIZE_1MB);
> 		conf_size =3D info->info.size;
> 	} else if (conf_size =3D=3D 0) {
> @@ -989,8 +989,14 @@ L_ast2600_sdramphy_train:
> #endif
>=20
> #ifdef CONFIG_ASPEED_ECC
> -	ast2600_sdrammc_ecc_enable(priv);
> +	if (dev_read_bool(dev, "aspeed,ecc-enabled")) {
> +		u32 ecc_size;
> +
> +		ecc_size =3D dev_read_u32_default(dev, =
"aspeed,ecc-size", 0);
> +		ast2600_sdrammc_ecc_enable(priv, ecc_size);
> +	}
> #endif
> +
> 	setbits_le32(priv->scu + AST_SCU_HANDSHAKE, SCU_HANDSHAKE_MASK);
> 	clrbits_le32(&regs->intr_ctrl, MCR50_RESET_ALL_INTR);
> 	ast2600_sdrammc_lock(priv);
> diff --git a/drivers/ram/aspeed/Kconfig b/drivers/ram/aspeed/Kconfig
> index 924e82b19430..54c7769b5bbe 100644
> --- a/drivers/ram/aspeed/Kconfig
> +++ b/drivers/ram/aspeed/Kconfig
> @@ -51,19 +51,6 @@ config ASPEED_ECC
> 	help
> 	  enable SDRAM ECC function
>=20
> -if ASPEED_ECC
> -config ASPEED_ECC_SIZE
> -	int "ECC size: 0=3Ddriver auto-caluated"
> -	depends on ASPEED_ECC
> -	default 0
> -	help
> -	  SDRAM size with the error correcting code enabled. The unit is=20=

> -	  in Megabytes.  Noted that only the 8/9 of the configured size=20=

> -	  can be used by the system.  The remaining 1/9 will be used by=20=

> -	  the ECC engine.  If the size is set to 0, the sdram driver =
will=20
> -	  calculate the SDRAM size and set the whole range be ECC =
enabled.
> -endif
> -
> choice
> 	prompt "DDR4 PHY side ODT"
> 	default ASPEED_DDR4_PHY_ODT40
> --=20
> 2.35.1
>=20

