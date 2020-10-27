Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8351B29A2A4
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 03:20:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKwQs3Cb9zDqT3
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 13:20:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=emCTFPfb; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKwPF6SpbzDqCR;
 Tue, 27 Oct 2020 13:18:56 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id r7so10430098qkf.3;
 Mon, 26 Oct 2020 19:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z7k2jFeuyFxR40oKjqp6f6jzB45rr1tSUQm9Sp7Fuu8=;
 b=emCTFPfbMA8sqwapkNGv73E7/ekn1Du95YiS6OJf6VKhj83eNKepggO/2T4LRV4NO1
 PkbCx2E+A5beMSWBNmgrliLMH6pDiIY1xkZqGjRmOjAoodhsLVTIOzxsGPre5zCjbbss
 dPrY42iAFezg5u4Dt2arPi7ADacfYvJUbN2xU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z7k2jFeuyFxR40oKjqp6f6jzB45rr1tSUQm9Sp7Fuu8=;
 b=skBB0a3OnvS5SSesnG0eXqPiuSGH38IctkcG7Y49tRDKECggQN1+gbPaQ4rOP1YgXU
 RAI4MOCTGszNC8m2mX2tbA6dObakwGaK1cWlHQU1vpNP+mRbN6QsXW9PhaLaQHlyFdb4
 eiQ4dtA7TG7jQxAcxdKxyc75JdceOvMN1F+3Qi24KpTZeycRw1rpwqqPYzAt9fObVF30
 r9tHPi9+FSuWvhIX733tURzINKFaHAr0vwti6aeyFDfvhHwfj0XF2tfXsVAMYEshJtfn
 +W9CCiY1RTolclBytTQENh3PYUCTq3vZIGLRdrX3Gxf2NZr69mkP8RDnbRjCJcmdHcmQ
 A5ag==
X-Gm-Message-State: AOAM530aVrEtS2ogmFXe4z3xSyriKKE4flQaw7lga6kOGEv6YqcceiHR
 KtYvBN6BYRY6SfdQ0ei9/wKS5Nl2viSjS4M4YXyDoW/1
X-Google-Smtp-Source: ABdhPJwLM6M52ok+8DkCFDJBuR8rBAX3I0lJIGG88g+lugudrUqWAV3/suj2AD1bT6mETyOedwi0T/fgRJegAvl+rLk=
X-Received: by 2002:a37:a81:: with SMTP id 123mr39228qkk.487.1603765133628;
 Mon, 26 Oct 2020 19:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201019073908.32262-1-dylan_hung@aspeedtech.com>
 <CACPK8Xfn+Gn0PHCfhX-vgLTA6e2=RT+D+fnLF67_1j1iwqh7yg@mail.gmail.com>
 <20201019120040.3152ea0b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <PS1PR0601MB1849166CBF6D1678E6E1210C9C1F0@PS1PR0601MB1849.apcprd06.prod.outlook.com>
 <CAK8P3a2pEfbLDWTppVHmGxXduOWPCwBw-8bMY9h3EbEecsVfTA@mail.gmail.com>
 <32bfb619bbb3cd6f52f9e5da205673702fed228f.camel@kernel.crashing.org>
 <529612e1-c6c4-4d33-91df-2a30bf2e1675@www.fastmail.com>
 <PS1PR0601MB18498469F0263306A6E5183F9C1A0@PS1PR0601MB1849.apcprd06.prod.outlook.com>
 <e6c8e96bb26a5505e967e697946d359c22ac68c5.camel@kernel.crashing.org>
In-Reply-To: <e6c8e96bb26a5505e967e697946d359c22ac68c5.camel@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 27 Oct 2020 02:18:41 +0000
Message-ID: <CACPK8XdPB0wnvuvwxO5BST7EzDuPqGcjHTkZm=7A0ZofzyXHag@mail.gmail.com>
Subject: Re: [PATCH] net: ftgmac100: Fix missing TX-poll issue
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Po-Yu Chuang <ratbert@faraday-tech.com>, Andrew Jeffery <andrew@aj.id.au>,
 netdev <netdev@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Dylan Hung <dylan_hung@aspeedtech.com>,
 David Miller <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 26 Oct 2020 at 22:22, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Fri, 2020-10-23 at 13:08 +0000, Dylan Hung wrote:
> > The issue was found on our test chip (ast2600 version A0) which is
> > just for testing and won't be mass-produced.  This HW bug has been
> > fixed on ast2600 A1 and later versions.
> >
> > To verify the HW fix, I run overnight iperf and kvm tests on
> > ast2600A1 without this patch, and get stable result without hanging.
> > So I think we can discard this patch.
>
> This is great news. Thanks !

That is excellent news. I agree; we do not need fixes for A0 issues to
be kept in the mainline kernel. Thanks for updating us Dylan.

Cheers,

Joel
