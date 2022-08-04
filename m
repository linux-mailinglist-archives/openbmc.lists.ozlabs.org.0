Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3F1589DFB
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 16:57:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzBfZ3g3vz305M
	for <lists+openbmc@lfdr.de>; Fri,  5 Aug 2022 00:57:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bUH+Fm34;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bUH+Fm34;
	dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LzBf96GKyz2y2G
	for <openbmc@lists.ozlabs.org>; Fri,  5 Aug 2022 00:57:21 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id u1so20916060lfq.4
        for <openbmc@lists.ozlabs.org>; Thu, 04 Aug 2022 07:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=8JNbodMueoEd4ImyROxuslz2NcHFXRVvVz0CY4xXL6Q=;
        b=bUH+Fm34iVCV0p1rnEdX7I6T1s493igT+HExDi/8Bhg86px9EzTwZTVvUSbf23x0of
         mUq+/03uJNyMCFifoCjpjyuHVsojpxUnto7vAtLNf6K34nXhpCkorYve4tN9A0x1IN+j
         7BzjyLh0v7qiC4xxeyC0Nqz9xefm77pozxJFiUCQLTKO5B0jpb5LLj2+twXU/M8SGVEN
         SL/qH7MYCFzgUxfeNB9Uq7GsDPBCSMVr+gMTlehGk1R5bHihdhOhNtJ8IR7cEJoSIFJV
         wCz/688Im08X6cSOzhAuLEmrg2elXqS1NKam5DRQsQr1Bm9kVLcdvnK7PGcvf+vyR6jS
         dDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=8JNbodMueoEd4ImyROxuslz2NcHFXRVvVz0CY4xXL6Q=;
        b=6+qbgVDoOJOI94v/W2FSI4WN6SYjT4lBBUYdCHZBkxlD3uThvCw92aMz19zK7BCSI5
         C9YKSl98RgO3XQ15opY1Aa6QP8xdynyCXgyhLn6MrQZDgwoDrncLZaPfgLef/nAyr04k
         gZ2bxQSe+Y6hRFaN9VWHmGjPgc/r53AXgmsN+jGoEEtcmvw0hpjcxLcri+eIcuDjEYbr
         G7niDsSq+O9B838XYXiKVZe2vVFxn/2AZFy5VObrFUTgwP0b6GWlYqFNvyhfpIqXpIBf
         Y3zMbryjJKCITPax3r32ffjLPgrvxi8GiQqZ97FS44LcQssrCGMjpmm9PtzPY+DccONS
         3v8w==
X-Gm-Message-State: ACgBeo3u6JqcXm4Z2bO9ISJyZzWitcsrxd/Wjdbrvls0va9GQ1X7LLFx
	DiGGyXsGfEJZBK7+mJcR/tYK63vzr1+AWjBsDPo=
X-Google-Smtp-Source: AA6agR7OOuSag4FDjo6Dbl4xoBFIuVP0LQIgpdmgsRMbcMKMGKSS86wDo0KAR/8Kfe7Qgrw6h0G1IyqONkTOqsC5PMY=
X-Received: by 2002:a05:6512:3990:b0:48a:ae02:1000 with SMTP id
 j16-20020a056512399000b0048aae021000mr787247lfu.401.1659625035106; Thu, 04
 Aug 2022 07:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220717121124.154734-1-tmaimon77@gmail.com> <20220718125155.GA40038@minyard.net>
 <CAP6Zq1haOErfj2HZkqKwXZKr3+QvWP2VYK6QQOH5cjHYJ2rV0w@mail.gmail.com>
 <20220726194708.GO3834@minyard.net> <CAP6Zq1hHXiZw2a6+o30N-GUhcA_ZJoYH+wZa8AzLu3NmYST+kw@mail.gmail.com>
 <20220727154700.GS3834@minyard.net>
In-Reply-To: <20220727154700.GS3834@minyard.net>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 4 Aug 2022 17:57:03 +0300
Message-ID: <CAP6Zq1gQkoRqMc2+7ZDjwdyyfAhF+PuNjSQfSSS7yQojXS__mw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] char: ipmi: kcs: add Arbel NPCM8XX support
To: minyard@acm.org
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
Cc: devicetree <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openipmi-developer@lists.sourceforge.net, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Corey,

Sorry, miss this email...

On Wed, 27 Jul 2022 at 18:47, Corey Minyard <minyard@acm.org> wrote:
>
> On Wed, Jul 27, 2022 at 08:39:08AM +0300, Tomer Maimon wrote:
> > Hi Corey,
> >
> > On Tue, 26 Jul 2022 at 22:47, Corey Minyard <minyard@acm.org> wrote:
> > >
> > > On Tue, Jul 26, 2022 at 10:41:38PM +0300, Tomer Maimon wrote:
> > > > Hi Corey,
> > > >
> > > >
> > > > On Mon, 18 Jul 2022 at 15:51, Corey Minyard <minyard@acm.org> wrote:
> > > > >
> > > > > On Sun, Jul 17, 2022 at 03:11:22PM +0300, Tomer Maimon wrote:
> > > > > > This patch set adds Arbel NPCM8XX Keyboard Controller Style (KCS) support to
> > > > > > KCS NPCM driver.
> > > > > >
> > > > > > The NPCM KCS driver tested on NPCM845 evaluation board.
> > > > >
> > > > > This seems reasonable, I've pulled it into my tree.  If anyone has any
> > > > > issues with this, please respond.
> > > > >
> > > > > -corey
> > > > >
> > > > > >
> > > > > > Tomer Maimon (2):
> > > > > >   dt-bindings: ipmi: Add npcm845 compatible
> > > > > >   char: ipmi: modify NPCM KCS configuration
> > > > > >
> > > > > >  Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt | 5 +++--
> > > > > >  drivers/char/ipmi/Kconfig                                  | 6 +++---
> > > > > >  2 files changed, 6 insertions(+), 5 deletions(-)
> > > > > >
> > > > > > --
> > > > > > 2.33.0
> > > > > >
> > > >
> > > > Sorry but I need to do a little fix in the document file.
> > > >
> > > > Can I do it or have you already applied the patches?
> > >
> > > At this point I'd prefer a patch on top of what is there.  5.19 isn't
> > > released yet, so the window isn't open, but that will happen soon and I
> > > don't want to rebase at this point.
> > O.K. thanks,
> > I will wait until 5.19 is released and then I will send the patch.
>
> Oh, sorry I wasn't clear.  You can send it now, I just don't want to
> rebase what I have already.  Just a new patch on top of it, and I'll get
> it in to 5.19.
>
> -corey

Sent a patch now.

Best regards,

Tomer
