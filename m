Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BD08ABC2
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 02:05:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466tJl1kHqzDqdf
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 10:05:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="J3OmfHSV"; 
 dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466tJ86zmgzDqJt
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 10:04:54 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id v12so2735225pfn.10
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 17:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gyd0bOVUWQU+ATsgT75TbuwqElJQM1nlGRrcb2IGlDg=;
 b=J3OmfHSVJ8qDnX9wJS7TgqnbiKePzri9ruwfr+L2wTxp/WtFcrTj0M6xGuMcdb7iCo
 4e1XH9ah5Gi8ue3QgR3JxtOu/YFGSTBHXfqJE2JHrCNhZcK2m8h63UFYht8OMBPN2B1P
 T4gUBFLRQ/337dtOIUz7rJTlNGINXa13Gwu5I64beEnsy0B6rdHGlkgO1rOdO2rMP5Xi
 Qk4/eCoC4rVvUaxu+Q9KgUNWc1gm9jFRQllARxVZsLBouuznn28usMEDXoVlC9dCklLT
 ftKWraVsgXCoVlrxTIl6XSF1jadd2u2VkYxgTcX+iOS2t5T/Xsk2aiymORuCd0bt2o2H
 +J3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gyd0bOVUWQU+ATsgT75TbuwqElJQM1nlGRrcb2IGlDg=;
 b=e4nEk5fOdg+Ebiy0ovOyhrVU0JCG4HT9We7BSgCT91f3omxhz00qJPn8vXzMlj+Jfg
 ONH6g8kCkY6mcRmRq7mh/5KYlyuIBa9IsieXkGHANjCWYthPg7CHjRQ1z+GlZecvCfRg
 hYbBU/NOPMOCz9JYF6mm+Bs3B8nnxpj3SgAjZ/qgwQ3GtV5BpZuBv16TOdNwlmNrOY1d
 zDpATQSuAJsta7qQx4B1HF9sbMkzgUlC+ox3OHm/BVt4Iabszq+mymDxK7Fcvui44BlB
 QpBb+FMPMy9NJbzDPWQyw00z344c3u7eeGWe0uitoqR0nH2WYckZfqg0FANPROJ7Ctv2
 qsYg==
X-Gm-Message-State: APjAAAXEJAYUXFLkhQQTk681hJRMWWwHDolVIWLj+yrU2Q0vynyGl3A9
 CvoTY3feforzi+mMxJ49rx+lc0/PqafoWHMRCIPnMJCW7hI=
X-Google-Smtp-Source: APXvYqxW6H6gvYtJ02l1QtTFM9Z1ocEZULQex6Mp2VO2Yc4zlR/s4DbDo6/XjmKJglEWbg/g4ZpPoURoSwxTSMNh//o=
X-Received: by 2002:a63:2784:: with SMTP id n126mr31214680pgn.92.1565654691065; 
 Mon, 12 Aug 2019 17:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notykGFd7Ux3k6OcsskrKTAxLa=vEiybFD3agPuqkGoYG-Q@mail.gmail.com>
 <3f980968-f67f-1529-e681-e351c597a2ff@intel.com>
 <CAO=notyEk_g5O0CujPMha0bCAYgo8W3MMEjNu4jmSEVYZ5htsw@mail.gmail.com>
In-Reply-To: <CAO=notyEk_g5O0CujPMha0bCAYgo8W3MMEjNu4jmSEVYZ5htsw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 12 Aug 2019 17:04:40 -0700
Message-ID: <CAO=notypEwBHu75hyLOQZPDq8CLMGVU9OOnuCCJ7c4-1DYSagg@mail.gmail.com>
Subject: Re: template replacement
To: Ed Tanous <ed.tanous@intel.com>
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

On Mon, Aug 12, 2019 at 5:00 PM Patrick Venture <venture@google.com> wrote:
>
> On Mon, Aug 12, 2019 at 4:58 PM Ed Tanous <ed.tanous@intel.com> wrote:
> >
> > On 8/12/19 9:10 AM, Patrick Venture wrote:
> > > I've run into an issue and before I submitted a patch to solve my
> > > specific problem, I wanted to get a sense of what was intended:
> > >
> > > I have a field "name" that I want to set dynamically to "$bus_v2345_0_local"
> > > It finds the $bus match but then fails on the split.
> > > If I add a " " it then fails as well.
> > >
> >
> > Probably just a bug.  A quick scan of $bus in the configurations shows
> > that we've only ever used it in cases where it was the complete string
> > (ie "$bus") and even then, only used to populate numeric interfaces with
> > the bus number to be used programmatically by downstream sensors.
> >
> > Some of the intent was to largely remove the bus number from the device
> > naming convention, as outside the system the bus topology is largely
> > irrelevant.  With that said, I could see how that might be desired for
> > some setups.

To expand on this, I'm going to add a new template option "$slot"
that'll read the pcie-slot information from the device-tree and
convert the bus to the slot information, since that's semantically
more interesting.

>
> Yeah, I figured out it -- there's an assumption that a field has at
> least two other words other than $bus.
>
> So like "$bus card temp" will work -> "26_card_temp"
>
> But "$bus temp" will not -> "$bus_temp"
>
> If the field ends with "$bus" it'll just end up being that value as an
> int and lose the rest:
>
> "this that $bus" -> 26
>
> I haven't tried to debug the last case yet, and the names I'm using
> happen to be two extra words, so I can hold off on fixing that more
> generally -- i have a patch that should handle it, but haven't had a
> cycle to test it.
>
> >
> >
> > > It seems to be that if a template is at the end of the field, it works
> > > fine, otherwise it assumes there must be some operation to perform.
> > >
> > > Did you already have a fix in mind?
> >
> > James is out the next few days, so his answer might differ from mine
> > when he gets back, but I don't think we knew about this issue previously.
