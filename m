Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF45EB9A8
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 23:24:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4740HN4J3CzF5Gc
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 09:24:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=p.zabel@pengutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=pengutronix.de
X-Greylist: delayed 1105 seconds by postgrey-1.36 at bilbo;
 Wed, 30 Oct 2019 02:33:42 AEDT
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472bGG5XFlzF36w
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 02:33:41 +1100 (AEDT)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1iPTDA-0008Nf-Fe; Tue, 29 Oct 2019 16:15:08 +0100
Message-ID: <60b17249f57313f1dd6acdf43dbcca5640641ca1.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/3] dt-bindings: reset: Add binding constants for
 NPCM7xx reset controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tomer Maimon <tmaimon77@gmail.com>, robh+dt@kernel.org, 
 mark.rutland@arm.com, yuenn@google.com, venture@google.com, 
 benjaminfair@google.com, avifishman70@gmail.com, joel@jms.id.au
Date: Tue, 29 Oct 2019 16:15:08 +0100
In-Reply-To: <20191028155403.134126-3-tmaimon77@gmail.com>
References: <20191028155403.134126-1-tmaimon77@gmail.com>
 <20191028155403.134126-3-tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
X-Mailman-Approved-At: Fri, 01 Nov 2019 09:21:56 +1100
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2019-10-28 at 17:54 +0200, Tomer Maimon wrote:
> Add device tree binding constants for Nuvoton BMC NPCM7xx
> reset controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../dt-bindings/reset/nuvoton,npcm7xx-reset.h | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 include/dt-bindings/reset/nuvoton,npcm7xx-reset.h
> 
> diff --git a/include/dt-bindings/reset/nuvoton,npcm7xx-reset.h b/include/dt-bindings/reset/nuvoton,npcm7xx-reset.h
> new file mode 100644
> index 000000000000..7b7e870eac35
> --- /dev/null
> +++ b/include/dt-bindings/reset/nuvoton,npcm7xx-reset.h
> @@ -0,0 +1,82 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +// Copyright (c) 2019 Nuvoton Technology corporation.
> +
> +#ifndef _DT_BINDINGS_NPCM7XX_RESET_H
> +#define _DT_BINDINGS_NPCM7XX_RESET_H
> +
> +#define NPCM7XX_RESET_FIU3		1
> +#define NPCM7XX_RESET_UDC1		5
> +#define NPCM7XX_RESET_EMC1		6
> +#define NPCM7XX_RESET_UART_2_3		7
> +#define NPCM7XX_RESET_UDC2		8
> +#define NPCM7XX_RESET_PECI		9
> +#define NPCM7XX_RESET_AES		10
> +#define NPCM7XX_RESET_UART_0_1		11
> +#define NPCM7XX_RESET_MC		12
> +#define NPCM7XX_RESET_SMB2		13
> +#define NPCM7XX_RESET_SMB3		14
> +#define NPCM7XX_RESET_SMB4		15
> +#define NPCM7XX_RESET_SMB5		16
> +#define NPCM7XX_RESET_PWM_M0		18
> +#define NPCM7XX_RESET_TIMER_0_4		19
> +#define NPCM7XX_RESET_TIMER_5_9		20
> +#define NPCM7XX_RESET_EMC2		21
> +#define NPCM7XX_RESET_UDC4		22
> +#define NPCM7XX_RESET_UDC5		23
> +#define NPCM7XX_RESET_UDC6		24
> +#define NPCM7XX_RESET_UDC3		25
> +#define NPCM7XX_RESET_ADC		27
> +#define NPCM7XX_RESET_SMB6		28
> +#define NPCM7XX_RESET_SMB7		29
> +#define NPCM7XX_RESET_SMB0		30
> +#define NPCM7XX_RESET_SMB1		31
> +#define NPCM7XX_RESET_MFT0		32
> +#define NPCM7XX_RESET_MFT1		33
> +#define NPCM7XX_RESET_MFT2		34
> +#define NPCM7XX_RESET_MFT3		35
> +#define NPCM7XX_RESET_MFT4		36
> +#define NPCM7XX_RESET_MFT5		37
> +#define NPCM7XX_RESET_MFT6		38
> +#define NPCM7XX_RESET_MFT7		39
> +#define NPCM7XX_RESET_MMC		40
> +#define NPCM7XX_RESET_SDHC		41
> +#define NPCM7XX_RESET_GFX_SYS		42
> +#define NPCM7XX_RESET_AHB_PCIBRG	43
> +#define NPCM7XX_RESET_VDMA		44
> +#define NPCM7XX_RESET_ECE		45
> +#define NPCM7XX_RESET_VCD		46
> +#define NPCM7XX_RESET_OTP		48
> +#define NPCM7XX_RESET_SIOX1		50
> +#define NPCM7XX_RESET_SIOX2		51
> +#define NPCM7XX_RESET_3DES		53
> +#define NPCM7XX_RESET_PSPI1		54
> +#define NPCM7XX_RESET_PSPI2		55
> +#define NPCM7XX_RESET_GMAC2		57
> +#define NPCM7XX_RESET_USB_HOST		58
> +#define NPCM7XX_RESET_GMAC1		60
> +#define NPCM7XX_RESET_CP		63

What's in the gap between IPSRST2 and IPSRST3? Are you sure you don't
want the following IPSRST3 resets to just start at 64? That could be
achieved with a custom of_xlate callback in the driver.

> +#define NPCM7XX_RESET_PWM_M1		160
> +#define NPCM7XX_RESET_SMB12		161
> +#define NPCM7XX_RESET_SPIX		162
> +#define NPCM7XX_RESET_SMB13		163
> +#define NPCM7XX_RESET_UDC0		164
> +#define NPCM7XX_RESET_UDC7		165
> +#define NPCM7XX_RESET_UDC8		166
> +#define NPCM7XX_RESET_UDC9		167
> +#define NPCM7XX_RESET_PCI_MAILBOX	169
> +#define NPCM7XX_RESET_SMB14		172
> +#define NPCM7XX_RESET_SHA		173
> +#define NPCM7XX_RESET_SEC_ECC		174
> +#define NPCM7XX_RESET_PCIE_RC		175
> +#define NPCM7XX_RESET_TIMER_10_14	176
> +#define NPCM7XX_RESET_RNG		177
> +#define NPCM7XX_RESET_SMB15		178
> +#define NPCM7XX_RESET_SMB8		179
> +#define NPCM7XX_RESET_SMB9		180
> +#define NPCM7XX_RESET_SMB10		181
> +#define NPCM7XX_RESET_SMB11		182
> +#define NPCM7XX_RESET_ESPI		183
> +#define NPCM7XX_RESET_USB_PHY_1		184
> +#define NPCM7XX_RESET_USB_PHY_2		185
> +
> +#endif

regards
Philipp

