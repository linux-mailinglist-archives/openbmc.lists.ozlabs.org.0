Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E25832657DE
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 06:04:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnhw80WbQzDqg9
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 14:04:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=UusFb+aT; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bnhv25fLjzDqg9;
 Fri, 11 Sep 2020 14:03:26 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id ay8so8529647edb.8;
 Thu, 10 Sep 2020 21:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gXglIxAgElc5JjCRgYm+CHHvgWMa69XLOEv6ewz6NfI=;
 b=UusFb+aTghNK80Ck3+ShuwAxKTlzIJ+xIFwzjJjt+k4IY0onVTpSnDt7SHAVOEug4r
 xGP1V6xP16jg2oH88ptXy2jSP1R90aUfjH0RQPxRm5YqPzaTxYut4jiJmiW3vE7A4ERn
 6FxLSdVy0vg1bAC8H8yXlKiOIY51tRrmsIpAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gXglIxAgElc5JjCRgYm+CHHvgWMa69XLOEv6ewz6NfI=;
 b=qd5akc1cjE5L3Evj/i/cFbLi3Lb1mL2kVVYUCpx+GxQoWoBUxDfynDpdOWn/WTSOE2
 Iv+uazG3QxX4mJRa12JdkzF/+zTBdcrr7MlWXnEk7Mc2S328dENkLzgIH76CIDKSDiD0
 tmfzCthJt6rhpT1mSQ98yJi+ie6fcw1hNzuF8Ek3GWDonqYsAsA2stQKS4i8YZY+kDAm
 5lKyDn8XxU+HxvgNV/Hujci5CliUVJZBDqUG9d2vngss7i2Hixut7ETo+4NA6MSrcK5c
 qjB677Mk21hnvPjksl4W+BY7ckPBH5TshptAe2LhasIm5hPFuSgv/lGxroupt+LZMy8Y
 Kl0g==
X-Gm-Message-State: AOAM530xPLzG8xQpqBfB+N+N8BKuMcZ2HnCb0ihlSYxhdrDqNg01em/4
 rD7ICUks+kbaU6oiFkztude7eH+EE5lYtMRXgu8=
X-Google-Smtp-Source: ABdhPJzJKUM6X8Vqn2Bh8HF7DPndQmawbtKXMcUpYvj+R+0ipCkW4mPTs1IbtuqKuV2AY2IAR3Whe9cJEpT3LI60gk0=
X-Received: by 2002:a05:6402:18d:: with SMTP id
 r13mr15404edv.267.1599797003384; 
 Thu, 10 Sep 2020 21:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200911034631.8473-1-chiawei_wang@aspeedtech.com>
In-Reply-To: <20200911034631.8473-1-chiawei_wang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Sep 2020 04:03:11 +0000
Message-ID: <CACPK8XcYvUj3W-CPzXKugp3wx7rcLEJ_8f2-Bi6V7QHZpopBbA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Remove LPC register partitioning
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Corey Minyard <minyard@acm.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Cyril Bur <cyrilbur@gmail.com>, Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On Fri, 11 Sep 2020 at 03:46, Chia-Wei, Wang
<chiawei_wang@aspeedtech.com> wrote:
>
> The LPC controller has no concept of the BMC and the Host partitions.
> The incorrect partitioning can impose unnecessary range restrictions
> on register access through the syscon regmap interface.
>
> For instance, HICRB contains the I/O port address configuration
> of KCS channel 1/2. However, the KCS#1/#2 drivers cannot access
> HICRB as it is located at the other LPC partition.
>
> In addition, to be backward compatible, the newly added HW control
> bits could be added at any reserved bits over the LPC addressing space.
>
> Thereby, this patch series aims to remove the LPC partitioning for
> better driver development and maintenance.

I support this cleanup. The only consideration is to be careful with
breaking the driver/device-tree relationship. We either need to ensure
the drivers remain compatible with  both device trees.

Another solution is to get agreement from all parties that for the LPC
device the device tree is always the one shipped with the kernel, so
it is okay to make incompatible changes.

While we are doing a cleanup, Andrew suggested we remove the detailed
description of LPC out of the device tree. We would have the one LPC
node, and create a LPC driver that creates all of the sub devices
(snoop, FW cycles, kcs, bt, vuart). Andrew, can  you elaborate on this
plan?

Cheers,

Joel


>
> Chia-Wei, Wang (4):
>   ARM: dts: Remove LPC BMC and Host partitions
>   soc: aspeed: Fix LPC register offsets
>   ipmi: kcs: aspeed: Fix LPC register offsets
>   pinctrl: aspeed-g5: Fix LPC register offsets
>
>  arch/arm/boot/dts/aspeed-g4.dtsi           |  74 +++++------
>  arch/arm/boot/dts/aspeed-g5.dtsi           | 135 +++++++++------------
>  arch/arm/boot/dts/aspeed-g6.dtsi           | 135 +++++++++------------
>  drivers/char/ipmi/kcs_bmc_aspeed.c         |  13 +-
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c |   2 +-
>  drivers/soc/aspeed/aspeed-lpc-ctrl.c       |   6 +-
>  drivers/soc/aspeed/aspeed-lpc-snoop.c      |  11 +-
>  7 files changed, 162 insertions(+), 214 deletions(-)
>
> --
> 2.17.1
>
