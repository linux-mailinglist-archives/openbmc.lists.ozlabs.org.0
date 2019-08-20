Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD05967A6
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 19:35:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CdHK1R5gzDr4C
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 03:35:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TRoF0hZ2"; 
 dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CdGX6kB0zDr4C
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 03:34:59 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id k3so3620883pgb.10
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 10:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1DKMC3Z0uMmgGvrLRo9RFCItHMG5hqlNVxtMcvwQcfw=;
 b=TRoF0hZ2ce0IIFzxi34u6O+8SFmNhgiAMVbYu+IkirzkdcuLQNJSYLZmqP2zQaKfmu
 l3Ol1cOqTtjgEDIRpBQ9lzeugJmoDaCcqxTDCtW/cnrUIbLbLMQmW6HaKBQfh8AxwvF6
 +EiKN0bR5l7BMCiqkecP9Wpl/Z7Aq2y7Yt/ynynhpQU6bsaIRemozzhi1X2c9HG7xTqs
 Sd42aX1dqKvqt/EzcXPcalRIFjjiPwcXsrlrgnskZUF20s3kGoUARcf7835I0Fr+SG4j
 n503f6RbhJZxbUqWJMvKL0fj2g/hHBuiD3JgYqwOlf1vjR8MNf9nPnhT3JNHTyxX1yEy
 PLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1DKMC3Z0uMmgGvrLRo9RFCItHMG5hqlNVxtMcvwQcfw=;
 b=UytDKyMTVqNWlJ+TY/lVg6ViQU5LnGjyBhlbgSF8U/iMRFyyldQWwkMKoeohMmAido
 vHnSnVc6RkIFviiNksk3aPWnr/aVahLcXK/imY0H3Ba6IRzpFmja3im2YfH3elpSKl5d
 tj72ABcws+HzE+yuCRLPLopc64FK/EVoM2fLd/ByXtG7sf0NKngV5EpeoavPLwpjqb5+
 VEOtYPJBZ0VVtPlW1UeSIGUW4nEYKl0KgICNoEN2/yUphCr+017lulC6WOA1ydavLQqf
 sEzg1SXKSpZ7Ngxf0hqIZpRKOvc2hSpun4JNIUcjLSilARP8mL2HSLqs2wgTkGM7UHes
 rxEQ==
X-Gm-Message-State: APjAAAUin5gdQEBQea1s6mDKVWYfKtqOMw7Y+uMwra0npxk+bpf1EKQz
 SaE//4zNeP42PhsTqgHGgwHepeZvjyS64cCDCTGlPw==
X-Google-Smtp-Source: APXvYqzBARUZj44o9jXV/rt5EfVunerOg1+fkz9Nh4fFAGbHMdWO3DNyYX2LJ9KN4BzWbq4Ct3G9yeBoBDwryt5BQ74=
X-Received: by 2002:a17:90a:d990:: with SMTP id
 d16mr1037316pjv.55.1566322495969; 
 Tue, 20 Aug 2019 10:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzcsn+0cbEas2npaMk1cT7nv+PeHxy3WWYQnzt3CB_+Pg@mail.gmail.com>
 <e8180496-03ec-72d1-912f-14b0334257cd@linux.intel.com>
In-Reply-To: <e8180496-03ec-72d1-912f-14b0334257cd@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 20 Aug 2019 10:34:44 -0700
Message-ID: <CAO=notyxKSpRYnjCN2TG+jVCSF=CFOjvssk59t_u-gbymScfaw@mail.gmail.com>
Subject: Re: new dependency: hunter in entity-manager
To: James Feist <james.feist@linux.intel.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 20, 2019 at 10:28 AM James Feist
<james.feist@linux.intel.com> wrote:
>
> On 8/20/19 9:26 AM, Patrick Venture wrote:
> > A new dependency was added:
> >   https://github.com/openbmc/entity-manager/blob/master/CMakeLists.txt#L8
> >
> > My builds are failing because they don't have access to the internet
> > and this repository is downloaded outside the scope of bitbake (so it
> > isn't getting cached).
> >
> > Also, I find the possibility of it going away troubling:
> > https://github.com/ruslo/hunter/issues/1921
> >
> > James, is there a hunter bitbake recipe? I didn't see one, but with a
> > name that generic as a noun, it's possible I just missed it.
> >
> > Is it only required for unit-tests?  If so, can you fix the cmakelist
> > to only add it for that build?  If unit-tests are always set to build,
> > can we add a flag to disable them when built for bitbake?  we do that
> > for other repos?
>
> See if this helps:
> https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/24581

Thanks!

>
> -James
> >
> > Patrick
> >
