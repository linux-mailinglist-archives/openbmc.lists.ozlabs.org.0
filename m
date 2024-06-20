Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6149D90FDD3
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 09:33:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JlBglCtA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4XK44LKFz3cWR
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 17:33:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JlBglCtA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4XJX4WVZz30T1
	for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2024 17:32:43 +1000 (AEST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-633629c3471so5490227b3.1
        for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2024 00:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718868757; x=1719473557; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qnAIkWGQryIAQtTLmUZTYaNhdbVrLJLMPyGuu/muHE4=;
        b=JlBglCtADv44Ja3Hs8bVKZTzGJTTX4dQjPuSgS9H/lO4fTjgTNu5g98K03fnR77sTS
         6ZvU4g/yKxqR67o/+WbiCXzg+VrZhl5veAUrEjhCEQIjGN59L0K5+VD2Ukug8yej2Gut
         h7PxKuiiXE3zYCGUgXM7EnhgU7lq9uQ0XpSSlVWqxlWpeev218cJoOpA1LXkt7YWYqbx
         0GPRQIG/Rj2igpKMioyVqxmQIrmEnGqSsfzf4YC0296T5wm545IpWB7anlAtQny25ySV
         QZTSnpvoorMNla9Ia/qn/4ikFlLhr4G4SBKcJf+s6nOvmP8NMZKVpx5IEO/vKJZYrJLA
         OOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718868757; x=1719473557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnAIkWGQryIAQtTLmUZTYaNhdbVrLJLMPyGuu/muHE4=;
        b=v5spDslAXzUCgmRx+amX+etnM/zznuB5qZ44SyPwGxVxGKrZyEFBT4bCMrWsPjY5WW
         dSk18nzuXBbgkfKCYsMPLqHy8oRZ2Oe+w+fGFPF9dWwH3uR49Zv2UXEM8iDlbkJ3TOVA
         ye8YgbDMZWPpUc+qqcraDXLZTdU+hnYbbch1uPSqYuRyKOYIBBEsYiZ3Khf5YbefNec4
         +miwfFFXGwJOcKwyy7FiivowV68I0g7CqnBEcUxycyF2wjuYZMaAxKFOQ+TJBRoXIVd0
         hqcgFAjXRYTjzwrFVAvKLLsiUpvZXdAOtqBLOZL8W3FUjHI+WPUwj7N7P9OH3ErRvG0P
         qCvw==
X-Forwarded-Encrypted: i=1; AJvYcCXNjFQ571OWli1+UZBWS0Focw1H4MHzO/X9c1xxKEBe8NBGDes63pJ9pDLB3asMrH6M/s09ZXVFw71TNCW6lzmCGGyNtx9zGS8=
X-Gm-Message-State: AOJu0YwGBrOuMmvUPhXmm0uF0Lx/8Fj05KtR4yoq3CCl7LQz06w+CJk7
	R98Glj90Et2WqQvUY4+HlCPjgC1XkHDYLpz3LyMLzibr4wnVoH+nmI3SFQkRHj/ZBBYPPTuqDgu
	9H2+of1oxz3+FoUb1DPN32ScZIss=
X-Google-Smtp-Source: AGHT+IFMs27chWrPqAVjs1vjzs16P9LfbkLcD+9tzrx+qaAHwjt2BmEAahSMklBZ+1btLgaZ6nW+L/dXD2/WIeBy5t8=
X-Received: by 2002:a0d:e605:0:b0:618:8d31:a557 with SMTP id
 00721157ae682-63a8e1d915cmr46504547b3.14.1718868757233; Thu, 20 Jun 2024
 00:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240618185819.2155595-2-tmaimon77@gmail.com> <202406191439.3NcnExKM-lkp@intel.com>
In-Reply-To: <202406191439.3NcnExKM-lkp@intel.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 20 Jun 2024 10:32:26 +0300
Message-ID: <CAP6Zq1h2Sk6H2V-i+PAk_fCy9xdywcYw=w9wT_xcJ2WrqyWbAg@mail.gmail.com>
Subject: Re: [PATCH v25 1/3] dt-bindings: reset: npcm: add clock properties
To: kernel test robot <lkp@intel.com>
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
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, oe-kbuild-all@lists.linux.dev, openbmc@lists.ozlabs.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob and Krzysztof,

Could you please review this patch?

Thanks,

Tomer

On Wed, 19 Jun 2024 at 09:20, kernel test robot <lkp@intel.com> wrote:
>
> Hi Tomer,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on clk/clk-next]
> [also build test WARNING on linus/master pza/reset/next v6.10-rc4 next-20240618]
> [cannot apply to pza/imx-drm/next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Tomer-Maimon/dt-bindings-reset-npcm-add-clock-properties/20240619-093532
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> patch link:    https://lore.kernel.org/r/20240618185819.2155595-2-tmaimon77%40gmail.com
> patch subject: [PATCH v25 1/3] dt-bindings: reset: npcm: add clock properties
> config: arm64-randconfig-051-20240619 (https://download.01.org/0day-ci/archive/20240619/202406191439.3NcnExKM-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> dtschema version: 2024.6.dev1+g833054f
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406191439.3NcnExKM-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406191439.3NcnExKM-lkp@intel.com/
>
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi:63.7-177.5: Warning (simple_bus_reg): /ahb/apb: simple-bus unit address format error, expected "f0000000"
>    arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi:50.35-55.5: Warning (unique_unit_address_if_enabled): /ahb/reset-controller@f0801000: duplicate unit-address (also used in node /ahb/clock-controller@f0801000)
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /: memory@0: 'device_type' is a required property
>         from schema $id: http://devicetree.org/schemas/memory.yaml#
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: system-controller@f0800000: compatible: ['nuvoton,npcm845-gcr', 'syscon'] is too short
>         from schema $id: http://devicetree.org/schemas/soc/nuvoton/nuvoton,npcm-gcr.yaml#
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: interrupt-controller@dfff9000: 'ppi-partitions' does not match any of the regexes: '^v2m@[0-9a-f]+$', 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml#
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: ahb: apb:ranges: [[0, 0, 4026531840, 3145728], [4293918720, 0, 4293918720, 90112]] is not of type 'boolean'
>         from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> >> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: reset-controller@f0801000: '#clock-cells' is a required property
>         from schema $id: http://devicetree.org/schemas/reset/nuvoton,npcm750-reset.yaml#
> >> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: reset-controller@f0801000: 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/reset/nuvoton,npcm750-reset.yaml#
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: timer@8000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/timer/nuvoton,npcm7xx-timer.yaml#
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@801c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@801c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@901c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@901c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@a01c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@a01c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
