Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C4B246EC4
	for <lists+openbmc@lfdr.de>; Mon, 17 Aug 2020 19:36:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVh6j5q0gzDqXK
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 03:36:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=q9h4LX5z; dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVh4F2X9BzDqW5
 for <openbmc@lists.ozlabs.org>; Tue, 18 Aug 2020 03:34:20 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id e187so9863436ybc.5
 for <openbmc@lists.ozlabs.org>; Mon, 17 Aug 2020 10:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=T0cL/Y5e8lCMCTxJNFc0jIgE/NnpNRilz+z021wwlGA=;
 b=q9h4LX5zP08phfp1BCXRVJCTsmRT7Z1eI9xR2Rp40+Lb/ou3YIbaJhSj5prDeGdxqn
 pfQQuwOxQDVljKbGOfzhMELotagBdzE+Tf/wMyMld+h3O9EuDqfASSHso7FFiqVcvK9M
 UyCgZhu2ei0yjYdiiBlakmBd8VikJl0QWDRv1QcCUGfdtbiGrE7tKG57+vH8v3l2gp75
 4m3UYHEDSWLqEdcyRl5vRN+4UIdflKScv/J3YzsXO0cMXGZeGqW2e8ejBFJock4/olXg
 7Rctr4nfJ4qaEq4hrp/k922wXwNgtJeHYDEQm7c3AjL9NGMLbFo0Ut53Ps78e+sdwtYA
 tSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=T0cL/Y5e8lCMCTxJNFc0jIgE/NnpNRilz+z021wwlGA=;
 b=H5pmZePznzsA717BnxtyZSIfzH33sNcK41EH/pn4Kp5+UmZnhmNjvzl4sbNgIejotT
 BL1Xp4MTNWfpvF4OY9jXjMwmxRjADkfT40CMy0blq67gVjt05GcYXPN/RCbAhuBpM3Qy
 vjcSJrf89J8b2aJGZCvSbabEbIK8Q13kuOsQUWs7MM9lRLnNevSJMj/vN5vnmVou1vz3
 ZZlc0WnC+UaSjpNt7tFnOj/uPju7FCFFb6NXLb52tkdRCGJ8buwU4hm+/ItphFi5rngP
 60wzvlTelXNoVDjSvRO1jlCbfvODCtGbq4m/Xif3wOFPFQzk5TZ0bSezN7ZHB41Hl6HO
 m9ZQ==
X-Gm-Message-State: AOAM531IGgZDOqwyYN1XvjaWzHpboAklmdMrq8IYtSdSTsSHe32Ithgb
 S2morrI/7rtENe8ZVNK8q05yJx50Ypky6aU5RlUgcqWIILmMjQ==
X-Google-Smtp-Source: ABdhPJwe8jLWwNUxAqv4PmNDTAlOgfLFolHHh5rxalcYNNxww5Bkih/xAiCUDrVPBPO5nvwUSod2CkBtvXfj31yndlI=
X-Received: by 2002:a25:f304:: with SMTP id c4mr10532549ybs.209.1597685654023; 
 Mon, 17 Aug 2020 10:34:14 -0700 (PDT)
MIME-Version: 1.0
From: Ed Tanous <ed@tanous.net>
Date: Mon, 17 Aug 2020 10:34:02 -0700
Message-ID: <CACWQX833imTWQxB2hDvzVo5mTQzggAVEieZf4TV8mu=y2uPajA@mail.gmail.com>
Subject: webui-vue first impressions
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I got asked a question in a bmcweb code review that I feel like
deserved answered in a larger forum.
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/35457

"Ed, what would it take for you to switch to using webui-vue?"

What follows is my first impressions on an answer:

1. size parity with phosphor-webui.
On the current master, webui-vue has a 40% larger binary footprint
(614kb vs 440kb) and is still missing features that will add size.
Lots of bmcs run on 32MB of flash, so every kb matters, even if it
doesn't matter for the newer platforms with eMMC or larger SPI flash.
webui-vue needs to sort out where that extra heft came from, and
eradicate it.

