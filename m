Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6874045D0
	for <lists+openbmc@lfdr.de>; Thu,  9 Sep 2021 08:53:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4qT768jXz2yJv
	for <lists+openbmc@lfdr.de>; Thu,  9 Sep 2021 16:52:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=gyFgjz4/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::236;
 helo=mail-oi1-x236.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=gyFgjz4/; dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4qSd4PBmz2xr3
 for <openbmc@lists.ozlabs.org>; Thu,  9 Sep 2021 16:52:31 +1000 (AEST)
Received: by mail-oi1-x236.google.com with SMTP id s20so1304141oiw.3
 for <openbmc@lists.ozlabs.org>; Wed, 08 Sep 2021 23:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n/dbtsQItzFXG3VUtr5tpCtogf60jhbRfY1HqI+6zeg=;
 b=gyFgjz4/3LjQCakqfOSTVUCjrvKZcjbZHuTwspXxUdu8JCq0c29GPSXdlOJKg8kEX/
 whefJmwhR4dTsN+4Gtszow3uSHaLa5N4E7aWgjz+fNO0IEHOy7H0M4nx65A/RsyTaZOd
 bFa5if1a/nFRzVskAHrouMI9W4Vnu7ZFnuBB87FdKR5L0hsBQlzU0YTb2e3JofdAJqy1
 byh6cJb/po6bcwbieRkpagopbAf7WGXNJVdA8iTq3Q3KX+yphpw35xa2wVt9WnPNA9xT
 i4CI2w7tN6MPiCB+aeM+VQefMXj5aKzAEQSX6vvBYMNa7rfqiB2GgaLjhYbOhkOVqtET
 o5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n/dbtsQItzFXG3VUtr5tpCtogf60jhbRfY1HqI+6zeg=;
 b=p9hoWhXlAUO90JsyH8FHL2danjL5WqAn9MuUTGL3Ek6dWVHMcrfRe5OyWzjiywiTJt
 E/Ct+NLFwNlgSHoccrcMY+iKkKVs94jdK2gwP64mmVWvgtge8xctyV3EwiuTbOcm18/r
 JdnyUYTwQGoMVhWqL4CnRFL3hc0PPC5i3PQgwvU1y/H3MPO3J1f5U4TlhGzQ9PgC3Xyq
 MPHdZpYLA3FhbIQDcCEBF5Y/0Br3KN7Umn58RvfPUrK/HH6RVMNOXtz3kHhvIz5Frh3O
 KPJ06mOVN2Wb4Fe0CkBZ/I5y7ALKwT9aSGhUYsCoXjNd4O2UtkXEqtXzsdraCLWR8pCo
 kskQ==
X-Gm-Message-State: AOAM532DZ1+F4M7CYcU2D0QPx0Of6rd7NpJUrm/eGw1NIrE3lVJS4s9F
 b7TNokGTgwPL6v80JSdbf9bk+eL2KWUS0UEWtgDPCg==
X-Google-Smtp-Source: ABdhPJxYlOZA1Z3SpX9pxnUob+P/iJhoYZcvVtQEHgSSu3BJmDqo3PtVCpNE/CpESGExUkz55CWZKfuAz539Xbp3cZY=
X-Received: by 2002:a05:6808:1294:: with SMTP id
 a20mr962310oiw.4.1631170348266; 
 Wed, 08 Sep 2021 23:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210902021817.17506-1-chiawei_wang@aspeedtech.com>
In-Reply-To: <20210902021817.17506-1-chiawei_wang@aspeedtech.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 9 Sep 2021 14:52:17 +0800
Message-ID: <CAGm54UERFkOLXtG3wwL9x1-HAXjmRoaG4ZRbZZOLjP1bLZ=LSg@mail.gmail.com>
Subject: Re: [External] [PATCH v2 0/3] arm: aspeed: Add UART routing support
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
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
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc <openbmc@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 lee.jones@linaro.org, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, Oskar Senft <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The patches are tested on meta-g220a build and it works fine with some
changes in the sysfs path[1].

Tested-by: Lei YU <yulei.sh@bytedance.com>

[1]: https://github.com/openbmc/meta-bytedance/blob/master/meta-g220a/recipes-phosphor/console/obmc-console/obmc-console%40.service#L7-L10

On Thu, Sep 2, 2021 at 10:20 AM Chia-Wei Wang
<chiawei_wang@aspeedtech.com> wrote:
>
> Add UART routing driver and the device tree nodes.
>
> v2:
>  - Add dt-bindings
>  - Add ABI documents for the exported sysfs interface
>  - Revise driver implementation suggested by Joel
>
> Chia-Wei Wang (3):
>   dt-bindings: aspeed-lpc: Add UART routing compatible string
>   soc: aspeed: Add UART routing support
>   ARM: dts: aspeed: Add uart routing to device tree
>
>  .../testing/sysfs-driver-aspeed-uart-routing  |  15 +
>  .../devicetree/bindings/mfd/aspeed-lpc.txt    |  22 +
>  arch/arm/boot/dts/aspeed-g5.dtsi              |   6 +
>  arch/arm/boot/dts/aspeed-g6.dtsi              |   6 +
>  drivers/soc/aspeed/Kconfig                    |  10 +
>  drivers/soc/aspeed/Makefile                   |   9 +-
>  drivers/soc/aspeed/aspeed-uart-routing.c      | 601 ++++++++++++++++++
>  7 files changed, 665 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
>  create mode 100644 drivers/soc/aspeed/aspeed-uart-routing.c
>
> --
> 2.17.1
>


-- 
BRs,
Lei YU
