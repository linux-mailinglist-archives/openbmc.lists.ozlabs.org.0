Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9BC4D7D92
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 09:25:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KH8jg2XTkz308b
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 19:25:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Dws+yd7p;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232;
 helo=mail-lj1-x232.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Dws+yd7p; dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KH8j92Lw8z30F2
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 19:24:45 +1100 (AEDT)
Received: by mail-lj1-x232.google.com with SMTP id y17so3558287ljd.12
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 01:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Iq78d1j2Ue+2y6u1MiPwO8kxCr3UFeP2P8LyryGJ4Ic=;
 b=Dws+yd7pP/4j0pJJ3NzE1FS+WEUDWo+U39fxUZEgwR/+CZjtWUFtDvpHGPP1Opi1d3
 K8JgF8oICvaNNXvW3XJDL1sVNJvKBYy3Ad5urfijjOX24uX1AcF2hsAdIu5yNsuQx47c
 +Ze4OWmVoR7A+h9PG1l8C+dHry7A7z0elHPZDRNEHWcUUU+aAmlsdIttF7nK/HXGlb8U
 G1iiCd6lZ0tGbayACmVI3Yh55JwdqHQZGoL6W1grXKKE7YJc9EJnom6CwTpSr8VBBue8
 13MHXJH/MeYe9AFjf9cyZLu3bGjKGHyYPfhcDfjJQ3ac75LrWPWdYE1utmyy6lZJ8rE0
 BBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Iq78d1j2Ue+2y6u1MiPwO8kxCr3UFeP2P8LyryGJ4Ic=;
 b=zJKPPxCoOJd4Fqa1aWHIXSWxl5AZbsa5Pkzxw1vYEa7LyQdZ9eJ0rFaZl5m7adG81W
 Md+B5bldPS52p+BUVj8Rwho2ez+XgbDg86hptOtkebpbq3CQ6dG1/J12hwN3nWy7JfOs
 0ausCmiAE6gBvaGM8wR0lkuqUQ85Bhx0R75rRwEkboaAnAYlJ5yghTfHrAmT+32bRmGL
 pRhyVKwTuBYWKTEpWVG31f1HByjcjJC9duU+mENlRHMNz+60vPdH0iTCeHEBQY8lv5hY
 JsMgFNEnpdpj2zyer++JxPJ2/xq0qNAtLB+RIaS4HsnZdJcANSkaW2/ygbTUkJ2BtFlR
 Pwug==
X-Gm-Message-State: AOAM531R+09Mk4nzrlHGXY77uLEWMzyS/wAkhA1Rd8G9iPNvy2BWfBWW
 NmQ0Mjwq1EcHuXaGNjZzsHnd7zJgTcGkpobrOxM=
X-Google-Smtp-Source: ABdhPJzxE2RH8clRVTd3DJzDgV4Zn7Rxw0lvZpFtJUyiP64C1vhUYmtEx0zSbl5qIqZzxSeicOylaVy5JTHvrT+jWUQ=
X-Received: by 2002:a2e:2202:0:b0:248:684:4476 with SMTP id
 i2-20020a2e2202000000b0024806844476mr13871061lji.64.1647246281586; Mon, 14
 Mar 2022 01:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220311014245.4612-1-ctcchien@nuvoton.com>
 <20220311014245.4612-4-ctcchien@nuvoton.com>
 <1f5e1e49-4ab0-5e06-fa8f-2a11b0fd1df9@canonical.com>
 <CAHpyw9dHau348qJB6g+fCcKqWByUsRHAGwb_mdUg=hjhW+xNsw@mail.gmail.com>
 <143db512-0223-1553-c141-2dc24a23c430@canonical.com>
In-Reply-To: <143db512-0223-1553-c141-2dc24a23c430@canonical.com>
From: Medad Young <medadyoung@gmail.com>
Date: Mon, 14 Mar 2022 16:24:30 +0800
Message-ID: <CAHpyw9dn=3sGfjcqtQN-GwdoCo=dfhOrofTGMZJc+2Jjpr7pAw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] EDAC: nuvoton: Add NPCM memory controller driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 Benjamin Fair <benjaminfair@google.com>,
 linux-edac <linux-edac@vger.kernel.org>, KFTING <KFTING@nuvoton.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>,
 YSCHU@nuvoton.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=E5=
=B9=B43=E6=9C=8814=E6=97=A5
=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:36=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 14/03/2022 06:32, Medad Young wrote:
> > Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=
=E5=B9=B43=E6=9C=8811=E6=97=A5
> > =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:15=E5=AF=AB=E9=81=93=EF=BC=9A
> >>
> >> On 11/03/2022 02:42, Medad CChien wrote:
> >>> Add support for Nuvoton NPCM SoC.
> >>>
> >>> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> >>> ---
> >>>  drivers/edac/Kconfig     |   9 +
> >>>  drivers/edac/Makefile    |   1 +
> >>>  drivers/edac/npcm_edac.c | 714 +++++++++++++++++++++++++++++++++++++=
++
> >>>  3 files changed, 724 insertions(+)
> >>>  create mode 100644 drivers/edac/npcm_edac.c
> >>>
> >>> diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> >>> index 58ab63642e72..757e1d160640 100644
> >>> --- a/drivers/edac/Kconfig
> >>> +++ b/drivers/edac/Kconfig
> >>> @@ -539,4 +539,13 @@ config EDAC_DMC520
> >>>         Support for error detection and correction on the
> >>>         SoCs with ARM DMC-520 DRAM controller.
> >>>
> >>> +config EDAC_NPCM
> >>> +     tristate "Nuvoton NPCM DDR Memory Controller"
> >>> +     depends on ARCH_NPCM
> >>
> >> || COMPILE_TEST
> >> (and test if it compiles)
> >>
> >> (...)
> >>
> >>> +
> >>> +MODULE_DEVICE_TABLE(of, npcm_edac_of_match);
> >>> +
> >>> +static int npcm_edac_mc_probe(struct platform_device *pdev)
> >>> +{
> >>> +     const struct npcm_edac_platform_data *npcm_chip;
> >>> +     struct device *dev =3D &pdev->dev;
> >>> +     struct edac_mc_layer layers[1];
> >>> +     const struct of_device_id *id;
> >>> +     struct priv_data *priv_data;
> >>> +     struct mem_ctl_info *mci;
> >>> +     struct resource *res;
> >>> +     void __iomem *reg;
> >>> +     int ret =3D -ENODEV;
> >>> +     int irq;
> >>> +
> >>> +     id =3D of_match_device(npcm_edac_of_match, &pdev->dev);
> >>> +     if (!id)
> >>> +             return -ENODEV;
> >>
> >> Why do you need it? How such case is even possible?
> > this driver is used for two nuvoton SOCs, one is NPCM845 and the other
> > is NPCM750
>
> Yes and how NULL can happen for OF-only driver? Unless I missed
> something and this is not an OF-only driver? Do you allow any other
> matching methods?

I got your point, thanks

> Best regards,
> Krzysztof
