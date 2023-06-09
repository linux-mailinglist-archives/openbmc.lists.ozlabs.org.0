Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F15AC729171
	for <lists+openbmc@lfdr.de>; Fri,  9 Jun 2023 09:44:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QctPn5K46z3f6Z
	for <lists+openbmc@lfdr.de>; Fri,  9 Jun 2023 17:44:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xigE4Ds2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xigE4Ds2;
	dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QctP94ddCz3dqt
	for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2023 17:43:38 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-ba8cd61ee2dso3752978276.1
        for <openbmc@lists.ozlabs.org>; Fri, 09 Jun 2023 00:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686296616; x=1688888616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n22j43EkOQDg32COrHKfr3M00AZ/0ZWY6HKFgde4cL8=;
        b=xigE4Ds2RloULZ1O7n6QdIj7g5n2MHKcla3NMyQcPNgn5oDy4jmszVsyLksPsHVQ2A
         pdTgGqULLsN/GWX785OV8mjaD9L5iIIbCf1o2AOgNYz/kpjdiquJcXhSBq/KlSlfCHMD
         FVE+ue6kL2EzWZnfjSkN1Zh0QzWQQuBmr30bqi9Sv+tSN7kzZl8ekeDQkNacQYhA6IKO
         0rHZuBXwAke6tqomTNYQsdThwDv1LBeb1x7hDit7QKtvi6nwfoc3BAYGUrVXwg9QNVwU
         6vYIEMjYU17LaHu0SAsyVKCP85LRm6VlMrbsXuCaVYuwSDzadNNSdruuUbIcUxM0FPoc
         rlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686296616; x=1688888616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n22j43EkOQDg32COrHKfr3M00AZ/0ZWY6HKFgde4cL8=;
        b=JD9KLqH2dRRWfYukUiSF2256GbfBzCosTrUwkdRGtRiG+2pFfkBNyCDuOCgcAZL2NT
         /Iw/KH822VIwHWnK/bCK++w4b5yCoRDEyi+2fyTbDDifgKtNT48SkWkf/RawBAAzdxf/
         KJ1/6hN5t7ILUHFAs210vYlMbetDvVHo3+6u3vqwJL6Qbgr06rsnl/LSsofwdabgNhPF
         Uwi92eFbVo90r9a4OkRBUmeZjVainU9j+HEQTeqVEX5X+ivYgDvsywrF65yvqkHWLkAr
         FEWGqA7JcvPo6droOQ6o5BHq0em/lP1uZSclA9zdlyOVRbT42lLw2KUu3xdALdZX3KfW
         uYdg==
X-Gm-Message-State: AC+VfDwW+qat6c01lcMf837Kffa2ZVa63oTcNg3cxJMZHPBTd/WrAu1l
	gIcUWS3tJ3nITtGZa+oDcg3pghQkgNXvGl/nypvjqw==
X-Google-Smtp-Source: ACHHUZ4eBEjlmR18fNbl1nW/1npGfZv+hNlwu8HcpRXvf1ldNl8UG0FvJt/6U1xP960RjSZ6O50bzJ9dAxYnYf2TcFA=
X-Received: by 2002:a25:11c6:0:b0:bac:ada7:140e with SMTP id
 189-20020a2511c6000000b00bacada7140emr1128433ybr.9.1686296616503; Fri, 09 Jun
 2023 00:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230607095829.1345-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20230607095829.1345-1-jiasheng@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 Jun 2023 09:43:25 +0200
Message-ID: <CACRpkdYtQVcR_uw=wqeVtF+emDjS6rbFqB0RWPvNm8V7gB74Pw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: npcm7xx: Add missing check for ioremap
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
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
Cc: benjaminfair@google.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 7, 2023 at 11:58=E2=80=AFAM Jiasheng Jiang <jiasheng@iscas.ac.c=
n> wrote:

> Add check for ioremap() and return the error if it fails in order to
> guarantee the success of ioremap().
>
> Fixes: 3b588e43ee5c ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driv=
er")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Patch applied as nonurgent fix.

Yours,
Linus Walleij
