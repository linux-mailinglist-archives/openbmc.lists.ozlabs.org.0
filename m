Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF0C5A28CA
	for <lists+openbmc@lfdr.de>; Fri, 26 Aug 2022 15:47:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDh3V5jk0z3bd4
	for <lists+openbmc@lfdr.de>; Fri, 26 Aug 2022 23:47:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O9w7ecSB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O9w7ecSB;
	dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDh352stvz2xG8
	for <openbmc@lists.ozlabs.org>; Fri, 26 Aug 2022 23:47:10 +1000 (AEST)
Received: by mail-ed1-x52e.google.com with SMTP id x93so2024019ede.6
        for <openbmc@lists.ozlabs.org>; Fri, 26 Aug 2022 06:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=tdyqm7lW/9+BRKW1noV2HeTiiovjnxyU7lQpW/yER3A=;
        b=O9w7ecSB+WNfVwITP4QWmvW6OO25vFRs1Sdo2EdTAls2m3jrPtBALKsm1IOhTVKxoA
         cXJlYperIsC5N8IyAuHQSQzyPFLBTktnttvC8CE2fVhx7MlWn7VkKNkRTej4H0OJw9CM
         u5wvIKojceg8sTi6soDnTD7Mj2W11Wj5s+kObbrzqfzBYsisqYVFrii8VV7HToejDDXP
         tnHJCciBrqk8aOhappwRGWZ/YBgSOigHd/ge969BkVJr2fo0rA6g2iDYPFI0k7V/xuZM
         c72JEdZ3Br8wj3p6s51gEoILwgjx/ZR7EAVCS2jCr2k23c8qxKaPs068T4o8Uv0BR2tZ
         vxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=tdyqm7lW/9+BRKW1noV2HeTiiovjnxyU7lQpW/yER3A=;
        b=m6jjze1O0Qrr251I/aU6tbmhlmoIZC7sDxjujdN7mUyo+jWfuGzf68PbIZjlBzAckY
         gTHDLVqGIW5JOfrj9QuBcgZM6l85m+x80oT7tNjzG4vymieJrSH595Mpv0n9wnpsTs3K
         NhdoPTb0LLMjQGi6DFWPj/m+dKwSA1O9eSyXuDIkBR3EsOvTEnnLag1Eq0vqNFOqeIG2
         7U3ruDxPd9STWRYu5ih7YfS1wn+imp2sUweGPY4JNgudgvwMHq58DUQRkoDHmdq4GuFa
         4oSTSufWeIExya2vFI8nCzjYHU0zX3BeGuUcqFEj1RHZSr+DItMzX/z3+Kb2GUTokI1B
         B8EA==
X-Gm-Message-State: ACgBeo0jWicA33YOfXi3awuNYTNZ/45O3b/4bQEgN+VJ1/LO4CgMWQzo
	8Hn5A30dU+j6NlW5mTEEMyPvSuS13uvhzphEQfl4/Q==
X-Google-Smtp-Source: AA6agR67VcVIwydkOJbRJ+QEjF4GAyGy9EWxWvhhZOU/F/3QiJ1q7RjJsgnEJCNT7kkdxyg3X2i9roJGA4m0wxjQ1sg=
X-Received: by 2002:a05:6402:1f8c:b0:43e:8fab:76c with SMTP id
 c12-20020a0564021f8c00b0043e8fab076cmr6821062edc.126.1661521622829; Fri, 26
 Aug 2022 06:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220825124134.30242-1-yuanjilin@cdjrlc.com>
In-Reply-To: <20220825124134.30242-1-yuanjilin@cdjrlc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Aug 2022 15:46:51 +0200
Message-ID: <CACRpkday3c1BUDgheHVovBJ=v9Z-Gbq92Ex4J3VmKDr4sYdL9w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl/nuvoton: Use 'unsigned int' instead of just 'unsigned'.
To: Jilin Yuan <yuanjilin@cdjrlc.com>
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
Cc: benjaminfair@google.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 25, 2022 at 2:41 PM Jilin Yuan <yuanjilin@cdjrlc.com> wrote:

> 'unsigned int' should be clearer than 'unsigned'.
>
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>

Patch applied.

Yours,
Linus Walleij
