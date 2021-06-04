Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A80FD39B47C
	for <lists+openbmc@lfdr.de>; Fri,  4 Jun 2021 10:00:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxFZD0pgPz303j
	for <lists+openbmc@lfdr.de>; Fri,  4 Jun 2021 18:00:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZROsLJZo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZROsLJZo; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxFYv4kjCz2xxq
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jun 2021 18:00:34 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id r198so9395850lff.11
 for <openbmc@lists.ozlabs.org>; Fri, 04 Jun 2021 01:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8RCi1M3O4ld6apAZMvKosIl9PGcIJils8EaE1SIdw+M=;
 b=ZROsLJZojaK+8cIJXW+yJiIedhocgLH0CPfglNdBVbMbH3NEK283DWRExuqn1nCbjR
 CLOnPVlgm2C1fWhDm3w55zM0lsOosjqBKFw6502UR0YOsdsmn2sLKngvmMbziaCbLBW9
 jQlrHnadopQHaDyJ+XPGvtIWfAMFp2kKlG8hFiPAm397uWQtmrnAFWhqq6I8FyvVEigk
 Tcf7iWSV0QjB/XfTnELHEG09gVmhDqp6uMeNdzvg1eVZVOPDRgSu+eYVUiu1cDG1/AVH
 +X2QWyXNseUvQBo/rwAQHqyXbhNswQrh4H9rU8BzYr/GSdlT/ip3Bv8TIGmJrEhY3ZEu
 Q/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8RCi1M3O4ld6apAZMvKosIl9PGcIJils8EaE1SIdw+M=;
 b=a3VsF1tRVVIreBbmVc+ZIxFVuVK31fdfMCa4LOvzFh0xHawaPDu2CYuOnycJT89UQe
 kIbtltsuMCF9I0JyT8P+rQlzyx70OO+7A0Gr3elBqfoUirAZhhS5fDAY7+bAbIRY670B
 h+Y0xFgAPi8/eRvYMFPT4GpncYd2Xfi6h4Pre0qC6KuCcUUbZwgMqaab61Ujd9bhTt8r
 samSxW/mLcg8zFC4L15oWbsCQzXxguIqFpWRwHcSrzKYRiMPBHKUfDthTme7aoau9LXu
 t71asYOZTmPFBN9p1dlyT+GTDF/5HXm7zLkee8MRAUKPz3dX8UMdWE6a1ZQDisSrdNI0
 P7FA==
X-Gm-Message-State: AOAM5306dZFThWolkzK8Kmmy5CT7m5iF1A5o4C7s+7h4ieIWRHjnnM31
 0BNYBRR90W1yteANOVYnEZAGuT7Vx17AUOws0omWuA==
X-Google-Smtp-Source: ABdhPJyLrDDoW78D5UpyZglYbPa7oduwWRh5tpBbor/T+yc/T2P/d9w4kpTi6SaEt+Xp/wQXSqGZWPjyAG4vD/DR0YQ=
X-Received: by 2002:a05:6512:3241:: with SMTP id
 c1mr2038487lfr.29.1622793629670; 
 Fri, 04 Jun 2021 01:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
 <20210602120329.2444672-2-j.neuschaefer@gmx.net>
In-Reply-To: <20210602120329.2444672-2-j.neuschaefer@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jun 2021 10:00:18 +0200
Message-ID: <CACRpkdaC8jzzE=9TSs-eRy3j3fk3=k_xhgjPXw7DW=rK=Csx0g@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: arm/npcm: Add binding for global control
 registers (GCR)
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 2, 2021 at 2:04 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> A nuvoton,*-gcr node is present in nuvoton-common-npcm7xx.dtsi and will
> be added to nuvoton-wpcm450.dtsi. It is necessary for the NPCM7xx and
> WPCM450 pinctrl drivers, and may later be used to retrieve SoC model and
> version information.
>
> This patch adds a binding to describe this node.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

(...)

> +    gcr: gcr@800000 {
> +      compatible =3D "nuvoton,npcm750-gcr", "syscon", "simple-mfd";
> +      reg =3D <0x800000 0x1000>;
> +    };

gcr looks a bit idiomatic, isn't

syscon:  syscon@... better?

Nitpicky though and looks good to me either way:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
