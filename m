Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9E76A26CC
	for <lists+openbmc@lfdr.de>; Sat, 25 Feb 2023 03:21:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNr9L6Zm5z3cdt
	for <lists+openbmc@lfdr.de>; Sat, 25 Feb 2023 13:21:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qnteSo5o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qnteSo5o;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNr8c5Nwlz3bjW
	for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2023 13:20:46 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id nw10-20020a17090b254a00b00233d7314c1cso4638091pjb.5
        for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2023 18:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zc949AYft9IFGNUW86zvnufRhJcpge92Rw5rpweiyGw=;
        b=qnteSo5opXkcCfKL3Gjhv32sRrTgFBsYEB+4LsecZqr90/esx2fP1IsKdicHGdME3r
         8oTyNkPQMKouqUMLU7IMTgzBhdEg/988hyTiZYyslON4eB0JefkU2zoKq9gcB2k+wUAt
         6RXejXampUqROxtR+b+dS6aMTQo8XXZ8fUP5Rc4ZzrNltUwGLLAO98capgMA3DHXWvs0
         29vnIG3mwuLkbMGoA5Q8eB2fQohCno7vD2Ti4ynFQayYAmB54JTiQhJa3e9A0Amo/FEn
         QkbSedHSdob3lV2jLTS47QhBjtKn0jjv3dSkzsUmNjpkWHzHB3k5xS4Gss3Nwb9SD1kN
         5bvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zc949AYft9IFGNUW86zvnufRhJcpge92Rw5rpweiyGw=;
        b=ygqkynhHw0ZSd7qysLBDaYMqwAF80gERKwtiAeoPV5bgKJS/XhTeJSR2qLiK41EJSP
         mai6cqYYFcYQtQHwAjnOotQa87QlUAN/53FPw96dBDSGUxYgruEXFqkqC+2RdS0ktTPD
         iPY02LgsJ+I0QEs58C+hTFPTDP+xlQeZTLjtul8Llk1SXkln69NaW9pxTYQcINRihY9P
         3CBNzUOubR/ZSioACCxeOzWlSuJOFMG73gDv1Rn2/t79nyYxhf43V6+uWWoGH3TlY5GJ
         Arq4o+vLBKNJZEib4nl2wXLbdC70UvIiePVa25qJPP40BhT9HGLQziDueafeHOd8ihQO
         zhuQ==
X-Gm-Message-State: AO0yUKUEKhlbrmB5G7brrj8JBGOVjhkV5Zq6YZxBkeypCDCv6bwdnJ9u
	6RVtvivGh37LsrUM3mJPVVA=
X-Google-Smtp-Source: AK7set9c1jWhOsYFBtXyGvgnGsBYntypXqFajACm8pGGNF3eEnec5zkpRjmzwhvmEXB6PWte7jjjag==
X-Received: by 2002:a17:902:f683:b0:19a:7604:f265 with SMTP id l3-20020a170902f68300b0019a7604f265mr22369397plg.39.1677291641732;
        Fri, 24 Feb 2023 18:20:41 -0800 (PST)
Received: from fedora ([76.132.59.39])
        by smtp.gmail.com with ESMTPSA id x20-20020a170902ea9400b0019ac23cb6edsm146090plb.181.2023.02.24.18.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 18:20:41 -0800 (PST)
Date: Fri, 24 Feb 2023 18:20:39 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: "Erhan Y." <erhan14@yahoo.com>
Subject: Re: openbmc Digest, Vol 90, Issue 49
Message-ID: <Y/lwd+AFOBlYhkPq@fedora>
References: <mailman.2946.1677197072.1397.openbmc@lists.ozlabs.org>
 <41828313.192702.1677229278186@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41828313.192702.1677229278186@mail.yahoo.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Erhan,

We are using the jtag master driver implementation from "JTAG driver
introduction" patch series. You may need to resolve merge conflicts
depending on your kernel version.

https://lore.kernel.org/all/20200414091548.GH34613@smile.fi.intel.com/t/

Cheers,

Tao

