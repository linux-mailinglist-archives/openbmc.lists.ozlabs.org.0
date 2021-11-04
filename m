Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC38445AA4
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 20:39:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlYr41ykVz2ymw
	for <lists+openbmc@lfdr.de>; Fri,  5 Nov 2021 06:39:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20210112.gappssmtp.com header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=GbzbI/hL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20210112.gappssmtp.com
 header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=GbzbI/hL; dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlYqd50Wpz2xrx
 for <openbmc@lists.ozlabs.org>; Fri,  5 Nov 2021 06:39:23 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id u11so14186435lfs.1
 for <openbmc@lists.ozlabs.org>; Thu, 04 Nov 2021 12:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5g1CxnQoQOUYWTM4p3PJiTg5VCTZ7GuCSaUMNTxDVZ4=;
 b=GbzbI/hLU8UYO8fRCNWt6LN2v7TiAMxtMoUQZDd9MWhpiXFFZk/jqMlCVNxzwcfS7j
 KuKQHI37rIma3TAz3633pqVbtvnV486rPC9PxuU3uxnwIHC+50FI/EfCBtKAhKAh2Qyx
 2SodpCYji90/9OKtZgVPY9XSmkq9ymP3GyJBA67Cv47nyN6kvokORrxiMZdRI8HhcpL7
 A+C9YT+2Vf1Qc63FhDwtS+4M3P/uxWKdr9clHjXtDhMuTps8c6lI8MOwAR+KHcgBx897
 cCRXYseZmydX1lH0ZVNCwrm4linhzLNQi0DBb1qKh6r0eJormyybRDO1xNiysk6R9wT1
 H4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5g1CxnQoQOUYWTM4p3PJiTg5VCTZ7GuCSaUMNTxDVZ4=;
 b=xi3kJHoiZ7T9Zv8J9U3mMKKZ8yvHpi/yx0anEkCG+VACMGxiDFnoSpCJ3Uy3OI58Cw
 7cOnrzkO0xfUK5DSJ1C0CO09dsyPG0hzh7I/xAWyqKVyYJhcgW+QmNOrGkdhgv2cnG8K
 gbbMhSZfskbCMA78yYDoFX4iPyjZ4sEMa49t9SlGJdrrenfVwHSV8Ovrq1cNGoWMEJO+
 tMUoKq9cgHGdCxMxBMZ4A4Zow7kxVxkUJY/yPmHBWkHeFeuTyv4NlP7x9sGuV/5D601Y
 Zq77/cKHI84duRX3PmQkZW6O7dGkqV1Znj2LGbzHGNYgBgtgQP1iSfhpum/+6HRT9r4s
 ftnQ==
X-Gm-Message-State: AOAM532q7PLKLOgPPzMyQPbrlxn50TLxq8CJ/fgklZ7r7F3tiE9tQPrn
 17QASqCSQhu8EKMTPm1j0cqSTYxLYjajrPEeiNiTgA==
X-Google-Smtp-Source: ABdhPJyJTaFJ57i1FpHiFibpG/vp4lY4hs64d25r0I7e15N46EGL+uf664av9opklGXkeO6tJHucnJ6e6aiEMHaEGxE=
X-Received: by 2002:a05:6512:1189:: with SMTP id
 g9mr12455708lfr.482.1636054756690; 
 Thu, 04 Nov 2021 12:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR03MB3089CFCA31102DE7BB551413F5BE9@HK0PR03MB3089.apcprd03.prod.outlook.com>
 <b71bb325-cf41-deab-5422-11520f85cc55@linux.ibm.com>
 <YXBPMNi5yzzEtE/R@heinlein>
In-Reply-To: <YXBPMNi5yzzEtE/R@heinlein>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 4 Nov 2021 12:39:05 -0700
Message-ID: <CACWQX83=F77Rh=oGJWRd9SkhqFoik-duLGJdVpaU2E+SBgWXQQ@mail.gmail.com>
Subject: Re: [phosphor-logging] About the "Stop emitting Entry propChanged
 before ifacesAdded" change reason
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>, CS20 CHMa0 <chma0@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 20, 2021 at 10:18 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Oct 20, 2021 at 10:13:06AM -0500, Matt Spinler wrote:
> > values, and then explicitly emits the IA signal.   Others can chime in,
> > but I didn't see it as proper D-Bus behavior to emit propertiesChanged
> > before InterfacesAdded, since in fact no property is changing after the
> > interface was added.
>
> Correct.  PropertiesChanged signals should not show up before InterfacesAdded.

But they should still show up eventually (after the InterfacesAdded),
right?  The patchset here seems to be under the impression that
PropertyChanged is never emitted when the object is added, which seems
incorrect, or at the very least is a breaking behavioral change.
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/48231

>
> > It seems like every application does their own thing here, so maybe we
> > can come up with some official best practices for how to emit signals
> > for new interfaces (unless it's there and I missed it).
>
> I'll admit the sdbusplus API is not great for this and a lot of applications do
> it wrong.  There was this issue on the backlog to come up with something
> "better": https://github.com/openbmc/sdbusplus/issues/53
>
> --
> Patrick Williams
