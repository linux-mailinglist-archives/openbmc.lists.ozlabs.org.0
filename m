Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24550DD6D
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 10:11:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sy6G39grzDqQ3
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 18:11:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="BJ0b+NFs"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sy5M6kcRzDqF1
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 18:10:31 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id d13so10913077qth.5
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 01:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fMEKr0g2OHz/PqTk30553KiKFPazmK/2R7M0IWbsrQw=;
 b=BJ0b+NFslvKHFFNc/IVIuF1UnXMVF/WadLqlkxJxldavqfEhPu9iSuIH2QAmb3jVEd
 7hLVgIJ/xLGLgIVZwx0ZWanQIonap4uCSq5i0Lcy6KuLTEr2KD+JrYTcHfGJh8ZBH16s
 LYfsR4BKT9eaAKVLoM7Jr5sYQHBPCJGUuJ6oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fMEKr0g2OHz/PqTk30553KiKFPazmK/2R7M0IWbsrQw=;
 b=qpUUKNn6qWmuzVW87Jfyvs1eSrj0lO6ptOIoqDZjQ0r+PaLwi3wZ7T+I1JRige+Kyp
 yxf2tqIG6AFrzP3HDBLSOczMYBdTrFvPyoehXa2l17UURHn3ChZiuxVkcuAz/AwCOfGC
 CK/AtWe0Sp1OEjZ6lgp/n/mrnk3OqWZQ+y3lYp/WvucFA8R43Kx9xEnZPbvaplC2zyLA
 Qeu3SDW33t2co51mfK0m4+1FkXJMupEvU+D+7XbiFnqtoUWPcl63OcKQaQH519NEvZ4E
 1JUvqH7a7fRHeLrU5JwCtA5JCg+Bs2ZHI9gtj0QtxX78Vtu47CwN0kaIjq5kHq2mncWf
 TUfw==
X-Gm-Message-State: APjAAAUdY12/Ez246tkoKw7eLeCMbaTaCunzekyNUsqf9OohngrvCcNb
 WQIrYkGaaTwUkpMGghlNaSFJplnEbWkxvQen5mP267mn5FHUSJ6W
X-Google-Smtp-Source: APXvYqxPq1e/M1QZEQswJCnr/8YXghdcQhN5NeDfKGUoglTQZO9rkuOD74w6N/egtBbx47Su7sjCLL2wu/XaIaToGcE=
X-Received: by 2002:ac8:169b:: with SMTP id r27mr33601111qtj.235.1556525429110; 
 Mon, 29 Apr 2019 01:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <1556020592-27195-1-git-send-email-ray.lue@mic.com.tw>
In-Reply-To: <1556020592-27195-1-git-send-email-ray.lue@mic.com.tw>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Apr 2019 08:10:17 +0000
Message-ID: <CACPK8Xf0J4H3qNabZx5u9n0rA6AYGifN6S7Td=r1LmxMBW_Gpg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.0 1/1] ARM: dts: aspeed: Add s7106 BMC Machine
To: "ray.lue" <ray.lue@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "ray.lue" <ray.lue@mic.com.tw>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 23 Apr 2019 at 11:56, ray.lue <ray.lue@gmail.com> wrote:
>
>     s7106 is a Tyan platform family with an ASPEED AST2500 BMC.
>
> Signed-off-by: ray.lue <ray.lue@mic.com.tw>

The patch looks good.  Can you fix the signed off by to have your name
spelt out? I think you want to do this:

git config --global user.name "Ray Lue"
git commit --amend --reset-author -s


> @@ -1247,4 +1247,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-opp-witherspoon.dtb \
>         aspeed-bmc-opp-zaius.dtb \
>         aspeed-bmc-portwell-neptune.dtb \
> -       aspeed-bmc-quanta-q71l.dtb
> +       aspeed-bmc-quanta-q71l.dtb \
> +       aspeed-bmc-tyan-s7106.dtb

Please add your entry so it is sorted alphabetically.

> diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> new file mode 100755
> index 0000000..b9801d1
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> @@ -0,0 +1,174 @@

You need to have a licence and copyright line.Please take a look at
another file, like

$ head -n 5 arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts

// SPDX-License-Identifier: GPL-2.0
// Copyright (c) 2017 Intel Corporation
/dts-v1/;

#include "aspeed-g5.dtsi"

> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +
> +/ {
> +       model = "Tyan S7106 BMC";
> +       compatible = "tyan,s7106-bmc", "aspeed,ast2500";
