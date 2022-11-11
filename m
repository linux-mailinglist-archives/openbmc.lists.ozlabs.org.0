Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 542C962533C
	for <lists+openbmc@lfdr.de>; Fri, 11 Nov 2022 06:57:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7nzf19BNz3cMk
	for <lists+openbmc@lfdr.de>; Fri, 11 Nov 2022 16:57:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Kom70ZCA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Kom70ZCA;
	dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7nz30x67z3c6t
	for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2022 16:57:00 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id a14so5129955wru.5
        for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2022 21:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ioOrTK1jNUA4MKiJl/6d9zziB/7ZzevMu7lUj1Fo3js=;
        b=Kom70ZCAy7S/PdotYJFR2v6tpVJT3FCxYSr39NQj0FHw7fG0VfvgbT/Au0XS4qDXA2
         9lBC801zrYoBGKIxHNcDowXiQ5M8c5dh/3qgv3rvVyH3Qwps299XVtf7ZoRobgdVtS6L
         TBTly9L4IxJ98QRUPGVzKgQ6J3fcNRoX3VOd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioOrTK1jNUA4MKiJl/6d9zziB/7ZzevMu7lUj1Fo3js=;
        b=v57DjCMy1Jc4gv1vevBuyI9YAdFxjLV8xKlTdOkbS7SzIkuDwNNAp8PwOQRCBOKOg4
         uYJ/otYhyvgayxRWzbHCHAzj4URuOoyQL/30sn7Oy+E1r3pvxxreo5LwllfVJCR82Jik
         ncxUCsNawllfHOJXZK39P98lifUCrwpNdXH3n7JFU47Iv42TAfLiglRrfuOuEEU+bPbM
         Cu7uvH6QDEVIjiKZXfEMrQln9Dbc7Jr/Ce6FicFsfC+HDWf1AjcNM37Vr8pwOHQ99yru
         gbYKIvGK+R8Cx9SFXMwJ8K34Gx4qURLfYNrA/p2wyDn3qKtWu6BPBpGw0L7VndQB+ZwU
         blhA==
X-Gm-Message-State: ANoB5pkj9s/0dY2o+/KcNKm+B7Uv5RjeQnDVbTNrqyHugAbh33NRgcin
	41fjXU4eUHXMsk5WGETyLI8fp+Gb+NxsghdaqXnjrQMt
X-Google-Smtp-Source: AA0mqf6qtMoZgbXL7bUzgtGh3OCC3N0PcINDyPHbIEbsvE92a3qUiScCH8vnvPoAot6dtOVdn9iEYcvJ3y+RcbKZg4s=
X-Received: by 2002:a5d:58ee:0:b0:236:73ff:9cd0 with SMTP id
 f14-20020a5d58ee000000b0023673ff9cd0mr238414wrd.628.1668146209620; Thu, 10
 Nov 2022 21:56:49 -0800 (PST)
MIME-Version: 1.0
References: <20221111035747.31663-1-zev@bewilderbeest.net>
In-Reply-To: <20221111035747.31663-1-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Nov 2022 05:56:37 +0000
Message-ID: <CACPK8XfEcvMg1L3r7OnV9qZ93Lag5W_JCxngsPkfK8fXjPc5WA@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.0 0/7] Delta AHE-50DC OpenBMC kernel support
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 11 Nov 2022 at 03:58, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> Hi Joel,
>
> This series contains the patches necessary to provide support for the
> Delta AHE-50DC Open19 power shelf in the OpenBMC kernel.  Patch 1 is
> already in mainline and is included simply to avoid a small merge
> conflict; patches 2-4 are in Mark Brown's for-next regulator tree,
> patch 5 is a small bugfix that's already in mainline, and patches 6 &
> 7 are now in your bmc.git repo's for-next tree.

Nice one. All merged into dev-6.0.

>
>
> Thanks,
> Zev
>
> Guenter Roeck (1):
>   Revert "hwmon: (pmbus) Add regulator supply into macro"
>
> Matti Vaittinen (1):
>   regulator: Add devm helpers for get and enable
>
> Zev Weiss (5):
>   regulator: devres: Add devm_regulator_bulk_get_exclusive()
>   regulator: Add regulator-output binding
>   regulator: userspace-consumer: Handle regulator-output DT nodes
>   dt-bindings: arm: aspeed: document Delta AHE-50DC BMC
>   ARM: dts: aspeed: Add Delta AHE-50DC BMC
>
>  .../bindings/arm/aspeed/aspeed.yaml           |   1 +
>  .../bindings/regulator/regulator-output.yaml  |  39 ++
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts | 418 ++++++++++++++++++
>  drivers/hwmon/pmbus/pmbus.h                   |   1 -
>  drivers/regulator/core.c                      |  42 +-
>  drivers/regulator/devres.c                    | 230 +++++++++-
>  drivers/regulator/internal.h                  |   2 +
>  drivers/regulator/userspace-consumer.c        |  60 ++-
>  include/linux/regulator/consumer.h            |  29 ++
>  include/linux/regulator/userspace-consumer.h  |   1 +
>  11 files changed, 780 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regulator/regulator-output.yaml
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts
>
> --
> 2.38.1
>
