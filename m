Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4E635147B
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 13:30:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB1Fb1VhCz3bpB
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 22:30:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 480 seconds by postgrey-1.36 at boromir;
 Thu, 01 Apr 2021 22:30:17 AEDT
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB1FP0GKpz309v
 for <openbmc@lists.ozlabs.org>; Thu,  1 Apr 2021 22:30:15 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.27])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id ECBED968498F;
 Thu,  1 Apr 2021 13:22:11 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 1 Apr 2021
 13:22:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00387199aff-5f5a-44be-bade-77ef107a5389,
 CB1DFE2733DABF7F0B1A836A5F31017E824F9DC1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.210.153.104
Subject: Re: [ast2500] aspeed-smc fail with MX25L25635F
To: Shakeeb B K <shakeebbk@gmail.com>, <openbmc@lists.ozlabs.org>
References: <CABYu0WivHn9L4hbY0E3k+G_c6RH7bu6NuxwmeSNG90c_A_4Qig@mail.gmail.com>
 <CABYu0WhxPKePtGMGPojguaTJu21hMq4S=j6_5qRz5kPZC4yfFQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b17f2faf-4c50-4b68-bbad-6d91a7661c61@kaod.org>
Date: Thu, 1 Apr 2021 13:22:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CABYu0WhxPKePtGMGPojguaTJu21hMq4S=j6_5qRz5kPZC4yfFQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6147eff0-365a-4af0-8c3d-2c2c63773eea
X-Ovh-Tracer-Id: 12457800996588587930
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeigedgfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeehtdeviefhgfeugfevjeeiveefvedtvdehhfejleduveejieefhfeffeetfeeunecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepshhhrghkvggvsggskhesghhmrghilhdrtghomh
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

Hi,

On 4/1/21 12:17 PM, Shakeeb B K wrote:
> Hi All,
> 
> We figured that the issue here is with part MX25L25635F not supporting 4B dual mode opcode - 0x3c. It instead uses 0x3b.

The 4B issue is a long story ... Is is a MX25L25635F or a MX25L25635E ? 

Could you give use more info on the board ? the full dmesg would be helpful.

I fail to reproduce on the systems I have. 

> aspeed-smc enables dual mode by default with SNOR_HWCAPS_READ_1_1_2 in the setup, 
> and hence disabling dual mode from  flash_info table in spi-nor is not helpful.
> 
> I see that there is no way to override opcode in spi-nor framework either.
> There are a couple of queries here -
> 1. Why is SNOR_HWCAPS_READ_1_1_2 enabled by default in aspeed-smc, while we could have done with the flash_info table?
> 2. Can there be an extension in spi-nor to support read opcode override?
> 
> Any thoughts on what would be the preferred fix? 

I think you should add a mx25l25635_post_bfpt_fixups once you have found 
the correct criteria.
 

C. 

