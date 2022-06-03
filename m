Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D459253C837
	for <lists+openbmc@lfdr.de>; Fri,  3 Jun 2022 12:14:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDzHs5Rwhz3bqv
	for <lists+openbmc@lfdr.de>; Fri,  3 Jun 2022 20:14:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cWnKkwPu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cWnKkwPu;
	dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDzHM5RqQz3bkc
	for <openbmc@lists.ozlabs.org>; Fri,  3 Jun 2022 20:13:33 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id p13so12929513ybm.1
        for <openbmc@lists.ozlabs.org>; Fri, 03 Jun 2022 03:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=94ZegRhkYg/saXV+SmkOjrIFO68BuJxSlLGLu4NRWgI=;
        b=cWnKkwPusG0TKPrwdSeL9GfiK9qV2jq8XHQI841ZQi14sBambMQZLS563NvaLZElf2
         75115UwtrmhkAHVhZHmiunsBxqODjE2sgZG5RZUUttFd/XjwT9ELF81y1MF+VjPTBsXy
         Ecc+OxP4Ug9Nkq1KWYx7PsS/8LdlHSvr8pmzuBVF4JJSNw/zCKM/57awLBnHtRJH+URJ
         ivbdaF8SKbVQFRj++AP6rq74w+ppYkrOD3IrIlaZnu3m6qTtGWAs0bfx8BngaVgPvKTf
         vdUOkox69Qac8HsvfBibu1f9UhbH8lmh5VamMeFlCaOhbP7O16w6ZyMfyL8EpGm81ssR
         AiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=94ZegRhkYg/saXV+SmkOjrIFO68BuJxSlLGLu4NRWgI=;
        b=KsuEP4oUqN3AbJ9GxrsdZsp6bOgo8u4QW4pj1q7xcL55bNCsgrT5x4MtIUMDg/UFKw
         yReWkJn/reBF9UWdU73yMeej+xkmPOg9rkmOSBmFbUBuZ40155wUKwuO5OV9RfkcQSLB
         JZ08gC+QismfJ9CE0ZNOlKOyjhF6oFEw9MTh1VWXqf0h5BujmGXsZGLO3zxt4DNrPTuy
         qQACdxUTklm30POhEWbwxE/78D9TtLO6SdmMnU2St9amIIQciJ7fWvg3SJIw/LxbwX7a
         R/ab+Mo1q6zb7E/1RtVK0OdBQb+D4RmYEj01CkFpjWPgGaI1kBzyqwIujAsxV8LLsY/y
         SHoQ==
X-Gm-Message-State: AOAM533mfuG7UWQ6i7KMK7lc4EVO9AgOAqlxEgbJCsTLnZ0KkWXwHfq4
	vbLEG0GfTLArxebJIdrjb2uVZnowGzDYKjH+9MYMUQ==
X-Google-Smtp-Source: ABdhPJw/KRcAuBS5Qsp7lOCZIpBhbUKTpsBgops20ECaxi3YO08dKdMkgM9KLeB4ACdlmuIwzLo5Lgpc34BZ5v0Gd3Y=
X-Received: by 2002:a5b:302:0:b0:64b:a20a:fcd9 with SMTP id
 j2-20020a5b0302000000b0064ba20afcd9mr10098240ybp.492.1654251210044; Fri, 03
 Jun 2022 03:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <1650508019-22554-1-git-send-email-baihaowen@meizu.com>
In-Reply-To: <1650508019-22554-1-git-send-email-baihaowen@meizu.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 Jun 2022 12:13:18 +0200
Message-ID: <CACRpkdZPZ5fNxt3=LCT4YRcnH5wNw+i50dde_eQGynzK0FCXFw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Fix potential NULL dereference in aspeed_pinmux_set_mux()
To: Haowen Bai <baihaowen@meizu.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 21, 2022 at 4:28 AM Haowen Bai <baihaowen@meizu.com> wrote:

> pdesc could be null but still dereference pdesc->name and it will lead to
> a null pointer access. So we move a null check before dereference.
>
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>

Patch applied, sorry for missing it!

Yours,
Linus Walleij
