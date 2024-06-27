Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CE191B11F
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 22:59:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MwHZsHEU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W99t54Spsz3cZx
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 06:59:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MwHZsHEU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W99sZ62vYz3cTv
	for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2024 06:58:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6DD4ECE332A;
	Thu, 27 Jun 2024 20:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8F4C2BBFC;
	Thu, 27 Jun 2024 20:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719521935;
	bh=09WhEq5r3XGQO4dhtl+2n781sC7j21j+wT5LnkW7syo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MwHZsHEU0LBEPFP8V7twQLd5G9kEPs5zqsYN12u2t3VDr91wDlRWlhyb5/4t+AuQB
	 /Xm8aL3W0R/4YWx9z1iD5RnOG7in9GoIZwzLTjnGlAegoWibC7wnbd6yMPEOf5m49a
	 VJCiozsORs2fto2A3lZ6hSJL67oVsqb19xz5JVH9DY5rOo+kxF8fVHpWNL2qfnyYU1
	 ocp4qSxDm6V0SxJV0Re6gy61gQAcWOaWOBCyFUsrU+Epvw4/fhTs8jVBvYlLSbJAdO
	 TOijowy4xrn0G5gH26e6CDayPMkTcmYGcAPZEf/TgdCOoUUABRJLDwXdy5MFyJrOq6
	 tc+HtDo8OkBsQ==
Date: Thu, 27 Jun 2024 14:58:54 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v25 1/3] dt-bindings: reset: npcm: add clock properties
Message-ID: <20240627205854.GA501440-robh@kernel.org>
References: <20240618185819.2155595-2-tmaimon77@gmail.com>
 <202406191439.3NcnExKM-lkp@intel.com>
 <CAP6Zq1h2Sk6H2V-i+PAk_fCy9xdywcYw=w9wT_xcJ2WrqyWbAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6Zq1h2Sk6H2V-i+PAk_fCy9xdywcYw=w9wT_xcJ2WrqyWbAg@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, oe-kbuild-all@lists.linux.dev, p.zabel@pengutronix.de, openbmc@lists.ozlabs.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 20, 2024 at 10:32:26AM +0300, Tomer Maimon wrote:
> Hi Rob and Krzysztof,
> 
> Could you please review this patch?

I would hope by v25 you'd know you just need to look at DT patchwork to 
see where you are in the queue. Pinging does nothing to help.

Furthermore, you waited a whole 2 days which isn't much.

> 
> Thanks,
> 
> Tomer
> 
> On Wed, 19 Jun 2024 at 09:20, kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Tomer,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on clk/clk-next]
> > [also build test WARNING on linus/master pza/reset/next v6.10-rc4 next-20240618]
> > [cannot apply to pza/imx-drm/next]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Tomer-Maimon/dt-bindings-reset-npcm-add-clock-properties/20240619-093532
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> > patch link:    https://lore.kernel.org/r/20240618185819.2155595-2-tmaimon77%40gmail.com
> > patch subject: [PATCH v25 1/3] dt-bindings: reset: npcm: add clock properties
> > config: arm64-randconfig-051-20240619 (https://download.01.org/0day-ci/archive/20240619/202406191439.3NcnExKM-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 13.2.0
> > dtschema version: 2024.6.dev1+g833054f
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406191439.3NcnExKM-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202406191439.3NcnExKM-lkp@intel.com/
> >
> > dtcheck warnings: (new ones prefixed by >>)
> >    arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi:63.7-177.5: Warning (simple_bus_reg): /ahb/apb: simple-bus unit address format error, expected "f0000000"
> >    arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi:50.35-55.5: Warning (unique_unit_address_if_enabled): /ahb/reset-controller@f0801000: duplicate unit-address (also used in node /ahb/clock-controller@f0801000)
> >    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /: memory@0: 'device_type' is a required property
> >         from schema $id: http://devicetree.org/schemas/memory.yaml#
> >    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: system-controller@f0800000: compatible: ['nuvoton,npcm845-gcr', 'syscon'] is too short
> >         from schema $id: http://devicetree.org/schemas/soc/nuvoton/nuvoton,npcm-gcr.yaml#
> >    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: interrupt-controller@dfff9000: 'ppi-partitions' does not match any of the regexes: '^v2m@[0-9a-f]+$', 'pinctrl-[0-9]+'
> >         from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml#
> >    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: ahb: apb:ranges: [[0, 0, 4026531840, 3145728], [4293918720, 0, 4293918720, 90112]] is not of type 'boolean'
> >         from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> > >> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: reset-controller@f0801000: '#clock-cells' is a required property
> >         from schema $id: http://devicetree.org/schemas/reset/nuvoton,npcm750-reset.yaml#
> > >> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: reset-controller@f0801000: 'clocks' is a required property
> >         from schema $id: http://devicetree.org/schemas/reset/nuvoton,npcm750-reset.yaml#

While I think things are too noisy for these 0-day reports, this one 
rightfully shows the ABI break you are causing. You can't add new 
required properties.

Rob
