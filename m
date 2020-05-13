Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB2F1D18D5
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 17:12:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MdSJ543bzDqf6
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 01:12:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d41;
 helo=mail-io1-xd41.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Khh7K0LS; dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MdGp2xpkzDqdk
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 01:03:45 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id j8so18336920iog.13
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 08:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jcSDkiwWLnnJbGJNgoLy0GPyMR3KWouWrSSUbYQ6Xkg=;
 b=Khh7K0LS5oPewj6Ol9Dv8pl4Bn7G70iVz0o0quZ3F7fQrJCFzgNCkYNV5MvYaSkjT5
 xFYY0dzEE71s+v3CE+G8rTE7TGSy8pETjYqk+GuRO7SXrHFlBn2J99hDeGsoq9RVPUJR
 wVo2R2rpWq141l/KMsD5agQMegOSxcfY3Xoc8JEMwFugcKpY6OO0wwkTowPIvmLcdv6Z
 nfWgudDEVd92/398rhYFMlZpCBCxZG7vcOCLVMKn91wBuQJrNude0ZWqd7eJonGndSp5
 yFrTY24CrJWbViQqJojCoh5C/n+s9IAOEHR2CE6/dwm6QeY0AgZvzQ+g1ExcPvg2MM5P
 WmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jcSDkiwWLnnJbGJNgoLy0GPyMR3KWouWrSSUbYQ6Xkg=;
 b=n0yx9C1YKgNQiuDVPqaS+1C1dPYptm+m2S7Z1dh+XVHRPl25+zWAC3dH8d9mYhEMr6
 8WFAGWKHwYpF2UbVgxl/SH7AGuqGhjhb3wtjoaupBBTSuacc3uXRMbIwzEtB6Bxk3cyD
 rr2bNudTXNsDoXxIZuH951TieCJtN6/RJndOheFwTWIhEVMgtCef36XMV9TT3XRZbV/7
 2beKIWGe+p7LCEaWjDvSfg3M1fYWz1EDmVY59S4tu+6pEk2Ho28C8IkU7e5owMQRBVIZ
 irw+l++F/Q0P/sq04HWVyE+rBM9WSjJ1e+Ih0hDYgJqD/EzJTkN57ZsS3kv5LxyX3Ifi
 dhPg==
X-Gm-Message-State: AGi0PuZ6UGTsA+N5I9jCX/71W0MJpavwM1DFOiTz4Hc8vrk9AB56vtg0
 zIl5rsSTa5kFvDs4yb45hvQ448jt3xp9lDy/O9CTaQ==
X-Google-Smtp-Source: APiQypL4SQgw3K+aMTTImd16H4if6REmOKYpkHAKabnFo6+sdH8vY1nSUtyvXi3o1gW8UnuGzStdYPKteQOpxL0OoEU=
X-Received: by 2002:a02:665c:: with SMTP id l28mr2740635jaf.1.1589382218031;
 Wed, 13 May 2020 08:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200510102330.66715-1-tali.perry1@gmail.com>
 <20200510102330.66715-2-tali.perry1@gmail.com>
In-Reply-To: <20200510102330.66715-2-tali.perry1@gmail.com>
From: Anton Kachalov <rnouse@google.com>
Date: Wed, 13 May 2020 17:03:26 +0200
Message-ID: <CADVsX8_2KjAEiOj0H7UgZsC7THyWO8aaxaEJgTMb9t=xtx-huw@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] dt-bindings: i2c: npcm7xx: add NPCM I2C controller
To: Tali Perry <tali.perry1@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000852ca805a588e2d1"
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, avifishman70@gmail.com,
 venture@google.com, openbmc@lists.ozlabs.org, wsa@the-dreams.de,
 Brendan Higgins <brendanhiggins@google.com>, Ofer Yehielli <ofery@google.com>,
 linux-kernel@vger.kernel.org, kfting@nuvoton.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, andriy.shevchenko@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000852ca805a588e2d1
Content-Type: text/plain; charset="UTF-8"

The example uses "bus-frequency" while description says "clock-frequency"
for bus speed.

On Sun, May 10, 2020, 12:27 Tali Perry <tali.perry1@gmail.com> wrote:

> Added device tree binding documentation for Nuvoton BMC
> NPCM I2C controller.
>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
>
> diff --git
> a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> new file mode 100644
> index 000000000000..d6f553154388
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/nuvoton,npcm7xx-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: nuvoton NPCM7XX I2C Controller Device Tree Bindings
> +
> +description: |
> +  The NPCM750x includes sixteen I2C bus controllers. All Controllers
> support
> +  both master and slave mode. Each controller can switch between master
> and slave
> +  at run time (i.e. IPMB mode). Each controller has two 16 byte HW FIFO
> for TX and
> +  RX.
> +
> +maintainers:
> +  - Tali Perry <tali.perry1@gmail.com>
> +
> +properties:
> +  compatible:
> +      - const: nuvoton,npcm7xx-i2c
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    items:
> +      - description: Reference clock for the I2C bus
> +
> +  clock-frequency:
> +    maxItems: 1
> +    default: 100000
> +    enum: [ 100000, 400000, 1000000 ]
> +    description:
> +      SCL frequency to use (in Hz). If omitted, 100kHz is used.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c0: i2c@80000 {
> +        compatible = "nuvoton,npcm750-i2c";
> +        reg = <0x80000 0x1000>;
> +        clocks = <&clk NPCM7XX_CLK_APB2>;
> +        bus-frequency = <100000>;
> +        interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&smb0_pins>;
> +    };
> +
> +...
> --
> 2.22.0
>
>

