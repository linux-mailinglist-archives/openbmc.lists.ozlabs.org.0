Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2589DEC126
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 11:13:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474J141f02zF6Hs
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 21:13:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="DrBwmdA2"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474J0B37MVzF5MD;
 Fri,  1 Nov 2019 21:12:26 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id 71so10169869qkl.0;
 Fri, 01 Nov 2019 03:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ND8y/KAJEHxe8vYu6nFNiGmvLZloLNx/Qhcmj2riyfs=;
 b=DrBwmdA2hyuypUMdqsxgKAPOBwvzb/c3z7uksP87rq82GzxeMEHhvZFCbdACHdfw8N
 vjkd6BctJNzkmDNGqy5YoXmnCNryXR+Cq3mWpEqQz0/vV6JZZg/cExsisJWSnJ5c3vig
 rwnuKfQ2s4VZLHbJovbnP2amAl6xDURhPW/7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ND8y/KAJEHxe8vYu6nFNiGmvLZloLNx/Qhcmj2riyfs=;
 b=hjpRmsyCnUYcDaj9dmY7jD+/DKkig4p3gUl1lYsyHcz8iaJzhk909uZbr2qPmYS7zS
 Gl8lUdz07PBxRY1Y42TdM94y9JOyvOwisIpF4VWJ+qxaSGK81N7wdtDUoY58PT8/2Psz
 6o9zuKgygutantmgZPrKaHAx6Q0/2WNpoXnYqtR7P0HNin6uJ/nt6ImLMu/NV5Cp/4I/
 Nc1xCyfJDLRd+7ZMJZIxnoOqampxumnSYyY+nTCADjXGk614uPkJLBLeZipVm1etsw/M
 2T0Gp1Xdpd88RjVqOc3pdZl9j2ABRxvMr95YFrko6BdZc+tFDacTPq6fv6g0KlfZ4Wkt
 86JA==
X-Gm-Message-State: APjAAAXSxPbXBygasYBeDnFKjZHaFQZuOudg2qUQqGqQnbjDmcK/aKKa
 B47eInc5BQoiKIPOGhDQjqW+th1FGydXd88vp18=
X-Google-Smtp-Source: APXvYqwoU1k7FEmT61Ivo0VZaveC+nWADRFHlsA0BlwLNyI+e6RuAdTXAbMLTDbS33RCVwVgM/jm6sohxZSvu01ohA8=
X-Received: by 2002:a37:5fc1:: with SMTP id t184mr2349520qkb.171.1572603142333; 
 Fri, 01 Nov 2019 03:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20191021194820.293556-1-taoren@fb.com>
 <20191021194820.293556-2-taoren@fb.com>
In-Reply-To: <20191021194820.293556-2-taoren@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 1 Nov 2019 10:12:10 +0000
Message-ID: <CACPK8XfebA9PcpyWkofCJ5fAZ9ddUjQ4ZeCf73KXb51+k_+N1Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: aspeed: add dtsi for Facebook AST2500
 Network BMCs
To: Tao Ren <taoren@fb.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 21 Oct 2019 at 19:49, Tao Ren <taoren@fb.com> wrote:
>
> Introduce "facebook-netbmc-ast2500-common.dtsi" which is included by all
> Facebook AST2500 Network BMC platforms. The major purpose is to minimize
> duplicated device entries cross Facebook Network BMC dts files.
>

> +
> +&mac1 {
> +       status = "okay";
> +       no-hw-checksum;

Was this included to work around the IPv6 issue that Benh recently fixed?

If you can test your platform with
88824e3bf29a2fcacfd9ebbfe03063649f0f3254 applied and the
no-hw-checksum property removed, please send a follow up to remove
this property.

It's not doing any harm, but by cleaning it up there's less chance
others blindly copy the same thing.

Thanks,

Joel

> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
