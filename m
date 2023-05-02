Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 555C86F4A7E
	for <lists+openbmc@lfdr.de>; Tue,  2 May 2023 21:41:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9r6c1N4Vz3cKW
	for <lists+openbmc@lfdr.de>; Wed,  3 May 2023 05:41:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iGl2fDpG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iGl2fDpG;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9r5y4xYWz3bgr;
	Wed,  3 May 2023 05:40:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3AAE162847;
	Tue,  2 May 2023 19:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4488BC433AE;
	Tue,  2 May 2023 19:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683056435;
	bh=9Dokck6Jc4naZGVhGmqgJoJLIGEOHwC1dkDJ1O4Mipg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iGl2fDpG6u+V7nw9XiF//RgP2qeZBecdfPEueb6HbN4e9bmh+rMmyTGvoJLh7U0IN
	 LT34Sz26U9ehDgNU9xWS2cGEUZMofynDqCr3NMtbyMjGcM7Ig7XSHoWMlWBe61LHXK
	 foLe03MQ+bujtF/31rycC13DeFqREes6CUthTP2NucBb4VgBQHzmK8qPa10Q9tcJfT
	 kGl1UrAJYytqHUS+kOaWhu7l1nLj3tflKoPvaGU5xVR382p8EsxG5UXDV4YqhNrt0H
	 gKKH9JwAQNWbY4QwmuAxfFPQMrV5eeoP/Nm8Xjp3aXp2elQ+yUvR0d0n0PahunLwSd
	 cPLAVqB30txpQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2a8ba23a2abso42608611fa.2;
        Tue, 02 May 2023 12:40:35 -0700 (PDT)
X-Gm-Message-State: AC+VfDyMG84o3AiWBH/gKw+aasDYPHcOrZXW7JkYJDlO0LORI+uf3V7M
	9Xheu8goJE5sj8DD2hG1TY/5xHzVLYPyvfuwCg==
X-Google-Smtp-Source: ACHHUZ4oET00FnB+Fs3paO2KFWP6eBEztecawKM1A53Y541JaZi1w2Ra1iVebif6hgPcY0x6Ou0Xe91anOEl+A8jdBw=
X-Received: by 2002:a2e:8801:0:b0:2a8:b995:ffe5 with SMTP id
 x1-20020a2e8801000000b002a8b995ffe5mr4898960ljh.25.1683056432976; Tue, 02 May
 2023 12:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com> <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
In-Reply-To: <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 2 May 2023 14:40:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
Message-ID: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org, linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "linux-oxnas@groups.io" <linux-oxnas@groups.
 io>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 2, 2023 at 3:15=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Apr 25, 2023, at 17:57, Rob Herring wrote:
> > On Tue, Apr 25, 2023 at 2:28=E2=80=AFAM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> >
> >> Does your script also cater for .dts files not matching any pattern,
> >> but including a .dtsi file that does match a pattern?
> >
> > I assume I built everything after moving, but maybe not...
> >
> > That's all just "details". First, we need agreement on a) moving
> > things to subdirs and b) doing it 1-by-1 or all at once. So far we've
> > been stuck on a) for being 'too much churn'.
>
> Sorry for missing most of the discussion last week. The script sounds
> fine to me, the only reason I didn't want to do this in the past is that
> we had the plan to move platforms out of the kernel tree to an external
> repository and I wanted to do this platform at a time and also only move
> each one once. I don't think that is going to happen anytime soon now,
> so let's just do your script.
>
> Can you send me the script and/or a pull request of the resulting
> tree based on my soc/dt branch? Everything is merged upstream,
> and I think git-merge would handle the remaining merges with any
> other changes in mainline.

I've dusted off my script and made a branch[1] with the result.
There's just a couple of fixes needed after the script is run (see the
top commit). The cross arch includes are all fixed up by the script.
dtbs_install maintains a flat install. I compared the number of .dtbs
before and after to check the script.

I think the only issue remaining is finalizing the mapping of
platforms to subdirs. What I have currently is a mixture of SoC
families and vendors. The most notable are all the Freescale/NXP
platforms, pxa, socfpga, and stm32. It's not consistent with arm64
either. Once that's finalized, I still need to go update MAINTAINERS.

