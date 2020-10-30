Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE7129FC7D
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 05:07:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMpfm60l8zDqrV
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 15:07:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=e36JJxPt; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMpdz3bFPzDqjj
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 15:06:29 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id h19so3308256qtq.4
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 21:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oqd84UWhIpb7EjH7BB5s8DD8mBZJZOTi0wOk2bOqFAY=;
 b=e36JJxPtWqNzo0SVEfxmF+A+83fAYG6eh/GZslmzaxc4oGL6DmGMGTP2O0pZPtl+w+
 a8G4tAD2hJ6FKGhFVwdH6IUqvrteWrRRS7z89220TjPepYY3r02ucyZw5FZjlToh9ZJQ
 rMC7oxgcqCZTUaPNbha9e3YaPXVWSiVHOagMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oqd84UWhIpb7EjH7BB5s8DD8mBZJZOTi0wOk2bOqFAY=;
 b=fMhYGYdEveVso3H4r8RrTBOiOJLYEItOZrbEhsAw7nR1jBfsok+nwpnZ6hjmUz0pO/
 fM3QbNMeuhMX6dq8p2QeHQUpPbt9oZWjgnp/w8kLONuVJgg7wUJMVI7UAPim8Y8DEiSa
 8gam5WaL9mwo7IEInEqq9NcSRjJqMsXA7AiSNVWk9WfjHxt0QY38LIv+Im2aoAOzCX6l
 Qchzzm4Sy4jT60aqjvIaLwrJ8KU4bAzG7ne/wZfDVIV/+5jzDH47+M3yagibYcvSHy/Z
 HwyW9PmDsQwOo+3y1nFWfdLVed2PGkjdhiTE17gtSOscayoCAzYKW/TT8MWJ6OyzOo+m
 6gFg==
X-Gm-Message-State: AOAM531RBR+t7iS/c1J3vJ0yfm7E7i87+iJNLwAanZCS/m71Ebh5PH3b
 uN5Y0kwl1YkxVRWmseyCFMdxB4aK2JTYS5ITsXA=
X-Google-Smtp-Source: ABdhPJwdywNsSelJ9ABBagyJcTzDAI6awfhQ3rGblsSQ0qPJyJ19U86aS5mRpSwMrWF3UXdK6nA31mS6ynlNbH3s7Zg=
X-Received: by 2002:aed:3325:: with SMTP id u34mr376286qtd.263.1604030785562; 
 Thu, 29 Oct 2020 21:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201029021450.12118-1-eajames@linux.ibm.com>
In-Reply-To: <20201029021450.12118-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 30 Oct 2020 04:06:12 +0000
Message-ID: <CACPK8XdS2y5mWhmF0mxDEe+GwxBJ_CZ9n2Aa9G+MZS-grPP1bg@mail.gmail.com>
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc v2 0/3] Aspeed: Support
 eMMC boot
To: Eddie James <eajames@linux.ibm.com>
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

On Thu, 29 Oct 2020 at 02:15, Eddie James <eajames@linux.ibm.com> wrote:
>
> Add support to boot from the eMMC on AST2600 systems. Include the necessary
> devicetree entries for Tacoma and Rainier machines.
>
> Changes since v1:
>  - Update commit messages and Kconfig descriptions. Also remove the
>    unecessary SPI_SIZE config option
>
> Eddie James (3):
>   ARM: dts: Aspeed: Tacoma and Rainier: Add eMMC nodes and parameters
>   arch: ARM: Aspeed: Add SPL eMMC partition boot support
>   configs: Add AST2600 SPL eMMC configuration

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
>  arch/arm/dts/ast2600-rainier.dts           |   8 ++
>  arch/arm/dts/ast2600-tacoma.dts            |   8 ++
>  arch/arm/mach-aspeed/Kconfig               |   8 ++
>  arch/arm/mach-aspeed/ast2600/spl_boot.c    |   9 +-
>  configs/ast2600_openbmc_spl_emmc_defconfig | 130 +++++++++++++++++++++
>  include/configs/aspeed-common.h            |   6 +
>  6 files changed, 168 insertions(+), 1 deletion(-)
>  create mode 100644 configs/ast2600_openbmc_spl_emmc_defconfig
>
> --
> 2.26.2
>
