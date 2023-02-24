Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2572B6A1570
	for <lists+openbmc@lfdr.de>; Fri, 24 Feb 2023 04:35:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNFsR0WKhz3cjJ
	for <lists+openbmc@lfdr.de>; Fri, 24 Feb 2023 14:35:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=k2VZpeDD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::22b; helo=mail-oi1-x22b.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=k2VZpeDD;
	dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNFrn637hz2xWc
	for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2023 14:35:04 +1100 (AEDT)
Received: by mail-oi1-x22b.google.com with SMTP id w7so14851503oik.13
        for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2023 19:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P+06+4k2W8ZHNrnMUXdjkFrGTuzxsLco63vUfB+5R1c=;
        b=k2VZpeDDjZHMvS995sQCLMVfy5b/wY86w/Oe09vQhAalSX4j1Q58Dn7c6fx3Dm3gGy
         xppLtmUvXsRlf0VYJ/8WnAjBM06d0RGK2V4QIzsp29qKd13bpuh5uqipVOpTUT4Q3CSa
         2awlrGz5tZhj5B2XWSQ4nJ2LrKYgNDWMB9G7RbPhJhn0k4G9k+CNxjBVxmHgUwz5PeSJ
         af2QP35TdqSEe5FHHuxNNNbIWIdBCUYbjBbGCkyaGVQIAoHqqxOdpn3Td+b7fWVOMugo
         NLg5J4uR8Z+7AcFYuBTuzqbh3TgNi0jyb/l7cjNyP80MRtwcY5+6WyVUMhjlDfIq/rlf
         a4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+06+4k2W8ZHNrnMUXdjkFrGTuzxsLco63vUfB+5R1c=;
        b=TE8agQyb7i1HKnakQhxSbC48Hm8gEy1QBLiwMcFnYE1ukUSV5WH4tcmeAieIZHTnpP
         BHuB+gzMzzypKzEbXC6qXQRyQw9hLXOoIMLe8Ceu7lHFl6/eWVLVE9902IQCXAeZqtkN
         woFlXYBVVQJ2d2Oc4Yj3q7DXx8o1Zl40rMXJN07IIqOxV4OxeyXfUcyCmq3ml0PtYPTL
         ZKFRWEiE9PW/GvtToixPTUqm2YBDi3HL9UuZOn1N8EV2UmQaOsU73xodoG82cJ4vdjma
         lUMXM7HPrswZVEDKH9sQpY7zWepE9ph6Yn5vKVgt0HJ1Zhyf4f9iWR9MncPUM/h3sx10
         1wMQ==
X-Gm-Message-State: AO0yUKVQ098Xp3hnSjdjdyhctmm4MLyc8ms5e6BmWue6HVg4B5fd9+OD
	M0euYD8vNbaO8GS5a5u3Dntu0WMZHRNEv/hUlueBUwoa4aE7bynYOE5gQPPsl+ba6vkh2T8/Jl4
	2ekp93aMdxwuPwrztEM2xDTKwc9cD9NmvLcOsBR/ojTbx
X-Google-Smtp-Source: AK7set+QdinVf+fcvEOnbP08zF7PVbNi4twjAURtu3OC1b9mAyfQKYp9qhnwOBb+WfjtE1BnG4vDAPPmSPon4BLptFs=
X-Received: by 2002:a05:6808:abc:b0:378:30dc:ae5b with SMTP id
 r28-20020a0568080abc00b0037830dcae5bmr703075oij.5.1677209700613; Thu, 23 Feb
 2023 19:35:00 -0800 (PST)
MIME-Version: 1.0
References: <20230105104853.62360-1-jordan.chang@ufispace.com>
In-Reply-To: <20230105104853.62360-1-jordan.chang@ufispace.com>
From: Jordan Chang <jordan.chang@ufispace.com>
Date: Fri, 24 Feb 2023 11:34:49 +0800
Message-ID: <CAJ3czeSmaShXZkmYkgNazL7StiuyhOQUoNtkOkyTt_UAD4VpWA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] ARM: dts: aspeed: Add
 Ufispace NCPLite platform BMC
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Content-Type: multipart/alternative; boundary="0000000000006b598505f569d0a0"
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
Cc: jay.tc.lin@ufispace.com, eason.ys.huang@ufispace.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000006b598505f569d0a0
Content-Type: text/plain; charset="UTF-8"

Hi Reviewers,

Kindly reminder for this patch to be reviewed. Thank you!

Best regards,
Jordan

On Thu, Jan 5, 2023 at 6:48 PM Jordan Chang <jordan.chang@ufispace.com>
wrote:

