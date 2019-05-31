Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB79930EEB
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 15:35:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Fln20VhDzDqZB
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 23:35:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=franhsutw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LhY+slKU"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FlmR5MGbzDq99
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 23:34:31 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id h17so4094923pgv.0
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 06:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=Y3cQeTRV8MUZszig/0BI4IRgN5xVvldg8h1oDX1OvbU=;
 b=LhY+slKUpXpWmdIkiikiHdLft1Sh8rQnoukPTzAEjXAdyHkvyZXeqjkw6z+gJSqygh
 WZtCrHZSKSXE59QnFy2VgH2n1DFqD3Yv2J5irB56lYb7mFFNiol/TqTI42Jx9cgru8or
 FNNwV6vdFPjjBU6EhupWV1WXBD7i7MDUN70OMyyJvkA0NjT0AduYh5gA108eLcySelWD
 Lpy10XecUfH7VNQEeu1eDPN869IT5/6OOTjSIBd4zolrGZWlUPxqim6jJN6torCrgmwi
 /c0a0Cmeuwo7jWgj/euDMS/4pPA1ewmQQUYk/qhb9RbSaXlo+BH20ImUjY3fDJPkFSbT
 /McA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=Y3cQeTRV8MUZszig/0BI4IRgN5xVvldg8h1oDX1OvbU=;
 b=T74rGdCHCljfL/T8x8timevV73FU8g5W7q1m4wh9r0Ci11Y8MpX/CgT1TqIKGpFqbm
 DQRJr0Z9IoBxG2AG+O3BC7LoZtSTTG+FKOmBDYyETLDPL5DsAL5YZaqd8hzh98mHEBK6
 4R0pRDVP/KPgk53aUIU2qm6eG+LjWhphvIXNGnCSPoIRMN8ChMagSlrF02ofhCbdAUqs
 DWVRFWxwODyWBIH8VDkmkhJUAnrCGTMUrUv3Vgwe0c31W8UfOzbhGA9CRKucTAASTg+9
 ZUNcLjxbjbL601tz8/OpUuECDRixZ1SupjZiIYASQ9cGCtIVmxuVg4YTNK4XQZjwNUBj
 UfEA==
X-Gm-Message-State: APjAAAUG3N3SFY66LbbDukDz7EfK6dvFkOpZ6lq2OsKaGrJ/j7q6VWCs
 M73RcdFkIiT3Q9bp/i/TzrAZMR6fxTk=
X-Google-Smtp-Source: APXvYqzSNZO0j/yhkOGoq+9vFKNynady1lF634ibH7zRrHn9OiYAA5KQRvnySa+ZstOKjJ32zXK82g==
X-Received: by 2002:a65:4c07:: with SMTP id u7mr8940640pgq.93.1559309668048;
 Fri, 31 May 2019 06:34:28 -0700 (PDT)
