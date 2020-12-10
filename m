Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A955C2D52AC
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 05:15:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cs0tn5nxRzDqf3
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 15:14:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=leetroy@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VPolpv6J; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cs0sv6qXzzDqSF
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 15:14:07 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id l200so4307637oig.9
 for <openbmc@lists.ozlabs.org>; Wed, 09 Dec 2020 20:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=asqlvUmn+4Vij6SsuaUO+hn0xSmqN2LWH6TaWXdnpow=;
 b=VPolpv6JtBEeHAuK9bf1icci8XAyzthCsom/Qhl9+DbeZdBWDIQ4FOvAV93M0zxNtc
 9xLQzMHFEOMPwZNm7vWWsbhcayIbKCpaD39WzF0HZ0o9Di+Zp3V9Fc+Caxd+2DOfyW7W
 RpzEQ0XQjbK8b2CgVikDNPFvlSlqiBhxyZ/6Kmq3K+gF02yUYGHk8gA2tQizawk9k6mk
 J2DPE3F0RY+bsWrDC5FpWMXgYMdg309s+ZtkAZq9/zLJaFaCEdQrQRVvoJDhjh7w8LO0
 6gaCn4l2SWomLMIO6vAQyuOosz+JoDJYy2Q4NlzoCYFRk+T/3ZQqp/yzwdpfFsxU50U3
 3sZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=asqlvUmn+4Vij6SsuaUO+hn0xSmqN2LWH6TaWXdnpow=;
 b=AEtGkI67iHkdP1Bcv1IuShRAeW9mNhN+drSJ4w6wGdHbI6CF/rdTrRzlAlOPi31gxN
 zEOHM97zs3Cm27irchTnZ4BKK5gXwWlEGe5q3FXmqkt8lOoBCZdUyk1JbpCrOvleKJg2
 5VeMO9Vf2GwEaO39imU2ahRNCcVCg4BH6dTfcsH24JSicQd2iBMLghsh3nmKlIpGJmsW
 jxqAY8/dqU2hD4OempNJSs8wZLSMGMda2hWCI2anO3Lq5qWK2THUweIdQM270wskCbWX
 d4tiZ+gRv5BnEu5VB849Uovu+83inOR75K7FOF+Pw/GuRtS8enh5SWrTiCBDiJ98jHKe
 kn1Q==
X-Gm-Message-State: AOAM531+ihrbFFyUxa8HxTCEH+AjoAOzCMtScbzZVmgR1M4rsFU6QRcz
 qtuZJPFJMcigjplcrVIk2EwTnG1vnCg/s2Wc2t0=
X-Google-Smtp-Source: ABdhPJxnpGx9ZuKaZql7QmImCh/Y4jeEQrgeBmuzP2AwBLCN9zqusd9HQYILYzXHSKvUju1UJK8vw/GU6knr/fSISj4=
X-Received: by 2002:aca:d955:: with SMTP id q82mr4206214oig.116.1607573643944; 
 Wed, 09 Dec 2020 20:14:03 -0800 (PST)
MIME-Version: 1.0
References: <20190925125610.12096-1-bradleyb@fuzziesquirrel.com>
In-Reply-To: <20190925125610.12096-1-bradleyb@fuzziesquirrel.com>
From: Troy Lee <leetroy@gmail.com>
Date: Thu, 10 Dec 2020 12:13:57 +0800
Message-ID: <CAN9Jwz34+K8KYE7LykOjUg_TOKpSFzk8d3k7QZWeNXMX6Ptnjg@mail.gmail.com>
Subject: Re: [PATCH v4 linux dev-5.3 00/10] ARM: dts: aspeed-g6 lpc, rainier
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: andrew@aj.id.au, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brad,

Will this series of patches submit to upstream?

Thanks,
Troy Lee
--
Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>


On Wed, Sep 25, 2019 at 9:00 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> > This is a quick attempt at wiring up some of the LPC bits on the
> > AST2600, and then using it on a new board, Rainier, a new POWER system
> > with an AST2600.  The only verification performed was ensuring the
> > kernel still booted and the ibt device probed using the Rainier device
> > tree atop the ast2600-evb qemu model.  Please review.
>
> Changes since v3:
>   - commit message updates
>   - align rainier reserved memory
>   - reviews, acks
>
> Changes since v2:
>   - split lpc, ipmi binding updates into separate patches
>   - split soc, ipmi, reset compatibles into separate patches
>   - moved sio_regs to separate G6 dtsi patch
>   - moved i2c and mac additions from rainier DT to separate patches
>
> Changes since v1:
>   - split DT binding docs and driver changes into separate patches.
>   - reordered rainier DT elements (alphabetized).
>   - added rainier rtc, lpc-ctl, reserved memory, mac devices
>
> Brad Bishop (10):
>   dt-bindings: aspeed-lpc: Add G6 compatible strings
>   dt-bindings: ipmi: Add aspeed-g6 compatible strings
>   soc: aspeed: lpc: Add G6 compatible strings
>   ipmi: aspeed-g6: Add compatible strings
>   reset: simple: Add AST2600 compatibility string
>   ARM: dts: aspeed-g6: Add lpc devices
>   ARM: dts: aspeed: Add Rainier system
>   ARM: dts: aspeed-g6: Expose SuperIO scratch registers
>   ARM: dts: aspeed: rainier: Add mac devices
>   ARM: dts: aspeed: rainier: Add i2c devices
>
>  .../bindings/ipmi/aspeed,ast2400-ibt-bmc.txt  |   3 +-
>  .../bindings/ipmi/aspeed-kcs-bmc.txt          |   7 +-
>  .../devicetree/bindings/mfd/aspeed-lpc.txt    |   8 +-
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  | 464 ++++++++++++++++++
>  arch/arm/boot/dts/aspeed-g6.dtsi              |  91 ++++
>  drivers/char/ipmi/bt-bmc.c                    |   1 +
>  drivers/char/ipmi/kcs_bmc_aspeed.c            |   1 +
>  drivers/reset/reset-simple.c                  |   1 +
>  drivers/soc/aspeed/aspeed-lpc-ctrl.c          |   1 +
>  drivers/soc/aspeed/aspeed-lpc-snoop.c         |   2 +
>  11 files changed, 575 insertions(+), 5 deletions(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>
> --
> 2.21.0
