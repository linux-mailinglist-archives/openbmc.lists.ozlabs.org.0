Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0219472FFA9
	for <lists+openbmc@lfdr.de>; Wed, 14 Jun 2023 15:12:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nrRBhAta;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qh5SZ5knTz30fx
	for <lists+openbmc@lfdr.de>; Wed, 14 Jun 2023 23:12:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nrRBhAta;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh5Rx2Zl0z30Pm
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2023 23:12:12 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b1b084620dso9698391fa.0
        for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2023 06:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686748326; x=1689340326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2ofFz6j0w1h52wpwFHzKwpwQnJKOAaqIFRmzp53L4L8=;
        b=nrRBhAta/xwv1niX9VIZhYN63cL5NN9DYVwSE1FgTIlOBaFVwSts8NK9fC/ADtlMVf
         6U/is5TcDC2vvDEvPUfrOLg66fQ5esfPvVEUQuH1WGQ4CAhPy9+vB503OjbaORknSKQ3
         Kv7Bm3zIQGsAEcAK/mLoDiQjp26wbGAuSQ2hTpCZlADzwb452zKBa0V/vZe0iElHU/+d
         hbIIFFE190iU8xPWWDbW2fn2dAxLjYBZ2tDFMhKzy18WdWOCgP/S1hueuSRiq7bYKoBO
         bFCnBbqT4Bm6GAOVxUoVqsjH9cCMkmTi/b88bWlt6VUoJ06fLM8pOYvbwUBMbuR1v8F8
         ZEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686748326; x=1689340326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ofFz6j0w1h52wpwFHzKwpwQnJKOAaqIFRmzp53L4L8=;
        b=b05QtO1NCvynCo6ZjYI1qeehg5Q3ffLafUBtdo1Sj4DR1LuLZsjw2aa8X31EBey8zW
         4UZGD2CdqKCyep0auahj3/U8WvMn87x4ZMiGPGIi0qYGKsLXLg04zjWkBIMPQlg4isyq
         tFohM/kGp+0HTOR0SSUqODvjv7txEL1AJ/n7QG8xT1KDV4LvCzyy4PQE7eoxmBcYwQJ0
         evlhIIfLJZc9f6fvmAFmrkb6PsaW4NO7d9PA+8R2+FoTbncEUminwdY33An1j5+Ku16Y
         VypP29B+j6XC+EbEVScyyxD4GG91xemOTfdg6+2fv1gzLv6OdVXyBGKnE14Ew7RJ32ge
         WReA==
X-Gm-Message-State: AC+VfDzDf3OrXNEG7rhmHP8xnnZYh4LqoAK7RhEJlMb4RG9/sr0Y6x2p
	7LmVmhhnyak4vRIvPqwEhFrz1rlwhDdEDIQksg8=
X-Google-Smtp-Source: ACHHUZ7c+VGmZ+oRHR/ijyH1xqCTCaIUHofWncciBJXX8uB+xgDzPBRa0TtTYkeL6xthuNrMwiHEJfQRgmjQbtmSDVQ=
X-Received: by 2002:a2e:961a:0:b0:2b1:e807:f0f with SMTP id
 v26-20020a2e961a000000b002b1e8070f0fmr6346627ljh.28.1686748325287; Wed, 14
 Jun 2023 06:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230614130952.253349-1-tmaimon77@gmail.com>
In-Reply-To: <20230614130952.253349-1-tmaimon77@gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 14 Jun 2023 16:11:54 +0300
Message-ID: <CAP6Zq1gQV2wnFvEVmo3SZrgW6t77JmZjUgGMSqRZZjhGDy0kOA@mail.gmail.com>
Subject: Re: [PATCH v16 0/1] Introduce Nuvoton Arbel NPCM8XX BMC SoC
To: mturquette@baylibre.com, sboyd@kernel.org, avifishman70@gmail.com, 
	tali.perry1@gmail.com, joel@jms.id.au, venture@google.com, yuenn@google.com, 
	benjaminfair@google.com
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
Cc: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Sorry, please ignore this mail.

