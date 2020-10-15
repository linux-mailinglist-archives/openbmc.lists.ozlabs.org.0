Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2105228EB3B
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 04:33:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBYH525JkzDqVL
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 13:33:05 +1100 (AEDT)
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
 header.s=google header.b=BINzPpqR; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBYGB0kLHzDqKJ;
 Thu, 15 Oct 2020 13:32:17 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id x20so1248877qkn.1;
 Wed, 14 Oct 2020 19:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CIr+KzzkGzxVzUKpACDGhDNN7lFkJAx5/cWwJGHb2V0=;
 b=BINzPpqRkAE9sw37b5ly+SWHWjeebbr9Syrlvx7cZz6OluSviavis0kwpdZeRAZEte
 0gle+dtW+7ZulTpXIQWZW+4BqoUijrvRoMjsXM/sOEd/wPfxQwjvCza/T3YwZQAqo6KP
 3VoGPt95/VyALRh/odJXQRXyz7fq2JaAsDTlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CIr+KzzkGzxVzUKpACDGhDNN7lFkJAx5/cWwJGHb2V0=;
 b=J5n3Xx3CaCwqVVIrO3c0Kbm/0wNOWS2yB9jNKn/If5VzIxSvz4ik2wIwnuLyfXmftO
 S1XV/PhbmJD9Gznl6ToA+rjj5iGS+8pFuoslc8Re2msBd8iZP45GNJ8wqux/DXLOJcDC
 FuEETqyJnQc2JyS6j2+FuX+RGd0g+yeTjU0qBSwkGkoCgDK9FRHbbDeFnntlqDAW+AWr
 1OB2FEk9HPcIwPw5eLz8FQP0hSjgIShn2IG+D2W+5mRmPkI1kMeotLAVzhT2SgDP37fE
 uTYkmAuwZUkTDTeHsPHJmwwiJahYvgG/uG8ntnwtd9oEfmRgkkDFHTAyYyk+FSBlUyy2
 7Vig==
X-Gm-Message-State: AOAM532KY2rmxacoLxnyDmEi5uJw8yiv2rDqS/I4D0/dtB4TiZ+MtRhP
 NIfGxgLbtNHX0V78+xV/mZQIxBB7AKwgmishsok=
X-Google-Smtp-Source: ABdhPJw2ZXQ6BTTznI/MCwya60LRb1O3iWIUSvksi/jv8O1ajQsODW8OpsUs5R1pMDhFcxGeMKPzKqr4aKg8nCJAYhM=
X-Received: by 2002:a37:46c4:: with SMTP id t187mr1977786qka.465.1602729133521; 
 Wed, 14 Oct 2020 19:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20201014060632.16085-1-dylan_hung@aspeedtech.com>
 <20201014060632.16085-2-dylan_hung@aspeedtech.com>
 <CACPK8Xe_O44BUaPCEm2j3ZN+d4q6JbjEttLsiCLbWF6GnaqSPg@mail.gmail.com>
 <PS1PR0601MB1849DAC59EDA6A9DB62B4EE09C050@PS1PR0601MB1849.apcprd06.prod.outlook.com>
 <CACPK8Xd_DH+VeaPmXK2b5FXbrOpg_NmT_R4ENzY-=uNo=6HcyQ@mail.gmail.com>
 <PS1PR0601MB184990423661220EACDBF4BB9C020@PS1PR0601MB1849.apcprd06.prod.outlook.com>
In-Reply-To: <PS1PR0601MB184990423661220EACDBF4BB9C020@PS1PR0601MB1849.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Oct 2020 02:32:01 +0000
Message-ID: <CACPK8XePVhxtV5EXGH8ycHrG03M1JBp4920Hi9EQQfw5mCxJxg@mail.gmail.com>
Subject: Re: [PATCH 1/1] net: ftgmac100: Fix Aspeed ast2600 TX hang issue
To: Dylan Hung <dylan_hung@aspeedtech.com>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, Po-Yu Chuang <ratbert@faraday-tech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 15 Oct 2020 at 01:49, Dylan Hung <dylan_hung@aspeedtech.com> wrote:
> > > I was encountering this issue when I was running the iperf TX test.  The
> > symptom is the TX descriptors are consumed, but no complete packet is sent
> > out.
> >
> > What parameters are you using for iperf? I did a lot of testing with
> > iperf3 (and stress-ng running at the same time) and couldn't reproduce the
> > error.
> >
>
> I simply use "iperf -c <server ip>" on ast2600.  It is very easy to reproduce. I append the log below:
> Noticed that this issue only happens when HW scatter-gather (NETIF_F_SG) is on.

Ok. This appears to be on by default in the
drivers/net/ethernet/faraday/ftgmac100.c:

        netdev->hw_features = NETIF_F_RXCSUM | NETIF_F_HW_CSUM |
                NETIF_F_GRO | NETIF_F_SG | NETIF_F_HW_VLAN_CTAG_RX |
                NETIF_F_HW_VLAN_CTAG_TX;

> [AST /]$ iperf3 -c 192.168.100.89
> Connecting to host 192.168.100.89, port 5201
> [  4] local 192.168.100.45 port 45346 connected to 192.168.100.89 port 5201
> [ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
> [  4]   0.00-1.00   sec  44.8 MBytes   375 Mbits/sec    2   1.43 KBytes
> [  4]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec    2   1.43 KBytes
> [  4]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec    0   1.43 KBytes
> [  4]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec    1   1.43 KBytes
> [  4]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec    0   1.43 KBytes
> ^C[  4]   5.00-5.88   sec  0.00 Bytes  0.00 bits/sec    0   1.43 KBytes
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bandwidth       Retr
> [  4]   0.00-5.88   sec  44.8 MBytes  64.0 Mbits/sec    5             sender
> [  4]   0.00-5.88   sec  0.00 Bytes  0.00 bits/sec                  receiver
> iperf3: interrupt - the client has terminated

I just realised my test machine must be on a 100Mbit network. I will
try testing on a gigabit network.

> > We could only reproduce it when performing other functions, such as
> > debugging/booting the host processor.
> >
> Could it be another issue?

I hope not! We have deployed your patch on our systems and I will let
you know if we see the bug again.

> > > > > +/*
> > > > > + * test mode control register
> > > > > + */
> > > > > +#define FTGMAC100_TM_RQ_TX_VALID_DIS (1 << 28) #define
> > > > > +FTGMAC100_TM_RQ_RR_IDLE_PREV (1 << 27) #define
> > > > > +FTGMAC100_TM_DEFAULT
> > > > \
> > > > > +       (FTGMAC100_TM_RQ_TX_VALID_DIS |
> > > > FTGMAC100_TM_RQ_RR_IDLE_PREV)
> > > >
> > > > Will aspeed issue an updated datasheet with this register documented?
> >
> > Did you see this question?
> >
> Sorry, I missed this question.  Aspeed will update the datasheet accordingly.

Thank you.
