Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 656717AC34
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 17:24:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ygMP4sNhzDqWf
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 01:24:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.196; helo=mail-qt1-f196.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ygLn1WqzzDqWF
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 01:23:43 +1000 (AEST)
Received: by mail-qt1-f196.google.com with SMTP id z4so63484808qtc.3
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 08:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QfRDMATF/mD0ld+JXOHOTIFlNh/Cdg0uTO/akzNNHqM=;
 b=EhElErNskMVyRLFfUP8lOlj4VnAHtT48RnNFGvtfulFJYzLQapzxI9ZQwqoxpMlZuf
 hafpm/p+baNepWeU+vNFCtpo+zGo5vtvup5OmJhDsvjMmq4VjLa/1tfkvFJU3GHns6MW
 dEdzGBbwVtfqmA5ZbMtHk08O8K5lFGXe531wu9dMQUTO9pE28xPN2AyjPGjkeQf6/qru
 L/HX773nsOXiatNHirOtAFmIftN2CVDNOzhyNVe15ijOLZFXC9ZFjdWhTclCtlWnAOd4
 +2YatoXkIRxJuodiH2ETAUnDaApnZsLrpZni98MM6xNCTVKVcsxnHOEU8bacUqGxmYeN
 lRnw==
X-Gm-Message-State: APjAAAXqU1faAptUj1mranXNbgUWWKFdzVrVFXPy3V++l0aXw2jJ2LJT
 FxKvJMGwREJWV1Yri+hM9eMpzkFKf4Jk5L3umrc=
X-Google-Smtp-Source: APXvYqwDK/J3NCjNWITj7Ip0SyX5Ri5CKH+r2xLJkFHtEoRIvmzE++N6L56dMPBT75xhK9Us76wxfBPEk3mS6pYxIdo=
X-Received: by 2002:aed:33a4:: with SMTP id v33mr79997791qtd.18.1564500220464; 
 Tue, 30 Jul 2019 08:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3jjDh6aEVf0bBFYc=8GtB38kL6sWVZGJiUe427A7m2ng@mail.gmail.com>
 <CAK8P3a1ss9-G_mr48-UMOenrA0XDGWUFik4TC=m0WFfimoFdnQ@mail.gmail.com>
 <CAK8P3a3VsArSUgMwoPVxm8JcTPAQDoztg22MGqX4Vj5cjtADZg@mail.gmail.com>
 <CAKKbWA6aUBec8tTQNCJow8c6=SyS-y4HUC=3sMJp6_Oz51iF=A@mail.gmail.com>
In-Reply-To: <CAKKbWA6aUBec8tTQNCJow8c6=SyS-y4HUC=3sMJp6_Oz51iF=A@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 30 Jul 2019 17:23:24 +0200
Message-ID: <CAK8P3a07KOgXKksbtQceqAKiZ-ykr4nDoM2xvb+WXtrXmNn2uA@mail.gmail.com>
Subject: Re: RFC: remove Nuvoton w90x900/nuc900 platform?
To: Avi Fishman <avifishman70@gmail.com>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Wanzongshun \(Vincent\)" <wanzongshun@huawei.com>,
 Tali Perry <tali.perry1@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 30, 2019 at 3:59 PM Avi Fishman <avifishman70@gmail.com> wrote:
>
> Note that we we are going to add soon drivers/net/ethernet/nuvoton/npcm7xx_emc.c
> so maybe don't remove drivers/net/ethernet/nuvoton

Ok, thanks for a taking a look. I can leave an empty Makefile/Kconfig
pair there then.

     Arnd
