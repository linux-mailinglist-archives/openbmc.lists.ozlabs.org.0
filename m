Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D37A332E8A
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 19:51:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw46n34D7z3cQ3
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 05:51:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=UdMxBcOR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=UdMxBcOR; dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw46Z1hstz3cJ0
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 05:50:59 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id b10so15070861ybn.3
 for <openbmc@lists.ozlabs.org>; Tue, 09 Mar 2021 10:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w2faajHUphWYrbfLmlzqigxla+BsCLA8KSkqPF4LKec=;
 b=UdMxBcORFQmedfPlsTXoA8aTcjgtW+B6OuYcmWNgV4yTlpb9KRDyTAaClAIOSy2KP7
 F5QGn/c1q/fhBk2a3HES5gJpRgl0J4P0E5K5QCih4O2lahe+xG+ppGxVHvqy+8YoAeVO
 opY9hUWCaAQTPReNonHx1Dt5rgkIaryIgrwpIb3mjrIE03+9z3q1OSMHEZjn+OXriM5l
 xJA0ytqAQFps13lHP9NqXjoq9RO9F7x96DhqZhqJ3SdVed77kSmcC9B9BMpdFybriw01
 k7JW4k3V2GmGK5nWXgBMNhx4R25dkv6dsU3tBeXddbpYyYnc0QB8RPVpO8ao0SrsHby0
 HMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w2faajHUphWYrbfLmlzqigxla+BsCLA8KSkqPF4LKec=;
 b=PsZPqaMX+UFvG0YDihHdt3osdDrR56VovfVTv1fPp0dx18ElbN1SyY2F2BkZBhhFa1
 pW6JK3yw4QCDZACT0ZJpSxwQMFLR4N2W5ukoKBl9JVVqRDHrWlso3IdyhqEHxxeWPU0U
 KOPIJJ5XAEUmGeFz2MRk1cPGGtDdjVkCtvzoIptW183d6pFomxJrt6SOGUa3IRTfScEY
 Rgmak+NyV5fqv2ZTNXekqJRMPo4SQfk/f2q/4YRh0LwoYFMRg30xXlaOGuTKQPtgAreM
 dRP29E/3iGfcTFZCWNY0TH2FU6L0qbgpAjSJ1B7ksv/8A+Gny16SxkIju5z2sgmRDfo9
 RpNA==
X-Gm-Message-State: AOAM530k7CklbCCDDIVlCO+XEAgdH9WJIvYGYu0SknPs7HZmffyIUmn5
 lvbOKSTcDMMZ4wuhEp9xm0pBLae91lRuWikGKaztiQ==
X-Google-Smtp-Source: ABdhPJzijT2/K2qu+oYPfddgO1UYbkPMAsIoo8SsryL2oVOFWztYpWUyqf1tRVq+/Hawxs6ywUWXTqS8STiDgw6Ph1E=
X-Received: by 2002:a25:a3c4:: with SMTP id e62mr44291214ybi.203.1615315855993; 
 Tue, 09 Mar 2021 10:50:55 -0800 (PST)
MIME-Version: 1.0
References: <CACWQX80G75i+s8Vcro64uEyvcZn1Dc60y-coS6GqrvkJo59Kqg@mail.gmail.com>
 <CACWQX82OCCAkUzdvKv4pj2YgOL+Y+SifJKAbGOEnZ_MuVyB2+A@mail.gmail.com>
 <20210309135745.vgx3mjwnfnkvilxx@thinkpad.fuzziesquirrel.com>
 <CACWQX81UROJhBGX4qAdu6J5xy9AHpVRLXKxR5TcXeKonj2o4Ng@mail.gmail.com>
 <OF3047D3C3.44F407F4-ON00258693.005E67D0-00258693.006055F7@notes.na.collabserv.com>
 <CACWQX81ZtWH_ROotW1vz5J4a_X09mgkEMSGoTPL=tdao-L+LzQ@mail.gmail.com>
 <OF154E4A70.F0575574-ON00258693.00642DBF-00258693.006513D9@notes.na.collabserv.com>
