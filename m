Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 745C7413F5C
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 04:22:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDhrW2wKpz2yQM
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 12:22:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=kHeChmf2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=kHeChmf2; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDhr46K4sz2yQ0
 for <openbmc@lists.ozlabs.org>; Wed, 22 Sep 2021 12:21:38 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id a10so4148397qka.12
 for <openbmc@lists.ozlabs.org>; Tue, 21 Sep 2021 19:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yYVyMf9PC9MYUcmIqBYdizVZAaEl8T1WDxR4uwnrpIo=;
 b=kHeChmf2dtk7zAsSgDIaYX8Ohy/Qt040hJkMdNU+NtRcilkwciL7FALmhQgWuE4vuA
 hZKuATQHLbkNpHVPNnEKhPAwSdUV3LZrgWt+fE7IA6WUzx1UVJD2/z84A59grGNy7mhT
 G6e7tBpjlWPnvktm2IkgofBCv/ZDbn3s4l6mQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yYVyMf9PC9MYUcmIqBYdizVZAaEl8T1WDxR4uwnrpIo=;
 b=KuQ9ZV6KWZPN3pIIq3BPmYam/k0+0o10kHJE/dwOSEBio7M6HT55l6JgwrojDKE6xG
 rbQS8MaOpUy75SNvN+sKYwL0JLVt3Zwo37k/BXA5AeJghAxADpR2ZSL2JtEL8aSYix6N
 p+pujWvc7+goS2p+KgRPbbliwKwOlChcnf7fDws09njAkHO/RVmoLdDrkTl63XSl3NFT
 4zYCzjZZdZ7rAKZ9vf6ZUfCCy124KwykGPMqEviJUYUWlG1WrVBL34bjOIXjlUts707E
 fWXoFJP7scaPdhegGJmPIvMYSOo/8wNzMtPi+lVu8l+ryB+MHqgtxtDvYIWHYQgxracR
 Iswg==
X-Gm-Message-State: AOAM531MZjPpLkMxRGJ+xknH34oLnxOp7s49s2/9FjqPZkeZ0rzZA2ZH
 Z3TClbFHyeveSBtMTS4VBfB2TfLjBKa9ldFDaac=
X-Google-Smtp-Source: ABdhPJxHk2Bge4TqWLGp9Pa0EuYWtcDnN4rkijxAgkoLqH2YBTjuZQ2fL6T0Ig+xBhR3on9vBB22DYtS/+V/tX7AF9E=
X-Received: by 2002:a05:620a:1aa6:: with SMTP id
 bl38mr32572017qkb.36.1632277295211; 
 Tue, 21 Sep 2021 19:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210916212140.33915-1-eajames@linux.ibm.com>
In-Reply-To: <20210916212140.33915-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Sep 2021 02:21:21 +0000
Message-ID: <CACPK8XcEgP-jk11_n1Jbusa2Z-bOB4_zQZyGNiOCEWrbnph6+Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 0/7] leds: Support retaining state for the
 PCA955x
To: Eddie James <eajames@linux.ibm.com>
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

On Thu, 16 Sept 2021 at 21:21, Eddie James <eajames@linux.ibm.com> wrote:
>
> This series implements the ability to retain the state of the LEDs
> controlled by the PCA955x across system reboots. This includes a
> change to the LED core driver to respect the retain-state-shutdown
> device tree property. It also cleans up the PCA955x driver, adds the
> ability to query the hardware LED brightness, switches the I2C probe
> function to probe_new, and uses more core functionality for parsing
> the fwnode.
>
> This series has been applied to linux-next.
>
> Eddie James (7):
>   dt-bindings: leds: Add retain-state-shutdown boolean
>   leds: leds-core: Implement the retain-state-shutdown property
>   leds: pca955x: Clean up code formatting
>   leds: pca955x: Add brightness_get function
>   leds: pca955x: Implement the default-state property
>   leds: pca955x: Let the core process the fwnode
>   leds: pca955x: Switch to i2c probe_new

Thanks, applied.

>
>  .../devicetree/bindings/leds/common.yaml      |   6 +
>  drivers/leds/led-class.c                      |  10 +-
>  drivers/leds/leds-pca955x.c                   | 232 +++++++++++++-----
>  3 files changed, 182 insertions(+), 66 deletions(-)
>
> --
> 2.27.0
>
