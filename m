Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7962F435A6B
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 07:44:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZbyC6D0qz3cD8
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 16:44:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Z6xSwZ4l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32;
 helo=mail-qv1-xf32.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Z6xSwZ4l; dkim-atps=neutral
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZbxs5fcQz2yHb
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 16:43:45 +1100 (AEDT)
Received: by mail-qv1-xf32.google.com with SMTP id d6so231447qvb.3
 for <openbmc@lists.ozlabs.org>; Wed, 20 Oct 2021 22:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/iknWJdbOV0ym82Bhz86MhA2uMqniM8elD++tXfamgM=;
 b=Z6xSwZ4l14xJ7AiimDE/6fzN8pmnRTPJAIozjHt8NHAHbmbMEeUccTeh2+BdnkBfNW
 dMzaCIxtoe24O6W/A9+wCg18TTrU6RKxTdkO+opmCfwfxq9Dhw37JRLN1yxrHzibwo/6
 oIfP9fL6xLY6Z0hHfY1Wt906YhpD+IRT8L/LM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/iknWJdbOV0ym82Bhz86MhA2uMqniM8elD++tXfamgM=;
 b=InZAjM2I/8L83cT4M66PHmUT0jnHiVw+1iu4m9cDCnUdufyD4dUFeI/4iSr/3lKqsv
 ogFM28VnmaD6WnbRlFpijNOw//64FQ0qTkZasBMB2VQJWhOA+O4CRNAkTUWmF5hCgi9r
 iekEZDGvsRRu96Q7APDnjEaK9kxJIkZ5QL5DGdF8l9wjZ9YruDADeRSPFHoFrkNB9ZPG
 Y7aIr5/1oDke0dX+BidPtn8vVDI7hT7ZvjfssznpCnIV30XndZq5oVyC/zMZD10tHavt
 0ywW00ZOw0S2qSfNbUYZ4H4Ihol6xbHDEvKmUkMtSw6Ue0euxSOLUC+a51oa1T4GqOa8
 xrUA==
X-Gm-Message-State: AOAM533p6xEU5kPo9muwu1d4C9viasUAJUXiaGe7sYkQD+GFQq+u6QoS
 XudTN23lf9bDXnk7jHaTQrXBmn8CZRgsQCwGMC0=
X-Google-Smtp-Source: ABdhPJwargQ5VjXMmLqEyJkvWJOipQ63WFMMxHVCFnk0O9Zt/JENK9JHcoEJXyTeMMEJMyvz7BxrJcJQ3i7kaFY3LUA=
X-Received: by 2002:a05:6214:98d:: with SMTP id
 dt13mr3120253qvb.13.1634795021368; 
 Wed, 20 Oct 2021 22:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <5804770039e74d319fee323d28bdcf46@inventec.com>
 <7d7b20575f994a3c9018223a3c5f198d@inventec.com>
In-Reply-To: <7d7b20575f994a3c9018223a3c5f198d@inventec.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Oct 2021 05:43:29 +0000
Message-ID: <CACPK8XcCmQ5UrNe+d-iZy32SM6rUDAs7XW6je+M-_80w7zOL9Q@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: dts: aspeed: Adding Inventec Transformers BMC
To: =?UTF-8?B?TGluLlRvbW15U0Mg5p6X5LiW5qy9IFRBTw==?= <Lin.TommySC@inventec.com>
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
Cc: =?UTF-8?B?WWUuVmljIOiRieWuh+a4hSBUQU8=?= <ye.vic@inventec.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 19 Oct 2021 at 08:42, Lin.TommySC =E6=9E=97=E4=B8=96=E6=AC=BD TAO
<Lin.TommySC@inventec.com> wrote:
>
> Initial introduction of Inventec Transformers x86 family equipped with AS=
T2600 BMC SoC.
>
> Signed-off-by: Tommy Lin <Lin.TommySC@inventec.com>
> ---
>  .../dts/aspeed-bmc-inventec-transformers.dts  | 328 ++++++++++++++++++

You've dropped the part of the change that adds the dts to the makefile.

Reviewed-by: Joel Stanley <joel@jms.id.au>

The rest looks okay, so I've fixed that up for you and applied it.

