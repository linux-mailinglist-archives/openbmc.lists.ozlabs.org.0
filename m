Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A336D2F6BC7
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 21:07:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGwN765QJzDrR7
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 07:07:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42b;
 helo=mail-wr1-x42b.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Utc1x9Ai; dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGwLZ33H3zDrQt
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 07:06:26 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id t16so7076254wra.3
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 12:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4aH2KozjcrSus/IbipcoFzeK0lzWTrQuASDXva1PcbI=;
 b=Utc1x9AiGAA3Wec2OB5JlQCcS07rbR4VVEUYbew5wPuAl1NPcj1qg8x4rE1xKPIvmi
 6aejmcVS0ylAEM83tEIpGqrM30UlEaxxmHPM3e9z83N3BnFy0KqS/jPTXqZS3KrjtD7G
 zGt5ohVosKRNdozRpGhuu/9GjPLRlfpmj+xE2l2TNlvWZLQ0JyXXLrKrNvc9eTnr5qE6
 RY8qclUoSiZBjVkGRel9YYupPqES8i0/hry4VsGSANX3iyFIMYSMh0JfLx63h7XfNwq7
 nQfHNLVvytg5pEL2NJY5gvFTOGgp2d0EVRFE6Tt+gC76FblX5k2hMOyisCMlB3KKMMSn
 DWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4aH2KozjcrSus/IbipcoFzeK0lzWTrQuASDXva1PcbI=;
 b=faE+BtY7BcaLN/ZgFGh+3WTzlwJVLg4DgzinW7CRhugH4JHWYyIFgvxuAzm1JYqHo0
 hifl1YmHoEjYQ3CeZf4IyieluAS3BC3Pe4m165EXzetrZVeBJZFydThG7CY6dj7qBnaI
 bxHG56+AFWN9fuUAeYkG9Bs20HJVhVgp9LBZ2+Z8POwGRpyEHP+7Uu6bguBNOqVwY0DE
 0wK2QaGWk6OQcKT0JJ7WQ/1If2E1gp3nRAucCjCSZj2KlI2LXC9yZQv53cnph2sQ1DVD
 Zl2belgxL4Sj8lFwCCpkhRb70IPfG93cSZv32ss4jLBHkQxwm+NoMupIsNLK7hBe+IxG
 UN8Q==
X-Gm-Message-State: AOAM5302Ta1GqJv8bxjihggPM5cQoUYSuA7RpmFmgJsMl5xGAtwhrPzh
 rWIeFaFrhdOxZuMzAE+qwVOtaJU0gVGENjxbdCR6zg==
X-Google-Smtp-Source: ABdhPJz9xwdNhqnhYLlYPzjsP6wJGwaeyJG4ABCbXIVhSbnXh3x8U1w3kqq4g5D7KttXgmwFFqiyJ0zpTsFKH1Y/x2M=
X-Received: by 2002:adf:a551:: with SMTP id j17mr9501018wrb.217.1610654783737; 
 Thu, 14 Jan 2021 12:06:23 -0800 (PST)
MIME-Version: 1.0
References: <CAHwn2XkNiz7rZzn9RbpZCaUM8HD0HO+mJTD9D2ENc_p+SsmXHg@mail.gmail.com>
 <20210114143909.jf3vbk7zhxp3iguv@thinkpad.fuzziesquirrel.com>
 <CAH2-KxBgmEmfeQxsbTa1RPVO_nm5=G+ayZ9aDM+1hf7oRtoDGA@mail.gmail.com>
 <20210114173805.GB45289@mauery.jf.intel.com>
 <20210114194026.ejf2fa3zhuqfdom4@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210114194026.ejf2fa3zhuqfdom4@thinkpad.fuzziesquirrel.com>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 14 Jan 2021 12:06:12 -0800
Message-ID: <CAH2-KxDQwSn3Dnfo95LKGVtb_hhF-O1NEXz0bVL+YyxTZHsm9w@mail.gmail.com>
Subject: Re: Intel-ipmi-oem repo
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
Cc: Willy Tu <wltu@google.com>, Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, chunhui.jia@linux.intel.com,
 apparao.puli@linux.intel.com, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jan 14, 2021 at 11:40 AM Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
> On Thu, Jan 14, 2021 at 09:38:05AM -0800, Vernon Mauery wrote:
> >On 14-Jan-2021 08:38 AM, Ed Tanous wrote:
>
> >>Would people prefer it to be a package config on IPMID to select between
> >>the two implementations?
> >
> >I don't have a problem with a package config to select sensor
> >implementations.
>
> This seems fine to me too.  I looked and there are non-POWER users of
> the fixed sensor id implementation too so openpower-ipmi-oem probably
> doesn't make good sense.
>
> >I would say that if IBM is the only company using the sensor
> >implementation that is currently in ipmid, it would be best to move it
> >to the IBM OEM layer. But it is difficult in a project this size who
> >is using what.
>
> 'grep yaml-config' of the openbmc tree gives a pretty decent indicator
> of who is using the fixed sensor ID implementation.
>
> -brad

It's been on my list for a while to write a script to go build at
least rudimentary ported entity-manager configs for the existing
hardware in the tree.  I'd asked James to write this a few times in
the past, but as we know, we all get busy.  This is just to say, it's
on my radar to try to try to make this better.

-Ed