Here's the current mapping:

vendor_map =3D {
    'alphascale' : 'alphascale',
    'alpine' : 'alpine',
    'artpec' : 'axis',
    'axm' : 'lsi',
    'cx9' : 'cnxt',
    'ecx' : 'calxeda',
    'highbank' : 'calxeda',
    'ep7' : 'cirrus',
    'mxs': 'mxs',
    'imx23': 'mxs',
    'imx28': 'mxs',
    'sun' : 'allwinner',
    'imx': 'imx',
    'e6' : 'imx',
    'e7' : 'imx',
    'mba6' : 'imx',
    'ls': 'fsl',
    'vf': 'fsl',
    'qcom': 'qcom',
    'am3' : 'ti',
    'am4' : 'ti',
    'am5' : 'ti',
    'dra' : 'ti',
    'keystone' : 'ti',
    'omap' : 'ti',
    'compulab' : 'ti',
    'logicpd' : 'ti',
    'elpida' : 'ti',
    'motorola' : 'ti',
    'twl' : 'ti',
    'da' : 'ti',
    'dm' : 'ti',
    'nspire' : 'nspire',
    'armada' : 'marvell',
    'dove' : 'marvell',
    'kirkwood' : 'marvell',
    'orion' : 'marvell',
    'mvebu' : 'marvell',
    'mmp' : 'marvell',
    'berlin' : 'berlin',
    'pxa2' : 'pxa',
    'pxa3' : 'pxa',
    'pxa' : 'marvell',
    'arm-' : 'arm',
    'integ' : 'arm',
    'mps' : 'arm',
    've' : 'arm',
    'aspeed' : 'aspeed',
    'ast2' : 'aspeed',
    'facebook' : 'aspeed',
    'ibm' : 'aspeed',
    'openbmc' : 'aspeed',
    'en7' : 'airoha',
    'at91' : 'microchip',
    'sama' : 'microchip',
    'sam9' : 'microchip',
    'usb_' : 'microchip',
    'tny_' : 'microchip',
    'mpa1600' : 'microchip',
    'animeo_ip' : 'microchip',
    'aks-cdu' : 'microchip',
    'ethernut5' : 'microchip',
    'evk-pro3' : 'microchip',
    'pm9g45' : 'microchip',
    'ge86' : 'microchip',
    'bcm' : 'brcm',
    'exynos' : 'samsung',
    's3c' : 'samsung',
    's5p' : 'samsung',
    'gemini' : 'gemini',
    'hi3' : 'hisilicon',
    'hip' : 'hisilicon',
    'hisi' : 'hisilicon',
    'sd5' : 'hisilicon',
    'hpe' : 'hpe',
    'intel': 'intel',
    'mt' : 'mediatek',
    'meson' : 'meson',
    'moxa' : 'moxa',
    'mstar' : 'mstar',
    'nuvo' : 'nuvoton',
    'lpc' : 'lpc',
    'lan96' : 'microchip',
    'owl' : 'actions',
    'ox8' : 'oxsemi',
    'rda' : 'rda',
    'rtd' : 'realtek',
    'r7' : 'renesas',
    'r8' : 'renesas',
    'r9' : 'renesas',
    'emev2' : 'renesas',
    'sh73a' : 'renesas',
    'gr-' : 'renesas',
    'iwg' : 'renesas',
    'rk' : 'rockchip',
    'rv11' : 'rockchip',
    'rockchip' : 'rockchip',
    'socfpga' : 'socfpga',
    'stm' : 'stm32',
    'sti' : 'sti',
    'st-pin' : 'sti',
    'ste' : 'st-ericsson',
    'spear' : 'spear',
    'axp' : 'allwinner',
    'tegra' : 'nvidia',
    'milbeaut' : 'socionext',
    'uniph' : 'socionext',
    'vt8500' : 'vt8500',
    'wm8' : 'vt8500',
    'xen' : 'xen',
    'zx' : 'zte',
    'zynq' : 'xilinx',
}

Rob

[1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm-dts-mo=
ve-v2
