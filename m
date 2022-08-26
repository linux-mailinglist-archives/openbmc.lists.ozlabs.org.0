Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3575A28AD
	for <lists+openbmc@lfdr.de>; Fri, 26 Aug 2022 15:34:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDgmR0pbVz3bsK
	for <lists+openbmc@lfdr.de>; Fri, 26 Aug 2022 23:34:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Badek9Z3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Badek9Z3;
	dkim-atps=neutral
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDgm12Ml7z3bc1
	for <openbmc@lists.ozlabs.org>; Fri, 26 Aug 2022 23:34:06 +1000 (AEST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-33dc31f25f9so35969327b3.11
        for <openbmc@lists.ozlabs.org>; Fri, 26 Aug 2022 06:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=qiR3kqY1FtS7aluiuV2htyDwOrHtB3ABTNirVnY7LY0=;
        b=Badek9Z3Zw7k7MP3T3YzVdM7CAxTgNBC24Y9sxs8xUcI7ApWgF7W8s+Gcvz5ZVhKP1
         Gv/BM4JpKuQ0UsB3GLYAcuMHJrwhuMYNb4FXaxY6qW5KzLK0QVcBuDwguYH4jNNxTedj
         lCUZuv+5g6OWaGpzsg7CujNCCX8jo0zwxY/d62havl0hP9HtOY07Lla1ygso+jhceuRo
         c6zerpixbQK+eKtQ2/j8/OVTJ7t+7dCHSEbF6H4JAlv0ncMGq4l8alqAwd7ZBJWq49W7
         dduQbKTdmgNjW5trp2/imaB1kqDb2eJN79QRGfSzutp/zKzz9em/stAFPeeyWGJku245
         agtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=qiR3kqY1FtS7aluiuV2htyDwOrHtB3ABTNirVnY7LY0=;
        b=m8tfFQShxOJ3eToMl9YDvMT8H6BSOfQ3oaBMshveqwCavdXMIp/MekpVaAxCo3V+Hj
         lkLYrIrh2NbGjD/TmAl+9klh5tuiqU/9N3RO/GPi8L3whMj9ejwRWtbiGC00b8qd4kI4
         gEbBg7M628BFIZTZg3Czb0aLIUZDPpVN2DQbhz6hSshv+6vGqqPTMcQYDrTcoR8WjeIZ
         cyiMON1cdQ5Ifpcu6KoV6VqHdizTMzLlGLCZ1PQt2J49zCx6XfHDZHEnnu8HObLGqGvN
         8Ev8CHQHDg52+cnI4x8QsXudzfwGdIa8jxyHmT+DRffCmG0QlvoX5k9yuTx87VDH28S+
         8JnQ==
X-Gm-Message-State: ACgBeo08Ixl105aMb7f/zVwDhRE1diU53qgap3HNqnc7wO7m4lTqWu0i
	firBkNlPrkUu/DurBIMZ6cG583LL0uOoxbUAqHqNTQ==
X-Google-Smtp-Source: AA6agR4cSYDUjHjKqgs9zKaZ58NNESabUJfIrLT+OTCGH4HwSfACpDx/ctbx5ozgIrEgXjQk7zDpKuMhmKfrTiLRGm0=
X-Received: by 2002:a05:6902:124e:b0:668:222c:e8da with SMTP id
 t14-20020a056902124e00b00668222ce8damr7302689ybu.383.1661520843052; Fri, 26
 Aug 2022 06:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220823145649.3118479-6-robh@kernel.org>
In-Reply-To: <20220823145649.3118479-6-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Aug 2022 15:33:51 +0200
Message-ID: <CACRpkdZ3syQzLaZJ1aksB6o7Q_xOMGSC1RfT_9iVYgpXHi_mfw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Add missing (unevaluated|additional)Properties
 on child nodes
To: Rob Herring <robh@kernel.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, Andy Teng <andy.teng@mediatek.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tomasz Figa <tomasz.figa@gmail.com>, linux-gpio@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, linux-mediatek@lists.infradead.org, Sowjanya D <lakshmi.sowjanya.d@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 23, 2022 at 4:57 PM Rob Herring <robh@kernel.org> wrote:

> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied to the pinctrl tree for v6.1

Yours,
Linus Walleij
