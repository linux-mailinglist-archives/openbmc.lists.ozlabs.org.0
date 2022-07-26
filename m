Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9F9581A77
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 21:47:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsnWK4kFBz3c1x
	for <lists+openbmc@lfdr.de>; Wed, 27 Jul 2022 05:47:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EFEbG43P;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EFEbG43P;
	dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsnVv0QZzz3bgR
	for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2022 05:47:16 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id l14so11245260qtv.4
        for <openbmc@lists.ozlabs.org>; Tue, 26 Jul 2022 12:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=MAfdgifMMcfE/yXjpXpDSHvlhww07gmdGSC9ysTyuKc=;
        b=EFEbG43P2uz2lGXat4fyCPRM6thWWiiPkREsQpPN9+O/mqwyPckmqGwpoViHGCerJi
         QJlsMvlsxh9syDqBgncXxRlxo6namrgimntsHIOnjDl5VHWOb/6Pw1w+awTQ/s1YI8U7
         C0o4IGmuShLE0ehpCGpGPtG7QgQ9YxUt+1VNHrhgbgRs4dKUUb3kEeJNsfedphWsxX6R
         0z0KnBSoQoGh8XTvTM0iDMVL0XcqJaGh4RJMCGvzFyQfHvXOvsIVwdmnLw1zqNr1sBYL
         wyf+aFwi7hX1MRVi0Ko/r3NbFh8Vd1gweAUuErvI7HfPlvI+4Xmch/7b7qkPWiyYkrPA
         xayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=MAfdgifMMcfE/yXjpXpDSHvlhww07gmdGSC9ysTyuKc=;
        b=v4ItXY+4eMrMgKT1fSaSnMCPxSFsFr5aYUNdHu2vmJZi/kntzH+qjTkJYT32Xo5fOW
         FJiCXhC0AaPb7nW+3wRF8NFTOaJ0SSe2a3iAWOF+KW4YnsHIWEzVGE0D/Wvg1pgwouTg
         4YSo9aGaoOXLl7H648bZlBrsZOGbEwbQJuCRcOSXwYzwjsHjL3IGHNL2siCTKTVQNAhX
         IFO4dbZumHAdK2+oCVYMMfEn4nYUvX/I22B0IC69YHR/k5eGMOEpyw6kMl1It7LC0VEl
         dvmTB/ED2RQNEnwPA0SmazFbsZ1ZEPHmyMIrS/F8mTJtbS0jBmXw4ZK03FnWfuAE2dpH
         J1pQ==
X-Gm-Message-State: AJIora+6pTJCn7Zo7O8FG4DbliQOJ5j1Ml+D+wSXpNPtv0NwR+p4E/kM
	QbTAMxRIT+xSgjjQyoR6KA==
X-Google-Smtp-Source: AGRyM1tue0AfzJLG/Yn1jOuSrSPoqrsACDpveUi3WRkpV2rVPonkxoGaJ7hxgOnC0yfQXb79hjIKSg==
X-Received: by 2002:a05:622a:109:b0:31f:3302:3367 with SMTP id u9-20020a05622a010900b0031f33023367mr12518641qtw.488.1658864831713;
        Tue, 26 Jul 2022 12:47:11 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id y17-20020a37f611000000b006b5e50057basm11427786qkj.95.2022.07.26.12.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 12:47:11 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:495f:ee54:913c:d540])
	by serve.minyard.net (Postfix) with ESMTPSA id 21AE81800D9;
	Tue, 26 Jul 2022 19:47:10 +0000 (UTC)
Date: Tue, 26 Jul 2022 14:47:08 -0500
From: Corey Minyard <minyard@acm.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 0/2] char: ipmi: kcs: add Arbel NPCM8XX support
Message-ID: <20220726194708.GO3834@minyard.net>
References: <20220717121124.154734-1-tmaimon77@gmail.com>
 <20220718125155.GA40038@minyard.net>
 <CAP6Zq1haOErfj2HZkqKwXZKr3+QvWP2VYK6QQOH5cjHYJ2rV0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6Zq1haOErfj2HZkqKwXZKr3+QvWP2VYK6QQOH5cjHYJ2rV0w@mail.gmail.com>
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
Reply-To: minyard@acm.org
Cc: devicetree <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openipmi-developer@lists.sourceforge.net, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 26, 2022 at 10:41:38PM +0300, Tomer Maimon wrote:
> Hi Corey,
> 
> 
> On Mon, 18 Jul 2022 at 15:51, Corey Minyard <minyard@acm.org> wrote:
> >
> > On Sun, Jul 17, 2022 at 03:11:22PM +0300, Tomer Maimon wrote:
> > > This patch set adds Arbel NPCM8XX Keyboard Controller Style (KCS) support to
> > > KCS NPCM driver.
> > >
> > > The NPCM KCS driver tested on NPCM845 evaluation board.
> >
> > This seems reasonable, I've pulled it into my tree.  If anyone has any
> > issues with this, please respond.
> >
> > -corey
> >
> > >
> > > Tomer Maimon (2):
> > >   dt-bindings: ipmi: Add npcm845 compatible
> > >   char: ipmi: modify NPCM KCS configuration
> > >
> > >  Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt | 5 +++--
> > >  drivers/char/ipmi/Kconfig                                  | 6 +++---
> > >  2 files changed, 6 insertions(+), 5 deletions(-)
> > >
> > > --
> > > 2.33.0
> > >
> 
> Sorry but I need to do a little fix in the document file.
> 
> Can I do it or have you already applied the patches?

At this point I'd prefer a patch on top of what is there.  5.19 isn't
released yet, so the window isn't open, but that will happen soon and I
don't want to rebase at this point.

-corey

> 
> Thanks,
> 
> Tomer
