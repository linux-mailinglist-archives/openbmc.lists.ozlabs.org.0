Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 448FA55AD8E
	for <lists+openbmc@lfdr.de>; Sun, 26 Jun 2022 01:29:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LVqvJ3R4Qz3bts
	for <lists+openbmc@lfdr.de>; Sun, 26 Jun 2022 09:29:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=N4D4Xi/Z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=N4D4Xi/Z;
	dkim-atps=neutral
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LVqts3Qc3z3bdF
	for <openbmc@lists.ozlabs.org>; Sun, 26 Jun 2022 09:28:50 +1000 (AEST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-3178acf2a92so55121267b3.6
        for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2022 16:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ZHbHCzgoQABSLSyZg/clIwjQ3dcNnkQ5dXPgPYxATQ=;
        b=N4D4Xi/ZkS3g3tlO204tZ0mkKhnIOSd0acgAfI4W+ZQommQ6v+6ziiA9vaKLZB1zm3
         ylk5U6EcbKo2nBk3LV4euELboUgU97u10+M1vva8j1SQ9NaOUirt1OsOICRsZxACg39f
         lgjgv0snIW55QwjgLDiw+ocE7KVu13CPv/p2Qtk6lVq6Ub5vFMo9cuwQoJE4N06H78Hm
         tGRrQnvm18hSZ4Z4tIHIAyTHJz2gIfo/cPqp9gfycDseZ35TW5OgJ3cGaPs6XzYWAJSC
         LR1o3zCklx/ZCZPlE4JK6uVQOh1UlN9XUpSz9K7shEAVGA8y9CmkSSZoICDXatuWfoqw
         2LRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ZHbHCzgoQABSLSyZg/clIwjQ3dcNnkQ5dXPgPYxATQ=;
        b=npjHfyHdAxsUOgpb+xhaEy149LzkO1irtFH5uwoTh4Kn2vOCTuZewB22Eem79CksMm
         bcdPsNEwKx63CQIltGg9DFfZpOJD5B4HGMayq5o/wSwa/OqFEYMm9fhhKZb/EriWiswo
         Ywzl9vcH7Hh3bcPJ1ZDUPKBO5c4kvrzIG3wnw/drNOmaWTFU6JCNi2wdUULjIdM8e2Gw
         CJU7eitBhRFuTRNj6BFm/bE7tNI/+lj+yMJFJm9LpZ7L7HiAWxpOW3/lxrHHV25SZR4S
         aNHjKuCsK2QGIZDpZEzR2x0QIDP4Lui/duA6XuMjolC/yDpOqCE2upBEdw3A7JhWNCqI
         4F0g==
X-Gm-Message-State: AJIora/njsXsKdm2h/ziVS1t+hTv7EIcz86JQQQu64VdUo3Owf8fLJI2
	8iMwd2c0cjoVu6HTzXk+JeQPQclPRZBEuUVgXoLKLg==
X-Google-Smtp-Source: AGRyM1spnHk4DL1GaXxVekSrkt1iH996cdrejY3FYGxU0SDg1CbcxSaWPwj2DH8lacg9auY41J3Ys1RDyCcjq6nVpWg=
X-Received: by 2002:a0d:e20a:0:b0:317:ce36:a3a0 with SMTP id
 l10-20020a0de20a000000b00317ce36a3a0mr6969123ywe.448.1656199726318; Sat, 25
 Jun 2022 16:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 26 Jun 2022 01:28:35 +0200
Message-ID: <CACRpkdYVPeEtKKA9xdiSAP6oJrX5eAKoOVaLnrELTv_ZQOEMUw@mail.gmail.com>
Subject: Re: [PATCH v3 04/40] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl:
 align key node name
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
Cc: devicetree@vger.kernel.org, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, openbmc@lists.ozlabs.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 16, 2022 at 2:54 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> gpio-keys schema requires keys to have more generic name.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

OK, do you want me to apply this one patch to the pinctrl tree or
will you collect a series?

Yours,
Linus Walleij
