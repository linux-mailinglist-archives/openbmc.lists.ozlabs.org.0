Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7446CEDD5
	for <lists+openbmc@lfdr.de>; Mon,  7 Oct 2019 22:44:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nCBq4JJHzDqMF
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 07:44:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::244; helo=mail-lj1-x244.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jgCGX9VW"; 
 dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nCBJ5f0PzDqCT
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 07:43:52 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id 7so15171144ljw.7
 for <openbmc@lists.ozlabs.org>; Mon, 07 Oct 2019 13:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZCWX8EkBVDqulPwFJqGr5f9ZD/Q2dFjQMLKvdb0bs+0=;
 b=jgCGX9VWOlU/KqT+ET4HlT2r9tsCrd0JFdjNPWNTzbn4k1QS7kiw4iapFiVvpyjHtp
 N1mMmKiab5/7aBPlocPofgdYE0DyghlcPvXoWOm26B7ytWUFDfNy1Rnv+PZcG7PUDXjI
 2ZIEIfmqio0RoGK7tKNyC9FDKPA3dkV4rXWn+i1wp11o7QNWr7bBXk8IgwbDC1DMkbDn
 glItp8p8OX0LzgVRos3pYRgJSTzvOJAur3NYGCMIoRS0nVgpDw/auMcZ5BmiPc6B9ivf
 1hkNYV3u8/vr/TszIl+60quaez49oc90be2HqWzBzkjPf6urE/oQTi/1dN3AE+1tNqnq
 WL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZCWX8EkBVDqulPwFJqGr5f9ZD/Q2dFjQMLKvdb0bs+0=;
 b=hx8BNBZn4rnsV9XR1Q2uDW5G4FU9ihbnjk8X4Elb2P7NJIHPdOqe9ESBmvFIAp3y/H
 0ANOnsR4+2RdiSmQvobfHA9YpAvCTIh6X1XG47YhGfw5K2pMJX9Ij8dkiV2DmWqBHnyG
 jy/ODbSydc6FmhcAWbmX3ExxJ99/OePVfDrVtQzYRfDFmfvFlIgwmgQWivWvmHYIueIp
 WV1vy196knmDDZXTpCZGYHefjsjCtBZ/kqQpi5GrmVlBRls5q5DqrzGlV4PJP8Qe0vxc
 Y98wnZOMulKdXRWhx+5Oj4DAemZjzgatuEWMMJHgHLQ3XnYovqg0sorL5+GH245tDOyi
 CoyA==
X-Gm-Message-State: APjAAAVYjQoZmrWSOt0FQR+GOg4wxHHeax79qPEr45Dnc6ovYv+LsVZY
 c3BIZ6uxZFlwBKRI1zxiJNjgs+bFM6KtirJTnN9Pxg==
X-Google-Smtp-Source: APXvYqx+EVEbNUEWRuYJlibmTvCBJYVLbmRSCLMaU+g/F5YaQFGertQ9tXFh76IyPKAtVx3E83B6IGTHm+Vf4mzNqZE=
X-Received: by 2002:a2e:9ac1:: with SMTP id p1mr19618318ljj.179.1570481026767; 
 Mon, 07 Oct 2019 13:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <7050D8BB-A7B0-4CA5-AA56-8AB61D762AEB@fuzziesquirrel.com>
 <CAPnigK=c+rpWLtB7XbaPPM3s2V8TAbgRgqKChUTKkNpUtC836Q@mail.gmail.com>
 <CAGMNF6VCJxS_ewJkpvGAUwtiJrgVUSp2ajeVeN+k7hZoiXj8gg@mail.gmail.com>
 <46DC7782-8F89-4890-9876-E54895CC8C98@fuzziesquirrel.com>
 <CAO=notyDgrSBRsKcuT0vwFLQi91hAco4dH7v=NPeK__+-PhpEQ@mail.gmail.com>
In-Reply-To: <CAO=notyDgrSBRsKcuT0vwFLQi91hAco4dH7v=NPeK__+-PhpEQ@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Mon, 7 Oct 2019 13:43:35 -0700
Message-ID: <CAPnigKk4_fAD-Y-W_Uu4Z4-ZXq-SKvS+MDtgth=WZsYHLSf4eQ@mail.gmail.com>
Subject: Re: unit test build failure in phosphor-hwmon
To: Patrick Venture <venture@google.com>
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
 Matt Spinler <mspinler@linux.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, wangkair@cn.ibm.com,
 Andrew Geissler <geissonator@yahoo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Looks like someone is comparing longs to uint64_t's or something,
which works on 64 bit arches but not 32-bit ones where unint64_t is
long long int.

On Mon, Oct 7, 2019 at 1:42 PM Patrick Venture <venture@google.com> wrote:
>
> On Mon, Oct 7, 2019 at 1:31 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
> >
> > at 4:22 PM, Kun Yi <kunyi@google.com> wrote:
> >
> > > What's the test build error message with meson?
> >
> > It fails the same way with autotools...
> >
> > I created a gist with the failure here:
> >
> > https://gist.github.com/bradbishop/0f18c71f734a8459dcab0ea886528b4f
>
> Thanks, my CI checkout must be stale.
>
> >
> > thanks Kun!
