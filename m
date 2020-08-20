Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC71724C2F9
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 18:09:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXV3K1RD7zDr4d
	for <lists+openbmc@lfdr.de>; Fri, 21 Aug 2020 02:09:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=O+umVYHC; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXTxY6zTczDqqW
 for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2020 02:04:49 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id y134so1401078yby.2
 for <openbmc@lists.ozlabs.org>; Thu, 20 Aug 2020 09:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZpYo/bSCpKlje1BB8xtHHcq6Y7dEkQOtTLZEWXpjWtc=;
 b=O+umVYHCxky0Y8BL/cksW4/okDm52sFidUgQtNHjUkvQeC/C7GJNA5aE3DUQakdpyy
 juPVTBHo9agYbY1BS7ipI8CiiwJxiaZLCZpOHuzo3qfznncTMK9QI233wy+9FiUIZ9d+
 9E5nDVRubfTP8k6jC6Z0SIce2mrW+ZxtiZMTmW2v7yPwWvp7pgclb32+C5Gy2j5JNpwL
 fUyMv8V2t6pwOjaUnXYPgybX7X0aGvcvMgxbQgAqg4Kawc88DdSjJg3nvJ1XhM3RgVmY
 xSPDkuVI+ceUMK8hPUJz69I7nsRXMgFFU7PJLK9aimBDqbPEvRvBYyZvPLU/bF8MS2cn
 7gDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZpYo/bSCpKlje1BB8xtHHcq6Y7dEkQOtTLZEWXpjWtc=;
 b=P3Vw+1AulhyIPPgG+cKwPdaMuamGZd4BT2t8FB1TXfltyffHBaprfYsTUhGvaIv+jn
 iHIf3IBWZXm00eWI7q56wNrPrup9gL/2NKqO0TT54524fbBVtI8cmVtFiJPtVmw1cKvx
 O7dUrEdP6e3UCgQGbQDqZ9ye4ivQMYu18vCvjvhvdaRZedR0K85C6px37wPwtL0NVYT6
 Y9v7d5OXTw38F0in+QFjHXLkFjeR4ETLDN8YlNdBGdWht1i5IyF8CSMjrd7bnuMNIlDe
 CB+zcH0uJSyZNl8BulgpCHl+AWWrWVXVgBKOJT6kghnb54ovEq9rRT/9pADjZ3ROdE7W
 1o3A==
X-Gm-Message-State: AOAM533FS2in98jrNlL8j37JlkGt1tCh0FGr16w1aNC0vIJxKlLnENpl
 ZrNQ2Ut2J2710WhjGR4pAvc8nvfdfI8qMrEqM5yI5uRVqvgy0ECz
X-Google-Smtp-Source: ABdhPJxfb6ijVCuH9h8hv6pqxUfR9JVsSm2SCs7wXcZeo7m+n+VZpM5CMAvy4aezMpBnTaBrhqXBHmHP2zP+DfTirl8=
X-Received: by 2002:a25:d48e:: with SMTP id m136mr5982351ybf.148.1597939485059; 
 Thu, 20 Aug 2020 09:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <CACWQX833imTWQxB2hDvzVo5mTQzggAVEieZf4TV8mu=y2uPajA@mail.gmail.com>
 <ac6a1c05-19fe-8437-ce50-c35ce88f19a1@linux.vnet.ibm.com>
In-Reply-To: <ac6a1c05-19fe-8437-ce50-c35ce88f19a1@linux.vnet.ibm.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 20 Aug 2020 09:04:34 -0700
Message-ID: <CACWQX81aq+MTgRNiOr9BpCFE9VWGo+v3q3OQx2OcBFq6KwKajQ@mail.gmail.com>
Subject: Re: webui-vue first impressions
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 20, 2020 at 7:18 AM Gunnar Mills <gmills@linux.vnet.ibm.com> wr=
ote:
>
> On 8/17/2020 11:34 AM, Ed Tanous wrote:
>
> "Ed, what would it take for you to switch to using webui-vue?"
>
>
> Hi Ed,
>
> Thank you for your feedback.
>
>
> What follows is my first impressions on an answer:
>
> 1. size parity with phosphor-webui.
> On the current master, webui-vue has a 40% larger binary footprint
> (614kb vs 440kb) and is still missing features that will add size.
> Lots of bmcs run on 32MB of flash, so every kb matters, even if it
> doesn't matter for the newer platforms with eMMC or larger SPI flash.
> webui-vue needs to sort out where that extra heft came from, and
> eradicate it.
>
> It was smaller than phosphor-webui until recently.
> https://gerrit.openbmc-project.xyz/c/openbmc/webui-vue/+/35696
> Gets us back under the size of phosphor-webui.

Excellent.  Making progress already.  Love to see it.  Pulled down
that patch, and it does seem to fix the size problem (down to 432kb).
Great!

>
>
>
> If we care about flash, we should look at removing or reducing the size o=
f
> 76.0K   /usr/share/www/DMTF_Redfish_logo_2017.svg

