Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACB94198F0
	for <lists+openbmc@lfdr.de>; Mon, 27 Sep 2021 18:34:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJ7Wl2lXpz2yPk
	for <lists+openbmc@lfdr.de>; Tue, 28 Sep 2021 02:34:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=NDrxJyfo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32e;
 helo=mail-wm1-x32e.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=NDrxJyfo; dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJ7WN3rWBz2xXq
 for <openbmc@lists.ozlabs.org>; Tue, 28 Sep 2021 02:34:06 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id v127so1028418wme.5
 for <openbmc@lists.ozlabs.org>; Mon, 27 Sep 2021 09:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gDxnHLfuxkQ4WEyMlGg/DWIRyf7CaRY1Bw7q1ypVYNs=;
 b=NDrxJyfoK8i5UVEhCUwjBIPhKT+ZnYKWCy9MKta6Lvx5m90/qSb3F2xQwR330hewfX
 gFjXuQvM7+M11kJVp6YUDq2W+5QrScSnCQPuQnBDsBvAJoSi38Ilqc4pnv99vSfhw8qy
 43dWD5s6MhWAIMzMtrE3FcS2ORVv6dBMHOqZzucTMPBI0/NgtBNARQTvJ3Ep4DVWYg7Z
 GluX8bvIQ/b8ILaBv0YC3IdP5WySlqi3PrVniwe6wtf35Qe8kOH5sj6XDZcssJC/CtQl
 kTwVYVHej1R3FJhm/UcBDqyVRIYG/5rTbQ0EcDImcwH6FT36NvBXGYx3hfGTFO3qKGj9
 yXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gDxnHLfuxkQ4WEyMlGg/DWIRyf7CaRY1Bw7q1ypVYNs=;
 b=m9q4sf+gi0PdWWd1IaeJmJvVwhC125uKkRRVkCqj4I7ZcB/mgjzXHag6vrqF+yTtzJ
 Mg+pCdZSmHYLgpEXaIF0+qIv04QtOsKw5cxB+adHHwULaD55Itrz8+tiZNHuVP5cpGwR
 Jr4lNF7DPTEXHCo2pACfHmTFm+sAvBI0Kf3gNNpfC8lK2DdsMNi4Zb6MUamkHFme3etz
 lahYQTdhOZV3uHpOfcv/XdgxZ9vr5kKM5ju1Hh/xJOUY149v7Dyv0JEJSUqF43GpwCkD
 KXYywKC+h+kyI8wK4nq1k0gqgO1fylO70P1CoV+2n9Bj1aPUg2B+FEIv92MLbvFF7vuU
 1uyg==
X-Gm-Message-State: AOAM53291N4VNyUMLO+4nxFbuDSveu9idVfH1bQt7okElKUBrZlwF+ck
 04NYs5NztbxJwORUwzDEypuWuQwHLGgrtHxFwVNYxQ==
X-Google-Smtp-Source: ABdhPJzF/hDCcxVAX7BuWmN9X4T6hgy1iQx3SMcFhm6PymMZOJaCnP4/ppdv6VTbWsy3OV8bTVW7pLvIRMSvX31/t2Y=
X-Received: by 2002:a05:600c:1d18:: with SMTP id l24mr6800wms.98.1632760438347; 
 Mon, 27 Sep 2021 09:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxDe6hR1V-Lz1k8cdD11jEquy4UhR4LfLhg37E5EG42EJg@mail.gmail.com>
 <67dbec1b-8598-8814-e85e-848b2eb123cf@yadro.com>
 <CAH2-KxDT9DTXp99d+eV-zNinLWhw9ihaHVLNQnVsQtB7X2ZkHQ@mail.gmail.com>
 <a40d7b9c-8fb1-bf5c-1c31-3b426c0f0fa2@amperemail.onmicrosoft.com>
 <CAGm54UGjh9QTAw_mPdPCpZ7WihTHYXRe0m=xCWrPmpvDb99p3Q@mail.gmail.com>
In-Reply-To: <CAGm54UGjh9QTAw_mPdPCpZ7WihTHYXRe0m=xCWrPmpvDb99p3Q@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 27 Sep 2021 09:33:47 -0700
Message-ID: <CAH2-KxBpQbmBAedd63-1KORd9Z81D-gWM7oqQPU05Q=4S5XYzQ@mail.gmail.com>
Subject: Re: [External] Re: New test for patches in openbmc/openbmc
To: Lei Yu <yulei.sh@bytedance.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Thang Nguyen <thang@amperemail.onmicrosoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 24, 2021 at 4:06 AM Lei Yu <yulei.sh@bytedance.com> wrote:
>
> On Fri, Sep 24, 2021 at 6:29 PM Thang Nguyen
> <thang@amperemail.onmicrosoft.com> wrote:
> >
> > Hi Ed,
> > I have 2 questions on this topics:
> > 1. I have a patch
> > meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0003-aspeed-support-passing-system-reset-status-to-kernel.patch
> > which ported from Intel code. It is to add BMC reset cause to boot
> > command line (/proc/cmdline) in which I can check for chassis power
> > policy which skip when BMC reboots (does not change CPU status). As the
> > patch is from Intel, what is the procedure to make it reviewed and
> > applied to u-boot?
> >
>
> I have a similar case.
> As an x86 system, some of the recipes/changes are referenced from
> Intel-BMC, which is not upstreamed.
> Currently, we had patches related to UART routing and
> phosphor-node-manager-proxy.
> The UART routing patches are being upstreamed thanks to Troy.
> The change to node-manager is related to the HW design difference, and
> due to the fact that phosphor-node-manager-proxy is in Intel-BMC, we
> can not really make the patch upstream.

I'm not following why that's preventing upstreaming.  If
node-manager-proxy is something you need on your systems, I don't see
a reason why we would avoid cleaning it up and upstreaming it, but I
have no details on what this patch is, or what it does, so it's really
hard to talk in concrete terms about how to proceed next.

>
> How do we handle such cases?
>
> --
> BRs,
> Lei YU
