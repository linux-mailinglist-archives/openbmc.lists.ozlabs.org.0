Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5A4332DAA
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 18:57:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw2xH6nhsz3cQZ
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 04:57:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=zGheiTac;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=zGheiTac; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw2x421gHz2xyD
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 04:57:41 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id u3so14898575ybk.6
 for <openbmc@lists.ozlabs.org>; Tue, 09 Mar 2021 09:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sn+0+1DK45/7AOqlH/332buY3jM6H6hSCPijI2RuRv4=;
 b=zGheiTacPzGHPfusx5/cFng+AkGkrXvrx3X99Fa4yNOMz2hLzs9sQqmbIlHhpWHqvC
 wne92bp0RSxYf12K4MVa1qlMvBv3MtPmXPqQDI015T7rERDgkqIAMZdO+1TlKJYzfH28
 Ta9rkKUucmYkzvFtmkuC1WS+6lPkFs6aVwV5sYbvEJqCLcUCBJsVoVLo0Q7/rsShghH3
 V1497NCRz1PnzDGI6x/rPT1P5TaP3UXAbKR+8zGM2cVr6hHsbTsJF9AZW7SJL4UUuKEq
 IfSIvdFIXMJ9kZe9ikOoh7SI+XmzzD56dexNx3nbAgLVOflELLq3JjKm8pAUzKIx8yib
 WG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sn+0+1DK45/7AOqlH/332buY3jM6H6hSCPijI2RuRv4=;
 b=ssmENFeRFPT5yRH6LfKOcJRaMfMQ2k0r4/MiNdJDIXOU7xoxjM53aZWjbCPXG6+79X
 9OJ0hiQD6gO258gmrscTwbji7hHv67x31qnrxP9ZuvdAXNKQIFFi+aUbtDSW2EFlXV89
 tjpLgtbZsozhHPtYnJ3kSsUO/Mg6Ssxu88sc7CLeR4+HQGj48kjmxhE81hKeimmFfUnK
 P5qmv2OJYDDV2VXCPgFIw/94XbnL9xpy4pI5sQEVk9vbtKUUbyxIJz0V722OPIKBt8U1
 f+zu2aBy+tEsJSQCziLA219Yit7lpzMh/7OhjzkE6ZPLVYQdrIXKZn7LfU+CSBShGqtG
 q3PQ==
X-Gm-Message-State: AOAM532aItyuK1Dq9/zPxK0lF3RXomSffTP2KzEZZrqjxyyIGITny7SS
 KAaafJxo5LP4Ti1qsT7VHFCd8OSCb5DwSW/FB9Z6Mg==
X-Google-Smtp-Source: ABdhPJxPqRiywtGsZHMZIwdNa/PkdKsDMuFss+O1ZEo+9P6X+exn+vbnzeXvjgMRNtPZjaggUBWSrOpvfh3/QQPFAvE=
X-Received: by 2002:a25:286:: with SMTP id 128mr43764972ybc.449.1615312658507; 
 Tue, 09 Mar 2021 09:57:38 -0800 (PST)
MIME-Version: 1.0
References: <CACWQX80G75i+s8Vcro64uEyvcZn1Dc60y-coS6GqrvkJo59Kqg@mail.gmail.com>
 <CACWQX82OCCAkUzdvKv4pj2YgOL+Y+SifJKAbGOEnZ_MuVyB2+A@mail.gmail.com>
 <20210309135745.vgx3mjwnfnkvilxx@thinkpad.fuzziesquirrel.com>
 <CACWQX81UROJhBGX4qAdu6J5xy9AHpVRLXKxR5TcXeKonj2o4Ng@mail.gmail.com>
 <OF3047D3C3.44F407F4-ON00258693.005E67D0-00258693.006055F7@notes.na.collabserv.com>
In-Reply-To: <OF3047D3C3.44F407F4-ON00258693.005E67D0-00258693.006055F7@notes.na.collabserv.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 9 Mar 2021 09:57:26 -0800
Message-ID: <CACWQX81ZtWH_ROotW1vz5J4a_X09mgkEMSGoTPL=tdao-L+LzQ@mail.gmail.com>
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

On Tue, Mar 9, 2021 at 9:32 AM Milton Miller II <miltonm@us.ibm.com> wrote:
>
> On March 9, Brad Bishop wrote:
> >On Tue, Mar 9, 2021 at 5:57 AM Brad Bishop
> ><bradleyb@fuzziesquirrel.com> wrote:
> >> On Fri, Mar 05, 2021 at 11:02:24AM -0800, Ed Tanous wrote:
> >> >On Fri, Feb 5, 2021 at 12:02 PM Ed Tanous <ed@tanous.net> wrote:
> >> >>
> >> >> In an effort to fix these issues and more, I'd like to propose
> >> >> creating a new repository for a "new daemon" template.
> >> >
> >> >If anyone is following this thread still, patches have been pushed
> >> >to
> >> >https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/41099   for the
> >> >moment.  As they get closer to approval, I'd like to get a new
> >> >template repo created to house the code contained in that patch,
> >> >and
> >> >CI setup on said repo if I could.
> >>
> >> Thanks Ed!
> >>
> >> The only reason I haven't created this already was I wasn't sure
> >> what to
> >> call it.  Any ideas on a name out there?
> >
> >No worries.  I don't really have a strong opinion on what it's called
> >either.  The ideas I've had so far were "Sample app" or "example
> >app".
>
>
> One thing I wanted to point out when we are adopting this.
>
> Git has a feature that it purposely checks the oldest ancestor of
> the target repository against the source repository.  This is a
> check that helps prevent pushing an unrelated tree.
>
> From the git push man page:
>
>        -f, --force
>            Usually, the command refuses to update a remote ref that is not an
>            ancestor of the local ref used to overwrite it. This flag disables
>            the check. This can cause the remote repository to lose commits;
>            use it with care.
>
>
> If we give instructions to rebase the commits when creating a new
> repository the new commit time and/or committer will cause a unique
> hash and we will not defeat this check.

I'm not really following why this would be a concern for this kind of
thing.  Sure, force push is a big hammer, and should be used with
discretion and care, but I'm not seeing why we would ever have that
problem on a new repo, regardless of if we squashed the template repo
history (which would be my preference as the template repo history is
irrelevant to a new repo) or whether we pushed it as-is with the
template repo history.  I can't think of a workflow where we would
rebase, but maybe I'm missing something?

Can you elaborate on what the exact concern is?

>
> milton
>
