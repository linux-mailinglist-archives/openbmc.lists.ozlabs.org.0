Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 319787196CD
	for <lists+openbmc@lfdr.de>; Thu,  1 Jun 2023 11:23:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX0zt64jxz3chl
	for <lists+openbmc@lfdr.de>; Thu,  1 Jun 2023 19:23:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=sStLMxns;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=sStLMxns;
	dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX0zL42Vrz3bNj
	for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2023 19:22:53 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b1a3fa2cd2so4338541fa.1
        for <openbmc@lists.ozlabs.org>; Thu, 01 Jun 2023 02:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685611364; x=1688203364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xu73A7SyMQ/vKw4V8FoQHHfsJoxdUL8BzyNw5Jd0gzg=;
        b=sStLMxnsUA9kUOztr2UAtURKy0UOcEjCG/kCIZ1ItM2EBpXHMYms/al8bzIhiAd3KD
         Bz3BJccK8rqfDE6icjls9TQXlZ6xZz4O01LPUykDpyiymqZJKOll+KgTmnmX3StLa7GM
         x1T+3T1jKsgZI+zAY/Qqlhec+bSXP7yCON8l1dDzIpzfs8yf8vKSG9tFsK8ZbWDtm7xE
         yVUjtkq8GpH/3VSQMdC4hgOipki6EM0ECUHCmgS+pMTwL+B1NpHEhoqDZZCei4N0o2mt
         Ctg/uGoZwduo/SAjE+evrztFryl1tCb8JoeQ/O780johZBI/N/maSC4apzvK0DUfwf1M
         Yw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685611364; x=1688203364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xu73A7SyMQ/vKw4V8FoQHHfsJoxdUL8BzyNw5Jd0gzg=;
        b=R8K8D1352EwR7TvyultBPyrvuRDHarTFpt2Pi0hcpSZYA53PG5QDSg9yIJ3hnlR4F9
         ZXeiXCDi9bmJZRNujkJNWtp8We+mjYDftwjwzWqKEymEGANX6v1ruypXPsjXAN0fqIfp
         0V1kDr2KyUUecTtY5jMosYMwZ+ZQy6Uq2tUa6E/0bvi0eYQGoF6RtFDWWUrOXytJrEYg
         1/Tv8jl79rq2SGKxELVIZRq9qWYiVJRk1yMlMLRVRcYzWLJAR1Vnm7FCGRGjOL0HSwsX
         lAgXCwb2nZ9+oiTi8OL9EaEmKdHV1x0RNZoWrUWRQJzXJSIJ+ei2yDSy8VHqZwK91jQk
         Fmkw==
X-Gm-Message-State: AC+VfDzgSDZ5GgGlmJuqF0MMm/fjNGQBbvRDzduQO9ytTdAnmCbxuOer
	/ljDdIxS6l/2gJ9kmgSDoqpyUW2s3ACyubd3Sh0=
X-Google-Smtp-Source: ACHHUZ41+G57HVbaglyNiCY5aDprCsUSXQubwUCQ4eRJQdir+a5S0eph3E6DQfQlk01eGgpuKDZKTr2BP9dbVWyJaV8=
X-Received: by 2002:a2e:96d1:0:b0:2b1:a3ce:b709 with SMTP id
 d17-20020a2e96d1000000b002b1a3ceb709mr660982ljj.39.1685611364364; Thu, 01 Jun
 2023 02:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230421223154.115312-1-krzysztof.kozlowski@linaro.org> <4a53ed0d-c34b-cea5-b407-066242500611@linaro.org>
In-Reply-To: <4a53ed0d-c34b-cea5-b407-066242500611@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 1 Jun 2023 12:22:33 +0300
Message-ID: <CAP6Zq1gQ0YdEkRw6_aDd_OOkFixQA06jmM_9VOM=uvPnwahoUg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: nuvoton: add missing cache properties
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
Cc: devicetree@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Sorry for the late reply and thanks for your patch.

On Tue, 16 May 2023 at 19:30, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 22/04/2023 00:31, Krzysztof Kozlowski wrote:
> > As all level 2 and level 3 caches are unified, add required
> > cache-unified and cache-level properties to fix warnings like:
> >
> >   nuvoton-npcm845-evb.dtb: l2-cache: 'cache-level' is a required property
> >   nuvoton-npcm845-evb.dtb: l2-cache: 'cache-unified' is a required property
I didn't get these warnings in kernel 6.4-rc4, but still, the patch
has been tested on EVB-NPCM8XX and everything looks good.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> > ---
> >
> > Please take the patch via sub-arch SoC tree.
> > ---
>
> Hi Tomer, Tali, Patrick and others,
>
> Anyone picking this up?
>
> Best regards,
> Krzysztof
>
Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>

Best regards,

Tomer
