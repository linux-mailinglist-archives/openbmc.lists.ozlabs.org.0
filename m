Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7365D237
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 16:58:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dS7342RkzDqRN
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 00:58:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::241; helo=mail-oi1-x241.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="P6c4uqqI"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dS6Q2F4ZzDqSw
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2019 00:58:21 +1000 (AEST)
Received: by mail-oi1-x241.google.com with SMTP id t76so13297217oih.4
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jul 2019 07:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zuf8rPuuRabOhAW5Z7XryjPSkY8Sel4OEJaLGA5q7hY=;
 b=P6c4uqqIxwcYBZSBY6Z8XV/a+G79lLULtvjQWntlR/oHUm3iK+JsarDQEEUJKNyAc3
 TRFnjJxdz3S9+EpISL9QQ0cGmYGz0ZlKVI1c8/ypRv+BVV7ZqnHj2LyibPQLUH54PYb6
 EHWFwDm4IriG56Z29HigBuhs/6fkU7TCoQR8wb8pZ6aUqvUr/FzYV1HC2+1Y6qofyzYu
 XEuInMqEdaBRYwFUu26YGjfbw37+vOMHp2D8qyzSaTU2VsDBBJxlZrkr6fswcvp72TIP
 qs48Gf13duqf2OIOlpRGLA7L3GL4lJupFbOqjK5wuK2YaENtQc9Wn1hQkimMIhhoNMje
 AEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zuf8rPuuRabOhAW5Z7XryjPSkY8Sel4OEJaLGA5q7hY=;
 b=BeozDR53E4XHckbE6ZOuTjv53tsYQYNexF0jkRNiJFfLsa0pwrZ6FRlXkcnQl7+5Ex
 f2WbBjVxXAsIc7ihwx178r3zaBtNoDZ2Lawow8PraaMpv9J5r5wcOFDyISbBkquMFQ3j
 /H1QsnCSvO3EJMDyK8Z71oM37FFgI5p07xlGCsCwLTNtubzmBswkEIhQMaQSXP+cMF5O
 hbaffYb/JnoBXcgWU/RLQ0jU9llqa0fsClhnua8hzQ2c6MgpsQ/x/PjynV0LW6hn4GdA
 oLQ3Hi3cqELa8c98X1CotFrRRZsNpV0npusKaGWWZfu50R6j+HK4sXsqMkf3RKbSiKSC
 cjSw==
X-Gm-Message-State: APjAAAWhg/zGQWbnholayRAINC/nty95ugcX2MOFre77xNMBLzmDU+gf
 wbUbPEEJss6e8il4B9JqiuXi+DkGWinmuhmefKs=
X-Google-Smtp-Source: APXvYqzJrsazqrZkjLd7phfkSMsTBLpEnR+2a9T4XEkLZjfw91Q9/n0Um4PArzvw85EcK2HYa1HG2BWxhigkVEul3Rs=
X-Received: by 2002:a05:6808:690:: with SMTP id
 k16mr3211112oig.117.1562079496554; 
 Tue, 02 Jul 2019 07:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190701060137.22116-1-chyishian.jiang@gmail.com>
 <CACPK8XdR-hSNu+dQHus6_m6K+ERcdLEOg42fD94y5RuYPnM7nQ@mail.gmail.com>
 <b5f37427-547f-4a16-94bb-4a8e4dd2ab1b@Spark>
 <CACPK8XeY3tfhE-S_kyFo5KZTDkP7hoNYnkj4WVJTrA8_jWvCPw@mail.gmail.com>
In-Reply-To: <CACPK8XeY3tfhE-S_kyFo5KZTDkP7hoNYnkj4WVJTrA8_jWvCPw@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 2 Jul 2019 18:06:27 +0300
Message-ID: <CAP6Zq1h8jaiWuE9EqmvRO_NeJtgh2MNyy1OL78W0NQN63GWC2Q@mail.gmail.com>
Subject: Re: [PATCH dev-5.17 v1 1/6] ARM: dts: nuvoton: Add Nuvoton RunBMC
 DeviceTree
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="00000000000080ce47058cb3f940"
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
 =?UTF-8?B?U2FtdWVsIEppYW5nICjmsZ/pqI/lhYgp?= <Samuel.Jiang@quantatw.com>,
 Tomer Maimon <tomer.maimon@nuvoton.com>,
 Samuel Jiang <chyishian.jiang@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000080ce47058cb3f940
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joel,

