Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BF296838
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 20:01:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cds44J3MzDrMC
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 04:01:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::242; helo=mail-lj1-x242.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="aGwodkqx"; 
 dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CdrG4p5QzDrL3
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 04:00:46 +1000 (AEST)
Received: by mail-lj1-x242.google.com with SMTP id h15so5960112ljg.10
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 11:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6yTLGO1Y5OlpkRLfMEhcCCQAxLwcQ5JIEpwDxFUMtGo=;
 b=aGwodkqxfMESm/0uFH0r7vGCs0qGE2temxoG77n5zLr+k5sSNL1BF2zTI/2dqeL3/e
 3t+AJqrM9L0yaI/rov+AeJfE9TF49NfKN6qhcdnHoLEeemaERrQHHH18ilWXPwEqoKSV
 cTnzUi1UOSGTvVkR5pKkCWxCOBS/5wi9GClvJuQKj1G4fY6TCY+BkLY6di2r3L2e7cXV
 WjKLgk0UdiEAWWQ3VlXt3WQylTVUtvkPiAUJ/5aRGHSXGsVBM9a12nEbLSGC+lOeJxMA
 mr7JWxxoi4UhKJRQylNQ28o6Zaan+F74H48PX/Onzl7ZI4IX5g++ENeCEX6HsQe3srqb
 HIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6yTLGO1Y5OlpkRLfMEhcCCQAxLwcQ5JIEpwDxFUMtGo=;
 b=d7iyEVxR2jw8QZxFePpFMbqm6iwyd972GtHMa5tfX4wclBWbmNUdshOZbsF03X8k+A
 nGmDjE36MUc3/ZsGdxyCKGeJk/BaMO4aCNiWow16Kzjb69ywoiqCl/l7gVfXtkqFSjv4
 VviMByQHJpqCQpY55EBON57F7jNuT/gOQ/5Yb1Na67JpxlU7DicGTSysWHvHj9XqnI4a
 9Lbo3lG+9sBLGaPws7htYNEXm9lRjgYQ8VZKs/Z3PSSdllRknstiK3g+taG9pIKzF8+z
 tJ37Bx//FlP/UB5BO1tMZ46eoczD9Vu+Io9Wk5T3HBCsTzEo/FJo0HGTZfC8usSG4yrc
 rXcw==
X-Gm-Message-State: APjAAAW02mc0J3kKw3b9uPQShzfxrBXKZ0Vcwj1jU1Fk5ddwEMFw/8JY
 fIhDzmw8LTMFgvvr++YhYh6K4Sxwga3OQuBOxVdrH6fLVYEnFQ==
X-Google-Smtp-Source: APXvYqwmEhbcF8bmRudg1Jkdrr7A8j92yUXvR3PPflcwHe6BTzzHU9ZHgoBDxqHP+jDCJtx/QnEqk4EeMd+X7UHcTOY=
X-Received: by 2002:a2e:97cc:: with SMTP id m12mr16612558ljj.24.1566324036035; 
 Tue, 20 Aug 2019 11:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <efb47539225e57a0ab0138987287c230@linux.vnet.ibm.com>
 <20190816090955.GA15986@bbwork.lan>
In-Reply-To: <20190816090955.GA15986@bbwork.lan>
From: William Kennington <wak@google.com>
Date: Tue, 20 Aug 2019 11:00:25 -0700
Message-ID: <CAPnigK=N9o6HzZCeJ-g1uWiLeRFXM84bF+Pq63YoJAz8SEdstA@mail.gmail.com>
Subject: Re: Alternative to the filesystem overlay
To: "Alexander A. Filippov" <a.filippov@yadro.com>
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Sounds like this is just a data schema update type of issue, where you
just need a service to run at first update boot and upgrade the files
as expected by the change.

We could probably do this with systemd services that are
ConditionNeedsUpdate= and
https://www.freedesktop.org/software/systemd/man/systemd-update-done.service.html

I'd prefer to see us move to a mostly immutable filesystem with
symlinks that map into a rwfs for specific files / directories we
expect to mutate at runtime. I don't think we should do any smart
types of writeback caching at the filesystem level as that will just
lead to confusion about persistence that is hard to debug. Not to
mention tools like rsync don't guarantee atomic snapshotting during
the copy for file consistency. Our applications should be designed in
such a way that they are always consistent on disk. Ex. writing text
files should be done to a temporary, then moved over the old one. That
way the update is atomic and we don't have partially written files.

On Fri, Aug 16, 2019 at 2:10 AM Alexander A. Filippov
<a.filippov@yadro.com> wrote:
>
> On Thu, Aug 15, 2019 at 12:38:16PM -0500, Adriana Kobylak wrote:
> > In OpenBMC we've been using an overlay to make the read-only filesystem (or
> > part of it) writable. It hasn't come without its issues, like missing
> > directories (openbmc/openbmc#3564) and various flavors of corruption
> > (openbmc/openbmc#3578 and issues when adding files to /etc in the build
> > causing files that had been previously modified on the bmc to become
> > corrupted).
>
> There is one more issue for the same type - openbmc/openbmc#3468.
> And it can't be solved by the way you propose.
>
> >
> > An alternative would be to use a bind mount and manage the file merging by
> > an OpenBMC app. Doing some experimentation, seems this solves the issues
> > seen above. The way that it'd work would be:
> > - The init script or initramfs would do an rsync from /etc to the bind mount
> > destination directory in the read-write filesystem, skipping the contents of
> > a list which would contain the files that have been modified in the BMC and
> > should be preserved.
> > - A new OpenBMC app would monitor /etc for changes via inotify for example,
> > and if a file is modified, it'd add it to the "list".
> >
> > Considerations:
> > - The /etc dir mainly being a configuration destination does not get
> > modified often so the app that is watching the directory would not be
> > triggered often.
> > - The bind mount would duplicate the contents of etc although it's not much.
> > If space is a concern, some exploration could be done to have the bind mount
> > be a tmpfs and have the monitor app copy the modified files to the
> > read-write filesystem instead of adding them to a list.
> >
> > Thoughts?
> >
>
> Most of these issues can be solved by the simple shell scripts. We could modify
> the initramfs/init scenario to exec these scripts at the moment when ROFS and
> RWFS have mounted but are not combined to OVERLAY yet.
>
> Of course, this method doesn't prevent an occurrence of any new issues of this
> type but brings an easy way to solve them.
>
> --
> Regards,
> Alexander
