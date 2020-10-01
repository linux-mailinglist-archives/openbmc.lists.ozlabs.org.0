Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2869528068A
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 20:28:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2M7q3bhwzDqZp
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 04:28:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=pLBTVtvJ; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2M6k6PnHzDqY4
 for <openbmc@lists.ozlabs.org>; Fri,  2 Oct 2020 04:27:24 +1000 (AEST)
Received: by mail-oi1-x243.google.com with SMTP id m7so6655784oie.0
 for <openbmc@lists.ozlabs.org>; Thu, 01 Oct 2020 11:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zromK0/y1g94z1qMbmCPDoqoKsF72rgD/Yb3hoPUPLE=;
 b=pLBTVtvJ9NKHNXLlKWMCwrI1NKqibC67z+5cNeyc2WXfC7fy/QkHxOFhguWXhpkjjm
 kvFuUKjdbaHfctbf0UifWDngSs4qrbslBkkmgpOGr0FfupKXFkBf0PCyjzQhD7S5R50m
 mkMv+zD8KygJZmW33d0TB3W2CDZ538/00wp8K/fnc+bLkm/atasPqnnytIWJgjoVe2pn
 m34dE+Ejk4EcyS31EKVlVKAf/+3+p271nX9o+T9vaCkTwMLKi3lVfTx9i8MdD4+feDG0
 YA2A2w5ry4sZigiY1eNKH3KAq/k9pz2DPfFt2tje5PvHWl24z7DGIO5LB8G/yhy2fSn5
 PF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zromK0/y1g94z1qMbmCPDoqoKsF72rgD/Yb3hoPUPLE=;
 b=QBCps4ImpFYt+iJ7E3eXdyiwizXOzMx/7yxpdmSvmCfOxCULVBd9LtKNTxm21Wj55I
 cLMiNrvfU3u2oUgNhuJ/iRz4RmhHwtbYf9u0P/S9aJXisZHXmzcsnmCT2odhKAHLHiJQ
 f0c2e554tnSyypQzeDqk29/p8efVUSsiIJ0sEd8GqK9mvzKyLIqmcpOMhEhQAQOEBLpT
 VtCxD+l8ceBEKz5/pFcHIOiVJnuUZH1QkhpahrnwcNAZmT3SOC1XjcouLZqFDzPuCBgV
 zFl4r9va/i94X9vkkx4nmpr5D7EFnscrrsS3TBmNSlNtpCw+D62qNHJEabw85pZKek15
 t9FA==
X-Gm-Message-State: AOAM530bBJGppORnWd0WIiHi8InVBmAAdlVToKd/hUkCRq0TD84MFbeo
 zJ/p6jRlpcFHgRB0SpJ/4956SYyro/aKXMSFfmOwCw==
X-Google-Smtp-Source: ABdhPJzCcYsTc+Gbn+vcX/SUcoHjDOjZU40L0YDPwvNusAh6NPCap8hFfSdxCse55eKzTcbn+lL3yvgaDWcCEeOq2y4=
X-Received: by 2002:aca:d982:: with SMTP id q124mr824698oig.103.1601576840640; 
 Thu, 01 Oct 2020 11:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200930071342.98691-1-tali.perry1@gmail.com>
 <20200930093117.GY3956970@smile.fi.intel.com>
 <CAHb3i=sWxiVLCC0hfY+6-_x92ZEMY7Ctyyuz9CbMYxrH_BqAZQ@mail.gmail.com>
 <CAHp75Vc3Bw-dTpEmpeUpB4n5-8-xGPx+jm_HkB5Pj6Qr8U=CAw@mail.gmail.com>
 <CAKKbWA4gHobXFGi5CiPnawWoMOi0GFrCbzanuOFZ+Aky6=9Mpg@mail.gmail.com>
 <20201001174046.GK3956970@smile.fi.intel.com>
In-Reply-To: <20201001174046.GK3956970@smile.fi.intel.com>
From: Alex Qiu <xqiu@google.com>
Date: Thu, 1 Oct 2020 11:27:09 -0700
Message-ID: <CAA_a9xL+qP3zOy=oKHjCuR+CvsXeoU5EX9WgEhUH0Fza2Vs5DA@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: npcm7xx: Support changing bus speed using debugfs.
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
 Avi Fishman <avifishman70@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 1, 2020 at 10:41 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Oct 01, 2020 at 08:13:49PM +0300, Avi Fishman wrote:
> > Hi Andy,
> >
> > Customers using BMC with complex i2c topology asked us to support
> > changing bus frequency at run time, for example same device will
> > communicate with one slave at 100Kbp/s and another with 400kbp/s and
> > maybe also with smae device at different speed (for example an i2c
> > mux).
> > This is not only for debug.
>
> The above design is fragile to start with. If you have connected peripheral
> devices with different speed limitations and you try to access faster one the
> slower ones may block and break the bus which will need recovery.
>

Hi Andy,

To clarify, we are using a single read-only image to support multiple
configurations, so the supported bus rate of the devices are not known
at compile time, but at runtime. We start with 100 kHz, and go 400 kHz
if applicable. FYI, we are using 5.1 kernel, however I don't know much
about DT overlay.

Thx.

-Alex Qiu
