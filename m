Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F172A224C
	for <lists+openbmc@lfdr.de>; Mon,  2 Nov 2020 00:15:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPX356Wn9zDqZW
	for <lists+openbmc@lfdr.de>; Mon,  2 Nov 2020 10:15:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=lScH92/c; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPX2H2jpFzDqG8
 for <openbmc@lists.ozlabs.org>; Mon,  2 Nov 2020 10:15:02 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id p12so796453qtp.7
 for <openbmc@lists.ozlabs.org>; Sun, 01 Nov 2020 15:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KeaL4BqkA45Dbrs5cCkbrW9Oysm4Ne5i5QjrRcTbl4o=;
 b=lScH92/cSh6+wAZPoUpiV+vC8ZR4SrhLhVA7DAK9jNcYBPqRw9ZHy9RpmdcYXOfkgw
 BvBIafkOkLMjD97TtDmS0WOQbeMB0XkFxziAqfafTLrhWf5YlXGyuzlY2HodpzMlrv9n
 XGE0yzpqDd/VM0JUWmFgAraDXaopsYjbjNR1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KeaL4BqkA45Dbrs5cCkbrW9Oysm4Ne5i5QjrRcTbl4o=;
 b=SzU6VHC4A/d6UJz+7XzWbeLCG5ZnqKUobthAG+SE7HcTl0A8SSEb1JRbJ0x8rUCQcp
 UIxhUgqG2kRZRbvqajEhiXjcyyq0DGepYaEBSuHTveHpXjxzrM4f/mUcKSJK9Mdhwo+i
 M7+YLPkQBBLyPaf0dKNHNIAo7IVV/oikCxAeMPAqO/FhaKaOLnU3qAmRCpQQm/kZVazz
 TSNHHk2y3Ni9d5DD4tCvRIsW9o0JwQbSoK02wmj3iT7qgGC4QxzMK8EKPLVF/qCh6vcU
 ATAuzQHrt+noL9nSJf35MSc+j8aN6J45qnO0Cuvtxb52369+wVcIx1k/S+tfTqTzJIop
 DMbg==
X-Gm-Message-State: AOAM531gX44qLyR4lSspWR8a9BkMfthyGUTNdbn0uB0yYT1BgWasF9gg
 ijdSL9r0tGtBcKLnrVWdpf2vGDfBHuL+YNfLtnI=
X-Google-Smtp-Source: ABdhPJxGuvCMgJjtLdQPJ2dYLzcuEW8wXPE03tCVs8UIY8bbFUvesiYo7o6z5LYz+gFYyU9QXcjY2F2R5L8V0YxK96g=
X-Received: by 2002:aed:3325:: with SMTP id u34mr12307155qtd.263.1604272499082; 
 Sun, 01 Nov 2020 15:14:59 -0800 (PST)
MIME-Version: 1.0
References: <20201028185647.14565-1-eajames@linux.ibm.com>
 <CACPK8XfmYy3+Z3Mzn3s=AuWbOt9UwrQ6-BDKndq=rhUdn-UUzg@mail.gmail.com>
 <5d230deb-8c8b-01b7-95b0-45e1f25dfd8e@linux.ibm.com>
In-Reply-To: <5d230deb-8c8b-01b7-95b0-45e1f25dfd8e@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 1 Nov 2020 23:14:46 +0000
Message-ID: <CACPK8XfrGiJUctpr3MaX1t88oB52KznpbONtrJxWVrJoud2Tfw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v3] ARM: dts: Aspeed: Rainier: Add 4U
 device-tree
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