This is a little bit of a misnomer.  That logo is intentionally svg
because it compresses really, really well.  After filesystem
compression it ends up being about 12kb, which, while still a little
big, isn't the monster that it appears.

>
>
> 2. A more thorough list of deficiencies in comparison to phosphor-webui.
> There's a "feature parity" list on the readme that makes it seem like
> it's closer than it is in practice.  In the course of writing the
> patchset above I found that webui-vue doesn't support Mutual TLS,
> doesn't support CSRF allow list (a security feature), and doesn't
> support the "next" url forward.  None of these are listed in the
> feature parity list.  Considering that's just what I found in the
> initial look for the above patchset, I'm guessing there's more use
> cases that got overlooked.  If we're dropping use cases, we need to be
> explicit about it, and document why.
>
> Yeah, we clearly missed some features that were in phosphor-webui with th=
e rewrite. I opened some issues for these and the others we know about. IBM=
 will work on the "next" URL forward. For features implemented in phosphor-=
webui that we don=E2=80=99t plan to support will need to reimplemented by t=
he community in webui-vue but I don=E2=80=99t think there should be many an=
d for joining us on webui-vue you get a theme-able, translatable, fully Red=
fish, and actively developed GUI.

My point is, taking the time to make that complete list allows the
community to help more, and makes it seem like there's a chance for a
complete cutover sometime in the future (which sounds like is your
goal).
In terms of security, pay attention when implementing the next url
handling.  There are non obvious security gotchas in the current code.
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/31119

>
> Can you further explain what CSRF allow list feature we had in phosphor-w=
ebui?

Go take a look at the angular XSRF code and you'll see it.  The short
version is that the current vue module is sending the XSRF to
everyone, and doesn't check to see if the current page domain is
correct before sending.  This could lead to attacks where the XSRF
token is sent to an attacker.  It should be relatively easy to
implement.  You probably don't even need the list, just a "are we
sending to the bmc" check.  Go take a look at the angularjs code for
this and you'll see what I'm talking about.

>
>
> 3. Chunked payloads
> While Phosphor-webui opted for a single, very large javascript bundle,
> webui-vue opts for multiple chunked bundles.  In phosphor, this single
> bundle was done on purpose.  Chunking works great for CDNs and
> multithreaded webservers, but tends to cause slower page loads when
> done on a bmc, as bmcweb is largely optimized for single connection
> single client single request.  Although it's able to handle multiple
> clients and multiple connections, the bmc NIC tends to get "starved"
> of bandwidth for other things, which can cause performance degradation
> if you have lots of things going on in parallel.  I'd recommend going
> back to the old paradigm, unless there's a good reason to chunk from
> the BMC.  Note the bmcweb router holds all static routes in memory
> under the assumption that there won't be very many of them.  With
> chunking, that's no longer true, and probably causes some unnecessary
> increased memory usage.
>
> After some discussion, we agree and https://gerrit.openbmc-project.xyz/c/=
openbmc/webui-vue/+/35696 moves us to a single, large javascript bundle. Th=
is should have the same number of js, html, and css files as phoshor-webui.

Excellent.

>
>
> 4. A more stable migration strategy
> The changeover to vue got started completely from scratch, and got
> mixed with DOM changes that functionally changed the UI.  If this was
> to learn vue, and build a toy UI, that would've been fine, but the
> fact that it's now its own full repo means we have fork problems, give
> that there is no stable and specified bmcweb->phosphor-webui
> interface.  It would've been relatively straightforward to move
> phosphor-webui over to vue, by keeping the existing DOM, CSS, and
> layout, while replacing the templating and router with vue, but the
> decision was start over completely from scratch, and now openbmc has 2
> "official" webuis.  I probably missed the discussion on why a hard
> throwaway was needed here, but it seems like a series of patches that
> ONLY moved over to vue would've been much easier to manage here for
> the community as a whole, as each step of the way we can verify
> feature parity when reviewing patchsets.
>
> In theory but we don=E2=80=99t think it would have been straightforward. =
Had we gone with a transition it would have forced all users into this vue =
rewrite, potentially some in-between larger GUI while it was in transition.=
 Phosphor-webui suffers from some anti-patterns (some of the reason why it =
took such crazy large commits to do any theming), we don=E2=80=99t think we=
 could have reached where we are today with a transition approach.

It would've been harder on the development team, but easier on the
less active part of the community.  It's all about tradeoffs.  I
totally understand the desire to start fresh, and I'll fully admit, I
never looked at a Vue port, so maybe it's a harder transition than it
appears.

Is there any chance of getting a more complete "countdown to feature
parity" list from the webui-vue team?

>
> A separate repo we felt was the safest bet. This two repo approach doesn=
=E2=80=99t limit the community from moving forward as the webui-vue is matu=
ring.

Considering that the login change patchset that is currently held up
on the fact that there's two webuis, and they implement different and
mutually exclusive features, it's hard to say there isn't some
community limiting going on, and this hasn't complicated things for
others.  Maybe that's just the one and only case?