On Tue, 2 Jul 2019 at 08:47, Joel Stanley <joel@jms.id.au> wrote:

> On Mon, 1 Jul 2019 at 08:25, Samuel Jiang (=E6=B1=9F=E9=A8=8F=E5=85=88)
> <Samuel.Jiang@quantatw.com> wrote:
> >
> > Hi Joel,
> >
> > Do you intend submit these patches to the mainline kernel for review?
> > I would like to see them submitted there first.
> >
> > No, the patches still could not submit to the mainline kernel. We need
> Nuvoton teams help fill up the related source code in the mainline.
>
>
We had submitted only basic NPCM7xx dtsi files to the Linux vanilla, We are
planning to submit the NPCM7xx dtsi files soon but still I am not sure
if it will include all the nodes we use because some of our drivers are
still in upstream process so things could change.

meanwhile could you please upstream Quanta to OpenBMC Linux tree?


> Why can't you submit them?
>
> Patches are held in the openbmc tree only if they are on their way to
> be included in an upstream release.
>
> >
> > When you do that, you don't need the "dev-5.17" part in your patch
> > subjects. You also can include the "tested" information in the cover
> > letter, but not in the patches themselves.
> >
> > Based on the above reason, I prefer to keep =E2=80=9Cdev-5.17=E2=80=9D =
part first and
> will update 1/6 patches information.
>
> Do you mean 5.1?
>
> > After Nuvoton team members back, I will discuss with them the mainline
> situation.
> >
> > Thanks,
> >
> > Samuel Jiang
> > On Jul 1, 2019, 2:57 PM +0800, Joel Stanley <joel@jms.id.au>, wrote:
> >
> > Hi Samuel,
> >
> > On Mon, 1 Jul 2019 at 06:02, Samuel Jiang <chyishian.jiang@gmail.com>
> wrote:
> >
> >
> > From: Samuel Jiang <Samuel.Jiang@quantatw.com>
> >
> > Initial Nuvoton RunBMC Module which use NPCM750 SoC.
> >
> > Including features:
> > 1. image partitions
> > 2. lpc and kcs
> > 3. usb
> > 4. serial port
> > 5. spi
> > 6. fiu
> > 7. watchdog
> >
> >
> > Do you intend submit these patches to the mainline kernel for review?
> > I would like to see them submitted there first.
> >
> > When you do that, you don't need the "dev-5.17" part in your patch
> > subjects. You also can include the "tested" information in the cover
> > letter, but not in the patches themselves.
> >
> > Please test against 5.2.
> >
> > Once these patches have had review we can include them in the openbmc
> tree.
> >
> > Cheers,
> >
> > Joel
> >
> >
> > Testeed:
> > Build Qunata runbmc-nuvoton image and load on RunBMC-nuvoton module
> >
> > Signed-off-by: Samuel Jiang <Samuel.Jiang@quantatw.com>
> > ---
> > arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts | 292 +++++++++++++++++++
> > 1 file changed, 292 insertions(+)
> > create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
> >
> > diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
> b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
> > new file mode 100644
> > index 000000000000..eec815d2a638
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
> > @@ -0,0 +1,292 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2019 Nuvoton Technology kwliu@nuvoton.com
> > +// Copyright (c) 2019 Quanta Computer Inc. Samuel.Jiang@quantatw.com
> > +
> > +/dts-v1/;
> > +#include "nuvoton-npcm750.dtsi"
> > +
> > +/ {
> > + model =3D "Nuvoton npcm750 RunBMC Module";
> > + compatible =3D "nuvoton,npcm750";
> > +
> > + aliases {
> > + ethernet0 =3D &emc0;
> > + ethernet1 =3D &gmac0;
> > + serial0 =3D &serial0;
> > + serial1 =3D &serial1;
> > + serial2 =3D &serial2;
> > + serial3 =3D &serial3;
> > + udc0 =3D &udc0;
> > + udc1 =3D &udc1;
> > + udc2 =3D &udc2;
> > + udc3 =3D &udc3;
> > + udc4 =3D &udc4;
> > + udc5 =3D &udc5;
> > + udc6 =3D &udc6;
> > + udc7 =3D &udc7;
> > + udc8 =3D &udc8;
> > + udc9 =3D &udc9;
> > + emmc0 =3D &sdhci0;
> > + spi0 =3D &spi0;
> > + spi1 =3D &spi1;
> > + fiu0 =3D &fiu0;
> > + fiu1 =3D &fiu3;
> > + };
> > +
> > + chosen {
> > + stdout-path =3D &serial3;
> > + };
> > +
> > + memory {
> > + reg =3D <0 0x40000000>;
> > + };
> > +
> > + ahb {
> > + gmac0: eth@f0802000 {
> > + phy-mode =3D "rgmii-id";
> > + snps,eee-force-disable;
> > + status =3D "okay";
> > + };
> > +
> > + emc0: eth@f0825000 {
> > + phy-mode =3D "rmii";
> > + use-ncsi;
> > + status =3D "okay";
> > + };
> > +
> > + ehci1: usb@f0806000 {
> > + status =3D "okay";
> > + };
> > +
> > + ohci1: ohci@f0807000 {
> > + status =3D "okay";
> > + };
> > +
> > + udc0:udc@f0830000 {
> > + status =3D "okay";
> > + };
> > +
> > + udc1:udc@f0831000 {
> > + status =3D "okay";
> > + };
> > +
> > + udc2:udc@f0832000 {
> > + status =3D "okay";
> > + };
> > +
> > + udc3:udc@f0833000 {
> > + status =3D "okay";
> > + };
> > +
> > + udc4:udc@f0834000 {
> > + status =3D "okay";
> > + };
> > +
> > + udc5:udc@f0835000 {
> > + status =3D "okay";
> > + };
> > +
> > + udc6:udc@f0836000 {
> > + status =3D "okay";
> > + };
> > +
> > + udc7:udc@f0837000 {
> > + status =3D "okay";
> > + };
> > +
> > + udc8:udc@f0838000 {
> > + status =3D "okay";
> > + };
> > +
> > + udc9:udc@f0839000 {
> > + status =3D "okay";
> > + };
> > +
> > + aes:aes@f0858000 {
> > + status =3D "okay";
> > + };
> > +
> > + sha:sha@f085a000 {
> > + status =3D "okay";
> > + };
> > +
> > + fiu0: fiu@fb000000 {
> > + pinctrl-names =3D "default";
> > + pinctrl-0 =3D <&spi0cs1_pins>;
> > + status =3D "okay";
> > + spi-nor@0 {
> > + compatible =3D "jedec,spi-nor";
> > + #address-cells =3D <1>;
> > + #size-cells =3D <1>;
> > + reg =3D <0>;
> > + spi-rx-bus-width =3D <2>;
> > + partitions@80000000 {
> > + compatible =3D "fixed-partitions";
> > + #address-cells =3D <1>;
> > + #size-cells =3D <1>;
> > + bmc@0{
> > + label =3D "bmc";
> > + reg =3D <0x000000 0x4000000>;
> > + };
> > + u-boot@0 {
> > + label =3D "u-boot";
> > + read-only;
> > + reg =3D <0x0000000 0x80000>;
> > + };
> > + u-boot-env@100000 {
> > + label =3D "u-boot-env";
> > + reg =3D <0x00100000 0x40000>;
> > + };
> > + kernel@200000 {
> > + label =3D "kernel";
> > + reg =3D <0x0200000 0x600000>;
> > + };
> > + rofs@800000 {
> > + label =3D "rofs";
> > + reg =3D <0x0800000 0x1500000>;
> > + };
> > + rwfs@1c00000 {
> > + label =3D "rwfs";
> > + reg =3D <0x1c00000 0x300000>;
> > + };
> > + };
> > + };
> > + spi-nor@1 {
> > + compatible =3D "jedec,spi-nor";
> > + #address-cells =3D <1>;
> > + #size-cells =3D <1>;
> > + reg =3D <1>;
> > + npcm,fiu-rx-bus-width =3D <2>;
> > + partitions@88000000 {
> > + compatible =3D "fixed-partitions";
> > + #address-cells =3D <1>;
> > + #size-cells =3D <1>;
> > + spare1@0 {
> > + label =3D "spi0-cs1-spare1";
> > + reg =3D <0x0 0x800000>;
> > + };
> > + spare2@800000 {
> > + label =3D "spi0-cs1-spare2";
> > + reg =3D <0x800000 0x0>;
> > + };
> > + };
> > + };
> > + };
> > +
> > + fiu3: fiu@c0000000 {
> > + pinctrl-0 =3D <&spi3_pins>;
> > + status =3D "okay";
> > + spi-nor@0 {
> > + compatible =3D "jedec,spi-nor";
> > + #address-cells =3D <1>;
> > + #size-cells =3D <1>;
> > + reg =3D <0>;
> > + spi-rx-bus-width =3D <2>;
> > + partitions@A0000000 {
> > + compatible =3D "fixed-partitions";
> > + #address-cells =3D <1>;
> > + #size-cells =3D <1>;
> > + system1@0 {
> > + label =3D "spi3-system1";
> > + reg =3D <0x0 0x800000>;
> > + };
> > + system2@800000 {
> > + label =3D "spi3-system2";
> > + reg =3D <0x800000 0x0>;
> > + };
> > + };
> > + };
> > + };
> > +
> > + sdhci0: sdhci@f0842000 {
> > + status =3D "okay";
> > + };
> > +
> > + pcimbox: pcimbox@f0848000 {
> > + status =3D "okay";
> > + };
> > +
> > + vcd: vcd@f0810000 {
> > + status =3D "okay";
> > + };
> > +
> > + ece: ece@f0820000 {
> > + status =3D "okay";
> > + };
> > +
> > + apb {
> > +
> > + watchdog1: watchdog@901C {
> > + status =3D "okay";
> > + };
> > +
> > + rng: rng@b000 {
> > + status =3D "okay";
> > + };
> > +
> > + serial0: serial@1000 {
> > + status =3D "okay";
> > + };
> > +
> > + serial1: serial@2000 {
> > + status =3D "okay";
> > + };
> > +
> > + serial2: serial@3000 {
> > + status =3D "okay";
> > + };
> > +
> > + serial3: serial@4000 {
> > + status =3D "okay";
> > + };
> > +
> > + adc: adc@c000 {
> > + status =3D "okay";
> > + };
> > +
> > + otp:otp@189000 {
> > + status =3D "okay";
> > + };
> > +
> > + lpc_kcs: lpc_kcs@7000 {
> > + kcs1: kcs1@0 {
> > + status =3D "okay";
> > + };
> > +
> > + kcs2: kcs2@0 {
> > + status =3D "okay";
> > + };
> > +
> > + kcs3: kcs3@0 {
> > + status =3D "okay";
> > + };
> > + };
> > +
> > + lpc_host: lpc_host@7000 {
> > + lpc_bpc: lpc_bpc@40 {
> > + monitor-ports =3D <0x80>;
> > + status =3D "okay";
> > + };
> > + };
> > +
> > + spi0: spi@200000 {
> > + cs-gpios =3D <&gpio6 11 GPIO_ACTIVE_LOW>;
> > + status =3D "okay";
> > + };
> > +
> > + spi1: spi@201000 {
> > + status =3D "okay";
> > + };
> > + };
> > + };
> > +};
> > +
> > +&gcr {
> > + serial_port_mux: mux-controller {
> > + compatible =3D "mmio-mux";
> > + #mux-control-cells =3D <1>;
> > +
> > + mux-reg-masks =3D <0x38 0x07>;
> > + idle-states =3D <6>;
> > + };
> > +};
> > --
> > 2.20.1
> >
>