> Thanks,
> Shakeeb
> 
> On Thu, Mar 18, 2021 at 9:32 PM Shakeeb B K <shakeebbk@gmail.com <mailto:shakeebbk@gmail.com>> wrote:
> 
>     Hi All,
> 
>     We are working with Macronix MX25L25635F, and are not able to get spi nor access working from linux(develop-5.10).
>     u-boot flash drivers work fine - able to verify the flash contents.
>     But linux aspeed-smc seems to be having issues, with read calibration failing all the time
>     [    1.746960] aspeed-smc 1e620000.spi: Using 50 MHz SPI frequency
>     [    1.753028] aspeed-smc 1e620000.spi: control register: 000b0641
>     [    1.758982] aspeed-smc 1e620000.spi: control register changed to: 00000600
>     [    1.765947] aspeed-smc 1e620000.spi: default control register: 00000600
>     [    1.772810] aspeed-smc 1e620000.spi: mx25l25635e (32768 Kbytes)
>     [    1.778773] aspeed-smc 1e620000.spi: CE0 window [ 0x20000000 - 0x22000000 ] 32MB
>     [    1.786286] aspeed-smc 1e620000.spi: CE1 window [ 0x22000000 - 0x2a000000 ] 128MB
>     [    1.793873] aspeed-smc 1e620000.spi: write control register: 00120602
>     [    1.800341] aspeed-smc 1e620000.spi: read control register: 203c0641
>     [    1.806791] aspeed-smc 1e620000.spi: AHB frequency: 198 MHz
>     [    1.823440] aspeed-smc 1e620000.spi: Trying HCLK/5 [203c0d41] ...
>     [    1.831524] aspeed-smc 1e620000.spi:   * [00080000] 0 HCLK delay, 4ns DI delay : FAIL
>     [    1.841333] aspeed-smc 1e620000.spi:   * [00000000] 0 HCLK delay, 0ns DI delay : FAIL
>     [    1.851152] aspeed-smc 1e620000.spi:   * [00090000] 1 HCLK delay, 4ns DI delay : FAIL
>     [    1.860969] aspeed-smc 1e620000.spi:   * [00010000] 1 HCLK delay, 0ns DI delay : FAIL
>     [    1.870746] aspeed-smc 1e620000.spi:   * [000a0000] 2 HCLK delay, 4ns DI delay : FAIL
>     [    1.880579] aspeed-smc 1e620000.spi:   * [00020000] 2 HCLK delay, 0ns DI delay : FAIL
>     [    1.890435] aspeed-smc 1e620000.spi:   * [000b0000] 3 HCLK delay, 4ns DI delay : FAIL
>     [    1.900301] aspeed-smc 1e620000.spi:   * [00030000] 3 HCLK delay, 0ns DI delay : FAIL
>     [    1.910182] aspeed-smc 1e620000.spi:   * [000c0000] 4 HCLK delay, 4ns DI delay : FAIL
>     [    1.920060] aspeed-smc 1e620000.spi:   * [00040000] 4 HCLK delay, 0ns DI delay : FAIL
>     [    1.929964] aspeed-smc 1e620000.spi:   * [000d0000] 5 HCLK delay, 4ns DI delay : FAIL
>     [    1.939869] aspeed-smc 1e620000.spi:   * [00050000] 5 HCLK delay, 0ns DI delay : FAIL
>     [    1.947796] aspeed-smc 1e620000.spi: Trying HCLK/4 [203c0641] ...
>     [    1.955529] aspeed-smc 1e620000.spi:   * [00008000] 0 HCLK delay, 4ns DI delay : FAIL
>     [    1.964998] aspeed-smc 1e620000.spi:   * [00000000] 0 HCLK delay, 0ns DI delay : FAIL
>     [    1.974483] aspeed-smc 1e620000.spi:   * [00009000] 1 HCLK delay, 4ns DI delay : FAIL
>     [    1.983967] aspeed-smc 1e620000.spi:   * [00001000] 1 HCLK delay, 0ns DI delay : FAIL
>     [    1.993475] aspeed-smc 1e620000.spi:   * [0000a000] 2 HCLK delay, 4ns DI delay : FAIL
>     [    2.002986] aspeed-smc 1e620000.spi:   * [00002000] 2 HCLK delay, 0ns DI delay : FAIL
>     [    2.012508] aspeed-smc 1e620000.spi:   * [0000b000] 3 HCLK delay, 4ns DI delay : FAIL
>     [    2.022035] aspeed-smc 1e620000.spi:   * [00003000] 3 HCLK delay, 0ns DI delay : FAIL
>     [    2.031581] aspeed-smc 1e620000.spi:   * [0000c000] 4 HCLK delay, 4ns DI delay : FAIL
>     [    2.041131] aspeed-smc 1e620000.spi:   * [00004000] 4 HCLK delay, 0ns DI delay : FAIL
>     [    2.050639] aspeed-smc 1e620000.spi:   * [0000d000] 5 HCLK delay, 4ns DI delay : FAIL
>     [    2.060203] aspeed-smc 1e620000.spi:   * [00005000] 5 HCLK delay, 0ns DI delay : FAIL
>     [    2.068116] aspeed-smc 1e620000.spi: No good frequency, using dumb slow
>     [    2.077460] 5 fixed-partitions partitions found on MTD device bmc
>     [    2.083721] Creating 5 MTD partitions on "bmc":
>     [    2.088289] 0x000000000000-0x000000060000 : "u-boot"
>     [    2.096067] 0x000000060000-0x000000080000 : "u-boot-env"
>     [    2.104054] 0x000000080000-0x0000004c0000 : "kernel"
>     [    2.111699] 0x0000004c0000-0x000001c00000 : "rofs"
>     [    2.119091] 0x000001c00000-0x000002000000 : "rwfs"
>     ...
>     rofs = mtd4 squashfs rwfs = mtd5 jffs2
>     mount: mounting /dev/mtdblock4 on run/initramfs/ro failed: Invalid argument
>     [    3.654132] jffs2: Node totlen on flash (0xffffffff) != totlen from node ref (0x0000000c)
>     [    3.685843] jffs2: Node totlen on flash (0xffffffff) != totlen from node ref (0x00000044)
>     [    3.694229] overlayfs: upper fs does not support tmpfile.
>     [    3.699946] jffs2: Node totlen on flash (0xffffffff) != totlen from node ref (0x0000002c)
>     [    3.708309] jffs2: Node totlen on flash (0xffffffff) != totlen from node ref (0x00000044)
>     [    3.716672] overlayfs: upper fs does not support RENAME_WHITEOUT.
>     [    3.722885] overlayfs: upper fs does not support xattr, falling back to index=off and metacopy=off.
>     chroot: can't execute '/bin/sh': No such file or directory
> 
>     Unable to confirm /sbin/init is an executable non-empty file
>     in merged file system mounted at /root.
> 
>     Found a related discussion on https://lists.ozlabs.org/pipermail/openbmc/2019-April/015925.html <https://lists.ozlabs.org/pipermail/openbmc/2019-April/015925.html>, 
>     but the workaround mentioned there - to drop read calibration with /optimize_read=false /didn't help.
>     FYI - Able to boot the same image from tftpboot and qemu.
> 
>     Has anyone come across similar issue or any suggestions to try out?
> 
>     Thanks,
>     Shakeeb
> 

