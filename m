Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A65772F6F39
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 01:01:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH1Yp6TlczDsXT
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 11:01:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Yyh4/GgZ; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DH1XY4P60zDsVl
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 11:00:28 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id c7so10161661qke.1
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 16:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wubGzTey9y2TZ5EjnSZarx70NEsE0qio44RxVij1t5U=;
 b=Yyh4/GgZPjs4z6PWT1S91y6dU/QT5Vsl42/vTKlqR+EcSaXPhq7LGI5Qkvgky45xDv
 bQXiFIdSovdgPDpim7S6QS4+5MUxHRyt4qxE8a5tk16dTVGaGu1Bn8LyDcYjb9nAfhdG
 pfXkZLxbnw9D2TjR0as3DL+Uv/iJ17oBe0E/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wubGzTey9y2TZ5EjnSZarx70NEsE0qio44RxVij1t5U=;
 b=WzNsbkDc5Aa66yS7RZ9N90oslS3Kn9arYT57VJbzgnfurfZQQZmwM+4ha/WsYGWiJc
 gvJ3HI1Qpu3lfIOFl9mIiD5D6Z2NLl2W6L+Q+VNI0FcBjfP8mopbGEa3VvifcwZ93OVr
 1+B4gatxCmMn7rRO4OQSqpxKzvzRZjrKcaANhznP9qzbAOJy2q0GcFjGiNZdcaei3hXK
 WrJ02+DO+RFTsMpMz++gjcl0AG1FmweA9sZ7ZpOxSIle7CDBK00My4u6pYHLU88RNzSZ
 PAY+f9Ixn3NtTALKzz7HsbHxQSgNptOX5T5XL4TJWoZGgeMRKGDugjwP7UFRINI9KfDf
 yrog==
X-Gm-Message-State: AOAM533uKTq+pqUZau4puEyEWTIAO3AqoWOhvPzjOtiqI+TA2oonexJ+
 zYZ4gVcjOA7WqxHOgQIjlb/bqOc70W+hHednFd4=
X-Google-Smtp-Source: ABdhPJyTdBN5JGPQa84c5Kqf1AhjfH786gWEAGvRdY8+WnWZVfDoLTVdHKmM/fH7iPGAGb41Afenl4W84LLg2Jw3Dtc=
X-Received: by 2002:a37:4f4a:: with SMTP id d71mr9839602qkb.55.1610668823228; 
 Thu, 14 Jan 2021 16:00:23 -0800 (PST)
MIME-Version: 1.0
References: <PS2PR02MB3541276EFDDDD18BDAA34A2D90AA0@PS2PR02MB3541.apcprd02.prod.outlook.com>
In-Reply-To: <PS2PR02MB3541276EFDDDD18BDAA34A2D90AA0@PS2PR02MB3541.apcprd02.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 15 Jan 2021 00:00:10 +0000
Message-ID: <CACPK8XdeUy82d10a9OTu_SPp_Mmr4413SHAEEe4t-D2Mzu9gZg@mail.gmail.com>
Subject: Re: Regarding eth0 (ftgmac100): transmit queue 0 timed out
To: "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 14 Jan 2021 at 23:48, Mohammed.Habeeb ISV
<mohammed.habeeb@inventec.com> wrote:
>
> Hi All,
>
>
>
> We see below backtrace on our runBmc board. And networking does not work on eth0.
>
> No DHCP and static IP address can work. Pings and ARP fails, no packets received seen running tcpdump.
>
> Using 2.7 version of openBmc. Please let me know if there is a known fix or patch for this.
>
>
>
> transformers:~# [  158.082251] ------------[ cut here ]------------
>
> [  158.087442] WARNING: CPU: 1 PID: 0 at net/sched/sch_generic.c:447 dev_watchdog+0x2d4/0x2f8
>
> [  158.096681] NETDEV WATCHDOG: eth0 (ftgmac100): transmit queue 0 timed out
>
> [  158.104279] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.4.8-671f622-dirty-f5845fd #1

This is a symptom of networking not working; there's many possible root causes.

Is this an ast2500?

From your log, it appears you're using a 5.4 kernel:

[  158.104279] CPU: 1 PID: 0 Comm: swapper/1 Not tainted
5.4.8-671f622-dirty-f5845fd #1

This is not maintained by anyone, and is probably missing patches. It
would be best if you moved to the latest openbmc kernel tree, but if
you can't do that then look at the history of the ethernet driver in
dev-5.8 and see which patches you're missing:

$ git log --no-merges --oneline v5.4...dev-5.8
drivers/net/ethernet/faraday/ftgmac100.*
9f55d7825b96 net: ftgmac100: Ensure tx descriptor updates are visible
8de0141c2524 net: ftgmac100: Fix Aspeed ast2600 TX hang issue
e6b45ee790ec net/faraday: fix grammar in function
ftgmac100_setup_clk() in ftgmac100.c
86eeb97de710 ftgmac100: Remove redundant judgement
d560b733ed53 net/faraday: Delete driver version from the drivers
f1294617d2f3 net: convert suitable network drivers to use phy_do_ioctl
0290bd291cc0 netdev: pass the stuck queue to the timeout handler
0c65b2b90d13 net: of_get_phy_mode: Change API to solve int/unit warnings
9bce4b27f3ec net: ftgmac100: Ungate RCLK for RMII on ASPEED MACs
0ac624f47dd3 docs: fix some broken references

The top two patches "net: ftgmac100: Ensure tx descriptor updates are
visible" and "net: ftgmac100: Fix Aspeed ast2600 TX hang issue" are
ast2600 specific.

>
>
>
> Few issues were reported but no resolution.
>
> https://github.com/openbmc/openbmc/issues/3192
>
> https://github.com/openbmc/openbmc/issues/2228

These two issues were specific to the broadcom network device used on
that platform. I doubt they relate to your issue.

>
>
>
> Tried below patch , seems does not work.
>
> http://lkml.iu.edu/hypermail/linux/kernel/2010.1/05957.html
>
>
>
> FYI ..We tried openBmc 2.9 version. It can work fine.
>
>
>
> Attached is the complete backtrace.
>
>
>
> Thanks
>
>
