Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8441D33827E
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:37:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxRjt3sRXz3cWb
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:37:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=X/HfUFSC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=X/HfUFSC; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxRjg1sSjz2xZt
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:37:43 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id 130so22672723qkh.11
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 16:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iX3aF5Mn3G6+TJGzFtX6/jBzUi9WYwYJc6gdIjVWitI=;
 b=X/HfUFSCRu0Qgw31GLxpHrJ9ePMNMMKsZHpr/3G4XYZxb/Iox0ANNcoHfQ1Q1Ufwtn
 vKrlUcDY4W1bPQ7g4zREkLwY+daaoTx7q9pbawwBaKh7qSaW8lfXCv5/Caa+vW6sPo61
 RUqtkZJHoaaRpTw0xkHyOtPIgOCFOsEGdBi9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iX3aF5Mn3G6+TJGzFtX6/jBzUi9WYwYJc6gdIjVWitI=;
 b=o/SuVPw2tk3g2lnbuZlpu6BkVsmePQJWqMznUmLI7d0fBQxsG0prZi2e2Dh4EbE3Fl
 TJLv9EYz5Ve+pMFAKhvM3GsAGaNpFW3e4obrDRX112k8H3+LvCp+tjf7rsnIn0PCc5Yh
 RAS76Ag2hJCtIMJUPnHMsGGA/2FlQwODrsC3gZxSReyPpl3TJSFpr859jxBKwnMNbfyw
 6yTuxI4BKVHgK9juMBYaH5lLF8gaa8MYgRpwayC7WJFP9lxSujsuGb799gwx3UewduS6
 usXsYgya6Mx++cwv2g8YCA5jRpPwnivhj1pqIO/7/bkDx+dx0mQ7RB+4YkkVqTeyswFg
 E/Ew==
X-Gm-Message-State: AOAM53064q8SFoa89neotpu580AotBhqvMoMRGU8LcGcmm0HQTPnzQv/
 7/ERIBKrT1/FDhVbD9Gpm6ahVnVn6FICo+LcwjY=
X-Google-Smtp-Source: ABdhPJw1ywUYMcQe/rHz25f9keM0juxWqqB2yG5hGsU8TfQMhxJZq4utP3VKynSiE8CrmlL+dxfkmoRpw4+U5ScbNcA=
X-Received: by 2002:a05:620a:1410:: with SMTP id
 d16mr10453775qkj.465.1615509459901; 
 Thu, 11 Mar 2021 16:37:39 -0800 (PST)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
In-Reply-To: <20210308225419.46530-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:37:27 +0000
Message-ID: <CACPK8XfsXcPqbnsv4Oc7C=FQPNvwyNP0P71czfqWhUv4hzyOqg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 00/35] Rainier and Everest system updates
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

Hi Eddie,

On Mon, 8 Mar 2021 at 22:54, Eddie James <eajames@linux.ibm.com> wrote:
>
> This lengthy series updates device trees and drivers for the AST2600
> systems Rainier and Everest.

This is an unrelated collection of changes that really shouldn't be
submitted as a single patchset.

Please consider my suggestion for a common rainier/everest device tree
and re-submit those changes.

I've merged the changes that I have added reviewed-by tags to, and
backported the pmbus change.

For future revisions please consider sending the patches to mainline
for review and integration. We can then apply them to the openbmc
tree.

Cheers,

Joel



