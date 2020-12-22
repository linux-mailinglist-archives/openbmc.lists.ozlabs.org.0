Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E54792E045A
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 03:27:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0KxG1M6DzDqQd
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 13:27:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=P6MASFHF; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0KwK2HknzDqGb;
 Tue, 22 Dec 2020 13:26:41 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id u21so8091392qtw.11;
 Mon, 21 Dec 2020 18:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Aa+IvQkdl3mH7p3cqCA6yyl0vf5PDrQXGE5A+/Y+ABg=;
 b=P6MASFHFpHgisvCiEOOTFT8p7oFaacE7DqQoeEjzP0Xzw9S9mPkWPqrRM1tw+zpODd
 HTIwbN3O6U75aAoeXuCcKPDYwaBTZSJwm7gFqFQf+thhxhbq0MVAjbFdAmw3BR66iG7h
 eXQdiUjdyDN8tV2uj3QgCUT1s+QaijuJo6iFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Aa+IvQkdl3mH7p3cqCA6yyl0vf5PDrQXGE5A+/Y+ABg=;
 b=QHQzHgYdJ8NL0ZY0OEfR2ec6DtO59ps8pEskBdxxostDx78BFrrwAGYrvM9s65u//P
 6TCl2mqCxsQs7ftoOtRiyX/RVqKDzo9WgD819/FbUqZmWo1hewLXtP0B/7Df8/jGvgo0
 NfALECUEA82GWYDsHjzqBEA9xY5OGl+A3AkPLaWLVpgb6NdFyUaDTkDzbQqso6DArNSA
 ghEauNQFOr9M03aAe3+Ww/umA9/BKeC5b8QOT7E9P6lA/7imq0ZthZJc+4G9QpGjYSQm
 jTpRSBPSiCfIBPOM6jOjgTZL5G7wqHO+ZG+iSmy7RL6jNSAMNNjUtyVePmXp2bYIPuSH
 iXNg==
X-Gm-Message-State: AOAM5339CN6I5o+LyQQCFC62IOt9cQOXTCWjXwZhmaN3kdO9LPyeauAZ
 Md8Vfk3KBTJk5FFRWL7/FvztP1fdbZo0QvhDo7k=
X-Google-Smtp-Source: ABdhPJwGR2vgLN7ROSkmHZPeIAhNHAr7DPrUSxxLCNmQt5gYuzcx/x+eKJdJqgk/KG2Oz3Gx3EYqX3V4Rj9uV5yoiPg=
X-Received: by 2002:ac8:4d4d:: with SMTP id x13mr19211754qtv.385.1608603997385; 
 Mon, 21 Dec 2020 18:26:37 -0800 (PST)
MIME-Version: 1.0
References: <20201215192323.24359-1-hongweiz@ami.com>
 <20201221170048.29821-1-hongweiz@ami.com>
In-Reply-To: <20201221170048.29821-1-hongweiz@ami.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 22 Dec 2020 02:26:25 +0000
Message-ID: <CACPK8Xe8_S6jgs-DxpB0Veu=25JXftTLeK7nGhLJ51GghSeVHw@mail.gmail.com>
Subject: Re: [Aspeed, ncsi-rx,
 v1 0/1] net: ftgmac100: Fix AST2600EVB NCSI RX issue
To: Hongwei Zhang <hongweiz@ami.com>, Ryan Chen <ryan_chen@aspeedtech.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, netdev <netdev@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, David S Miller <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 21 Dec 2020 at 17:01, Hongwei Zhang <hongweiz@ami.com> wrote:
>
> Dear Reviewer,
>
> When FTGMAC100 driver is used on other NCSI Ethernet controllers, few
> controllers have compatible issue. One example is Intel I210 Ethernet
> controller on AST2600 BMC, with FTGMAC100 driver, it always trigger
> RXDES0_RX_ERR error, cause NCSI initialization failure, removing
> FTGMAC100_RXDES0_RX_ERR bit from RXDES0_ANY_ERROR fix the issue.

I work with a few systems that use the i210 on the 2600. We haven't
seen this issue in our testing.

Is there something specific about the setup that you use to trigger this?

Ryan, is this an issue that Aspeed is aware of?

Cheers,

Joel

