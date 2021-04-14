Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5546E35FCA9
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 22:29:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLDb82B7Fz3bTP
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 06:29:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h+K8t2TD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h+K8t2TD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLDZs3nQgz2y8G
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 06:28:52 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13EK5LwA103256; Wed, 14 Apr 2021 16:28:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=gZQmrCx3DsdllqSBFj/2TAUvhx5/hWsWfIOev3ya910=;
 b=h+K8t2TDoQUdipXJ9Cc3fTuFWhF5n+e7FdlSLde24qcopAKucBsTM/vVBOkcNjPe9aPH
 UvdfiNd4Xh5J99sc6O5CCPw8Vb2Rg9LOaGINQMjYUbusaJFtUiSM+1U1KIJhW4zsmfsF
 5dy7Cb302lmS7GfUhJSt3EBi4PytPq0REikudzV8xX63Ibc/pJZ60NIJ5Q6AwYkZ77cY
 fPLxqwyzXT4ucdFTwQAX19mVk8A5oqM2JtPJoY2TncOWrziDNw2PciQr2NRcx/RK5EVS
 DeL9thruZPvFd9NTEgwVZSD6ntmkH2GVDEJrheAUyQDDRg9pT8R0i8c6O+bnTRu7U96n xQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37x46x51h6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 16:28:38 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13EKSKLL030788;
 Wed, 14 Apr 2021 20:28:38 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 37u3na40k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 20:28:38 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13EKSbnd35455322
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 20:28:37 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B916FAE060;
 Wed, 14 Apr 2021 20:28:37 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE32AAE05F;
 Wed, 14 Apr 2021 20:28:36 +0000 (GMT)
Received: from [9.85.205.211] (unknown [9.85.205.211])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 14 Apr 2021 20:28:36 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 10/11] crypto: Add driver
 for Aspeed HACE
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
 <20210413080755.73572-11-joel@jms.id.au>
 <cacf13c1-91b2-ad51-606e-bb208d13ec36@linux.vnet.ibm.com>
Message-ID: <9779de4a-6985-8b94-9fb6-55c74a7a722f@linux.vnet.ibm.com>
Date: Wed, 14 Apr 2021 17:28:35 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <cacf13c1-91b2-ad51-606e-bb208d13ec36@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T5iOjeddHghq-Ii6_QhlmxMkDmvHJaN7
X-Proofpoint-ORIG-GUID: T5iOjeddHghq-Ii6_QhlmxMkDmvHJaN7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-14_12:2021-04-14,
 2021-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140128
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



On 4/13/2021 5:41 PM, Klaus Heinrich Kiwi wrote:
> I've tested your patchset with Cedric's Aspeed-6.0 but looks
> like the probe function is never called. Reading through the code
> a bit more, looks like you need to explicitly probe this device
> somewhere in board_init_r (that is, after sdram was initialized),
> since functions like dm_scan_fdt() and dm_extended_scan_fdt() will
> only scan subnodes of the top level, and the clocks node.
> 
> This is what I get (with some added printfs of mine):

I've played around a bit more, and got it to work on Qemu with the following changes:

  * Added a board-specific spl_board_init() initializing the HACE driver at
    the SPL's board_init_r() timeframe. Enabled that on the defconfig file.
  * Because the driver model is using some pre-sdram malloc pool space,
    the changes above were causing the probing of the sdram itself to fail.
    Corrected by increasing the pre-sdram malloc pool to 0x1000.

 From 4ddc9fe2727a54f2d8c088d1c7046f4a3ab56314 Mon Sep 17 00:00:00 2001
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Date: Wed, 14 Apr 2021 16:29:15 -0300
Subject: [PATCH] fixup: Enable HACE probing on SPL, expand malloc pool

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
---
  arch/arm/mach-aspeed/ast2600/spl.c         | 15 +++++++++++++++
  configs/ast2600_openbmc_spl_emmc_defconfig |  3 ++-
  2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/ast2600/spl.c b/arch/arm/mach-aspeed/ast2600/spl.c
index 527e14f8e3..2b1e8477eb 100644
--- a/arch/arm/mach-aspeed/ast2600/spl.c
+++ b/arch/arm/mach-aspeed/ast2600/spl.c
@@ -86,3 +86,18 @@ struct image_header *spl_get_load_buffer(ssize_t offset, size_t size)
  {
  	return (struct image_header *)(CONFIG_SYS_LOAD_ADDR);
  }
+
+#if CONFIG_IS_ENABLED(BOARD_INIT)
+void spl_board_init(void)
+{
+#ifdef CONFIG_ASPEED_HACE
+	struct udevice *dev;
+
+	if (uclass_get_device_by_driver(UCLASS_MISC, DM_GET_DRIVER(aspeed_hace),
+									&dev))
+		debug("Warning: HACE initialization failure\n");
+#endif
+
+	return;
+}
+#endif /* CONFIG_IS_ENABLED(BOARD_INIT) */
\ No newline at end of file
diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index 05069084cb..e856df2398 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -24,7 +24,7 @@ CONFIG_ASPEED_KERNEL_FIT_DRAM_BASE=0x83000000
  CONFIG_TARGET_EVB_AST2600A1=y
  CONFIG_SPL_LIBCOMMON_SUPPORT=y
  CONFIG_SPL_LIBGENERIC_SUPPORT=y
-CONFIG_SYS_MALLOC_F_LEN=0x800
+CONFIG_SYS_MALLOC_F_LEN=0x1000
  CONFIG_SPL_MMC_SUPPORT=y
  CONFIG_SPL_SERIAL_SUPPORT=y
  CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
@@ -48,6 +48,7 @@ CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
  CONFIG_DISPLAY_BOARDINFO_LATE=y
  CONFIG_ARCH_EARLY_INIT_R=y
  CONFIG_BOARD_EARLY_INIT_F=y
+CONFIG_SPL_BOARD_INIT=y
  # CONFIG_SPL_LEGACY_IMAGE_SUPPORT is not set
  CONFIG_SPL_SYS_MALLOC_SIMPLE=y
  CONFIG_SPL_STACK_R=y
-- 
2.25.1


However, when I tried to test it on a Rainier, it failed:
U-Boot SPL 2019.04 (Apr 14 2021 - 19:31:59 +0000)
already initialized, Trying to boot from MMC1
## Checking hash(es) for Image uboot ... sha512,rsa4096:autogenerated-uboot-4096-key- Failed to verify required signature 'key-autogenera'
  error!
Unable to verify required signature for '' hash node in 'uboot' image node
mmc_load_image_raw_sector: mmc block read error
Trying to boot from UART
CCCCC�P

(and yes, I had since disabled my debugging printf's). I wonder if the HASH_ISR
may need to be explicitly cleared, although I'd expect it to work for the first
command at least.

Another interesting thing is that the SPL tries to boot from UART, but neither
my fitImages, Legacy images or even RAW images are working.. Not sure if we need
some special handling of those images before feeding them to the spl ymodem loader?

  -Klaus

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
