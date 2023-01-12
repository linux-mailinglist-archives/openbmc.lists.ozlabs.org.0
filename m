Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6826667F1
	for <lists+openbmc@lfdr.de>; Thu, 12 Jan 2023 01:40:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nsm194vYjz3cBh
	for <lists+openbmc@lfdr.de>; Thu, 12 Jan 2023 11:40:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=jnTQV01C;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=jnTQV01C;
	dkim-atps=neutral
X-Greylist: delayed 494 seconds by postgrey-1.36 at boromir; Thu, 12 Jan 2023 11:39:55 AEDT
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nsm0W6mxkz3c7C
	for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2023 11:39:55 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id E93105BB
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2023 16:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1673483497;
	bh=xXrBeiaz/1wX6zZNeoRADL4WYzOdCExBYAJnVWl7dhw=;
	h=Date:From:To:Subject:From;
	b=jnTQV01CeEGKjdB4IANxDT01N4NwabHyp40O53xEuq2ytxfLdEpiW6IY4Y53K4Jq5
	 NFDjqGaM793wXza1i/XSBKurxIPRO9vkCGYUxiTWLX6T5PX1WeGQBEdmtt9Mbr+f8T
	 Gsf4kkcyQxg7lXLTc9FB+KAva3VzvUWvHr4W9mds=
Date: Wed, 11 Jan 2023 16:31:35 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: dbus-sensors, present and future
Message-ID: <Y79U52toP0+Y4edh@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

*deep breath*

Alright, strap in -- it's a new year, how about some new approaches to
things?

Diving right in:

## The dbus-sensors status quo

I've dealt with dbus-sensors code a fair amount over the last couple
years or so, and at this point frankly every time I consider wading back
into it (particularly the config-walking parts...which is a lot of
it...but also the other parts) it fills me with feelings of dread and
general despair.  I can't speak for anyone else, but overall the code
quality makes working on it tedious and arduous enough that it actively
discourages me from doing so and I find myself looking for excuses not
to.

There are two main recurring, pervasive issues with the codebase as a
whole that I keep stumbling over and not really feeling like I have time
to dig in and try to address properly (and I fear the depth of the
rabbit holes): a lack of proper data structures, and rampant code
duplication.

#### Data structures

Not having proper purpose-built data structures leads to much of the
various daemons' most heavily-used data ending up internally represented
with nested `{string: {string: variant}}` maps and such, which (a)
throws away most of the advantages of using a statically-typed language,
and (b) makes the code really awkward and tedious to read and write.  It
feels like dealing with python, only with a whole bunch of additional
boilerplate overhead tacked on because it's manually reimplementing a
lot of stuff the interpreter would be doing automatically in a
dynamically-typed language.  Stringly-typed code in dynamic languages
isn't great, but stringly-typed C++ is the worst of both worlds.  (It's
not all strings in dbus-sensors, strictly speaking, but json variants
are similar in effect -- or sometimes worse, if the value you're looking
for in the variant is a string-encoded int, say.)

Readability suffers a lot as a result of this; I often end up spending
inordinate amounts of time tracking down just _what_ a given map-key
string somewhere really represents (dbus path?  sysfs path?  sensor
name?  dbus interface name?  dbus property name?  who knows!).

#### Code duplication

There's a lot of code duplication between sensor daemons.  Most of them
have large chunks of code that are...say 50 to 95 percent identical
duplicates of similar code in another daemon (e.g. the various
`createSensors()` functions).  Comparing them often turns up small
discrepancies that make it hard to see what commonality could
potentially be extracted and deduplicated; sometimes it seems like the
differences might not actually be semantically significant, but it's
often hard to tell (especially with the general code-readability
challenges resulting from all the strings and variants running around
everywhere).

I'm not fully aware of all the historical details as the codebase
developed over time, but it seems like a decent fraction of the
duplication stems from having so many cases where a new daemon was
introduced to handle a slight variant of the basic "read things from a
sysfs file" model instead of devising a way to support that
functionality as an extension or generalization of some other existing
code (hwmontempsensor, psusensor, fansensor, adcsensor,
intelcpusensor...).  The kernel's hwmon subsystem does a bunch of work
to make lots of different kinds of sensors behave in pretty much the
same way -- then we basically ignore that and handle them all with O(n)
separate daemons, each with their own bespoke codepaths implementing
essentially the same logic.

At time of writing I believe the number of extant dbus-sensors daemons
is 11, but more appear to be on the way:
  - amperecpu: https://gerrit.openbmc.org/c/openbmc/dbus-sensors/+/45334
  - redfish: https://gerrit.openbmc.org/c/openbmc/docs/+/58954

(A gpio sensor daemon has also been proposed, but was rejected:
https://gerrit.openbmc.org/c/openbmc/dbus-sensors/+/45997)

The amperecpu daemon exemplifies the problem -- for the amount of
Ampere-CPU-specific logic that it actually implements, there's a *lot*
of duplicated boilerplate code.  (Let me be clear that this is not at
all intended as a criticism of Thu's work on it; it just seems like the
inevitable result of the current state of the codebase.)

#### The whole (problem) is greater than the sum of the parts

While the lack of data structures and the code duplication are two
distinct problems, they're unfortunately fairly entangled and reinforce
each other in a positive feedback loop -- each one makes the other worse
than it would be on its own.

One could attempt to address the lack-of-data-structures problem in
isolation, but the duplication problem means it ends up being an order
of magnitude more work than it would be otherwise.  Conversely, any
attempt to address the duplication problem is made much more painful by
the difficulty-multiplier of the data-structures problem and the
resulting lack of comprehensibility.

## A (proposed) path forward

Given the above, it seems to me like the problems with the dbus-sensors
codebase are broad enough and sufficiently inseparable that a serious
effort to address them would amount to rewriting a very substantial
fraction of its code.  And if that's going to happen...[warning,
controversial opinion incoming]...why not take the plunge and do so in a
better language?  (You can now probably see where this is going.)

This of course started as an "I wonder what that would look like" sort
of sketch, but then one thing led to another and it snowballed.  While
the cliché-ness of it is irksome I'll admit (sigh), I've ended up
rewriting a decent portion of the functionality of dbus-sensors...in
Rust.

#### Rust v. C++

I'm admittedly not a Rust guru -- it hasn't been anything
insurmountable, but there's definitely been a degree of grappling with
learning the language in my use of it thus far.  That said, I'm not a
C++ guru either, and given the languages' respective safety guarantees
(or lack thereof), Rust written by a non-guru seems much less risky and
bug-prone than C++ written by a non-guru.

Despite extensive use of C++ smart pointers, we still get bugs like
github issue #20 [issue-20] and the one fixed in commit 1f8479730521
[bugfix] (and looking at other repos, also things like use-after-move,
e.g. things fixed in bmcweb commit 618c14b4d77b [bmcweb-bugfix]).  Rust
just doesn't have those, ever (assuming no `unsafe` foolishness, of
course).  That's a *very* big win, IMO.

[issue-20]: https://github.com/openbmc/dbus-sensors/issues/20
[bugfix]: https://github.com/openbmc/dbus-sensors/commit/1f847973052186e08245737f1241669240f7407c
[bmcweb-bugfix]: https://github.com/openbmc/bmcweb/commit/618c14b4d77bd89c6b2e421bce0576e357b5a33b

One of the trade-offs of that is that code can be a bit more challenging
to write -- getting things to compile can be a little tricky at times.
But because a successful compile precludes large, important categories
of bugs (some of which might be quite subtle and easy to miss in C++),
reviewers no longer need to be on the lookout for them, so it ends up
easier to review.  Considering that (as in many open source projects)
demand for code review in OpenBMC tends to significantly outstrip
supply, lightening the code review load on our maintainers seems like a
good thing.

And as another nice-to-have unrelated to safety: while Rust's built-in
async support is not without it's flaws, overall I think having native,
language-level support is *much* nicer than than having to shove
everything into (frequently nested) asio callback lambdas.

To be clear, I'm not suggesting we start rewriting OpenBMC's whole
userspace; dbus-sensors just happens to be the component I think most
warrants it at present (of the repos I deal with regularly, anyway).  I
would definitely, however, be in favor of at least (in some
semi-official way) *encouraging* new repos to use Rust though.

#### omnisensor

For lack of anything better, and because I've opted for a single-daemon
approach instead of one per sensor type, my overgrown-proof-of-concept
is called "omnisensor", and its code can be found here:

   https://github.com/zevweiss/omnisensor

It's about 3700 LoC (by `wc -l`, including a lot of comments -- ~2600
code lines according to `cloc`), and currently implements basic support
corresponding to hwmontempsensor, psusensor, adcsensor, fansensor,
externalsensor, and intelcpusensor (for the new upstream peci driver,
which currently dbus-sensors doesn't support).  It doesn't presently
offer the full complement of extra amenities that all of the counterpart
dbus-sensors daemons do (like hwmontempsensor's iio support or
psusensor's event-handling logic), but most of the core functionality of
each is there.

At the micro scale some of the code is in places admittedly a little
dense, perhaps, but (while doubtless I'm biased, having authored it
myself) at the macro scale I think the overall structure is fairly
cohesive and provides the flexibility and extensibility to accommodate a
variety of different sensor types with relatively little added code.
While my systems don't actually use it, I implemented the 'external'
sensor-type backend as a demonstration of supporting something very
different from the others (which are all sysfs-based).

I've aimed for thorough error-checking and reporting throughout (Rust's
type system helps a lot here), which would hopefully make things easier
when testing & developing E-M configs (and just provide a more robust,
stable daemon).  Also, many of the aforementioned comments are rustdoc,
which `cargo doc` handily processes into some nice, pretty, cross-linked
documentation pages (temporarily hosted here for demonstration purposes:
https://thorn.bewilderbeest.net/~zev/tmp/omnisensor-docs/omnisensor/).

Because it's what tokio defaulted to when I first started playing with
it, it's currently using a multi-threaded async I/O runtime, meaning
there's locking involved, which is a bit unfortunate.  The type system
ensures that it's not vulnerable to data races though, which mitigates
that downside somewhat.  (With some work it could perhaps be
transplanted onto a single-threaded runtime, though I haven't looked
into that seriously thus far.)

With all features (sensor-type backends) enabled it currently produces a
2.0MB binary that xz compresses to 533KB.  Bearing in mind the
functionality caveats mentioned above (so not a perfectly
apples-to-apples comparison, but for the sake of some ballpark numbers),
the corresponding dbus-sensors binaries total 3.8MB that xz compresses
down to 689KB.

Testing things is of course tricky -- of all the supported hardware, I
only have a small subset of it available to test with (as I suspect is
probably true of any one individual or organization).  That problem
would also apply to any major efforts to improve the state of the
dbus-sensors code in situ, however; I don't think it's an obstacle
unique to this path.

#### Potential future & integration

Yes, it's a rewrite; as we probably all already know, rewrites are bad
[spolsky].  However, aside from my general opinion that the current
state of things with dbus-sensors is dire enough (and the benefits big
enough) to merit it in spite of the downsides, there's also the
significant mitigating factor that the modularity of both dbus-sensors
and omnisensor means that it wouldn't have to be an all-or-nothing
transition.  The two could easily coexist peacefully, managing disjoint
subsets of a system's sensors according to each one's compile-time
configuration (which dbus-sensors daemons are built and which omnisensor
sensor-type backend features are enabled).  A gradual transition would
thus be easy to do one sensor-type/daemon at a time.

[spolsky]: https://www.joelonsoftware.com/2000/04/06/things-you-should-never-do-part-i/


So...thoughts?

*runs*


Zev

