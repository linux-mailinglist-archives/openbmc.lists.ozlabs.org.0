Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B3965012
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 04:02:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kfTN3MlvzDqhl
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 12:02:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KSU7fy0P"; 
 dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kfSs246xzDqcg
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2019 12:02:20 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id h6so9074739iom.7
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2019 19:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D0JGpYYLwvVj4SxY4miPm78ehXhBCuFIXAAdu9PG9ec=;
 b=KSU7fy0PFYZTUcetekJviEIj7JCHmhZVX55VDmvx2A3VKf/pso9cwJRoajUMY2jmkC
 eBCvq8g7a+7mmTaPoaD6vwEAC08NwA/nQjj3RVDE0VQpli7GKHJv4PDgcU4a2vhhDdoJ
 y0HfuarhFgbbNmGvHmXb5HueRfUYw/nOSMkm0586fEwz+QCBZLvJUGHWh8z1ahKa8l25
 m7BSOmFnbEvIv0k/8OEtfSpZ1uYp0L35yNQUlcYMSb+Q3CIN+wMKcAM5K5vewaNJolCY
 VNs5IF6v6bfRZrEOs0Zmoqx/l+8NxE5kzemPS9KKH/GbnhqyQ78TM7PEVdLeScPfOzgA
 Aw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D0JGpYYLwvVj4SxY4miPm78ehXhBCuFIXAAdu9PG9ec=;
 b=kChn2ZAmnuc+KQBwA/B5OunGziuvws7i0hGtK88T1f1JLsBqln86VSeMfRc9FmW0ey
 pLEdKg49ae/rTl9S922udPcwXrJvPo0VqxtlYLjBIa2blhE2s3+0r4BkeICXa4Aw7Ibb
 Ly5Bz+f7WnJg744YG6zuXzUPYdiTKCNxh33qdIlkRLPDEk1PLo+BgpUVdRwy/QqY0/an
 souHbGVKwIbDHw90wS1BqNaIhNneoimG3d764ynekKtACoFdQQm7onOqo2axbUuAuUE6
 xWIkewsLLqe+oOne6U1pRMGuMdqxUn8oCbmurX+C+Ihk1qM1zb4TsqgfAzM6I/MeMJ1B
 6yiA==
X-Gm-Message-State: APjAAAW49WDQ17wHKBrmKbekv5PGAgckhxQgODLMDaUOEDmu7ndryY5g
 NaZ3UlhMLuNx4vdVXHSa2mhsHKPmPozg+78sLb8=
X-Google-Smtp-Source: APXvYqy1ECRBQ22pD06cGxnpiCaFw6sqY/+zz9YRtVv8iLxMmIbMuIEzDajmBKlslN7QZBGK5XnuJaVznA8fBs2IrCQ=
X-Received: by 2002:a02:710f:: with SMTP id n15mr1495647jac.119.1562810537153; 
 Wed, 10 Jul 2019 19:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <1562574721-125584-1-git-send-email-mine260309@gmail.com>
 <2a9ffe98-e190-fe7b-b6d0-2123dadcf551@linux.vnet.ibm.com>
 <CACPK8XcY5UtyhaggEaKEAzVA626uo228j0vQ8_k6in5pJO89ng@mail.gmail.com>
In-Reply-To: <CACPK8XcY5UtyhaggEaKEAzVA626uo228j0vQ8_k6in5pJO89ng@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 11 Jul 2019 10:02:06 +0800
Message-ID: <CAARXrtmP59uz+MUy4+=J7EDhqW9agLqarBr0WkNA16SB526Q3w@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.1] hwmon (occ): Fix division by zero issue
To: Joel Stanley <joel@jms.id.au>
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
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Sure, will do.

On Thu, Jul 11, 2019 at 9:51 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 8 Jul 2019 at 15:19, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> >
> >
> > On 7/8/19 3:32 AM, Lei YU wrote:
> > > The code in occ_get_powr_avg() invokes div64_u64() without checking the
> > > divisor. In case the divisor is zero, kernel gets an "Division by zero
> > > in kernel" error.
> > >
> > > Check the divisor and make it return 0 if the divisor is 0.
> >
> >
> > Thanks!
> >
> > Reviewed-by: Eddie James <eajames@linux.ibm.com>
>
> Merged into dev-5.2.
>
> Lei, can you please submit this to upstream? Please add Eddie's r-b to
> the commit message.
>
> Cheers,
>
> Joel
>
> >
> >
> > >
> > > Signed-off-by: Lei YU <mine260309@gmail.com>
> > > ---
> > >   drivers/hwmon/occ/common.c | 6 ++++--
> > >   1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> > > index e9d7167..15c5d43 100644
> > > --- a/drivers/hwmon/occ/common.c
> > > +++ b/drivers/hwmon/occ/common.c
> > > @@ -406,8 +406,10 @@ static ssize_t occ_show_power_1(struct device *dev,
> > >
> > >   static u64 occ_get_powr_avg(u64 *accum, u32 *samples)
> > >   {
> > > -     return div64_u64(get_unaligned_be64(accum) * 1000000ULL,
> > > -                      get_unaligned_be32(samples));
> > > +     u64 divisor = get_unaligned_be32(samples);
> > > +
> > > +     return (divisor == 0) ? 0 :
> > > +             div64_u64(get_unaligned_be64(accum) * 1000000ULL, divisor);
> > >   }
> > >
> > >   static ssize_t occ_show_power_2(struct device *dev,
> >
