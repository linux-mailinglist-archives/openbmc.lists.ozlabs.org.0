Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F3516DAD
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 00:58:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zFQQ347JzDqLx
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 08:58:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="NF0hTUGh"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zFPg4m2bzDqLT
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 08:57:56 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id m32so18003659qtf.0
 for <openbmc@lists.ozlabs.org>; Tue, 07 May 2019 15:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q0rnowkJir8pLQTWmwqTzPbQwNtFRoLOFMuxuoY0zoE=;
 b=NF0hTUGhObCXdsz0w2xnhi4jnosagXTGSrd4uqYoHrxj8OO0RZ2eEWjblGtX6YSEgQ
 2w8X8L2BcI0HmLzCf71syC4UpwozZ76jQi1s+EmPLn3VwgXSOA1ccWY73mOUlUBrOle0
 x0ihOSa2jpD5d0S2AaxUrpiMSVCvWyRgLTddM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q0rnowkJir8pLQTWmwqTzPbQwNtFRoLOFMuxuoY0zoE=;
 b=V8BXryfsgkZu8iQNUZw+2nlaouGVv1boWceGZ+oM3BFnPUp0UR7tVZl5ZyTFCZReQp
 Ikfoo+PcVtD7knozAnSS2Yw/ldgE+D/ts/NRLarIfnAVKit4clv1Pws1P18dqt5TWqbq
 xynN4E0i9vfyv2SN0E4OajQ6fjjwnNrS+40EGP1o+RiHCHUlOCmnquWsP7Y3Ec6bMHRx
 AHm09jLsU0RvAGqxGN77zUN4Z79GQu18Gka/TSM47cPiZxi4ffiiEKNrn7S4TELfAnMu
 gP1kkUp9vV72Co3VW3EBBvHU2Nno8yxxfXFxjq3S62sOa5KE9AZrxbFlinOfPovNcL6L
 +Chw==
X-Gm-Message-State: APjAAAWP+RnHrSSQuuNGgJd/JfwPPy5VtmemftYb3GBsx/WZUIrfHflQ
 aITzJXwHoPtFZmaT+eLM1LsXx3aART1Sbv4UmazxA0lt
X-Google-Smtp-Source: APXvYqz+jmyoDgH9G/O+f9XRW29+XQylDoGDLz/63xA8puAJ2oMREwKToTq6Hb3Ah3CogIC3biUmanV/OMY/gpB8ekY=
X-Received: by 2002:ac8:5352:: with SMTP id d18mr15725357qto.284.1557269872995; 
 Tue, 07 May 2019 15:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <1551820067-53510-1-git-send-email-anoo@linux.ibm.com>
 <02b66794-19bf-a042-66a9-00fc712355f5@linux.ibm.com>
 <CACPK8Xez-iKZ9h7NB9YX+AfNFtoZhsP9Ap8H+1w-cvmAk1S5xQ@mail.gmail.com>
 <e97fb72d9253a582404c704d743bedb6@linux.vnet.ibm.com>
In-Reply-To: <e97fb72d9253a582404c704d743bedb6@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 May 2019 22:57:39 +0000
Message-ID: <CACPK8Xe+Xgj-S8Kgy=pTkJ8ftkVKivuRpQy3bMYqOka7xj00ag@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add Swift BMC machine
To: Adriana Kobylak <anoo@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2 Apr 2019 at 21:02, Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> On 2019-03-27 01:18, Joel Stanley wrote:
> > Hi Adriana,
> >
> >
> > Are you going to send a v2 that address Matt's comment?
> >
>
> Yeah, I wanted to wait to get a consensus on the flash layout for this
> system to not have to send a separate patch for it, which seems will
> happen this week, will send a v2 addressing the comments and removing
> the TODO to update the flash layout once I get that information.

ping?
