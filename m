Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9274E5C69
	for <lists+openbmc@lfdr.de>; Thu, 24 Mar 2022 01:40:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KP5wX2N9vz307g
	for <lists+openbmc@lfdr.de>; Thu, 24 Mar 2022 11:40:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lFcisYYI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1136;
 helo=mail-yw1-x1136.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lFcisYYI; dkim-atps=neutral
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KP5w76L6Hz2yNB
 for <openbmc@lists.ozlabs.org>; Thu, 24 Mar 2022 11:39:49 +1100 (AEDT)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2e592e700acso35913597b3.5
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2022 17:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8rN13FMeqEprGT5GtmNj2tl/IA4XlrCPy/4n11uT4fQ=;
 b=lFcisYYInl3HhTN9FFSdwKvRMetfhMw7fQeFnSW86dZe5L+XqQ8MjGPrpAEzEQXAt5
 LqcnW/7aRPO9dsI6WqRmEMkClwvp14cGL86TdEutHb3KsvDkXQKXUfGGg7ilRtflQNot
 B9t9JuVMDSN9Yp43S1qt7s0f/KCgHaYlpqDq33vcvwDEgKRSVwskw94RPWF1v513MvNS
 cqJ1fmjC5zqHjWYggPS2OFCXXvXU1ZFq8hQaaFVc4Xy8rUEUf1T20Yv4i0Thg5beToNh
 tSE+Z7oHq0TQBBvu+SyIfWvdRc8wjdmorRSrF5DpZfzWilfYZV6b58FF4MHzQwxoulaj
 A0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8rN13FMeqEprGT5GtmNj2tl/IA4XlrCPy/4n11uT4fQ=;
 b=RxoQSGq7R/UuHIEty/q/aRODiHntWWroBJGd8/xu/YOk9N+/0MBO0G6oM0TQVGKXGX
 0xoaoX+c5BiMin2Bvl7WRN9BG/yDLBSLofAO+UjqXoYG2diGl8+Yu7t94G4+yxolT+P8
 FyNUkRR+TBUxaG6Ke+WefAUz4XVHN1u69J0CpJ+4WUCD2L8yVE9v1yUVRN6pLxWFARrm
 S74G2g3g/fbLnEEIr2M8quoMhoLAEFWIJY8bvlPQxKgYVkuZQoakGkIJ8FpFClEanrsw
 cR8n1zm1b9rPhFhyUfq3wBW0c0Dauw9V8SOmea9uZovcTrlo/pcpA2XsPt6K7y+zXgF5
 1dfQ==
X-Gm-Message-State: AOAM532ytnYAGjvSplygslOcRawq5n22sl2rFrOJk9gjLAXS0NR8Cr/T
 3agmJRoUMu8Jd1iYXjp4GzFc+TDb5RpBWV32pcPm9w==
X-Google-Smtp-Source: ABdhPJwT1ooHzR6MDCbcAp1jYjLkMSCzH+kNHbpUiB/d+Fr61zHv94kOyIzetchA0tV5BKYcAwVjw2Jh3I98bLj2M44=
X-Received: by 2002:a81:d542:0:b0:2e5:c060:a0ac with SMTP id
 l2-20020a81d542000000b002e5c060a0acmr2644500ywj.118.1648082386034; Wed, 23
 Mar 2022 17:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220317065851.495394-1-zhangjialin11@huawei.com>
In-Reply-To: <20220317065851.495394-1-zhangjialin11@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Mar 2022 01:39:34 +0100
Message-ID: <CACRpkdac+fBez9rX6Ewqng9mbywKBcMN3VACdMO7mhh=dXUnow@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: nuvoton: Fix return value check in
 wpcm450_gpio_register()
To: Jialin Zhang <zhangjialin11@huawei.com>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, j.neuschaefer@gmx.net,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 17, 2022 at 7:49 AM Jialin Zhang <zhangjialin11@huawei.com> wrote:

> In case of error, the function devm_platform_ioremap_resource()
> returns ERR_PTR() and never returns NULL. The NULL test in the
> return value check should be replaced with IS_ERR().
>
> Fixes: a1d1e0e3d80a ("pinctrl: nuvoton: Add driver for WPCM450")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jialin Zhang <zhangjialin11@huawei.com>

Patch applied!

Yours,
Linus Walleij
