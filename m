Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C5BCED70
	for <lists+openbmc@lfdr.de>; Mon,  7 Oct 2019 22:30:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nBtG5WqhzDqM2
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 07:29:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EmbbI99f"; 
 dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nBsk4ZFgzDqDL
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 07:29:29 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id i32so1595967pgl.10
 for <openbmc@lists.ozlabs.org>; Mon, 07 Oct 2019 13:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7bZILb3QBAQVU/tGG7ayMR3o+jRHAkl3ZoaUTWim/w4=;
 b=EmbbI99f+VSCrfmWLSwqgGB/u58vg5bn39ruafErTNc2VdyrKALoPPqCv8vhuxyiaV
 bDnOT2lDppFR8lOagwE40M5trpgdCBru21IGQ+OHhy9KOMlyG4e1mhEO1LHk/MFLRIzu
 MriNogchhYeCbXAHNj1ASnBTvK0KBKjysGUeTFjiqNPnFtiWH6u3eXuQ8hty8LFOmVEb
 W4jSs/v4gS20TSYtKezamSEwx/+zg4ounjoTc4E2FnbJuF9Muun7E2alX+x4pZEGcqr7
 D/RLVx1O3S2hoOmWyPoUcfBpSkM120+CDHlEkQfyUnwwsB62lxfWD3OchxV8BLFP44CE
 q+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7bZILb3QBAQVU/tGG7ayMR3o+jRHAkl3ZoaUTWim/w4=;
 b=l2R58y6/DLcG1dxjv9GAeyc9oPGl7MY3AeW18+sy1NjP1niDUETIjtL8lzwSUI48Dv
 VMRzj5BIMOEVVmavJU/WAdJ2IL8TfQpBTcXA5+dP39J0OsmEzVm9mLBwh0cgpGh5120H
 kYBqi4vRUGvtFEfXeV56aWIhdzplbjzqWIqnUcngM/5EprBJuU9OjCSo5itlX4x8GBa0
 L48Dp2QDS5pw7qi7rq1fGIbcX/0hp901p2j8+LaG0ZMe1048MqrjsbiqcfadxeqZcSih
 fSttwF0lSaCr5l8xG5rHQTnVL6xdAjQFz0b9RAAmV/0MzyCi40wsOiI5ioGiXB+qWf+J
 zKug==
X-Gm-Message-State: APjAAAUejghHW3EYQzm1poR5qhuNlsqd3GBhsopzs5DP1gw6SjH1C1Jc
 +mziSGjEh2Wdx5PXKgSCUwpxWORMetKSSScL6Otenw==
X-Google-Smtp-Source: APXvYqx+I6Api773kdWA9wfzRHFiAqb8pt+hgcewipHxYXS6VKkjL0gCe66OwE9bqbvEx9cKVi6ZNSXzOP4zHWN8rlQ=
X-Received: by 2002:a62:fb06:: with SMTP id x6mr147205pfm.186.1570480166092;
 Mon, 07 Oct 2019 13:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <7050D8BB-A7B0-4CA5-AA56-8AB61D762AEB@fuzziesquirrel.com>
 <CAPnigK=c+rpWLtB7XbaPPM3s2V8TAbgRgqKChUTKkNpUtC836Q@mail.gmail.com>
 <CAGMNF6VCJxS_ewJkpvGAUwtiJrgVUSp2ajeVeN+k7hZoiXj8gg@mail.gmail.com>
In-Reply-To: <CAGMNF6VCJxS_ewJkpvGAUwtiJrgVUSp2ajeVeN+k7hZoiXj8gg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 7 Oct 2019 13:29:14 -0700
Message-ID: <CAO=notwGr6KV6aSqoBMRH+X=jVakOWBCr86K9OA4MCC0ph6KbA@mail.gmail.com>
Subject: Re: unit test build failure in phosphor-hwmon
To: Kun Yi <kunyi@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, wangkair@cn.ibm.com,
 Andrew Geissler <geissonator@yahoo.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 7, 2019 at 1:22 PM Kun Yi <kunyi@google.com> wrote:
>
> What's the test build error message with meson?
>
> On Mon, Oct 7, 2019 at 1:05 PM William Kennington <wak@google.com> wrote:
> >
> > Well, the unit test environment is using gcc 9.x.x for what that's wort=
h.
> >
> > On Mon, Oct 7, 2019 at 1:02 PM Brad Bishop <bradleyb@fuzziesquirrel.com=
> wrote:
> > >
> > > I was trying to get meson going in phosphor-hwmon today and I stumble=
d on a
> > > unit test that doesn=E2=80=99t build under gcc 9.1.0.  The failing te=
st is the
> > > average test.
> > >
> > > I just thought I=E2=80=99d quick throw this out there in case anyone =
feels like
> > > having a look.  Also, I think this means our repository CI environmen=
t has
> > > gotten out of sync with upstream Yocto?
> > >
> > > I realize =E2=80=9Cpatches welcome=E2=80=9D applies here for both iss=
ues :-) but I just
> > > wanted to broadcast them.
> > >
> > > thx -brad
>

I don't see your patches on gerrit.  I don't mind building against
experimental patches :)

>
>
> --
> Regards,
> Kun
