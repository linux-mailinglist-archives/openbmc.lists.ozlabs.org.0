Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B67E41A4F
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 04:20:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NrDw2SW5zDqwT
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 12:20:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="iP+kK7EM"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="igMP43s4"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NrDF58CRzDqp5
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 12:19:41 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1A312549;
 Tue, 11 Jun 2019 22:19:39 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 11 Jun 2019 22:19:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=SEfxNZJzkZA8QAtHevYxVcqW3vYmVmR
 KrpsK6DO9BnM=; b=iP+kK7EM82/7IHHpisUh0eL5dXH19uEyyJvq2c7Tf0p9asS
 /Q6LrwSNRTR/HrhWQROeZBdZ92BYGUSI/7FR9xLvRo+69RsU8doHi7QwuQu/Pf35
 pyOlFjteciPIw4K7TR3tP/fY6oT7ZxRS3UGl4OYjPPS+8U0cHY6240gFuE+nC4gv
 9DXt1/91nQyU40XFOPi90BOYMkwaD9ZfeM8AbmzVrigcePVyGF+w+ap83QI4czaC
 bDQuFIfFFaj8e/VItmxS9afy8IVnYUWAwqyr4a5PJEGBXB+fQkjPY8DJi1mFLA5t
 KS79auuoQsSYm/YDXdJ62R1wZ3Hz8rtMFN0fKRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=SEfxNZ
 JzkZA8QAtHevYxVcqW3vYmVmRKrpsK6DO9BnM=; b=igMP43s4WdRZYc8tYZPcLy
 Da6zaPpw/KWvlp64MJ1uQujMR5bGbcSTSJYqa2+tV49aC2N4qf8apXj82clp6Bhs
 ldYEArU2o3iVAZhWvoUupGHJfijF8oyQ/cg4MpfAKxppbd4HLQgW/YCRVbXlglur
 laIBFDkBT6X3rWYC3M+1YiZLLhGWLetzmT+4bfXYq1uB/7f/F30DpEuga7d0tX05
 fgRHnuyWGwgW0zNo09i3t7v3oI07gdLSLRhHOLn8PYCUaSw/uIo8fxZqZaebtqdq
 eFWSOaf1/VacZfw0UweySCFc43s3twad2nQWJ7+zO0A0KuPEbo72U7ATqO9dXfvA
 ==
X-ME-Sender: <xms:OWEAXQUCkd-H2vvIjkFyyIU0tx4mJY0CWsTVcYu6tTIkUOWAsnl4IQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehiedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:OWEAXUsTQusNp4KkACimtP5TBKCd0_Fpq1mSDCn7IFUQ6_8jv5B8LA>
 <xmx:OWEAXUqmPqgzdb_6vn-xsNZpr9ibHfIKIV7ei8WI-siLr2MrHdbZ9A>
 <xmx:OWEAXTbhrOecF3nvKZJ-21TV4OjRJpvimCh9yEEp_2_2dSZUWrs68Q>
 <xmx:OmEAXfJWoV8WhosSllDgRhs1qH2fAyZS8-3g8VHrRwa14mGl7hP13A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6F099E00A2; Tue, 11 Jun 2019 22:19:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-663-gf46ad30-fmstable-20190607v1
Mime-Version: 1.0
Message-Id: <d7047bff-acaa-49d1-98e4-6bf901e3c329@www.fastmail.com>
In-Reply-To: <CAARXrtmd8MnBE4x=bsSRmM_rYrhzLnPzpZWpMG+gtknwGC2T=g@mail.gmail.com>
References: <1559787471-3734-1-git-send-email-wangzqbj@inspur.com>
 <CAARXrtmd8MnBE4x=bsSRmM_rYrhzLnPzpZWpMG+gtknwGC2T=g@mail.gmail.com>
Date: Wed, 12 Jun 2019 11:49:36 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: Mine <mine260309@gmail.com>, "John Wang" <wangzqbj@inspur.com>
Subject: Re: [PATCH dev-5.1] ARM: dts: aspeed: Add Inspur fp5280g2 BMC machine
Content-Type: text/plain
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

Hi John,