> Add initial device tree of Ufispace NCPLite platform which uses
> AST2600-based BMC.
>
> Signed-off-by: Jordan Chang <jordan.chang@ufispace.com>
> ---
>  arch/arm/dts/Makefile            |   1 +
>  arch/arm/dts/ast2600-ncplite.dts | 148 +++++++++++++++++++++++++++++++
>  2 files changed, 149 insertions(+)
>  create mode 100644 arch/arm/dts/ast2600-ncplite.dts
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 6c34b83336..20957186b4 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -687,6 +687,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         ast2600-dcscm.dtb \
>         ast2600-fpga.dtb \
>         ast2600-intel.dtb \
> +       ast2600-ncplite.dtb \
>         ast2600-ncsi.dtb \
>         ast2600-p10bmc.dtb \
>         ast2600-pfr.dtb \
> diff --git a/arch/arm/dts/ast2600-ncplite.dts
> b/arch/arm/dts/ast2600-ncplite.dts
> new file mode 100644
> index 0000000000..54ee177bfd
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-ncplite.dts
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2022 Ufispace Co., Ltd.
> +/dts-v1/;
> +
> +#include "ast2600-u-boot.dtsi"
> +
> +/ {
> +       model = "Ufispace NCPLite BMC";
> +       compatible = "ufispace,ncplite-bmc", "aspeed,ast2600";
> +
> +       memory {
> +               device_type = "memory";
> +               reg = <0x80000000 0x40000000>;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart5;
> +       };
> +
> +       aliases {
> +               spi0 = &fmc;
> +       };
> +
> +       cpus {
> +               cpu@0 {
> +                       clock-frequency = <800000000>;
> +               };
> +               cpu@1 {
> +                       clock-frequency = <800000000>;
> +               };
> +       };
> +};
> +
> +&uart5 {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +};
> +
> +&sdrammc {
> +       clock-frequency = <400000000>;
> +};
> +
> +&wdt1 {
> +       status = "okay";
> +};
> +
> +&wdt2 {
> +       status = "okay";
> +};
> +
> +&mac2 {
> +        status = "okay";
> +        phy-mode = "NC-SI";
> +        use-ncsi;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_rmii3_default &pinctrl_mac3link_default>;
> +};
> +
> +&fmc {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_fmcquad_default>;
> +
> +       flash@0 {
> +               status = "okay";
> +               spi-max-frequency = <50000000>;
> +               spi-tx-bus-width = <1>;
> +               spi-rx-bus-width = <1>;
> +       };
> +
> +       flash@1 {
> +               status = "okay";
> +               spi-max-frequency = <50000000>;
> +               spi-tx-bus-width = <1>;
> +               spi-rx-bus-width = <1>;
> +       };
> +};
> +
> +&i2c0 {
> +        status = "okay";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_i2c1_default>;
> +};
> +
> +&i2c1 {
> +        status = "okay";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_i2c2_default>;
> +};
> +
> +&i2c2 {
> +        status = "okay";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_i2c3_default>;
> +};
> +
> +&i2c3 {
> +        status = "okay";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_i2c4_default>;
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c5_default>;
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c6_default>;
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c7_default>;
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c9_default>;
> +};
> +
> +&i2c10 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c11_default>;
> +};
> +
> +&scu {
> +       mac2-clk-delay = <0x08 0x04
> +                         0x08 0x04
> +                         0x08 0x04>;
> +};
> +
> +&hace {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +};
> +
> +&acry {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +};
> --
> 2.39.0
>
>

-- 
******************************
This e-mail is confidential. If you are not 
the intended recipient, you must not disclose, distribute or use the 
information in it as this could be a breach of confidentiality.If you have 
received this message in error, please advise us immediately by return 
e-mail and delete the document. The address from which this message has 
been sent is strictly for business mail only and the company reserves the 
right to monitor the contents of communications and take action where and 
when it is deemed necessary.
Thank you for your co-operation.

