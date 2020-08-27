Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFB6254E0C
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 21:13:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcspK12zQzDqlK
	for <lists+openbmc@lfdr.de>; Fri, 28 Aug 2020 05:13:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=iOh2UeQM; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcsnX13GqzDqhb
 for <openbmc@lists.ozlabs.org>; Fri, 28 Aug 2020 05:13:01 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id h20so3147543ybj.8
 for <openbmc@lists.ozlabs.org>; Thu, 27 Aug 2020 12:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=PHjRuKySC5Cx9BxJtd0MEJZ+tdmV0AfRINgRfr7emlw=;
 b=iOh2UeQMo8RTyqxSRGOc+Vc+QpO7qDMJqPz0G4VdUBOlX7/qYO+o226YjnE8BiwiUt
 5tu2Q3n4y+BNkeBeWvB3odSxvZsF0Yoie5PMSJcEGQp0f1w5dwkZTSVbbVcOb2If9Vxx
 ffgpIijXv/M9IsTJDm9FE0O7se0z630OTlxvNDbunHx5IHpvfqajdmjTXkYlaM+JqsrM
 m/CLMhCXH4IWXee6TGFMUB2mq3AiypHzXk/NgAxekVlHj1ujrv6/lxtr3ydYZwF5HXHg
 eMWZy/5ny/x1ntkPbmYpbU48GnJcxrCeA2M+secD6Y5sdv4KQBAL7Z8aeW9wn+q4aff0
 S20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=PHjRuKySC5Cx9BxJtd0MEJZ+tdmV0AfRINgRfr7emlw=;
 b=HorZws9BRTiMIqkUym+XVPz/RNwNqQOCZWNphq6DUJpj0oQpjCubHBFEN06PoZELfQ
 5vkwbd/qj3EtGnrQF6f2V6XvyEQiR1UXbRWeI3awWyczUNqemQ5o4yF3KmwrgHzAwY8B
 0YzGvDZ+KXrbzIwZg3u/VmHhsMhXxODqVbM3eiusMfeVvzdSGQgsOYb+LC012gfih8IR
 PBBbi/F6ACYU/23cVprivGD48uPPpTH47uoGzT3nsFMyxAhON3pokPCTn5BEfXq7yIdn
 JY21b8JOCGv0P9L+Cc7x/UOIAAodCWMdoRLBK+k+TdUouroH2NB+TYV/LLcRvysXtekd
 9JjA==
X-Gm-Message-State: AOAM532ELhMmHhKenQyZ0kpynmtvehsL1dhYH+6hqN+tkmsPXWrkDv2z
 B8xVPya2iuHUOWELomVlSSNoMpy4QPqOXRjB0L70BA==
X-Google-Smtp-Source: ABdhPJzezg3koRKu5DV1FMHQ8KZAjY0167+kA5My51QEBT7MpohhMQLikEua361thZ1WK6iLOPB7VomWbJwMAcwuXCw=
X-Received: by 2002:a25:d98f:: with SMTP id
 q137mr27776566ybg.480.1598555576975; 
 Thu, 27 Aug 2020 12:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <CACWQX82sSvONiMq53s39P42Sky5C+GsvLGyN42xvKUYSGHjyrQ@mail.gmail.com>
In-Reply-To: <CACWQX82sSvONiMq53s39P42Sky5C+GsvLGyN42xvKUYSGHjyrQ@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 27 Aug 2020 12:12:44 -0700
Message-ID: <CACWQX82=j3QiYotB1ynOor=HkuMEmyDxa=aNr7_uGwkfuFXJaA@mail.gmail.com>
Subject: Re: Recent architecture breakages to bmcweb
To: James Feist <james.feist@linux.intel.com>, apparao.puli@linux.intel.com, 
 raviteja28031990@gmail.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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

