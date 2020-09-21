Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 381AF2731E1
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 20:26:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwCZd3BhNzDqW8
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 04:26:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=vnAX0zWp; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwCYX5896zDqTn
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 04:25:49 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id 67so10986477ybt.6
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 11:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z5n1ceKjZULBhBzQvW6c53jRw9OJ9vke0ECoz8vkdgU=;
 b=vnAX0zWpWqo6qrNMOedK2MgvvggT6fDNVkyORQ7v65LTlYu/mCKFgbe93ws8ZmzvDn
 nDxZgPuBqNtsi5A37RHktlSAglfqa2rBI7irjpLEe9uER6eWi+dQv9TvgtA91nX6nPUO
 1P1R1Vdj5qekTJusX05TxkxvYIymsU5XqspEarURltPEAXmpY/Kj6+sTsZ1aHysKyQMW
 OyXv/ddXtvkQMYbc76gFnEbDuFzu4fqGkkUKTtTD9OHQjYQsAiqAKtKBx+49y1w4g3kv
 kfmnRAFz7vbO8C92L5AK49i98R95XkC9a5sLOkSR/ZYE5YGWcQbmMS9DRoFDXxMOJ17k
 WpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z5n1ceKjZULBhBzQvW6c53jRw9OJ9vke0ECoz8vkdgU=;
 b=ZMFNb72vGpjKhx8TfRm8krMnKnwg3cRhqU3HxlHJ/wTg2PrDCQlH9qZUQpbDX3A1Vp
 muCS99nPBOynr80wtYoWuXd7qs9EBB8j4+uGdbdtVL1VaVZKxm2nKBBIDvzZGqHvITra
 U8AUOKw9b/w1Alhu2dTwAOrADSlC+1alWW0qRzHXMqH7SE6L/gOjMuRcJiFZKCU/vv46
 Cv3p7b/SZ8Hj+slH24ZKVw2ln6rY1qGZhSHkXLJCfJAZQWvrGznVVeqC+f+hD1fcri54
 VmL/RSRmUoYBopxdky7xP0g4rgzP9khUBmXWAp0bUt/hOiNX/D/UpkUV+BD7LkYb+7Hx
 1BYQ==
X-Gm-Message-State: AOAM530Kkmjy720yTBjT1h9Bd7qmfX6i8caZUExAPjPFRvnk92WF2sV3
 BWxxUAd2L6n+luXMdwkqV7Dsf+m4GEdJkbmQy2ru6MWfJ7eZAg==
X-Google-Smtp-Source: ABdhPJy9UtlxtXvtl1Y2nRt/LHk1ZCy8b8RY3LZUQymU8wY8Y0dhglmxyigB3F1HZyaLxQM7CNf5GdYXI/oKUEplLck=
X-Received: by 2002:a25:ef03:: with SMTP id g3mr1549535ybd.340.1600712745659; 
 Mon, 21 Sep 2020 11:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
 <CACWQX80tELWA-EW0A8-DnJGFmJyMxDC04YTq4B+--bRaoV8rOQ@mail.gmail.com>
 <20200921125540.4d6amvus3wt57igg@thinkpad.fuzziesquirrel.com>
 <CACWQX82i4k+PADJkOjDQEeUAQJtve+pySLRQVcqR7XayG5cJCw@mail.gmail.com>
 <20200921175227.zmdjbmixbwvstd4m@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20200921175227.zmdjbmixbwvstd4m@thinkpad.fuzziesquirrel.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 21 Sep 2020 11:25:34 -0700
Message-ID: <CACWQX82EdUFtBDK6Vt=-CKyKxN9WFdFGX_j8mhBbNDScxf7OaA@mail.gmail.com>
Subject: Re: interest in a minimal image recipe
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Sep 21, 2020 at 10:52 AM Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
> On Mon, Sep 21, 2020 at 08:53:26AM -0700, Ed Tanous wrote:
> >On Mon, Sep 21, 2020 at 5:55 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
> >>
> >> In what way does EM require intel-ipmi-oem?  I am using EM without
> >> intel-ipmi-oem without (I thought anyway) issue.
> >
> >You're running Entity Manager, without intel-ipmi-oem, and you can run
> >a successful "ipmitool sensor list" or "ipmitool fru print" command,
> >and have it return the entity manager/dbus-sensors/FruDevice results?
>
> Ah, now I understand.  No, I can't do that.  But I don't need to because
> the default IPMI handler implementations in phosphor-host-ipmid work for
> me (the YAML based ones), and those don't need entity-manager.  I'm
> using entity-manager for other reasons.

That makes a lot more sense now.

>
> As an aside - I think a majority are using the intel-ipmi-oem handlers
> now so I'd support moving those into phosphor-host-ipmid and using them
> as the defaults.  But that must not be easy, otherwise Intel would have
> just done that rather than forking the handlers in intel-ipmi-oem in the
> first place.

Yep, although I think it's a solvable problem to make it an
image/distro feature.

>
> But in any case, intel-ipmi-oem requires entity-manager, not the other
> way around right?

Good point.  I never thought of it that way, but you're right.

>  The "feature" being selected here is the Intel IPMI
> handler forks, and that would simply depend on entity-manager.  A
> strawman:
>
> obmc-phosphor-image.bbclass:
> FEATURE_PACKAGES_intel-ipmi-handler-forks = "packagegroup-intel-ipmi-handler-forks"
>
> packagegroup-obmc-apps.bb:
> RDEPENDS_packagegroup-obmc-apps-intel-ipmi-handler-forks = "intel-ipmi-oem"
>
> intel-ipmi-oem.bb:
> RDEPENDS_${PN} = "entity-manager"
>
> One prerequisite to this is that the intel-ipmi-oem recipe would need to
> move to meta-phosphor.  Perhaps its time for the repo to be renamed into
> something else.

Yep. That looks like what I would expect.

>
> >In my understanding, this shouldn't work, and we've had many reports
> >of "I enabled entity manager, and my sensors don't show up in IPMI".
> I don't think the answer to "how do I enable IPMI sensors" was ever
> "enable entity manager" was it?  To enable IPMI, you have always needed
> to enable either the original YAML based handlers or the intel-ipmi-oem
> forks.

That's a really good point.  We really ought to model features as
outbound interfaces that drive internal RDEPENDS.  Ideally nobody
would be appending entity-manager, they would be appending
intel-ipmi-oem (or whatever name we pick for it in the future), which
would have the correct dependencies on entity-manager.   I like it.
