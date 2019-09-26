Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F156BBEDB4
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 10:47:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46f7pF0qQ0zDqn1
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 18:47:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ahRVXwpL"; 
 dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46f7ng4YyGzDqjj
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 18:46:29 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id 3so1902345qta.1
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 01:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lWSMMY2YK4l+JulpK2eAnXP9TVL9iUhs++1nHL6TLbA=;
 b=ahRVXwpLt9stxncRvYpN92RrR6UDUI9ZlvN05SaONhg07rdTQl9NyI2pzzrQj8mFjO
 0v4f56SX592yzY2qZLZkKrhFfkUUf7pRpLMPX6Xih9sNgc56PNark+It6SKu36tytVrK
 ULMMW4TKvOgJJQkcG47X+941uXHhh3mpvANXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lWSMMY2YK4l+JulpK2eAnXP9TVL9iUhs++1nHL6TLbA=;
 b=evzBJ2nDH7nNvzm9Htyg1BET9dbA1GMO0VMJUm2YpDSstgPea7y6+8nhfDuQtTJPPN
 WXhuxCc/NJn7InVTPR3sLDVsc10NKsB8BTeCv8Hve/qYw8VHX+Ka6W2Zt97L2ncxRf6K
 OC53VImfwHwzEFJlMa7oKIIHoApst7BLKhpjgxOfU6UCENLbT5ZA8yaCc88DE/UdbQIa
 1dfSGbARqCX2LadRffVWl8KYxuJMXq4ZWQgj9z0SsxYbOKzsY1tz6Z6Ry3JXUarfUrWe
 RK2rNDhv6Gx3HLrQj8gUMw3Tr3dOPvd2JS/k3oiGP8zTO2FoxliWeevxQRumnW4LM0Ni
 H32Q==
X-Gm-Message-State: APjAAAXopPWttKEIzt/AP/F94dQ9Ct3a9JfQCm7Qc6H3CVZHrWZExIjE
 mbDT6s/cNjzBXqoRbqsNywz1CL13SoIQ7a0mjwg=
X-Google-Smtp-Source: APXvYqxFtbaikjuwRz0/eA/1a4y+9siwW2tjqRB8LDYCciBSe6D1ulcsgrkXDy1rDhVjxTmRXH8qP7GMak83P1p/9YU=
X-Received: by 2002:ac8:2d8b:: with SMTP id p11mr2743075qta.220.1569487586327; 
 Thu, 26 Sep 2019 01:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <1569414398-180553-1-git-send-email-tmaimon77@gmail.com>
In-Reply-To: <1569414398-180553-1-git-send-email-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Sep 2019 08:46:14 +0000
Message-ID: <CACPK8Xfx03hNyw+8gdUh6vhdD01aB1a4NZvkLT9vPouzJaTeyg@mail.gmail.com>
Subject: Re: [linux dev-5.3 v2] arm: dts: add NPCM7xx RunBMC Olympus Quanta
 device tree
To: Tomer Maimon <tmaimon77@gmail.com>
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

On Wed, 25 Sep 2019 at 12:26, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add Nuvoton NPCM7xx RunBMC Olympus Quanta board
> device tree.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Thanks Tomer, I've applied this to dev-5.3. Please test it when you
get a chance as I do not have access to RunBMC hardware.

There's some warnings that are produced if you're using a recent
device tree compiler version:

$ dtc --version
Version: DTC 1.5.0

  DTC     arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dtb
../arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts:428.6-25:
Warning (i2c_bus_reg):
/ahb/apb/i2c@85000/i2c-slave-mqueue@40000010:reg: I2C address must be
less than 10-bits, got "0x40000010"
../arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:222.22-231.5: Warning
(spi_bus_bridge): /ahb/fiu@fb000000: node name for SPI buses should be
'spi'
  also defined at
../arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts:134.22-195.5
../arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:233.22-244.5: Warning
(spi_bus_bridge): /ahb/fiu@c0000000: node name for SPI buses should be
'spi'
  also defined at
../arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts:197.22-220.5
arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dtb: Warning
(spi_bus_reg): Failed prerequisite 'spi_bus_bridge'

If you could send a follow up patch that fixes this that would be great.

Cheers,

Joel
