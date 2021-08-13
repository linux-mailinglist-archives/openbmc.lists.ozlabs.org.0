Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AB23EAEFD
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 05:40:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gm8Ty53y3z3bW6
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 13:40:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ls+y9PAB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ls+y9PAB; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gm8TS1KVmz2yNq;
 Fri, 13 Aug 2021 13:40:27 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so18757147pjr.1; 
 Thu, 12 Aug 2021 20:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ORlrD9sl2aYo7jcRja/hxhONlCSeq5JNCCwjrBnwxHg=;
 b=ls+y9PABiM7r2XhDF6NpqmapOhuDd3WDTmTnpnP3+eOcE/KB0PBGnOMGCTwiWmCxZU
 zRtrd/D/KjHERYC7MTD8uRVfXzG2Z3HMizrjPVThbvc0Jn4mv8A/w1u2/0UmT+VeoOy4
 3QbaSEy+9SrswsB+SIEssE3V2Wai5hML/bWmUvsTYU/Exi+Oz3uilkjwqQ/pvR+VGy+L
 xEJTN4AxgeY/0UlnLApejq8ai34l4SANvij0fRnaR5wI4+AygGI1FTzF80JVv7ieaASI
 zWnHrO72pTJmD0O/WVdun7wGDUdBEF/Kctn2zoaQFwPrsJQ5o/mXLKr6pOmXC/e9NwQF
 kXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ORlrD9sl2aYo7jcRja/hxhONlCSeq5JNCCwjrBnwxHg=;
 b=jwD1sN4WMQejdWqw5p2h7yFTlhzdrwRZwqaC8DG8NQ2tfM5JT9/LC8q5EY4PNyEFhb
 ZwTmLRxQJ6Twr/r5TlvjMI1awyB2XYM4gHGaj8JR0OF4IrXu6KVTdzX6sCno0jByziqy
 ad7jb0EErwOj01X8IvX5is9WIDCU5c5F+eLFyHxOuL3BCftfEf7w1IaTdJEF7MCnFlfz
 CEeSoAf0nHzmu/cBTfooJN13e8F/N9EMorI+QIue6QNAleCPesCSrQx3bOTYFV/DET4v
 AOYV4NVdcHzzsRkyq9v7hX1sqGsOX0wfrPSY3FbuG5ostwypOQ0D4hCVZ7yug3Ze82pM
 VEEg==
X-Gm-Message-State: AOAM533g6Yc9sltfkhnzshJj44ZenEltdeSuPF/Ucu5B6K7Tm1/U5yKD
 fOaz8VoQ9UbCnF3E8WLAk1I=
X-Google-Smtp-Source: ABdhPJzhTgI45W86irveIUKBOUgK67+9nGpu3ltrKHOvKGT9EQFFV8uNZpi8CRMREa+QzJyTRGOSyg==
X-Received: by 2002:a17:902:8f90:b029:12d:1b48:efd8 with SMTP id
 z16-20020a1709028f90b029012d1b48efd8mr352319plo.23.1628826023485; 
 Thu, 12 Aug 2021 20:40:23 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-92-48-112.hsd1.ca.comcast.net.
 [73.92.48.112])
 by smtp.gmail.com with ESMTPSA id z24sm236977pjq.43.2021.08.12.20.40.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Aug 2021 20:40:23 -0700 (PDT)
Date: Thu, 12 Aug 2021 20:40:17 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 4/6] ARM: dts: aspeed: Add Facebook Cloudripper
 (AST2600) BMC
Message-ID: <20210813034016.GA21895@taoren-ubuntu-R90MNF91>
References: <20210805222818.8391-1-rentao.bupt@gmail.com>
 <20210805222818.8391-5-rentao.bupt@gmail.com>
 <CACPK8XcV5On2D4D+SXnfw1M0owwfCL4Su19jOEA7yWpq+T3jLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XcV5On2D4D+SXnfw1M0owwfCL4Su19jOEA7yWpq+T3jLw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 13, 2021 at 01:29:17AM +0000, Joel Stanley wrote:
> On Thu, 5 Aug 2021 at 22:28, <rentao.bupt@gmail.com> wrote:
> > +&mdio1 {
> > +       status = "okay";
> 
> You're enabling this but it looks like it's unused?

Thanks Joel for the careful review. The MDIO controller is not paired
with BMC MAC; instead, it's connected to the MDC/MDIO interface of the
on-board switch (whose ports are connected to BMC, Host and front panel
management port).

In other word, the MDIO controller is used, but we do need some user
space scripts to control the controller. What's your suggestion? For
example, should I add some comments to explain the purpose?


Cheers,

Tao

> 
> > +};
> > +
> > +&mdio3 {
> > +       status = "okay";
> > +
> > +       ethphy1: ethernet-phy@13 {
> > +               compatible = "ethernet-phy-ieee802.3-c22";
> > +               reg = <0x0d>;
> > +       };
> > +};
> > +
> > +&mac3 {
> > +       status = "okay";
> > +       phy-mode = "rgmii";
> > +       phy-handle = <&ethphy1>;
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&pinctrl_rgmii4_default>;
> > +};
