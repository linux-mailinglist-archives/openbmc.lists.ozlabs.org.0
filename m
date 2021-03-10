Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 035A53333CB
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 04:23:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwHTy0Kcvz3cS0
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 14:23:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rNZuNK17;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rNZuNK17; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwHTl3h0yz30LZ
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 14:23:23 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id s7so15488416qkg.4
 for <openbmc@lists.ozlabs.org>; Tue, 09 Mar 2021 19:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pO9k/Yd7wfJ8gSwLWlreWCXHuKsW0/5eDcNGNUW+ZsU=;
 b=rNZuNK173Dk+hgnkAaSJXoXtL6XcC1gXVjc43X5Su0+7HKsrUOqac5lylTSfjN863/
 yyr2cPJbmJZZs8T1AykCIk9z8NzmvFnMilq1NxakGqx0Ba1Rq8BXMa4cW/WWrpL2YpQG
 dyAhpGnHdwkWYewLTqe1bjJLULbDXSojYlTojNiDB+2NulAVxC07BPZ7hiikAERD+GWg
 T/9P7UB1kyIZTsktBLpS4y36xKML4zhQDi9TfbZHC9WeXdmAUKVeJUD8jd+tMXIC8V4C
 bwu0xQ1jyfHanG30gwoRMs3M0Ge3YtvV2f2IZnZQjM+zUEnweaa3jB87jhARNuOQnUrp
 sfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pO9k/Yd7wfJ8gSwLWlreWCXHuKsW0/5eDcNGNUW+ZsU=;
 b=NwPs8PZecpk6genr81/bTxWjNf1k9LtyNsYq1edwMyMBPl/MU0ovqIYEpYXJLsHdhj
 UFCZ0NzI+hrZpfR+MvoTTnkyNfsRcntVo0jdLqe3INtsxP7MDWg1DG9tZ2O3pu8Zup5w
 q0uXMPzqvy/PEmHXJiYwwOgcjw3n7FDdaFdbzvmo/xCaEv5PebxfFhlevBeTzooR4t4I
 PdLMat98esLsnZmS4F8BsuUNChhNhTb6ilkK6rDPQBf713lqk7KJBtefg7j7J88cDfhv
 uxURSeP66pWVPzAWaHahrvW+e1LcLPXeT8fKsL+f2EGS2lAUObs9aAZCqm8Dv16dz078
 738w==
X-Gm-Message-State: AOAM533P70uKiCryfowzvjk1yekfaIMrlhFFEqyIvzNEUNhQXxnyK47G
 zNors0Bj4mvw2aMO9OpiMKI9WrxuT7VRqHlgF2A=
X-Google-Smtp-Source: ABdhPJwh14R6V+EkVjBjmbash8DI2tmJ0hErgAidnrcDleUdhOuHGTXnzqhBiQZ8EV7LK2ShS6l/5blNVUDHcHuli3g=
X-Received: by 2002:ae9:f503:: with SMTP id o3mr796094qkg.331.1615346599790;
 Tue, 09 Mar 2021 19:23:19 -0800 (PST)
MIME-Version: 1.0
References: <20210218190654.kkdsmrlxgenzr6nz@thinkpad.fuzziesquirrel.com>
 <CACWQX81HtHCqXZCzmJqppR+tBy5xDjBHa_q5gw7YTHZ9UaAH2w@mail.gmail.com>
 <20210219193348.n5e6w4e2vr4sk5ge@thinkpad.fuzziesquirrel.com>
 <47d61387-d71f-b72a-fe30-316a3a37829b@linux.intel.com>
 <20210301150552.hfwsnzgb5wczdpyx@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210301150552.hfwsnzgb5wczdpyx@thinkpad.fuzziesquirrel.com>
From: George Liu <liuxiwei1013@gmail.com>
Date: Wed, 10 Mar 2021 11:23:08 +0800
Message-ID: <CANFuQ7CaZW6mY11MjYQjk7heq00UuAFgS37JiFBw0WFBCGQNtw@mail.gmail.com>
Subject: Re: any in-progress Redfish TelemetryService enhancements?
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Wludzik,
 Jozef" <jozef.wludzik@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi, Wludzik, Brad:

Since we have some open-issues that need to rely on Telemetry service:
https://github.com/ibm-openbmc/dev/issues/2968
https://github.com/ibm-openbmc/dev/issues/2969

I want to make sure that Intel team will finish it by summer?
If it is, that is great, we will always focus on and participate in
the code-review.
Otherwise, as Brad said, we will come up with a proposal and report back here.

Thanks,
George Liu

On Mon, Mar 1, 2021 at 11:06 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Wed, Feb 24, 2021 at 01:09:56PM +0100, Wludzik, Jozef wrote:
> >Hi, "Append" is on the list of to dos and should be ready till summer
> >(might be ready).
>
> That's great!  Any chance you could you provide any hints on how you
> expect it to be implemented - I'm not sure if I can wait that long to
> get started.  I would like to make sure that if I start working on it,
> it will have your approval from a high level view.  If you have not
> given it any thought, no problem - I'll come up with a proposal and
> report back here.
