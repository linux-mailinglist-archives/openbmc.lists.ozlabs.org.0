Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8753312CD
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 17:04:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvNST41xKz3cR9
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 03:04:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=W01HBC0F;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=W01HBC0F; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvNSF40Pxz3cKT
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 03:03:54 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id 133so10656930ybd.5
 for <openbmc@lists.ozlabs.org>; Mon, 08 Mar 2021 08:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lBMIDOvoN4EOZ8/bvEkiikMKVOQfy/u36FnB+Jtku6c=;
 b=W01HBC0FO93OArriL9EljyuRT8ias3CaneZCtwLHN/hzPiWjU2E1Is7Q1DdZlEEj85
 kP2WEeMk0ijwwAw3n9pWWz+UyNV/jbJa7A22T5/RmL8LZWBKyuiSXdl/sINZ1AREMKvq
 4uzJUvkHz4MZ126oInUFTAsPq7Vio7pr6qZBJWqiw9NHRpK3Q+kLYz3EEOkAOr1qWSD5
 PB36v74xYJc2k7tNa1B0CWjKD2Y/dMq9wIWqeJdtbjZXJYllLikZNb4gSstsYOb/wKso
 91JdA3D5+jzXFqsSFxMwmsn3JpUwJSVlrC3vN5mRWIBfglDWGBV2THyOCLPFVND+3v5H
 sJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lBMIDOvoN4EOZ8/bvEkiikMKVOQfy/u36FnB+Jtku6c=;
 b=AIALBcYSQq1NfLrdXfZRu15VXQPRwZtrjg2R3HsSrcBVG+uWJzhpNMdDcdUqHl3B9K
 qdpguRJ3NC4k0Xos6MIHKWYSRCrSNaVeJHZ3QtfKFU9nYUahQ678c4jeZt+ae1ALOnnl
 t+y73B9N97esGrt8hN6z8LNejDpNTEv77Dg9f52IdRLwzw0ZjseugwswYiKpngiJAJd8
 833uqicpIJiNOa2YD6aP6TZGkvrwKzFaFJEbiHPAd5e5Bcppf0r5dnIpZOkPWj6pgDd/
 hr4BWsk+28kcNZk4wTiI723KLkVC0XAEi/ezV8T51nOw0tOKIpY7ORfhgwk5gGCBgYeB
 3Gjw==
X-Gm-Message-State: AOAM531KS0jY1Sp+dulMpnghAYYVqBewOn3SVGiJ1HIT6/07LdLAQbyI
 6MvKe6gLYRCEwRqZuHkkqeC5co0Z8XGKXJXFqMeC9Q==
X-Google-Smtp-Source: ABdhPJzGFqQP3VkP4oujOITX4YgcSKNq/G0CFe7WAPkHSjbgFy7IUJYumt1wAROqDycx5op3+Iac1QTUTN7+DsMzGFU=
X-Received: by 2002:a25:e695:: with SMTP id
 d143mr37196556ybh.148.1615219430959; 
 Mon, 08 Mar 2021 08:03:50 -0800 (PST)
MIME-Version: 1.0
References: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
In-Reply-To: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 8 Mar 2021 08:03:40 -0800
Message-ID: <CACWQX8048sDqehYaRAS9-T8G8ffWgLo-1fOVsozAC=4TtJdFqw@mail.gmail.com>
Subject: Re: Request new repo for IBM-specific code
To: Joseph Reynolds <jrey@linux.ibm.com>
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

On Thu, Mar 4, 2021 at 7:15 PM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
> What is the right repository for a new Linux-PAM module to implement an
> IBM-specific ACF authentication?
>
> The access control file (ACF) design was introduced to the OpenBMC
> security working group and is described in [IBM issue 1737][] and
> further explained in [IBM issue 2562][].

Could you describe it in a design doc?  Implementing ACL seems like
something that's going to affect a lot of the system (at a minimum
every outward facing client).  Unless you really think that you can do
this with no changes to the client repos or phosphor-user-manager, it
seems like it's worth discussion.  For what it's worth, I really don't
want to branch the authorization code in bmcweb depending on what
company compiled the code.  They were hard enough to get right in the
general case, and matter a lot for security.  The likelihood we get
them right for every flavor of auth that a company might want to do
seems unlikely.  If we as a project need an "ultra user" that seems
like it shouldn't be specific to IBM, or should be a generic
configuration that IBM systems apply on top, using common routines.
I've already detailed a path toward this in a previous email on this
topic.

>
> Note the [pam-ipmi modules][] are scoped to the OpenBMC project because
> the IPMI implementation is shared by all of OpenBMC.  By comparison, the
> proposed ibm-pam-acf module is intended only for IBM Enterprise
> systems.  The intended implementation is based on standard cryptography
> techniques and could be developed into a general authentication
> solution, but the ACF is specific to IBM in terms of its exact format
> and content, and I expect it will only be used by IBM and its partners.

Have you released the specifications for this file format with an
appropriate license?  That seems like a good first step to figuring
out if these could find a home in OpenBMC.  If you've already done
that, could you link them?

>
> Can we create a new OpenBMC repo for this?  Perhaps ibm-pam-acf?  Or
> should this go into some other repo?

Could you please post the code you're planning on putting there
somewhere that we can see it in gerrit?  I suspect that would help
review whether or not a new repo is warranted, and probably give hints
as to what design you're planning on implementing.




>
> - Joseph
>
> [IBM issue 1737]: https://github.com/ibm-openbmc/dev/issues/1737
> [IBM issue 2562]: https://github.com/ibm-openbmc/dev/issues/2562
> [pam-ipmi modules]: https://github.com/openbmc/pam-ipmi
