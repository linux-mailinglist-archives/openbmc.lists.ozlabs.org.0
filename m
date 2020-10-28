Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D4B29CDD2
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 05:29:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLbF75rcwzDqCB
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 15:29:15 +1100 (AEDT)
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
 header.s=google header.b=TzzJa8RL; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLbDR1wQhzDqLF
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 15:28:39 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id h12so2749652qtu.1
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 21:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G6pnUbbaoemfmkFnHkRcb03dKaq1YZh2o3StUiNgftM=;
 b=TzzJa8RLwOgWv0RqtK7I+RmIZAuNa/T0APQAAtM/9hnNN7cT71eFMIzpY3WAPr1h5S
 WsKDW3qJw5fMS1HrKM1GZwZmBf97tUOdh1jG9jfFgSfBVtcRqysWh6QYnkPio+mAgKEc
 bAGglZLpQDTWOCk9TvK1G1YdNVGpHhYLqNm4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G6pnUbbaoemfmkFnHkRcb03dKaq1YZh2o3StUiNgftM=;
 b=DdKaC3Jtk+ajvYUXMOSHcw/8re1JGNfLtCaBC37ierZ90ajAdLkWcaOZ/8TrNQo1ZU
 GM6xzRMfSNUsdtW5b7hEcAcMNwxCzs819QXDWBYwQkMgUjSYNziVRiGEtb0EQ/mFMw7D
 mP9mFCDrCSCW8EQagg0/+iJ0OhaT3p8tWKVtVfnrmpRlTh9mHrjffQgFoCX+hLJhoTJ0
 i6ksiHB+UuRxQrAAxHf1BhHChZptHiVij42HcP2AXJ01XiAjcyfUqWMZ/2i8JtKv8Rdq
 jIATO7WnlMfrpUFxqjtKd0gNBGuXKGVd6cjHleNAj1obTXC2H+9CWTq1dXEFO3FeGL1M
 GeVQ==
X-Gm-Message-State: AOAM5305hppB6uiee6WkbHncDU8WQLdwd1O+bphD0V2u7ZkM4j1/BrFd
 hRor0rOpl9+thkTsZ7DLWRlRYVyzIHBl2Kvhdb6QARHr
X-Google-Smtp-Source: ABdhPJwvxlXHmUXwnArCRJXzghI8S/I984LAO3a1jDZhe4rGpWn8PdjV34uHyzejwInbk9auLcxRzWQlLa3B30CaiSA=
X-Received: by 2002:ac8:5c03:: with SMTP id i3mr5477313qti.363.1603859317242; 
 Tue, 27 Oct 2020 21:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200928202753.58351-1-eajames@linux.ibm.com>
 <20200928202753.58351-3-eajames@linux.ibm.com>
 <CACPK8XcSTJ6tYSqUv=SX+x6uT7O59MBGoyxmbHn1ddCcqO6u6w@mail.gmail.com>
 <6acea8b3-64ad-e377-0c93-9a1738a56119@linux.ibm.com>
In-Reply-To: <6acea8b3-64ad-e377-0c93-9a1738a56119@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Oct 2020 04:28:25 +0000
Message-ID: <CACPK8Xc64obxGzWoWefAheRC-tSU=KSg4RzV7kyfY5cs2FUZcw@mail.gmail.com>
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 2/3] arch: ARM: Aspeed: Add
 SPL eMMC partition boot support
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

On Mon, 12 Oct 2020 at 13:34, Eddie James <eajames@linux.ibm.com> wrote:
>
>
> On 10/8/20 10:41 PM, Joel Stanley wrote:
> > On Mon, 28 Sep 2020 at 20:28, Eddie James <eajames@linux.ibm.com> wrote:
> >> Support loading U-Boot from a specific partition on the eMMC
> >> device.
> >>
> >> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> >> ---
> >>   arch/arm/mach-aspeed/Kconfig            | 7 +++++++
> >>   arch/arm/mach-aspeed/ast2600/spl_boot.c | 9 ++++++++-
> >>   2 files changed, 15 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
> >> index 06f14f4f55..0e3bb841d0 100644
> >> --- a/arch/arm/mach-aspeed/Kconfig
> >> +++ b/arch/arm/mach-aspeed/Kconfig
> >> @@ -90,6 +90,13 @@ config ASPEED_UBOOT_MMC_BASE
> >>            The base block number of the U-Boot
> >>            image in the eMMC device
> >>
> >> +config ASPEED_UBOOT_MMC_PART
> >> +       int "U-Boot eMMC partition"
> >> +       default 0
> >> +       help
> >> +         The partition number of the U-Boot
> >> +         image in the eMMC device
> > To clarify, it's the partition number in the user area of the eMMC
> > device? (and not the eMMC partition).
>
>
> Ah, no it is the eMMC partition, where 0 is user data, 1 is boot
> partition 0, and 2 is boot partition 1.

Can you update your patch to make that clear?
