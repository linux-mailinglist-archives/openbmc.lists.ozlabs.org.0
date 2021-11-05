Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA45445EF5
	for <lists+openbmc@lfdr.de>; Fri,  5 Nov 2021 05:01:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hlmyf0k0Yz2yWN
	for <lists+openbmc@lfdr.de>; Fri,  5 Nov 2021 15:01:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=IUFr1ibx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=IUFr1ibx; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlmyD6yfrz2xYN
 for <openbmc@lists.ozlabs.org>; Fri,  5 Nov 2021 15:00:50 +1100 (AEDT)
Received: by mail-qv1-xf2d.google.com with SMTP id bu11so6714401qvb.0
 for <openbmc@lists.ozlabs.org>; Thu, 04 Nov 2021 21:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uddugmOox4HGYZA46PeUWYGRPZYrHqmfpfCGidtFVUM=;
 b=IUFr1ibxJrz8QNSluQ+R8itYsubrs8fppx9dm9aRE2yzpWgOnAN2WQWCeft0pL0ELE
 XmYSMj8JEmEzkcYDsmME/o8HvvqMtyhD3nBYA33eAPRnJN47bFR78sSZOPWZo7HRUZLs
 p1iME70jXNKyLLMZJ0QuzXS+Da+69cSVocCp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uddugmOox4HGYZA46PeUWYGRPZYrHqmfpfCGidtFVUM=;
 b=v7DYP3ZczKKmKF04ajzSVhtuO60iPVmX/E6XhZh6XC7CMecLUjRg5iHMRpQoHvRoVu
 SRpQW4SUz6m6WfiB2O5t354dHZ+zS7kjlYckIiX+jSeMOBbh6xMvBuUH3FNjPVOWlpfz
 Fy2GJK34gxSw++/qtvJgjpSXPPVyWTNJatOKdbxSplcyNQPoDvMrIdbnkrg5ppwLZIqw
 o/6LyCTEYXybbnfot4DOUL6KfEDZjv1JsHwgxWBSZenOxugx1Jmlu7HFRL89d8BpyVeQ
 fAW+SpoYzwP7FKK+0nxIGLGQ5qVj6jmY/B7VYErqI6T0rh8GqtpZbsgB6hqiBnA5F6BT
 SjJg==
X-Gm-Message-State: AOAM532spDWIlxqx7tL+Y43VBWSkZ+rXueFuCNUJgCy25wOyMGCoTZxe
 ccq0Dk9QoETfMCfglkCzMUpL43Mfy3WdCQOftszUtEWcrAo=
X-Google-Smtp-Source: ABdhPJyPOV9lQT6uxrWxgsNIH21diWK1ouk6sEWfRs8Ff4LfNldb4Anx9VCcabtgDPQgbcWeCqi/bNE5S1n8DfrHyaA=
X-Received: by 2002:a0c:eb90:: with SMTP id x16mr31894318qvo.41.1636084847287; 
 Thu, 04 Nov 2021 21:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <CABoTLcQHOcfvHkCGX0nMUxFzmTcceuBhL3CQERn66CT8UsSvwQ@mail.gmail.com>
 <CACPK8XcRfTkZynhnmYn0ySq82MjJQZwgy_4UjKpcxYgF5cG7xw@mail.gmail.com>
 <CABoTLcRoC7aQ1e0V3FMbmRgvuMafib0qUHOuYZkORFOooGSYcQ@mail.gmail.com>
In-Reply-To: <CABoTLcRoC7aQ1e0V3FMbmRgvuMafib0qUHOuYZkORFOooGSYcQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 5 Nov 2021 04:00:35 +0000
Message-ID: <CACPK8XfRJ--eXpZeC1TPbC+5cwVNQeSUjA8w-dvM-ABGpu3t7g@mail.gmail.com>
Subject: Re: Cherry-picking 5.16 commits into OpenBMC Linux?
To: Oskar Senft <osk@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 5 Nov 2021 at 03:52, Oskar Senft <osk@google.com> wrote:
>
> Hi Joel
>
> > > Would it be possible to cherry-pick these commits into the OpenBMC
> > > Linux tree to speed up this process? Or is this something you
> > > generally prefer to not do?
> >
> > Yes, this is exactly what the tree is for.
> Aha, cool! I'm starting to get the picture :-)
>
> > > https://lore.kernel.org/linux-arm-kernel/20210909004920.1634322-1-osk@google.com/
> >
> > If you take a look at the dev-5.15 branch, you can see that this one
> > is already applied.
> Awesome, thank you! I didn't even think of looking there. I thought
> I'd have to wait for 5.16 to manifest itself.
>
> I sent https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48632 to
> forward the commit for linux-aspeed. I hope that was right? Or does
> someone (you?) do that periodically anyway? I did test (build and run)
> and it works as expected.

I normally do this, but you're welcome to do it too. I'll merge your
device tree update now, and if you could then update your bump to
include that commit I'll +2 it.

I have a slightly horrible script that does the work for me. It
assumes the openbmc kernel is on a remote called 'openbmc' (this check
also makes sure that I've actually pushed the commits that I'm bumping
the recipie to).

#!/bin/bash
#
# Bump kernel version in meta-aspeed recipe and create a commit
# message using git shortlog
#
# Customise location of KERNELGITDIR to point to your openbmc git tree.
# Run from root of openbmc checkout tree.
#
# Joel Stanley <joel@jms.id.au>
#

set -xe

SUMMARY=$1

KERNELGITDIR="$HOME/dev/kernels/openbmc/.git"

RECIPE="meta-aspeed/recipes-kernel/linux/linux-aspeed_git.bb"
BRANCH=dev-5.15

OLDSHA=$(grep -Po "(\w{40})" ${RECIPE})
SHA=$(GIT_DIR=${KERNELGITDIR} git rev-parse openbmc/${BRANCH})
SHORTLOG=$(GIT_DIR=${KERNELGITDIR} git shortlog "${OLDSHA}..${SHA}")
VERSION=$(GIT_DIR=${KERNELGITDIR} git describe --abbrev=0 | cut -c 2-)

cat << EOF > ${RECIPE}
KBRANCH ?= "${BRANCH}"
LINUX_VERSION ?= "${VERSION}"

SRCREV="${SHA}"

require linux-aspeed.inc
EOF

MESSAGE="
linux-aspeed: ${SUMMARY}

${SHORTLOG}
"

echo "$MESSAGE" | git commit -s -F - ${RECIPE}
