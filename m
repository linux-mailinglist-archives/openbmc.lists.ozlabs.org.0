Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7574A8127E6
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 07:21:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cqFuCc41;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrMgr10Zxz3cGb
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 17:21:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cqFuCc41;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=rentao.bupt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrMfF6xtfz2ysD
	for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2023 17:20:21 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d35dc7e1bbso11095165ad.1
        for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2023 22:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702534819; x=1703139619; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IuCK7vvjDHRNuTtxnqialDjKj0uPC6b0wMmfCJ5zneo=;
        b=cqFuCc4184elWvI2GxrrYRdfW2IC7sfoIED8pnbUwdTYd8hcbbfX3cVHJxWpx9OVMz
         Xg2ToWeGEiFpsXjK4spE6ys/gG+Cpz3v7/O+7Z3OUJ4JokWgwezo7do8ynNx90gnx2oi
         lnMU1kw2wt5JAMBu4bCvp4aP6gYYWRW5007MUfB0kWeYHv4iBbiqY+WEKCPbkBvVSV0P
         FKOJTLuy0e089nP3KIXQqONpdDfI5z8IflZe5P8NsdydKg5Rq4NslUOh7WxYfFHylvtH
         BgNMIxUSxoFBC5+kkfZXBkwC3f+RMTMLnRKJL058M/aW5crUKIzY5C38d2I398cs2LFB
         Gavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702534819; x=1703139619;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IuCK7vvjDHRNuTtxnqialDjKj0uPC6b0wMmfCJ5zneo=;
        b=lj0OOl9nViX3yD0gc07C+ZZaZKc5wL79Fx+USZ0gWhBAdK+glyHGqz8aVal2B8suKw
         f8WTHHrukGT+hvuKx3x6NI0wLs0Epjk5DxXBasQw/1FUpRb8y5Xt0yOLzv+1ABytNAXT
         AGmKvpdQdAy8vjIpqR2a6+odreGOge0mYu4HJW3Bsqb4fxAPf7QGacXf6Yr79I2h4+u0
         Hu+upgsQWi2NLG9fBqSdnA/phAlVbeo+oPpCcQx0/Bt0Bt4YOHzG3IgTDGu0Mt/WvlBs
         FY0MbQe5UGRTESj8hfnZHtxc/1jHUO8JTXbr7wpir2Swmnx/IbEVXgeR7FUCR+r7m5iO
         bhdQ==
X-Gm-Message-State: AOJu0YyDn+R+3R25eczqtEtGx/dIB2+AoyQT7rznXphCKT25h3GbYuQU
	8IoQPjP9SaSgZRIFEKVUEBGRR331df0=
X-Google-Smtp-Source: AGHT+IEPtkAFgZAmUsll413xwBfQQ0OXLyuA9hXqfbT3J3LU3AC1uPe2qbPbP1t9rd5jqKw+tOdf3Q==
X-Received: by 2002:a17:903:2cc:b0:1d3:488e:a4b7 with SMTP id s12-20020a17090302cc00b001d3488ea4b7mr3787706plk.128.1702534819305;
        Wed, 13 Dec 2023 22:20:19 -0800 (PST)
Received: from fedora (c-24-4-59-2.hsd1.ca.comcast.net. [24.4.59.2])
        by smtp.gmail.com with ESMTPSA id o2-20020a1709026b0200b001cfad034756sm11453977plk.138.2023.12.13.22.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 22:20:18 -0800 (PST)
Date: Wed, 13 Dec 2023 22:20:16 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: OpenBMC Linux 6.6
Message-ID: <ZXqeoFo7scG+ri0j@fedora>
References: <CACPK8Xfgwf58Usn0FSWYigD2HbwNKh4DTLX+HLE36HbMC7D1JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACPK8Xfgwf58Usn0FSWYigD2HbwNKh4DTLX+HLE36HbMC7D1JQ@mail.gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

Finally I got chance to sanity test Linux 6.6 on my AST2600 BMC, and
everything looks good so far.

