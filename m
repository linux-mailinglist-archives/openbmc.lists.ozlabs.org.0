Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CE06056A3
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 07:13:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtG2L5f5Mz3c7V
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 16:12:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=a36MC+Ch;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=a36MC+Ch;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtG1l3g99z2ygC
	for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2022 16:12:25 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id j7so32461295wrr.3
        for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2022 22:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gEyQ8wXCw3H9cHzW4gHEWztre5a5nR7SWXFOowWLhCc=;
        b=a36MC+ChsETgIZyiJrEg2Orz14vpE+MYxFDswTDSGcdhqU8okP8bp5mwYG7LCXCERB
         CUhh7Iqr5twEQsCPHFUVO+/XWz6Rc0GKLV/pV3DSmqZnKth6Y4fRycGf25GoarHLqtNL
         rGZZ6e6V+Iwi8EuvqAAvbuK7P4CTQ0Bme1d+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEyQ8wXCw3H9cHzW4gHEWztre5a5nR7SWXFOowWLhCc=;
        b=K2D1bv8TZdtgTPbDlGxmENTa45Ke4/e1kHcmRIzvOxbxvqFrBjTrRM99EzkofAuZQK
         Z1jl+tJp5SECO7zoM4N4Y5xijbo9ULszVgVEqkkqfGnRpQJtrRFDGFlo5IVQdfm7BVRN
         MPsYhhpRBx2ArdUWbKKCxIZ75lJ7X3OYxOZI//R7mAKAsxfRhy8EbYMEkG2eVSeI5LTi
         Yl8XDjp8pPxaifX5ad6US14Ta05KZNDoRD9RKUUSVcL6wQ/AUDKPVtKeGAnPFv5YHKBL
         NCGK4woJNTl+fWPDL8E+Gzu5pyw5rpghSJa5xWfGZjl3jrTaTuHKZhatL8IWzzfJFaNA
         6F0g==
X-Gm-Message-State: ACrzQf00GizjPmMXlPuXF3wQfkHFhg0OI/8iRsj1vt6SEuW2uzOi6Uml
	VPNaLF7zbJfhtBltWS1mQSII8gtRBDxLdJJyGpIYDgfs
X-Google-Smtp-Source: AMsMyM6x0u7/NaEXHQx5CAWqQE7g8MbCbqew6zsMa0z6odGnjd7ZBLIBrMVWEJ79aH27JnCAPhFzfpwXpNNrwKMvkAs=
X-Received: by 2002:a5d:6d8a:0:b0:22f:1ade:de87 with SMTP id
 l10-20020a5d6d8a000000b0022f1adede87mr7024973wrs.3.1666242741138; Wed, 19 Oct
 2022 22:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221019150714.606390-1-eajames@linux.ibm.com>
In-Reply-To: <20221019150714.606390-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 20 Oct 2022 05:12:09 +0000
Message-ID: <CACPK8Xf2n7T+hrhzdpAf0iKpSt4mC3xifA8ryCnaFvEQWmpF0Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.0 0/3] watchdog: aspeed: Add pre-timeout
 interrupt support
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Eddie,

On Wed, 19 Oct 2022 at 15:07, Eddie James <eajames@linux.ibm.com> wrote:
>
> Enable the watchdog pre-timeout interrupt if enabled in the device tree,
> and setup the relevant device trees.

Have you put this on the upstream lists too? (I'd recommend sending
out the wdt change and the device tree updates can go in once you've
got the .c change merged).

Cheers,

Joel

>
> Eddie James (3):
>   watchdog: aspeed: Add pre-timeout interrupt support
>   ARM: dts: aspeed: Setup watchdog pre-timeout interrupt
>   ARM: dts: aspeed: p10bmc: Set watchdog pre-timeout interrupt
>
>  arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts |  1 +
>  arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts |  1 +
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts |  1 +
>  arch/arm/boot/dts/aspeed-g5.dtsi             |  3 ++
>  arch/arm/boot/dts/aspeed-g6.dtsi             |  4 ++
>  drivers/watchdog/aspeed_wdt.c                | 54 +++++++++++++++++++-
>  6 files changed, 62 insertions(+), 2 deletions(-)
>
> --
> 2.31.1
>
