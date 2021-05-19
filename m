Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7E23883A4
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 02:13:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlCxp0wm6z3bnY
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 10:13:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vvBSqOjC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vvBSqOjC; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlCx917qpz2yyr
 for <openbmc@lists.ozlabs.org>; Wed, 19 May 2021 10:12:27 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id i9so16323877lfe.13
 for <openbmc@lists.ozlabs.org>; Tue, 18 May 2021 17:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QkFJB+otnmwltLGFDsGxwuEk5BhOyR7tWdo4yOWY1wc=;
 b=vvBSqOjC78aj5fWRQSsZoFhAPgjyKXreaLn2qc0ueH0m+gryUOA27w2Z+SpYbsW+AP
 wK9J8Qugui3AbS4s0k85oG0VOb5+yNdNc22hkAcg9x9RQIzaoaP8m7j8eAYTrEC/GG+p
 YZMWkAW4B95iGlH2UkU2TftwyCks9Lr6EexgrQWQQLOGdn1LqflzAxDqxSGWQfEItNau
 AgrUm9ex+QWTrpjXbk80zgpFBlCIMYxEsfEhwVXv4sS34SGhO21Y/L17k5N2VhlNdUSo
 UN43A4PQEiEPxbuA/RMexrA9PtL+9lEKgrI5RUcBJoTuA86MdeqX5CtAGoErWgTaBXso
 9mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QkFJB+otnmwltLGFDsGxwuEk5BhOyR7tWdo4yOWY1wc=;
 b=X7OyPB7M8zln8OqkH9SmkII36yB6oRp631FW5k4m+vP4LMnb9+kTQRHPcejTToa0x0
 ZfItZt9olDZ9SOVUxJeWZ0k+9OZJpP6Ia5dU9w50bvQ/I9nsXabWpbsCPW8CvgcFx+Bz
 PT0XYsZm8JcEWrP36a8cJDCA9B0MX5cWdVtyOHFlbDivDzWOTKRhd3j64ymY71OAYIYp
 TIX5ixmfpPsEVyMksfj3buYOOakJKx1exd9D+8bMIf024ZIGDKJEYXTIwMJQIS+3llOH
 9up8DtytX/ML/JXgZ0MN+CqLtg+VpSGTNnzI85R10aWc2jzjcFs03114U1HLSfmH9mjE
 xXCQ==
X-Gm-Message-State: AOAM531DERwRgxwWcBV/4C+767RrVecyreYEIFgX8H/PZ1recM6SAswj
 5JUh6+uBq4VV3pZGm80PRMFlp3Lb8CHguAU92OS4kg==
X-Google-Smtp-Source: ABdhPJy4FzN7hFkVlARsIv205HJnTPbWVjj0FRfYHskNGYlGD2BX2/SZGDwbbYLTxXAevIsKhZJd4qstb4GB0eWfjr8=
X-Received: by 2002:ac2:5145:: with SMTP id q5mr3450917lfd.529.1621383141079; 
 Tue, 18 May 2021 17:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <1619353584-8196-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1619353584-8196-1-git-send-email-jrdr.linux@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 May 2021 02:12:10 +0200
Message-ID: <CACRpkdb+3MjbtFvo3t-hX9uDDTdnPQx-KfZAqQUrvQQQ42mqKg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Fix minor documentation error
To: Souptick Joarder <jrdr.linux@gmail.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Apr 25, 2021 at 2:26 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:

> Kernel test robot throws below warning ->

Patch applied for fixes!

Yours,
Linus Walleij
