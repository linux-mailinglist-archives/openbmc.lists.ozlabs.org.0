Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F141BA556
	for <lists+openbmc@lfdr.de>; Mon, 27 Apr 2020 15:48:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499mMK2kM7zDqZw
	for <lists+openbmc@lfdr.de>; Mon, 27 Apr 2020 23:48:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499mKk51VlzDqW2
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 23:47:05 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Proposal: how to make incompatible changes
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20200424145635.GB26818@heinlein.lan.stwcx.xyz>
Date: Mon, 27 Apr 2020 09:47:00 -0400
Message-Id: <3FD402A3-DEBC-49DF-9AE7-E07C04A964A7@fuzziesquirrel.com>
References: <5532c90e-75e8-4998-b0cf-e65ed9af1424@linux.ibm.com>
 <05835fa0-508f-d3ba-13be-280f4dfc92e4@yadro.com>
 <DA097328-158E-48DA-9F8F-6CD0C7FC4DDE@fuzziesquirrel.com>
 <20200424145635.GB26818@heinlein.lan.stwcx.xyz>
To: Patrick Williams <patrick@stwcx.xyz>
Content-Transfer-Encoding: quoted-printable
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 10:56 AM, Patrick Williams <patrick@stwcx.xyz> wrote:

> On Thu, Apr 23, 2020 at 12:20:53PM -0400, Brad Bishop wrote:
>> at 8:11 AM, Alexander Amelkin <a.amelkin@yadro.com> wrote:
>>
>>> Internally, for inter-process dbus communication the interface versio=
n
>>> could be checked during compile time to prevent problems that couldn'=
t be
>>> detected by compiler/linker automatically.
>>
>> I like the idea of a stable, versioned DBus API.  Does anyone else?
>>
>> In the past there was opposition to that.  I=E2=80=99m not sure if the=
re still is.
>
> Since we're deprecating the REST-dbus path and moving towards Redfish i=
s
> there much advantage to a versioned DBus API?

It helps lower the barrier to comprehension and entry.  Unversioned & =20
unstable IPC APIs are not normal and probably shocking to anyone that com=
es =20
across them.

An unstable, unversioned API encourages bad behavior - e.g. I can just ma=
ke =20
this in-compatible change to the API and fix all the applications at the =
=20
same time.  lock-step dependencies between 3 different projects =20
(phosphor-dbus-interfaces, the client, and the server) is not a good thin=
g.

Put another way - with an unstable and unversioned API - what is the poin=
t =20
of having all these different projects and repositories?  It just becomes=
 =20
one giant monolithic code base.  If that is what we want, then we should =
=20
structure it that way.  Nothing inherently wrong with that, but it seems =
=20
like it would restrict how the code can be used.  Does that bother us?

> Alexander mentioned
> compile-time checking of the interface, but we already have that throug=
h
> sdbusplus.  The issues are:
>     1. Client bindings are not currently being generated.
>     2. Not every implementation is using them.
>     3. We don't have a good mechanism to deal with cross-repository
>        interface changes.
>
> I don't think a versioned DBus API solves any of these, except maybe #3

That's just it - these are the solution to the problems that an unstable =
=20
and unversioned API bring, not the other way around.  It is all work one =
=20
way or the other - we can do something atypical like have an unversioned =
=20
and unstable API, and then write a bunch of frameworks and tooling around=
 =20
that so that it can work.  Or we can put in the effort to have a stable a=
nd =20
versioned DBus API.  I would rather do the latter because that is how =20
people have been using dbus effectively for a really long time.

> but that is only if we're going to write servers that support N-version=
s
> of the interfaces.
>
> It seems to me like a better investment is #1 and #2?

To be clear on #2, use of frameworks is an optional thing.  To get =20
universal adoption of a framework, you have to first get universal =20
acceptance of the merits of the framework.  So I suggest interlocking wit=
h =20
the specific application maintainers before working on #2 to avoid wastin=
g =20
time.

> I'd personally
> like to have #1 implemented by the end of Sept at the latest.

Nice!

> Solving
> #3, I think, requires us to do some CI investment to support Gerrit
> topic-based testing.

Or we can avoid entirely, with a stable, versioned API :-)
