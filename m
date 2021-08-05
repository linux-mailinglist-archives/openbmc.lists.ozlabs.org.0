Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ACB3E0B2B
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 02:28:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gg8bk6YTxz3cLP
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 10:28:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Rqj/92pI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Rqj/92pI; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gg8bQ6FGMz307n;
 Thu,  5 Aug 2021 10:28:17 +1000 (AEST)
Received: by mail-qv1-xf33.google.com with SMTP id s11so2065596qvz.7;
 Wed, 04 Aug 2021 17:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=85EvoyF8sgX3fo5G/7KMRYWhF+AF9WMLCT8s7y5Motg=;
 b=Rqj/92pIppN0j21zFFv/ZRJElRbvEQvHxNgvayCgArb08CLlDUYohH3nAwEmGwolR8
 a1/i+Tg16I495RwEUvJ6+Fh4QVEPAWvLll26dioN98QTeVIMU5KL5jf7nByc27WOK1Pa
 /MsgAj8PWR5tqe0WZAL+zZqdK/TO7VPtkMhpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=85EvoyF8sgX3fo5G/7KMRYWhF+AF9WMLCT8s7y5Motg=;
 b=MyuwZ2tjZHbRWH9db49uW1NJOcjJQcQl+53mU+9iCwLNasKiIgXuZKk3dMNxBL44VV
 NGkt/k5NBZFZfbk8LNxxvQ/PIKR1CchbSKWvbPPIGFtJDWZVssOqG7GR1w6wdPbVVFgQ
 RT3f/rsKfWNSacoIp14igY3aqYgX0Drkeht9zGeQTADUZY0rqIz/WvpplKRI0EL9zv+y
 u7rwQz52ydSEwRPnWk37VtO8o0RstgOu9zqP0l86y2qcmUbuyePYev7ht0Kox5sKakrk
 wx020O87OUIwjhSkHVyCiyhIvi5uqSe2VN5MJBTedvyNi8BD3jlfSd0mJ0seMu7k/+fg
 lXGA==
X-Gm-Message-State: AOAM530+HEaCE3sIGupLP6G0iX72ht7iuu/KN3zcdwH6RWgt6I7xO4J1
 Y67XePtqxJ69Zhwu68R5swYvT0++xImqXF/87vk=
X-Google-Smtp-Source: ABdhPJww7LJdzb06f2Udu9LJKPCc1Py0jjXliEKq33sYs6ve+28Ynzwdc+kNW6i2SKb7dXjGxX4MuK8sqhnyMW6PiLY=
X-Received: by 2002:a05:6214:501d:: with SMTP id
 jo29mr2305844qvb.43.1628123294137; 
 Wed, 04 Aug 2021 17:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210728233755.17963-1-rentao.bupt@gmail.com>
 <20210728233755.17963-7-rentao.bupt@gmail.com>
In-Reply-To: <20210728233755.17963-7-rentao.bupt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 5 Aug 2021 00:28:02 +0000
Message-ID: <CACPK8XemZkV7nK_b4883DN+dJKhL=tXfqK6=DpHQe=fZRu_ETQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] ARM: dts: aspeed: Add Facebook Fuji (AST2600) BMC
To: Tao Ren <rentao.bupt@gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 28 Jul 2021 at 23:38, <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> Add initial version of device tree for Facebook Fuji (AST2600) BMC.

I like to read what kind of platform the BMC is going into if you can
add that detail, but it's not essential.

> +&spi1 {
> +       status = "okay";
> +
> +       /*
> +        * Customize spi1 flash memory size to 32MB (maximum flash size on
> +        * the bus) to save vmalloc space.
> +        */
> +       reg = < 0x1e630000 0xc4
> +               0x30000000 0x2000000 >;

Which driver supports this?

It would be great to see Facebook work to get the SPI NOR driver for
the ast2600 merged to mainline.

I doubt the IBM team will get to this, as we are using eMMC instead.

> +
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "spi1.0";
> +               spi-max-frequency = <5000000>;
> +
> +               partitions {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       flash1@0 {
> +                               reg = <0x0 0x2000000>;
> +                               label = "system-flash";
> +                       };
> +               };
> +       };
> +};

> +&ehci1 {
> +       status = "okay";
> +};

Have you verified that USB works with mainline? I've had reports of it
working on 5.8 but it seems to have regressed as of v5.10.


> +&mdio1 {
> +       status = "okay";
> +
> +       ethphy3: ethernet-phy@13 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <0x0d>;
> +       };
> +};
> +
> +&mac3 {
> +       phy-handle = <&ethphy3>;

status = okay?

You should specify the pinmux too I think, even if the default happens
to work, so that other devices cannot claim the pins.

Cheers,

Joel
