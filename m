Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C45DBF794
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 19:28:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fMMv64fKzDqt3
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 03:28:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CgFw0rY2"; 
 dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fMM22JVCzDqs1
 for <openbmc@lists.ozlabs.org>; Fri, 27 Sep 2019 03:27:41 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id j4so8565315iog.11
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 10:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=96Ks+efXw+IwdOOwAQKZGZTnlYYyJ70xyDtrUGXkxD0=;
 b=CgFw0rY2v2JZnsGOsSGLR/nz+Nbwgmr+2X2Bv3WznIZFBm88X/oxQtnW6hYeUrqU0M
 fxruT6kjuBYvZieIPWPYHOIFkXGctE0mkESPLXvQ+JxZZmS+GBKp/3IH5JdxWL0LUPDd
 v6ngQ8Tu8eIhBfx5iDqfbHg8XC9hPvQC3TjR4B5HJFGhzV/UPU1RagGZYmsvbZdTSAOf
 giUZ9nb/L4/NZVidmwC5NWbalIIe9B4w6rVHkGXnZ8XJ4e7Y8U1uG7Rj9mMCEqtuv6GI
 8LNUettMWhFLc1MOrbFj/KWgC2/9t4T/zu9sJ0AXqu2dFRjFYplNFuMiZocjawbKHHSG
 pYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=96Ks+efXw+IwdOOwAQKZGZTnlYYyJ70xyDtrUGXkxD0=;
 b=R3xkRK0DgvCnoGVnWs4NoHK3uEixi3Iw94FMfB994yjW9SJ3eOtZeo4HUWvBvvB9H3
 eRzZ3MwsdzaJCikMeYlxEY+UTUS5CO/XLepNU54NVoyrIPG2VWtRYCUiYMGw0n/ZLrdI
 zBjrNlNwHmDFpGZGAUAAKHQIdT9UHF6BNnH2bEOVTdNUGU8zujc7V2Nt8nm+Xc8DeoIa
 DkiEzTAstxXIQRP9K8GKWW/xpMbnq8R1cPBWsRciVvX2QKtNtPZlTCiQKW81ckHlqiY6
 YWFamt2SbY6LQuLst2P6KZHhTxDsiVnAEqNS4opnOebmfOeG+CH5CmctBqg5MhYs7ytM
 o85g==
X-Gm-Message-State: APjAAAW5gA9m1zujrgtk9EkGxuouKDOzDqxSpzLs2nIaD9EeuEioDVnO
 3xdgxvcwsWwlVXYYy3GsTnmSH8TkFynUdpxEjxDAtA==
X-Google-Smtp-Source: APXvYqylhvRN0vFzd3SWVXJ2W20CY7llCBppB9jVF2CGAmDG+WZAA//PnbtEPh6zlfiPoWF4y8WDWyzDtxePem7iRZc=
X-Received: by 2002:a92:910e:: with SMTP id t14mr3702667ild.40.1569518857577; 
 Thu, 26 Sep 2019 10:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <E413464F-B8BD-469C-8B58-432C25DEE77C@fuzziesquirrel.com>
 <CAARXrt=SpBeZ+kcg5zjTZ2mHr7Q1YCbNLPJrqaqsBwbv8-AfDA@mail.gmail.com>
 <22c0f2b4-1411-5690-3d19-b0a90890e642@linux.vnet.ibm.com>
 <D7110269-FC33-4C7F-85A6-5A2B26B7FD52@fuzziesquirrel.com>
In-Reply-To: <D7110269-FC33-4C7F-85A6-5A2B26B7FD52@fuzziesquirrel.com>
From: Kun Yi <kunyi@google.com>
Date: Thu, 26 Sep 2019 10:27:11 -0700
Message-ID: <CAGMNF6WsX90bDc5bLPO+f1y8MVwsEegSciyo6kiySA6fFT43gQ@mail.gmail.com>
Subject: Re: witherspoon-pfault-analysis repository rename to phosphor-power
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Shawn McCarney <shawnmm@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Matt Spinler <mspinler@gmail.com>,
 Brandon Wyman <bjwyman@gmail.com>, derekh@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Just found out this thread.. I'm starting to explore extending the
capabilities. In particular, I'm looking at VRMs which can hold device
specific NV fault logs and export them over D-Bus, and then realize
that if the NV faults can be exported to debugfs, the design would be
similar to what witherspoon-pfault-analysis is doing.

Brad, thanks for kicking off the effort. Was the transition already in-prog=
ress?

On Mon, Sep 9, 2019 at 5:00 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wr=
ote:
>
> at 11:39 AM, Shawn McCarney <shawnmm@linux.vnet.ibm.com> wrote:
>
> > On 8/21/2019 9:18 PM, Lei YU wrote:
> >> It's noticed that there is `phosphor-power-monitor`, is it the repo to
> >> hold the
> >> previous `witherspoon-pfault-analysis`, or it is a separated one from
> >> `phosphor-power`?
> >
> > I believe the plan is to rename 'witherspoon-pfault-analysis' to
> > 'phosphor-power' and then remove 'phosphor-power-monitor'.  Brad is sti=
ll
> > working through the details.
>
> Yes this is (still) the plan.  I=E2=80=99m hoping to get this wrapped up =
this week.
>
> -brad



--=20
Regards,
Kun
