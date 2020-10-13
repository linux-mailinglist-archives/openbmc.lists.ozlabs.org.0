Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDF228D718
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 01:41:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9sWw3fYKzDqh3
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 10:41:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b43; helo=mail-yb1-xb43.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=b0IvGvZd; dkim-atps=neutral
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9sW6594pzDqfq
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 10:41:05 +1100 (AEDT)
Received: by mail-yb1-xb43.google.com with SMTP id n65so1085164ybg.10
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 16:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=n0aCH2A+QTkSpZ8rW3CeKzE75DNgKd4BBBtQWAT0hNM=;
 b=b0IvGvZd6sPJ4wk2r5zK4brF0tw0iLMVOa0BVXxmTDEbAoSMT9kND3xTEi8Nz49G1q
 n//ntkHgUt5xI75HEazkNP2Ea0G0/ZZANLFW72IHyV2frG5Wm6x3fHqBCNCXHkKyTLhL
 gF4NMK3p3qQq0ZlJwJhafLLqiUMX0+Kz1ja5KgOxdAw0MCd04hTjqsKH8zAEWf3/JVWq
 1fDhnZ3bCepi3AJZTKs/0qIjvtmvf9PVaW9DwbFHR37LpXQEr1xFCAXtQ7VUYj74bUBc
 72rhT+914Y4Phkl/PFljQ8XwJL9S33jX+sQVzMJ+GgwHd9iU4EjekQMNaCECLuAnPHVU
 /4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=n0aCH2A+QTkSpZ8rW3CeKzE75DNgKd4BBBtQWAT0hNM=;
 b=O9Pg2mVrBRTKh8rTI8rqvB/hzRUudoUUp318Hy1Xjd4U2KoAMEpo+owl7LsTx1bwgO
 tN22aCo7il873tVoxJNNrPsFe+VKSHRaHBZaKXcBtv/A+ZVpPfED37paoSa0W/qZCGpM
 xnMft6iGGDeVn46wh5fMPmUEIt/cwx5LfIRTD6lf3EJ7+UpZfJMSEp6/+ZCU/pm9FOeQ
 xaSW9wbH5IT9LadK1UXhjDI+iuJY/TJSnSz07ns8x6iLXLIjP9P7dOOKwgUPjA8SCdJT
 FFLIT+QlSOKFuB5uBr2hSOF1gPLoj4DC8HmaejTiRBspu4teNNBLKqm/QrzYQ6uKBa3N
 zEYg==
X-Gm-Message-State: AOAM531cic7OjzlmFbnVQEOnVOhZ4Lc0KTaeLNOFkFKei2jhF2VvRege
 UFdcV/g4UGlskj8Vw4jPNHazw0ygMfEymiyisg+rEcAxMCDfiCL4
X-Google-Smtp-Source: ABdhPJzHc0NI6/WSoJJoh8tyembvzE85nyqSO9IxbMZ2JoltwNPUr/3Kf1ayhzR/fvHCQbwLBm/dxowyF7Ax4mfkxnE=
X-Received: by 2002:a25:74d7:: with SMTP id p206mr3178611ybc.170.1602632460780; 
 Tue, 13 Oct 2020 16:41:00 -0700 (PDT)
MIME-Version: 1.0
From: Ed Tanous <ed@tanous.net>
Date: Tue, 13 Oct 2020 16:40:50 -0700
Message-ID: <CACWQX83EqayoG=rW3kt1Ui-+d8KQLLc5kKsrvWLSyCSMEQ0sDA@mail.gmail.com>
Subject: Why not phosphor-dbus-interfaces
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

A week or so back, I got asked why a lot of daemons don't use
phosphor-dbus-interfaces.
https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/36579

This email attempts to answer that question in more detail, and widen
the audience, as well as to set us up for some change in this area.
It should be noted, I don't speak for every author, and I've only
written a small subset of the daemons that don't use PDI.  Bear in
mind, my information may be out of date, and some of these might have
been solved, but what follows are the broad strokes.

1. phosphor-dbus-interfaces doesn't support any sort of task model, or
the separation of requests from replies.  This makes it very hard to
write code that is robust against blocking hardware, or code that has
the ability to handle multiple requests in parallel.  One degenerate
example of this is ipmbbridge, which needs to query i2c before it'll
have the data to return to the method call, and might have 5ish
requests in-flight before the first one returns.  Moving everything to
blocking calls significantly reduces (4X slower if I remember right)
the performance of the bridge, especially in the case where the
spec-required retries and holdoffs are executed.

2. The current mechanisms require that objects publish their
interfaces at compile time.  This  makes it very difficult for objects
that need to support optional interfaces, and leads to duplication of
code.  For example, some lm75 devices might have thresholds, others
might not.  To implement the relatively simple example, Value,
CriticalThreshold, and WarningThreshold interfaces would require 4
different class instantiations, and some way to switch between them.
An example of the fixed-interfaces pattern is below from
phosphor-networkd.  Notice that object is a variadic template.  So far
as I'm aware, there's no way to instantiate that at runtime.
https://github.com/openbmc/phosphor-networkd/blob/ffcba341a893318588afe83e8d767d8c20fd9189/ethernet_interface.hpp#L21

