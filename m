Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C91B8672E83
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 02:55:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ny5LD5JQvz3fCb
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 12:55:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=k0PPWVKh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=k0PPWVKh;
	dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ny5KW6pwbz3bXQ;
	Thu, 19 Jan 2023 12:54:37 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id kt14so1982382ejc.3;
        Wed, 18 Jan 2023 17:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e5LSz9bvo3BZ3yzR2LZdddWGu50g7D481ggXK11d8M0=;
        b=k0PPWVKhCWmYp+/4o8oguC5R37MopUd//IyT1BMNYlmFuqOfC+PXEqR4ju6ET6EHPj
         UMETuVxZJ7cjl47cvVjMIcJzgFi7PdATI6UypFahVC/NzuqT8pMg4hwu2Y+jNHdr51f7
         rYTf0pCFhgx8Eids2p5agC7kJgzMXgEFPTZb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5LSz9bvo3BZ3yzR2LZdddWGu50g7D481ggXK11d8M0=;
        b=j1d+SBDwAyl1iUw4EIQXq2eIqC3qmKTXgD7oD0LqSk990LVrlMydFH9YdVFZlcJ92d
         uh145t4vcevfLXxbm0Uus3gN5/qVdNCrDORICBo5m5dDecrGN6cVgDKzHpunFKrGOrud
         m8wlLYWEK2zW5EAzERuOcwEpKA+/D76d+WJ17lVnzTEdjGs7gou6NFUZFZeCJPB7ggcF
         8sqRXc6gI4mVqa9cqbWxzlOSFcm5+IqQcDnY6s171xXbOxGV5jTOL6tG3XwZoom6Ck6d
         nAWRAVSzNKAb7hRbsFQxl0qI2uT/c4/iQAzad1hGO2MG2TuU8Ew8+TKIe0vy79Rbg2dE
         enWw==
X-Gm-Message-State: AFqh2krZTBEOv64Yze52WAsA23OmsAQ/Vg6KECFJHGzg7pgNL1NynqZD
	tvenSMRPrj4dTHopyqyrUIguBARL6mt3pi3MIPc=
X-Google-Smtp-Source: AMrXdXu+ox64PdWPYUzYVyZ0V9eEMhNYJBdrtYqnVqBurU84ellrmAEXv1jl+qoNNn06JcsWkIRO245bljA8fWYGORE=
X-Received: by 2002:a17:906:3b85:b0:7c1:4665:9684 with SMTP id
 u5-20020a1709063b8500b007c146659684mr1204502ejf.23.1674093274564; Wed, 18 Jan
 2023 17:54:34 -0800 (PST)
MIME-Version: 1.0
References: <20220818101839.28860-1-billy_tsai@aspeedtech.com>
 <CACRpkdYpp_1JJQmuX27pECxN0cjzciCuETLPTrSYKqpX0FPABQ@mail.gmail.com> <e501d2fb-aaa0-470d-a8d5-5f8e97898df7@beta.fastmail.com>
In-Reply-To: <e501d2fb-aaa0-470d-a8d5-5f8e97898df7@beta.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Jan 2023 01:54:22 +0000
Message-ID: <CACPK8XfQ=uarsOgJ7LaXqLyGG2vSF-47RkAEV=T2gruapx-yfg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Force to disable the function's signal
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Billy Tsai <billy_tsai@aspeedtech.com>, linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 26 Aug 2022 at 22:48, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Sat, 27 Aug 2022, at 07:26, Linus Walleij wrote:
> > On Thu, Aug 18, 2022 at 12:18 PM Billy Tsai <billy_tsai@aspeedtech.com> wrote:
> >
> >> When the driver want to disable the signal of the function, it doesn't
> >> need to query the state of the mux function's signal on a pin. The
> >> condition below will miss the disable of the signal:

> > I can't see the verdict for this patch? Will there be a new
> > version, or are we in the middle of a discussion?
> > I'd really like Andrew's ACK on the result before merging.
>
> Apologies, it's been a bit of A Week :)
>
> Given the approach has been discussed with the IP designer and solves a bug I'm okay for it to be merged. If we run into issues it is easy enough to back it out.

As foreseen by Andrew, this caused a regression. On the Romulus
machine the device tree contains a gpio hog for GPIO S7. With the
patch applied:

[    0.384796] aspeed-g5-pinctrl 1e6e2080.pinctrl: request pin 151
(AA20) for 1e780000.gpio:943
[    0.385009] Muxing pin 151 for GPIO
[    0.385081] Disabling signal VPOB9 for VPO
[    0.402291] aspeed-g5-pinctrl 1e6e2080.pinctrl: Failed to acquire
regmap for IP block 1
[    0.402521] aspeed-g5-pinctrl 1e6e2080.pinctrl: request() failed for pin 151

The code path is aspeed-gpio -> pinmux-g5 -> regmap -> clk, and the
of_clock code returns an error as it doesn't have a valid struct
clk_hw pointer. The regmap call happens because pinmux wants to check
the GFX node (IP block 1) to query bits there.

For reference, reverting the patch gives us this trace:

[    0.393160] Muxing pin 151 for GPIO
[    0.393267] Disabling signal VPOB9 for VPO
[    0.393383] Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
[    0.393552] Disabling signal VPOB9 for VPOOFF1
[    0.393681] Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
[    0.393835] Disabling signal VPOB9 for VPOOFF2
[    0.393965] Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
[    0.394097] Enabling signal GPIOS7 for GPIOS7
[    0.394217] Muxed pin 151 as GPIOS7
[    0.394411] gpio-943 (seq_cont): hogged as output/low

This can be reproduced in qemu without userspace:

qemu-system-arm -M romulus-bmc -nographic -kernel arch/arm/boot/zImage
-dtb arch/arm/boot/dts/aspeed-bmc-opp-romulus.dtb -no-reboot

Billy, do you have any suggestions?

Cheers,

Joel