--0000000000006b598505f569d0a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Reviewers,<div><br></div><div>Kindly reminder for this =
patch to be reviewed. Thank you!</div><div><br></div><div>Best regards,<br>=
Jordan</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Thu, Jan 5, 2023 at 6:48 PM Jordan Chang &lt;<a href=3D"mail=
to:jordan.chang@ufispace.com">jordan.chang@ufispace.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Add initial device t=
ree of Ufispace NCPLite platform which uses<br>
AST2600-based BMC.<br>
<br>
Signed-off-by: Jordan Chang &lt;<a href=3D"mailto:jordan.chang@ufispace.com=
" target=3D"_blank">jordan.chang@ufispace.com</a>&gt;<br>
---<br>
=C2=A0arch/arm/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
=C2=A0arch/arm/dts/ast2600-ncplite.dts | 148 ++++++++++++++++++++++++++++++=
+<br>
=C2=A02 files changed, 149 insertions(+)<br>
=C2=A0create mode 100644 arch/arm/dts/ast2600-ncplite.dts<br>
<br>
diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile<br>
index 6c34b83336..20957186b4 100755<br>
--- a/arch/arm/dts/Makefile<br>
+++ b/arch/arm/dts/Makefile<br>
@@ -687,6 +687,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ast2600-dcscm.dtb \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ast2600-fpga.dtb \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ast2600-intel.dtb \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ast2600-ncplite.dtb \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ast2600-ncsi.dtb \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ast2600-p10bmc.dtb \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ast2600-pfr.dtb \<br>
diff --git a/arch/arm/dts/ast2600-ncplite.dts b/arch/arm/dts/ast2600-ncplit=
e.dts<br>
new file mode 100644<br>
index 0000000000..54ee177bfd<br>
--- /dev/null<br>
+++ b/arch/arm/dts/ast2600-ncplite.dts<br>
@@ -0,0 +1,148 @@<br>
+// SPDX-License-Identifier: GPL-2.0+<br>
+// Copyright (c) 2022 Ufispace Co., Ltd.<br>
+/dts-v1/;<br>
+<br>
+#include &quot;ast2600-u-boot.dtsi&quot;<br>
+<br>
+/ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0model =3D &quot;Ufispace NCPLite BMC&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;ufispace,ncplite-bmc&quot;=
, &quot;aspeed,ast2600&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0memory {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device_type =3D &qu=
ot;memory&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x80000=
000 0x40000000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chosen {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stdout-path =3D &am=
p;uart5;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0aliases {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi0 =3D &amp;fmc;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cpus {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu@0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0clock-frequency =3D &lt;800000000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu@1 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0clock-frequency =3D &lt;800000000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+};<br>
+<br>
+&amp;uart5 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u-boot,dm-pre-reloc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
+&amp;sdrammc {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clock-frequency =3D &lt;400000000&gt;;<br>
+};<br>
+<br>
+&amp;wdt1 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
+&amp;wdt2 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
+&amp;mac2 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 phy-mode =3D &quot;NC-SI&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 use-ncsi;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;pinctrl_rmii3_default &=
amp;pinctrl_mac3link_default&gt;;<br>
+};<br>
+<br>
+&amp;fmc {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;pinctrl_fmcquad_default&=
gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0flash@0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;ok=
ay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-max-frequency =
=3D &lt;50000000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-tx-bus-width =
=3D &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-rx-bus-width =
=3D &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0flash@1 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;ok=
ay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-max-frequency =
=3D &lt;50000000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-tx-bus-width =
=3D &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-rx-bus-width =
=3D &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+};<br>
+<br>
+&amp;i2c0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;pinctrl_i2c1_default&gt=
;;<br>
+};<br>
+<br>
+&amp;i2c1 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;pinctrl_i2c2_default&gt=
;;<br>
+};<br>
+<br>
+&amp;i2c2 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;pinctrl_i2c3_default&gt=
;;<br>
+};<br>
+<br>
+&amp;i2c3 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;pinctrl_i2c4_default&gt=
;;<br>
+};<br>
+<br>
+&amp;i2c4 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;pinctrl_i2c5_default&gt;=
;<br>
+};<br>
+<br>
+&amp;i2c5 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;pinctrl_i2c6_default&gt;=
;<br>
+};<br>
+<br>
+&amp;i2c6 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;pinctrl_i2c7_default&gt;=
;<br>
+};<br>
+<br>
+&amp;i2c8 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;pinctrl_i2c9_default&gt;=
;<br>
+};<br>
+<br>
+&amp;i2c10 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;pinctrl_i2c11_default&gt=
;;<br>
+};<br>
+<br>
+&amp;scu {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mac2-clk-delay =3D &lt;0x08 0x04<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x08 0x04<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x08 0x04&gt;;<br>
+};<br>
+<br>
+&amp;hace {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u-boot,dm-pre-reloc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
+&amp;acry {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u-boot,dm-pre-reloc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
-- <br>
2.39.0<br>
<br>
</blockquote></div>

<br>
<div><font size=3D"2">******************************</font></div><div><font=
 size=3D"2">This e-mail is confidential. If you are not the intended recipi=
ent, you must not disclose, distribute or use the information in it as this=
 could be a breach of confidentiality.If you have received this message in =
error, please advise us immediately by return e-mail and delete the documen=
t. The address from which this message has been sent is strictly for busine=
ss mail only and the company reserves the right to monitor the contents of =
communications and take action where and when it is deemed necessary.</font=
></div><div><font size=3D"2">Thank you for your co-operation.</font></div>
--0000000000006b598505f569d0a0--
