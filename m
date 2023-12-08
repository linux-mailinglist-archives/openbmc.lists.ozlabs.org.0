Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0213680A839
	for <lists+openbmc@lfdr.de>; Fri,  8 Dec 2023 17:08:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YPboo54B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Smwzb3gHkz3dBc
	for <lists+openbmc@lfdr.de>; Sat,  9 Dec 2023 03:08:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YPboo54B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Smwyy4qZnz3cR3
	for <openbmc@lists.ozlabs.org>; Sat,  9 Dec 2023 03:07:52 +1100 (AEDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c9f413d6b2so27234231fa.1
        for <openbmc@lists.ozlabs.org>; Fri, 08 Dec 2023 08:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702051665; x=1702656465; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CfiPX6OGNhZRjUiwvlyjSmKemrJqXvraxcvBV131SRo=;
        b=YPboo54Bwmv+A9/5d2+pcTfd7kA7xFciFBMXCp2hiJOT5z3q/j6ve1FEF6wQ06xav2
         MKHGH3ms4b3eA9UGWC8bnRyoy9Wc+4USbfKivB94da2AyGqjJn1ClyJ7Ze5+EEoo9Oj+
         MsIv6+Z2Yl3VY8CP+ec32U7pBKchzH+ATz0aG5q411GTVUINoih23wH2DbtHlrfmJ3k5
         6VQKEsYuS4P4y9cMp6WSnMGAFg9/NU/wTQuEK/P1ZgxXFYJ/zHG6/t53NMuyEtGiOANW
         t7jZu1zatEOlriHkE6A5dhkgDgJ1x05x6YcAMrVSoExBlUybaDbtr6cphV+QqzDBWwlT
         HopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702051665; x=1702656465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CfiPX6OGNhZRjUiwvlyjSmKemrJqXvraxcvBV131SRo=;
        b=EZ0dbtuhmzZmnSr9E/e6FSg1YlCVfaM0DhDProe387nqG7jXYX1tqux2heRtFP8jpN
         zWVBQcQcQvmhRCdQb7JKd46Q+J8zIyulgx2aHRVh+lgTJvKFnaSK2kX9GkLORPJpNkGJ
         G47PAyautkcTDj1PYTQvy/0Yz0rclW5utHAozviM2S65IytwM5JOwFXZ2oLw459FM5b7
         At73dDIzz7OypIHpE/wfAOfYaizuWYzC/uYyuu7PSNyb4aBWsqspsHbUCZDn7mPg7d4d
         CZ8+6UUx4axm9bcWtvd+2dtG8t6OdWIz/ozp6E4VWHASyOzXbl2hSpoPXfHzmsFb1gRy
         27wg==
X-Gm-Message-State: AOJu0YwWwrr10OlElcKbRkJtOSslWC+dxPHTZfMNq43gm+/FpnGeefNx
	vMfK6CQPoYs4vjREpWoP13M=
X-Google-Smtp-Source: AGHT+IFERSjKkWw7VFG+TyMdjyfFLR1k0hpAoCtE644pZT7QRiW7cMROY1NVAgannUhObcH9HyaFkw==
X-Received: by 2002:a2e:3008:0:b0:2ca:a3d:dcda with SMTP id w8-20020a2e3008000000b002ca0a3ddcdamr41271ljw.57.1702051665318;
        Fri, 08 Dec 2023 08:07:45 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id w2-20020a05651c102200b002ca0e0c837asm259858ljm.100.2023.12.08.08.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 08:07:44 -0800 (PST)
Date: Fri, 8 Dec 2023 19:07:42 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 09/16] net: mdio: Add Synopsys DW XPCS
 management interface support
