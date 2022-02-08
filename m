Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 327F74AD7B0
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 12:41:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtLgG6Tr8z2xKK
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 22:40:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FwaJSf4c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2e;
 helo=mail-vk1-xa2e.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FwaJSf4c; dkim-atps=neutral
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtH9X6bV0z2yLv
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 20:03:26 +1100 (AEDT)
Received: by mail-vk1-xa2e.google.com with SMTP id d27so1823050vkn.5
 for <openbmc@lists.ozlabs.org>; Tue, 08 Feb 2022 01:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g7Zin2rUPB97FeKXpo4tsRMRhY3AWBi3dGQJ2mNf6+4=;
 b=FwaJSf4cmxqj0kr3AaXMp8lonIfAVaWAyVNwBcpOaDNtXTtz9Dti2xOSdqS4zlW4Rx
 NRVtec57NFaWGiPr4zyHMz6aFrNSn07YPX7X6ZDfShlaIntYqAn/xFhA3rLuvC8j5MCl
 805BozXUKF0vruVlDQA3TIjjql9VCTaLZRdztZNCwgCc/E6jmAlGUsO2JRzdqUgiqM/t
 VgJ1aAySF28mAeISOMCjM1GIFPG84kBmy90OhIfSEG++JWBuVRb7RhcabAiWWcSCB6wt
 yM+Fj+ExdpsTKPQCGtN5rOFENv+Ja1z54EDdohiWtHdrLpVresiPAgvw69mgX/TTU42a
 hAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g7Zin2rUPB97FeKXpo4tsRMRhY3AWBi3dGQJ2mNf6+4=;
 b=2Ee0IVN8svDlQlUg6fPKTAtR4pNdrvnzah+ycoLkoM7nanP0Q4zNNntIp5kf6HOxAy
 Hgc6OyliFHezwTawPNb7DP5RV4JTGWkkk5poms6OvyEghhKFYv2UZm0W2DKmy/vOdVTa
 VQsaf1n4UcNgi2n9FUKt1s3XH+1DLRDcxXOWYUS490vFH3kwjSi5ojwSLM6SIZvmpqYs
 DX4TQ6QNmQ6L8RJEh/WEfx1afGBsMHqBRI1y1IxkrPCSrGxTRgpKc+2fm4kXqHfS41gY
 tgYMuuOJVbsa8QM13PZtbCdNu7rZCv+lAFHCWvXiBGJ2z/h4Gqe1uA/jKRHwStw3tQXT
 oB1A==
X-Gm-Message-State: AOAM530NA4uvmOjQEg5Uf8nhRY3hR19kZe3sLdjiFEpckwjFwJoHVMcV
 JfuqNv8COTcyd5+Aj2F/mvKYjbon2rNDgVOzJg==
X-Google-Smtp-Source: ABdhPJyinu4n6GoB11vkNuf0WE0tbwdWbilUOFXd8tUNEKbSfSiWxNOJhGqQ+2aAdj53Gyr6yQ2eJogPz61o5GOgXgc=
X-Received: by 2002:a05:6122:8d2:: with SMTP id
 18mr1267658vkg.31.1644311003630; 
 Tue, 08 Feb 2022 01:03:23 -0800 (PST)
MIME-Version: 1.0
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-2-warp5tw@gmail.com>
 <1644243760.823059.320509.nullmailer@robh.at.kernel.org>
In-Reply-To: <1644243760.823059.320509.nullmailer@robh.at.kernel.org>
From: warp5tw <warp5tw@gmail.com>
Date: Tue, 8 Feb 2022 17:03:12 +0800
Message-ID: <CACD3sJa4JOV2MYknMVGXVT0wEVbA4SkexaV5JLg_ukXqyE84+g@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] dt-bindings: i2c: npcm: support NPCM845
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 08 Feb 2022 22:39:24 +1100
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
Cc: tmaimon77@gmail.com, KWLIU@nuvoton.com, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, andriy.shevchenko@linux.intel.com,
 benjaminfair@google.com, krzysztof.kozlowski@canonical.com,
 openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com,
 tomer.maimon@nuvoton.com, devicetree@vger.kernel.org, bence98@sch.bme.hu,
 arnd@arndb.de, sven@svenpeter.dev, robh+dt@kernel.org, Avi.Fishman@nuvoton.com,
 yangyicong@hisilicon.com, semen.protsenko@linaro.org, avifishman70@gmail.com,
 venture@google.com, linux-kernel@vger.kernel.org, wsa@kernel.org,
 kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi all:

Thank you for your comments and they will be addressed.

Regards,
Tyrone


Rob Herring <robh@kernel.org> =E6=96=BC 2022=E5=B9=B42=E6=9C=887=E6=97=A5 =
=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:22=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, 07 Feb 2022 14:33:33 +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > This commit adds compatible and syscon description for NPCM845 i2c modu=
le.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 21 ++++++++++++++-----
> >  1 file changed, 16 insertions(+), 5 deletions(-)
> >
>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>
> Full log is available here: https://patchwork.ozlabs.org/patch/1589171
>
>
> i2c@80000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>
> i2c@81000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@82000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@83000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@84000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@85000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@86000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@87000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@88000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@89000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@8a000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@8b000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@8c000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@8d000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@8e000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>
> i2c@8f000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>
