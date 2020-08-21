Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC8424DC48
	for <lists+openbmc@lfdr.de>; Fri, 21 Aug 2020 18:59:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BY75Z0gv6zDrHd
	for <lists+openbmc@lfdr.de>; Sat, 22 Aug 2020 02:58:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=yUURRzII; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BY6V93mZhzDr8t
 for <openbmc@lists.ozlabs.org>; Sat, 22 Aug 2020 02:31:43 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id q16so1339339ybk.6
 for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2020 09:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PbpOFyQ7OSpdni48TEQFylInjV7EU4acZIwlxhx+sfI=;
 b=yUURRzIINL6m5vyltx3EDh9OFnWLhq6U3XXhYGunXVnSrWgtW3LAd6g6lo638PDCG3
 w7hJEEL9+YYRVJQotGuFjsje5hhgBJeaPr5ufG0k0WWqdxSnf6o/MKnA6UTk2tpMUmRW
 YfqUffqqLfMJmREoqt67/OVGumTlG3IPWo/pgT0Ba6s57Rx+eEseg2u3+QrnF86YwXk9
 Gd087eGzoIXxBYKodhaj908eU97o4nB8tUO6aJHCwpCTFntFBuO891Vm1C2j+LEjHx+x
 glKM8ErPt706z7TH2fk6p9xnWHvQdbIJ28cvxNnIO08R6TrHNb7TU6JiddDaYUBoNf64
 NVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PbpOFyQ7OSpdni48TEQFylInjV7EU4acZIwlxhx+sfI=;
 b=hPilaYZUIXbIRksZ2Lg78ikErFwDXJLBsg3858J5bPXE142+FqnkNM6FXy1PzGj71m
 eeCkfxYvQcf//2ykVcDupkSVC8+NuZJwBwwVnntgI5SiNvyQNZXhLFWp1qLZwfGn7R4O
 YroiBIy+4YwJ32qwJwYVLVvuMETIAQlIjgE8wn29Jj/6w2MyvfQEE6H3u37B4IgYSNr0
 OuB75q2o4xv1IEWgW4yIgQ6gS+mozhQnfQmjzLRRl5RbdobKhRFFhZxhtasbZLAD5Bix
 HL19/A7yXcVglJRjN0vDtzKUYLKmiA62lGMATPn8hsLtcpoTOQnKsduAKdguTriG7EnM
 H66g==
X-Gm-Message-State: AOAM530w3q+5DCbVHJwfjzHNmgoTwfy6s6tJ9Gn0xFYEnHcfQ/laZbSQ
 V/6PvBpGXdp4CoGghjtKev7Tr8+YJncgvOt1IZ+T5kkzSHB1eWBM
X-Google-Smtp-Source: ABdhPJyYaPZRKU/WBR5/5vOLCb3br2lrB/bSuqBn4n4+zdTUUMvVCTp7GsdQy17wuB51U4OpTeGWmwU/XfpEtQ493v0=
X-Received: by 2002:a25:f304:: with SMTP id c4mr4115692ybs.209.1598027497625; 
 Fri, 21 Aug 2020 09:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <d6d450e638d016d29496ef1713083e80551a84bd.camel@fuzziesquirrel.com>
In-Reply-To: <d6d450e638d016d29496ef1713083e80551a84bd.camel@fuzziesquirrel.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 21 Aug 2020 09:31:26 -0700
Message-ID: <CACWQX80EqyB8kkHU2M4qx3cPcvuVZLhVTxKe=bY-U1y+Gnjc1w@mail.gmail.com>
Subject: Re: moving meta-{openpower, x86, arm} content to meta-phosphor
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 20, 2020 at 6:18 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> Fellow OpenBMCers
>
> Over time, I would like to do away with the processor arch layers e.g.
>
> meta-openpower, meta-arm, meta-x86.
>
> In hindsight meta-arm and meta-x86 might not have made much sense and
> should have been something like meta-x86-intel and meta-x86-amd perhaps
> - this is confirmed by the fact that there isn't any content in meta-
> x86.
>
> I propose the content simply go in meta-phosphor, and that we frame our
> thinking of meta-phosphor and OpenBMC as a project that supports any and
> all host processor architectures (as well as devices that aren't servers
> at all).  This results in several positive things:
>
> - Increased developer/maintainer awareness/cross pollination of other
> usage patterns (community building).
> - Differences are obvious, highlighting areas for improvement in the
> project.
> - Build time, cross arch incompatibilities become obvious (e.g. building
> images that support both Intel and AMD processors for example).
> - Improved time to understanding for newcomers - everything is one
> place.
> - Reduced (granted a small amount) layer configuration complexity for
> end users.

Sounds pretty reasonable.  I wonder if we should go even further, and
not even model the host processor differences in meta layers at all.
We would simply enable certain features/packages for certain machines.
That makes sure that we aren't turning on features for machines that
haven't been tested yet, but doesn't require a full move over if
someone wants to enable a new processor type on a system that didn't
already support it.  It also hopefully means that the "default" would
be to start with an existing application, and simply add support for a
given processor/architecture/feature rather than starting over from
scratch more of the time.
The other thing I would add is that it (hopefully) leads to more reuse
between configurations.  Things like "peci-pcie" might one day become
"Pcie-inventory", and simply support all processor inventory types
that it can.

>
> I'm not aware of any benefits to factoring things out into the different
> layers like we have today - if you are aware of something, please share.
>
> Getting more detailed, how would this look?  This series is an example:
>
> https://gerrit.openbmc-project.xyz/35759
>
> For projects that are truly host processor specific e.g. peci or occ
> support, we already have a recipes-x86 folder:

It should be noted, I wrote the above comment about peci-pcie before I
read this part.  Hah.

>
> https://github.com/openbmc/meta-phosphor/tree/master/recipes-x86
>
> I propose we allow the creation of additional folders using this
> convention e.g.
>
> - recipes-power
> - recipes-x86-amd (we might want to look at renaming recipes-x86 to
> recipes-x86-intel)

I no longer have a dog in this fight, but as a developer the above
sounds reasonable.

>
> Or even better IMO, we co-mingle these recipes as well based on the
> abstract function they provide for some of the same reasons I would like
> to move to a single layer - increased awareness of what your community
> peers are up to.
>

I should really learn to read the whole document before writing
comments :)  Sounds like we had similar thoughts.  +1
