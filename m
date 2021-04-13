Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BFE35E7AB
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 22:41:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKcw05rfrz30Gd
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 06:41:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V/YbERBw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=V/YbERBw; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKcvl2VJVz3042
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 06:41:22 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DKXKVk015399; Tue, 13 Apr 2021 16:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Ps451K1b6swnzmGUh0DkHSvnslvBh0Q2AYgNyLU0nFM=;
 b=V/YbERBw3MNUgdRiibS4tCcUNpXizylukBiagUC1fx9wWcJN38BDLoxNXvKZFH8v/VvV
 N/2zZlRPz0n1pbRgtljNcXqFD+jWJznYGC2PTBb65XqNCNWWoAVSQgr38LzSauWrd1XU
 hYW9ByrDT1/zi0y2PcdWUOCefAHb0D9YowWyAO8pUHX2XPzZF+gW3M0CCe8SNbAG6Jhu
 Vk+zb42mnCv+Gvx6/tlEtP/TbANu8WFJ5mJ4m8hply34O1Rjz+8b6pdvLpMeLcBITXIh
 aDwuvZdevi6UJl37xU55J8GLHlmcn7+rXPmIVJOBxtMbd6AReIDHSBhy6bF+MAPCDreg Ww== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wetsdncg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 16:41:08 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DKc6Tx028254;
 Tue, 13 Apr 2021 20:41:08 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 37u3n92nra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 20:41:08 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DKf73K56689290
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 20:41:07 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06B9478060;
 Tue, 13 Apr 2021 20:41:07 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0DDE7805F;
 Tue, 13 Apr 2021 20:41:05 +0000 (GMT)
Received: from [9.80.229.103] (unknown [9.80.229.103])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 20:41:05 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 10/11] crypto: Add driver
 for Aspeed HACE
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
 <20210413080755.73572-11-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <cacf13c1-91b2-ad51-606e-bb208d13ec36@linux.vnet.ibm.com>
Date: Tue, 13 Apr 2021 17:41:03 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210413080755.73572-11-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iQwFuTL3z8VdYSvLvjabNw8Zf2sKOnNE
X-Proofpoint-ORIG-GUID: iQwFuTL3z8VdYSvLvjabNw8Zf2sKOnNE
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_15:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130137
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
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

