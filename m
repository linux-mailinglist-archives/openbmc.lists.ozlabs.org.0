Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD4A64E768
	for <lists+openbmc@lfdr.de>; Fri, 16 Dec 2022 07:50:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYKVD3Ns0z3bVc
	for <lists+openbmc@lfdr.de>; Fri, 16 Dec 2022 17:50:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qOktYSYr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2c; helo=mail-vk1-xa2c.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qOktYSYr;
	dkim-atps=neutral
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYKTh5tQhz2y32
	for <openbmc@lists.ozlabs.org>; Fri, 16 Dec 2022 17:49:43 +1100 (AEDT)
Received: by mail-vk1-xa2c.google.com with SMTP id z23so716820vkb.12
        for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2022 22:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9q4hNAhFX5TgKEHkZZjHQgWEJZiBDgjlX0UodJD6O5o=;
        b=qOktYSYrC5bTpZcPM0UPPRZ5QRrj7Apa55cFwDsqMG3d07ElVuL9lmmykstsib2DSm
         4teUj67sEcjvGnu4l3ujj1kd+TFYACgj8+o/Aieapxd0jAqxXtKDQx9SOIToLPYmsjhq
         F331XcTy2SGbj8S83cIDTG20xvvMrfMblPmPtc6vvWPg5H99VxznHk97B8bwijfI1eiD
         Wc2rGM74cKpLasvd3EMHBBcEPvliUBTUhgijY1IZjXHLmE9Co3iRNIii9h+MGkiddS7K
         2x4v0dJe7N1yULmDIb9IXvQRDp0CspmmUtT6x9wYz253qKKvOUuZvwPLKylMhixITVZe
         1tmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9q4hNAhFX5TgKEHkZZjHQgWEJZiBDgjlX0UodJD6O5o=;
        b=mGrQOTZ9n8y/dAzPvhVssyH7kEYjcNbP1CbDGrDafEAv56FYfx2K/6/PBUggk0Du6k
         iRrkaKnl0OSOfKG1maV8uBQovzCmBREIMrIWaHGY1SSimN6hcQ2mPFQKg4AqVQppscL1
         24adnSFHq4+ZprrE5UPAXeoSYzyEhDLaq67kofruJOJN3x/ZFIZSdh7GsdUVmKVHILJx
         s77p7b9DLVDuMoe7of488BsSEwyb0oMHeXv7f7gFSdKSUp4dmQaV6uUYxyZFDaLlnq68
         AWovKPbOM3nEV/fmSgYoo4A1dOFXhCnDFvnsXwPOcqFhbyVtG3S9aPhzxYUKusKR790p
         iHkg==
X-Gm-Message-State: ANoB5pnJerTgPdBlbEwpV+jfFIiXhdO7cQFbJg1G176A4N7aUh5cK0+6
	9UaFlG6uwfxEbGWFfN17V4rg4LZfjhDxW0EnmK4=
X-Google-Smtp-Source: AA0mqf6HfpclnQaKxpSrvKyq1P3aMZh0188ZBlj8B6v1RDg4dTiOwh+APqu68QIhLcVfwQg6sE86qO2mRxKE/xUhZfg=
X-Received: by 2002:a05:6122:50f:b0:3ab:820:316f with SMTP id
 x15-20020a056122050f00b003ab0820316fmr60023855vko.15.1671173379765; Thu, 15
 Dec 2022 22:49:39 -0800 (PST)
MIME-Version: 1.0
References: <20221214092636.810883-1-milkfafa@gmail.com> <20221214092636.810883-4-milkfafa@gmail.com>
 <505acb6e-24c4-45c7-7a54-1a77e3718fec@linaro.org>
In-Reply-To: <505acb6e-24c4-45c7-7a54-1a77e3718fec@linaro.org>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Fri, 16 Dec 2022 14:49:28 +0800
Message-ID: <CADnNmFp9ajB2cPy4rFw6CWiMfbjxp=eS3zk3kV0+U1QWuAgfyQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/7] dt-bindings: arm: nuvoton: Add bindings for NPCM GFXI
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, kwliu@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, benjaminfair@google.com, krzysztof.kozlowski+dt@linaro.org, mchehab@kernel.org, kflin@nuvoton.com, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2022=E5=B9=
=B412=E6=9C=8815=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=884:58=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> On 14/12/2022 10:26, Marvin Lin wrote:
> > Add dt-bindings document for Graphics Core Information (GFXI) node. It
> > is used by NPCM video driver to retrieve Graphics core information.
> >
> > Signed-off-by: Marvin Lin <milkfafa@gmail.com>
> > ---
>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
>

Thank you for your review!

Regards,
Marvin