On Fri, Feb 24, 2023 at 09:01:18AM +0000, Erhan Y. wrote:
>  Hi Tao,Where can we find the current source or patches for AST2xxx JTAG master drivers on Linux 6.x?Thanks
> 
> Message: 1
> Date: Wed, 22 Feb 2023 23:33:29 -0800
> From: Tao Ren <rentao.bupt@gmail.com>
> To: Joel Stanley <joel@jms.id.au>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Re: OpenBMC Linux 6.1
> Message-ID: <Y/cWyUVGkYA2UvBp@fedora>
> Content-Type: text/plain; charset=us-ascii
> 
> On Wed, Feb 22, 2023 at 06:25:13AM +0000, Joel Stanley wrote:
> > On Wed, 22 Feb 2023 at 06:11, Tao Ren <rentao.bupt@gmail.com> wrote:
> > >
> > > Hi Joel,
> > >
> > > Thanks for the update. Let me move some Meta/Facebook AST2500 and
> > > AST2600 Network OpenBMCs to v6.1, and will share my findings later.
> >
> > Thanks Tao, I appreciate it.
> 
> Just heads up I sanity tested dev-6.1 branch on 3 aspeed generations,
> and everything looks normal. The 3 openbmc platforms are:
>   - wedge100 (AST2400)
>   - cmm (AST2500)
>   - fbdarwin (AST2600, dts to be upstreamed)
> 
> >
> > > Besides, could you please share your long term kernel upgrade plan? For
> > > example, are you planning to align with LTS kernel in the future? Or the
> > > ultimate goal is to upgrade openbmc kernel whenever newer kernel is
> > > released?
> >
> > Somewhere in between those two.
> >
> > If we were to wait 5 or so years between updates, then we remove the
> > motivation for developers to upstream their code, and I imagine it
> > would be a headache to hunt down regressions when making that big
> > jump.
> >
> > On the other hand, management has been trained to target the stable
> > releases and somehow consider them to be better than others. I argue
> > this isn't true, because the code is only as stable as the test and
> > development resources that are put into it! That said, it's less work
> > to merge in the stable tree every week or two and test that than it is
> > to do a new rebase every three months.
> >
> > The ultimate goal is to have all of our code upstream, and just use
> > whatever kernel yocto has. We're pretty close for aspeed machines; at
> > IBM we have some downstream hacks for misbehaving i2c devices, and
> > some device trees for pre-production hardware that have minor
> > differences to the production version. If we were to upstream the
> > hacks for i2c devices (or stop using them) then we could ship upstream
> > kernels.
> >
> > Ultimately it would be best for the project if we used the latest
> > kernel on master, and had a LTS kernel that was used by product
> > branches. This would require the project to fund someone to do this
> > work long term, to ensure the stable updates haven't caused
> > regressions, to cherry pick patches that fix code that was not present
> > in the upstream release, and in their remaining time help get more
> > code in mainline.
> >
> > Cheers,
> >
> > Joel
> 
> Thanks for sharing the details, and in short, I'm moving torward the
> similar direction:)
> 
> My current plan is to upgrade openbmc kernel at least once a year
> (skipping ~4 kernel releases) for facebook network openbmc platforms,
> and I'm facing the similar challenges: upstreaming kernel patches and
> test enhancement. I don't have plan to force more frequent kernel
> upgrade in 2023, because if I had bandwidth, I'd rather spend the time
> upstreaming patches: I believe kernel upgrade would be much easier if
> all the patches are upstreamed.
> 
> I quickly went through the local kernel patches in my repo, and they
> fall in 3 major categories: 1) JTAG master drivers 2) hwmon drivers 3)
> enabling dsa in a few dts files. I'm not sure if anyone is actively
> looking into the jtag patch series, but I will try my best to clean up
> some patches in #2 and #3 this year.
> 
> BTW, I will create the recipe to fetch dev-6.1 into meta/facebook
> openbmc tree soon. Thanks again for maintaining the tree.
> 
> 
> Cheers,
> 
> Tao
>     On Friday, February 24, 2023 at 03:08:44 AM GMT+3, openbmc-request@lists.ozlabs.org <openbmc-request@lists.ozlabs.org> wrote:  
>  
>  Send openbmc mailing list submissions to
>     openbmc@lists.ozlabs.org
> 
> To subscribe or unsubscribe via the World Wide Web, visit
>     https://lists.ozlabs.org/listinfo/openbmc
> or, via email, send a message with subject or body 'help' to
>     openbmc-request@lists.ozlabs.org
> 
> You can reach the person managing the list at
>     openbmc-owner@lists.ozlabs.org
> 
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of openbmc digest..."
> 
> 
> Today's Topics:
> 
>   1. Re: OpenBMC Linux 6.1 (Tao Ren)
>   2. RE: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED
>       i2Cv2 (Ryan Chen)
>   3. [PATCH v2 0/3] ARM: dts: aspeed: ASRock BMC updates (Zev Weiss)
>   4. [PATCH v2 3/3] ARM: dts: aspeed: asrock: Correct firmware
>       flash SPI clocks (Zev Weiss)
> 
> 
> ----------------------------------------------------------------------
> 
> Message: 1
> Date: Wed, 22 Feb 2023 23:33:29 -0800
> From: Tao Ren <rentao.bupt@gmail.com>
> To: Joel Stanley <joel@jms.id.au>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Re: OpenBMC Linux 6.1
> Message-ID: <Y/cWyUVGkYA2UvBp@fedora>
> Content-Type: text/plain; charset=us-ascii
> 
> On Wed, Feb 22, 2023 at 06:25:13AM +0000, Joel Stanley wrote:
> > On Wed, 22 Feb 2023 at 06:11, Tao Ren <rentao.bupt@gmail.com> wrote:
> > >
> > > Hi Joel,
> > >
> > > Thanks for the update. Let me move some Meta/Facebook AST2500 and
> > > AST2600 Network OpenBMCs to v6.1, and will share my findings later.
> > 
> > Thanks Tao, I appreciate it.
> 
> Just heads up I sanity tested dev-6.1 branch on 3 aspeed generations,
> and everything looks normal. The 3 openbmc platforms are:
>   - wedge100 (AST2400)
>   - cmm (AST2500)
>   - fbdarwin (AST2600, dts to be upstreamed)
> 
> > 
> > > Besides, could you please share your long term kernel upgrade plan? For
> > > example, are you planning to align with LTS kernel in the future? Or the
> > > ultimate goal is to upgrade openbmc kernel whenever newer kernel is
> > > released?
> > 
> > Somewhere in between those two.
> > 
> > If we were to wait 5 or so years between updates, then we remove the
> > motivation for developers to upstream their code, and I imagine it
> > would be a headache to hunt down regressions when making that big
> > jump.
> > 
> > On the other hand, management has been trained to target the stable
> > releases and somehow consider them to be better than others. I argue
> > this isn't true, because the code is only as stable as the test and
> > development resources that are put into it! That said, it's less work
> > to merge in the stable tree every week or two and test that than it is
> > to do a new rebase every three months.
> > 
> > The ultimate goal is to have all of our code upstream, and just use
> > whatever kernel yocto has. We're pretty close for aspeed machines; at
> > IBM we have some downstream hacks for misbehaving i2c devices, and
> > some device trees for pre-production hardware that have minor
> > differences to the production version. If we were to upstream the
> > hacks for i2c devices (or stop using them) then we could ship upstream
> > kernels.
> > 
> > Ultimately it would be best for the project if we used the latest
> > kernel on master, and had a LTS kernel that was used by product
> > branches. This would require the project to fund someone to do this
> > work long term, to ensure the stable updates haven't caused
> > regressions, to cherry pick patches that fix code that was not present
> > in the upstream release, and in their remaining time help get more
> > code in mainline.
> > 
> > Cheers,
> > 
> > Joel
> 
> Thanks for sharing the details, and in short, I'm moving torward the
> similar direction:)
> 
> My current plan is to upgrade openbmc kernel at least once a year
> (skipping ~4 kernel releases) for facebook network openbmc platforms,
> and I'm facing the similar challenges: upstreaming kernel patches and
> test enhancement. I don't have plan to force more frequent kernel
> upgrade in 2023, because if I had bandwidth, I'd rather spend the time
> upstreaming patches: I believe kernel upgrade would be much easier if
> all the patches are upstreamed.
> 
> I quickly went through the local kernel patches in my repo, and they
> fall in 3 major categories: 1) JTAG master drivers 2) hwmon drivers 3)
> enabling dsa in a few dts files. I'm not sure if anyone is actively
> looking into the jtag patch series, but I will try my best to clean up
> some patches in #2 and #3 this year.
> 
> BTW, I will create the recipe to fetch dev-6.1 into meta/facebook
> openbmc tree soon. Thanks again for maintaining the tree.
> 
> 
> Cheers,
> 
> Tao
> 
> 
> ------------------------------
> 
> Message: 2
> Date: Thu, 23 Feb 2023 10:25:56 +0000
> From: Ryan Chen <ryan_chen@aspeedtech.com>
> To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
>     <robh+dt@kernel.org>, Krzysztof Kozlowski
>     <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>,
>     Andrew Jeffery <andrew@aj.id.au>, Philipp Zabel
>     <p.zabel@pengutronix.de>,    "openbmc@lists.ozlabs.org"
>     <openbmc@lists.ozlabs.org>,    "linux-arm-kernel@lists.infradead.org"
>     <linux-arm-kernel@lists.infradead.org>,
>     "linux-aspeed@lists.ozlabs.org"    <linux-aspeed@lists.ozlabs.org>,
>     "linux-kernel@vger.kernel.org"    <linux-kernel@vger.kernel.org>
> Subject: RE: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED
>     i2Cv2
> Message-ID:
>     <SEZPR06MB52697747528490B1A16AF87FF2AB9@SEZPR06MB5269.apcprd06.prod.outlook.com>
>     
> Content-Type: text/plain; charset="utf-8"
> 
> Hello Krzysztof,
> 
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Sent: Thursday, February 23, 2023 5:29 PM
> > To: Ryan Chen <ryan_chen@aspeedtech.com>; Rob Herring
> > <robh+dt@kernel.org>; Krzysztof Kozlowski
> > <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>; Andrew
> > Jeffery <andrew@aj.id.au>; Philipp Zabel <p.zabel@pengutronix.de>;
> > openbmc@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
> > linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
> > 
> > On 22/02/2023 11:47, Ryan Chen wrote:
> > >>>> connector. That slave will keep state to drive clock stretching.
> > >>>>> So it is specific enable in i2c bus#1. Others is not needed enable
> > timeout.
> > >>>>> Does this draw is more clear in scenario?
> > >>>>
> > >>>> I2C bus #1 works in slave mode? So you always need it for slave work?
> > >>>
> > >>> Yes, it is both slave/master mode. It is always dual role. Slave
> > >>> must always
> > >> work.
> > >>> Due to another board master will send.
> > >>
> > >> I meant that you need this property when it works in slave mode? It
> > >> would be then redundant to have in DT as it is implied by the mode.
> > >
> > > But timeout feature is also apply in master. It for avoid suddenly
> > > slave miss(un-plug) Master can timeout and release the SDA/SCL, return.
> > 
> > OK, yet the property should describe the hardware, not the register feature you
> > want to program. You need to properly model it in DT binding to represent
> > hardware setup, not your desired Linux driver behavior.
> > 
> > >>>>> The same draw, in this case, i2c bus#1 that is multi-master
> > >>>>> transfer
> > >>>> architecture.
> > >>>>> Both will inactive with trunk data. That cane enable i2c#1 use DMA
> > >>>>> transfer
> > >>>> to reduce CPU utilized.
> > >>>>> Others (bus#2/3) can keep byte/buff mode.
> > >>>>
> > >>>> Isn't then current bus configuration for I2C#1 known to the driver?
> > >>>> Jeremy asked few other questions around here...
> > >>>
> > >>> No, The driver don't know currently board configuration.
> > >>
> > >> It knows whether it is working in multi-master/slave mode.
> > >
> > > But in DT can decide which i2c bus number can use dma or buffer mode
> > transfer.
> > > If in another i2c bus support master only, also can use dma to transfer trunk
> > data to another slave.
> > 
> > and none of these were explained in commit msg or device description.
> > 
> Thanks your guidance. I will add all those discussion in next patches cover-letter.
> Best regards,
> Ryan Chen.
> 
> ------------------------------
> 
> Message: 3
> Date: Thu, 23 Feb 2023 16:03:57 -0800
> From: Zev Weiss <zev@bewilderbeest.net>
> To: Andrew Jeffery <andrew@aj.id.au>,    Joel Stanley <joel@jms.id.au>
> Cc: Zev Weiss <zev@bewilderbeest.net>,    openbmc@lists.ozlabs.org,
>     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,    Rob Herring
>     <robh+dt@kernel.org>,    devicetree@vger.kernel.org,
>     linux-arm-kernel@lists.infradead.org,    linux-aspeed@lists.ozlabs.org,
>     linux-kernel@vger.kernel.org
> Subject: [PATCH v2 0/3] ARM: dts: aspeed: ASRock BMC updates
> Message-ID: <20230224000400.12226-1-zev@bewilderbeest.net>
> 
> Hello,
> 
> This patch series contains a few small device-tree updates for ASRock
> BMCs: an LED polarity fix for romed8hm3, enabling the ast2500 PECI
> device on e3c246d4i, and a SPI flash clock frequency fix for both.
> 
> Thanks,
> Zev
> 
> Changes since v1 [0]:
>  - Added patch 3 correcting SPI flash clocks
> 
> [0] https://lore.kernel.org/linux-devicetree/20230203105405.21942-1-zev@bewilderbeest.net/
> 
> Zev Weiss (3):
>   ARM: dts: aspeed: romed8hm3: Fix GPIO polarity of system-fault LED
>   ARM: dts: aspeed: e3c246d4i: Add PECI device
>   ARM: dts: aspeed: asrock: Correct firmware flash SPI clocks
> 
>  arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts | 6 +++++-
>  arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts | 4 ++--
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> -- 
> 2.39.1.438.gdcb075ea9396.dirty
> 
> 
> 
> ------------------------------
> 
> Message: 4
> Date: Thu, 23 Feb 2023 16:04:00 -0800
> From: Zev Weiss <zev@bewilderbeest.net>
> To: Andrew Jeffery <andrew@aj.id.au>,    Joel Stanley <joel@jms.id.au>
> Cc: Zev Weiss <zev@bewilderbeest.net>,    Krzysztof Kozlowski
>     <krzysztof.kozlowski+dt@linaro.org>,    Rob Herring <robh+dt@kernel.org>,
>     devicetree@vger.kernel.org,    linux-arm-kernel@lists.infradead.org,
>     linux-aspeed@lists.ozlabs.org,    linux-kernel@vger.kernel.org,
>     openbmc@lists.ozlabs.org,    stable@vger.kernel.org
> Subject: [PATCH v2 3/3] ARM: dts: aspeed: asrock: Correct firmware
>     flash SPI clocks
> Message-ID: <20230224000400.12226-4-zev@bewilderbeest.net>
> 
> While I'm not aware of any problems that have occurred running these
> at 100 MHz, the official word from ASRock is that 50 MHz is the
> correct speed to use, so let's be safe and use that instead.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Cc: stable@vger.kernel.org
> Fixes: 2b81613ce417 ("ARM: dts: aspeed: Add ASRock E3C246D4I BMC")
> Fixes: a9a3d60b937a ("ARM: dts: aspeed: Add ASRock ROMED8HM3 BMC")
> ---
>  arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> index 67a75aeafc2b..c4b2efbfdf56 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> @@ -63,7 +63,7 @@ flash@0 {
>          status = "okay";
>          m25p,fast-read;
>          label = "bmc";
> -        spi-max-frequency = <100000000>; /* 100 MHz */
> +        spi-max-frequency = <50000000>; /* 50 MHz */
>  #include "openbmc-flash-layout.dtsi"
>      };
>  };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
> index 00efe1a93a69..4554abf0c7cd 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
> @@ -51,7 +51,7 @@ flash@0 {
>          status = "okay";
>          m25p,fast-read;
>          label = "bmc";
> -        spi-max-frequency = <100000000>; /* 100 MHz */
> +        spi-max-frequency = <50000000>; /* 50 MHz */
>  #include "openbmc-flash-layout-64.dtsi"
>      };
>  };
> -- 
> 2.39.1.438.gdcb075ea9396.dirty
> 
> 
> 
> End of openbmc Digest, Vol 90, Issue 49
> ***************************************
>   
