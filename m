Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9EE55EDCE
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 21:27:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXZNq4xZBz3cKp
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 05:27:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r5dhjikO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r5dhjikO;
	dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXZNQ0R7Vz3bxp
	for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2022 05:26:59 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id d5so23938713yba.5
        for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 12:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=walg9+X25Qf0Q2kOl7EPuRRmD7l8R+TPYwiRkuq/taA=;
        b=r5dhjikOjoOSTxH7twYmSKEfHqErqjhxkSM9McqWoCouOgLOQB7kvkMdEEzxx/BDX6
         TQrjLVB6hMIfuOa9g8Jq2JmzE97r9+o77os7tKeNZgQG+gQR3fBWEr5T9i+X01s9wRKF
         poqPtQCKU93338RDg9n0sUG/ZEqcMMUZPZnDwkORaC63HcYlFTRnittAcohjRCM8pOOF
         g/UPD7ABIbEWrLq01pVgh4ii12ETWhUPrCA8/9LHWHuLKXXESxjWthvXPWzyjMNL6Oot
         Hlc8iuNIiurItn418+oTScTJhM5C5ncPhx/nMRn5oHIDm7HNscLwCkwchgANUMMiViBr
         lmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=walg9+X25Qf0Q2kOl7EPuRRmD7l8R+TPYwiRkuq/taA=;
        b=xmubhzeY8sLwptaJBW7jIuyCDpYVl4BaqbmF6HXFbBJQMt0JBmONI6MCt78VIyAivW
         BXNsYt2cJAVmUhZ2P23VVHLlyKwwB+k6kQs5t0FT855tjclgpwgIDVbsAFcWwQD6we3k
         WKnHzb1olHOlJMPZh2lU6mOPxTG8htyrXMq6pe9uazJ8MBBLRqGx/EFTGIs19YO00Y4U
         minBOAgf6s0FgvOvw73gmT2YpKK/kY4K14YA4ryBnGCMWwFT6Nps13WNetYZry25LEso
         atMLeAictn8bFloCryZ5fg+xeb7Np6vpfFrx1qeFn98EGHo4apVqbfWJ67kVt5RHKhvb
         VSuw==
X-Gm-Message-State: AJIora93PemfeD9S8OOeTlFJSsCbc98O4IIA8SzLDSch1X24h5ue3+B+
	2wKIjU1XAgb93c4gz4C9fWDNAjoBsqrpzGRnY5LFLg==
X-Google-Smtp-Source: AGRyM1tix/MDbYpAocLhXqNa2cuD1sSvJJYVbcVLzqD1nAvkTSC00uKkSWSEB65C4UY4pgJ8yatan7ZYC8uyX2aYtAw=
X-Received: by 2002:a25:e7d4:0:b0:66c:899b:49c6 with SMTP id
 e203-20020a25e7d4000000b0066c899b49c6mr21915704ybh.291.1656444414438; Tue, 28
 Jun 2022 12:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Jun 2022 21:26:43 +0200
Message-ID: <CACRpkdawFWN_3EYV0p2AAgu54Lu1s0YgqiSiV3136wOSfSGhrg@mail.gmail.com>
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

Patch applied!

Yours,
Linus Walleij