2. A more thorough list of deficiencies in comparison to phosphor-webui.
There's a "feature parity" list on the readme that makes it seem like
it's closer than it is in practice.  In the course of writing the
patchset above I found that webui-vue doesn't support Mutual TLS,
doesn't support CSRF allow list (a security feature), and doesn't
support the "next" url forward.  None of these are listed in the
feature parity list.  Considering that's just what I found in the
initial look for the above patchset, I'm guessing there's more use
cases that got overlooked.  If we're dropping use cases, we need to be
explicit about it, and document why.

3. Chunked payloads
While Phosphor-webui opted for a single, very large javascript bundle,
webui-vue opts for multiple chunked bundles.  In phosphor, this single
bundle was done on purpose.  Chunking works great for CDNs and
multithreaded webservers, but tends to cause slower page loads when
done on a bmc, as bmcweb is largely optimized for single connection
single client single request.  Although it's able to handle multiple
clients and multiple connections, the bmc NIC tends to get "starved"
of bandwidth for other things, which can cause performance degradation
if you have lots of things going on in parallel.  I'd recommend going
back to the old paradigm, unless there's a good reason to chunk from
the BMC.  Note the bmcweb router holds all static routes in memory
under the assumption that there won't be very many of them.  With
chunking, that's no longer true, and probably causes some unnecessary
increased memory usage.

4. A more stable migration strategy
The changeover to vue got started completely from scratch, and got
mixed with DOM changes that functionally changed the UI.  If this was
to learn vue, and build a toy UI, that would've been fine, but the
fact that it's now its own full repo means we have fork problems, give
that there is no stable and specified bmcweb->phosphor-webui
interface.  It would've been relatively straightforward to move
phosphor-webui over to vue, by keeping the existing DOM, CSS, and
layout, while replacing the templating and router with vue, but the
decision was start over completely from scratch, and now openbmc has 2
"official" webuis.  I probably missed the discussion on why a hard
throwaway was needed here, but it seems like a series of patches that
ONLY moved over to vue would've been much easier to manage here for
the community as a whole, as each step of the way we can verify
feature parity when reviewing patchsets.  As is (ignoring Kathys
patches for a moment) there are 4 patchsets open for phosphor-webui.
Is there a documented strategy for who is responsible for moving them
over to webui-vue?  I didn't see anything written down, which leads me
to believe there's no plan.

5. Missed opportunity with Redfish UI
If you're going to build a redfish first GUI, it seems like an
opportunity where we could've used the CSDL definitions to drive and
build a lot of the UI automatically.  Given that phosphor-webui
doesn't do this today, this wouldn't have kept me from using
webui-vue, but the idea that the UI can simply build itself for the
"easy" stuff would be a massive win on productivity, and would
probably make me more personally inclined to go help sort out 1-4
above, as I think the end would justify the means.  As is, it takes a
very similar "hardcode every page" approach that the phosphor-webui
did.

Don't get me wrong here, I think all of the above can be fixed, and we
certainly could have a great Vue based webui that works for everyone,
but right now, the rather arbitrary "the project will stop supporting
on angularjs on X date" doesn't ring that important to me.  Javascript
frameworks and modules go unsupported all the time, and we're using
several "unsupported" modules today to no ill effect. Theming is a
nice feature, but those are mostly DOM and CSS changes, and are
unrelated to a changeover to Vue.  Translations was attempted in
phosphor-webui in the past, but to quote the review:

"neither any clients nor any companies wanted OpenBMC translated."
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/17582

Also keep in mind, I have very little seat time in webui-vue, the
above is mostly first impressions in response to the ask from Gunnar.
Overall, if the above can be fixed, I'd probably move to webui-vue.

Thanks,

-Ed
