Return-Path: <openbmc+bounces-539-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C30A2B3D648
	for <lists+openbmc@lfdr.de>; Mon,  1 Sep 2025 03:22:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFWMS0KGnz2xd6;
	Mon,  1 Sep 2025 11:22:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756689763;
	cv=none; b=nIKWw/ZqCe277i9TVQmKnGaUxK6ko43XKv23wOH+ESMusIjjHNqE1bHOZ298oPsH5MGHKB3V5mCC6b/Cn6HootIvcuR7juG1VdzxT3UKy6HICeQfkpslWIXij9zQyxlN9VwfHYMUIyjaEN3AG2MOcfngr/DwTFNRHFWhPON2IVdNK6/h8KqR4n8a9ezdof4+t5JGRaZzLM9k58QNpQfjatKl6uZPmP+7gUW9o2SrDN5q+FIFnL5DgDBj7hUigticDDbd3+/0u9Y6I80weK9JA4mpUzNzagUX2NaAWi8jW2s/m99kPUOBw3q7H9THDyNKuTo8ceRUtj31bryYrrR6cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756689763; c=relaxed/relaxed;
	bh=i37IGQP90TEe2HR5n+lnCa3p9/B+1JZ8tq7kW/aOGZU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=efFcSQ7fFMcbPHzmKI3uQFmjSLtpktrDkso48Ta5udTAlUJoOHJzY3QUVY7cpemNd9hNFAkyMKLg66GXsA4D+h0h410NFO5m04E72a3LakHutGZLOVr4rd4cdaxSXKqC7Cz/B5VY/1EIOVIJ/pxUMUoosQsbWAdWMicETwujrQURe+17hEpypTIIGSbsaRQj3G9QAwQOB6tP8i93bE1pd60z0DT2W1hxBrnXjY2jVW7UpWCQbCjmt13iyKJfxxfy27V/ZKhGTXqOxKLQIi/RRCIHaUHvz4v5RmPfQrEGQK2Yp7BoCNdtDOKj/WiX0K80Av8UTli7MHT/z8eC8f87AQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jWAb2wJ9; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jWAb2wJ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFWMQ6yBNz2xcB
	for <openbmc@lists.ozlabs.org>; Mon,  1 Sep 2025 11:22:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756689760;
	bh=i37IGQP90TEe2HR5n+lnCa3p9/B+1JZ8tq7kW/aOGZU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jWAb2wJ9n55vyFVt9jaYl5f9vQlcvvH6xQNo/b1Ah5spZull8yVI8Goz3gtZIy3oP
	 2mW3GSQMCMM920AQJ1WaLe1J0GZVqGFFBQPqHpZ/YTO3XatEwNx+0XKu0MJx18PAFx
	 IuGBxbaw0FggkBg304DbRPOWb0GS88ltf9UEgxrota7qRS/+e9Tw27CqK6VnUezt0D
	 TfXa4xadcgmqbaazwadSdPeSdubRozJfUc1vFHu96nv3nQfZu+s0JyzLgvSj+Ajsxl
	 M60n+CHDHn6fmrgKJlnZxq/zbKqHNMcbSFDzGXCs//yv1520sRthL3DIdhd8/lVEXj
	 V7AlGrMRWvm4A==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3ADE164CF7;
	Mon,  1 Sep 2025 09:22:37 +0800 (AWST)
Message-ID: <d9a8771f1ce273f5578a4a6e8f668ff3b651e082.camel@codeconstruct.com.au>
Subject: Re: OpenBMC Linux v6.12, redux
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: openbmc <openbmc@lists.ozlabs.org>
Cc: Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.ibm.com>, Zev
 Weiss <zweiss@equinix.com>, "tomer.maimon" <tomer.maimon@nuvoton.com>, Tan
 Siewert <tan@siewert.io>, Cosmo Chou <chou.cosmo@gmail.com>, Peter Yin
 <peteryin.openbmc@gmail.com>, Andrew Geissler <geissonator@gmail.com>, 
 Patrick Williams <patrick@stwcx.xyz>, Ed Tanous <etanous@nvidia.com>
Date: Mon, 01 Sep 2025 10:52:36 +0930
In-Reply-To: <296babb4c948f8103679066b48e6f7ef26dc2d3c.camel@codeconstruct.com.au>
References: 
	<296babb4c948f8103679066b48e6f7ef26dc2d3c.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 2025-08-29 at 11:49 +0930, Andrew Jeffery wrote:
> Hello,
>=20
> Just in time for v6.18 (which may be the next LTS) we've got the move
> to v6.12 passing CI:
>=20
> https://gerrit.openbmc.org/q/topic:%22dev-6.12%22
>=20
> The dev-6.12 branch is now based on v6.12.43, which up until today was
> the most recent stable release.
>=20
> The following patches were either dropped or modified to resolve merge
> conflicts along the way. For each that is relevant to your platform(s),
> please retest and send any fixes to the list. I've Cc'ed the likely
> candidates.
>=20
> =C2=A0=C2=A0 + a7eda8b548c3c9005b1f583a8a02b5b7fc36cdca dt-bindings: soc:=
 Add Aspeed XDMA Engine