> This approach has been used in the community before.

In the past when this has happened, the new development team tracked
patchsets against the old ones in progress, and took the time to
ensure that they got incorporated in the new featureset until we made
the cutover.  It sounds like that's what webui-vue is doing?

>
> https://lists.ozlabs.org/pipermail/openbmc/2020-January/020205.html
>
>
>  As is (ignoring Kathys
> patches for a moment) there are 4 patchsets open for phosphor-webui.
> Is there a documented strategy for who is responsible for moving them
> over to webui-vue?  I didn't see anything written down, which leads me
> to believe there's no plan.
>
> After =E2=80=9Cignoring Kathys patches=E2=80=9D, I don=E2=80=99t see any =
other commit except your =E2=80=9CAdd the option to use backend login routi=
nes=E2=80=9D, that isn=E2=80=99t up for review (Virtual Media) or already i=
n (=E2=80=9CRelace node-sass with dart-sass" and =E2=80=9Cexpired password=
=E2=80=9D) webui-vue.
> https://gerrit.openbmc-project.xyz/q/project:openbmc%252Fphosphor-webui+s=
tatus:open

Here's the other 3 I saw:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/25738
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/25218/11
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/26436

My point is that when patchsets come up like that, it would be good to
have a documented "Who's responsible for porting them to the new UI"
plan.  If every patch needs to be implemented and tested on two
different UIs, it seems like a roadblock to development.

>
> As mentioned, we know we are missing some feature parity and are looking =
for help from the community (raising any problems or contributing) but we h=
ave done a lot of work to get where we are, every page on the existing webu=
i except SNMP and Virtual Media is in webui-vue and webui-vue has a lot of =
advantages.

Completely agree it has advantages.  The code looks much nicer.

>
> IBM has moved 2 of their systems to webui-vue
>
> https://github.com/openbmc/openbmc/commit/4a3fa4d6d865b46ba54f2652c82f58a=
406455ebc
>
> 5. Missed opportunity with Redfish UI
> If you're going to build a redfish first GUI, it seems like an
> opportunity where we could've used the CSDL definitions to drive and
> build a lot of the UI automatically.  Given that phosphor-webui
> doesn't do this today, this wouldn't have kept me from using
> webui-vue, but the idea that the UI can simply build itself for the
> "easy" stuff would be a massive win on productivity, and would
> probably make me more personally inclined to go help sort out 1-4
> above, as I think the end would justify the means.  As is, it takes a
> very similar "hardcode every page" approach that the phosphor-webui
> did.
>
>
> We don=E2=80=99t see how we could reasonably do this. Would need more dis=
cussion around this.
> We also think there would be some trade-offs e.g. those Redfish Schemas a=
re quiet large and today are really only needed for Redfish validation, usi=
ng them in the GUI puts another requirement on them.

They're required by the Redfish spec already, so it's not like we can
just remove them and maintain redfish compliance.  Putting another
requirement on them doesn't change anything in this regard.  We can
have more discussions about how to do it, but it seems like it would
be yet another rewrite to accomplish it, so I'm wary of doing that at
this point, as it would cause even more thrash in this transition, but
something to keep in mind for the future if we ever attempt a 3rd
rewrite.

>
> Don't get me wrong here, I think all of the above can be fixed, and we
> certainly could have a great Vue based webui that works for everyone,
> but right now, the rather arbitrary "the project will stop supporting
> on angularjs on X date" doesn't ring that important to me.  Javascript
> frameworks and modules go unsupported all the time, and we're using
> several "unsupported" modules today to no ill effect.
>
> We disagree some, we do think there is ill effect of being on an unsuppor=
ted JavaScript framework. Vue has new features released regularly and has a=
n active community.

I suspect we have different goals here.  In my mind, given its
sandboxed nature and the way it's implemented, javascript is out of
scope for a majority of attacks.  Not a huge issue that you see
otherwise, and I respect the desire to stay on current technologies.

>
>
> Theming is a
> nice feature, but those are mostly DOM and CSS changes, and are
> unrelated to a changeover to Vue.  Translations was attempted in
> phosphor-webui in the past, but to quote the review:
>
> "neither any clients nor any companies wanted OpenBMC translated."
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/17582
>
> IBM does have a requirement on translation and we have heard in the GUI w=
orkgroup meeting, other companies would be interested in translation as wel=
l.

True, that was a full year ago.  I guess requirements change :)

>
>
> Also keep in mind, I have very little seat time in webui-vue, the
> above is mostly first impressions in response to the ask from Gunnar.
> Overall, if the above can be fixed, I'd probably move to webui-vue.
>
>
> Appreciate the feedback, was really helpful.
>
> Gunnar, Yoshie, and Derick
>
>

No Problem.  Anytime.

I don't say this often enough, and the above makes it sound like I'm
complaining.  Webui-vue does look really....really nice, and cleans up
a bunch of the gripes I had about the old ui.  Good job you guys!
