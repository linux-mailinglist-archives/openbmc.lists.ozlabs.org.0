Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6BF235842
	for <lists+openbmc@lfdr.de>; Sun,  2 Aug 2020 17:55:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKQZY4lX8zDqQq
	for <lists+openbmc@lfdr.de>; Mon,  3 Aug 2020 01:55:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=fFRuDHEJ; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKQYf4S9mzDqPQ
 for <openbmc@lists.ozlabs.org>; Mon,  3 Aug 2020 01:54:11 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id q16so16692931ybk.6
 for <openbmc@lists.ozlabs.org>; Sun, 02 Aug 2020 08:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=PNzBURBNg2Hm8madqaED2qTOOPT4O5cq5PRyekKE2Cw=;
 b=fFRuDHEJmBDjwcPd7fht9Sf3kwPMh5Fg1aCg9QiMt5TUOZlUL4cSgC+9RrqblJBqJG
 ozmowLGe7psvjGV8Gu7TYnpotg0WUFGUXXQQHw+C4iu+R/SD/GGvCdA6WoL3ucb4PIDD
 Cax3J5xp9RKmLvqAfYl4jbpUVZDyosd7Un54oYLa2+wj4qgcqVEbvv7lJnNh6gAFHeSA
 lW97mQrj+a1GC55O/W220L4Rf/LaX85vfIcd9b45HAaWU1PdXLgeY9HS5C3VJmVjQ+dq
 UeqtrL81UDPDAhBnKwMUXLfMJvOn46726UBiwF3doToSILQRdsVaQHvpd9wvV4PBhg2w
 vLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PNzBURBNg2Hm8madqaED2qTOOPT4O5cq5PRyekKE2Cw=;
 b=btRE8KO1jPAnwktVOqjbAltz/nUxdZti1ULRnyywHgt4CM8/PVYwOumBjdCb8fuiuc
 2K1BQOaIuRV5Hjxbio4fpqqxenZWGjUFNYD36gWE6XTXRwJlYoFtN1qozTH+0XTtAUgP
 91t3XYC9Zlf2zB0n72sgWjr7Kox024FyNMDoXwBF3tYh6iKgVUzItLws3lpSQc3OOzbT
 Wo5ovJAjU6hXDn4e91qJH17u/89TB/s+VqJBY+5DhSpNdfRY5qaxZcN+qJ2d/kTDRFbw
 fl01+j6XjkzbWUd+3rfk+apzV+eecQ+vQJFoSug2fHF/s3LrwpHXxHfOPNtimoGQdV5T
 s8WA==
X-Gm-Message-State: AOAM531SasQqVPG3tVwJOVcwzLfO5PXQompzBAupB6tLB5I0bw51iBUH
 hQ+s7MB5YIUqXnp3ZE5SyMhxCGmq49YVKa3AIbSnoymPt8lPTw==
X-Google-Smtp-Source: ABdhPJyXDjVaCFjpW72A5iiucdu8+ZpgONCzrQO1SWEwGYOls08Iq/y66hR5Mq/pu/cnQLG9Gn4oHjNRY1mXTVdklj8=
X-Received: by 2002:a25:d48e:: with SMTP id
 m136mr19634166ybf.148.1596383646697; 
 Sun, 02 Aug 2020 08:54:06 -0700 (PDT)
MIME-Version: 1.0
From: Ed Tanous <ed@tanous.net>
Date: Sun, 2 Aug 2020 08:53:55 -0700
Message-ID: <CACWQX82sSvONiMq53s39P42Sky5C+GsvLGyN42xvKUYSGHjyrQ@mail.gmail.com>
Subject: Recent architecture breakages to bmcweb
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

I'm looking at a couple recent changes to bmcweb, and I'm finding a
significant architecture problem has been injected.  Namely, it's
these innocuous looking 4 lines here, which injects the socket adaptor
into the request object for use later.
https://github.com/openbmc/bmcweb/blob/30c58d581606b4484757e6ee9133c248de1514a6/http/http_request.h#L18

The problem with this approach has a few roots:
1. The Request class is meant to model a single request, single
response model.  Adding the stream semantics breaks this in pretty
significant ways, and forces a hard dependency between the streaming
adapter and the Request, which was not the intent.  We have
abstractions for "streaming" requests, but that was seemingly not
used.

2. In the code that existed before this, Adaptor was a template on
purpose.  It is designed to implement the std::networking
AsyncReadStream and AsyncWriteStream concepts.  This is designed to
allow injection of Unit Tests at some point, as I've talked about
before.  Hardcoding it in request to 2 forced stream types, based on
the compiler flag is incorrect per asio standards, and removes the
ability to inject arbitrary adapters, like test adaptors.  Also, the
flag used is incorrect, as it's possible to inject a non-ssl socket
even if SSL is enabled.

3. There is already a precedent and pattern for streaming interfaces
in bmcweb that we adopted from Crow.  If you look at the Websocket
request response type, it implements a way to request a route that
streams dynamically.  Frustratingly, part of what this was used for
was SSE, which I had already written a patch for that didn't have any
of the above issues, and only hadn't merged it because we didn't have
any SSE routes yet, and didn't want to check in dead code.
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/13948

4. It opens the possibility for lifetime and possible (at the very
least harder to audit) security issues, as now the "http server"
component is no longer the only thing that can own sockets.
Previously, the server owned the sockets until handed off, then there
was no shared ownership between the websocket class, and the
Connection class.  The Connection class could be completely destroyed
(and memory freed) while the websocket was still connected and
running.

Moving to another track, you may ask, how did I come across this and
why does it matter?  I'm trying to add 2 new features to bmcweb.  The
first allows opening multiple sockets, and dynamically detecting TLS
streams on them.  This allows bmcweb to handle both HTTPS redirects in
band, and handle the case where users type in something erroneous,
like "http://mybmc:443" and connect to an SSL socket with a non-ssl
protocol.  In those cases, we can simply do the right thing.  It also
allows bmcweb to host on multiple ports, which might be interesting
for aggregator types.  More importantly, it cleans up some of the
Adaptor abstraction to make way for unit testing, and being able to
inject a "test" socket, that we can control the semantics of.  I'm
hoping eventually to be able to mock dbus, and mock the TCP socket,
and run a full Redfish validator run in a unit test.  I think that
would save a lot of time overall for both committers and consumers.

The first of these patches is posted here, and simply comments out the
above problems for now.
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/35265

If I look through the commit logs, it looks like Ravi and Appu built
the two small subsystems that rely on the above abstraction, one for
SSE, and one for some NBD streamer.
What do you two think about the above?  Was it something you
considered when you wrote your patches?  Would you consider fixing
them?

  My recommendation would be to move both of those two over to
something similar to the websocket abstraction we have, with, on
connect, on data, and on close handlers.  This means that handlers no
longer take a hard dependency on the transport, which will help for
both unit testing, and if we ever want to support redfish device
enablement (which relies on an i2c based transport). The SSE one can
probably be used more or less as-is from my old patch.  The NBD one
might need a "Dynamic body" type, which beast already has an
abstraction for that seems to have been discounted.

What do you guys think?

-Ed
