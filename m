Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 754C4CF2AC
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 08:21:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nS0P4tXRzDqMf
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 17:21:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="RBrcz9UU"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nRzh16DhzDqG6
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 17:20:31 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id u186so15512041qkc.5
 for <openbmc@lists.ozlabs.org>; Mon, 07 Oct 2019 23:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WP+pojp2zUcBj6CU6ntf1ezIqpw5lokUZObATOgGpRw=;
 b=RBrcz9UU4VXkqcZ+zEsqCzocpoT0RtbjzgEW6O+cMd2GnnMTxB+qD2G666rGT6uJ8G
 2J29CvvBFTDR9DvTOsp25iY6j0xifX/5zwnMjXxlRW6FScfrpd1i4CmKO85FtnKitKVI
 mMBnmmLBnj+YW1i+rQJE7+ohO1CXf6VoVS8rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WP+pojp2zUcBj6CU6ntf1ezIqpw5lokUZObATOgGpRw=;
 b=UiDuu20spMbRR/nz8ZrZisaMpC7kUZ8E24Yvnn8P5HDSFFHu0Bn1QeIscb9xae3zPf
 BY987fKoaw0kuDpneqBA2G6NiI9QYIBF1MJ8fnjck4PurOk4pGSjStMyxyAdGuFen8rG
 7PCBisf144vomNguinl+uVVdaJQDhQBXKXQEWfdPqZfwQ5dfnJzWc5pOBzG3Jvt2qJeG
 cIiGsSvgaGo0o98VPJgHDhjnjXmi6p/VU7YQMYbxCjroyjgiuV+KHPgAW4bMNNTxEtz4
 BKhSqQFQ2RVGiMgAaYYH8bDU8rIMTiLFC6A29MzKWldc2+pcPpqXbxcUjVlsokRIrU7r
 O7UA==
X-Gm-Message-State: APjAAAU6YvrzLGObSwTe+FxsAeo+PYunfueAh33RjuDvCOt0NbARAsZh
 VuduHklUjYa35vnpPZvZ2c+TGTuPyCjBDTCyN78=
X-Google-Smtp-Source: APXvYqy92yw1eybvS18EVeTh8T9oBAimOg86O2MAPr4f81IuoxgblsuS6FAYtG2quVHmZclqbR0LT7Hy36Xzrbu35g4=
X-Received: by 2002:a37:bd5:: with SMTP id 204mr28042322qkl.330.1570515627723; 
 Mon, 07 Oct 2019 23:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <a75f96a83100994878c2ad459146b7107b5d1da8.camel@yadro.com>
In-Reply-To: <a75f96a83100994878c2ad459146b7107b5d1da8.camel@yadro.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Oct 2019 06:20:16 +0000
Message-ID: <CACPK8XfLqGqZSWqfUtOWqvxyBdOyd_PpAA7NMuUUARoNn1Gu-w@mail.gmail.com>
Subject: Re: watchdog's patches backport from dev to 2.7/warrior
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 7 Oct 2019 at 16:16, Ivan Mikhaylov <i.mikhaylov@yadro.com> wrote:
>
> Hey Joel, Brad,
>
> Can we backport these patches into 2.7 warrior, please?

Sure. There are two ways to achieve this:

 -  apply changes as kernel patches to the kernel in the layer for your machine.
  - update the kernel to a newer version by updating meta-aspeed

As the kernel is not being maintained for the branch, I would suggest
updating meta-aspeed is the best way to go.

Cheers,

Joel

>
> c536e5f66af75f4301361363e37d7f4e3aa4eb37
> ARM: dts: aspeed: vesnin: Add wdt2 with alt-boot option
>
> 6984ef32d05c2b5567f5d3f09d260ca7cbc2fc27
> ARM: dts: aspeed: vesnin: Add secondary SPI flash chip
>
> 653aedbf02b71d6930959323e76961da98eab858
> watchdog: aspeed: add support for dual boot
>
> Thanks.
>
