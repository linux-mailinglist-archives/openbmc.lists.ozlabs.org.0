Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C9239016D
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 14:56:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqDc761Kzz2yxq
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 22:56:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=nBkCcXaG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30;
 helo=mail-qv1-xf30.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=nBkCcXaG; dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqDbq1m98z2yZF;
 Tue, 25 May 2021 22:56:20 +1000 (AEST)
Received: by mail-qv1-xf30.google.com with SMTP id c13so14729802qvx.5;
 Tue, 25 May 2021 05:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=26X9qK4i0o6JrWdnAd2JnpXvFHwNqdNddtrdo/NdfKI=;
 b=nBkCcXaGwEkQhV6TKf2zXfPW4FjThvleyqszqwJFSVAou+D+bRwAbaxBSeKr8Pes11
 E5e18rziC1t8POYTRl4a6k8F416Y9cBU3ZUoIqpy6M/uYy9nvutL1W43NWNsss+At6NY
 6pcrFoSCPJm1K1tXt+w2Haimjmc6bi/oNcQGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=26X9qK4i0o6JrWdnAd2JnpXvFHwNqdNddtrdo/NdfKI=;
 b=rHU2Z2Nfq66M92WuQjxpMie52OWXNlKEpRvc2FdCKvHU8rNpYDlFAlo5pKFLyzUxOb
 VU+abGQV2T7zCFW7BS9SWzCOtfJcykTsoDQdKgpI88PvlLK8cXyC6ejMXIFGxunF1ckg
 ENhY9RRJ2aMHTwfYQhjRXwi3QBW801B1twi0LisWZSQ9vh9ilb6OHbRSsJged+jXKROc
 xOYJ8I/vumDhPrJuPbYQH3eMSa4ngHG/I8YB+Rp5dXvad6DhtqdhUFqjD8YfLow0E5Rn
 s18CtLQMUJ7uigbuoFNpl7Q4Zj5c/sB8998OvagM4aXs88YqYcjpo1nVmJDMPep5tbhK
 Bj0Q==
X-Gm-Message-State: AOAM532UaUIaNtH1f6aJMvvQhXaSdatf2raVNdpb7QMN0Ag2qXRNgEQy
 ajewc0Q82boaxVPhvOEWc5HAGp/vDp0VwgFsAEE=
X-Google-Smtp-Source: ABdhPJzDQUGrbvEccQD0Kpi4U8eTcle1vYjBru7kgLT7HNZqT7Mrjy2Zqn6NAZqxZDh/CJTJUcX0PuPEQ1ETi39cZKo=
X-Received: by 2002:ad4:4961:: with SMTP id p1mr36377153qvy.43.1621947375551; 
 Tue, 25 May 2021 05:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210524073308.9328-1-steven_lee@aspeedtech.com>
 <CACPK8XcfvUQD5xwb=2Va5Sr+bmaWfJMZkh61HK1=J1qLYc84zQ@mail.gmail.com>
 <20210525094815.GA8757@aspeedtech.com>
In-Reply-To: <20210525094815.GA8757@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 25 May 2021 12:56:03 +0000
Message-ID: <CACPK8XfdYAcx=RX07hf1ar8A7th8G8390exvKbgh92X=ov8u2A@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] mmc: sdhci-of-aspeed: Support toggling SD bus
 signal
To: Steven Lee <steven_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 25 May 2021 at 09:48, Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> The 05/25/2021 15:55, Joel Stanley wrote:
> > When I was testing on my A2 EVB I saw this:
> >
> > [    1.436219] sdhci-aspeed 1e750100.sdhci: Requested out of range
> > phase tap 192 for 9 degrees of phase compensation at 1562500Hz,
> > clamping to tap 15
> > [    1.450913] sdhci-aspeed 1e750100.sdhci: Requested out of range
> > phase tap 963 for 45 degrees of phase compensation at 1562500Hz,
> > clamping to tap 15
> >
> > Do you know what is happening there?
> >
>
> Per MMC spec, eMMC bus speed is set as legacy mode(0~26MHz) at startup of
> eMMC initializtion flow. Clock phase calculation is triggered in set_clock()
> and it calculates taps based on phase_deg(<9>, <225>) in the dts file and the
> current speed(1562500Hz), which causes the warning message you mentioned.
> As the phase_deg in the dts file should be calculated with 100MHz.
>
> https://lkml.org/lkml/2021/5/24/95
>
> But after some initialization flow, eMMC bus speed will be set to
> correct speed(100MHz).
> Clock phase calculation will be triggered again to get correct taps.

Thanks for the explanation. I added another debug print and I can see
it doing what you describe:

[    1.465904] sdhci-aspeed 1e750100.sdhci: Requested out of range
phase tap 192 for 9 degrees of phase compensation at 1562500Hz,
clamping to tap 15
[    1.480598] sdhci-aspeed 1e750100.sdhci: rate 1562500 phase 9 tap 15
[    1.490316] sdhci-aspeed 1e750100.sdhci: Requested out of range
phase tap 963 for 45 degrees of phase compensation at 1562500Hz,
clamping to tap 15
[    1.505077] sdhci-aspeed 1e750100.sdhci: rate 1562500 phase 45 tap 15
[    1.515059] sdhci-aspeed 1e750100.sdhci: rate 100000000 phase 9 tap 3
[    1.524886] sdhci-aspeed 1e750100.sdhci: rate 100000000 phase 45 tap 15
[    1.534904] sdhci-aspeed 1e750100.sdhci: rate 100000000 phase 9 tap 3
[    1.544713] sdhci-aspeed 1e750100.sdhci: rate 100000000 phase 45 tap 15

We should change the "out of range" message to be dev_dbg, as it is
expected on a normal boot.

Cheers,

Joel
