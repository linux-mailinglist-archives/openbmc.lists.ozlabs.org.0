Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4082432A60
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 01:34:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYCrW1Jc4z302d
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 10:34:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VnS54ul6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=VnS54ul6; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYCr51Hhrz2yR8
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 10:33:56 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id c28so16765438qtv.11
 for <openbmc@lists.ozlabs.org>; Mon, 18 Oct 2021 16:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eDLWDeOyQsOLHxnaRI5HUCzKJk4GnO7kLraNXQtjCD4=;
 b=VnS54ul6bl7cjkogl8a7J+09GDHXqx0ebl+/mLHLdW87iAVLTle0Zf8vSJaYMVTqsx
 IaHZXDjHIaXpNkmMQnuAaD8TsABl+pjlZgSf6kH/xddZrIzzT41c7aJxz1CXKsOhLesL
 QSwAN4G3lV4lKx28xrRNudAcneTt6XM6cRuhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eDLWDeOyQsOLHxnaRI5HUCzKJk4GnO7kLraNXQtjCD4=;
 b=n/L3vrlV7D9jcz+lBCyKPp4VkY4EWIIaZcmxzJqwhfvvLHFxNPbdEdMe/zOCK8EjaD
 UQJgaXEkmqNU48IAUvITLGqoSSEUuA1SREnYtPWhQ3bbKkuGbVkCDK7cMoRpAzdkzytp
 szc8/UQQMnVdoywrx6sDBUY546thsqn9WdIz7IXfFGz7G7nL3AOa94i9pXRSxkvBbbcN
 X8h0WINk36c24yL8Q9UUXXuAU3noclhU+63V16pmOosDv97FB+i43CYQZSKd1BIhU6J4
 nOjc/D4EI9Rwoqb40HNBC9Ke1QP01WjYh5hf2s5u+jxe3ewwLHIweqsW2zIaFLAGRLw8
 pbsg==
X-Gm-Message-State: AOAM533SEfOQ7mYfWOftkOp/9QCuBeDiAb/fzWX3pGWvaMy4yJwRPmKu
 lYSTktqLTluwZt6123tGsXZKYZVFmYFDifD1Kno=
X-Google-Smtp-Source: ABdhPJy8TT0dmIvg6qzADgjmKqoqMw9TgR4r780OwQrkPjhgOQslTGOJ2FpEImSzv1RwTgPX+ihXoAccNG1ZYQvNwSM=
X-Received: by 2002:ac8:5f06:: with SMTP id x6mr31912808qta.295.1634600031277; 
 Mon, 18 Oct 2021 16:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211018231714.19054-1-zev@bewilderbeest.net>
In-Reply-To: <20211018231714.19054-1-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Oct 2021 23:33:38 +0000
Message-ID: <CACPK8XdExafwTjtuNTdKyvQFo-=tJoO8nccf0jjvKe429xyvog@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.14 0/8] hwmon: (pmbus/lm25066) Configurable
 sense resistor, other cleanups
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 18 Oct 2021 at 23:17, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> Hi Joel,
>
> This patch series is now on its way upstream via Guenter Roeck's
> hwmon-next tree; until the OpenBMC kernel gets rebased onto an
> upstream release that includes them it'd be great if they could be in
> the OpenBMC kernel too.
>
> https://lore.kernel.org/linux-hwmon/20210928092242.30036-1-zev@bewilderbeest.net/T/

Great work Zev. Happily applied to dev-5.14.

Cheers,

Joel

>
>
> Thanks,
> Zev
>
> Zev Weiss (8):
>   hwmon: (pmbus/lm25066) Add offset coefficients
>   hwmon: (pmbus/lm25066) Adjust lm25066 PSC_CURRENT_IN_L mantissa
>   hwmon: (pmbus/lm25066) Avoid forward declaration of lm25066_id
>   hwmon: (pmbus/lm25066) Let compiler determine outer dimension of
>     lm25066_coeff
>   hwmon: (pmbus/lm25066) Mark lm25066_coeff array const
>   hwmon: (pmbus/lm25066) Add OF device ID table
>   hwmon: (pmbus/lm25066) Support configurable sense resistor values
>   dt-bindings: hwmon/pmbus: Add ti,lm25066 power-management IC
>
>  .../bindings/hwmon/pmbus/ti,lm25066.yaml      | 54 ++++++++++++
>  Documentation/hwmon/lm25066.rst               |  2 +
>  drivers/hwmon/pmbus/lm25066.c                 | 88 +++++++++++++++----
>  3 files changed, 126 insertions(+), 18 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
>
> --
> 2.33.1
>
