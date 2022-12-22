Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE76653A95
	for <lists+openbmc@lfdr.de>; Thu, 22 Dec 2022 03:26:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NcvLt0Zlbz3bTF
	for <lists+openbmc@lfdr.de>; Thu, 22 Dec 2022 13:26:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hDYZp3Hw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a34; helo=mail-vk1-xa34.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hDYZp3Hw;
	dkim-atps=neutral
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NcvLG6GBlz2xl6
	for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2022 13:25:42 +1100 (AEDT)
Received: by mail-vk1-xa34.google.com with SMTP id l17so383230vkk.3
        for <openbmc@lists.ozlabs.org>; Wed, 21 Dec 2022 18:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MfZ23cEJwXLKSr6nmgfag7ZLnBMhbp4IOiKmfURc+PE=;
        b=hDYZp3HwDVcSHM5PHuNPwkrEgXERdj/uYSRgKEqZyt/Yu2J1bYP8aOgDGPeVgBG6c6
         fs5xt9vU8j13TMUCVvHrcqTYPidhB2KsZgIV8AYRCchH8O11sQM/8u5RZGucOopdgboN
         629NNobfnlJLzVwOPDbofAZ/w7mz6h1DtD5DhLohFnDYY94LInD9QGrlrZ5SxA7PPjA3
         BtkzATZtCZRaL4tHx0RrC1vhP8ppzTHm5JTwDiYi1WXCHJBqk8+tjoGIsfUScZ2sDFib
         KbRdVp06XfOVtrzp6PtKIYewuSD3LOqeSFR1FU75uGo6zjC42dnHVaM8bdzlmQTwi28i
         28PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfZ23cEJwXLKSr6nmgfag7ZLnBMhbp4IOiKmfURc+PE=;
        b=j0bO6ESD9oAykIzzwgRs2suACDATDeSK9FEuS1aZk9yxRppt3NbB4PPASj+wcPpHjP
         cES4Ac7IwyfUn26g1B39EofI2OnYPbWmf8Sxr418fsveceS36ZxBRSauRGPM+5DKXioO
         xpD1jRFfBtt5xBqbmPq0K0eCppnVpCPHVTk2xsGhLZ+2iB4GM9p7iN0Whn2UC1aqACYP
         8NCHRmot3WLxftRrrwKPFPtFGdWWqLzfsMaD3IbcDfRJxI3bJy489w1kvv40mqQm+dZX
         cpKPNrk7hbqf5cf64HO8QPIWEVN77gkQofuDI35jSc/2MFNVIqRasXDGpBKEs5S6PO72
         8WHg==
X-Gm-Message-State: AFqh2kqPb8TAKs6ha/YcsbuoGcLEak2OKiIdQQFr9iL/MLlm2getbNAK
	aqTeFTu/b6++yoeF5EKFN7pwdV1nEczUL38XoHI=
X-Google-Smtp-Source: AMrXdXuRFuI8cdaqk75LHVOliXHJsNODxYmahNgKTZ4VEqZEVp6d3ggCrQ60MjROEkrT60IeZnkYPec1crXp7vRwtKA=
X-Received: by 2002:a1f:7344:0:b0:3b8:615e:f0a with SMTP id
 o65-20020a1f7344000000b003b8615e0f0amr432211vkc.34.1671675939369; Wed, 21 Dec
 2022 18:25:39 -0800 (PST)
MIME-Version: 1.0
References: <20221220094055.3011916-1-milkfafa@gmail.com> <20221220094055.3011916-3-milkfafa@gmail.com>
 <44a62c49-1894-aee2-63fd-05b2e70a8aef@linaro.org>
In-Reply-To: <44a62c49-1894-aee2-63fd-05b2e70a8aef@linaro.org>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Thu, 22 Dec 2022 10:25:28 +0800
Message-ID: <CADnNmFrqJH5Vwk-R0M4yeoEK==UWMeMkUed+AiUKmh6aKAdcOA@mail.gmail.com>
Subject: Re: [PATCH v9 2/7] media: dt-binding: nuvoton: Add NPCM VCD and ECE engine
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, kwliu@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-media@vger.kernel.org, tali.perry1@gmail.com, andrzej.p@collabora.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, hverkuil-cisco@xs4all.nl, mchehab@kernel.org, kflin@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> On 20/12/2022 10:40, Marvin Lin wrote:
> > Add dt-binding document for Video Capture/Differentiation Engine (VCD)
> > and Encoding Compression Engine (ECE) present on Nuvoton NPCM SoCs.
> >
> > Signed-off-by: Marvin Lin <milkfafa@gmail.com>
> > ---
> >  .../bindings/media/nuvoton,npcm-ece.yaml      | 43 +++++++++++
> >  .../bindings/media/nuvoton,npcm-vcd.yaml      | 72 +++++++++++++++++++
> >  2 files changed, 115 insertions(+)
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