In-Reply-To: <OF154E4A70.F0575574-ON00258693.00642DBF-00258693.006513D9@notes.na.collabserv.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 9 Mar 2021 10:50:44 -0800
Message-ID: <CACWQX80Gn_V1jNZWdhPhZx-myC9FB1Si91hVpU_FkQczM9GLKg@mail.gmail.com>
Subject: Re: Making the "new repo" requests go faster
To: Milton Miller II <miltonm@us.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 9, 2021 at 10:24 AM Milton Miller II <miltonm@us.ibm.com> wrote:
>
> On March 9, Ed Tanous <ed@tanous.net> wrote:
> >On Tue, Mar 9, 2021 at 9:32 AM Milton Miller II <miltonm@us.ibm.com>
> >wrote:
> >>
> >> On March 9, Brad Bishop wrote:
> >> >On Tue, Mar 9, 2021 at 5:57 AM Brad Bishop
> >> ><bradleyb@fuzziesquirrel.com> wrote:
> >> >> On Fri, Mar 05, 2021 at 11:02:24AM -0800, Ed Tanous wrote:
> >> >> >On Fri, Feb 5, 2021 at 12:02 PM Ed Tanous <ed@tanous.net>
> >wrote:
> >> >> >>
> >> >> >> In an effort to fix these issues and more, I'd like to
> >propose
> >> >> >> creating a new repository for a "new daemon" template.
> >> >> >
> >> >> >If anyone is following this thread still, patches have been
> >pushed
> >> >> >to
> >> >>
> >>https://urldefense.proofpoint.com/v2/url?u=https-3A__gerrit.openbmc-
> >2Dproject.xyz_c_openbmc_docs_-2B_41099&d=DwIBaQ&c=jf_iaSHvJObTbx-siA1
> >ZOg&r=bvv7AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4&m=zOJQ8qDYu5wBWzKub
> >6P9N-WKFD3SB3DdgsAsegfH5xQ&s=iLLTE_nLMY6TUpL-Q4U6xtZoUdNkXSDwdlMskft8
> >vIU&e=    for the
> >> >> >moment.  As they get closer to approval, I'd like to get a new
> >> >> >template repo created to house the code contained in that
> >patch,
> >> >> >and
> >> >> >CI setup on said repo if I could.
> >> >>
> >> >> Thanks Ed!
> >> >>
> >> >> The only reason I haven't created this already was I wasn't sure
> >> >> what to
> >> >> call it.  Any ideas on a name out there?
> >> >
> >> >No worries.  I don't really have a strong opinion on what it's
> >called
> >> >either.  The ideas I've had so far were "Sample app" or "example
> >> >app".
> >>
> >>
> >> One thing I wanted to point out when we are adopting this.
> >>
> >> Git has a feature that it purposely checks the oldest ancestor of
> >> the target repository against the source repository.  This is a
> >> check that helps prevent pushing an unrelated tree.
> >>
> >> From the git push man page:
> >>
> >>        -f, --force
> >>            Usually, the command refuses to update a remote ref that
> >is not an
> >>            ancestor of the local ref used to overwrite it. This
> >flag disables
> >>            the check. This can cause the remote repository to lose
> >commits;
> >>            use it with care.
> >>
> >>
> >> If we give instructions to rebase the commits when creating a new
> >> repository the new commit time and/or committer will cause a unique
> >> hash and we will not defeat this check.
> >
> >I'm not really following why this would be a concern for this kind of
> >thing.  Sure, force push is a big hammer, and should be used with
> >discretion and care, but I'm not seeing why we would ever have that
> >problem on a new repo, regardless of if we squashed the template repo
> >history (which would be my preference as the template repo history is
> >irrelevant to a new repo) or whether we pushed it as-is with the
> >template repo history.  I can't think of a workflow where we would
> >rebase, but maybe I'm missing something?
> >
> >Can you elaborate on what the exact concern is?
>
> User starts with template repository and adds content for app A.
>
> User starts with template repository adding files for content B.
>
> User accidentlly recalls pull command for repository A when
> working in repository B.
>
> If the commits were rebased git complains.

I think I get this, this would really only be a concern for whomever
is writing commit 1, right?  Presumably everyone else would be cloning
from the new repo, which would have a completely disparate history.
Hopefully nobody else is pulling directly from the template repo.
Based on the MAINTAINERS files, the gerrit admins would retain control
on the repo until the MAINTAINERS file is pushed, and are hopefully
schooled enough to avoid this kind of thing.

>
> If the repositories share a common ancestor then the content
> of A is merged into repository B.  At a minimum the user has
> unrelated content to purge.  In a worse case the content of
> the second repository is relatively small and doesn't get
> caught in the review process.

In theory the only changes they'd get here would be if we update the
template repo, in which case, we probably want the changes in the new
thing?

>
> Rebasing to get an updated commit time allows this check to
> remain effective.   The Author history including timestamps
> can be preserved.
>
> I thought about saying merge this into your repository would
> work but then I realized there is a common ancestor in the
> middle which may defeat the checking.
>

Overall, yeah, this a concern, but I'm not sure what we can do about
it to mechanically limit it from happening in git;  If there's any way
we can structure the template repo to avoid this, I'm open to
suggestions.  When I add the readme to the commit (coming soon) I'll
be sure to put renaming the origin remote as one of the steps.

> milton
>