On Fri, 30 Oct 2020 at 13:51, Eddie James <eajames@linux.ibm.com> wrote:
>
>
> On 10/29/20 11:14 PM, Joel Stanley wrote:
> > Hi Eddie,
> >
> > On Wed, 28 Oct 2020 at 18:56, Eddie James <eajames@linux.ibm.com> wrote:
> >> Add a device-tree for the Rainier 4U system. Change the model name
> >> on the existing Rainier device-tree to 2U, and remove the two
> >> extra power supplies that are only present on the 4U system. Also
> >> add labels to the fan nodes for use in the 4U device-tree.
> >>
> >> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> >> ---
> >> Changes since v2:
> >>   - Just reference individual fan nodes rather than the whole fan
> >>     controller
> >>
> >> Changes since v1:
> >>   - Don't rename the 2U dts
> >>   - Include the 2U dts from the 4U and make the necessary Changes
> >>
> >>   arch/arm/boot/dts/Makefile                    |  1 +
> >>   .../boot/dts/aspeed-bmc-ibm-rainier-4u.dts    | 37 +++++++++++++++++++
> >>   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  | 20 +++-------
> >>   3 files changed, 43 insertions(+), 15 deletions(-)
> >>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
> >>
> >> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> >> index 7e4d3600e16d..9a2ab5e6e924 100644
> >> --- a/arch/arm/boot/dts/Makefile
> >> +++ b/arch/arm/boot/dts/Makefile
> >> @@ -1360,6 +1360,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
> >>          aspeed-bmc-facebook-yamp.dtb \
> >>          aspeed-bmc-facebook-yosemitev2.dtb \
> >>          aspeed-bmc-ibm-rainier.dtb \
> >> +       aspeed-bmc-ibm-rainier-4u.dtb \
> >>          aspeed-bmc-intel-s2600wf.dtb \
> >>          aspeed-bmc-inspur-fp5280g2.dtb \
> >>          aspeed-bmc-lenovo-hr630.dtb \
> >> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
> >> new file mode 100644
> >> index 000000000000..9c35ac1d19a6
> >> --- /dev/null
> >> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
> >> @@ -0,0 +1,37 @@
> >> +// SPDX-License-Identifier: GPL-2.0-or-later
> >> +// Copyright 2020 IBM Corp.
> >> +/dts-v1/;
> >> +
> >> +#include "aspeed-bmc-ibm-rainier-4u.dts"
> > Did you test this patch?
>
>
> Yes, Rainier hardware BMC booted to Ready state. I suspect it wouldn't
> power on properly due to bad fan configuration though, so I didn't try
> that. DTS looked good under /sys/firmware though.

Are you sure? The version of the patch you posted here doesn't compile.

>
>
> Thanks,
>
> Eddie
>
>
> >
> >> +
> >> +/ {
> >> +       model = "Rainier 4U";
> >> +};
> >> +
> >> +&i2c3 {
> >> +       power-supply@6a {
> >> +               compatible = "ibm,cffps";
> >> +               reg = <0x6a>;
> >> +       };
> >> +
> >> +       power-supply@6b {
> >> +               compatible = "ibm,cffps";
> >> +               reg = <0x6b>;
> >> +       };
> >> +};
> >> +
> >> +&fan0 {
> >> +       tach-pulses = <4>;
> >> +};
> >> +
> >> +&fan1 {
> >> +       tach-pulses = <4>;
> >> +};
> >> +
> >> +&fan2 {
> >> +       tach-pulses = <4>;
> >> +};
> >> +
> >> +&fan3 {
> >> +       tach-pulses = <4>;
> >> +};
> >> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> >> index 183e1a4dcc65..676ae5602fb9 100644
> >> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> >> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> >> @@ -8,7 +8,7 @@
> >>   #include <dt-bindings/leds/leds-pca955x.h>
> >>
> >>   / {
> >> -       model = "Rainier";
> >> +       model = "Rainier 2U";
> >>          compatible = "ibm,rainier-bmc", "aspeed,ast2600";
> >>
> >>          aliases {
> >> @@ -646,16 +646,6 @@ power-supply@69 {
> >>                  compatible = "ibm,cffps";
> >>                  reg = <0x69>;
> >>          };
> >> -
> >> -       power-supply@6a {
> >> -               compatible = "ibm,cffps";
> >> -               reg = <0x6a>;
> >> -       };
> >> -
> >> -       power-supply@6b {
> >> -               compatible = "ibm,cffps";
> >> -               reg = <0x6b>;
> >> -       };
> >>   };
> >>
> >>   &i2c4 {
> >> @@ -775,25 +765,25 @@ max31785@52 {
> >>                  #address-cells = <1>;
> >>                  #size-cells = <0>;
> >>
> >> -               fan@0 {
> >> +               fan0: fan@0 {
> >>                          compatible = "pmbus-fan";
> >>                          reg = <0>;
> >>                          tach-pulses = <2>;
> >>                  };
> >>
> >> -               fan@1 {
> >> +               fan1: fan@1 {
> >>                          compatible = "pmbus-fan";
> >>                          reg = <1>;
> >>                          tach-pulses = <2>;
> >>                  };
> >>
> >> -               fan@2 {
> >> +               fan2: fan@2 {
> >>                          compatible = "pmbus-fan";
> >>                          reg = <2>;
> >>                          tach-pulses = <2>;
> >>                  };
> >>
> >> -               fan@3 {
> >> +               fan3: fan@3 {
> >>                          compatible = "pmbus-fan";
> >>                          reg = <3>;
> >>                          tach-pulses = <2>;
> >> --
> >> 2.26.2
> >>
