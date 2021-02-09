Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D33B7314EC2
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 13:14:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZhdr39hGzDrhK
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 23:14:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=UGlY2FQW; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZhZN57MTzDrhK;
 Tue,  9 Feb 2021 23:11:18 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id m144so1843427qke.10;
 Tue, 09 Feb 2021 04:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9b1+FT42iYfcBaXACNqZZ8m0dOYDgpi8jpItwihB888=;
 b=UGlY2FQWhtT3walGbEZSEZicPmfHAAfnO+Qy2cpBcfFE/eCtSyGhllrt7V3ARb+idi
 VZmpoIChaC56Wocfdzm1xDhttnJKU2403POE7bOYgWPj0jFttWxJPiUHMEt9Rug7z7/G
 gZKy8gxFr7zOIt15N98S/AxtUPaWeD5aZRssE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9b1+FT42iYfcBaXACNqZZ8m0dOYDgpi8jpItwihB888=;
 b=O+1LfGApso0tYn4erWqEHBBFXckrH/CLKROkzXVbwAK3CJMh1P1uf+QwnBOxUzIDIn
 01dRNschQc8lEIOqx13SmIffn5lHMxYd/4MA1oOMfrBoBnsApzjZQ7RT78qEq/jlac7x
 qaCkPr2hIWdty2JdQds9cwpigAX2REkBj1YUWqeIRXV8rQj//hcsJ3c6caBINM4KUR+w
 L3FkaBk7vttl7qFNI2szqr05Eslb20hFshvxrUYW1eMgQrqGI2ohTfvr9P3zLl7ve3hQ
 Jr7yimJttdkec7c2a5VMS/4CWJhCmgyjlJ5bzX2aX2+6fxNLt0IgE8WBFdHfaBdgYcTP
 X8zg==
X-Gm-Message-State: AOAM531d5h5OuRwoQH7ZQ5g5e7FuxMNP9KyLpZVbQ9WSIuMD9r519grj
 g5aAIJmCivwWTi/AwSgaebN8oGco7PSaQlL8peo=
X-Google-Smtp-Source: ABdhPJznG+/3DRBuaBXOdhGQaUyUKQ7CvJxjrD65Ucij76t+VNLlWYhA5nJdNKP2loti8FRSBk9GJ1U7fyFVqRwjKmQ=
X-Received: by 2002:ae9:e314:: with SMTP id v20mr11627616qkf.66.1612872671495; 
 Tue, 09 Feb 2021 04:11:11 -0800 (PST)
MIME-Version: 1.0
References: <20210112003749.10565-1-jae.hyun.yoo@linux.intel.com>
 <20210112003749.10565-2-jae.hyun.yoo@linux.intel.com>
 <20210114193416.GA3432711@robh.at.kernel.org>
 <4f67358e-58e5-65a5-3680-1cd8e9851faa@linux.intel.com>
 <CACPK8XcZTE=bnCP1-E9PTA09WnXG9Eduwx0dm-QqmQJUDa_OrQ@mail.gmail.com>
 <1814b8d1-954c-0988-0745-e95129079708@linux.intel.com>
 <87ed4085-26e4-98f8-21e3-b1e3c16b0891@linux.intel.com>
In-Reply-To: <87ed4085-26e4-98f8-21e3-b1e3c16b0891@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 9 Feb 2021 12:10:59 +0000
Message-ID: <CACPK8XekihpoXEeyUbWSXsRkVMbX1gKG-gSeYgWq=s3UR2gi1g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: aspeed: add buffer and DMA mode
 transfer support
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 devicetree <devicetree@vger.kernel.org>, Cedric Le Goater <clg@kaod.org>,
 Tao Ren <taoren@fb.com>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 3 Feb 2021 at 23:03, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> Hi Joel
>
> On 1/28/2021 11:36 AM, Jae Hyun Yoo wrote:
> > Hi Joel
> >
> > On 1/27/2021 4:06 PM, Joel Stanley wrote:
> >>>> All this information doesn't need to be in the binding.
> >>>>
> >>>> It's also an oddly structured dts file if this is what you are doing...
> >>>
> >>> I removed the default buffer mode settings that I added into
> >>> 'aspeed-g4.dtsi' and 'aspeed-g5.dtsi' in v1 to avoid touching of the
> >>> default transfer mode setting, but each bus should use its dedicated
> >>> SRAM buffer range for enabling buffer mode so I added this information
> >>> at here as overriding examples instead. I thought that binding document
> >>> is a right place for providing this information but looks like it's not.
> >>> Any recommended place for it? Is it good enough if I add it just into
> >>> the commit message?
> >>
> >> I agree with Rob, we don't need this described in the device tree
> >> (binding or dts). We know what the layout is for a given aspeed
> >> family, so the driver can have this information hard coded.
> >>
> >> (Correct me if I've misinterpted here Rob)
> >>
> >
> > Makes sense. Will add these settings into the driver module as hard
> > coded per each bus.
> >
>
> Realized that the SRAM buffer range setting should be added into device
> tree because each bus module should get the dedicated IO resource range.
> So I'm going to add it to dtsi default reg setting for each I2C bus
> and will remove this description in binding. Also, I'll add a mode
> setting property instead to keep the current setting as byte mode.

I don't understand. What do you propose adding?