On 4/13/2021 5:07 AM, Joel Stanley wrote:
> The HACE supports MD5, SHA1 and SHA2 family hash functions. This driver
> uses it in a polling mode to perform hash calculations over buffers
> placed in DRAM.
> 
> Co-developed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   drivers/crypto/Kconfig       |  16 +++
>   drivers/crypto/Makefile      |   1 +
>   drivers/crypto/aspeed_hace.c | 250 +++++++++++++++++++++++++++++++++++
>   3 files changed, 267 insertions(+)
>   create mode 100644 drivers/crypto/aspeed_hace.c
> 
> diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
> index 1ea116be7503..f78e41e0e9e7 100644
> --- a/drivers/crypto/Kconfig
> +++ b/drivers/crypto/Kconfig
> @@ -2,4 +2,20 @@ menu "Hardware crypto devices"
> 
>   source drivers/crypto/fsl/Kconfig
> 
> +config ASPEED_HACE
> +	bool "ASPEED Hash and Crypto Engine"
> +	select SHA_HW_ACCEL
> +	select SHA_PROG_HW_ACCEL
> +	depends on ASPEED_AST2600
> +	help
> +	 Select this option to enable a driver for using the SHA engine in
> +	 the ASPEED BMC SoCs.
> +
> +	 Enabling this allows the use of SHA operations in hardware without requiring the
> +	 SHA software implementations, saving code size.
> +
> +	 Due to hardware limitations it cannot be used with a FIT placed in SPI
> +	 FLASH. Data can only be hashed if it is in SDRAM, making this relevant
> +	 for MMC and network boot only.
> +
>   endmenu
> diff --git a/drivers/crypto/Makefile b/drivers/crypto/Makefile
> index efbd1d3fca05..ac93b1295954 100644
> --- a/drivers/crypto/Makefile
> +++ b/drivers/crypto/Makefile
> @@ -4,5 +4,6 @@
>   # 	http://www.samsung.com
> 
>   obj-$(CONFIG_EXYNOS_ACE_SHA)	+= ace_sha.o
> +obj-$(CONFIG_ASPEED_HACE)	+= aspeed_hace.o
>   obj-y += rsa_mod_exp/
>   obj-y += fsl/
> diff --git a/drivers/crypto/aspeed_hace.c b/drivers/crypto/aspeed_hace.c
> new file mode 100644
> index 000000000000..473d4d7391b7
> --- /dev/null
> +++ b/drivers/crypto/aspeed_hace.c
> @@ -0,0 +1,250 @@
> +/*
> + * (C) Copyright ASPEED Technology Inc.
> + * Copyright 2021 IBM Corp.
> + *
> + * SPDX-License-Identifier:	GPL-2.0-or-later
> + */
> +
> +#include <common.h>
> +#include <clk.h>
> +
> +#include <log.h>
> +#include <asm/io.h>
> +#include <malloc.h>
> +#include <hash.h>
> +
> +#include <dm/device.h>
> +#include <dm/fdtaddr.h>
> +
> +#include <linux/bitops.h>
> +#include <linux/delay.h>
> +#include <linux/kernel.h>
> +#include <linux/iopoll.h>
> +
> +#define ASPEED_HACE_STS			0x1C
> +#define  HACE_RSA_ISR			BIT(13)
> +#define  HACE_CRYPTO_ISR		BIT(12)
> +#define  HACE_HASH_ISR			BIT(9)
> +#define  HACE_RSA_BUSY			BIT(2)
> +#define  HACE_CRYPTO_BUSY		BIT(1)
> +#define  HACE_HASH_BUSY			BIT(0)
> +#define ASPEED_HACE_HASH_SRC		0x20
> +#define ASPEED_HACE_HASH_DIGEST_BUFF	0x24
> +#define ASPEED_HACE_HASH_KEY_BUFF	0x28
> +#define ASPEED_HACE_HASH_DATA_LEN	0x2C
> +#define  HACE_SG_LAST			BIT(31)
> +#define ASPEED_HACE_HASH_CMD		0x30
> +#define  HACE_SHA_BE_EN			BIT(3)
> +#define  HACE_MD5_LE_EN			BIT(2)
> +#define  HACE_ALGO_MD5			0
> +#define  HACE_ALGO_SHA1			BIT(5)
> +#define  HACE_ALGO_SHA224		BIT(6)
> +#define  HACE_ALGO_SHA256		(BIT(4) | BIT(6))
> +#define  HACE_ALGO_SHA512		(BIT(5) | BIT(6))
> +#define  HACE_ALGO_SHA384		(BIT(5) | BIT(6) | BIT(10))
> +#define  HACE_SG_EN			BIT(18)
> +
> +#define ASPEED_MAX_SG			32
> +
> +struct aspeed_sg {
> +	u32 len;
> +	u32 addr;
> +};
> +
> +struct aspeed_hash_ctx {
> +	u32 method;
> +	u32 digest_size;
> +	u32 len;
> +	u32 count;
> +	struct aspeed_sg list[ASPEED_MAX_SG] __attribute__((aligned(8)));
> +};
> +
> +struct aspeed_hace {
> +	struct clk clk;
> +};
> +
> +static phys_addr_t base;
> +
> +static int aspeed_hace_wait_completion(u32 reg, u32 flag, int timeout_us)
> +{
> +	u32 val;
> +
> +	return readl_poll_timeout(reg, val, (val & flag) == flag, timeout_us);
> +}
> +
> +static int digest_object(const void *src, unsigned int length, void *digest,
> +		  u32 method)
> +{
> +	if (!((u32)src & BIT(31))) {
> +		debug("HACE src out of bounds: can only copy from SDRAM\n");
> +		return -EINVAL;
> +	}
> +
> +	if ((u32)digest & 0x7) {
> +		debug("HACE dest alignment incorrect: %p\n", digest);
> +		return -EINVAL;
> +	}
> +
> +	writel((u32)src, base + ASPEED_HACE_HASH_SRC);
> +	writel((u32)digest, base + ASPEED_HACE_HASH_DIGEST_BUFF);
> +	writel(length, base + ASPEED_HACE_HASH_DATA_LEN);
> +	writel(HACE_SHA_BE_EN | method, base + ASPEED_HACE_HASH_CMD);
> +
> +	/* SHA512 hashing appears to have a througput of about 12MB/s */
> +	return aspeed_hace_wait_completion(base + ASPEED_HACE_STS,
> +			HACE_HASH_ISR,
> +			1000 + (length >> 3));

In some of my previous testing with the un-cleaned patchset
(https://github.com/klauskiwi/u-boot/tree/hace_sg_work), the
Qemu implementation (Cedric's Aspeed-6.0 branch) worked fine,
but on hardware I was getting errors until I explicitly
cleared the HACE_HASH_ISR before attemptinga new command..
It makes sense since the readl_poll_timeout() would return
immediately, without completing the command, if the HASH_ISR bit
is set.

> +}
> +
> +void hw_sha1(const unsigned char *pbuf, unsigned int buf_len,
> +	       unsigned char *pout, unsigned int chunk_size)
> +{
> +	int rc;
> +
> +	rc = digest_object(pbuf, buf_len, pout, HACE_ALGO_SHA1);
> +	if (rc)
> +		debug("HACE failure: %d\n", rc);
> +}
> +
> +void hw_sha256(const unsigned char *pbuf, unsigned int buf_len,
> +	       unsigned char *pout, unsigned int chunk_size)
> +{
> +	int rc;
> +
> +	rc = digest_object(pbuf, buf_len, pout, HACE_ALGO_SHA256);
> +	if (rc)
> +		debug("HACE failure: %d\n", rc);
> +}
> +
> +void hw_sha512(const unsigned char *pbuf, unsigned int buf_len,
> +	       unsigned char *pout, unsigned int chunk_size)
> +{
> +	int rc;
> +
> +	rc = digest_object(pbuf, buf_len, pout, HACE_ALGO_SHA512);
> +	if (rc)
> +		debug("HACE failure: %d\n", rc);
> +}
> +
> +#if IS_ENABLED(CONFIG_SHA_PROG_HW_ACCEL)
> +int hw_sha_init(struct hash_algo *algo, void **ctxp)
> +{
> +	struct aspeed_hash_ctx *ctx;
> +	u32 method;
> +
> +	if (!strcmp(algo->name, "sha1")) {
> +		method = HACE_ALGO_SHA1;
> +	}
> +	else if (!strcmp(algo->name, "sha256")) {
> +		method = HACE_ALGO_SHA256;
> +	}
> +	else if (!strcmp(algo->name, "sha512")) {
> +		method = HACE_ALGO_SHA512;
> +	}
> +	else  {
> +		return -ENOTSUPP;
> +	}
> +
> +	ctx = calloc(1, sizeof(*ctx));
> +
> +	if (ctx == NULL) {
> +		debug("Cannot allocate memory for context\n");
> +		return -ENOMEM;
> +	}
> +	ctx->method = method | HACE_SG_EN;
> +	ctx->digest_size = algo->digest_size;
> +	*ctxp = ctx;
> +
> +	return 0;
> +}
> +
> +int hw_sha_update(struct hash_algo *algo, void *hash_ctx, const void *buf,
> +		  unsigned int size, int is_last)
> +{
> +	struct aspeed_hash_ctx *ctx = hash_ctx;
> +	struct aspeed_sg *sg = &ctx->list[ctx->count];
> +
> +	if (ctx->count >= ARRAY_SIZE(ctx->list)) {
> +		debug("HACE error: Reached maximum number of hash segments\n");
> +		free(ctx);
> +		return -EINVAL;
> +	}
> +
> +	sg->addr = (u32)buf;
> +	sg->len = size;
> +	if (is_last)
> +		sg->len |= HACE_SG_LAST;
> +
> +	ctx->count++;
> +	ctx->len += size;
> +
> +	return 0;
> +}
> +
> +int hw_sha_finish(struct hash_algo *algo, void *hash_ctx, void *dest_buf, int size)
> +{
> +	struct aspeed_hash_ctx *ctx = hash_ctx;
> +	int rc;
> +
> +	if (size < ctx->digest_size) {
> +		debug("HACE error: insufficient size on destination buffer\n");
> +		free(ctx);
> +		return -EINVAL;
> +	}
> +
> +	rc = digest_object(ctx->list, ctx->len, dest_buf, ctx->method);
> +	if (rc)
> +		debug("HACE Scatter-Gather failure\n");
> +
> +	free(ctx);
> +
> +	return rc;
> +}
> +#endif
> +
> +static int aspeed_hace_probe(struct udevice *dev)
> +{
> +	struct aspeed_hace *hace = dev_get_priv(dev);
> +	int ret;
> +
> +	ret = clk_get_by_index(dev, 0, &hace->clk);
> +	if (ret < 0) {
> +		debug("Can't get clock for %s: %d\n", dev->name, ret);
> +		return ret;
> +	}
> +
> +	ret = clk_enable(&hace->clk);
> +	if (ret) {
> +		debug("Failed to enable fsi clock (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	/* As the crypto code does not pass us any driver state */
> +	base = devfdt_get_addr(dev);
> +
> +	return ret;
> +}
> +
> +static int aspeed_hace_remove(struct udevice *dev)
> +{
> +	struct aspeed_hace *hace = dev_get_priv(dev);
> +
> +	clk_disable(&hace->clk);
> +
> +	return 0;
> +}
> +
> +static const struct udevice_id aspeed_hace_ids[] = {
> +	{ .compatible = "aspeed,ast2600-hace" },
> +	{ }
> +};
> +
> +U_BOOT_DRIVER(aspeed_hace) = {
> +	.name		= "aspeed_hace",
> +	.id		= UCLASS_MISC,
> +	.of_match	= aspeed_hace_ids,
> +	.probe		= aspeed_hace_probe,
> +	.remove 	= aspeed_hace_remove,
> +	.priv_auto_alloc_size = sizeof(struct aspeed_hace),
> +	.flags  = DM_FLAG_PRE_RELOC,
> +};
> 

I've tested your patchset with Cedric's Aspeed-6.0 but looks
like the probe function is never called. Reading through the code
a bit more, looks like you need to explicitly probe this device
somewhere in board_init_r (that is, after sdram was initialized),
since functions like dm_scan_fdt() and dm_extended_scan_fdt() will
only scan subnodes of the top level, and the clocks node.

This is what I get (with some added printfs of mine):

qemu-system-arm: warning: Aspeed iBT has no chardev backend
qemu-system-arm: warning: nic ftgmac100.0 has no peer
qemu-system-arm: warning: nic ftgmac100.1 has no peer
qemu-system-arm: warning: nic ftgmac100.2 has no peer
qemu-system-arm: warning: nic ftgmac100.3 has no peer
aspeed_timer_ctrl_pulse_enable: Timer does not support pulse mode
aspeed_timer_ctrl_pulse_enable: Timer does not support pulse mode
aspeed_timer_ctrl_pulse_enable: Timer does not support pulse mode
aspeed_timer_ctrl_pulse_enable: Timer does not support pulse mode
aspeed_ast2600_scu_write: SCU is locked!
aspeed_ast2600_scu_write: SCU is locked!
aspeed_smc_write: not implemented: 0x18

U-Boot SPL 2019.04 (Apr 13 2021 - 17:57:20 +0000)
aspeed_soc.io: unimplemented device read  (size 4, offset 0x0f500c)
aspeed_soc.io: unimplemented device write (size 4, offset 0x0f500c, value 0x00000000)
Trying to boot from MMC1
SD: CMD8 in a wrong state
## Checking hash(es) for Image uboot ... sha512,rsa4096:autogenerated-uboot-4096-key
digest_object: ASPEED_HACE_STS='0xe59ff03c'

digest_object: SCU080h='0xf7ff7f8a'

digest_object: writing '0x90200104' to ASPEED_HACE_HASH_SRC

digest_object: writing '0x902ffa50' to ASPEED_HACE_HASH_DIGEST_BUFF

digest_object: writing '0x0005ccd4' to ASPEED_HACE_HASH_DATA_LEN

digest_object: writing '0x00040068' to ASPEED_HACE_HASH_CMD
HACE Scatter-Gather failure
rsa_verify: Error in checksum calculation
- Failed to verify required signature 'key-autogenerated-uboot-4096-key'
  error!
Unable to verify required signature for '' hash node in 'uboot' image node
mmc_load_image_raw_sector: mmc block read error
Trying to boot from UART
CCQEMU: Terminated

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
