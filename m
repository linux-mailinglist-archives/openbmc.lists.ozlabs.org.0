Return-Path: <openbmc+bounces-524-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F13B3B0D5
	for <lists+openbmc@lfdr.de>; Fri, 29 Aug 2025 04:19:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cChmW26hPz2xd6;
	Fri, 29 Aug 2025 12:19:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756433979;
	cv=none; b=gyQlY6klxqtFkwyrafBxEVx0Pv+oIosi1vR2axMcYach8rhAx9d5Pn/5eQGg1A+O6M9SA4cerZXnAEndyD3YGM3VwaTmA2rFwItRjtO8Cf05zrwuMiyI4g9VShWpKBgGURV3XyEDl0Yy/Q4JTURhFH4G7nGjmEqENxrK6CXK3S0UgVOm95hUQBnU4dD2TMz8r2QzO6DGdwLMUa8yHc1sWYGET6OhWsw9rhcSyi/jRmJokVAk+PANGSMSZV+PzQmzdY9oxYmD/97caSMO/zON79cF0pmWubJyzL5Q3ERQgbEH/fwbHu/I70WjyfKW3R5U1/GuNrhpOIjPnHjb/qBw+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756433979; c=relaxed/relaxed;
	bh=D2MYfPyb8LMVTxsuBKDBW89PqlCB+rOEiTHsO+Z+pH8=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=VOi3t0mWWrGK1Q0+4uIeiY2qpmOlnubtLV6Ka06YHCTLw+2qAfVlGujroP64CB6iWihkESUfho+twS5vup/H7AWOIHzGhkj0frNC0/TRYu8cw2CxGkVU99VZSbTGLCqnkNHyAM805SaKsPhBLQ9l9zwWyFdSQuOSfGXP0QkN229s+oBuxXCIZeY8wuXtDTi/ePvkCUgmAFJRM4ZQyiT3w6IS57nn9KNYEYHYun5ignl7Dggv5sphmazpj/FdIiN6XH/aXnxGicToq5gCUirBa5OMFA4udJwWgyhNA+mVaM0GP99rEGXpMwre37z0sA9VzFPFGrA7gqIkqoIcdtg9mQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=iKqTkLNL; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=iKqTkLNL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cChmV2gcdz2xS2
	for <openbmc@lists.ozlabs.org>; Fri, 29 Aug 2025 12:19:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756433976;
	bh=D2MYfPyb8LMVTxsuBKDBW89PqlCB+rOEiTHsO+Z+pH8=;
	h=Subject:From:To:Cc:Date;
	b=iKqTkLNLSlEHcZLXxXWBPonnHBICZrD3xi9XF59We6PgDPldu3pXOB2CXLlJMgFOQ
	 w+m9nZaI+0vKDH7t8looIM3zLej267NfiqtTQ6MvScDpfdNSjSMM49vyjsWUMhB1kc
	 B9tVCGK17jX0IxtzRUbJ1IrKKetNzUXAlDK/9ryWQN34MU/mDXZy7BO0nfi3H9D9A6
	 Ed2gLPjcoNkK3YLKpPWmsPqDXlgBPAoiIV0t6UkikdHhtETTQXoK/9VxNeZhAUJWrN
	 Jiwn5xFKgcFn/pQhQeANSicP8/3n0G0EQ7fduUHpON7MkAAqdRkHaCpiVt03JuJkvf
	 B4izHNMY+mRTg==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2C5D46409F;
	Fri, 29 Aug 2025 10:19:34 +0800 (AWST)
Message-ID: <296babb4c948f8103679066b48e6f7ef26dc2d3c.camel@codeconstruct.com.au>
Subject: OpenBMC Linux v6.12, redux
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: openbmc <openbmc@lists.ozlabs.org>
Cc: Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.ibm.com>, Zev
 Weiss <zweiss@equinix.com>, "tomer.maimon" <tomer.maimon@nuvoton.com>, Tan
 Siewert <tan@siewert.io>, Cosmo Chou <chou.cosmo@gmail.com>, Peter Yin
 <peteryin.openbmc@gmail.com>, Andrew Geissler <geissonator@gmail.com>, 
 Patrick Williams <patrick@stwcx.xyz>, Ed Tanous <etanous@nvidia.com>
