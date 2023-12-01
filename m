Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43525801011
	for <lists+openbmc@lfdr.de>; Fri,  1 Dec 2023 17:26:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=heLVNrLS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Shdj65KG1z3dH1
	for <lists+openbmc@lfdr.de>; Sat,  2 Dec 2023 03:26:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=heLVNrLS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShdhV4m9mz3cZt
	for <openbmc@lists.ozlabs.org>; Sat,  2 Dec 2023 03:25:30 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50bc743c7f7so3188907e87.3
        for <openbmc@lists.ozlabs.org>; Fri, 01 Dec 2023 08:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701447923; x=1702052723; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Fe9LinVeEIS31sVu9a8Ip9icgC4gCnScZC9xWW4pX4=;
        b=heLVNrLSZZG61x/TSyqrlSWhsvfBRHaiXiwu6cLA3f2M4J1qyJGWQu2nVs8LrdaGNs
         89A67LjY3iDskv+22WRM1hcndeh1vOwzKffCm8zH+I0Tvz8tOb1fWR/m4G/LugYi+tmL
         udHK6XOVHzEQmQUOKekwtHLworVF0x/RhVD/kzfEhg1qjjwsC7T3bG/h8kh2QdEuD9zk
         0z8/4FOOohciL0Z8wrNOpd+MGhEfaw0GdpHfccnEoBfDNroqY3phh4A8KSSdrGZnO1NM
         zVLbkrLhmUO0tau5Lmgw8QduiiPWs6YHh9e4ylgbg4fTUpFwTknZv62z/we1lN7qhQAv
         OaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447923; x=1702052723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Fe9LinVeEIS31sVu9a8Ip9icgC4gCnScZC9xWW4pX4=;
        b=cgNSwqfpw4PiMUrdLtbk9it6ANiOU34Gejrjy2STF51Bta2YfuhUEceCMCgvkmekPk
         ACkHWvChdlji/cRz2Ge3T/pgLJjvH/63HaZgQkAouuHaLSWPPxjtzj8xUZlUmBKx+uto
         SafvV57HpQN+rke2gxjzDHYqWZ09BgSH977KcfaaJBEFTlkJOcqCznjhC8/s7lXTzumn
         wcfIjiOzXcaPAL8gI+KiR1o65rdLaMAqOte3GpmgIyGheYdi8VHsuEPHdTq2lBZqTXnk
         YFOoge0oUTXLhXBabosmbZZK7fBSlEPpp6sgXLnVe2Nd9L0zDTl7ebDvo195eqAZHe3l
         k9oA==
X-Gm-Message-State: AOJu0YxvCqcmD/uHasPgzyqjiL04weXYJvWMhSCT1FLJ9kTQNVa8XP1K
	llh4YK5YsA9eisNP932xkck=
X-Google-Smtp-Source: AGHT+IED2w+hujxue7bm9bOGpjjCdvrKzr90/3i7E5Xd7uj7qqmqvOaSeS01ayw0GAygOWScKCMiaA==
X-Received: by 2002:a05:6512:280b:b0:50b:d764:64c0 with SMTP id cf11-20020a056512280b00b0050bd76464c0mr1188134lfb.117.1701447922712;
        Fri, 01 Dec 2023 08:25:22 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id i15-20020a056512340f00b0050bc303f3cbsm232121lfr.173.2023.12.01.08.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:25:22 -0800 (PST)
Date: Fri, 1 Dec 2023 19:25:19 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [Linux-stm32] [PATCH v1 2/2] net: stmmac: Add NPCM support
Message-ID: <dfbwvsvefbkj6lodj5nmj2up32vnai32u3qk667mpfjytvmp4z@uvny7nhaykzi>
References: <6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch>
 <CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
 <9ad42fef-b210-496a-aafc-eb2a7416c4df@lunn.ch>
 <CAP6Zq1jw9uLP_FQGR8=p3Y2NTP6XcNtzkJQ0dm3+xVNE1SpsVg@mail.gmail.com>
 <CAP6Zq1ijfMSPjk1vPwDM2B+r_vAH3DShhSu_jr8xJyUkTQY89w@mail.gmail.com>
 <a551aefa-777d-4fd3-b1a5-086dc3e62646@lunn.ch>
 <CAP6Zq1jVO5y3ySeGNE5-=XWV6Djay5MhGxXCZb9y91q=EA71Vg@mail.gmail.com>
 <25d0c091-3dce-4d62-a112-c82106809c65@lunn.ch>
 <xvy2coamb6cl3wcbkl32f6w7kksoxfocyd63t7k7bz4pne2gyx@lktivhqovy7p>
 <20231130213441.032a661c@device.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130213441.032a661c@device.home>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, joabreu@synopsys.com, tali.perry1@gmail.com, edumazet@google.com, robh+dt@kernel.org, joel@jms.id.au, mcoquelin.stm32@gmail.com, j.neuschaefer@gmx.net, peppe.cavallaro@st.com, netdev@vger.kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Maxime

On Thu, Nov 30, 2023 at 09:34:41PM +0100, Maxime Chevallier wrote:
> Hello,
> 
> On Thu, 30 Nov 2023 22:59:32 +0300
> Serge Semin <fancer.lancer@gmail.com> wrote:
> 
> > On Thu, Nov 30, 2023 at 06:26:13PM +0100, Andrew Lunn wrote:
> > > > I will check with the xpcs maintainer how can we add indirect access
> > > > to the xpcs module.  
> > > 
> > > https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c#L449
> > > 
> > > It creates a regmap for the memory range. On top of that it creates an
> > > MDIO bus. You can then access the PCS in the normal way.  
> > 
> > Actually Synopsys DW XPCS can be synthesized with two types of the CSR
> > interfaces:
> > 1. MDIO: device looks as a normal MDIO device. This option is currently
> >    supported by the STMMAC MDIO driver.
> > 2. MCI/APB3: device MMD CSRs are directly (all CSRs are visible) or
> >    indirectly (paged-base access) accessible over the system memory bus.
> > 
> > In addition to the above XPCS device can be equipped with separate
> > clock sources (at least to feed the MCI or APB3 interface) and may
> > have dedicated IRQ line to signal various events like link
> > establishing, failures, etc. From that perspective XPCS in both cases
> > looks as a normal platform device for which would be better to have a
> > special DT-node defined with all those resources supplied. Then the
> > XPCS DT-node could be passed to the DW MAC DT-node via the already
> > standardized "pcs-handle" DT-property.
> 

> To my understanding, this should work, there's another PCS that works
> this way : 
> https://elixir.bootlin.com/linux/v6.7-rc3/source/drivers/net/pcs/pcs-rzn1-miic.c

It is similar to that, but since DW XPCS can reside on the normal MDIO
bus and in the system memory I took a liberty to implement the DW XPCS
MCI/APB3 interface support in the framework of the MDIO subsystem,
especially seeing Synopsys call them just "Management Interfaces", the
MMD CSRs can be indirectly accessible and since potentially there can
be more than one XPCS device on the same MCI/APB3 bus.

> 
> Are you still able to use the mdio-regmap glue that Andrew mentioned,
> to avoid the duplication between the mdio and mmio register accesses ?

Andrew cited the glue code using the Lynx PCS driver. In my case it's
DW XPCS driver. In anycase my patchset is designed in a way so not to
break (hopefully) the current DW XPCS driver users (STMMAC Eth for
sure, WangSun XGBE, SJA1105 DSA). So it will be still possible to create a
dedicated MDIO bus (using mdio-regmap API too) with the XPCS device
being detectable on it.

-Serge(y)

> 
> Maxime