> =C2=A0=C2=A0 + a9affb5ce742c43bfbea4e7e1402f6091a10db7c soc: aspeed: Add =
XDMA Engine Driver
> =C2=A0=C2=A0 + 82f0e1f021dfb1cde31fc210b2d9a938bdf3cc60 soc: aspeed: xdma=
: Add user interface
> =C2=A0=C2=A0 + a097e001eb7bfb853bb24fa589c5eb5cfeb6569c soc: aspeed: xdma=
: Add reset ioctl

*snip*

I've also wrangled the list into shortlog form, which I expect is more
helpful:

   Amit Sunil Dhamne (1):
         usb: typec: tcpm: Add support for parsing pd-revision DT property
  =20
   Andrew Jeffery (4):
         pmbus (max31785): Add support for devicetree configuration
         pmbus (core): One-shot retries for failure to set page
         pmbus (max31785): Wrap all I2C accessors in one-shot failure handl=
ers
         ARM: aspeed_g5_defconfig: Refresh based on current tree
  =20
   Billy Tsai (1):
         hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach
  =20
   Cosmo Chou (3):
         dt-bindings: trivial-devices: add Astera Labs PT5161L
         hwmon: Add driver for Astera Labs PT5161L retimer
         usb: typec: tcpm: Use configured PD revision for negotiation
  =20
   C=C3=A9dric Le Goater (1):
         /dev/mem: add a devmem kernel parameter to activate the device
  =20
   Eddie James (11):
         dt-bindings: soc: Add Aspeed XDMA Engine
         soc: aspeed: Add XDMA Engine Driver
         soc: aspeed: xdma: Add user interface
         soc: aspeed: xdma: Add reset ioctl
         soc: aspeed: xdma: Add trace events
         i2c: core: Add mux root adapter operations
         iio: si7020: Lock root adapter to wait for reset
         eeprom: ee1004: Enable devices on multiple busses
         dt-bindings: trivial-devices: Add Atmel AT30TSE004A serial eeprom
         eeprom: ee1004: Add OF matching support
         leds: pca955x: Add HW blink support
  =20
   Jeremy Kerr (1):
         usb: Add base USB MCTP definitions
  =20
   Joel Stanley (2):
         ARM: soc: aspeed: Add secure boot controller support
         dt-bindings: trivial-devices: Remove Infineon SLB9673 TPM
  =20
   Kelly Hung (1):
         ARM: dts: aspeed: x4tf: Add dts for asus x4tf project
  =20
   Leo Yang (2):
         dt-bindings: hwmon: ti,ina2xx: Add INA233 device
         hwmon: Add driver for TI INA233 Current and Power Monitor
  =20
   Matt Johnston (1):
         net: mctp: unshare packets when reassembling
  =20
   Ninad Palsule (1):
         hwmon: (pmbus/crps) Add Intel CRPS185 power supply
  =20
   Peter Yin (7):
         hwmon: (pmbus) Add support for MPS Multi-phase mp5990
         ARM: dts: aspeed: Harma: Add PDB temperature
         dt-bindings: hwmon: Add infineon xdp710 driver bindings
         ARM: dts: aspeed: Harma: remove pca9546
         dt-bindings: trivial-devices: add isil,isl69260
         ARM: dts: aspeed: Harma: Add PDB temperature
         ARM: dts: aspeed: Harma: Modify GPIO line name
  =20
   Potin Lai (2):
         mtd: spi-nor: winbond: Add support for w25q01jvq
         gpio: pca953x: Add support for level-triggered interrupts
  =20
   Rafa=C5=82 Mi=C5=82ecki (1):
         ARM: dts: aspeed: convert ASRock SPC621D8HM3 NVMEM content to layo=
ut syntax
  =20
   Renze Nicolai (2):
         dt-bindings: arm: aspeed: add Asrock X570D4U board
         ARM: dts: aspeed: asrock: Add ASRock X570D4U BMC
  =20
   Tan Siewert (1):
         ARM: dts: aspeed: e3c256d4i: convert NVMEM content to layout synta=
x
  =20
   Tomer Maimon (5):
         dt-bindings: usb: ci-hdrc-usb2: add npcm750 and npcm845 compatible
         gpio: nuvoton: Add Nuvoton NPCM sgpio driver
         dt-bindings: pinctrl: npcm8xx: remove non-existent groups and func=
tions
         reset: npcm: register npcm8xx clock auxiliary bus device
         arm64: dts: nuvoton: add refclk and update peripheral clocks for N=
PCM845
  =20
   Zbigniew Lukwinski (1):
         i3c: master: handle IBIs in order they came
  =20
   Zev Weiss (3):
         ARM: dts: aspeed: Add ASRock SPC621D8HM3 BMC
         dt-bindings: arm: aspeed: document ASRock E3C256D4I
         ARM: dts: aspeed: Add ASRock E3C256D4I BMC
  =20