Date: Fri, 29 Aug 2025 11:49:33 +0930
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

Hello,

Just in time for v6.18 (which may be the next LTS) we've got the move
to v6.12 passing CI:

https://gerrit.openbmc.org/q/topic:%22dev-6.12%22

The dev-6.12 branch is now based on v6.12.43, which up until today was
the most recent stable release.

The following patches were either dropped or modified to resolve merge
conflicts along the way. For each that is relevant to your platform(s),
please retest and send any fixes to the list. I've Cc'ed the likely
candidates.

   + a7eda8b548c3c9005b1f583a8a02b5b7fc36cdca dt-bindings: soc: Add Aspeed =
XDMA Engine
   + a9affb5ce742c43bfbea4e7e1402f6091a10db7c soc: aspeed: Add XDMA Engine =
Driver
   + 82f0e1f021dfb1cde31fc210b2d9a938bdf3cc60 soc: aspeed: xdma: Add user i=
nterface
   + a097e001eb7bfb853bb24fa589c5eb5cfeb6569c soc: aspeed: xdma: Add reset =
ioctl
   + 70adec1311b0dc4817be50c0881128d94b2361bc soc: aspeed: xdma: Add trace =
events
   + 084346c35a3841752403b5ca2a11e70dab122893 pmbus (max31785): Add support=
 for devicetree configuration
   + 904b7585a35ba66b2f594fc5de4845f4917bf32a pmbus (core): One-shot retrie=
s for failure to set page
   + 31c04425a4ecdb09534de8c9ba78c3a6c9b08a34 pmbus (max31785): Wrap all I2=
C accessors in one-shot failure handlers
   + 1458b9cc6365b5d35bba2da8364c10e4da3cb195 /dev/mem: add a devmem kernel=
 parameter to activate the device
   + 3cf704c9085ba246164e93e8bbf4f8653757581a ARM: soc: aspeed: Add secure =
boot controller support
   + 13dd4cd8907617f684beb93392520c7e60458883 i2c: core: Add mux root adapt=
er operations
   + 3a80aa18340027719964de9786b0b6a764365250 iio: si7020: Lock root adapte=
r to wait for reset
   + 9f8eef124caa8659ea6117d2a02b19ded883b5c7 dt-bindings: trivial-devices:=
 Remove Infineon SLB9673 TPM
   + 26f4b567454152d5de8c04ad7aa0e8c1b3154c4c mtd: spi-nor: winbond: Add su=
pport for w25q01jvq
   + 1ef25a0958c26f7454df090c783e665c7c4157e7 eeprom: ee1004: Enable device=
s on multiple busses
   + 3a5cfac9d0907e8f43103eecba371c31a323d147 dt-bindings: trivial-devices:=
 Add Atmel AT30TSE004A serial eeprom
   + c0903d925facbe570a83d9586f4f9045d0f8eff6 eeprom: ee1004: Add OF matchi=
ng support
   + 84e012323b8762d42703256a613e0dd905b5d5ab leds: pca955x: Add HW blink s=
upport
   + 80b1dffa0df7eeae78d2ffd5670182cc17f96d81 ARM: dts: aspeed: Add ASRock =
SPC621D8HM3 BMC
   + bc85426ba9a34417f2219756ce69119395c192c5 dt-bindings: arm: aspeed: doc=
ument ASRock E3C256D4I
   + 0b5edfd645e9ccac205b69ca11ad5d10ba18c9a7 ARM: dts: aspeed: Add ASRock =
E3C256D4I BMC
   + d9cb73a2fff068c598c4da04bf12f17b9bcd610e dt-bindings: arm: aspeed: add=
 Asrock X570D4U board
   + 101bc1faadd47a13bc33c1ecc711ecac6ca50333 ARM: dts: aspeed: asrock: Add=
 ASRock X570D4U BMC
   + a9a056114559b28292a9f910df9ffaec3d93a173 hwmon: (pmbus) Add support fo=
