Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFC0240B1D
	for <lists+openbmc@lfdr.de>; Mon, 10 Aug 2020 18:24:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQLrV4jx5zDqPC
	for <lists+openbmc@lfdr.de>; Tue, 11 Aug 2020 02:24:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b41; helo=mail-yb1-xb41.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=AlfudPc6; dkim-atps=neutral
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQLqX6nwxzDqTM
 for <openbmc@lists.ozlabs.org>; Tue, 11 Aug 2020 02:23:18 +1000 (AEST)
Received: by mail-yb1-xb41.google.com with SMTP id c9so3926765ybq.1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Aug 2020 09:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IlKzeVmkG6klwQsXcg73NiZ+kqcFn7w4FJd1/OuaeR4=;
 b=AlfudPc61QGPAI6ljB0FF6B3yrdb0GvyoblAK5HK9zGact8W9ORs2RwpNIscDL08ax
 2pe/Zz/AMncBVS2VqGS1RkSIHN+LX5A7YXw85EFxi78ZKS6Lv4H1LlfXW92SrvBo/o2m
 igmNnxsSL6kjBcpJ0wNmp7xjOoAOqRw41yt/CJ0Jxqr16LebIFr9E9Yd/18n5HhpAv+0
 ycvWf9iNGXUXIenojqkyVSaBd5RQ2eGTJ4im/CuJhMlbII9ROLsDtdgklF/cPOlNk04X
 Lnp6nlUjjJ2rxwX25xjsPCbN89kPlNoITrjBhh9Z6pOrccZ1pbBMS4PsaZiT2Zh9nLKz
 eKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IlKzeVmkG6klwQsXcg73NiZ+kqcFn7w4FJd1/OuaeR4=;
 b=Bp6bIswKGlrPfoovLlDPokVE7mMa6SducEWa1Ppb1BAIiUCWOgvCFXDgRvEVaKjrMu
 S9Yt+5BBLAcXMC+7ccsxYv3ZQ6v3GP1LeT4N7hbhq2ewyymEHo8w88fPEqk8LF79x+r+
 mNclqjI96vrh5ijceOmdyt9/x1hTePuIsUG7ObFisVMHyl4GOxEGVJ046tjBMXqCASQq
 Gkx5I7b4aYIzr4rHHbL10gvpmt6Zd5Mejlo9YjXY/Id1ii7qh62cbXULj1A75/a6Tf/D
 +gdWdXWZhopfhER6I6+nC7v3c2imYOrFVM/jGGLHXlA5xz8A7SBqiFSO4KEPP0g6tZye
 baXw==
X-Gm-Message-State: AOAM532H6vPX1nN2EWlOSLfHl/0shpRiENnMRmzIslhljEmqJxILo3Vn
 p3qOi19VOCMITErt2/iR+u0CAaCDH2wPt3Ne/6DCSA==
X-Google-Smtp-Source: ABdhPJxpCAiTixLTQNCWsEniBJPUJSFKDpZR1E6ffNJqIjE/FFjfhhs3xrTxpNMFctqJ5Fhn+FvbpnSAAK4DGoPMwGU=
X-Received: by 2002:a25:d48e:: with SMTP id
 m136mr40779629ybf.148.1597076594944; 
 Mon, 10 Aug 2020 09:23:14 -0700 (PDT)
MIME-Version: 1.0
References: <cf68b3d3-9f1d-0f2e-cfa2-98afde52e243@linux.ibm.com>
 <e736ad6d-66fd-f24f-b1e5-74cc2c71e856@linux.ibm.com>
 <9d648ded-ed67-da73-1fa9-084cdc02713c@linux.ibm.com>
In-Reply-To: <9d648ded-ed67-da73-1fa9-084cdc02713c@linux.ibm.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 10 Aug 2020 09:23:03 -0700
Message-ID: <CACWQX809XrsH_HDo-7AEpX3YBWZboq8qeTS3JVA2fjLve4hikg@mail.gmail.com>
Subject: Re: BMCWeb payloads larger than than 64MB
To: Joseph Reynolds <jrey@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Ed Tanous <ed.tanous@intel.com>,
 James Feist <james.feist@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 10, 2020 at 8:56 AM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
> On 8/5/20 6:26 PM, Joseph Reynolds wrote:
> > On 8/3/20 4:09 PM, Joseph Reynolds wrote:
> >> This is a reminder of the OpenBMC Security Working Group meeting
> >> scheduled for this Wednesday August 5 at 10:00am PDT.
> >>
> >> We'll discuss current development items, and anything else that comes
> >> up.
>
> ...snip...
>
> >> 4. Is there interest in enhancing OpenBMC firmware image update
> >> uploads using the Redfish-specified multipart HTTP push updates (that
> >> is, support the MultipartHttpPushUri property?
> > Sounds good, but nobody is working on it.  We also discussed use cases
> > for golden/primary/active/alternate images.
> >
> Ed,
>
> You mentioned "For any payloads larger than 64MB, this stuff needs
> revisited" on Jul 22 in
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/34972 and I would
> like to learn more about what you think the direction should be.

Today, bmcweb needs to buffer the entire payload in memory, then make
a copy to tmpfs.  In practice, this ends up consuming 3X the amount of
ram as the size of the file you're uploading.  This was mediocre when
payloads were 32mb, and really bad when payloads are much bigger (even
64 mb is pushing it, as we're already found).

Beast has utilities for avoiding this, and buffering files directly
from network io to disk, they just need to be wired into the
http_connection class and tested.
https://www.boost.org/doc/libs/develop/libs/beast/doc/html/beast/ref/boost__beast__http__file_body.html

If it were me I would start by creating a new route type (similar to
how request/response and websockets are already new route types) for
uploading files.
I'd make the api something like
BMCWEB_ROUTE("/my/file/upload").onfile([](std::filesystem::path
path_to_temp_file){
     // filesystem now points to a randomized temp file on disk.
});

This would need plumbed through the router and through http connection
to use the file_body type above.

Note: Depending on what you're trying to do, we might also need to
slot this into the MIME handler stuff as well, as those have the
possibility of uploading multiple files.

>
> In the mean time it seems like the current design can tolerate a 128Mb
> payload.

I'm not sure I agree with that.  The current design doesn't even
tolerate a 64MB payload well today.  Several bugs have been filed
about failed uploads, and the timer system has been hacked up quite a
bit in response, and still doesn't quite meet everyones needs for that
payload size.  Doubling the size yet again seems like it's going to be
a problem.

>  Do you foresee additional problems other than we've already
> seen?  Examples: resource use, slow connections, and the attending
> security vulnerabilities.

One important patch in this regard came in recently with something
that James and I worked on here:
https://github.com/openbmc/bmcweb/commit/3909dc82a003893812f598434d6c4558107afa28

This allows the connection handler to differentiate between a logged
in user, and a user that hasn't been logged in yet.  This gives a lot
more flexibility, in that the connection handler can simply disallow
any file uploads if the user isn't logged in.  This has already been
used to differentiate in the limits of payload sizes, which should be
a huge win for DOS attacks.  You'll likely need to use this yet again
to come up with a scheme for checking the timer subsystem, and
allowing authenticated requests to be based on a rate limit (bytes per
second), rather than an iteration count.  This might require moving
back to the async_read_some variants of the asio calls that we used to
use.  I haven't looked into detail to figure out if this is actually
needed.
