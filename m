Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C9CCEDD8
	for <lists+openbmc@lfdr.de>; Mon,  7 Oct 2019 22:45:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nCCx4nkJzDqLq
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 07:45:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ppopyQwD"; 
 dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nCBk2WHjzDqLy
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 07:44:14 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d22so7426322pll.7
 for <openbmc@lists.ozlabs.org>; Mon, 07 Oct 2019 13:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DoDStrYyQl2shGXt5FK7xz+8XFgcp23TPhvRiMO2j28=;
 b=ppopyQwDyIrGyb/l9vqGUNR2DySd0Ndj6vPKL8JycuaREaO7XQDDWwvkP3OVwjeEbK
 NsCCwhC2sQIZUmAygyaNKKS2d8gV9tmSVKXcD3sQyytyZGMFgRuUljUMfRXUEaN9SY8o
 O9Cv+XnKszrb+Ei3EF9ki8o1eiuffFW9ojZpd/rSn8tVfDMl51/MluNTxhLZ035CruJd
 uZOB/glUFy1nkIn7j9ZWO7r74+1W+ptS9pK+uW/g0OOSyDLTsrxjkN1lcfjVLZp8EC+e
 q1qbi+G0Se7OvLH4/z7G97O6Uk3eotwha5V+Skh5CgiBGreu0Le4GjfSopNitlPhFeF7
 Yprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DoDStrYyQl2shGXt5FK7xz+8XFgcp23TPhvRiMO2j28=;
 b=if1S+kfncP1kSsZz8ewxfs3G3HpzXT6EOzqATv9YZ5ziOPxXzad4Dw1Upd2cqwbRyP
 2X6aL8QDAxtikfu3MVaa21HVogcmN95jU+rPt045Skw2DyvsIf4cpmJg/ZH/e4Mo+l5J
 vXJKdpp22bSXyslPwQpKPfD9LMo3E+yRVZboHkHeMxIPg44o/9EQQun6z+MUhpJHEaVY
 vZgqiWD4cnmLG5DPSMl+DSqreOMufHbGDXucasePLs4je0FrIKPD2j/xpFwXc8KBMO/e
 Li+KBg90BklWIeWvXhNkI/11BcIAAni97qXqMWK+L+IchlVC/wFK30uRbCPv+ajaN0bJ
 gPbw==
X-Gm-Message-State: APjAAAVJPBbS6PzcZQMSd7w9OKDCw+FBw5l961vPnmz62nEh6WCh2unn
 PMznHQR+py0DpHyT56GGRIlUbbW1w1jLgqQCbikXlQ==
X-Google-Smtp-Source: APXvYqxzUUYwNN/uP+cUfDaDjy0D0lsHq7FPUnH/3yqDYSi9IEtQ5w7w7iQRCwB54Lk8XOVDz5G01JBHdtI2wLw9MJw=
X-Received: by 2002:a17:902:bb87:: with SMTP id
 m7mr30976244pls.179.1570481050918; 
 Mon, 07 Oct 2019 13:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <7050D8BB-A7B0-4CA5-AA56-8AB61D762AEB@fuzziesquirrel.com>
 <CAPnigK=c+rpWLtB7XbaPPM3s2V8TAbgRgqKChUTKkNpUtC836Q@mail.gmail.com>
 <CAGMNF6VCJxS_ewJkpvGAUwtiJrgVUSp2ajeVeN+k7hZoiXj8gg@mail.gmail.com>
 <46DC7782-8F89-4890-9876-E54895CC8C98@fuzziesquirrel.com>
 <CAO=notyDgrSBRsKcuT0vwFLQi91hAco4dH7v=NPeK__+-PhpEQ@mail.gmail.com>
In-Reply-To: <CAO=notyDgrSBRsKcuT0vwFLQi91hAco4dH7v=NPeK__+-PhpEQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 7 Oct 2019 13:43:59 -0700
Message-ID: <CAO=notwZdqr=dr_Rdyz317aHHyUzKz0Zu0OpW87fnk=T9rHc9g@mail.gmail.com>
Subject: Re: unit test build failure in phosphor-hwmon
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
 Matt Spinler <mspinler@linux.ibm.com>, wangkair@cn.ibm.com,
 Andrew Geissler <geissonator@yahoo.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

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

Updated my CI checkout and it builds "fine."  It builds without the
comparison failures you're seeing at least.

>
> >
> > thanks Kun!