3. Reviews.  Having a single source for all dbus interfaces causes a
bandwidth problem for reviewers.  Many people review the
dbus-interfaces and don't review the reference implementation, which
leads to many arguments that boil down to "See implementation here for
why it's required".  This leaves maintainers hanging in the lurch
getting to review the implementation for correctness.  Combining the
interfaces and implementation tends to make reviews go faster, as more
reviewers tend to look at them.

4.  phosphor-dbus-interfaces has no provision for managing breaking
API changes.  The idea that commit 1 is going to get everything
correct and the interfaces wouldn't need to evolve is noble, but
unfortunately has been proven to not work in the past.  As a
consequence, this causes changes to take a long time to be merged.
Changing the sensor values to Double took a few months to do
mechanically, by merging the implementation changes in a backward
compatible way in asio, but required 2 years before the
phosphor-dbus-interface change was merged:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/11739
This is certainly an extreme case, but smaller examples of this pop up a lot.

5. Inheritance:  Utilizing phosphor-dbus-interfaces requires a
relatively robust understanding of inheritance, as all implementations
rely on overriding methods on a compile-time generated class.

6. Property model: having a getter method for each property makes
implementing pass through clients (clients that don't host their data
themselves) harder, as it means that requests that would ordinarily be
coalesced into a single call need to be separated.  Said another way,
there's no way that I'm aware of to optimize a GetAll properties call
differently than a Get call differently than a GetManagedObjects call.
Having those operations exposed to the user encourages first order
optimizations upfront, and makes inefficiencies very clear to the
reviewer.

6. Exceptions.  Error handling paths for phosphor-dbus-interfaces
require the use of exceptions in non-exceptional cases for all error
handling, which are foreign to a large percentage of embedded
developers, and make it harder to coordinate adding new error
conditions.  They can also generate larger binaries when compared to
return codes (citation needed).  Even adding new exceptions to
sdbusplus has caused numerous bugs over time because of developers
inexperience in handling them or reviewing them.  New error types
trend toward reusing the existing error classes because of the
difficulty in making changes, which leads to less specific error codes
over time.

7. phosphor-dbus-interfaces is another compile-time dependency to add
to each component, and pulls in several other required dependencies
into the build-tree.  These long-tail dependencies make code harder to
build outside the yocto tree, especially in cases where components are
reused by other projects.  In cases where security review is required,
it's also more code that has to be "trusted" and verified to be
correct.  In the current yocto/gerrit review model, this also means
every interface change requires a synchronized bump, which today is
non-trivial.

8. If I remember the build flow correctly, phosphor-dbus-interfaces
uses a YAML file, which in turn uses a python script to fill in a mako
template, which generates a templated c++ CRTP class that can be built
against.  Said flow is much harder to read, debug, and understand than
just using raw template instantiations in c++, as the current asio
interfaces do.

9. phosphor-dbus-interfaces provides false security in that developers
test their code less than they otherwise would.  It's possible to add
new enums, properties, error types, and other things with no review on
the daemons that rely on those implementations or whether those
implementations and errors have been handled.  Having each
implementation declare the interfaces, even if it duplicates the dbus
definitions makes a very clear contract about what that implementation
expects and supports, and forces a reviewable commit when we need to
adjust that.

10. Enums.  So far as I'm aware, the idea of a dbus scoped "enum" is
specific to phosphor-dbus-interfaces, not a generalized pattern for
all dbus usage, which pushes us further away from using "stock"
documented dbus.  I haven't seen a document on the theory behind the
dbus enums (maybe it's documented somewhere I haven't seen yet?).
This causes more developer friction when attempting to compare a YAML
dbus interface to an implementation during development or debug, and
means that any tooling we have is unaware of the enum types.

Negatives of not using phosphor-dbus-interfaces that I'm aware of:

1. Interfaces tend to be under documented, or only documented in the
repo that uses their interfaces. phosphor-dbus-interfaces does a
better job here at enforcing all implementations that are documented
in YAML implement a dbus interface that looks correct.

2. Enum, object, and class parsing code is very....very verbose to
write.  I originally added 5 more "very"s to the beginning of that
statement, but I thought that made the statement too verbose, and the
irony nearly killed me.
As an example, here's a 282 line function in bmcweb for parsing the
dbus memory item/asset/metric interfaces into the equivalent Redfish
struct.
https://github.com/openbmc/bmcweb/blob/72d52d2511bfcb2bdd168a561d16ce2c0dd436aa/redfish-core/lib/cpudimm.hpp#L498

3. There are occasionally functional bugs that could've been caught at
compile time instead of runtime.

4. Unit-test ability?  I put a question mark here because it looks
like phosphor-dbus-interfaces classes were intended to be mocked, but
I don't know of widespread adoption of that, nor any "complete"
example with >90% test coverage.  Maybe a complete example exists
these days?
