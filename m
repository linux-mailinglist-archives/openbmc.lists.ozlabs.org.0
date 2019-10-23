Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E504EE1084
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 05:24:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ybM91SqpzDqQs
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 14:24:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="MqWqHWFI"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ybLS3JSwzDqPn
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 14:23:28 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id d17so15629882qto.3
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 20:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0kZAHYZAwDc0k/h6qaOo5pQDaYGECvyRtSgAFDhA/oU=;
 b=MqWqHWFIIjmkjKKXS7j9f8MoQ8kISJe2rAOC0bSrAZZHuSLcIugd1cICnPdv2lurv1
 ev7k1S1JDgmTN5L8u24DR3+bkO+JJTfcBB5YHsBJM+sq0m9he2x3xXSlnSKha/J8uRxM
 jFe5hQ+prRklmJ4kLrxbsrKK6zUneqkFi+WA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0kZAHYZAwDc0k/h6qaOo5pQDaYGECvyRtSgAFDhA/oU=;
 b=bCdaoIehkK17sR4otMG8R0uy3r0azObZQIiE/T9HLSocDthkw3c+6609gdRGVycqja
 2X/vD51vudLwxqj7rQ4a5RjxbfEMJmALkYaDhP9bBq9qOIGXLypeCcaufMNDCbtWVKJU
 /L51Bb7ksZSxKsORDabeV6ThNNOhO3SNG3JYdjKYtPGoTq1HevmEbfZlAkIMGiLcgAr4
 I6iddsAz5EelY+siUQGy14r2LhhP2l3yFeoHzphzj9BK4QYRveCyiU/j2JElrZCHuX3r
 gG2no/dJK1uPkMrY8m+NhgjgkpaT9LG1/AFmaUhlW8J/HGLK382jCyV0GYLTwfGWrxAi
 EzFg==
X-Gm-Message-State: APjAAAXGhKHhL8ApHI6i6v6UME7QGS3F1Lfa4smjHI7fKrIpSuZcIxaW
 T62hQJgIcAXCFnRM5f4x0U3ISX12cs0Vxn08udPJLhVU
X-Google-Smtp-Source: APXvYqyQBdug/Xdhvlm9ZsqCe992L5HugheReDLbp3xceT2bm6JBdl381KA4KmI/4ttpmrxxWELY5Fl82JIUbPQDDtQ=
X-Received: by 2002:ac8:1207:: with SMTP id x7mr7029839qti.255.1571801004773; 
 Tue, 22 Oct 2019 20:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20191022044737.15103-1-andrew@aj.id.au>
In-Reply-To: <20191022044737.15103-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 23 Oct 2019 03:23:12 +0000
Message-ID: <CACPK8Xf0jT0qwh-g0Z_zJb1J+WWx8Ghb9FxDsX99qKoZPNaoaQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 0/4] Pinmux fixes for AST2600 LPC
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 22 Oct 2019 at 04:46, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello,
>
> This series fixes some issues with the AST2600 pinctrl driver.
>
> Patch 1/4 backports an existing upstream fix. Patch 4/4 simply improves the
> readability of the debug output of the driver. Patches 2 and 3 fix issues with
> muxing pins for LPC, particularly for the Tacoma board.

They look good to me. I've applied them to dev-5.3

Cheers,

Joel

>
> Please review.
>
> Andrew
>
> Andrew Jeffery (4):
>   pinctrl: aspeed-g6: Make SIG_DESC_CLEAR() behave intuitively
>   pinctrl: aspeed-g6: Fix LPC/eSPI mux configuration
>   ARM: dts: tacoma: Hog LPC pinmux
>   pinctrl: aspeed: Improve debug output
>
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts |  7 +++
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c  | 56 +++++++++------------
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c     | 25 +++++++--
>  drivers/pinctrl/aspeed/pinmux-aspeed.h      |  2 +-
>  4 files changed, 54 insertions(+), 36 deletions(-)
>
> --
> 2.20.1
>
