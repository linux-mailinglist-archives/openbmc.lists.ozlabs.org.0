Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 740A268041C
	for <lists+openbmc@lfdr.de>; Mon, 30 Jan 2023 04:07:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P4tQg2YrTz3cNY
	for <lists+openbmc@lfdr.de>; Mon, 30 Jan 2023 14:07:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=jSDfboJP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=jSDfboJP;
	dkim-atps=neutral
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P4tPz5yXlz2yfq;
	Mon, 30 Jan 2023 14:07:02 +1100 (AEDT)
Received: by mail-ej1-x632.google.com with SMTP id dr8so6427191ejc.12;
        Sun, 29 Jan 2023 19:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o3ntMQlqb0JzrJC4tchjcfSk9a30/CGTxcCGy9x2Jf0=;
        b=jSDfboJPPTFZPs1T1iP1IFvxzTcUaOyhvKCke2TUwIuWfnaeCqvtjFwn8oD7Qysl90
         Z3r1GhbNMoaF5Bu+pmcaK6zOUhil3T/BYhYeGMUcvS7CmRkxJhV5ezotOl8tDuKKT77A
         EREbxkz18kq2O3tHmcWF2igYlOscg2StfEpvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3ntMQlqb0JzrJC4tchjcfSk9a30/CGTxcCGy9x2Jf0=;
        b=T9C8wUOeIP0Ynmj0xIqvXRzzly9V3Qk03HWhzgDdhIxz9z9o4bQn2ktU++8j3la6vG
         vdB/Ek8CXubyyB7v0sU/ahBwMp8oWkw1yhZsScJ2NZzcdlnpC4mjH9tHFoqWQ6VFqccv
         DWCexAYpfUy2xUFXyda+84JXtf4p/JnSVK3f1R5xhwW8zpTSn5oXkrnj59ELmV0IF5Fl
         D0SaylOZcZARGRMp/UtJGzHNuahMZbrPWURpYMr18jfKQyKZGwmjUmtF3k/5ScvOpyAZ
         1k5NIgn1QOKKy5qA0nfYyx5lfSIQbHV/Eb9sJQFni7JxQYkiFiKT+4Xd3H7YMVseuPiT
         UjdA==
X-Gm-Message-State: AFqh2kqsLRk5L6ebIpzPO6KRdGQkgy5uvZ8WrfyTbf/Jsl8tgI/0jBXf
	26Ioyuf59NU4wOkkyArQ2U+96zaKPglN7Fn+i38=
X-Google-Smtp-Source: AMrXdXvY4IZW4tVAv3tuOBdVoBSU3iHW5DrVeKtBVjPj7EOVrNscPenJ6jiivMGThIDybslCR9togqBCi+9397ULv8Q=
X-Received: by 2002:a17:906:9ea5:b0:84c:a863:ebf3 with SMTP id
 fx37-20020a1709069ea500b0084ca863ebf3mr9489326ejc.100.1675048018726; Sun, 29
 Jan 2023 19:06:58 -0800 (PST)
MIME-Version: 1.0
References: <20220818101839.28860-1-billy_tsai@aspeedtech.com>
 <CACRpkdYpp_1JJQmuX27pECxN0cjzciCuETLPTrSYKqpX0FPABQ@mail.gmail.com>
 <e501d2fb-aaa0-470d-a8d5-5f8e97898df7@beta.fastmail.com> <CACPK8XfQ=uarsOgJ7LaXqLyGG2vSF-47RkAEV=T2gruapx-yfg@mail.gmail.com>
 <CACRpkdZPxZgWJ3jjiesOFGXmwzZFqeByZyx1VCy5pDWyVQHy+A@mail.gmail.com>
In-Reply-To: <CACRpkdZPxZgWJ3jjiesOFGXmwzZFqeByZyx1VCy5pDWyVQHy+A@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 30 Jan 2023 03:06:46 +0000
Message-ID: <CACPK8XcL-T_zv0aoeM5DJzGirp6dqD9UOn6=enSZDLao6hg2bg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Force to disable the function's signal
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Billy Tsai <billy_tsai@aspeedtech.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 27 Jan 2023 at 12:39, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Jan 19, 2023 at 2:54 AM Joel Stanley <joel@jms.id.au> wrote:
>
> > As foreseen by Andrew, this caused a regression. On the Romulus
> > machine the device tree contains a gpio hog for GPIO S7. With the
> > patch applied:
>
> OK shall I just revert the patch?

Yep! I was going to send a revert but I thought I should write up a
commit message. If you're happy just putting a revert in with a note
that it caused a regression that's enough for me.
