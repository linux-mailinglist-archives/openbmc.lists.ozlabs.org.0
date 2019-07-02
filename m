Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED975C8F5
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 07:47:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dCtV2H1gzDqXP
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 15:47:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="RM9kTVaX"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dCq92KgJzDqX1
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jul 2019 15:44:20 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id c70so13001582qkg.7
 for <openbmc@lists.ozlabs.org>; Mon, 01 Jul 2019 22:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=36b4QxAg2smpXceqp2IN3HB3nCKpZLfhM2kV3fRumJ8=;
 b=RM9kTVaXrW+Nv/AzZWaGjFoI6Mmdh3hNhCyVwBCEZwo7NSxv3jW6M/Sft5QZyLOOWR
 Q1hRg0zxy/+bdnhgQl3o3V2IZDYSgt9XhiAdNVuD2YBoiTR4H5Hdx7D7ufC0FHRGpHuo
 4xoYVCSFlL9tafdjOShWXUezBC7W1wMfrNHXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=36b4QxAg2smpXceqp2IN3HB3nCKpZLfhM2kV3fRumJ8=;
 b=ERoGxwhUJZ7X8i/zpmnTTdot1DGlsjDH8OV+NJ5MaOss53l5IEV3uY+jbg7tFwuzmB
 Eb5MRpLsJAp8vE2AxTMeTAUbb7DgJPnVBAxXfQJMpgh7O9MwIpwWz3O+HhTW/y8DU1Oe
 CRVjJDBf2pqjZMPKYWChcMubFszxjuuAXXmLQ5xXWAFB3hko4Ncxpnhrxp2QV9EZBPwF
 wzJ+g1kifBQ4bFe4uK20GKqMXu8eiTGk4Trj1SzSGmW8iz4PFp6M+j4wK5jVpa9yae0f
 v2UniYePxnPs+ZD4ha8WD9PB1pfZHwBfys4inyswM+kXsTTrUeAkeZS3ojUjU+xMMOQy
 VXBA==
X-Gm-Message-State: APjAAAW5bfoLOTHgO/sJXpZQiqRUIwgQBbzX2N3cyP35TE/3HWoBLQ4B
 sHBNI/XnnvOXKzveXWYKHAlpXUk3n2vtFA06lpc=
X-Google-Smtp-Source: APXvYqx/Fv3Z+4YItQWkhGCjGRLZoTdL754vyWJOs06n2PJNy+y5h1dK8CBDqFdmJAoD3vqcUnNNWaQijpUVSicbikE=
X-Received: by 2002:a05:620a:1113:: with SMTP id
 o19mr24326279qkk.330.1562046256961; 
 Mon, 01 Jul 2019 22:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190701060137.22116-1-chyishian.jiang@gmail.com>
 <CACPK8XdR-hSNu+dQHus6_m6K+ERcdLEOg42fD94y5RuYPnM7nQ@mail.gmail.com>
 <b5f37427-547f-4a16-94bb-4a8e4dd2ab1b@Spark>
In-Reply-To: <b5f37427-547f-4a16-94bb-4a8e4dd2ab1b@Spark>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Jul 2019 05:44:05 +0000
Message-ID: <CACPK8XeY3tfhE-S_kyFo5KZTDkP7hoNYnkj4WVJTrA8_jWvCPw@mail.gmail.com>
Subject: Re: [PATCH dev-5.17 v1 1/6] ARM: dts: nuvoton: Add Nuvoton RunBMC
 DeviceTree
To: =?UTF-8?B?U2FtdWVsIEppYW5nICjmsZ/pqI/lhYgp?= <Samuel.Jiang@quantatw.com>
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
Cc: "KWLIU@nuvoton.com" <KWLIU@nuvoton.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Samuel Jiang <chyishian.jiang@gmail.com>,
 Tomer Maimon <tomer.maimon@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 1 Jul 2019 at 08:25, Samuel Jiang (=E6=B1=9F=E9=A8=8F=E5=85=88)
<Samuel.Jiang@quantatw.com> wrote:
>
> Hi Joel,
>
> Do you intend submit these patches to the mainline kernel for review?
> I would like to see them submitted there first.
>
> No, the patches still could not submit to the mainline kernel. We need Nu=
voton teams help fill up the related source code in the mainline.

Why can't you submit them?

Patches are held in the openbmc tree only if they are on their way to
be included in an upstream release.

>
> When you do that, you don't need the "dev-5.17" part in your patch
> subjects. You also can include the "tested" information in the cover
> letter, but not in the patches themselves.
>
> Based on the above reason, I prefer to keep =E2=80=9Cdev-5.17=E2=80=9D pa=
rt first and will update 1/6 patches information.

Do you mean 5.1?

