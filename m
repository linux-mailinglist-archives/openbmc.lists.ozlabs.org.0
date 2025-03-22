Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EB8A6CC2C
	for <lists+openbmc@lfdr.de>; Sat, 22 Mar 2025 21:20:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZKrKP1Bsfz3c8G
	for <lists+openbmc@lfdr.de>; Sun, 23 Mar 2025 07:20:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742674820;
	cv=none; b=hm7pmFtkdRBTypk8pfdx7SSQS5yl0TyVtMCzsNuCSpkoCh1X+3OlttXgcsBGzAwnbFrLEsZ0oo+PY0VTdR4pN1uSaHVis3Hf7UDzSMNn93Re8i1zhdgZev6LxBkaPwGFvtRYNx8EDwy1oUpJLXYDvW26xgNHXDfxMxWeVcLV/zAIFjpqwKm6tl1J3lOjISI6PWiYU+deP2s8JCFpsjYPSpEEOvrGyfLXqlr7JHOjzKrfP6Yjp9cPwHNu4p+2TXYDjhZRJyiJBfgadABwnmsbDp7pkxbjvMYoSznMgzXogPOcnQMHOpYZkjNEhyGf9PFdBNJOaMOlJ4KJYGjCQ5gdEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742674820; c=relaxed/relaxed;
	bh=7rg21qd0V+z87/c4Aa0HxHj8O+jTAJZ+zQx5fPHSH7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0/O/oKZGZLmtCgrZYhjSoa8zmRvOCJPr3fYrfnee/S6I0ZsWttqXJLupMgjYfRcSsRoz/VAECELNaq/xw2QRu/ZouD+TWx2ruC5iyZss0vmUTruifj/5Lf/vHZs+iBp3j5JUFSJq3J+Gm8cOgrnD7eVhwOH4X5luFLdYgSMGEIzy4FWBWoAJr1j7/N0fCUIsX3ZARjt8W6cU0vD6nPvzfPBA57xFjF4v6Of0wr0zn5GBRN9C/l3CjUC6PpqYro4hqOw1/LeCu3su5fmHS/Km6QGGe3V0SNWd4fDoUScxU8EbfebywnbVbNs5RQ5PYrbWrzNOBuMyPUd4FtdlNKqlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nbB2f760; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nbB2f760;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZKrKH0GBGz2ySJ
	for <openbmc@lists.ozlabs.org>; Sun, 23 Mar 2025 07:20:18 +1100 (AEDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so25693951fa.2
        for <openbmc@lists.ozlabs.org>; Sat, 22 Mar 2025 13:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742674812; x=1743279612; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7rg21qd0V+z87/c4Aa0HxHj8O+jTAJZ+zQx5fPHSH7k=;
        b=nbB2f760WwN2TVFfVRVajVAGRXaa1QBFZWmluKFOa+d8WXrewKlu3foVTXIvu0ziWD
         M5o+z2FnY8XvGC+mmoXO8g52y6lDQhWUH+3EwXzRTAW0O6aMZxvcxQ2L9mgG3xuQD94b
         R9eTSggk93vDuLj+syK3ruycAuK5s/6UI4zchldujdkKyO0yvx1X4k8EGNsLsQAUFavA
         8FWjneGoEGRDB9ceNhovX3FhG4Oz46MBaYrKlEkHGrOXGRfu7GmJcpgsgEgCxXmqGo0T
         UK47Q8KYiFtRkQXGynX8Oj/uZoZop8YGUehqNMLIVx+qWo8PNhmO/UTk8Q4HIa1leR9I
         p7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742674812; x=1743279612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rg21qd0V+z87/c4Aa0HxHj8O+jTAJZ+zQx5fPHSH7k=;
        b=ZEF5uMrQnfZvNa5Oi90BignXNlu+pArmy+iK7s00mV5b7YClAaaJq5tyIhO3xLz15k
         x83oC3ouQKYIQG1M7VC/sDN72Pm8eFhawF8eqA2m3iMZI668/UeRuO0YLYyCrboIlClE
         diLbaIdOSynF6RNzSm7TCSU8DHpMKdLM8dt0hgZDk/jAQSXNUgyKqjHrbaG0t8BE5ZoA
         Elfhz7TQgpjbZnIlJzpZPJXrlpTLjo0bOvn1PaWtWHgyM0G/CRvg/6IfJSBtiZggtnDB
         9/wNv4JmXFZp5/D6pFLV0QRzCa076YMyEdMvu8LGxkjjC7pmTExmcRTUeTf2RuyJTPJi
         48cQ==
X-Gm-Message-State: AOJu0Yyp55F0KKKKeYZXcYR2RJtSy5h5yYLluChal7kXJ67Qk8tQGIgH
	5DUo2Vouz+qEzJs3OY2FvY1zKQ+3SVSUsygHIqssDxuFyOvPyXNAXLsIJA==
X-Gm-Gg: ASbGncsxNJ/CVwlpB+qpj9MpvSl1KOr4CJdUAokK1envRYW7rmhUpgivf7H1KDCCtHI
	KKk/udZZkBukI5B1V5K++icj7hcZgNmrOVfDlvVX+i88SoJjPk/s0o1aoCBzRIivLR46NgESj/6
	NOm2pFcrKxjXPWQbXKaOMFDGPohpOhJo2w3Am452jn0E7Fozu+EWan12FLWI57obFl3YQV/Mljo
	PsIrY61cSKe5gINCjYp6ZxpMAVbMBuIwI7Rf3XrSWKKa5MkG8Vcl6zAFHH0MDycAqgGsgJCNpA9
	Ym/1PWR5YWUVE+Nb95kGidS6e9u9Ep32R1zaxMksBRdqhw+xJyIVWyKZQAk=
X-Google-Smtp-Source: AGHT+IER+bqMPhJEk33eLqTfu0gEsgyc1JM3umvVgwLbRvDW1xvQIB7KJaLwytHRc+L0qvWd2nx5dg==
X-Received: by 2002:a05:651c:1544:b0:30b:c96a:750 with SMTP id 38308e7fff4ca-30d7e20310fmr29079151fa.1.1742674811791;
        Sat, 22 Mar 2025 13:20:11 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7e1615sm6718121fa.45.2025.03.22.13.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 13:20:11 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTP id 52MKK6ZU007817;
	Sat, 22 Mar 2025 23:20:07 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 52MKK6X8007816;
	Sat, 22 Mar 2025 23:20:06 +0300
Date: Sat, 22 Mar 2025 23:20:05 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH 2/4] net: phy: marvell: Allow targets to skip MII RX/TX
 errata
