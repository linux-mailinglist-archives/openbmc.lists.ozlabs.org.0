Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E82391710C5
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 06:58:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ShmQ1T6JzDqgk
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 16:58:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=I2KS5PW/; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Shhm1RjrzDqpM;
 Thu, 27 Feb 2020 16:55:03 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id 145so2087196qkl.2;
 Wed, 26 Feb 2020 21:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BT+Y4zDOpTN8aRnsqq1qa2mSs9wu0N9tys2uzX7EM7Q=;
 b=I2KS5PW/7Kw7fTHC3Wxq8Osxk8ug/lmvcU2moEvkCzfofFm2FVnq73DDl0YTEDLd3u
 Q3v+LTl0KnhEidEoGD8Az1KBh2NbkQHyMlUWo/6cNu49XIQ3CYxqXnQVbFsadGjrS6pN
 Z9IgLoO5G01BEyRaeY6NY+Ey62eqAglnXlFMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BT+Y4zDOpTN8aRnsqq1qa2mSs9wu0N9tys2uzX7EM7Q=;
 b=DbopF1RfJ6Bb4B4wQpruB0a/NWxXfhhr6BRK3KOwSFbHX4i/mCAsgv2q2CxxeD6mO0
 VWEGpaK9i/tNLUbXf5KTUV57+RV/B480fspCb/2vRFbc0YUXTvZfNuYqebtgEVWnZwbb
 PaqFxaWJyssBRGQCh6fce/a/RCk/idt4zVIYGriFYObNME79j43mRQLV5kmn7vnRQLEM
 t9ZV2WQopeG6Cs/V43nUP8U9b/b7ecsse8XeGYcAdKVL1fH+H7VQbYURgtG4Q016F89S
 1SjivRLWHz0Hh2XtpsHjErFge47/ZbSTHKwnlWrT2ZPB8njDv/gFhg8ttTeGdzU3XLK5
 DyJw==
X-Gm-Message-State: APjAAAVcBUFMwuTs0rrv5cbAtCR9kYCcrPkLo8ZkHxLYSTyxTcUCGrA0
 A5zGT6yqziWM5CVmUACyql+pkZJjy29uS9TdEmQ=
X-Google-Smtp-Source: APXvYqzT52XJX1ayxGeNKzjAkfyJjllIsA3MS1ZOUJZUZBT6z2y1pnNAw6jRX/tZyQhZlu/wqAmNLrhydyjZY7ZzuqU=
X-Received: by 2002:a37:a493:: with SMTP id n141mr1860258qke.330.1582782900930; 
 Wed, 26 Feb 2020 21:55:00 -0800 (PST)
MIME-Version: 1.0
References: <20200226230346.672-1-rentao.bupt@gmail.com>
 <20200226230346.672-6-rentao.bupt@gmail.com>
 <c1f990ad2fd35deeba9e4e937cb19ee5080ea2a8.camel@kernel.crashing.org>
In-Reply-To: <c1f990ad2fd35deeba9e4e937cb19ee5080ea2a8.camel@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Feb 2020 05:54:49 +0000
Message-ID: <CACPK8XfALBpAUmvAmBLDGa-oEMaZSqaKsHjs0EEPYP=_riGJVA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] ARM: dts: aspeed-g5: add vhub port and endpoint
 properties
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Tao Ren <taoren@fb.com>,
 Tao Ren <rentao.bupt@gmail.com>, Colin Ian King <colin.king@canonical.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 27 Feb 2020 at 04:11, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Wed, 2020-02-26 at 15:03 -0800, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> >
> > Add "aspeed,vhub-downstream-ports" and "aspeed,vhub-generic-
> > endpoints"
> > properties to describe supported number of vhub ports and endpoints.
> >
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
>
> Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I will take this patch through the aspeed tree for 5.7.

Cheers,

Joel


>
> > ---
> >  No change in v2/v3/v4.
> >    - It's given v4 to align with the version of the patch series.
> >
> >  arch/arm/boot/dts/aspeed-g5.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi
> > b/arch/arm/boot/dts/aspeed-g5.dtsi
> > index ebec0fa8baa7..f12ec04d3cbc 100644
> > --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> > @@ -195,6 +195,8 @@
> >                       reg = <0x1e6a0000 0x300>;
> >                       interrupts = <5>;
> >                       clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
> > +                     aspeed,vhub-downstream-ports = <5>;
> > +                     aspeed,vhub-generic-endpoints = <15>;
> >                       pinctrl-names = "default";
> >                       pinctrl-0 = <&pinctrl_usb2ad_default>;
> >                       status = "disabled";
>