>  1 file changed, 328 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dt=
s
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts b/arc=
h/arm/boot/dts/aspeed-bmc-inventec-transformers.dts
> new file mode 100644
> index 000000000000..e50d8828e684
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts
> @@ -0,0 +1,328 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2021 Inventec Corp.
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include "aspeed-g6-pinctrl.dtsi"
> +#include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model =3D "TRANSFORMERS BMC";
> +       compatible =3D "inventec,transformer-bmc", "aspeed,ast2600";
> +
> +       aliases {
> +               serial4 =3D &uart5;
> +       };
> +
> +       chosen {
> +               stdout-path =3D &uart5;
> +               bootargs =3D "console=3DttyS4,115200n8";
> +       };
> +
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x80000000 0x80000000>;
> +       };
> +
> +       leds {
> +               compatible =3D "gpio-leds";
> +
> +               // UID led
> +               uid {
> +                       label =3D "UID_LED";
> +                       gpios =3D <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_L=
OW>;
> +               };
> +
> +               // Heart beat led
> +               heartbeat {
> +                       label =3D "HB_LED";
> +                       gpios =3D <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_L=
OW>;
> +               };
> +       };
> +};
> +
> +&mdio0 {
> +       status =3D "okay";
> +
> +       ethphy0: ethernet-phy@0 {
> +               compatible =3D "ethernet-phy-ieee802.3-c22";
> +               reg =3D <1>;
> +       };
> +};
> +
> +&mac3 {
> +       status =3D "okay";
> +       phy-mode =3D "rgmii";
> +       phy-handle =3D <&ethphy0>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_rgmii4_default>;
> +};
> +
> +&fmc {
> +       status =3D "okay";
> +
> +       flash@0 {
> +               status =3D "okay";
> +               m25p,fast-read;
> +               label =3D "bmc";
> +               spi-max-frequency =3D <33000000>;
> +               spi-tx-bus-width =3D <2>;
> +               spi-rx-bus-width =3D <2>;
> +#include "openbmc-flash-layout.dtsi"
> +       };
> +
> +       flash@1 {
> +               status =3D "okay";
> +               m25p,fast-read;
> +               label =3D "bmc2";
> +               spi-max-frequency =3D <33000000>;
> +               spi-tx-bus-width =3D <2>;
> +               spi-rx-bus-width =3D <2>;
> +       };
> +};
> +
> +&spi1 {
> +       status =3D "okay";
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_spi1_default>;
> +
> +       flash@0 {
> +               status =3D "okay";
> +               m25p,fast-read;
> +               label =3D "bios";
> +               spi-max-frequency =3D <33000000>;
> +               spi-tx-bus-width =3D <1>;
> +               spi-rx-bus-width =3D <1>;
> +       };
> +};
> +
> +&wdt1 {
> +       status =3D "okay";
> +};
> +
> +&uart1 {
> +       status =3D "okay";
> +};
> +
> +&uart5 {
> +       status =3D "okay";
> +};
> +
> +&i2c0 {
> +       status =3D "okay";
> +
> +       //Set bmc' slave address;
> +       bmc_slave@10 {
> +               compatible =3D "ipmb-dev";
> +               reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +               i2c-protocol;
> +       };
> +};
> +
> +&i2c2 {
> +       status =3D "okay";
> +};
> +
> +&i2c3 {
> +       // FRU AT24C512C-SSHM-T
> +       status =3D "okay";
> +       eeprom@50 {
> +               compatible =3D "atmel,24c512";
> +               reg =3D <0x50>;
> +               pagesize =3D <128>;
> +       };
> +};
> +
> +&i2c5 {
> +       status =3D "okay";
> +};
> +
> +&i2c6 {
> +       status =3D "okay";
> +
> +       tmp75@49 {
> +               compatible =3D "ti,tmp75";
> +               reg =3D <0x49>;
> +       };
> +
> +       tmp75@4f {
> +               compatible =3D "ti,tmp75";
> +               reg =3D <0x4f>;
> +       };
> +
> +       tmp468@48 {
> +               compatible =3D "ti,tmp468";
> +               reg =3D <0x48>;
> +       };
> +};
> +
> +&i2c7 {
> +       status =3D "okay";
> +       adm1278@40 {
> +               compatible =3D "adi,adm1278";
> +               reg =3D <0x40>;
> +       };
> +};
> +
> +
> +&i2c8 {
> +       // FRU AT24C512C-SSHM-T
> +       status =3D "okay";
> +
> +       eeprom@51 {
> +               compatible =3D "atmel,24c512";
> +               reg =3D <0x51>;
> +               pagesize =3D <128>;
> +       };
> +
> +       eeprom@53 {
> +               compatible =3D "atmel,24c512";
> +               reg =3D <0x53>;
> +               pagesize =3D <128>;
> +       };
> +};
> +
> +&i2c9 {
> +       // M.2
> +       status =3D "okay";
> +};
> +
> +&i2c10 {
> +       // I2C EXPANDER
> +       status =3D "okay";
> +
> +       i2c-switch@71 {
> +               compatible =3D "nxp,pca9544";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               reg =3D <0x71>;
> +       };
> +
> +       i2c-switch@73 {
> +               compatible =3D "nxp,pca9544";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               reg =3D <0x73>;
> +       };
> +};
> +
> +&i2c11 {
> +       // I2C EXPANDER
> +       status =3D "okay";
> +
> +       i2c-switch@70 {
> +               compatible =3D "nxp,pca9544";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               reg =3D <0x70>;
> +
> +               pcie_eeprom_riser1: i2c@0 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <0>;
> +
> +                       eeprom@55 {
> +                               compatible =3D "atmel,24c512";
> +                               reg =3D <0x55>;
> +                               pagesize =3D <128>;
> +                       };
> +               };
> +
> +               pcie_eeprom_riser2: i2c@1 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <1>;
> +
> +                       eeprom@55 {
> +                               compatible =3D "atmel,24c512";
> +                               reg =3D <0x55>;
> +                               pagesize =3D <128>;
> +                       };
> +               };
> +
> +               pcie_eeprom_riser3: i2c@2 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <2>;
> +
> +                       eeprom@55 {
> +                               compatible =3D "atmel,24c512";
> +                               reg =3D <0x55>;
> +                               pagesize =3D <128>;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c12 {
> +       status =3D "okay";
> +
> +       psu0:psu0@58 {
> +               compatible =3D "pmbus";
> +               reg =3D <0x58>;
> +       };
> +};
> +
> +&gpio0 {
> +       status =3D "okay";
> +       gpio-line-names =3D
> +       /*A0-A7*/   "","","","","","","","",
> +       /*B0-B7*/   "presence-ps0","power-chassis-good","","","","","pres=
ence-ps1","",
> +       /*C0-C7*/   "","","","","","","","",
> +       /*D0-D7*/   "","","","","","","","",
> +       /*E0-E7*/   "","","","","","","","",
> +       /*F0-F7*/   "","","","","power-chassis-control","","","",
> +       /*G0-G7*/   "","","jtag-mux","","","","","",
> +       /*H0-H7*/   "","","","","reset-button","power-button","","",
> +       /*I0-I7*/   "","","","","","","","",
> +       /*J0-J7*/   "","","","","","","","",
> +       /*K0-K7*/   "","","","","","","","",
> +       /*L0-L7*/   "","","","","","","","",
> +       /*M0-M7*/   "","","","","","","","",
> +       /*N0-N7*/   "","","","","","","","",
> +       /*O0-O7*/   "","","","","","","","",
> +       /*P0-P7*/   "","","","tck-mux","","","","",
> +       /*Q0-Q7*/   "","","","","","","","",
> +       /*R0-R7*/   "","","","","","","","",
> +       /*S0-S7*/   "","","","","","","","",
> +       /*T0-T7*/   "","","","","","","","",
> +       /*U0-U7*/   "","nmi-button","","","","","","",
> +       /*V0-V7*/   "","","","","power-config-full-load","","","",
> +       /*W0-W7*/   "","","","","","","","",
> +       /*X0-X7*/   "","","","","","","","",
> +       /*Y0-Y7*/   "","","","","","","","",
> +       /*Z0-Z7*/   "","","","","","","","",
> +       /*AA0-AA7*/ "","","","","","","","",
> +       /*AB0-AB7*/ "","","","","","","","",
> +       /*AC0-AC7*/ "","","","","","","","";
> +};
> +
> +&lpc_snoop {
> +       status =3D "okay";
> +       snoop-ports =3D <0x80>;
> +};
> +
> +&emmc_controller {
> +       status =3D "okay";
> +};
> +
> +&emmc {
> +       status =3D "okay";
> +       non-removable;
> +       max-frequency =3D <52000000>;
> +       bus-width =3D <8>;
> +};
> +
> +&vhub {
> +       status =3D "okay";
> +       aspeed,vhub-downstream-ports =3D <7>;
> +       aspeed,vhub-generic-endpoints =3D <21>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_usb2ad_default>;
> +};
> +
> +&rtc {
> +       status =3D "okay";
> +};
> --
> 2.33.0
>