>
> Here are part of the debug logs:
> ......
> [   35.075552] ftgmac100_hard_start_xmit TXDESO=b000003c
> [   35.080843] ftgmac100 1e660000.ethernet eth0: tx_complete_packet 55
> [   35.087141] ftgmac100 1e660000.ethernet eth0: rx_packet_error RXDES0=0xb0070040
> [   35.094448] ftgmac100_rx_packet RXDES0=b0070040 RXDES1=f0800000 RXDES2=88f8
> [   35.101498] ftgmac100 1e660000.ethernet eth0: rx_packet_error 0xb0070040
> [   35.108205] ftgmac100 1e660000.ethernet eth0: [ISR] = 0xb0070040: RX_ERR
> [   35.287808] i2c i2c-1: new_device: Instantiated device slave-mqueue at 0x12
> [   35.428379] ftgmac100_hard_start_xmit TXDESO=b000003c
> [   35.433624] ftgmac100 1e660000.ethernet eth0: tx_complete_packet 56
> [   35.439915] ftgmac100 1e660000.ethernet eth0: rx_packet_error RXDES0=0xb0070040
> [   35.447225] ftgmac100_rx_packet RXDES0=b0070040 RXDES1=f0800000 RXDES2=88f8
> [   35.454273] ftgmac100 1e660000.ethernet eth0: rx_packet_error 0xb0070040
> [   35.460972] ftgmac100 1e660000.ethernet eth0: [ISR] = 0xb0070040: RX_ERR
> [   35.797825] ftgmac100_hard_start_xmit TXDESO=b000003c
> [   35.803241] ftgmac100 1e660000.ethernet eth0: tx_complete_packet 57
> [   35.809541] ftgmac100 1e660000.ethernet eth0: rx_packet_error RXDES0=0xb0070040
> [   35.816848] ftgmac100_rx_packet RXDES0=b0070040 RXDES1=f0800000 RXDES2=88f8
> [   35.823899] ftgmac100 1e660000.ethernet eth0: rx_packet_error 0xb0070040
> [   35.830597] ftgmac100 1e660000.ethernet eth0: [ISR] = 0xb0070040: RX_ERR
> [   36.179914] ftgmac100_hard_start_xmit TXDESO=b000003c
> [   36.185160] ftgmac100 1e660000.ethernet eth0: tx_complete_packet 58
> [   36.191454] ftgmac100 1e660000.ethernet eth0: rx_packet_error RXDES0=0xb0070040
> [   36.198761] ftgmac100_rx_packet RXDES0=b0070040 RXDES1=f0800000 RXDES2=88f8
> [   36.205813] ftgmac100 1e660000.ethernet eth0: rx_packet_error 0xb0070040
> [   36.212513] ftgmac100 1e660000.ethernet eth0: [ISR] = 0xb0070040: RX_ERR
> [   36.593688] ftgmac100_hard_start_xmit TXDESO=b000003c
> [   36.602937] ftgmac100 1e660000.ethernet eth0: tx_complete_packet 59
> [   36.609244] ftgmac100 1e660000.ethernet eth0: rx_packet_error RXDES0=0xb0070040
> [   36.616558] ftgmac100_rx_packet RXDES0=b0070040 RXDES1=f0800000 RXDES2=88f8
> [   36.623608] ftgmac100 1e660000.ethernet eth0: rx_packet_error 0xb0070040
> [   36.630315] ftgmac100 1e660000.ethernet eth0: [ISR] = 0xb0070040: RX_ERR
> [   37.031524] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> [   37.067831] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
> ............
>
> This patch add a configurable flag, FTGMAC100_RXDES0_RX_ERR_CHK, in FTGMAC100
>  driver, it is YES by default, so keep the orignal define of
> RXDES0_ANY_ERROR. If it is needed, user can set the flag to NO to remove
> the RXDES0_RX_ERR bit, to fix the issue.
>
> Hongwei Zhang (1):
>   net: ftgmac100: Fix AST2600 EVB NCSI RX issue
>
>  drivers/net/ethernet/faraday/Kconfig     | 9 +++++++++
>  drivers/net/ethernet/faraday/ftgmac100.h | 8 ++++++++
>  2 files changed, 17 insertions(+)
>
> --
> 2.17.1
>