I'm also planning to move all the Meta Network AST2400 and AST2500 BMC
platforms to Linux 6.6, but I need to upgrade yocto at first (we are
still running dunfell, which doesn't seem to be compatible with 6.6).
Anyways, I will update back if I found problems.

Again, thank you for maintaining the OpenBMC kernel tree!


Cheers,

Tao

On Wed, Dec 06, 2023 at 05:29:59PM +1030, Joel Stanley wrote:
> Hot on the heels of the last bump, here is the latest kernel base for
> the aspeed machines.
> 
>   https://gerrit.openbmc.org/c/openbmc/openbmc/+/67772
> 
> If you're able to test, please comment on gerrit and give the change a +1.
> 
> There was a config regression due to CONFIG_EMBEDDED going away, which
> is fixed separately here:
> 
>   https://gerrit.openbmc.org/c/openbmc/openbmc/+/68117
> 
> Commit message for the bump follows:
> 
> There are 56 patches in the tree, with 36 of those patches not
> yet queued for merging in v6.7.
> 
> v6.6 is an LTS kernel as decreed by the kernel.org maintainers. The
> OpenBMC kernel maintainers encourage everyone to ship the latest kernel
> as it has the most code review and upstream code.
> 
> Andrew Jeffery (6):
>       dt-bindings: hwmon: pmbus: Add Maxim MAX31785 documentation
>       pmbus (max31785): Add support for devicetree configuration
>       pmbus (core): One-shot retries for failure to set page
>       pmbus (max31785): Wrap all I2C accessors in one-shot failure handlers
>       ARM: dts: aspeed: witherspoon: Update max31785 node
>       ipmi: kcs_bmc: Add a "raw" character device interface
> 
> Cédric Le Goater (1):
>       /dev/mem: add a devmem kernel parameter to activate the device
> 
> Eddie James (19):
>       dt-bindings: soc: Add Aspeed XDMA Engine
>       soc: aspeed: Add XDMA Engine Driver
>       soc: aspeed: xdma: Add user interface
>       soc: aspeed: xdma: Add reset ioctl
>       soc: aspeed: xdma: Add trace events
>       i2c: core: Add mux root adapter operations
>       iio: si7020: Lock root adapter to wait for reset
>       eeprom: ee1004: Enable devices on multiple busses
>       dt-bindings: trivial-devices: Add Atmel AT30TSE004A serial eeprom
>       eeprom: ee1004: Add OF matching support
>       leds: pca955x: Refactor with helper functions and renaming
>       leds: pca955x: Use pointers to driver data rather than I2C client
>       leds: pca955x: Optimize probe led selection
>       leds: pca955x: Add HW blink support
>       leds: Ensure hardware blinking turns off when requested
>       ARM: dts: aspeed: Rainier: Add fan controller properties
>       ARM: dts: aspeed: Everest: Add fan controller properties
>       ARM: dts: aspeed: Bonnell: Add fan controller properties
>       ARM: dts: aspeed: Rainier 4U: Delete fan dual-tach properties
> 
> Jae Hyun Yoo (1):
>       clk: ast2600: enable BCLK for PCI/PCIe bus always
> 
> Joel Stanley (7):
>       net: ftgmac100: Ensure tx descriptor updates are visible
>       ARM: aspeed: Add debugfs directory
>       ARM: soc: aspeed: Add secure boot controller support
>       dt-bindings: trivial-devices: Remove Infineon SLB9673 TPM
>       ARM: dts: nuvoton: npmc750-evb: Add default console
>       tpm: tis-i2c: Add more compatible strings
>       leds: pca955x: Revert "Remove the unused function pca95xx_num_led_regs()"
> 
> Johannes Holland (1):
>       dt-bindings: tpm: Add schema for TIS I2C devices
> 
> Potin Lai (1):
>       mtd: spi-nor: winbond: Add support for w25q01jvq
> 
> Change-Id: I8b756421a7da84c0070e2ad4ac84a93984703457
> Signed-off-by: Joel Stanley <joel@jms.id.au>