>
> Patches 1-12 update the Rainier device tree. These changes are well
> tested.
> Patches 13-15 provide some eMMC improvements.
> Patch 16 fixes an observed problem on the Tacoma system.
> Patches 17-24 update the Everest device tree. These changes are
> somewhat tested in simulation and minimally tested on hardware.
> Patch 25 adds device trees for the second version of the Rainier
> BMC board.
> Patches 26-35 are device driver fixes and improvments. Some have
> already been accepted in linux-next.
>
> Alpana Kumari (3):
>   ARM: dts: aspeed: rainier: Add presence GPIOs
>   ARM: dts: aspeed: everest: GPIOs support
>   ARM: dts: aspeed: rainier: Support pass 2 planar
>
> Andrew Jeffery (8):
>   dt: bindings: mmc: Add phase control properties for the Aspeed SDHCI
>   mmc: sdhci: aspeed: Expose data sample phase delay tuning
>   ARM: dts: aspeed: tacoma: Add data sample phase delay for eMMC
>   i2c: Allow throttling of transfers to client devices
>   pmbus: (ucd9000) Throttle SMBus transfers to avoid poor behaviour
>   pmbus: (core) Add a one-shot retry in pmbus_set_page()
>   pmbus: (max31785) Add a local pmbus_set_page() implementation
>   pmbus: (max31785) Retry enabling fans after writing MFR_FAN_CONFIG
>
> Brandon Wyman (2):
>   ARM: dts: aspeed: rainier: Add gpio-keys-polled for fans
>   ARM: dts: aspeed: everest: Add power supply i2c devices
>
> Dylan Hung (1):
>   ftgmac100: Restart MAC HW once
>
> Eddie James (7):
>   ARM: dts: aspeed: rainier: Add additional processor CFAMs
>   ARM: dts: aspeed: rainier 4U: Fix fan configuration
>   ARM: dts: aspeed: tacoma: Remove CFAM reset GPIO
>   ARM: dts: Aspeed: Everest: Add FSI CFAMs and re-number engines
>   ARM: dts: Aspeed: Everest: Add RTC
>   hwmon: (pmbus) Add a PMBUS_NO_CAPABILITY platform data flag
>   hwmon: (pmbus/ibm-cffps) Set the PMBUS_NO_CAPABILITY flag
>
> Jim Wright (1):
>   ARM: dts: aspeed: everest: Add UCD90320 power sequencer
>
> Joel Stanley (2):
>   ARM: dts: aspeed: rainier: Mark controllers as restricted
>   fsi: scom: Handle FSI2PIB timeout
>
> Matthew Barth (3):
>   ARM: dts: aspeed: rainier: Set MAX31785 config
>   ARM: dts: Aspeed: Everest: Add max31785 fan controller device
>   ARM: dts: Aspeed: Everest: Add pca9552 fan presence
>
> Milton Miller (1):
>   net/ncsi: Avoid channel_monitor hrtimer deadlock
>
> PriyangaRamasamy (1):
>   ARM: dts: aspeed: Everest: Add I2C components
>
> Vishwanatha Subbanna (6):
>   ARM: dts: aspeed: rainier: Add Operator Panel LEDs
>   ARM: dts: aspeed: rainier: Add directly controlled LEDs
>   ARM: dts: aspeed: rainier: Add leds that are off PCA9552
>   ARM: dts: aspeed: rainier: Add leds that are off pic16f882
>   ARM: dts: aspeed: rainier: Add leds on optional DASD cards
>   ARM: dts: aspeed: rainier: Add leds that are on optional PCI cable
>     cards
>
>  .../devicetree/bindings/mmc/aspeed,sdhci.yaml |    8 +
>  arch/arm/boot/dts/Makefile                    |    2 +
>  arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts  | 1756 +++++++++++-
>  .../boot/dts/aspeed-bmc-ibm-rainier-4u-v2.dts |  198 ++
>  .../boot/dts/aspeed-bmc-ibm-rainier-4u.dts    |   14 +
>  .../boot/dts/aspeed-bmc-ibm-rainier-v2.dts    |  198 ++
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  | 2411 +++++++++++++++--
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts   |    3 +-
>  drivers/fsi/fsi-scom.c                        |   18 +
>  drivers/hwmon/pmbus/ibm-cffps.c               |    2 +-
>  drivers/hwmon/pmbus/max31785.c                |   55 +-
>  drivers/hwmon/pmbus/pmbus_core.c              |   39 +-
>  drivers/hwmon/pmbus/ucd9000.c                 |    4 +
>  drivers/i2c/i2c-core-base.c                   |    8 +-
>  drivers/i2c/i2c-core-smbus.c                  |  169 +-
>  drivers/i2c/i2c-core.h                        |   21 +
>  drivers/mmc/host/sdhci-of-aspeed.c            |   65 +-
>  drivers/net/ethernet/faraday/ftgmac100.c      |    1 +
>  include/linux/i2c.h                           |    5 +
>  include/linux/pmbus.h                         |    9 +
>  net/ncsi/ncsi-manage.c                        |   18 +-
>  21 files changed, 4662 insertions(+), 342 deletions(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-v2.dts
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-v2.dts
>
> --
> 2.27.0
>