On Wed, 14 Jun 2023 at 16:10, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> This patchset adds clock support for the Nuvoton
> Arbel NPCM8XX Board Management controller (BMC) SoC family.
>
> This patchset cover letter is based from the initial support for NPCM8xx BMC to
> keep tracking the version history.
>
> all the other initial support patches had been applied to Linux kernel 6.0.
>
> This patchset was tested on the Arbel NPCM8XX evaluation board.
>
> Addressed comments from:
>
>  - Stephen Boyd: https://www.spinics.net/lists/kernel/msg4729384.html
>
> Changes since version 15:
>  - NPCM8XX clock driver
>         - Remove unused regs parameter from npcm8xx_pll_data structure.
>         - Using index and clk_hw parameters to set the clock parent in the clock structures.
>
> Changes since version 14:
>  - NPCM8XX clock driver
>         - Remove unnecessary register definitions.
>         - Remove the internal reference clock, instead use the external DT reference clock.
>         - rearrange the driver.
>         - using .names parameter in DT to define clock (refclk).
>
> Changes since version 13:
>  - NPCM8XX clock driver
>         - Remove unnecessary definitions and add module.h define
>         - Use in clk_parent_data struct.fw_name and .name.
>         - Add module_exit function.
>         - Add const to divider clock names.
>         - Add MODULE_DESCRIPTION and MODULE_LICENSE
>
> Changes since version 12:
>  - NPCM8XX clock driver
>         - Use clk_parent_data in mux and div clock structure.
>         - Add const to mux tables.
>         - Using devm_clk_hw_register_fixed_rate function.
>         - use only .name clk_parent_data instead .name and .fw_name.
>         - Modify mask values in mux clocks.
>
> Changes since version 11:
>  - NPCM8XX clock driver
>         - Modify Kconfig help.
>         - Modify loop variable to unsigned int.
>
> Changes since version 11:
>  - NPCM8XX clock driver
>         - Modify Kconfig help.
>         - Modify loop variable to unsigned int.
>
> Changes since version 10:
>  - NPCM8XX clock driver
>         - Fix const warning.
>
> Changes since version 9:
>  - NPCM8XX clock driver
>         - Move configuration place.
>         - Using clk_parent_data instead of parent_name
>         - using devm_ioremap instead of ioremap. deeply sorry, I know we had
>          a long discussion on what should the driver use, from other examples
>          (also in other clock drivers) I see the combination of
>          platform_get_resource and devm_ioremap are commonly used and it answer
>          the reset and clock needs.
>
> Changes since version 8:
>  - NPCM8XX clock driver
>         - Move configuration place.
>         - Add space before and aftre '{' '}'.
>         - Handle devm_of_clk_add_hw_provider function error.
>
> Changes since version 7:
>  - NPCM8XX clock driver
>         - The clock and reset registers using the same memory region,
>           due to it the clock driver should claim the ioremap directly
>           without checking the memory region.
>
> Changes since version 6:
>  - NPCM reset driver
>         - Modify warning message.
>  - dt-bindings: serial: 8250: Add npcm845 compatible string patch accepted, due
>    to it the patch removed from the patchset.
>
> Changes since version 5:
>  - NPCM8XX clock driver
>         - Remove refclk if devm_of_clk_add_hw_provider function failed.
>  - NPCM8XX clock source driver
>         - Remove NPCM8XX TIMER_OF_DECLARE support, using the same as NPCM7XX.
>
> Changes since version 4:
>  - NPCM8XX clock driver
>         - Use the same quote in the dt-binding file.
>
> Changes since version 3:
>  - NPCM8XX clock driver
>         - Rename NPCM8xx clock dt-binding header file.
>         - Remove unused structures.
>         - Improve Handling the clocks registration.
>  - NPCM reset driver
>         - Add ref phandle to dt-binding.
>
> Changes since version 2:
>  - Remove NPCM8xx WDT compatible patch.
>  - Remove NPCM8xx UART compatible patch.
>  - NPCM8XX clock driver
>         - Add debug new line.
>         - Add 25M fixed rate clock.
>         - Remove unused clocks and clock name from dt-binding.
>  - NPCM reset driver
>         - Revert to npcm7xx dt-binding.
>         - Skip dt binding quotes.
>         - Adding DTS backward compatibility.
>         - Remove NPCM8xx binding include file.
>         - Warp commit message.
> - NPCM8XX device tree:
>         - Remove unused clock nodes (used in the clock driver)
>         - Modify gcr and rst node names.
>
> Changes since version 1:
>  - NPCM8XX clock driver
>         - Modify dt-binding.
>         - Remove unsed definition and include.
>         - Include alphabetically.
>         - Use clock devm.
>  - NPCM reset driver
>         - Modify dt-binding.
>         - Modify syscon name.
>         - Add syscon support to NPCM7XX dts reset node.
>         - use data structure.
>  - NPCM8XX device tree:
>         - Modify evb compatible name.
>         - Add NPCM7xx compatible.
>         - Remove disable nodes from the EVB DTS.
>
> Tomer Maimon (1):
>   clk: npcm8xx: add clock controller
>
>  drivers/clk/Kconfig       |   8 +
>  drivers/clk/Makefile      |   1 +
>  drivers/clk/clk-npcm8xx.c | 566 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 575 insertions(+)
>  create mode 100644 drivers/clk/clk-npcm8xx.c
>
> --
> 2.33.0
>