On Sun, Aug 2, 2020 at 8:53 AM Ed Tanous <ed@tanous.net> wrote:
>
> I'm looking at a couple recent changes to bmcweb, and I'm finding a
> significant architecture problem has been injected.  Namely, it's
> these innocuous looking 4 lines here, which injects the socket adaptor
> into the request object for use later.
> https://github.com/openbmc/bmcweb/blob/30c58d581606b4484757e6ee9133c248de1514a6/http/http_request.h#L18
>
> The problem with this approach has a few roots:
> 1. The Request class is meant to model a single request, single
> response model.  Adding the stream semantics breaks this in pretty
> significant ways, and forces a hard dependency between the streaming
> adapter and the Request, which was not the intent.  We have
> abstractions for "streaming" requests, but that was seemingly not
> used.
>
> 2. In the code that existed before this, Adaptor was a template on
> purpose.  It is designed to implement the std::networking
> AsyncReadStream and AsyncWriteStream concepts.  This is designed to
> allow injection of Unit Tests at some point, as I've talked about
> before.  Hardcoding it in request to 2 forced stream types, based on
> the compiler flag is incorrect per asio standards, and removes the
> ability to inject arbitrary adapters, like test adaptors.  Also, the
> flag used is incorrect, as it's possible to inject a non-ssl socket
> even if SSL is enabled.
>
> 3. There is already a precedent and pattern for streaming interfaces
> in bmcweb that we adopted from Crow.  If you look at the Websocket
> request response type, it implements a way to request a route that
> streams dynamically.  Frustratingly, part of what this was used for
> was SSE, which I had already written a patch for that didn't have any
> of the above issues, and only hadn't merged it because we didn't have
> any SSE routes yet, and didn't want to check in dead code.
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/13948
>
> 4. It opens the possibility for lifetime and possible (at the very
> least harder to audit) security issues, as now the "http server"
> component is no longer the only thing that can own sockets.
> Previously, the server owned the sockets until handed off, then there
> was no shared ownership between the websocket class, and the
> Connection class.  The Connection class could be completely destroyed
> (and memory freed) while the websocket was still connected and
> running.
>
> Moving to another track, you may ask, how did I come across this and
> why does it matter?  I'm trying to add 2 new features to bmcweb.  The
> first allows opening multiple sockets, and dynamically detecting TLS
> streams on them.  This allows bmcweb to handle both HTTPS redirects in
> band, and handle the case where users type in something erroneous,
> like "http://mybmc:443" and connect to an SSL socket with a non-ssl
> protocol.  In those cases, we can simply do the right thing.  It also
> allows bmcweb to host on multiple ports, which might be interesting
> for aggregator types.  More importantly, it cleans up some of the
> Adaptor abstraction to make way for unit testing, and being able to
> inject a "test" socket, that we can control the semantics of.  I'm
> hoping eventually to be able to mock dbus, and mock the TCP socket,
> and run a full Redfish validator run in a unit test.  I think that
> would save a lot of time overall for both committers and consumers.
>
> The first of these patches is posted here, and simply comments out the
> above problems for now.
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/35265
>
> If I look through the commit logs, it looks like Ravi and Appu built
> the two small subsystems that rely on the above abstraction, one for
> SSE, and one for some NBD streamer.
> What do you two think about the above?  Was it something you
> considered when you wrote your patches?  Would you consider fixing
> them?
>
>   My recommendation would be to move both of those two over to
> something similar to the websocket abstraction we have, with, on
> connect, on data, and on close handlers.  This means that handlers no
> longer take a hard dependency on the transport, which will help for
> both unit testing, and if we ever want to support redfish device
> enablement (which relies on an i2c based transport). The SSE one can
> probably be used more or less as-is from my old patch.  The NBD one
> might need a "Dynamic body" type, which beast already has an
> abstraction for that seems to have been discounted.
>
> What do you guys think?
>
> -Ed


It's been 3 weeks and I haven't gotten any replies to this pretty
major architecture break.  It also looks like it can also cause a
memory leak in HttpConnection here (found by code inspection here).
https://github.com/openbmc/bmcweb/blob/ebd459060ea4f42761402dd54acd0962c36136c2/http/http_connection.h#L351

I've pushed a revert to remove the features in question.  I would love
some comments from the developers that caused these breakages, so I
can make sure I'm doing the right thing here, and I'm not completely
off base (or that you intend to fix them, and this patch is
unnecessary).
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36038

Thanks,

-Ed
