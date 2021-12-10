Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBE646F8AE
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 02:43:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9DFX46CLz3bY0
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 12:43:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oTUB7o5t;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::c2d;
 helo=mail-oo1-xc2d.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oTUB7o5t; dkim-atps=neutral
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9DF82ncdz3053
 for <openbmc@lists.ozlabs.org>; Fri, 10 Dec 2021 12:43:08 +1100 (AEDT)
Received: by mail-oo1-xc2d.google.com with SMTP id
 d1-20020a4a3c01000000b002c2612c8e1eso2100609ooa.6
 for <openbmc@lists.ozlabs.org>; Thu, 09 Dec 2021 17:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vNt01PgNPd3YSDPf1qGCkNvtxUggbk+ibJ1UrH7sY3g=;
 b=oTUB7o5tEgUiCdAFBlzj2EI+58ktxVJmCb0G36bbXEX19M223b7F9czGwGQuIkEXrO
 /TuutKs1GOi25EWlbWKDBRrKgFvBeqz7X/KTB7MYr/tNcuBSxkBBPAWzOUm9Pk2CKL/o
 XIaO9HKkCfY2rfC/k3re6N/gabMUvctpopS2uTLIAChAnV55LjGd7ApAVaw7vv2AR2RC
 7RbyV+0cL1l5052RKY2LnNcge64lHUh0q7jeySprTvSt71Wp/hPBm5w6SlEzR2w2DRFh
 q+9Y+pLE9mPSyL5yyxbdwmNhahPrLKgehKvNDnqFHhPc3xoofrgYhEaIrnAiG/B25AMg
 wEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vNt01PgNPd3YSDPf1qGCkNvtxUggbk+ibJ1UrH7sY3g=;
 b=PwwA1G5oANa51mGR8np4UsZTR7T8Qgf2IJ/eVrdlAjGKJUyJBawgqJqNKvwPzIqY8O
 zPgDgKkqg9/rWszJykSd1kRvzwrbAk0Tg5AGgc5H1TH9oN0lceF+L/1c03jsIF1O3qKC
 ZE29HKXhgU4nrbcRGisfJUW/g6rRDwxOfmal20F2Sx2zNsG1OU6JwdB/YVHC8umzzmQ5
 04PqvonLy579yPkAyLHpRdChynaRPB3+3X79owU4y5yMbYWXEBwsWc8i6NCMeipZ9MeO
 jnoAbVRE56XZx8dshjv8FnOlM7NutZGa8YUoX3HTmi62FSDSoQso7ogKePvmjgKTGj5/
 6wYw==
X-Gm-Message-State: AOAM53141Ag4pgedjgFbg1Qq7hU8fRzOF07o8d8vch88yr6E7BeXzVh0
 W61TW1i2609fobMVSdPZpt+q1bHav9K9QbGkzTr9nw==
X-Google-Smtp-Source: ABdhPJy7sYPUI5H7vA+hj84AaMMHAMzrvQz8iXXHhrZzqnNVH23YiTM2mUfm1+Oa9j7y73v/T2CtSIwffTt6nWKZuDs=
X-Received: by 2002:a4a:8515:: with SMTP id k21mr6564505ooh.71.1639100584964; 
 Thu, 09 Dec 2021 17:43:04 -0800 (PST)
MIME-Version: 1.0
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
 <20211207210823.1975632-7-j.neuschaefer@gmx.net>
In-Reply-To: <20211207210823.1975632-7-j.neuschaefer@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 10 Dec 2021 02:42:53 +0100
Message-ID: <CACRpkdb_i4H5+hWTrQQ4KkOaATDHb-Xi-dQ5+SM0jpe+zYJsqw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] ARM: dts: wpcm450: Add pinctrl and GPIO nodes
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Dec 7, 2021 at 10:08 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> This patch adds the pin controller and GPIO banks to the devicetree for t=
he
> WPCM450 SoC.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

This looks good.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
