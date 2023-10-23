Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 387BB7D2C99
	for <lists+openbmc@lfdr.de>; Mon, 23 Oct 2023 10:25:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HX+m7qUx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDStL0rkZz3c5Y
	for <lists+openbmc@lfdr.de>; Mon, 23 Oct 2023 19:25:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HX+m7qUx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDSsh6PNGz2xl6
	for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2023 19:24:38 +1100 (AEDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a7c011e113so33012847b3.1
        for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2023 01:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698049474; x=1698654274; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mayolstgy4T5uOdJ66ctew/h2/Q1wpOy6kH/NWQ5T8A=;
        b=HX+m7qUx4DUSBX2KU9IQrmx5VuGEBHcY4xC77huM/yz6VbV9hX4EweJLkmJ5Ui41lB
         vniHlXZ1AtLZFapScy7Me2+z5nvwxRn4UuzX6ZfxSY7Eo6aRsQ6wR8qF+OOJc6eLuoW6
         4vxigcVDS9UAKJFwLYf9a1w2QTyJr8xbjVueV/+nzqUGkfzcFkh5etqwCmOuE/jEMSFB
         XrsvtNpgtpi+VpzAiNSWGFh0FFaRBSy8DvW9tA2shB8d5lVplK3AZjysOjmCLgWFg6hH
         cCGICBF5G079T9mJdZ5LXhg2hUgB3zFOtFkURgOD23gcrV+16VZ6vGV3zhtXc58Qk9pp
         B17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698049474; x=1698654274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mayolstgy4T5uOdJ66ctew/h2/Q1wpOy6kH/NWQ5T8A=;
        b=wG03SyMt5LbyvfLVl9Fn0KjfUUJCls1IwM++A8bPksYkw8cls7d72yxq756uUUXpgo
         8l8TdP/2EPbogD6jsj4EzXBVm1ah6mm1QJGlhN+VoPzTKE3HG6EkwrcjvXmmRPLwp3qy
         YTpqUc9MJB5AutjarCe+P1YIvwhT4WF/DFv4AdIcwVr6CvB6Zf4kPehS8YG3zBoj5Bdz
         FvoEwWplI/WcNAzhgi03+xJ1VFTFpQSIT1SMTNPYg4VDv2VK8nibZemf+OGs2Ci9sF67
         AUq1IFLyna9EiK3c5Rz0LZibw0IQoMSd2YenWHEvR0HHaO6xlWlbTy7NJ4TuHSTzMkTR
         FJvA==
X-Gm-Message-State: AOJu0YwCkx210CClH7oI53ARG6D4uya6UmZ54rKNvcg3y9BFSTBAlczW
	TDDaeuM38ysXeTVqNEMvv3Qr1ooAsBET11n+TPUXqQ==
X-Google-Smtp-Source: AGHT+IHqaGryVNLtYcH/o4PcnTUfDi9IyxJlXkQzE5rV+FVSfix8sfv1gYTlNzE8KxkuavuaZgj325AG9uukF15LuM0=
X-Received: by 2002:a5b:b86:0:b0:d9a:b957:116d with SMTP id
 l6-20020a5b0b86000000b00d9ab957116dmr7951190ybq.27.1698049474104; Mon, 23 Oct
 2023 01:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231020170017.3610978-1-robh@kernel.org>
In-Reply-To: <20231020170017.3610978-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 Oct 2023 10:24:23 +0200
Message-ID: <CACRpkdb6EpRPz-UPwJcS2aH3vtN=8a0gbfm1mXfpZvRWQ5BE-g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: nuvoton,npcm845: Add missing
 additionalProperties on gpio child nodes
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Benjamin Fair <benjaminfair@google.com>, linux-gpio@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 20, 2023 at 7:00=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node. Add the missing addtionalProperties to the 'gpio'
> child nodes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij
