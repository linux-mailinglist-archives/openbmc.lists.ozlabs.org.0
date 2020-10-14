Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1435F28E8C9
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 00:34:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBRzr36wlzDqWj
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 09:34:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=k23lljwg; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBRwC4cfMzDqVC;
 Thu, 15 Oct 2020 09:31:21 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id c13so474371qtx.6;
 Wed, 14 Oct 2020 15:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2bDs98ntDIXfp42fz2irqL/7dwTOhw0qSbVCbyVX2Wo=;
 b=k23lljwg6UM4znZHShqTNR4m7IIkpr+/yjRNjNiUWczinS73SjZXxrf+nuQ3+N6B19
 o12umAMU/rJmWgJL4NFvx+fcp5V0LZFb94Sir88vRayBdbfheaDQaCor496q1O/N3cVE
 1gTvO3jeHyTS3MFZQS44E/WiKh0d/93XHw3Ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2bDs98ntDIXfp42fz2irqL/7dwTOhw0qSbVCbyVX2Wo=;
 b=ontgq2ta53gRqK3QvibhuaIyno9xGSQVOSBcCKA+wiuRIBELLFJaD4dkmopB9H1ir6
 fb1K45A07SburBRsMnwZ3rAUpi4N/O+hM4e2ScMgVW+OHnJR+hw4OhaZtjwq17zQW1YQ
 AKfSyzrH1N+skS9J5wYXdtT7KYAa0jZcT6q6LyIoMOP85yFfroSMlGV3+KdS4TpHvPoM
 eavqgdVkKkD9Ni3lRwc26023+QR73lwyTwnFQIPtyzq8ILn/cD+qEmdugGDIKiqyIOW2
 M5FWYBSs53uDUSw81lI/CEr2ozOAiAri/1tCT39PslCt9uWy23ZlzpH3LyBnh4uhzr/E
 ioxQ==
X-Gm-Message-State: AOAM530IglsVYyEm0Lka+qB3uw9RHGGeXSbut3tv4bXJmhr/sIFyzIrn
 iy3SFfPV6EAUIbqnsIkvG7D4moS6fx6C46fB4yQ=
X-Google-Smtp-Source: ABdhPJzaTBI/jCETqEnDTpHoEVhA7+3xxi1+uoLLTUHoSHbaFmQBZ8EJFNXyYrbE1296c8fATMbvfuJ4Rn+Cshq2a3E=
X-Received: by 2002:aed:3325:: with SMTP id u34mr1433256qtd.263.1602714677688; 
 Wed, 14 Oct 2020 15:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201014060632.16085-1-dylan_hung@aspeedtech.com>
 <20201014060632.16085-2-dylan_hung@aspeedtech.com>
 <CACPK8Xe_O44BUaPCEm2j3ZN+d4q6JbjEttLsiCLbWF6GnaqSPg@mail.gmail.com>
 <PS1PR0601MB1849DAC59EDA6A9DB62B4EE09C050@PS1PR0601MB1849.apcprd06.prod.outlook.com>
In-Reply-To: <PS1PR0601MB1849DAC59EDA6A9DB62B4EE09C050@PS1PR0601MB1849.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 14 Oct 2020 22:31:04 +0000
Message-ID: <CACPK8Xd_DH+VeaPmXK2b5FXbrOpg_NmT_R4ENzY-=uNo=6HcyQ@mail.gmail.com>
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

On Wed, 14 Oct 2020 at 13:32, Dylan Hung <dylan_hung@aspeedtech.com> wrote:
> > > The new HW arbitration feature on Aspeed ast2600 will cause MAC TX to
> > > hang when handling scatter-gather DMA.  Disable the problematic
> > > feature by setting MAC register 0x58 bit28 and bit27.
> >
> > Hi Dylan,
> >
> > What are the symptoms of this issue? We are seeing this on our systems:
> >
> > [29376.090637] WARNING: CPU: 0 PID: 9 at net/sched/sch_generic.c:442
> > dev_watchdog+0x2f0/0x2f4
> > [29376.099898] NETDEV WATCHDOG: eth0 (ftgmac100): transmit queue 0
> > timed out
> >
>
> May I know your soc version? This issue happens on ast2600 version A1.  The registers to fix this issue are meaningless/reserved on A0 chip, so it is okay to set them on either A0 or A1.

We are running the A1. All of our A0 parts have been replaced with A1.

> I was encountering this issue when I was running the iperf TX test.  The symptom is the TX descriptors are consumed, but no complete packet is sent out.

What parameters are you using for iperf? I did a lot of testing with
iperf3 (and stress-ng running at the same time) and couldn't reproduce
the error.

We could only reproduce it when performing other functions, such as
debugging/booting the host processor.

> > > +/*
> > > + * test mode control register
> > > + */
> > > +#define FTGMAC100_TM_RQ_TX_VALID_DIS (1 << 28) #define
> > > +FTGMAC100_TM_RQ_RR_IDLE_PREV (1 << 27)
> > > +#define FTGMAC100_TM_DEFAULT
> > \
> > > +       (FTGMAC100_TM_RQ_TX_VALID_DIS |
> > FTGMAC100_TM_RQ_RR_IDLE_PREV)
> >
> > Will aspeed issue an updated datasheet with this register documented?

Did you see this question?

Cheers,

Joel
