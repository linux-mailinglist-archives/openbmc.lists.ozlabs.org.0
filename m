Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5362FDF51B
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2019 20:32:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xlcj3KlXzDqKS
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 05:32:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Dr0CbHO6"; 
 dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xlbl6N25zDqDb
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 05:32:01 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id w3so8315626pgt.5
 for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2019 11:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PXJikJIcVd0qtktffbHYmuWQoK1KOVgtlI57DDZLIgQ=;
 b=Dr0CbHO6DeH1PSCiU3Z8+syCvtP+2Iry7aR+OkJljaOkaacsUIWsX2Q5xdBSsWb94m
 HyLNBfexbIBgLvd/7AFl2JPwnhjEJFGzjPYYZQHLmawwRSAIKVBSQsukp9+nTl9rGuep
 CtX+YpaqQhtfgb0u++xoQVcJyVOY4G95YaGdDLNdKIEi0+ZSBboytmR6VHSS5dugGuKG
 uGDmJ0T8DW1wjWcrd52CtgYWYAy/BRGWwHsYxFuAnm4zGqxAUHebaZovQQuGBb2lYxxF
 dVgNaxFro+LgbW8+z0oViUJNDI8YnpkP8m9DinTa8ih0dK5burTEeZTZC0vW53yjulVb
 OkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PXJikJIcVd0qtktffbHYmuWQoK1KOVgtlI57DDZLIgQ=;
 b=VTbG5dpS8MsfMbxW0+IXnEm5ovf67VpR3kOp6phgILAG/dcwV+NTtwYq23/kS+wZn4
 g5CAJ0aX2EWdx8IJzf6RoeT1VCu2i6SRZJgqOiKxD8EQYNDFpnVNCe37n8uLQFg8n+tq
 JhT2rf/dBUrSdHlBsyFbkXdCgoOyzVvtTEXC26WhLsu8I179OyWjRPNT0p/YzmQWLhiz
 7AWKbvBccB8mtsr4wPYU2Nbi2JtoDP1772NAF4nT9AFv2Cj27y/AEHhGPn3myDkuBmIP
 Vzr8LD55s26XF02tkFyLgtLNLDklYUJeJIigK9oLJciS3dNz3skKJZdLkSwoHyEkuQ1M
 Hk5w==
X-Gm-Message-State: APjAAAWZK/Ktp2/nga9ufM6PbrNeH6uo2yRgrKFPpLeVnqVsBjPYR3LM
 fcU4i6YS004dgOPtID64iA1UkNfLiV11bL4upwjqRw==
X-Google-Smtp-Source: APXvYqzSAgLGJosU63OZhpQkNaR+iXKlVCJ0aWYA5cUgaBzS05BfJJD3PE8lWOwJFb90BZzsDwVDwuhNctIK/EQBUao=
X-Received: by 2002:a63:f854:: with SMTP id v20mr13297476pgj.92.1571682717590; 
 Mon, 21 Oct 2019 11:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwQoW6zM_NnDbukXpvhG+OKXn2Nw0Lnzh_E87P4SF+kAw@mail.gmail.com>
 <8238ceee-ae3a-89b1-3742-0e920b19486b@linux.intel.com>
In-Reply-To: <8238ceee-ae3a-89b1-3742-0e920b19486b@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 21 Oct 2019 11:31:46 -0700
Message-ID: <CAO=notyVtScvqawE+1ym+xi6eQYQ7fHjaE9GZ+BF4vOu+qou0w@mail.gmail.com>
Subject: Re: entity-manager frudevice interface
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 21, 2019 at 11:19 AM James Feist
<james.feist@linux.intel.com> wrote:
>
> On 10/18/19 5:02 PM, Patrick Venture wrote:
> > James;
> >
> > As you know, I've started adding:
> >
> > "xyz.openbmc_project.Inventory.Decorator.FruDevice": {
> > "Bus": "$bus",
> > "Address": "$address"
> > }
> >
> > To my json files.  But I was wondering, this feature -- being able to
> > point back to a FruDevice by bus+addess may be sufficiently useful
> > that entity-manager always adds it when the probe result has a
> > bus+address.
> >
>
> I would generally disagree with this, as the FruDevice was meant to only
> be 1 type of probe, and I imagine in the future we'll have gpio, mctp,
> etc types of probes, and I would like to keep it generic as possible,
> and have EntityManager not care what it found on the other side of dbus.
> If there was some way to make it more generic I'd be interested.

Understood.  I'll just keep it in the hardware profiles -- no big deal :)

>
> > Thoughts?
> >
> > Patrick
> >
