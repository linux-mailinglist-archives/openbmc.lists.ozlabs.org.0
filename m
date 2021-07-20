Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D77E3CFBD5
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 16:16:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTgkW3zNlz3bWM
	for <lists+openbmc@lfdr.de>; Wed, 21 Jul 2021 00:16:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YvVakOre;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YvVakOre; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTgkD63xBz2xfF
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jul 2021 00:16:20 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id i5so36043695lfe.2
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jul 2021 07:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jTVBIBA0omypH2FRgKNKE6Qelif7GcHlqISFRiezRVk=;
 b=YvVakOre3y2udFxIyMgAmHOWsU8OUb44tgzp478SYH416Z6U6CbQt1m6fjJYHkvSFN
 k+l48gpQYsxhlbHXI2FQmuYdGXRScLsZKXP0sfGbXDQy9U8d1kO47Ls3Tpy8/bA8KYj9
 ZK9gcADyx523yaINdbRSAXTzxVIV5Lu2vLMmAEJ9X640NZN1omkuC5hJDoVUSYzUiUQq
 FV1OvbyAAcBwsK20s5u5bHKZgeoxXGdiE9kvz4ecl4UNPxa/FEWHUwAKdv7KD0l9rerZ
 8rtoM/3mrUYsAmx3rGx+3Sn+oPJ0rcW2YiGFjmtqB7IXx1vrzC27Zib/SQMhGjmIg/fx
 JTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jTVBIBA0omypH2FRgKNKE6Qelif7GcHlqISFRiezRVk=;
 b=PzLZsxGiaBsH2cMNcWCCyh0fH4yzyJwT9UMhRLIQxXEeEo/U6xZ5bjQQrFhMUmVdTf
 sX0ZZRdXaFvecAbbx9S5cDb8r8ahvc4EVD96DoADeGigzj0H0Ku5L21BuCM1HpyAs1kT
 r+k4EgiOn5OUekLbObX7iWLkAcYdWZQKY50m1iMqozfwpL2uGVaLMzZVeOJSY1fEKKHq
 iXNtRlP9WiDfqh3mjqEgNuQQAl8U2gebdGMHrFtGiRrqaPX1S4s6sqh8n9ouBj1HBXhQ
 BnDmQBUgImpdErl7eUfwsRPwzDA6SvMJMoFpuDNlumVXDk7JhUlVO1EuGGhfMunAYC3R
 JiYg==
X-Gm-Message-State: AOAM533Sy+/rAZ78XbWloLwYjYXwf3tQqdPItX3XUbrRse1SpEvE0G+d
 136IZoNx0EtiV7U//Bfe5n4=
X-Google-Smtp-Source: ABdhPJwelGJqbCgP7Ts7t+OT1UumfY0ywBCQVlebohtkI6Yx54qPHDZizuxJ4h3RkHVSBGLec5wDLg==
X-Received: by 2002:ac2:4d4e:: with SMTP id 14mr11167710lfp.290.1626790577484; 
 Tue, 20 Jul 2021 07:16:17 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id t24sm2461669ljj.97.2021.07.20.07.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 07:16:16 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 16KEGEO3005281; Tue, 20 Jul 2021 17:16:15 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 16KEGBSb005280;
 Tue, 20 Jul 2021 17:16:11 +0300
Date: Tue, 20 Jul 2021 17:16:11 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Subject: Re: [PATCH v2 0/3] net/ncsi: Add NCSI Intel OEM command to keep PHY
 link up
Message-ID: <20210720141611.GI875@home.paul.comp>
References: <20210708122754.555846-1-i.mikhaylov@yadro.com>
 <20210720095320.GB4789@home.paul.comp>
 <10902992a9dfb5b1b4f1d7a9e17ff0e7b121b50b.camel@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10902992a9dfb5b1b4f1d7a9e17ff0e7b121b50b.camel@yadro.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 20, 2021 at 05:00:40PM +0300, Ivan Mikhaylov wrote:
> > While the host is booted up and fully functional it assumes it has
> > full proper control of network cards, and sometimes it really needs to
> > reset them to e.g. recover from crashed firmware. The PHY resets might
> > also make sense in certain cases, and so in general having this "link
> > up" bit set all the time might be breaking assumptions.
> 
> Paul, what kind of assumption it would break?

The host OS drivers assume they can fully control PCIe network
cards. Doing anything (including inhibiting PHY resets) behind its
back might break assumptions the driver authors had. This bit in
question certainly makes the card behave in an unusual way, so no
wonder Intel didn't enable it by default.

I do not claim I know for a fact it's problematic but it doesn't feel
like "the right thing" so some edge cases might expose issues.

> Joel proposed it as DTS option which may help at runtime.

Sorry, I'm not following. If BMC is fully booted it's able to
configure NC-SI appropriately by a userspace action coordinated with
other BMC tasks. If BMC is not yet ready then we can't communicate
with it via Ethernet anyway. So I can't see when exactly is it going
to be helpful.

> Some of those commands should be applied after channel probe as I
> think including phy reset control.

Do you have any other commands in mind? So far I assumed we're
discussing just the one to mask PHY resets.

> > Ivan, so far I have an impression that the user-space solution would
> > be much easier, flexible and manageable and that there's no need for
> > this command to be in Linux at all.
> 
> You may not have such things on your image with suitable env which you can rely
> on. There is smaf for mellanox which is done in the same way for example.

I can hardly imagine why an OS running on BMC would be using this code
in question and appropriate DT configuration but not having the right
means in userspace to control it. What would be the usecase?

If the network subsystem maintainers think this is a good idea, all
things considered, I'm fine with it. I210 losing link exactly at the
time when you need it (to enter the UEFI interactive menu) is
super-annoying, so probably any fix is better than none :)

Thank you for discussion.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
