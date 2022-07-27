Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C98BE581F98
	for <lists+openbmc@lfdr.de>; Wed, 27 Jul 2022 07:39:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lt2fW4jPZz3c3N
	for <lists+openbmc@lfdr.de>; Wed, 27 Jul 2022 15:39:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NztSDmjZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NztSDmjZ;
	dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lt2f750Y2z2x9J
	for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2022 15:39:27 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id y11so25418452lfs.6
        for <openbmc@lists.ozlabs.org>; Tue, 26 Jul 2022 22:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TiljjiRdL3J7XgA9lRW8mh7Q8UMy2rckFdpaiD+6ujw=;
        b=NztSDmjZzcPZTSmd5mq8HZlLFMGzHBXihUfv2sk5AX6Sm+oTSk2v97ABQJmVcRKGCr
         nI7dnqm4kSht8qcX+gw4Q8cSGhYGf1bjKvSyIlN9SlgqU59J9Ul56QJLCovYcBnfmJRD
         q6aLBlqsk7zmebygt0OPCeF5TLKGokvEcikOnaCurlpsi+kPxbBWQrZuG1kqY21lmCcZ
         3xF9QLcn1wTH5Aw6y8NGMxumMK6ob4Yp4Odcw9uoMz45IJ5PJAb6xDLzXVmKOb/f79pv
         oVNGbJSXYKtNM4EOmduPLzVooWUbOD9Ly63UwrLi11GBnoMikbrVq7T5U6J/Xx64KBWO
         fmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TiljjiRdL3J7XgA9lRW8mh7Q8UMy2rckFdpaiD+6ujw=;
        b=qLIOfQMEthGxe0/A9IO70Oc9QdqT3ZdzdYMtdq3D3jUOw8wIZSzD0TsORIU1ICcqeh
         Qi9ySoZS/dK+O3k4MCcVFc/1LneHpvH3ABCJVQPyaeFvaduP1UOH/Eu1wb4ToYfRsf4/
         T/GICbn0ZmrCiOplwCKnpdZli8cnI4e0J/iPktxoQPnLxIJlZMUS6+yTcO2VErYu1jH2
         t/EcFMG6pNKBRPP7W4ckh/eUgVSHcE2h69MK2iQ4/32tT8HgPBOBurk9ugLBxJSFK3Hv
         T4p3xlq9fyfpA0duJjxV3FDH0q1b5b7NQ1jJpVuC6cYpOHdxAjFfaSlq+iSA0J5WMHPd
         esKA==
X-Gm-Message-State: AJIora+kiFFKDdKQ9XFADkfJQW5iEf/e2mzdsIn0/i+ZF0JRMuy/DRC+
	30wmuxP4AkS9llAX9mPtLbYzz/N/wfacCQmGQMY=
X-Google-Smtp-Source: AGRyM1sj7CHKLLCJA3ZngRRcjw+xywD9YKDbSReMjh5p7lbqdpuRzGLay2un7mt8GHo/w/Z9ge1Msi88eyTx3z6We6w=
X-Received: by 2002:a19:6d0d:0:b0:48a:8b3c:e28 with SMTP id
 i13-20020a196d0d000000b0048a8b3c0e28mr4826021lfc.265.1658900360081; Tue, 26
 Jul 2022 22:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220717121124.154734-1-tmaimon77@gmail.com> <20220718125155.GA40038@minyard.net>
 <CAP6Zq1haOErfj2HZkqKwXZKr3+QvWP2VYK6QQOH5cjHYJ2rV0w@mail.gmail.com> <20220726194708.GO3834@minyard.net>
In-Reply-To: <20220726194708.GO3834@minyard.net>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 27 Jul 2022 08:39:08 +0300
Message-ID: <CAP6Zq1hHXiZw2a6+o30N-GUhcA_ZJoYH+wZa8AzLu3NmYST+kw@mail.gmail.com>
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

On Tue, 26 Jul 2022 at 22:47, Corey Minyard <minyard@acm.org> wrote:
>
> On Tue, Jul 26, 2022 at 10:41:38PM +0300, Tomer Maimon wrote:
> > Hi Corey,
> >
> >
> > On Mon, 18 Jul 2022 at 15:51, Corey Minyard <minyard@acm.org> wrote:
> > >
> > > On Sun, Jul 17, 2022 at 03:11:22PM +0300, Tomer Maimon wrote:
> > > > This patch set adds Arbel NPCM8XX Keyboard Controller Style (KCS) support to
> > > > KCS NPCM driver.
> > > >
> > > > The NPCM KCS driver tested on NPCM845 evaluation board.
> > >
> > > This seems reasonable, I've pulled it into my tree.  If anyone has any
> > > issues with this, please respond.
> > >
> > > -corey
> > >
> > > >
> > > > Tomer Maimon (2):
> > > >   dt-bindings: ipmi: Add npcm845 compatible
> > > >   char: ipmi: modify NPCM KCS configuration
> > > >
> > > >  Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt | 5 +++--
> > > >  drivers/char/ipmi/Kconfig                                  | 6 +++---
> > > >  2 files changed, 6 insertions(+), 5 deletions(-)
> > > >
> > > > --
> > > > 2.33.0
> > > >
> >
> > Sorry but I need to do a little fix in the document file.
> >
> > Can I do it or have you already applied the patches?
>
> At this point I'd prefer a patch on top of what is there.  5.19 isn't
> released yet, so the window isn't open, but that will happen soon and I
> don't want to rebase at this point.
O.K. thanks,
I will wait until 5.19 is released and then I will send the patch.
>
> -corey
>
> >
> > Thanks,
> >
> > Tomer

Best regards,

Tomer
