Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E5B33E63
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 07:30:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J0qh3fDjzDqQ1
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 15:30:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="I9AddxTf"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J0qF3vmgzDqNr
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 15:29:42 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id x47so12296762qtk.11
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jun 2019 22:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dMOOPlXSXiSejH9hnsHu7l40rBsbcyVsVmfD1OqBFhk=;
 b=I9AddxTfSeMC1LW/7j15oOL3RaHSS+vbCOdO2j8RgNwiSY4Lg5hlp/m3ydx8wSLk4+
 gYrtBNpfHrrHCUqraqej5vc41TAIG7EaoJu7og1x77XhXmDPyE+WPQLt3TV4RMH+4lqe
 s16HeszOhVFDQoZoC80ve9OeuhPySOkx6Vunk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dMOOPlXSXiSejH9hnsHu7l40rBsbcyVsVmfD1OqBFhk=;
 b=YKU2cVKSzBH5KmRBXL/87MhVLQq2GKJSoIMtqsya0e7YJqUzccTAiToFYxT2edmcR+
 8JhNb9y9+PXcPfcYeXGbMK0TaEAjCX9EHMv7gxHCDcC0wvnXTLk5XBxyg9ra0fX9RgGg
 CA6L2AOnKMZR6sDbLHAkyCHH2Aq6BtbKSbHDjQhrBfLCihZApGSOAuZSfdY/0ABWHYYD
 Vy8mCPzEFzmt2taQ+Y7//D+YyDVp/YUBnSEpJCBbnmKqkl0915w+X/9xq4yhEFsyzCZD
 sDOtxb/h+kB90fdR1B+riWwShXgwFHNZ+Ccag4Fi/5d9SpOriyxj70D1h+9KFNZPIzlm
 umwg==
X-Gm-Message-State: APjAAAVkG7KzPHHuR/4Pg29sy4gvbICoWcBdZ81JBvP7d0gkS7cSQBeq
 aEXYpdkp/8gq2Wa5l+pFUNuqF07OfaVGzgGU7Qsf8IC0
X-Google-Smtp-Source: APXvYqxGNbpnhcOgqdv4bXPiHrR7OMnjepRdmiVZ8m26FUBRvlkz9RQU9Cj2RHyibswOPUDEA/b8ZZUnfNIVILhmpi0=
X-Received: by 2002:a0c:f68e:: with SMTP id p14mr13615531qvn.172.1559626179556; 
 Mon, 03 Jun 2019 22:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190531132440.37572-1-Fran.Hsu@quantatw.com>
 <CADKL2t6K1Vu-DyuH_MYt5jGoFyCWe+X3fWETLNiPbZYO8Xrcpw@mail.gmail.com>
 <CACPK8XetcxfY1uWfiv9pLsX9a+X+66d2pD5-A68ZHrOUZhAd0Q@mail.gmail.com>
In-Reply-To: <CACPK8XetcxfY1uWfiv9pLsX9a+X+66d2pD5-A68ZHrOUZhAd0Q@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 4 Jun 2019 05:29:28 +0000
Message-ID: <CACPK8Xe9rAEi8e5FDsbc89CQ_+iDhD5YW6+aqnZ0N5GxpZCR0Q@mail.gmail.com>
Subject: Re: [PATCH dev-5.1 v5 1/4] ARM: dts: nuvoton: Add NPCM730 common
 device tree include file.
To: Benjamin Fair <benjaminfair@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Fran Hsu <Fran.Hsu@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 4 Jun 2019 at 05:23, Joel Stanley <joel@jms.id.au> wrote:
>
> On Fri, 31 May 2019 at 15:28, Benjamin Fair <benjaminfair@google.com> wrote:
> > This looks great! I think it's ready to merge.
> >
> > On Fri, May 31, 2019 at 6:26 AM Fran Hsu <franhsutw@gmail.com> wrote:
> > >
> > > Quanta GSJ BMC uses the Nuvoton NPCM730 BMC soc.
> > > This file describes the common setting of NPCM730 soc.
> > >
> > > Signed-off-by: Fran Hsu <Fran.Hsu@quantatw.com>
> >
> > Reviewed-by: Benjamin Fair <benjaminfair@google.com>
>
> Thanks Benjamin for reviewing, and Fran for working to get these
> patches in a state that we can merge them. I've put them in the
> dev-5.1 tree with some small tweaks to the commit messages.

I spoke too soon. I see these warnings when building:

../arch/arm/boot/dts/nuvoton-npcm730-gsj.dts:307.6-25: Warning
(i2c_bus_reg): /ahb/apb/i2c@8d000/ipmb@40000010:reg: I2C address must
be less than 10-bits, got "0x40000010"
../arch/arm/boot/dts/nuvoton-npcm730-gsj.dts:320.6-25: Warning
(i2c_bus_reg): /ahb/apb/i2c@8e000/ipmb@40000012:reg: I2C address must
be less than 10-bits, got "0x40000012"

Please send follow up patches to fix these warnings.

The following warnings also exist when building the npcm kernel. If
you could also fix those it would be appreciated:

../arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:222.22-231.5: Warning
(spi_bus_bridge): /ahb/fiu@fb000000: node name for SPI buses should be
'spi'
  also defined at ../arch/arm/boot/dts/nuvoton-npcm730-gsj.dts:81.22-126.5
arch/arm/boot/dts/nuvoton-npcm730-gsj.dtb: Warning (spi_bus_reg):
Failed prerequisite 'spi_bus_bridge'
../arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:222.22-231.5: Warning
(spi_bus_bridge): /ahb/fiu@fb000000: node name for SPI buses should be
'spi'
  also defined at ../arch/arm/boot/dts/nuvoton-npcm750-evb.dts:164.22-221.5
../arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:233.22-244.5: Warning
(spi_bus_bridge): /ahb/fiu@c0000000: node name for SPI buses should be
'spi'
  also defined at ../arch/arm/boot/dts/nuvoton-npcm750-evb.dts:223.22-242.5

Cheers,

Joel