On Thu, 6 Jun 2019, at 17:22, Lei YU wrote:
> Reviewed-by: Lei YU <mine260309@gmail.com>
> 
> On Thu, Jun 6, 2019 at 10:18 AM John Wang <wangzqbj@inspur.com> wrote:
> >
> > The fp5280g2 is an open-power server platform with
> > an aspeed ast2500 BMC
> >
> > Signed-off-by: John Wang <wangzqbj@inspur.com>
> > ---
> >  arch/arm/boot/dts/Makefile                       |   1 +
> >  arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts | 843 +++++++++++++++++++++++
> >  2 files changed, 844 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index bed2047..31db1d3 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1256,6 +1256,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
> >         aspeed-bmc-facebook-cmm.dtb \
> >         aspeed-bmc-facebook-tiogapass.dtb \
> >         aspeed-bmc-intel-s2600wf.dtb \
> > +       aspeed-bmc-inspur-fp5280g2.dtb \
> >         aspeed-bmc-lenovo-hr630.dtb \
> >         aspeed-bmc-microsoft-olympus.dtb \
> >         aspeed-bmc-opp-lanyang.dtb \
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> > new file mode 100644
> > index 0000000..771de77
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> > @@ -0,0 +1,843 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/dts-v1/;
> > +#include "aspeed-g5.dtsi"
> > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > +#include <dt-bindings/leds/leds-pca955x.h>
> > +
> > +/ {
> > +       model = "FP5280G2 BMC";
> > +       compatible = "inspur,fp5280g2-bmc", "aspeed,ast2500";
> > +
> > +       chosen {
> > +               stdout-path = &uart5;
> > +               bootargs = "console=ttyS4,115200 earlyprintk";
> > +       };
> > +
> > +       memory@80000000 {
> > +               reg = <0x80000000 0x20000000>;
> > +       };
> > +
> > +       reserved-memory {
> > +               #address-cells = <1>;
> > +               #size-cells = <1>;
> > +               ranges;
> > +
> > +               vga_memory: framebuffer@9f000000 {
> > +                       no-map;
> > +                       reg = <0x9f000000 0x01000000>; /* 16M */
> > +               };
> > +
> > +               flash_memory: region@98000000 {
> > +                       no-map;
> > +                       reg = <0x98000000 0x04000000>; /* 64M */
> > +               };
> > +
> > +               coldfire_memory: codefire_memory@9ef00000 {
> > +                       reg = <0x9ef00000 0x00100000>;
> > +                       no-map;
> > +               };
> > +
> > +               gfx_memory: framebuffer {
> > +                       size = <0x01000000>;
> > +                       alignment = <0x01000000>;
> > +                       compatible = "shared-dma-pool";
> > +                       reusable;
> > +               };
> > +
> > +               video_engine_memory: jpegbuffer {
> > +                       size = <0x02000000>;    /* 32M */
> > +                       alignment = <0x01000000>;
> > +                       compatible = "shared-dma-pool";
> > +                       reusable;
> > +               };
> > +       };
> > +
> > +       fsi: gpio-fsi {
> > +               compatible = "fsi-master-gpio", "fsi-master";
> > +               #address-cells = <2>;
> > +               #size-cells = <0>;
> > +               no-gpio-delays;
> > +
> > +               memory-region = <&coldfire_memory>;
> > +               aspeed,sram = <&sram>;
> > +               aspeed,cvic = <&cvic>;
> > +
> > +               clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
> > +               data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
> > +               mux-gpios = <&gpio ASPEED_GPIO(I, 2) GPIO_ACTIVE_HIGH>;
> > +               enable-gpios = <&gpio ASPEED_GPIO(I, 3) GPIO_ACTIVE_HIGH>;
> > +               trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
> > +       };
> > +
> > +       gpio-keys {
> > +               compatible = "gpio-keys";
> > +
> > +               checkstop {
> > +                       label = "checkstop";
> > +                       gpios = <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_LOW>;
> > +                       linux,code = <ASPEED_GPIO(B, 3)>;
> > +               };
> > +
> > +               ps0-presence {
> > +                       label = "ps0-presence";
> > +                       gpios = <&gpio ASPEED_GPIO(F, 0) GPIO_ACTIVE_LOW>;
> > +                       linux,code = <ASPEED_GPIO(F, 0)>;
> > +               };
> > +
> > +               ps1-presence {
> > +                       label = "ps1-presence";
> > +                       gpios = <&gpio ASPEED_GPIO(F, 1) GPIO_ACTIVE_LOW>;
> > +                       linux,code = <ASPEED_GPIO(F, 1)>;
> > +               };
> > +
> > +       };
> > +
> > +       gpio-keys-polled {
> > +               compatible = "gpio-keys-polled";
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +               poll-interval = <1000>;
> > +
> > +               fan0-presence {
> > +                       label = "fan0-presence";
> > +                       gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
> > +                       linux,code = <0>;
> > +               };
> > +
> > +               fan1-presence {
> > +                       label = "fan1-presence";
> > +                       gpios = <&pca1 1 GPIO_ACTIVE_LOW>;
> > +                       linux,code = <1>;
> > +               };
> > +
> > +               fan2-presence {
> > +                       label = "fan2-presence";
> > +                       gpios = <&pca1 2 GPIO_ACTIVE_LOW>;
> > +                       linux,code = <2>;
> > +               };
> > +
> > +               fan3-presence {
> > +                       label = "fan3-presence";
> > +                       gpios = <&pca1 3 GPIO_ACTIVE_LOW>;
> > +                       linux,code = <3>;
> > +               };
> > +
> > +               fan4-presence {
> > +                       label = "fan4-presence";
> > +                       gpios = <&pca1 4 GPIO_ACTIVE_LOW>;
> > +                       linux,code = <4>;
> > +               };
> > +
> > +               fan5-presence {
> > +                       label = "fan5-presence";
> > +                       gpios = <&pca1 5 GPIO_ACTIVE_LOW>;
> > +                       linux,code = <5>;
> > +               };
> > +
> > +               fan6-presence {
> > +                       label = "fan6-presence";
> > +                       gpios = <&pca1 6 GPIO_ACTIVE_LOW>;
> > +                       linux,code = <6>;
> > +               };
> > +
> > +               fan7-presence {
> > +                       label = "fan7-presence";
> > +                       gpios = <&pca1 7 GPIO_ACTIVE_LOW>;
> > +                       linux,code = <7>;
> > +               };
> > +       };
> > +
> > +       leds {
> > +           compatible = "gpio-leds";
> > +
> > +           power {
> > +                   label = "power";
> > +                   /* TODO: dummy gpio */
> > +                   gpios = <&gpio ASPEED_GPIO(R, 1) GPIO_ACTIVE_LOW>;
> > +           };
> > +
> > +       };
> > +
> > +       iio-hwmon-battery {
> > +               compatible = "iio-hwmon";
> > +               io-channels = <&adc 15>;
> > +       };
> > +
> > +       iio-hwmon {
> > +               compatible = "iio-hwmon";
> > +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
> > +                       <&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>,
> > +                       <&adc 10>, <&adc 11>, <&adc 12>, <&adc 13>, <&adc 14>;
> > +       };
> > +
> > +};
> > +
> > +&fmc {
> > +       status = "okay";
> > +
> > +       flash@0 {
> > +               status = "okay";
> > +               label = "bmc";
> > +               m25p,fast-read;
> > +               spi-max-frequency = <50000000>;
> > +#include "openbmc-flash-layout.dtsi"
> > +       };
> > +};
> > +
> > +&spi1 {
> > +       status = "okay";
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&pinctrl_spi1_default>;
> > +
> > +       flash@0 {
> > +               status = "okay";
> > +               label = "pnor";
> > +               m25p,fast-read;
> > +               spi-max-frequency = <100000000>;
> > +       };
> > +};
> > +
> > +&uart1 {
> > +       /* Rear RS-232 connector */
> > +       status = "okay";
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&pinctrl_txd1_default
> > +                       &pinctrl_rxd1_default
> > +                       &pinctrl_nrts1_default
> > +                       &pinctrl_ndtr1_default
> > +                       &pinctrl_ndsr1_default
> > +                       &pinctrl_ncts1_default
> > +                       &pinctrl_ndcd1_default
> > +                       &pinctrl_nri1_default>;
> > +};
> > +
> > +&uart2 {
> > +       /* Test Point */
> > +       status = "okay";
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&pinctrl_txd2_default &pinctrl_rxd2_default>;
> > +};
> > +
> > +&uart3 {
> > +       /* APSS */
> > +       status = "okay";
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&pinctrl_txd3_default &pinctrl_rxd3_default>;
> > +};
> > +
> > +&uart5 {
> > +       status = "okay";
> > +};
> > +
> > +&lpc_ctrl {
> > +       status = "okay";
> > +       memory-region = <&flash_memory>;
> > +       flash = <&spi1>;
> > +};
> > +
> > +&mbox {
> > +       status = "okay";

Are you sure this is necessary? We're planning to drop mbox support in the near
future, so just want to make sure you're aware of that.

> > +};
> > +
> > +&mac0 {
> > +       status = "okay";
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&pinctrl_rmii1_default>;
> > +       use-ncsi;
> > +};
> > +
> > +&mac1 {
> > +       status = "okay";
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> > +};
> > +
> > +&i2c0 {
> > +       /* LCD */
> > +       status = "okay";
> > +};
> > +
> > +&i2c1 {
> > +       status = "okay";
> > +
> > +       eeprom@50 {
> > +               compatible = "atmel,24c256";
> > +               reg = <0x50>;
> > +               label = "fru";
> > +       };
> > +
> > +};
> > +
> > +&i2c2 {
> > +       status = "okay";
> > +
> > +       tmp112@48 {
> > +               compatible = "ti,tmp112";
> > +               reg = <0x48>;
> > +               label = "inlet";
> > +       };
> > +
> > +       tmp112@49 {
> > +               compatible = "ti,tmp112";
> > +               reg = <0x49>;
> > +               label = "outlet";
> > +       };
> > +
> > +       i2c-switch@70 {
> > +               compatible = "nxp,pca9546";
> > +               reg = <0x70>;
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               i2c@0 {
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +                       reg = <0>;
> > +
> > +                       tmp112@4a {
> > +                               compatible = "ti,tmp112";
> > +                               reg = <0x4a>;
> > +                               label = "psu_inlet";
> > +                       };
> > +
> > +               };
> > +
> > +               i2c@1 {
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +                       reg = <1>;
> > +
> > +                       tmp112@4a {
> > +                               compatible = "ti,tmp112";
> > +                               reg = <0x4a>;
> > +                               label = "ocp_zone";
> > +                       };
> > +               };
> > +
> > +               i2c@2 {
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +                       reg = <2>;
> > +
> > +                       tmp112@4a {
> > +                               compatible = "ti,tmp112";
> > +                               reg = <0x4a>;
> > +                               label = "bmc_zone";
> > +                       };
> > +               };
> > +
> > +               i2c@3 {
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +                       reg = <3>;
> > +
> > +                       tmp112@7c {
> > +                               compatible = "emc1413";

Should have a "microchip," prefix?

> > +                               reg = <0x7c>;
> > +                       };
> > +               };
> > +
> > +       };
> > +};
> > +
> > +&i2c3 {
> > +       /* Riser Card */
> > +       status = "okay";
> > +};
> > +
> > +&i2c4 {
> > +       status = "okay";
> > +
> > +       rtc@68 {
> > +               compatible = "dallas,ds3232";
> > +               reg = <0x68>;
> > +       };
> > +};
> > +
> > +&i2c5 {
> > +       /* vr  */
> > +       status = "okay";
> > +};
> > +
> > +&i2c6 {
> > +       /* bp card */
> > +       status = "okay";
> > +};
> > +
> > +&i2c7 {
> > +       status = "okay";
> > +
> > +       i2c-switch@70 {
> > +               compatible = "nxp,pca9546";
> > +               reg = <0x70>;
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               i2c@0 {
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +                       reg = <0>;
> > +
> > +                       adm1278@10 {
> > +                               compatible = "adi,adm1278";
> > +                               reg = <0x10>;
> > +                       };
> > +
> > +                       adm1278@13 {
> > +                               compatible = "adi,adm1278";
> > +                               reg = <0x13>;
> > +                       };
> > +
> > +                       adm1278@50 {
> > +                               compatible = "adi,adm1278";
> > +                               reg = <0x50>;
> > +                       };
> > +
> > +                       adm1278@53 {
> > +                               compatible = "adi,adm1278";
> > +                               reg = <0x53>;
> > +                       };
> > +
> > +               };
> > +
> > +               /*pcie riser*/
> > +
> > +       };
> > +};
> > +
> > +&i2c8 {
> > +       status = "okay";
> > +
> > +       pca0: pca9555@20 {
> > +               compatible = "nxp,pca9555";
> > +               reg = <0x20>;
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               gpio-controller;
> > +               #gpio-cells = <2>;
> > +
> > +               gpio@0 {
> > +                       reg = <0>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@1 {
> > +                       reg = <1>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@2 {
> > +                       reg = <2>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@3 {
> > +                       reg = <3>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@4 {
> > +                       reg = <4>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@5 {
> > +                       reg = <5>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@6 {
> > +                       reg = <6>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@7 {
> > +                       reg = <7>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +       };
> > +
> > +       pca1: pca9555@21 {
> > +               compatible = "nxp,pca9555";
> > +               reg = <0x21>;
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               gpio-controller;
> > +               #gpio-cells = <2>;
> > +
> > +               gpio@0 {
> > +                       reg = <0>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@1 {
> > +                       reg = <1>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@2 {
> > +                       reg = <2>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@3 {
> > +                       reg = <3>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@4 {
> > +                       reg = <4>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@5 {
> > +                       reg = <5>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@6 {
> > +                       reg = <6>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@7 {
> > +                       reg = <7>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +       };
> > +
> > +       pca2: pca9555@22 {
> > +               compatible = "nxp,pca9555";
> > +               reg = <0x22>;
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               gpio-controller;
> > +               #gpio-cells = <2>;
> > +
> > +               gpio@0 {
> > +                       reg = <0>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@1 {
> > +                       reg = <1>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@2 {
> > +                       reg = <2>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@3 {
> > +                       reg = <3>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@4 {
> > +                       reg = <4>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@5 {
> > +                       reg = <5>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@6 {
> > +                       reg = <6>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@7 {
> > +                       reg = <7>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +       };
> > +
> > +       pca3: pca9555@23 {
> > +               compatible = "nxp,pca9555";
> > +               reg = <0x23>;
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               gpio-controller;
> > +               #gpio-cells = <2>;
> > +
> > +               gpio@0 {
> > +                       reg = <0>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@1 {
> > +                       reg = <1>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@2 {
> > +                       reg = <2>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@3 {
> > +                       reg = <3>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@4 {
> > +                       reg = <4>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@5 {
> > +                       reg = <5>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@6 {
> > +                       reg = <6>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@7 {
> > +                       reg = <7>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +       };
> > +
> > +       pca4: pca9555@24 {
> > +               compatible = "nxp,pca9555";
> > +               reg = <0x24>;
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               gpio-controller;
> > +               #gpio-cells = <2>;
> > +
> > +               gpio@0 {
> > +                       reg = <0>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@1 {
> > +                       reg = <1>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@2 {
> > +                       reg = <2>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@3 {
> > +                       reg = <3>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@4 {
> > +                       reg = <4>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@5 {
> > +                       reg = <5>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@6 {
> > +                       reg = <6>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@7 {
> > +                       reg = <7>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +       };
> > +
> > +       pca5: pca9555@25 {
> > +               compatible = "nxp,pca9555";
> > +               reg = <0x25>;
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               gpio-controller;
> > +               #gpio-cells = <2>;
> > +
> > +               gpio@0 {
> > +                       reg = <0>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@1 {
> > +                       reg = <1>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@2 {
> > +                       reg = <2>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@3 {
> > +                       reg = <3>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@4 {
> > +                       reg = <4>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@5 {
> > +                       reg = <5>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@6 {
> > +                       reg = <6>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@7 {
> > +                       reg = <7>;
> > +                       type = <PCA955X_TYPE_GPIO>;
> > +               };
> > +       };
> > +
> > +};
> > +
> > +&i2c9 {
> > +       /* cpld */
> > +       status = "okay";
> > +};
> > +
> > +&i2c10 {
> > +       /* hdd bp */
> > +       status = "okay";
> > +};
> > +
> > +&i2c11 {
> > +       status = "okay";
> > +
> > +       power-supply@58 {
> > +               compatible = "pmbus";
> > +               reg = <0x58>;
> > +       };
> > +
> > +       power-supply@5a {
> > +               compatible = "pmbus";
> > +               reg = <0x5a>;
> > +       };
> > +};
> > +
> > +&i2c12 {
> > +       /* odcc */
> > +       status = "okay";
> > +};
> > +
> > +&vuart {
> > +       status = "okay";
> > +};
> > +
> > +&gfx {
> > +       status = "okay";
> > +       memory-region = <&gfx_memory>;
> > +};
> > +
> > +&pinctrl {
> > +       aspeed,external-nodes = <&gfx &lhc>;
> > +};
> > +
> > +&gpio {
> > +       pin_gpio_b7 {
> > +               gpio-hog;
> > +               gpios = <ASPEED_GPIO(B,7) GPIO_ACTIVE_LOW>;
> > +               output-high;
> > +               line-name = "BMC_INIT_OK";
> > +       };
> > +};
> > +
> > +&wdt1 {
> > +       aspeed,reset-type = "none";
> > +       aspeed,external-signal;
> > +       aspeed,ext-push-pull;
> > +       aspeed,ext-active-high;
> > +
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&pinctrl_wdtrst1_default>;
> > +};
> > +
> > +&ibt {
> > +       status = "okay";
> > +
> > +};
> > +
> > +&adc {
> > +       status = "okay";

Please add the pinctrl properties to mux the necessary ADC lines which you have
associated with the iio-hwmon bridge (you've used lines 0-14).

Cheers,

Andrew
