Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 958B028594C
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 09:22:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5m4R7348zDqNN
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 18:22:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=mlKNPJZ+; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5m3h5lKkzDqMh
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 18:21:33 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id j22so856247qtj.8
 for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2020 00:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=18+4iMGv+ayRO1cpfMpB+z0pIwAhQ8tIa3Sswu6C25g=;
 b=mlKNPJZ+HwnUn32Q+mFxiOaEwA1BAC40JN/tblyxy6g3IgIOLQWjILv9QNKCxFPur2
 Riu/YFils7TObf6u/5YIfD9HiqnnrsB5BM0yD5cdT92siMG7wJx4cc/iCrdkFMEI4Jb2
 nqF1KX+vmtynvvQn09tnbYoFVD5s0XeOith78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=18+4iMGv+ayRO1cpfMpB+z0pIwAhQ8tIa3Sswu6C25g=;
 b=s+rW/ZFbd06Iuy4ylvLFGtZa8KMQ1R9FV3e4UkK8ntZ2RzrSkAvY5IZf2SlnlpeEci
 Yu26gdCBUIH9BUpra0xTj9ST1dIWwTl5uVnWwv+LkAeqZ06j67sO/RFQIpFwOmnyUpvr
 uuDA1NnaJ66JERAIYFZBT2oMDzJ/PxnsBTfrCU16OwKKPHWpbcDO9N5Zc2J4pg+cwNE7
 lg/4oKXCC40i6Zlri59PlhghcX346BSyVahMbD8IbulHMMXl9DuzHdqjAmlhnb6Ygxgn
 qqlwhcUez1n0nDuecNfSplj3XM/x1hyn8rK9ojdz6yilAWwt+4F3O4PFqldnJAFMjeQS
 b9+Q==
X-Gm-Message-State: AOAM533KXGv8J49X6dX13O46QC+7BxDOS4A13xg6ZaZ6WpGlFE/T0z9e
 ctgiwZYieSRHygWDyHIzo2hxX0lLgF9PDuI8NIztTfC0
X-Google-Smtp-Source: ABdhPJwlnesVVCH9GQDFRAwGf+aBKIt+F8rWAHowSMNtW0vBHxHrFh5HRlSa+87YT3A69VDhP6pDgqVVSnlfqRfQ7K4=
X-Received: by 2002:ac8:5b82:: with SMTP id a2mr1909477qta.176.1602055288758; 
 Wed, 07 Oct 2020 00:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201002063414.275161-1-andrew@aj.id.au>
In-Reply-To: <20201002063414.275161-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Oct 2020 07:21:16 +0000
Message-ID: <CACPK8Xd_kbuUVLomHhvkB4KXXuboiNY_HYMpSrJYdjjedjBu_Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] Enable pstore for Rainier
To: Andrew Jeffery <andrew@aj.id.au>
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

On Fri, 2 Oct 2020 at 06:35, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello,
>
> This series adds pstore support to the Rainier platform for recovery of oopses
> and panics.
>
> Patch 3/3 is a minor cleanup. Only patch 1/3 is a requirement as 2/3 is handled
> by the config snippet in the bitbake metadata.

I merged 2 and 3. lmk what you want to do with the configuration.

I suggest we enable it for Tacoma too.

>
> Please review!
>
> Andrew
>
> Andrew Jeffery (3):
>   ARM: dts: rainier: Add reserved memory for ramoops
>   ARM: config: Enable PSTORE in aspeed_g5_defconfig
>   ARM: dts: rainier: Don't shout addresses
>
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 12 ++++++++++--
>  arch/arm/configs/aspeed_g5_defconfig         |  4 ++++
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> --
> 2.25.1
>
