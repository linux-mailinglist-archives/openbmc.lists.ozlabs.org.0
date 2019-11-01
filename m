Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F74EC11B
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 11:09:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474Hx408frzF6dp
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 21:09:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="D6/bx9Qt"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474Hw70wG2zF6ZN;
 Fri,  1 Nov 2019 21:08:54 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id r22so2212237qtt.2;
 Fri, 01 Nov 2019 03:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dixvlRxBe1XqqJqVc1zgKXwNqGAEbJcLWXze4Juxj/A=;
 b=D6/bx9Qt4Sz4Zl1m7/iyiTMXK4O//gXhNKiXB2chqIP3aluDGN2fva+Y6wVKBDNG0P
 Li4oORgU/Hq8vdPn77G6Hk377QzmddzW+CNPZ9pO+TM2ikk2UmEM/qXJryAK1BMRT+/f
 4kl53gQeEIhRpSQ2xOi1McdZWP5sJpnLuRBcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dixvlRxBe1XqqJqVc1zgKXwNqGAEbJcLWXze4Juxj/A=;
 b=e30tgW24WFkYPwDUSOVm+eu97GbvkJtTJF+XgP7rXmE2JFuprAIVHG5ynCkuIBjyuY
 rR7uiZkT6Ox1b9nN8SvBuf4w3ApYVY64s0ja5IOBsZMx+ZJuUW6Qd3aTgQaPa03+L2eo
 eIz123RW1N6EOq30nDLC7DL9zBmhCTpofzFi6NE6geTFRomY+uWIwttVQZsNTUtKTlwV
 XHWaKbUv+KYmyLxN/SsiKB/ICmPORzlkw3cmOTtAnf3MOyG6sE2vJPon7eN3BcHEOSeJ
 HXFEz+ZL5Ze5lSkyfbB8o1AyulrnN/6aQUiqZBsq7auDVxo12RaK1ltgpzlliGA74OrH
 19Cg==
X-Gm-Message-State: APjAAAVFENcC2rBflRUX75bLvcJzOzB8R2kigyHdB22eIFCvXoJBAi1n
 0lvQzy790xjJtJvwxsRD4c6FiyVWEz57OztktB8=
X-Google-Smtp-Source: APXvYqy0Z22TcpdNer9jICrspqvBdfKr5qP78g1hshmD7TQOwlJJKb1RCeY5BVLa6y96G8jOc0taqrKjoAq9DFAyCus=
X-Received: by 2002:ac8:e03:: with SMTP id a3mr9899612qti.169.1572602929835;
 Fri, 01 Nov 2019 03:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191021194820.293556-1-taoren@fb.com>
In-Reply-To: <20191021194820.293556-1-taoren@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 1 Nov 2019 10:08:35 +0000
Message-ID: <CACPK8XcNxs5T=ZC_mRnvkOF_kqS1AvP=9PvMB6w9Fgn_XbtZQw@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: dts: aspeed: add dtsi for Facebook AST2500
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

Hi Tao,

On Mon, 21 Oct 2019 at 19:49, Tao Ren <taoren@fb.com> wrote:
>
> The patch series adds "facebook-netbmc-ast2500-common.dtsi" which defines
> devices that are common cross all Facebook AST2500 Network BMC platforms.
> The major purpose is to minimize duplicated device entries among Facebook
> Network BMC dts files.
>
> Patch #1 (of 4) adds "facebook-netbmc-ast2500-common.dtsi" file, and the
> remaining 3 patches update CMM, Minipack and Yamp device tree to consume
> the new dtsi file.

The patches look okay to me. I modified the file name to match the
convention used by other device trees in the arm directory, where it
includes the SOC name first.

I also reworded the commit messages a little.

They have been merged into the aspeed tree for submission to 5.5.

Thanks!

Joel

>
> Tao Ren (4):
>   ARM: dts: aspeed: add dtsi for Facebook AST2500 Network BMCs
>   ARM: dts: aspeed: cmm: include dtsi for common network BMC devices
>   ARM: dts: aspeed: minipack: include dtsi for common network BMC
>     devices
>   ARM: dts: aspeed: yamp: include dtsi for common network BMC devices
>
>  arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts | 66 ++++---------
>  .../boot/dts/aspeed-bmc-facebook-minipack.dts | 59 ++++--------
>  .../arm/boot/dts/aspeed-bmc-facebook-yamp.dts | 62 +-----------
>  .../dts/facebook-netbmc-ast2500-common.dtsi   | 96 +++++++++++++++++++
>  4 files changed, 136 insertions(+), 147 deletions(-)
>  create mode 100644 arch/arm/boot/dts/facebook-netbmc-ast2500-common.dtsi
>
> --
> 2.17.1
>
