Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A2940D3B4
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 09:21:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H97mh3jnrz2yHt
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 17:21:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=CMs/xVoT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=CMs/xVoT; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H97mJ6Nsgz2xjR
 for <openbmc@lists.ozlabs.org>; Thu, 16 Sep 2021 17:21:04 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id 73so1325266qki.4
 for <openbmc@lists.ozlabs.org>; Thu, 16 Sep 2021 00:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fHuwGgZaudZtQjQwIjuvij+1tWm7nZfaPKfv814+rz4=;
 b=CMs/xVoTfLA4nbHVJcrjHjgTqTLp5zkT6a5QgAmJ6WXpAOA4t3QkXZB61Omki4Wgdn
 I/cFEV3XNpK+kyWk5X9DuZJgDsHkgeIirbgwSY79HEHXvEB5vqtz/fO7yZi486e0SzUZ
 RxXdshmeiGM6JiGQMlrlBiz+gsf5F0HfIxLNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fHuwGgZaudZtQjQwIjuvij+1tWm7nZfaPKfv814+rz4=;
 b=lS1eY4EYlEn+bH7WkPAll3kypC2/9a8Umf/cGOv8qjMNGW2fDMjWnW5WQ+xHfddhA7
 rEkNLjPONN/dGqkDhtk8uYPUjot5/1QCTyX02PElHaBrBel9lvVHh+giXWrQ6uNo28E0
 aQnWWTwE8JNW9TquHDWUbAy1gmooXgMsOpRr8Xr5FqrjqfCDUxfKBVIHNECx4nAUvByE
 j1rEMa4Z7pjVtoo/y3aOl5KTkEZKszmnc1ewpalzODtO30aBtorOPkNlSWW3U9Gsea9i
 bGMQlkU6iodKik88GufAVrnncjQ2QObrt2WzpS1DvJB9tPSABNTVlFxdWQpqeXrQAg+5
 z3yA==
X-Gm-Message-State: AOAM530PiwPtowghS6S1j2VA/W2gwIk8Zby2Yfwagkiz6RRCpAk1wV3u
 P0MlgR/Nv2ZZfiAT9fONKt/KhCcLIWjDA6vHW5g=
X-Google-Smtp-Source: ABdhPJysm1cr24id8+93b08KXof3duR8nx++X/NAg8WtVH2cIeG4wh3mUbJnVTVDhrSPrU/hkOjbedmNdokYQi2mDpc=
X-Received: by 2002:a37:67d7:: with SMTP id b206mr3661394qkc.395.1631776861850; 
 Thu, 16 Sep 2021 00:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210915214738.34382-1-eajames@linux.ibm.com>
In-Reply-To: <20210915214738.34382-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Sep 2021 07:20:50 +0000
Message-ID: <CACPK8XcrH0A5W+d9Frz6_5JLe4aYXg_JL=kTHWr0oRJR6XZ-bA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 v2 0/4] ARM: dts: aspeed: p10 i2c, leds,
 and gpios
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

On Wed, 15 Sept 2021 at 21:47, Eddie James <eajames@linux.ibm.com> wrote:
>
> Here are various additions and fixes to the P10 BMC system device trees.
>
> Changes since v1:
>  - The eeprom and gpio patches
>  - Add missing gpio expander at 0x60 on i2c-7
>
> Eddie James (4):
>   ARM: dts: aspeed: everest: Add I2C bus 15 muxes
>   ARM: dts: aspeed: rainier: Add system LEDs
>   ARM: dts: aspeed: rainier: Add eeprom on bus 12
>   ARM: dts: aspeed: Rainier: Remove gpio hog for GPIOP7

I've applied the first three, but only part of patch four as discussed
in that patch.

Cheers,

Joel
