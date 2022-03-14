Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E84B4D7D8E
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 09:24:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KH8j036FNz30C2
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 19:24:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jekb1x+x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jekb1x+x; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KH8hZ2RKPz2xTn
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 19:24:11 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id g17so25687934lfh.2
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 01:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d/Zl5IT0l4GxJ3EjJL6DVxZWvh+do4XqDD23U9DbZgg=;
 b=jekb1x+xSCPoaVZdOGtvtnkt50ZAaEN27HK0Je+kfHmEcH/Nb5Wpt+xMDNZeBCoEf8
 h86wS+ScdEpGUI+iaSeKOmjno4u2m5LYBGPOutdnup/+X41zgH2dciLKkdwBbnRLewCm
 jEL3iSX/gp78Z7h5t96/JEgarjlKvlXuNls5lH80FiEEEoqk/EBGCcTj02KO2A8EzKM5
 mW1xiHBgj8V3Opi1NJ9VRg7F+DA5eHHBGmzUNFvIbgCgDW+0uDEZgKa+g9DrAHqAfb/G
 50HPqXDChLWiUMMMYZ92PJYccNleApTRNksJfkgbqnyKOyzmf9OCLyr3fMZCgKJIgdpO
 bMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d/Zl5IT0l4GxJ3EjJL6DVxZWvh+do4XqDD23U9DbZgg=;
 b=zQ1JcYZCUHITZnRF/hus7qKGoMz4h7VlwyV3ajXG0dGs+7VIS5/sICdiaVj8E1QO7n
 +olniG6TxK8ZB6z7wUuJ2fuINMG3ZQo2JgUwqbQbVm+DDPxrh40IO/ZzAKqQRwPwKMGY
 NI9qr2Clx/wO+XPHxlpb1OxlIIIRg4LCNzoV5dGBXpbL3Eyda7rClMBLF2jvRqehgrW5
 V6Y7nk3B+bUd8tu7gUtLOdl3aAI0FZOBf6XtFAt+BtU4td/U5uShwCwQHga7ClEbbOl3
 9ceJUw1Ng+5lday1/Ad4pbrueOsQhXRdjJvr24h53sQu1R5W3NWvkf+I0QZphnJlyUuR
 VhKw==
X-Gm-Message-State: AOAM5322anb0+bKFCPmDxVf72RplwsTvYPh3H5nKvscI4K0Jt+J5Jrpl
 DbTn5Ug2+h5+dxhCZxVw4SyjN67RHJ/7bK2aDlE=
X-Google-Smtp-Source: ABdhPJxcQVutRrJHAKzxsvpL9ozDO8Rmh3dnF0ZeMh5Y3ZTHiJXvWl4AkLZHOTT+KLQ/oW0guE+d1qJaxJjCAZietL8=
X-Received: by 2002:a05:6512:3a8b:b0:448:30d6:a73c with SMTP id
 q11-20020a0565123a8b00b0044830d6a73cmr12806889lfu.393.1647246247341; Mon, 14
 Mar 2022 01:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220311014245.4612-1-ctcchien@nuvoton.com>
 <20220311014245.4612-4-ctcchien@nuvoton.com>
 <1f5e1e49-4ab0-5e06-fa8f-2a11b0fd1df9@canonical.com>
 <CAKKbWA7Pr8Gi-rU5_BZ32y5aiLV0tSM19WkRe+zF8spWdk5zMg@mail.gmail.com>
 <4f8fffa7-631a-9b87-ee0a-0fb7dc1fec66@canonical.com>
In-Reply-To: <4f8fffa7-631a-9b87-ee0a-0fb7dc1fec66@canonical.com>
From: Medad Young <medadyoung@gmail.com>
Date: Mon, 14 Mar 2022 16:23:56 +0800
Message-ID: <CAHpyw9fHhCtzT3RM3o+2n26Ni+FdDQoTUOCMCfFspZHsQSs7Qg@mail.gmail.com>
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
 James Morse <james.morse@arm.com>, Borislav Petkov <bp@alien8.de>,
 YSCHU@nuvoton.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=E5=
=B9=B43=E6=9C=8814=E6=97=A5
=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:35=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 13/03/2022 21:22, Avi Fishman wrote:
> > On Fri, Mar 11, 2022 at 11:15 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@canonical.com> wrote:
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
> >>
> >>> +
> >>> +     npcm_chip =3D of_device_get_match_data(&pdev->dev);
> >>> +     if (!npcm_chip)
> >>> +             return -ENODEV;
> >>
> >> I wonder, how is it possible to have here NULL?
> >>
> > Both of_match_device() and of_device_get_match_data() can return NULL,
> > are we missing something?
>
> I think your driver is OF-only, right? If yes, how is it possible to be
> here in probe() (meaning: being matched by of_device_id) and a few lines
> later do not match the same of_device_id?

I got your point, thanks

> Best regards,
> Krzysztof