Received: from FranNI7 (220-135-135-179.HINET-IP.hinet.net. [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id
 z4sm6122053pfa.142.2019.05.31.06.34.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 May 2019 06:34:27 -0700 (PDT)
From: franhsutw@gmail.com
X-Google-Original-From: <FranHsuTW@gmail.com>
To: "'Benjamin Fair'" <benjaminfair@google.com>
References: <20190516111200.13859-1-franhsutw@gmail.com>
 <CADKL2t7N1dLHCjnrWD61KsdD1CmQm3AK2HhxoXvcVAqVG7rE_g@mail.gmail.com>
In-Reply-To: <CADKL2t7N1dLHCjnrWD61KsdD1CmQm3AK2HhxoXvcVAqVG7rE_g@mail.gmail.com>
Subject: RE: [PATCH dev-5.1 v4 1/4] ARM: dts: nuvoton: Add Quanta GSJ BMC
 Device Tree.
Date: Fri, 31 May 2019 21:34:06 +0800
Message-ID: <095301d517b5$9296e660$b7c4b320$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKlCxHSu/TciL2atq77UwL6tSNlOAJhhBBVpNJHkmA=
Content-Language: zh-tw
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
Cc: 'OpenBMC Maillist' <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

HI Benjamin,
	Thanks for your comments, I had sent out the [PATCH dev-5.1 v5] for =
reviewing.

Fran

> -----Original Message-----
> From: Benjamin Fair <benjaminfair@google.com>
> Sent: Friday, May 31, 2019 2:16 AM
> To: Fran Hsu <franhsutw@gmail.com>
> Cc: Joel Stanley <joel@jms.id.au>; OpenBMC Maillist
> <openbmc@lists.ozlabs.org>
> Subject: Re: [PATCH dev-5.1 v4 1/4] ARM: dts: nuvoton: Add Quanta GSJ =
BMC
> Device Tree.
>=20
> Hi Fran,
>=20
> This is looking good. Just a few small changes.
>=20
> On Thu, May 16, 2019 at 4:14 AM Fran Hsu <franhsutw@gmail.com> wrote:
> >
> > Quanta GSJ BMC uses the Nuvoton NPCM730 soc.
> > Commit the Quanta GSJ device tree for Arm dts.
> > Also adds an entry of Quanta GSJ device tree file in Makefile.
> > This is the part-1 of nuvoton-npcm730-gsj.dts.
> >
> > Including features:
> > 1. Image partitions
> > 2. pwm fan controller
> > 3. usb device
> > 4. serial port
> > 5. fiu
> >
> > Tested:
> >   Build Quanta GSJ image and load on the GSJ BMC module.
> >   Ensure that BMC boots to console successful.
> >
> > Signed-off-by: Fran Hsu <franhsutw@gmail.com>
> > ---
> >  arch/arm/boot/dts/Makefile                |   3 +-
> >  arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 413
> > ++++++++++++++++++++++
> >  2 files changed, 415 insertions(+), 1 deletion(-)  create mode =
100644
> > arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 127616746486..f55eedcdfec9 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -321,7 +321,8 @@ dtb-$(CONFIG_ARCH_LPC32XX) +=3D \
> >         lpc3250-ea3250.dtb \
> >         lpc3250-phy3250.dtb
> >  dtb-$(CONFIG_ARCH_NPCM7XX) +=3D \
> > -       nuvoton-npcm750-evb.dtb
> > +       nuvoton-npcm750-evb.dtb \
> > +       nuvoton-npcm730-gsj.dtb
> >  dtb-$(CONFIG_MACH_MESON6) +=3D \
> >         meson6-atv1200.dtb
> >  dtb-$(CONFIG_MACH_MESON8) +=3D \
> > diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> > b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> > new file mode 100644
> > index 000000000000..7cac83c6566b
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> > @@ -0,0 +1,413 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2019 Quanta Computer lnc. Fran.Hsu@quantatw.com
> > +
> > +/dts-v1/;
> > +#include "nuvoton-npcm730.dtsi"
> > +#include "nuvoton-npcm730-gsj-gpio.dtsi"
>=20
> These include files don't exist yet. Make sure to order your patches =
so that the
> kernel can build at each commit.
>=20
> > +/ {
> > +       model =3D "Quanta GSJ Board (Device Tree v11)";
> > +       compatible =3D "nuvoton,npcm750";
> > +
> > +       aliases {
> > +               ethernet0 =3D &emc0;
> > +               ethernet1 =3D &gmac0;
> > +               serial3 =3D &serial3;
> > +               udc9 =3D &udc9;
> > +               i2c0 =3D &i2c0;
> > +               i2c1 =3D &i2c1;
> > +               i2c2 =3D &i2c2;
> > +               i2c3 =3D &i2c3;
> > +               i2c4 =3D &i2c4;
> > +               i2c5 =3D &i2c5;
> > +               i2c6 =3D &i2c6;
> > +               i2c7 =3D &i2c7;
> > +               i2c8 =3D &i2c8;
> > +               i2c9 =3D &i2c9;
> > +               i2c10 =3D &i2c10;
> > +               i2c11 =3D &i2c11;
> > +               i2c12 =3D &i2c12;
> > +               i2c13 =3D &i2c13;
> > +               i2c14 =3D &i2c14;
> > +               i2c15 =3D &i2c15;
> > +               fiu0 =3D &fiu0;
> > +       };
> > +
> > +       chosen {
> > +               stdout-path =3D &serial3;
> > +       };
> > +
> > +       memory {
> > +               reg =3D <0 0x40000000>;
> > +       };
> > +
> > +       ahb {
> > +               gmac0: eth@f0802000 {
> > +                       phy-mode =3D "rgmii-id";
> > +                       status =3D "okay";
> > +               };
> > +
> > +               mc: memory-controller@f0824000 {
> > +                       compatible =3D "nuvoton,npcm7xx-sdram-edac";
> > +                       reg =3D <0xf0824000 0x1000>;
> > +                       interrupts =3D <GIC_SPI 25
> IRQ_TYPE_LEVEL_HIGH>;
> > +               };
> > +
> > +               emc0: eth@f0825000 {
> > +                       use-ncsi;
> > +                       status =3D "okay";
> > +               };
> > +
> > +               ehci1: usb@f0806000 {
> > +                       status =3D "okay";
> > +               };
> > +
> > +               ohci1: ohci@f0807000 {
> > +                       status =3D "okay";
> > +               };
> > +
> > +               udc9:udc@f0839000 {
> > +                       status =3D "okay";
> > +               };
> > +
> > +               aes:aes@f0858000 {
> > +                       status =3D "okay";
> > +               };
> > +
> > +               sha:sha@f085a000 {
> > +                       status =3D "okay";
> > +               };
> > +
> > +               fiu0: fiu@fb000000 {
> > +                       pinctrl-names =3D "default";
> > +                       pinctrl-0 =3D <&spi0cs1_pins>;
> > +                       status =3D "okay";
> > +                       spi-nor@0 {
> > +                               compatible =3D "jedec,spi-nor";
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <1>;
> > +                               reg =3D <0>;
> > +                               spi-rx-bus-width =3D <2>;
> > +                               partitions@80000000 {
> > +                                       compatible =3D
> "fixed-partitions";
> > +                                       #address-cells =3D <1>;
> > +                                       #size-cells =3D <1>;
> > +                                       bmc@0{
> > +                                               label =3D "bmc";
> > +                                               reg =3D <0x000000
> 0x2000000>;
> > +                                       };
> > +                                       u-boot@0 {
> > +                                               label =3D "u-boot";
> > +                                               reg =3D <0x0000000
> 0x80000>;
> > +                                               read-only;
> > +                                       };
> > +                                       u-boot-env@100000{
> > +                                               label =3D
> "u-boot-env";
> > +                                               reg =3D
> <0x00100000 0x40000>;
> > +                                       };
> > +                                       kernel@200000 {
> > +                                               label =3D "kernel";
> > +                                               reg =3D <0x0200000
> 0x600000>;
> > +                                       };
> > +                                       rofs@800000 {
> > +                                               label =3D "rofs";
> > +                                               reg =3D <0x800000
> 0x1400000>;
> > +                                       };
> > +                                       rwfs@1c00000 {
> > +                                               label =3D "rwfs";
> > +                                               reg =3D <0x1c00000
> 0x300000>;
> > +                                       };
> > +                                       reserved@1f00000 {
> > +                                               label =3D
> "reserved";
> > +                                               reg =3D <0x1f00000
> 0x100000>;
> > +                                       };
> > +                               };
> > +                       };
> > +               };
> > +
> > +               pcimbox: pcimbox@f0848000 {
> > +                       status =3D "okay";
> > +               };
> > +
> > +               apb {
> > +
> > +                       watchdog1: watchdog@901C {
> > +                               status =3D "okay";
> > +                       };
> > +
> > +                       rng: rng@b000 {
> > +                               status =3D "okay";
> > +                       };
> > +
> > +                       serial0: serial@1000 {
> > +                               status =3D "okay";
> > +                       };
> > +
> > +                       serial1: serial@2000 {
> > +                               status =3D "okay";
> > +                       };
> > +
> > +                       serial2: serial@3000 {
> > +                               status =3D "okay";
> > +                       };
> > +
> > +                       serial3: serial@4000 {
> > +                               status =3D "okay";
> > +                       };
> > +
> > +                       adc: adc@c000 {
> > +                               status =3D "okay";
> > +                       };
> > +                       otp:otp@189000 {
> > +                               status =3D "okay";
> > +                       };
> > +
> > +                       i2c0: i2c@80000 {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +                               bus-frequency =3D <100000>;
> > +                               status =3D "disabled";
> > +                       };
> > +
> > +                       i2c1: i2c@81000 {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +                               bus-frequency =3D <100000>;
> > +                               status =3D "okay";
> > +                               lm75@5c {
> > +                                       compatible =3D
> "maxim,max31725";
> > +                                       reg =3D <0x5c>;
> > +                                       status =3D "okay";
> > +                               };
> > +                       };
> > +
> > +                       i2c2: i2c@82000 {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +                               bus-frequency =3D <100000>;
> > +                               status =3D "okay";
> > +                               lm75@5c {
> > +                                       compatible =3D
> "maxim,max31725";
> > +                                       reg =3D <0x5c>;
> > +                                       status =3D "okay";
> > +                               };
> > +                       };
> > +
> > +                       i2c3: i2c@83000 {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +                               bus-frequency =3D <100000>;
> > +                               status =3D "okay";
> > +                               lm75@5c {
> > +                                       compatible =3D
> "maxim,max31725";
> > +                                       reg =3D <0x5c>;
> > +                                       status =3D "okay";
> > +                               };
> > +                       };
> > +
> > +                       i2c4: i2c@84000 {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +                               bus-frequency =3D <100000>;
> > +                               status =3D "okay";
> > +                               lm75@5c {
> > +                                       compatible =3D
> "maxim,max31725";
> > +                                       reg =3D <0x5c>;
> > +                                       status =3D "okay";
> > +                               };
> > +                       };
>=20
> Please be consistent with newlines between blocks as it makes it =
easier to
> read.
>=20
> > +                       i2c5: i2c@85000 {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +                               bus-frequency =3D <100000>;
> > +                               status =3D "disabled";
> > +                       };
> > +                       i2c6: i2c@86000 {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +                               bus-frequency =3D <100000>;
> > +                               status =3D "disabled";
> > +                       };
> > +
> > +                       i2c7: i2c@87000 {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +                               bus-frequency =3D <100000>;
> > +                               status =3D "disabled";
> > +                       };
> > +
> > +                       i2c8: i2c@88000 {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +                               bus-frequency =3D <100000>;
> > +                               status =3D "okay";
> > +                       };
> > +
> > +                       i2c9: i2c@89000 {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +                               bus-frequency =3D <100000>;
> > +                               status =3D "okay";
> > +                               eeprom@55 {
> > +                                       compatible =3D
> "atmel,24c64";
> > +                                       reg =3D <0x55>;
> > +                               };
> > +                       };
> > +
> > +                       i2c10: i2c@8a000 {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +                               bus-frequency =3D <100000>;
> > +                               status =3D "okay";
> > +                               eeprom@55 {
> > +                                       compatible =3D
> "atmel,24c64";
> > +                                       reg =3D <0x55>;
> > +                               };
> > +                       };
> > +
> > +                       i2c11: i2c@8b000 {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +                               bus-frequency =3D <100000>;
> > +                               status =3D "okay";
> > +
> > +                               /* P12V Quarter Brick DC/DC Power
> Module Q54SH12050 @60 */
> > +                               power-brick@36 {
> > +                                       compatible =3D
> "delta,dps800";
> > +                                       reg =3D <0x36>;
> > +                               };
> > +
> > +                               hotswap@15 {
> > +                                       compatible =3D "ti,lm5066i";
> > +                                       reg =3D <0x15>;
> > +                               };
> > +                       };
> > +
> > +                       i2c12: i2c@8c000 {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +                               bus-frequency =3D <100000>;
> > +                               status =3D "okay";
> > +                               ucd90160@6b {
> > +                                       compatible =3D =
"ti,ucd90160";
> > +                                       reg =3D <0x6b>;
> > +                               };
> > +                       };
> > +
> > +                       i2c13: i2c@8d000 {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +                               bus-frequency =3D <100000>;
> > +                               status =3D "okay";
> > +
> > +                               ipmb@40000010 {
> > +                                       compatible =3D
> "slave-mqueue";
> > +                                       reg =3D <0x40000010>;
> > +                                       status =3D "okay";
> > +                               };
> > +                       };
> > +
> > +                       i2c14: i2c@8e000 {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +                               bus-frequency =3D <100000>;
> > +                               status =3D "okay";
> > +
> > +                               ipmb@40000012 {
> > +                                       compatible =3D
> "slave-mqueue";
> > +                                       reg =3D <0x40000012>;
> > +                                       status =3D "okay";
> > +                               };
> > +                       };
> > +
> > +                       i2c15: i2c@8f000 {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +                               bus-frequency =3D <100000>;
> > +                               status =3D "okay";
> > +
> > +                               i2c-switch@75 {
> > +                                       compatible =3D
> "nxp,pca9548";
> > +                                       #address-cells =3D <1>;
> > +                                       #size-cells =3D <0>;
> > +                                       reg =3D <0x75>;
> > +                                       i2c-mux-idle-disconnect;
> > +
> > +                                       i2c_u20: i2c@0 {
> > +                                               #address-cells =3D
> <1>;
> > +                                               #size-cells =3D <0>;
> > +                                               reg =3D <0>;
> > +                                       };
> > +
> > +                                       i2c_u21: i2c@1 {
> > +                                               #address-cells =3D
> <1>;
> > +                                               #size-cells =3D <0>;
> > +                                               reg =3D <1>;
> > +                                       };
> > +
> > +                                       i2c_u22: i2c@2 {
> > +                                               #address-cells =3D
> <1>;
> > +                                               #size-cells =3D <0>;
> > +                                               reg =3D <2>;
> > +                                       };
> > +
> > +                                       i2c_u23: i2c@3 {
> > +                                               #address-cells =3D
> <1>;
> > +                                               #size-cells =3D <0>;
> > +                                               reg =3D <3>;
> > +                                       };
> > +
> > +                                       i2c_u24: i2c@4 {
> > +                                               #address-cells =3D
> <1>;
> > +                                               #size-cells =3D <0>;
> > +                                               reg =3D <4>;
> > +                                       };
> > +
> > +                                       i2c_u25: i2c@5 {
> > +                                               #address-cells =3D
> <1>;
> > +                                               #size-cells =3D <0>;
> > +                                               reg =3D <5>;
> > +                                       };
> > +
> > +                                       i2c_u26: i2c@6 {
> > +                                               #address-cells =3D
> <1>;
> > +                                               #size-cells =3D <0>;
> > +                                               reg =3D <6>;
> > +                                       };
> > +
> > +                                       i2c_u27: i2c@7 {
> > +                                               #address-cells =3D
> <1>;
> > +                                               #size-cells =3D <0>;
> > +                                               reg =3D <7>;
> > +                                       };
> > +                               };
> > +                       };
> > +
> > +                       pwm_fan:pwm-fan-controller@103000 {
> > +                               pinctrl-names =3D "default";
> > +                               pinctrl-0 =3D <&pwm0_pins
> &pwm1_pins &pwm2_pins
> > +                                               &fanin0_pins
> &fanin1_pins
> > +                                               &fanin2_pins
> &fanin3_pins
> > +                                               &fanin4_pins
> &fanin5_pins>;
> > +                               status =3D "okay";
> > +                               fan@0 {
> > +                                       reg =3D <0x00>;
> > +                                       fan-tach-ch =3D /bits/ 8 =
<0x00
> 0x01>;
> > +                                       cooling-levels =3D <127 =
255>;
> > +                               };
> > +                               fan@1 {
> > +                                       reg =3D <0x01>;
> > +                                       fan-tach-ch =3D /bits/ 8 =
<0x02
> 0x03>;
> > +                                       cooling-levels =3D /bits/ 8
> <127 255>;
> > +                               };
> > +                               fan@2 {
> > +                                       reg =3D <0x02>;
> > +                                       fan-tach-ch =3D /bits/ 8 =
<0x04
> 0x05>;
> > +                                       cooling-levels =3D /bits/ 8
> <127 255>;
> > +                               };
> > +                       };
> > +
> > +               };
> > +       };
> > +
> > +
> > +};
> > --
> > 2.21.0
> >