Message-ID: <Z98bdd2GIxONrPpm@home.paul.comp>
References: <1982610042.19586749.1742574604453.JavaMail.zimbra@raptorengineeringinc.com>
 <Z92lMNqRcWrdmMrS@home.paul.comp>
 <Z930epdwnOw+9DkR@home.paul.comp>
 <709373445.19801813.1742664263471.JavaMail.zimbra@raptorengineeringinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <709373445.19801813.1742664263471.JavaMail.zimbra@raptorengineeringinc.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

On Sat, Mar 22, 2025 at 12:24:23PM -0500, Timothy Pearson wrote:
> > On Fri, Mar 21, 2025 at 08:43:12PM +0300, Paul Fertser wrote:
> >> On Fri, Mar 21, 2025 at 11:30:04AM -0500, Timothy Pearson wrote:
> >> > Upstream-Status: Pending
> >> 
> >> Pending what exactly and why? I guess you're supposed to send your
> >> series upstream (to Linux devs) first, then after they're accepted you
> >> can ask for backporting them to OpenBMC tree. There're exceptions but
> >> you need to provide a rather convincing reason for that I guess. I'm
> >> not saying that in any official capacity, just as a sidenote, Joel
> >> will clarify if I'm wrong.
> > 
> > Huh, it wasn't at all obvious to me that your patches were meant for
> > U-boot, not Linux, sorry (and you didn't specify that in the
> > subject). There slightly different rules apply, but in general my
> > comments should all be still relevant. Overall impression I got is
> > that you're adding a bunch of hacks and that most things about them
> > would need to be heavily reworked to become digestible for upstream. I
> > hope more experienced developers will correct me if I'm wrong here.
...
> 
> I am assuming that new OpenBMC platforms can be merged into the
> U-boot tree here vs. upstream U-boot, as upstream doesn't fully
> support the ASpeed device?  When I attempted to apply and test to
> upstream, there was a lot of missing code and it wasn't clear at all
> that the result would ever be bootable on typical OpenBMC hardware
> designs.

It looks like like the current state is that people send patches like
[0] and [1] (notice the subject line, recepients, informative commit
messages etc), then it gets synced to OpenBMC by changes like [2],
then probably it used to propogate to Aspeed [3] (interesting how they
have a much newer branch but everybody is still stuck at v2019 one).

To get a general feel how U-Boot is dealt with in OpenBMC community
you can check [4].

[0] https://lore.kernel.org/all/20250117094434.16641-1-tan.siewert@hetzner.com/
[1] https://lore.kernel.org/all/20240718152853.1291804-1-potin.lai.pt@gmail.com/
[2] https://gerrit.openbmc.org/c/openbmc/openbmc/+/73075
[3] https://github.com/AspeedTech-BMC/u-boot/pulls?q=is%3Aopen+is%3Apr
[4] https://gerrit.openbmc.org/q/message:u-boot

HTH