> After Nuvoton team members back, I will discuss with them the mainline si=
tuation.
>
> Thanks,
>
> Samuel Jiang
> On Jul 1, 2019, 2:57 PM +0800, Joel Stanley <joel@jms.id.au>, wrote:
>
> Hi Samuel,
>
> On Mon, 1 Jul 2019 at 06:02, Samuel Jiang <chyishian.jiang@gmail.com> wro=
te:
>
>
> From: Samuel Jiang <Samuel.Jiang@quantatw.com>
>
> Initial Nuvoton RunBMC Module which use NPCM750 SoC.
>
> Including features:
> 1. image partitions
> 2. lpc and kcs
> 3. usb
> 4. serial port
> 5. spi
> 6. fiu
> 7. watchdog
>
>
> Do you intend submit these patches to the mainline kernel for review?
> I would like to see them submitted there first.
>
> When you do that, you don't need the "dev-5.17" part in your patch
> subjects. You also can include the "tested" information in the cover
> letter, but not in the patches themselves.
>
> Please test against 5.2.
>
> Once these patches have had review we can include them in the openbmc tre=
e.
>
> Cheers,
>
> Joel
>
>
> Testeed:
> Build Qunata runbmc-nuvoton image and load on RunBMC-nuvoton module
>
> Signed-off-by: Samuel Jiang <Samuel.Jiang@quantatw.com>
> ---
> arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts | 292 +++++++++++++++++++
> 1 file changed, 292 insertions(+)
> create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts b/arch/arm/boot=
/dts/nuvoton-npcm750-runbmc.dts
> new file mode 100644
> index 000000000000..eec815d2a638
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
> @@ -0,0 +1,292 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019 Nuvoton Technology kwliu@nuvoton.com
> +// Copyright (c) 2019 Quanta Computer Inc. Samuel.Jiang@quantatw.com
> +
> +/dts-v1/;
> +#include "nuvoton-npcm750.dtsi"
> +
> +/ {
> + model =3D "Nuvoton npcm750 RunBMC Module";
> + compatible =3D "nuvoton,npcm750";
> +
> + aliases {
> + ethernet0 =3D &emc0;
> + ethernet1 =3D &gmac0;
> + serial0 =3D &serial0;
> + serial1 =3D &serial1;
> + serial2 =3D &serial2;
> + serial3 =3D &serial3;
> + udc0 =3D &udc0;
> + udc1 =3D &udc1;
> + udc2 =3D &udc2;
> + udc3 =3D &udc3;
> + udc4 =3D &udc4;
> + udc5 =3D &udc5;
> + udc6 =3D &udc6;
> + udc7 =3D &udc7;
> + udc8 =3D &udc8;
> + udc9 =3D &udc9;
> + emmc0 =3D &sdhci0;
> + spi0 =3D &spi0;
> + spi1 =3D &spi1;
> + fiu0 =3D &fiu0;
> + fiu1 =3D &fiu3;
> + };
> +
> + chosen {
> + stdout-path =3D &serial3;
> + };
> +
> + memory {
> + reg =3D <0 0x40000000>;
> + };
> +
> + ahb {
> + gmac0: eth@f0802000 {
> + phy-mode =3D "rgmii-id";
> + snps,eee-force-disable;
> + status =3D "okay";
> + };
> +
> + emc0: eth@f0825000 {
> + phy-mode =3D "rmii";
> + use-ncsi;
> + status =3D "okay";
> + };
> +
> + ehci1: usb@f0806000 {
> + status =3D "okay";
> + };
> +
> + ohci1: ohci@f0807000 {
> + status =3D "okay";
> + };
> +
> + udc0:udc@f0830000 {
> + status =3D "okay";
> + };
> +
> + udc1:udc@f0831000 {
> + status =3D "okay";
> + };
> +
> + udc2:udc@f0832000 {
> + status =3D "okay";
> + };
> +
> + udc3:udc@f0833000 {
> + status =3D "okay";
> + };
> +
> + udc4:udc@f0834000 {
> + status =3D "okay";
> + };
> +
> + udc5:udc@f0835000 {
> + status =3D "okay";
> + };
> +
> + udc6:udc@f0836000 {
> + status =3D "okay";
> + };
> +
> + udc7:udc@f0837000 {
> + status =3D "okay";
> + };
> +
> + udc8:udc@f0838000 {
> + status =3D "okay";
> + };
> +
> + udc9:udc@f0839000 {
> + status =3D "okay";
> + };
> +
> + aes:aes@f0858000 {
> + status =3D "okay";
> + };
> +
> + sha:sha@f085a000 {
> + status =3D "okay";
> + };
> +
> + fiu0: fiu@fb000000 {
> + pinctrl-names =3D "default";
> + pinctrl-0 =3D <&spi0cs1_pins>;
> + status =3D "okay";
> + spi-nor@0 {
> + compatible =3D "jedec,spi-nor";
> + #address-cells =3D <1>;
> + #size-cells =3D <1>;
> + reg =3D <0>;
> + spi-rx-bus-width =3D <2>;
> + partitions@80000000 {
> + compatible =3D "fixed-partitions";
> + #address-cells =3D <1>;
> + #size-cells =3D <1>;
> + bmc@0{
> + label =3D "bmc";
> + reg =3D <0x000000 0x4000000>;
> + };
> + u-boot@0 {
> + label =3D "u-boot";
> + read-only;
> + reg =3D <0x0000000 0x80000>;
> + };
> + u-boot-env@100000 {
> + label =3D "u-boot-env";
> + reg =3D <0x00100000 0x40000>;
> + };
> + kernel@200000 {
> + label =3D "kernel";
> + reg =3D <0x0200000 0x600000>;
> + };
> + rofs@800000 {
> + label =3D "rofs";
> + reg =3D <0x0800000 0x1500000>;
> + };
> + rwfs@1c00000 {
> + label =3D "rwfs";
> + reg =3D <0x1c00000 0x300000>;
> + };
> + };
> + };
> + spi-nor@1 {
> + compatible =3D "jedec,spi-nor";
> + #address-cells =3D <1>;
> + #size-cells =3D <1>;
> + reg =3D <1>;
> + npcm,fiu-rx-bus-width =3D <2>;
> + partitions@88000000 {
> + compatible =3D "fixed-partitions";
> + #address-cells =3D <1>;
> + #size-cells =3D <1>;
> + spare1@0 {
> + label =3D "spi0-cs1-spare1";
> + reg =3D <0x0 0x800000>;
> + };
> + spare2@800000 {
> + label =3D "spi0-cs1-spare2";
> + reg =3D <0x800000 0x0>;
> + };
> + };
> + };
> + };
> +
> + fiu3: fiu@c0000000 {
> + pinctrl-0 =3D <&spi3_pins>;
> + status =3D "okay";
> + spi-nor@0 {
> + compatible =3D "jedec,spi-nor";
> + #address-cells =3D <1>;
> + #size-cells =3D <1>;
> + reg =3D <0>;
> + spi-rx-bus-width =3D <2>;
> + partitions@A0000000 {
> + compatible =3D "fixed-partitions";
> + #address-cells =3D <1>;
> + #size-cells =3D <1>;
> + system1@0 {
> + label =3D "spi3-system1";
> + reg =3D <0x0 0x800000>;
> + };
> + system2@800000 {
> + label =3D "spi3-system2";
> + reg =3D <0x800000 0x0>;
> + };
> + };
> + };
> + };
> +
> + sdhci0: sdhci@f0842000 {
> + status =3D "okay";
> + };
> +
> + pcimbox: pcimbox@f0848000 {
> + status =3D "okay";
> + };
> +
> + vcd: vcd@f0810000 {
> + status =3D "okay";
> + };
> +
> + ece: ece@f0820000 {
> + status =3D "okay";
> + };
> +
> + apb {
> +
> + watchdog1: watchdog@901C {
> + status =3D "okay";
> + };
> +
> + rng: rng@b000 {
> + status =3D "okay";
> + };
> +
> + serial0: serial@1000 {
> + status =3D "okay";
> + };
> +
> + serial1: serial@2000 {
> + status =3D "okay";
> + };
> +
> + serial2: serial@3000 {
> + status =3D "okay";
> + };
> +
> + serial3: serial@4000 {
> + status =3D "okay";
> + };
> +
> + adc: adc@c000 {
> + status =3D "okay";
> + };
> +
> + otp:otp@189000 {
> + status =3D "okay";
> + };
> +
> + lpc_kcs: lpc_kcs@7000 {
> + kcs1: kcs1@0 {
> + status =3D "okay";
> + };
> +
> + kcs2: kcs2@0 {
> + status =3D "okay";
> + };
> +
> + kcs3: kcs3@0 {
> + status =3D "okay";
> + };
> + };
> +
> + lpc_host: lpc_host@7000 {
> + lpc_bpc: lpc_bpc@40 {
> + monitor-ports =3D <0x80>;
> + status =3D "okay";
> + };
> + };
> +
> + spi0: spi@200000 {
> + cs-gpios =3D <&gpio6 11 GPIO_ACTIVE_LOW>;
> + status =3D "okay";
> + };
> +
> + spi1: spi@201000 {
> + status =3D "okay";
> + };
> + };
> + };
> +};
> +
> +&gcr {
> + serial_port_mux: mux-controller {
> + compatible =3D "mmio-mux";
> + #mux-control-cells =3D <1>;
> +
> + mux-reg-masks =3D <0x38 0x07>;
> + idle-states =3D <6>;
> + };
> +};
> --
> 2.20.1
>
