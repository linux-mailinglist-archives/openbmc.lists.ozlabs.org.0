Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1F479C79A
	for <lists+openbmc@lfdr.de>; Tue, 12 Sep 2023 09:04:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kAYEoolP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlF2d0pXGz3dD5
	for <lists+openbmc@lfdr.de>; Tue, 12 Sep 2023 17:04:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kAYEoolP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlF210Rcyz3cnJ
	for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2023 17:04:23 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d7225259f52so4761816276.0
        for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2023 00:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694502258; x=1695107058; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B30cQR4KsHwNvaeoC8Z4dw3bG2+oBb1t/+4IAjCtWX0=;
        b=kAYEoolP/1Nv1B4tHWgSBwZdL5WOSR42TiLES9+NaLna1d4AIpGjAZM7C1nItcBq02
         zkNyp7wKhpxlyXC4fTd4M46HzfRCcKIyeWk33SRWLZeIV6DxnmHhxxWHYaOv7iGVR/ns
         17+vxwrINVfihqMyegpHCWe7fzs71AIdGC72mtEfJfEsRCwayMH33mDVh8kXY0szFYOI
         lKA8P6/2ZcAeX2eCrSbSr3+z+umtu5XfilbZgGhcbx6OIzBOzhkhvLU3hbK09oOew5hd
         C64V+ABOf+cTkZPysG0qrShrI7dSQlH44Bidm7XCZMA/8ghwSQa94QKBgQwa4jbMUs7t
         R5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694502258; x=1695107058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B30cQR4KsHwNvaeoC8Z4dw3bG2+oBb1t/+4IAjCtWX0=;
        b=mTlO3fLutp/0Jm+sZn215Qhy+IFhyepyLyYAjBFz55S3XiLWK9yPbh789FIcwZfI3k
         BUIOlwuNoqHpSAdUea8NaFZaKQRaAqGIsHp1Ag3ZNDKkI/xIEf4ZrKWFenYA0QwCYzWC
         7L8vhzRjbTuvT2eD42IQm4jdWuz0Su2Q0CLOOlmVdDEzBW7Tede24K+oqaAhK4NkbI5F
         xECAHR2B6QJwnTBlgVptA+G7ROQCkFHRtXcTsrMGZdUFSsopImtud9iZhv8nbc5epxkR
         H4ktoi7KEm7WXY+huvf/oE52lV+/RjeRtvZmER/TjC2y7WDOJJN+b5vcvhLnaSk0NVWR
         dDMw==
X-Gm-Message-State: AOJu0YyojVIrYP9u+VQeUz1IcnJDqF2CvlGSlFtir2ZAJ6IZZw59x85i
	aKUABSKO7L8BtIjc67Vmv+tIX1unbp1lEBXAHXEzcw==
X-Google-Smtp-Source: AGHT+IFLqvljpBXBZdopK8IJF7HPCb8UCSZpJ0LEj1zJHnH5CNf+EnxKPRD6io9/GpD2fEWeRkg9qgH7Kgxlf3yqiSM=
X-Received: by 2002:a25:7343:0:b0:d3f:208:b8ea with SMTP id
 o64-20020a257343000000b00d3f0208b8eamr10648403ybc.11.1694502258238; Tue, 12
 Sep 2023 00:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230825101532.6624-1-m.kobuk@ispras.ru>
In-Reply-To: <20230825101532.6624-1-m.kobuk@ispras.ru>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Sep 2023 09:04:07 +0200
Message-ID: <CACRpkdayD_47kvwDgS+7N01qsUT+DoNqz+jODb5g2uT74Byycw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: wpcm450: fix out of bounds write
To: Mikhail Kobuk <m.kobuk@ispras.ru>
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
Cc: lvc-project@linuxtesting.org, openbmc@lists.ozlabs.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 25, 2023 at 12:15=E2=80=AFPM Mikhail Kobuk <m.kobuk@ispras.ru> =
wrote:

> Write into 'pctrl->gpio_bank' happens before the check for GPIO index
> validity, so out of bounds write may happen.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: a1d1e0e3d80a ("pinctrl: nuvoton: Add driver for WPCM450")
> Signed-off-by: Mikhail Kobuk <m.kobuk@ispras.ru>
> Reviewed-by: Alexey Khoroshilov <khoroshilov@ispras.ru>

Patch applied for fixes.

Yours,
Linus Walleij