r MPS Multi-phase mp5990
   + 452a5b8a2e7caec369e5a19f4bdf3d66aa0fcfbb dt-bindings: usb: ci-hdrc-usb=
2: add npcm750 and npcm845 compatible
   + e7a693ab8d5572ed5beb546c704404afb79c7620 ARM: dts: aspeed: Harma: Add =
PDB temperature
   + bbeb3e6ad1685e7602c614fac9bb54b9d6e50a91 ARM: dts: aspeed: x4tf: Add d=
ts for asus x4tf project
   + d968e7798898c1e7f7933a251f4bc27f58250d4d hwmon: (aspeed-g6-pwm-tacho):=
 Support for ASPEED g6 PWM/Fan tach
   + 08060aec1809750ca01957413148104aabd6c56d ARM: aspeed_g5_defconfig: Ref=
resh based on current tree
   + db04f4d2a4fd75433a7172ba45a228833b074d79 dt-bindings: hwmon: Add infin=
eon xdp710 driver bindings
   + dbc1917eed2add9debff7b52f866808228f39e55 ARM: dts: aspeed: convert ASR=
ock SPC621D8HM3 NVMEM content to layout syntax
   + 0236b0ccef9b8da9d503d3f8664abd9df5f52dd1 gpio: nuvoton: Add Nuvoton NP=
CM sgpio driver
   + ebcf6cb6dd11f72b5812dc4b275f7bcb4056fa11 ARM: dts: aspeed: Harma: remo=
ve pca9546
   + b9137941523f24083bc2fc218559ba68e10b50ef dt-bindings: trivial-devices:=
 add isil,isl69260
   + b64056abba7dee79b8f0f4262918165ccd4381e9 dt-bindings: pinctrl: npcm8xx=
: remove non-existent groups and functions
   + 5223c03eeb2b84e64aea7d5a981a7356fca78313 dt-bindings: trivial-devices:=
 add Astera Labs PT5161L
   + 9ada2e61ed81d36ba7923ec9ec460a8cead147f4 hwmon: Add driver for Astera =
Labs PT5161L retimer
   + e51d912bd0d2dc78041513e688cd033670e36541 reset: npcm: register npcm8xx=
 clock auxiliary bus device
   + 275c3c0251e422a575d66de0aed309f7c8b796bf hwmon: (pmbus/crps) Add Intel=
 CRPS185 power supply
   + 64c18a4d8806e6dcc91a64a0f394c147487616ff dt-bindings: hwmon: ti,ina2xx=
: Add INA233 device
   + 55c0374977cd1dab0bb2677ed6ea6952bb4c0845 hwmon: Add driver for TI INA2=
33 Current and Power Monitor
   + a835c9d81a456015e4cdd1a68b3f79e2eef4eef9 net: mctp: unshare packets wh=
en reassembling
   + 97c3a2c4bcae82bb36ff387739b74bc8047a6786 usb: Add base USB MCTP defini=
tions
   + e0df9c58efb4c38613c51f2a0d997896e83a3868 usb: typec: tcpm: Add support=
 for parsing pd-revision DT property
   + fb90e62d71a6635bbc332840451ce4f1d8f2bc8a ARM: dts: aspeed: Harma: Add =
PDB temperature
   + 2ded42c441ec3cef74dd64a5387a1f5f15df1461 ARM: dts: aspeed: Harma: Modi=
fy GPIO line name
   + e7bbc57228033571445e88e7f6019d6857cf79a4 usb: typec: tcpm: Use configu=
red PD revision for negotiation
   + d0f2d51c1dd59cb58e20212e27349f1aeddee0f2 i3c: master: handle IBIs in o=
rder they came
   + ba709ed4d5aa1cbe907ca8c257ff44faeb202b56 arm64: dts: nuvoton: add refc=
lk and update peripheral clocks for NPCM845
   + a4cd7ccbb5110778ce7fe900c471bc1e3e4bf520 gpio: pca953x: Add support fo=
r level-triggered interrupts
   + 8dc19749291c7f1380b58f43297b4de844c9d43c ARM: dts: aspeed: e3c256d4i: =
convert NVMEM content to layout syntax

Thanks for your patience,

Andrew
  =20

