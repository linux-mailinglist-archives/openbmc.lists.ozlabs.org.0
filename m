Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4281435966A
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 09:31:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGqYp18Btz30Kb
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 17:31:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=Y2T6uGsV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::336;
 helo=mail-ot1-x336.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Y2T6uGsV; dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGqYW3d4Nz3004
 for <openbmc@lists.ozlabs.org>; Fri,  9 Apr 2021 17:30:53 +1000 (AEST)
Received: by mail-ot1-x336.google.com with SMTP id
 s16-20020a0568301490b02901b83efc84a0so4800674otq.10
 for <openbmc@lists.ozlabs.org>; Fri, 09 Apr 2021 00:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xlRLj71rw7eIAG0daheHHgTZzmLhxh1kCQS/incJqtU=;
 b=Y2T6uGsVFvRKgVenlJvOk+FEFglA+4ajXpBiU7AlNlLlSgHOToMSoepPR9gikPxk4v
 txvQwfss+249wnXma2dI/2a6npw+EyeFr0vY4VuarixrYEKxkgz4e55gqyEbtFYioQs7
 aoO1MQKOkLw0dnnNGDeRgA1tsU+fGCB/Q6CRzw5a7vyZDfYXpxmHj5ANXRrQDzwHv5s5
 SPJ7Wgp008D+M9G6vmykf8LzqFn/gi5pN3S2q1Onilf91jgQn4yV0+KcLrDfNkRtqw/t
 p62B6E0qyQcY9BklbZ26dzcKOvFerWeB3SHr8m4X+Ao+ZAJ8CmvJJwvfoBca/3U5zPhB
 /mMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xlRLj71rw7eIAG0daheHHgTZzmLhxh1kCQS/incJqtU=;
 b=AY/+c8FTbJy9MJ5fXucT328Nq29BTMmVWkay12nPb2IJTM99iau2yKCTIuizxDft8v
 tGU9pddh2mjxt5g4iyYejeLUejP7RyngjrJN+ettI1oI6BhA0t5Y86GHaNyFh8vrGshI
 xqWhZ9KmnOuar4mmRIo6PXm74s+FsGXwdgt5kaikOgOVlB5V5iAzc4RbRAQRzxiLgwPx
 DCSjq4KSfBnLmqKNnMdqElU0AqqA7MFsLdUp/YKvkSzoSK6vvPuMMZgZ+A9QNYEOETHT
 aV/RqYDz9k2WnY2ckYVEyedIMXh3l3V1oWke/lIP4Fa/mi8iIPxCfkiPVKzXKJh4MjRl
 KEyA==
X-Gm-Message-State: AOAM530eqDP5AGOPemR0y5WIFM5sJpipbvUpQBAnh1Q/azlLpwPGUnie
 rvQ1txXuPV5mGrsZYD++pgwMUnbDoIcZS7Ho8eJkVplKPshNL55XIG0=
X-Google-Smtp-Source: ABdhPJzrONuERGP6o7RTjLj2fqWuE4Cmkxd9Nech5oPxhcZdYdGI7nAqwejrtKVW6bZ24SzOgZQ7MSG3HU4Sxzya7LU=
X-Received: by 2002:a9d:5f15:: with SMTP id f21mr11298136oti.226.1617953449568; 
 Fri, 09 Apr 2021 00:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <gmu36wVnmbV9lyt9EpYcnZmnPwjF9wtDS0N8K0jOk9UR2uUO0QwQaackzJRPLjil_ZqLxTzX3qEMGl3IE6baoIpS-xh9aMnQL3VkAyXK6KU=@protonmail.com>
 <nGEUmLQrNSqmytvShVUeFvOUKjW1cOTYv9Hrcmj7LyP1rfIdLOt8f7IkqzPKaXHZXHRGYtHBcjnt6Qo5c1fIw4doEmVwMmGI2e2rNhNXWZw=@protonmail.com>
 <5bcbc6b0-b9d3-a002-0f24-97bd91ba5bf8@linux.vnet.ibm.com>
 <36bafa0b-5dd3-6da5-b18d-847ee4a46459@linux.intel.com>
 <CAGm54UEc9DOGZS0LLhFMP4SNw_-sJ2oa146wXfYvmF3As4xXsQ@mail.gmail.com>
 <axfftQgj4Du8QvWHD4CHEuPSLSJGtLZZTzpZplCpN1Mu63yr4Xm1RiZTuewl3CNqPUZ8mrmZdJsEJUOQiL39Ft64mfW7DzBdLrkDLhylGiY=@protonmail.com>
 <CAGm54UHGr+F-vnO69PLr0MN699BDEDsZiHYoX1WPmF1DZnQLVw@mail.gmail.com>
 <2FVxBtO4gLzVYqZqGL8XwOcI2a_r6x0CaPGmGozxe_VeNp3Y3y05vSntyZPvfn4EDRsHsLjWJnrVSzbeeVDKhPvLILmFKB3hw-MFaEvepAw=@protonmail.com>
 <CAGm54UFX9LPHArj-2q=w2pNtwgpkjZJE_0Dgd3_8cXB9z3L2vQ@mail.gmail.com>
 <iLDkk0KnZ0UufxY54elPTZxzhBfLP6TM3JvJ-yIqJoON60n3r8wNXPPbZIEOolJybm41D2yeFVRhSCk_WJNiwZ6kfcu5TmSSPuUEBJOy8mU=@protonmail.com>
In-Reply-To: <iLDkk0KnZ0UufxY54elPTZxzhBfLP6TM3JvJ-yIqJoON60n3r8wNXPPbZIEOolJybm41D2yeFVRhSCk_WJNiwZ6kfcu5TmSSPuUEBJOy8mU=@protonmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 9 Apr 2021 15:30:38 +0800
Message-ID: <CAGm54UH9zcS5Z2XAqVH201dV2q8zukKqy7S0t73Jc-YLkqFyFw@mail.gmail.com>
Subject: Re: [External] Re: IPMI SEL Parsing
To: rgrs <rgrs@protonmail.com>
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 8, 2021 at 8:39 PM rgrs <rgrs@protonmail.com> wrote:
>
> Hi Lei,
>
> I am still getting "undertermined system hardware failure" in ipmitool sel list. Do you have any platforms to refer to (in upstream)?

We will try to upstream the related changed to
meta-bytedance/meta-g220a in the near future.

>
> ipmitool sel also list only 10 logging entries and rotates after that. Is it expected?

Please see Lotus Xu's reply, there is a configuration argument in
phpsphor-logging to set the max entries.


-- 
BRs,
Lei YU
