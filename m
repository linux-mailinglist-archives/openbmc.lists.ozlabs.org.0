Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC398068D5
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 08:44:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EiuEqHlP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlTtc4mr8z3ckp
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 18:44:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EiuEqHlP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlTt24yyKz3bWQ
	for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2023 18:43:36 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-db979bbae81so2531479276.0
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 23:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701848614; x=1702453414; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0A4YA43zhy8qthQeaQOK9zRdqY4xliJl0uKODh3DMIY=;
        b=EiuEqHlPnMznyqZaA/uN7WJqp3DbrGC88qmWGtkoz7A4GUUhLBQtd+EJRMhRqHNYoF
         s13hE/7wSG0I4vY3a1K6pJ9CIecElywKz/p8dYMj2FWOI9mqHyivppC3msWHiXEgH+2r
         ouivtwmovslXT9aw2DeczyKuQYfmZq3rN5gCvZyjWqZRn9SzOmGuj6FJScy/mka7w6xq
         l8yEZfCR9OPxOn14tGpFOogSawM/byzCEslvLH3cph3cg/nuKF+CkDMuM9BKZJ4Y4e6g
         cf0AD+ycfdIR0jjKuHqymf8VsC7Yl7avA9b7QnQYKwyLA7QtdZfsm5eWN54rLLqxq1rT
         GSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701848614; x=1702453414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0A4YA43zhy8qthQeaQOK9zRdqY4xliJl0uKODh3DMIY=;
        b=CrMXQ3Tp5RgKYk6D5jRuto0fH4N+7HVD3oGvY9ZtX/qKY6Vh/5zIgPTM4ft8msqDyH
         DdYrV5Rpc2LF+zhdGBvfNWH+PcfVWnlISyadkUBhn8nzqk8aIqcTTNfnkFEtqtihGvco
         cq0B+n70o9H4IMY9T29uPHCZepxfdsUOpKWRm8ah1r8e+jrgKbGMAZQ93r32Eas9/KWw
         FX+Zxo2MJd0UbvmXrUm8G58viG03ofsldE5NWfTVRwgUMkCSyno2URXw7saI5as5Hd/h
         JxQUhB3o4ju/yyNxJxuWFKFJvWgGPxUsXxvlM4KkKT9wSUQsYC1v95NHAHCtHNkrgbSI
         yqfQ==
X-Gm-Message-State: AOJu0YwYHQRYo5khNXiy77SqOWANXp0lsbVG01H9cP4Ddat9ByLP+R/O
	o97KTML0OTCDovgA+9pz5AbMipHDrAwErDGfNgHy4tUYDO4=
X-Google-Smtp-Source: AGHT+IGFWMPgGbo6AurisGTSB7zja6HewoL+TRogQ8728NBlEctVSG4Sdu8OSn9GInjGhhr3mTaTM0rhynpvKxxHbC8=
X-Received: by 2002:a05:6902:601:b0:db7:dacf:4d79 with SMTP id
 d1-20020a056902060100b00db7dacf4d79mr157880ybt.117.1701848614013; Tue, 05 Dec
 2023 23:43:34 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8Xfgwf58Usn0FSWYigD2HbwNKh4DTLX+HLE36HbMC7D1JQ@mail.gmail.com>
In-Reply-To: <CACPK8Xfgwf58Usn0FSWYigD2HbwNKh4DTLX+HLE36HbMC7D1JQ@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 6 Dec 2023 09:43:23 +0200
Message-ID: <CAP6Zq1hNZTeSgRLPb9bDqsU0JCChgaGX2Gth67ru_K_c2tOdJQ@mail.gmail.com>
Subject: Re: OpenBMC Linux 6.6
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Thanks for supporting kernel 6.6

Could you add the following NPCM drivers to kernel 6.6.
   support Nuvoton NPCM Video Capture/Encode Engine
   Add Nuvoton NPCM SGPIO feature
   MMC: add NPCM SDHCI driver support
   hwmon: npcm: add Arbel NPCM8XX support
   usb: ChipIdea: add Nuvoton NPCM UDC support

On Wed, 6 Dec 2023 at 09:01, Joel Stanley <joel@jms.id.au> wrote:
>
> Hot on the heels of the last bump, here is the latest kernel base for
> the aspeed machines.
>
>   https://gerrit.openbmc.org/c/openbmc/openbmc/+/67772
>
> If you're able to test, please comment on gerrit and give the change a +1=
.
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
>       pmbus (max31785): Wrap all I2C accessors in one-shot failure handle=
rs
>       ARM: dts: aspeed: witherspoon: Update max31785 node
>       ipmi: kcs_bmc: Add a "raw" character device interface
>
> C=C3=A9dric Le Goater (1):
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
>       leds: pca955x: Revert "Remove the unused function pca95xx_num_led_r=
egs()"
>
> Johannes Holland (1):
>       dt-bindings: tpm: Add schema for TIS I2C devices
>
> Potin Lai (1):
>       mtd: spi-nor: winbond: Add support for w25q01jvq
>
> Change-Id: I8b756421a7da84c0070e2ad4ac84a93984703457
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Thanks,

Tomer