Thanks a lot!

Tomer

--00000000000080ce47058cb3f940
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Joel,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, 2 Jul 2019 at 08:47, Joel Stanley &lt=
;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 1 Jul 2019 at 08:2=
5, Samuel Jiang (=E6=B1=9F=E9=A8=8F=E5=85=88)<br>
&lt;<a href=3D"mailto:Samuel.Jiang@quantatw.com" target=3D"_blank">Samuel.J=
iang@quantatw.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Joel,<br>
&gt;<br>
&gt; Do you intend submit these patches to the mainline kernel for review?<=
br>
&gt; I would like to see them submitted there first.<br>
&gt;<br>
&gt; No, the patches still could not submit to the mainline kernel. We need=
 Nuvoton teams help fill up the related source code in the mainline.<br>
<br></blockquote><div><br></div><div>We had submitted only basic NPCM7xx dt=
si files to the Linux vanilla, We are planning to submit the NPCM7xx dtsi f=
iles soon but still I am not sure</div><div>if it will include all the node=
s we use because some of our drivers are still in upstream process so thing=
s could change.=C2=A0</div><div><br></div><div>meanwhile could you please u=
pstream Quanta to OpenBMC Linux tree?</div><div>=C2=A0<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
Why can&#39;t you submit them?<br>
<br>
Patches are held in the openbmc tree only if they are on their way to<br>
be included in an upstream release.<br>
<br>
&gt;<br>
&gt; When you do that, you don&#39;t need the &quot;dev-5.17&quot; part in =
your patch<br>
&gt; subjects. You also can include the &quot;tested&quot; information in t=
he cover<br>
&gt; letter, but not in the patches themselves.<br>
&gt;<br>
&gt; Based on the above reason, I prefer to keep =E2=80=9Cdev-5.17=E2=80=9D=
 part first and will update 1/6 patches information.<br>