--000000000000852ca805a588e2d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The example uses &quot;bus-frequency&quot; while descript=
ion says &quot;clock-frequency&quot; for bus speed.</div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, May 10, 2020, 12=
:27 Tali Perry &lt;<a href=3D"mailto:tali.perry1@gmail.com">tali.perry1@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Added device =
tree binding documentation for Nuvoton BMC<br>
NPCM I2C controller.<br>
<br>
Signed-off-by: Tali Perry &lt;<a href=3D"mailto:tali.perry1@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">tali.perry1@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../bindings/i2c/nuvoton,npcm7xx-i2c.yaml=C2=A0 =C2=A0 =C2=A0| 62 +++=
++++++++++++++++<br>
=C2=A01 file changed, 62 insertions(+)<br>
=C2=A0create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,npcm=
7xx-i2c.yaml<br>
<br>
diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml=
 b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml<br>
new file mode 100644<br>
index 000000000000..d6f553154388<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml<br>
@@ -0,0 +1,62 @@<br>
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause<br>
+%YAML 1.2<br>
+---<br>
+$id: <a href=3D"http://devicetree.org/schemas/i2c/nuvoton,npcm7xx-i2c.yaml=
#" rel=3D"noreferrer noreferrer" target=3D"_blank">http://devicetree.org/sc=
hemas/i2c/nuvoton,npcm7xx-i2c.yaml#</a><br>
+$schema: <a href=3D"http://devicetree.org/meta-schemas/core.yaml#" rel=3D"=
noreferrer noreferrer" target=3D"_blank">http://devicetree.org/meta-schemas=
/core.yaml#</a><br>
+<br>
+title: nuvoton NPCM7XX I2C Controller Device Tree Bindings<br>
+<br>
+description: |<br>
+=C2=A0 The NPCM750x includes sixteen I2C bus controllers. All Controllers =
support<br>
+=C2=A0 both master and slave mode. Each controller can switch between mast=
er and slave<br>
+=C2=A0 at run time (i.e. IPMB mode). Each controller has two 16 byte HW FI=
FO for TX and<br>
+=C2=A0 RX.<br>
+<br>
+maintainers:<br>
+=C2=A0 - Tali Perry &lt;<a href=3D"mailto:tali.perry1@gmail.com" target=3D=
"_blank" rel=3D"noreferrer">tali.perry1@gmail.com</a>&gt;<br>
+<br>
+properties:<br>
+=C2=A0 compatible:<br>
+=C2=A0 =C2=A0 =C2=A0 - const: nuvoton,npcm7xx-i2c<br>
+<br>
+=C2=A0 reg:<br>
+=C2=A0 =C2=A0 maxItems: 1<br>
+<br>
+=C2=A0 interrupts:<br>
+=C2=A0 =C2=A0 maxItems: 1<br>
+<br>
+=C2=A0 clocks:<br>
+=C2=A0 =C2=A0 maxItems: 1<br>
+=C2=A0 =C2=A0 items:<br>
+=C2=A0 =C2=A0 =C2=A0 - description: Reference clock for the I2C bus<br>
+<br>
+=C2=A0 clock-frequency:<br>
+=C2=A0 =C2=A0 maxItems: 1<br>
+=C2=A0 =C2=A0 default: 100000<br>
+=C2=A0 =C2=A0 enum: [ 100000, 400000, 1000000 ]<br>
+=C2=A0 =C2=A0 description:<br>
+=C2=A0 =C2=A0 =C2=A0 SCL frequency to use (in Hz). If omitted, 100kHz is u=
sed.<br>
+<br>
+required:<br>
+=C2=A0 - compatible<br>
+=C2=A0 - reg<br>
+=C2=A0 - interrupts<br>
+<br>
+allOf:<br>
+=C2=A0 - $ref: /schemas/i2c/i2c-controller.yaml#<br>
+<br>
+unevaluatedProperties: false<br>
+<br>
+examples:<br>
+=C2=A0 - |<br>
+=C2=A0 =C2=A0 i2c0: i2c@80000 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;nuvoton,npcm750-i2c&quot;=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x80000 0x1000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp;clk NPCM7XX_CLK_APB2&gt;;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bus-frequency =3D &lt;100000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;GIC_SPI 64 IRQ_TYPE_LEVEL_H=
IGH&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;smb0_pins&gt;;<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+...<br>
-- <br>
2.22.0<br>
<br>
</blockquote></div>

--000000000000852ca805a588e2d1--
