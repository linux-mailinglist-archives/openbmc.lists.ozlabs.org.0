Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C199528030A
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 17:41:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2HRR5wL7zDqZG
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 01:41:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Hr0a0OQt; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2HQ91RTVzDqRW
 for <openbmc@lists.ozlabs.org>; Fri,  2 Oct 2020 01:40:27 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id z19so4854112pfn.8
 for <openbmc@lists.ozlabs.org>; Thu, 01 Oct 2020 08:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CRuZs9KHdyyYtPSV5xRlxB+ahr3F1mpnApAGbMQJe8k=;
 b=Hr0a0OQtfgl4zIji3XUa3fFfK5RfJpAdY+yQbTzoZFPH2Qaj5Ekstbrf+p376/SWuX
 ey4jfFLEpIQDoFFQ04RY0xw/ZVkato24qgCdFW4tmDTFbxHbZakFX19SqtroY5RVY/ed
 MypLcyzoRvaek0+JXyylZo+szdxuhwoTTCtB+NDiO9EVcZ/fHGQBU8vj2krdUCLtJLWt
 ph+LnPVIJwpFTfMqEakJU9vQ0eDcs60i/i38w3DNdDYEW29leIjYwGnq+2bvNijooqDr
 Ay6MKB735oJdFDj3KkgKn84B/PbZLeHHcV/uuBU24GcbZ6VTjcllfzz0O+eRADTe6yR1
 Pf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CRuZs9KHdyyYtPSV5xRlxB+ahr3F1mpnApAGbMQJe8k=;
 b=kCP51/jw32hiz+W+wLf7C0x+yjwC1bt4W3zt2hLqy3uZnu7n405iJX6evdlG7JZKr7
 xL2uBExEYZe/lau2qmYgiIQeqUBFQt/sjCHqQooqGk1UtrosMSa7FQXQl0k69d1Bu07K
 dMxU2IkZ1WhTu0mk30ihaXd/bbwZzs6Msw/8ElmYYPLdyrH1f9YZ1Fxof1lp7eZkAukt
 01nni0Dl51USNdRH69h+7OkG2E7MEFbHaYkM30djfnXYELga5nA1rBJH5fV37wFZX0W8
 tL0PyoFFwBqHODcr1Dk36WDwvM562Cip8nT4lsi0uRwFmV4R3Phqb3eby/ese0gMepAq
 htbQ==
X-Gm-Message-State: AOAM530R612fFgaN/5o+430xozran+3zke5cN7pNXlIRPeNjoBcO4xjQ
 kckiAm5Ha9T35vohKGBA7Ycn/n3JJRoqJf6LLxE=
X-Google-Smtp-Source: ABdhPJwT899GYXRw8GE7u8G1rtsolFPiTLN/iw8E9NSTOKvHjNfKr8yObP+2SnbsOi0vqP2w/nYBf0U5cszAq8Iq8ZQ=
X-Received: by 2002:a63:d648:: with SMTP id d8mr6561587pgj.4.1601566823284;
 Thu, 01 Oct 2020 08:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200930071342.98691-1-tali.perry1@gmail.com>
 <20200930093117.GY3956970@smile.fi.intel.com>
 <CAHb3i=sWxiVLCC0hfY+6-_x92ZEMY7Ctyyuz9CbMYxrH_BqAZQ@mail.gmail.com>
In-Reply-To: <CAHb3i=sWxiVLCC0hfY+6-_x92ZEMY7Ctyyuz9CbMYxrH_BqAZQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 Oct 2020 18:40:04 +0300
Message-ID: <CAHp75Vc3Bw-dTpEmpeUpB4n5-8-xGPx+jm_HkB5Pj6Qr8U=CAw@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: npcm7xx: Support changing bus speed using debugfs.
To: Tali Perry <tali.perry1@gmail.com>
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
Cc: Alex Qiu <xqiu@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Avi Fishman <avifishman70@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Linux I2C <linux-i2c@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 1, 2020 at 8:34 AM Tali Perry <tali.perry1@gmail.com> wrote:
> On Wed, Sep 30, 2020 at 12:31 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Wed, Sep 30, 2020 at 10:13:42AM +0300, Tali Perry wrote:
> > > Systems that can dinamically add and remove slave devices
> >
> > dynamically
> >
> > > often need to change the bus speed in runtime.
> >
> > > This patch exposes the bus frequency to the user.
> >
> > Expose the bus frequency to the user.
> >
> > > This feature can also be used for test automation.
> >
> > In general I think that DT overlays or so should be user rather than th=
is.
> > If we allow to change bus speed settings for debugging purposes it migh=
t make
> > sense to do this on framework level for all drivers which support that =
(via
> > additional callback or so).
>
> Do you mean adding something like this:

Nope. I meant to use DT description for that. I=C2=B2C core should cope
with DT already.
I do not understand why you need special nodes for that rather than DT
overlay which will change the speed for you.

--=20
With Best Regards,
Andy Shevchenko