<br>
Do you mean 5.1?<br>
<br>
&gt; After Nuvoton team members back, I will discuss with them the mainline=
 situation.<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Samuel Jiang<br>
&gt; On Jul 1, 2019, 2:57 PM +0800, Joel Stanley &lt;<a href=3D"mailto:joel=
@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;, wrote:<br>
&gt;<br>
&gt; Hi Samuel,<br>
&gt;<br>
&gt; On Mon, 1 Jul 2019 at 06:02, Samuel Jiang &lt;<a href=3D"mailto:chyish=
ian.jiang@gmail.com" target=3D"_blank">chyishian.jiang@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt;<br>
&gt; From: Samuel Jiang &lt;<a href=3D"mailto:Samuel.Jiang@quantatw.com" ta=
rget=3D"_blank">Samuel.Jiang@quantatw.com</a>&gt;<br>
&gt;<br>
&gt; Initial Nuvoton RunBMC Module which use NPCM750 SoC.<br>
&gt;<br>
&gt; Including features:<br>
&gt; 1. image partitions<br>
&gt; 2. lpc and kcs<br>
&gt; 3. usb<br>
&gt; 4. serial port<br>
&gt; 5. spi<br>
&gt; 6. fiu<br>
&gt; 7. watchdog<br>
&gt;<br>
&gt;<br>
&gt; Do you intend submit these patches to the mainline kernel for review?<=
br>
&gt; I would like to see them submitted there first.<br>
&gt;<br>
&gt; When you do that, you don&#39;t need the &quot;dev-5.17&quot; part in =
your patch<br>
&gt; subjects. You also can include the &quot;tested&quot; information in t=
he cover<br>
&gt; letter, but not in the patches themselves.<br>
&gt;<br>
&gt; Please test against 5.2.<br>
&gt;<br>
&gt; Once these patches have had review we can include them in the openbmc =
tree.<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Joel<br>
&gt;<br>
&gt;<br>
&gt; Testeed:<br>
&gt; Build Qunata runbmc-nuvoton image and load on RunBMC-nuvoton module<br=
>
&gt;<br>
&gt; Signed-off-by: Samuel Jiang &lt;<a href=3D"mailto:Samuel.Jiang@quantat=
w.com" target=3D"_blank">Samuel.Jiang@quantatw.com</a>&gt;<br>
&gt; ---<br>
&gt; arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts | 292 +++++++++++++++++++=
<br>
&gt; 1 file changed, 292 insertions(+)<br>
&gt; create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts<br>
&gt;<br>
&gt; diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts b/arch/arm/b=
oot/dts/nuvoton-npcm750-runbmc.dts<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..eec815d2a638<br>
&gt; --- /dev/null<br>
&gt; +++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts<br>
&gt; @@ -0,0 +1,292 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +// Copyright (c) 2019 Nuvoton Technology <a href=3D"mailto:kwliu@nuvo=
ton.com" target=3D"_blank">kwliu@nuvoton.com</a><br>
&gt; +// Copyright (c) 2019 Quanta Computer Inc. <a href=3D"mailto:Samuel.J=
iang@quantatw.com" target=3D"_blank">Samuel.Jiang@quantatw.com</a><br>
&gt; +<br>
&gt; +/dts-v1/;<br>
&gt; +#include &quot;nuvoton-npcm750.dtsi&quot;<br>
&gt; +<br>
&gt; +/ {<br>
&gt; + model =3D &quot;Nuvoton npcm750 RunBMC Module&quot;;<br>
&gt; + compatible =3D &quot;nuvoton,npcm750&quot;;<br>
&gt; +<br>
&gt; + aliases {<br>
&gt; + ethernet0 =3D &amp;emc0;<br>
&gt; + ethernet1 =3D &amp;gmac0;<br>
&gt; + serial0 =3D &amp;serial0;<br>
&gt; + serial1 =3D &amp;serial1;<br>
&gt; + serial2 =3D &amp;serial2;<br>
&gt; + serial3 =3D &amp;serial3;<br>
&gt; + udc0 =3D &amp;udc0;<br>
&gt; + udc1 =3D &amp;udc1;<br>
&gt; + udc2 =3D &amp;udc2;<br>
&gt; + udc3 =3D &amp;udc3;<br>
&gt; + udc4 =3D &amp;udc4;<br>
&gt; + udc5 =3D &amp;udc5;<br>
&gt; + udc6 =3D &amp;udc6;<br>
&gt; + udc7 =3D &amp;udc7;<br>
&gt; + udc8 =3D &amp;udc8;<br>
&gt; + udc9 =3D &amp;udc9;<br>
&gt; + emmc0 =3D &amp;sdhci0;<br>
&gt; + spi0 =3D &amp;spi0;<br>
&gt; + spi1 =3D &amp;spi1;<br>
&gt; + fiu0 =3D &amp;fiu0;<br>
&gt; + fiu1 =3D &amp;fiu3;<br>
&gt; + };<br>
&gt; +<br>
&gt; + chosen {<br>
&gt; + stdout-path =3D &amp;serial3;<br>
&gt; + };<br>
&gt; +<br>
&gt; + memory {<br>
&gt; + reg =3D &lt;0 0x40000000&gt;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + ahb {<br>
&gt; + gmac0: eth@f0802000 {<br>
&gt; + phy-mode =3D &quot;rgmii-id&quot;;<br>
&gt; + snps,eee-force-disable;<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + emc0: eth@f0825000 {<br>
&gt; + phy-mode =3D &quot;rmii&quot;;<br>
&gt; + use-ncsi;<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + ehci1: usb@f0806000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + ohci1: ohci@f0807000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + udc0:udc@f0830000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + udc1:udc@f0831000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + udc2:udc@f0832000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + udc3:udc@f0833000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + udc4:udc@f0834000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + udc5:udc@f0835000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + udc6:udc@f0836000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + udc7:udc@f0837000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + udc8:udc@f0838000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + udc9:udc@f0839000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + aes:aes@f0858000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + sha:sha@f085a000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + fiu0: fiu@fb000000 {<br>
&gt; + pinctrl-names =3D &quot;default&quot;;<br>
&gt; + pinctrl-0 =3D &lt;&amp;spi0cs1_pins&gt;;<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + spi-nor@0 {<br>
&gt; + compatible =3D &quot;jedec,spi-nor&quot;;<br>
&gt; + #address-cells =3D &lt;1&gt;;<br>
&gt; + #size-cells =3D &lt;1&gt;;<br>
&gt; + reg =3D &lt;0&gt;;<br>
&gt; + spi-rx-bus-width =3D &lt;2&gt;;<br>
&gt; + partitions@80000000 {<br>
&gt; + compatible =3D &quot;fixed-partitions&quot;;<br>
&gt; + #address-cells =3D &lt;1&gt;;<br>
&gt; + #size-cells =3D &lt;1&gt;;<br>
&gt; + bmc@0{<br>
&gt; + label =3D &quot;bmc&quot;;<br>
&gt; + reg =3D &lt;0x000000 0x4000000&gt;;<br>
&gt; + };<br>
&gt; + u-boot@0 {<br>
&gt; + label =3D &quot;u-boot&quot;;<br>
&gt; + read-only;<br>
&gt; + reg =3D &lt;0x0000000 0x80000&gt;;<br>
&gt; + };<br>
&gt; + u-boot-env@100000 {<br>
&gt; + label =3D &quot;u-boot-env&quot;;<br>
&gt; + reg =3D &lt;0x00100000 0x40000&gt;;<br>
&gt; + };<br>
&gt; + kernel@200000 {<br>
&gt; + label =3D &quot;kernel&quot;;<br>
&gt; + reg =3D &lt;0x0200000 0x600000&gt;;<br>
&gt; + };<br>
&gt; + rofs@800000 {<br>
&gt; + label =3D &quot;rofs&quot;;<br>
&gt; + reg =3D &lt;0x0800000 0x1500000&gt;;<br>
&gt; + };<br>
&gt; + rwfs@1c00000 {<br>
&gt; + label =3D &quot;rwfs&quot;;<br>
&gt; + reg =3D &lt;0x1c00000 0x300000&gt;;<br>
&gt; + };<br>
&gt; + };<br>
&gt; + };<br>
&gt; + spi-nor@1 {<br>
&gt; + compatible =3D &quot;jedec,spi-nor&quot;;<br>
&gt; + #address-cells =3D &lt;1&gt;;<br>
&gt; + #size-cells =3D &lt;1&gt;;<br>
&gt; + reg =3D &lt;1&gt;;<br>
&gt; + npcm,fiu-rx-bus-width =3D &lt;2&gt;;<br>
&gt; + partitions@88000000 {<br>
&gt; + compatible =3D &quot;fixed-partitions&quot;;<br>
&gt; + #address-cells =3D &lt;1&gt;;<br>
&gt; + #size-cells =3D &lt;1&gt;;<br>
&gt; + spare1@0 {<br>
&gt; + label =3D &quot;spi0-cs1-spare1&quot;;<br>
&gt; + reg =3D &lt;0x0 0x800000&gt;;<br>
&gt; + };<br>
&gt; + spare2@800000 {<br>
&gt; + label =3D &quot;spi0-cs1-spare2&quot;;<br>
&gt; + reg =3D &lt;0x800000 0x0&gt;;<br>
&gt; + };<br>
&gt; + };<br>
&gt; + };<br>
&gt; + };<br>
&gt; +<br>
&gt; + fiu3: fiu@c0000000 {<br>
&gt; + pinctrl-0 =3D &lt;&amp;spi3_pins&gt;;<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + spi-nor@0 {<br>
&gt; + compatible =3D &quot;jedec,spi-nor&quot;;<br>
&gt; + #address-cells =3D &lt;1&gt;;<br>
&gt; + #size-cells =3D &lt;1&gt;;<br>
&gt; + reg =3D &lt;0&gt;;<br>
&gt; + spi-rx-bus-width =3D &lt;2&gt;;<br>
&gt; + partitions@A0000000 {<br>
&gt; + compatible =3D &quot;fixed-partitions&quot;;<br>
&gt; + #address-cells =3D &lt;1&gt;;<br>
&gt; + #size-cells =3D &lt;1&gt;;<br>
&gt; + system1@0 {<br>
&gt; + label =3D &quot;spi3-system1&quot;;<br>
&gt; + reg =3D &lt;0x0 0x800000&gt;;<br>
&gt; + };<br>
&gt; + system2@800000 {<br>
&gt; + label =3D &quot;spi3-system2&quot;;<br>
&gt; + reg =3D &lt;0x800000 0x0&gt;;<br>
&gt; + };<br>
&gt; + };<br>
&gt; + };<br>
&gt; + };<br>
&gt; +<br>
&gt; + sdhci0: sdhci@f0842000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + pcimbox: pcimbox@f0848000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + vcd: vcd@f0810000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + ece: ece@f0820000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + apb {<br>
&gt; +<br>
&gt; + watchdog1: watchdog@901C {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + rng: rng@b000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + serial0: serial@1000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + serial1: serial@2000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + serial2: serial@3000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + serial3: serial@4000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + adc: adc@c000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + otp:otp@189000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + lpc_kcs: lpc_kcs@7000 {<br>
&gt; + kcs1: kcs1@0 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + kcs2: kcs2@0 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + kcs3: kcs3@0 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; + };<br>
&gt; +<br>
&gt; + lpc_host: lpc_host@7000 {<br>
&gt; + lpc_bpc: lpc_bpc@40 {<br>
&gt; + monitor-ports =3D &lt;0x80&gt;;<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; + };<br>
&gt; +<br>
&gt; + spi0: spi@200000 {<br>
&gt; + cs-gpios =3D &lt;&amp;gpio6 11 GPIO_ACTIVE_LOW&gt;;<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; +<br>
&gt; + spi1: spi@201000 {<br>
&gt; + status =3D &quot;okay&quot;;<br>
&gt; + };<br>
&gt; + };<br>
&gt; + };<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;gcr {<br>
&gt; + serial_port_mux: mux-controller {<br>
&gt; + compatible =3D &quot;mmio-mux&quot;;<br>
&gt; + #mux-control-cells =3D &lt;1&gt;;<br>
&gt; +<br>
&gt; + mux-reg-masks =3D &lt;0x38 0x07&gt;;<br>
&gt; + idle-states =3D &lt;6&gt;;<br>
&gt; + };<br>
&gt; +};<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br></blockquote><div><br></div><div>Thanks a lot!</div><div><br></div>=
<div>Tomer=C2=A0</div></div></div>

--00000000000080ce47058cb3f940--
