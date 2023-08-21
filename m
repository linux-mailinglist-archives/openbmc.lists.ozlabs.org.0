Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E335782724
	for <lists+openbmc@lfdr.de>; Mon, 21 Aug 2023 12:33:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TdgCCHiO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RTpjd2MBdz3bPM
	for <lists+openbmc@lfdr.de>; Mon, 21 Aug 2023 20:33:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TdgCCHiO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RTpj122Rlz2ykf
	for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2023 20:33:07 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d712d86eb96so2887277276.3
        for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2023 03:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692613980; x=1693218780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7QH95jHBqWIxVR7mqs55h58lm3p4pOggAhZ2D3QcTk=;
        b=TdgCCHiO/SMRYUmmZAwWaOlEn9JMUmZ7oWiflCO5R9riNIDEVrciC9kcnIqWLXtGTT
         fvvAUFCIw1idIS2wQuTK0f6XJk1S2XMAAZ3q3T9nqReYX4Xw7pHnF7xB6y3MryIw0jfc
         yUz0VXp0WPJcO+R8cQ9P0edkja2h/ZVjOTLcjOKyQwXfNuw8W5fmyuntWNggM9Gc1ch6
         R5zKgl9YHj9Jt83TTXYR8fBI2zSKjkD4iANk6erymz4GXAwGZaA4eAYAHCPEQmrDgawb
         XZ1Erafvly5jVIlGIne7jRDHo95CnI/D6l3LKqjpBm8rDpv/rUnhi3MDx3O/PurVh8w/
         hX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692613980; x=1693218780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7QH95jHBqWIxVR7mqs55h58lm3p4pOggAhZ2D3QcTk=;
        b=IEsF6gMi+d+47ZkPuOt41OLdD6/AiBH9m3VHJIuDKOaXTNy2J6WVldkWLhINfgVhe8
         UX9PcYMsQH5Txn8Yp33SQ+8pZY+XitGNqxx7p0R339NhpClIOEmyMg4jpYUnwdRxQq1z
         3CoauECogtbfh13ZbSQmWwfignZxO0Uh512vg9gEeksE/3uCpuwZqlAON+kxqBFhKiyQ
         RahwwnSve63NY36Es1BLeQbwQep+oPcqVCmLnBR07Q70gbO046RJWvPcNO50fSQtivis
         qR1Et7IN3qIsxI84nH4aUAkX8BvecKj/ZAW5/ZR9bn2tcG/0H/vOpJfh78O4djnzX1dx
         45kg==
X-Gm-Message-State: AOJu0YyVLHIFAwPUj3btRGqdPHEYr3BGk5h7Cazxk8B+5eybGFAsLTbH
	aZvSpURaUM4rgGtynxLEUDAArTUqCl6dfUbNUcxc0Q==
X-Google-Smtp-Source: AGHT+IGRl2mhuGTfCN/KF/Nitxl2U0XsRMCfNpgl5mhsl8YWXSW88C/b2vvv2xSAEAdreymTqTbpPxbQXvUgIewfCpI=
X-Received: by 2002:a25:bc8:0:b0:cec:81af:cf92 with SMTP id
 191-20020a250bc8000000b00cec81afcf92mr5694932ybl.36.1692613980506; Mon, 21
 Aug 2023 03:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230819010907.916061-1-robh@kernel.org>
In-Reply-To: <20230819010907.916061-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Aug 2023 12:32:49 +0200
Message-ID: <CACRpkdZQVry-p90AZSfrJHJuscN3CuJU-ySKU2+zCHbVt-Z1Kg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: aspeed: Allow only defined pin mux
 node properties
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Aug 19, 2023 at 3:09=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:

> The Aspeed pinctrl bindings are missing an additionalProperties/
> unevaluatedProperties schemas on the child pin mux nodes which means any
> undefined properties are allowed. In addition, using
> 'additionalProperties' for child nodes with any name works better than a
> pattern matching everything with an if/then schema to select nodes only.
>
> With 'additionalProperties' added, 'pins' and 'bias-disable'
> properties need to be added as they were not defined. A $ref to
> pinmux-node.yaml which defines the common property types was also
> missing.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied!

> Really 'pins' should have some constraints, but I don't know what the
> possible values are. Happy to add if someone can tell me what.

Aspeed folks: put this on your TODO!

Yours,
Linus Walleij
