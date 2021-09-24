Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9483C41709B
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 13:06:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HG8P43FBWz307x
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 21:06:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=4i1txAxQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=4i1txAxQ; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HG8Ng2q3xz2yLS
 for <openbmc@lists.ozlabs.org>; Fri, 24 Sep 2021 21:06:25 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id
 c6-20020a9d2786000000b005471981d559so12612521otb.5
 for <openbmc@lists.ozlabs.org>; Fri, 24 Sep 2021 04:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JRQViL6prnXDwH/4sTDjipPLvW7S7s1I5ZjlRFYTiPA=;
 b=4i1txAxQzDz0JIm4xO6NdVWEWQvT2Vfq+nnENa6o9TbpjB5N9LexpmH6997exsA/Fp
 a3jy0Gnbykox9a9ZmNlUNrmxHU5zzw+7wognBhfBwaWiMpmNFO9pvIUr8iUKPf+TrZ9S
 WwfmPXn01HgZOnkdm7yXc6wokVaajqW3S5wZJczrbPXFADgMzPEheauU0K3tukRvIiAV
 NAZD0WHR8yV0jdMWTmR7MUZHZDnE27RHCPOwyhPk3yGxvPttxrKV1BuHiR+cOY22nXJ1
 jfh+GPtTxuQDLlf7PgAIhYkPPvax7Etkty0VTK9tAC96FmxVG+277Z1OSk6yW4mFf7Tv
 Y/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JRQViL6prnXDwH/4sTDjipPLvW7S7s1I5ZjlRFYTiPA=;
 b=oI9oPRuoccHknXJ+BygK+tdpAoJWe4M3hJ+cipzda7zhB6BBgWlheBd6vnHCJmuBMH
 MHwakIdUz3L5VKVTVjFs+LVTdq7Rqy8AI2UZuKX4hN5B0jwqCsbSbX+3wdehpCYmAAVi
 Wxd/Zyy8/+MtVlDe4WH4YnSToemfENRFDu/xTKpMq6EqLQ7Y2efUwJmtbrymm9dWxJwO
 l24MOkngEO4Rg68a1RnhEgQLDqzxWiQK9JxpSKoM3JsMt44YFIJmUrhReTcGN+dXQRVH
 /nfVIAc6hAd+b5aHBTDYnXMALZRlIVTZZZ9BnrO/7TKOH20QXfXG8juLFnucb7vthHmG
 Cezw==
X-Gm-Message-State: AOAM533N2oYhaIO1ZAxXGx1XjLRdyGHji/r7qACehrQmSPBBcywUTqIv
 k5gUoDeLPoB9Z5wjgmfp5eOsOJsJf84F6tUB9ExErONa8yaSMxIR
X-Google-Smtp-Source: ABdhPJw7DJ5p879SEjOkOdRa1s/ProOZQZOAq4gLiyZmIVrHlYX3uRHghGYGHkSBWIjmKpz+HbaV2AMFQr8JbXwa02E=
X-Received: by 2002:a9d:192c:: with SMTP id j44mr3388615ota.302.1632481581221; 
 Fri, 24 Sep 2021 04:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxDe6hR1V-Lz1k8cdD11jEquy4UhR4LfLhg37E5EG42EJg@mail.gmail.com>
 <67dbec1b-8598-8814-e85e-848b2eb123cf@yadro.com>
 <CAH2-KxDT9DTXp99d+eV-zNinLWhw9ihaHVLNQnVsQtB7X2ZkHQ@mail.gmail.com>
 <a40d7b9c-8fb1-bf5c-1c31-3b426c0f0fa2@amperemail.onmicrosoft.com>
In-Reply-To: <a40d7b9c-8fb1-bf5c-1c31-3b426c0f0fa2@amperemail.onmicrosoft.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 24 Sep 2021 19:06:10 +0800
Message-ID: <CAGm54UGjh9QTAw_mPdPCpZ7WihTHYXRe0m=xCWrPmpvDb99p3Q@mail.gmail.com>
Subject: Re: [External] Re: New test for patches in openbmc/openbmc
To: Thang Nguyen <thang@amperemail.onmicrosoft.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 24, 2021 at 6:29 PM Thang Nguyen
<thang@amperemail.onmicrosoft.com> wrote:
>
> Hi Ed,
> I have 2 questions on this topics:
> 1. I have a patch
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0003-aspeed-support-passing-system-reset-status-to-kernel.patch
> which ported from Intel code. It is to add BMC reset cause to boot
> command line (/proc/cmdline) in which I can check for chassis power
> policy which skip when BMC reboots (does not change CPU status). As the
> patch is from Intel, what is the procedure to make it reviewed and
> applied to u-boot?
>

I have a similar case.
As an x86 system, some of the recipes/changes are referenced from
Intel-BMC, which is not upstreamed.
Currently, we had patches related to UART routing and
phosphor-node-manager-proxy.
The UART routing patches are being upstreamed thanks to Troy.
The change to node-manager is related to the HW design difference, and
due to the fact that phosphor-node-manager-proxy is in Intel-BMC, we
can not really make the patch upstream.

How do we handle such cases?

-- 
BRs,
Lei YU
