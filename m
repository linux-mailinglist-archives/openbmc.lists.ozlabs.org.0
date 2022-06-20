Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A719555123B
	for <lists+openbmc@lfdr.de>; Mon, 20 Jun 2022 10:11:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRMmj42Wbz3bq2
	for <lists+openbmc@lfdr.de>; Mon, 20 Jun 2022 18:11:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=nGc2EyUt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=nGc2EyUt;
	dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRMhN2zhxz3cCN
	for <openbmc@lists.ozlabs.org>; Mon, 20 Jun 2022 18:07:47 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id q9so13471752wrd.8
        for <openbmc@lists.ozlabs.org>; Mon, 20 Jun 2022 01:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EgjbYfuWbdCHmPhWO7lniFTmAGDxbEGTEvRw1crve6c=;
        b=nGc2EyUtcj+IGHVRLrk4YV6cASf/Cl3zROkdIc+snILu0vuUmhC7tf0HIkZ2eG2EYT
         +9Udpx5ENZiJEKZajkc7I+xyYExBf3PmUZg4zEtPJ/rkNt4jCshF8LkWZ00IBgWInc/z
         SFNVt6oMAYHwxydcS5/nRQZw1H2Q0cCKL+osg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EgjbYfuWbdCHmPhWO7lniFTmAGDxbEGTEvRw1crve6c=;
        b=QyVSvM8c0NSsafACkrPEM1aUuMa2dQAO0AXzaYotjsLlKHpVJ6rS7GXjUPp8U8Fhw9
         lLxylLlI3wSzJ04AeTSTrmg1tbVqX9/CDEj50bUXlFcmw8DTk5Wh2rCY06GBsdVbpcmY
         xA9m9JWKEkV6wcmcoy0y/MECGyTIGtNVkww+jBVE5Yi4tOBrvLiVMIkms/tXteZWyuAh
         MGpqJtzu7GdHWhKxyQvXvwCZhyvysKFLflD+MzRxrEsM0dOuEMvne879koFlcyEZgG9T
         UXrVUuABi9fY47Hwi1yymvKupueoLzUZce5eiyUENbBVGWYEEFffzprqhKmWQVesGGPA
         vbvA==
X-Gm-Message-State: AJIora/PYbkKRfedJ3/Ev+9Pfco+nxri5BmuvfueeML55ONBw02sVQfd
	N8zzfFkfLiDzLJEgpF58zDQVUIQcZHtEs5V4g5s=
X-Google-Smtp-Source: AGRyM1sM5QX5FEoDZPSWA8s4pmpkiwHMlZedLCiYC+ey5yqg6MR7avSWkQxoS1dNOCfaQzLX4wigvUfTt/03UbCZDFc=
X-Received: by 2002:adf:e502:0:b0:21b:8de6:7f14 with SMTP id
 j2-20020adfe502000000b0021b8de67f14mr4878225wrm.3.1655712461153; Mon, 20 Jun
 2022 01:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220619151252.3022651-1-clg@kaod.org>
In-Reply-To: <20220619151252.3022651-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 20 Jun 2022 08:07:28 +0000
Message-ID: <CACPK8XdAuETxqm7BTvgLnzKaJBV1vqTzpv6tnrfTtAvYKz1+Wg@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: dts: aspeed: Add a palmetto board (AST2400)
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 19 Jun 2022 at 15:13, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Palmettos were the first OpenPOWER systems built by Tyan with the
> product name: GN70-BP010. They contained an IBM POWER8 Turismo SCM
> processor and an Aspeed AST2400 SoC.
>
> Tested on real HW using the evb-ast2400 defconfig, plus these extras :
>
>   CONFIG_BOOTCOMMAND=3D"bootm 20080000"
>   CONFIG_DEFAULT_DEVICE_TREE=3D"ast2400-palmetto"
>
> Cc: Zev Weiss <zweiss@equinix.com>
> Cc: Fr=C3=A9d=C3=A9ric Barrat <fbarrat@linux.ibm.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Looks good, thanks C=C3=A9dric.

> ---
>
>  Since v2:
>
>  - DT cleanups (Zev)
>  - Dropped the defconfig because only the default boot command needs
>    an update to boot Linux
>  - Tested on real HW ! Thanks to Fr=C3=A9d=C3=A9ric.
>
>  arch/arm/dts/Makefile             |  1 +
>  arch/arm/dts/ast2400-palmetto.dts | 73 +++++++++++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 arch/arm/dts/ast2400-palmetto.dts
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 35cdd0952d33..6dc9aeab24ff 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -677,6 +677,7 @@ dtb-$(CONFIG_ARCH_BCM6858) +=3D \
>  dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>         ast2400-evb.dtb \
>         ast2400-ahe-50dc.dtb \
> +       ast2400-palmetto.dtb \
>         ast2500-evb.dtb \
>         ast2600a0-evb.dtb \
>         ast2600a1-evb.dtb \
> diff --git a/arch/arm/dts/ast2400-palmetto.dts b/arch/arm/dts/ast2400-pal=
metto.dts
> new file mode 100644
> index 000000000000..43b141a8379d
> --- /dev/null
> +++ b/arch/arm/dts/ast2400-palmetto.dts
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "ast2400-u-boot.dtsi"
> +
> +/ {
> +       model =3D "Palmetto BMC";
> +       compatible =3D "tyan,palmetto-bmc", "aspeed,ast2400";
> +
> +       memory@40000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x40000000 0x10000000>;
> +       };
> +
> +       chosen {
> +               stdout-path =3D &uart5;
> +       };
> +
> +       aliases {
> +               spi0 =3D &fmc;
> +               spi1 =3D &spi1;
> +       };
> +};
> +
> +&uart5 {
> +       u-boot,dm-pre-reloc;
> +       status =3D "okay";
> +};
> +
> +&sdrammc {
> +       clock-frequency =3D <200000000>;
> +};
> +
> +&wdt1 {
> +       u-boot,dm-pre-reloc;
> +       status =3D "okay";
> +};
> +
> +&wdt2 {
> +       u-boot,dm-pre-reloc;
> +       status =3D "okay";
> +};
> +
> +&mac0 {
> +       status =3D "okay";
> +
> +       phy-mode =3D "NC-SI";
> +       use-ncsi;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_rmii1_default>;
> +};
> +
> +&fmc {
> +       status =3D "okay";
> +       flash@0 {
> +               status =3D "okay";
> +               spi-max-frequency =3D <50000000>;
> +               spi-tx-bus-width =3D <2>;
> +               spi-rx-bus-width =3D <2>;
> +       };
> +};
> +
> +&spi1 {
> +       status =3D "okay";
> +       flash@0 {
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pinctrl_spi1_default>;
> +               status =3D "okay";
> +               spi-max-frequency =3D <50000000>;
> +               spi-tx-bus-width =3D <2>;
> +               spi-rx-bus-width =3D <2>;
> +       };
> +};
> --
> 2.35.3
>