Message-ID: <vj3pxanxczwehchksvfeba6g4i3uusbcdy5afixrug64tvlpad@jxtjxite644q>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-10-fancer.lancer@gmail.com>
 <20231205133205.3309ab91@device.home>
 <cv6oo27tqbfst3jrgtkg7bcxmeshadtzoomn2xgnzh2arz4nwy@wq5k7oygto6n>
 <15e6857a-b1d1-465a-945e-6f31edac62fb@lunn.ch>
 <jqwhgthwxfge6y4nv5mdnojqu76m4pi2mt2x6kwqiuqntcwj67@mewh42eey5ny>
 <19ebc244-6d79-4e12-8ac4-fcf046106a07@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19ebc244-6d79-4e12-8ac4-fcf046106a07@lunn.ch>
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Tomer Maimon <tmaimon77@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Dec 07, 2023 at 03:54:08PM +0100, Andrew Lunn wrote:
> On Thu, Dec 07, 2023 at 04:35:47PM +0300, Serge Semin wrote:
> > Hi Andrew
> > 
> > On Wed, Dec 06, 2023 at 06:01:30PM +0100, Andrew Lunn wrote:
> > > > > You shouldn't use inline in C files, only in headers.
> > > > 
> > > > Could you please clarify why? I failed to find such requirement in the
> > > > coding style doc. Moreover there are multiple examples of using the
> > > > static-inline-ers in the C files in the kernel including the net/mdio
> > > > subsystem.
> > > 
> > 
> > > The compiler does a better job at deciding what to inline than we
> > > humans do. If you can show the compiler is doing it wrong, then we
> > > might accept them.
> > 
> > In general I would have agreed with you especially if the methods were
> > heavier than what they are:
> > static inline ptrdiff_t dw_xpcs_mmio_addr_format(int dev, int reg)
> > {               
> >         return FIELD_PREP(0x1f0000, dev) | FIELD_PREP(0xffff, reg);
> > }               
> >         
> > static inline u16 dw_xpcs_mmio_addr_page(ptrdiff_t csr)
> > {       
> >         return FIELD_GET(0x1fff00, csr);
> > }       
> > 
> > static inline ptrdiff_t dw_xpcs_mmio_addr_offset(ptrdiff_t csr)
> > {
> >         return FIELD_GET(0xff, csr);
> > }
> > 
> > > But in general, netdev does not like inline in .C
> > > file.
> > 
> > I see. I'll do as you say if you don't change your mind after my
> > reasoning below.
> > 
> > > Also, nothing in MDIO is hot path, it spends a lot of time
> > > waiting for a slow bus. So inline is likely to just bloat the code for
> > > no gain.
> > 
> > I would have been absolutely with you in this matter, if we were talking
> > about a normal MDIO bus. In this case the devices are accessed over
> > the system IO-memory. So the bus isn't that slow.
> 

> O.K, so its not slow. But how often is it used? PHYs tend to get
> polled once a second if interrupts are not used. But is the PCS also
> polled at the same time? Does this optimisation make a noticeable
> difference at once per second? Do you have a requirement that the
> system boots very very fast, and this optimisation makes a difference
> when there is heavier activity on the PCS at boot? Is the saving
> noticeable, when auto-neg takes a little over 1 second.
> 
> The best way to make your case is show real world requirements and
> benchmark results.

You do know how to well define your point.) Polling is what currently
implemented in the XPCS driver indeed. So in this case such small
optimization won't be even noticeable. Although theoretically the
IO-access could be performed on the fast paths, in the IRQ context,
but it could be relevant only if the DW XPCS device had the IRQ
feature activated on the particular platform and the DW XPCS driver
supported it. But seeing the driver currently doesn't support it and
the DW XPCS could be also found on the DW MAC SMA MDIO bus
(non-memory-mapped case), always handling IRQ in the hardware IRQ
context would be wrong. Splitting up the handlers would be
over-complication for indeed doubtful reason, since inlining those
methods won't gain significant performance even in that case. And of
course I don't have such strict requirements as you say. So I'll drop
the inline keywords then. Thank you very much for having kept
discussing the topic in order to fully clarify it for me, even though
the issue could have seemed unimportant to spend time for.

-Serge(y)

> 
> 	  Andrew
