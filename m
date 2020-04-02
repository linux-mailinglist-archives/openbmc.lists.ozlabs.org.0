Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D2419C62B
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 17:43:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tS553dHzzDrPr
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 02:43:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=qzCDO6sp; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tS4H50JpzDrGx
 for <openbmc@lists.ozlabs.org>; Fri,  3 Apr 2020 02:42:21 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id h14so4403983qke.5
 for <openbmc@lists.ozlabs.org>; Thu, 02 Apr 2020 08:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JZ2eP+GUAi3UPENZ6MtRZ5uwnb/uVb2++dfQPbbpAFI=;
 b=qzCDO6spGza+YgiQBAxOkTAUr81xWKHfcZSv6AQVD34Un5eJsiIux6kagkGTZOfUZ4
 dpYr3MgDxNNRjPtzKQaDgb0G2KnouPolQH2zzPgRA/igKVw/n7vzAmjJMJUe2odigNig
 plLv9MbZmYjLOutEeHGGvaoO6cPHQgGxzx7rvLe8gcs/CeJaPMiDxMRW2KL3/1ZmLVgd
 oQpG1oyB44ILUXuC0RyKtqNe+zY2/G/Cnj1bPUJJbs2hoRVJwgle8w9aD9KITKk/PRQU
 bDWElcXIyma5c/U/uzO2GpHHB91zsa1/a9avv8s6TpBR8DLlo8tFpKeWaopRaVORJjO4
 7bqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JZ2eP+GUAi3UPENZ6MtRZ5uwnb/uVb2++dfQPbbpAFI=;
 b=dMtEhmIyKmlItxBYjAoDyDQ3a41FnM12kKtYvnNOs50rGWwRKampHr7TlzMLF7Vndg
 ROViTrhYvWYpIePccS1XAdcMUMS2Hua225VVFITNLqVBJN5kz8G/1iyTJRhVszMG9edJ
 v6ej6oIOU3M1XeReuaxsKqbB1+/MfqfFyxGpTktb4iYWO1bhOXQlqHbgQDx9iGuBQhGq
 YkoZLCbvnuqhWcqaX3IBL1sqdXZnH90D5vcfVE0SwbWD4uHzPUj+HfbTIYLd0nwn4wSa
 QoRz9jpDg8GNjWojyiK66PHDNwRnKSYx6zP+6DC/420T1cPtetAnoepbe+SbUZlo9Zx2
 sK7A==
X-Gm-Message-State: AGi0PuZn3jErIuSya5vGzCzriGOfx477UtYfWWgMnopgcRI2/A4eIWLU
 SKhmi97BsUEKk4zZS+MB+g4NP+unKFEMn93CJa2K1rqi0aw=
X-Google-Smtp-Source: APiQypL/1MdncZDdV592nppMaacoF7bPVsxP/ILZnK8thLJitMcE8E3ng3M/xI26vrP0PdvY1toOrMFIE5ouhd3zz4s=
X-Received: by 2002:a05:620a:40e:: with SMTP id
 14mr2257361qkp.133.1585842136498; 
 Thu, 02 Apr 2020 08:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200401213251.GA580847@heinlein.lan.stwcx.xyz>
 <20200402153018.GE580847@heinlein.lan.stwcx.xyz>
In-Reply-To: <20200402153018.GE580847@heinlein.lan.stwcx.xyz>
From: Patrick Venture <venture@google.com>
Date: Thu, 2 Apr 2020 08:42:05 -0700
Message-ID: <CAO=notwtgdfg8sDZUeRE6F_10GZG0TVmWRvEW862Amvw+vopqw@mail.gmail.com>
Subject: Re: Dead machines?
To: Patrick Williams <patrick@stwcx.xyz>
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

On Thu, Apr 2, 2020 at 8:30 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> Patrick [Venture],
>
> I even got a bounce from the only person @hxt-semi that has committed to
> this repo.  Can you help track this down?
>
> On Wed, Apr 01, 2020 at 04:32:51PM -0500, Patrick Williams wrote:
> > Hello,
> >
> > As part of the python2 -> 3 transition, I was looking for recipes that are
> > still have a "inherit pythonnative" line to see how much farther we have
> > until python2 is eliminated.
> >
> > I came across two machines that have recipes using the very old
> > "config-in-skeleton" feature and include python2 machine configuration
> > scripts.  Running python 2to3 on the contained scripts give parsing errors
> > even.
> >
> > Do these machines even build and run anymore?  Is anyone planning to maintain
> > them, or should we delete them?  The last time either meta was touched
> > in a meaningful way was a year ago.
> >
> > ./meta-hxt/meta-stardragon4800-rep2/recipes-phosphor/workbook/stardragon4800-rep2-config.bb
> > ./meta-qualcomm/meta-centriq2400-rep/recipes-phosphor/workbook/centriq2400-rep-config.bb

I don't plan to maintain them as I have no mechanism for testing them
beyond just building.  As for deleting them - I can't say whether that
is appropriate - if anyone is using them - perhaps we drop the include
from openbmc/openbmc and then if nobody complains after N months, we
archive the meta-hxt repo, or?

> >
> > --
> > Patrick Williams
>
>
>
> --
> Patrick Williams
