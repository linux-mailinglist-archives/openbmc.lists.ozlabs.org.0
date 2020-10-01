Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8038528071F
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 20:43:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2MT56rrNzDqYh
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 04:43:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d43;
 helo=mail-io1-xd43.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oG0yYmS+; dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2MS83MCLzDqY4
 for <openbmc@lists.ozlabs.org>; Fri,  2 Oct 2020 04:42:31 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id y13so7972484iow.4
 for <openbmc@lists.ozlabs.org>; Thu, 01 Oct 2020 11:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JOQ6ZKgQ8ZCXCMKJDHTtraLaapopKYShD2phDj3Rteg=;
 b=oG0yYmS+e1T5uXRSj4TvUhNbpg2z17+BZYqeAXU1PFr0ezd/TLdNtVLR0gFCDEInD2
 kRykQ3f7aLVCcNU6G8qJB5gFVWWHBfXrTTaILxNuOzrcqIQClCj4VCveokS9QxtAw+5I
 J08dl4ZZploa2drM34LOYu6R/sxCMu21yauzWxl0pUiHFXeb5jqow9X5sOdJpk0bfWck
 s93RicVZwUPIh2q2029jiU3amvfxFsrtMgKUvAGlYNuGif/p9hFplh42EfeaaubsDrkk
 n/IBdGFtUDbJ5rqO61N/RvZEeBUILm70SKbHVXqMnxygzpA7zZPQjQh1xe6Wl4lMqhGl
 Dclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JOQ6ZKgQ8ZCXCMKJDHTtraLaapopKYShD2phDj3Rteg=;
 b=qSSfTXJbzzHTD4HCAkszImZpqd8kLLFk6cUEHwhAPRRHchRdkzLnWb2v5UzObTYBXs
 acOlLZk/Kts7A+pIBank+rIRcSCoDAWNBkm1Bjl41MkiNNhlhgvvMyQVlOFR39hsJTZ1
 IxF0seUnF+8DYhIhEpSlU3zm968kQ3H9Pzh3t5ZCVnAMincMx0UXNHb8I6ZGkm0wZgiI
 d4lCWVZIhWD2b0n36MUu7PSjGQGXgAPj63L/sjyKYBp2ANlDOlWFQFYoXMBg+nbfoqp+
 36A84CDeTpfCivhNkJAN57AzudUnrI9QAc+ZlcISuAIajC/0wgglGuO4R3NDUULI4/50
 +NAw==
X-Gm-Message-State: AOAM532892DGMKJ3Ac+iazIkPRDHEnDb37TW4QNIBQqG+T0KpjDDn54T
 yUdHcp9BbBSjoqXn1coDsk6GvzyHDRQD+5bgNQ==
X-Google-Smtp-Source: ABdhPJxwqAxk7naTnZQAbkGhosOtV695WO4v90thLhMqAJnm0go5ZPJjouBs3FLPJ/yIj6kYXag6KZe3fZRf/+L4nes=
X-Received: by 2002:a05:6638:1316:: with SMTP id
 r22mr7331645jad.129.1601577747632; 
 Thu, 01 Oct 2020 11:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200930071342.98691-1-tali.perry1@gmail.com>
 <20200930093117.GY3956970@smile.fi.intel.com>
 <CAHb3i=sWxiVLCC0hfY+6-_x92ZEMY7Ctyyuz9CbMYxrH_BqAZQ@mail.gmail.com>
 <CAHp75Vc3Bw-dTpEmpeUpB4n5-8-xGPx+jm_HkB5Pj6Qr8U=CAw@mail.gmail.com>
 <CAKKbWA4gHobXFGi5CiPnawWoMOi0GFrCbzanuOFZ+Aky6=9Mpg@mail.gmail.com>
 <20201001174046.GK3956970@smile.fi.intel.com>
 <CAA_a9xL+qP3zOy=oKHjCuR+CvsXeoU5EX9WgEhUH0Fza2Vs5DA@mail.gmail.com>
In-Reply-To: <CAA_a9xL+qP3zOy=oKHjCuR+CvsXeoU5EX9WgEhUH0Fza2Vs5DA@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Thu, 1 Oct 2020 21:41:16 +0300
Message-ID: <CAKKbWA62G+B7p-bc7TRoa22iJNGdTUaopQVj3S3_FHh43ntasA@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: npcm7xx: Support changing bus speed using debugfs.
To: Alex Qiu <xqiu@google.com>
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
Cc: Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linux I2C <linux-i2c@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Tali indeed pointed our major customers (Alex represent one of them :)
that this feature must be handled carefully since it may break the
communication and they are aware of that. Nevertheless they still want
this feature, they already reviewed this and accepted it (in internal
mails)

So we will appreciate if this will be accepted.

On Thu, Oct 1, 2020 at 9:27 PM Alex Qiu <xqiu@google.com> wrote:
>
> On Thu, Oct 1, 2020 at 10:41 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Thu, Oct 01, 2020 at 08:13:49PM +0300, Avi Fishman wrote:
> > > Hi Andy,
> > >
> > > Customers using BMC with complex i2c topology asked us to support
> > > changing bus frequency at run time, for example same device will
> > > communicate with one slave at 100Kbp/s and another with 400kbp/s and
> > > maybe also with smae device at different speed (for example an i2c
> > > mux).
> > > This is not only for debug.
> >
> > The above design is fragile to start with. If you have connected peripheral
> > devices with different speed limitations and you try to access faster one the
> > slower ones may block and break the bus which will need recovery.
> >
>
> Hi Andy,
>
> To clarify, we are using a single read-only image to support multiple
> configurations, so the supported bus rate of the devices are not known
> at compile time, but at runtime. We start with 100 kHz, and go 400 kHz
> if applicable. FYI, we are using 5.1 kernel, however I don't know much
> about DT overlay.
>
> Thx.
>
> -Alex Qiu



-- 
Regards,
Avi
