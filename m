Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D121E843890
	for <lists+openbmc@lfdr.de>; Wed, 31 Jan 2024 09:11:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UB+BneGD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPvr659SGz30hQ
	for <lists+openbmc@lfdr.de>; Wed, 31 Jan 2024 19:11:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UB+BneGD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPvqY00tzz2yyT
	for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2024 19:10:46 +1100 (AEDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-dc2501ed348so505049276.0
        for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2024 00:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706688642; x=1707293442; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9OD1UiKot9xBEp4pQEuFNoRwTpzFrjRRiTMq/H5FH8=;
        b=UB+BneGDpDDVOSsG8kLoTy7PXvGuXt0Gru605rB6M1/GQLw539vu3hGCW05+9OyvW1
         kwIwa+o2Eqe+Ax7l8tpzOJbSTCl3qODsSrbvsVBHBifjbLraRbiI95QWgoHYEGGJdobL
         bmn+hA7tJPdSLwTAUh5KUGelUKFX56r/yoZkMOXyFauLomKxSjFlBPakVoMXpBI7fPm1
         Biagb7J0YLS9FJbqSrIg7jYaSuO6N2FwOvFS3Xu1SuwpMH7vZ4aSPXEj2H3gUZvNMRXZ
         q1O87tg8LXVbfIRXoTflVdSCS4wLMWbLb5fiY84OmwVbWk3L2fQ15YsKPgkjh9CWjqx6
         7pKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706688642; x=1707293442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9OD1UiKot9xBEp4pQEuFNoRwTpzFrjRRiTMq/H5FH8=;
        b=vAmZA1+SYEgxANhkgHgkjMMF7nPkMsJj1CXbKkTQUhU7ta6gTo5zz/ngEW7QQT+E9F
         I22QV6PHdz3iOjJukb4nSXIKOI4LRb6V/6ZrB15kWv5LlfaA4qD1KtUCljK9thFHK/P5
         6NHIiwWoW9kgngrTJr4e1wyf9QCGQ1goCHvoRHUtNFg8UkWI1cG4sKvFe+AbouVe2zhh
         xWu3kdoJN5gROdc9KKm3cQ3bLiC7vWDu/UteTiTZNNy1alaW56pK1S9uBLnAv20gJBe1
         e0epGgh49uVh/UIh23YhQ3042fpe4WSjYSQ+RLEioOR96UwZP0ksLPyKIWOZYm4N7MLj
         PFlg==
X-Gm-Message-State: AOJu0YwIgC+XnBi2O4sIWwNmLAEmyTs0i1NMBvthiU1g9RcPS+WXc7Il
	D6Zis7SCNgILqXmeirxLOY9dLz5yyRZbnZrLSZFwwkKC+MVjNgEQWKtYJSjTHR7EQCi2g6BBVjN
	luaFX1qrbwAOpJpDXg8WemZ455UpP1rfbpCP/dA==
X-Google-Smtp-Source: AGHT+IF7/97h8A2ABSW+ZKivSqrc+3VaVDxhilyJhD8FjHKMHd8T3fIFoykLSG2kAQuVNIsrK+oFINo0NP7MfrmxMWg=
X-Received: by 2002:a25:bb4d:0:b0:dc6:c252:75fe with SMTP id
 b13-20020a25bb4d000000b00dc6c25275femr281957ybk.10.1706688642247; Wed, 31 Jan
 2024 00:10:42 -0800 (PST)
MIME-Version: 1.0
References: <20240124190106.1540585-1-robh@kernel.org>
In-Reply-To: <20240124190106.1540585-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 09:10:31 +0100
Message-ID: <CACRpkdZq4dYwJNvo1CncaHGsDeU5qQhms2SN8WGsTRwBB-Bhmw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Unify "input-debounce" schema
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, Tomer Maimon <tmaimon77@gmail.com>, alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jan 24, 2024 at 8:01=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> nuvoton,npcm845-pinctrl defines the common "input-debounce" property as
> an array rather than an scalar. Update the common definition to expand
> it to an uint32-array, and update all the users of the property with
> array constraints.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patches applied, thanks for fixing this!

Yours,
Linus Walleij
