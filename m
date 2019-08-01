Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DD27E02D
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 18:28:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zwhm3yGfzDqjn
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 02:28:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zwgz4xVbzDqfy
 for <openbmc@lists.ozlabs.org>; Fri,  2 Aug 2019 02:27:56 +1000 (AEST)
Received: from localhost (unknown [IPv6:2603:3004:624:eb00::2d06])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id CB304153EF902;
 Thu,  1 Aug 2019 09:27:48 -0700 (PDT)
Date: Thu, 01 Aug 2019 12:27:45 -0400 (EDT)
Message-Id: <20190801.122745.9301893283319822.davem@davemloft.net>
To: avifishman70@gmail.com
Subject: Re: [PATCH v1 2/2] net: npcm: add NPCM7xx EMC 10/100 Ethernet driver
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190801072611.27935-3-avifishman70@gmail.com>
References: <20190801072611.27935-1-avifishman70@gmail.com>
 <20190801072611.27935-3-avifishman70@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 01 Aug 2019 09:27:49 -0700 (PDT)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, benjaminfair@google.com,
 venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 tali.perry1@gmail.com, robh+dt@kernel.org, gregkh@linuxfoundation.org,
 tglx@linutronix.de, netdev@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Avi Fishman <avifishman70@gmail.com>
Date: Thu,  1 Aug 2019 10:26:11 +0300

> +#Eternet 10/100 EMC

"Ethernet"

> +#ifdef CONFIG_NPCM7XX_EMC_ETH_DEBUG
> +#define DEBUG
> +#endif

Please don't control the DEBUG define in this way.

> +#if defined CONFIG_NPCM7XX_EMC_ETH_DEBUG || defined CONFIG_DEBUG_FS
> +#define REG_PRINT(reg_name) {t = scnprintf(next, size, "%-10s = %08X\n", \
> +	#reg_name, readl(ether->reg + (reg_name))); size -= t;	next += t; }
> +#define DUMP_PRINT(f, x...) {t = scnprintf(next, size, f, ## x); size -= t; \
> +	next += t; }

Really, get rid of this custom debugging infrastructure and just use
generic facilities the kernel has for this, as designed.

> +static int npcm7xx_info_dump(char *buf, int count, struct net_device *netdev)
> +{
> +	struct npcm7xx_ether *ether = netdev_priv(netdev);
> +	struct npcm7xx_txbd *txbd;
> +	struct npcm7xx_rxbd *rxbd;
> +	unsigned long flags;
> +	unsigned int i, cur, txd_offset, rxd_offset;
> +	char *next = buf;
> +	unsigned int size = count;
> +	int t;
> +	int is_locked = spin_is_locked(&ether->lock);

Reverse christmas tree (longest to shortest) ordering for local variables
please.

Audit your entire submission for this problem.
