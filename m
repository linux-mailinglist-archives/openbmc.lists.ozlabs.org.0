Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BE02B890F
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 01:31:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc0wv4bkZzDqdh
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 11:31:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82d;
 helo=mail-qt1-x82d.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=MLiD19XT; dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc0tZ4WTlzDqfB
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 11:29:42 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id f93so3128609qtb.10
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 16:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QW8BCOov2TvpCNne5upIZlEktL2yGqsLuUGlV/247VI=;
 b=MLiD19XTcj/5f81r1y4Y+qhQaYaM1zxwoq4Ao9GD499HdTw74IgqMQp8kFZ+vzHnnh
 SlDsigC3QCVwhUBfeuHAtCOJojR3F/Mi2llzmOymEa3AB80uopuMn+mQ1eJDeP3m5kF6
 mkFqiXeksgxkA7tliwzhzUZjmwE1JWNck7y5FOIpDKiUNjQQuq+MfPloRPmrc+iVfunK
 s7RNr5TlMDPaoT6QZxhuZnAn6Q41m+TcAH3+D1YHkqhyTHI0B2FTwuX9nHdPEybg+0Ey
 b9LDK8itNvrK+Xj4cVm7N+22T232dfaYxetHFxmP3y+BbUrHxelXJvut6WSenKGzTL9+
 buyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QW8BCOov2TvpCNne5upIZlEktL2yGqsLuUGlV/247VI=;
 b=bLCzwx/Ko+yciMiCfF66oRnuPkYEzYIrek7j28cl7ToZrnXyX8bVNPQoBI2WP/1XuM
 TeSMbQuvUtlv/wWAPzNHu9ilh39EfOW5BGIM8lPM+UFUJ6pcXT66RfCN9wHQrQbeggh+
 wOwwY3Hxib6B6OAl80E8zqYyQmdJ3T1bFUi3Nqj3Wn+Pm742L2ukCwGiTobMmsu76DUk
 Jrr+a36trIsEQ2DLa3knmajxlf7qmQWEg7hgRXkqLUFQv4E4+m8FhZPEMuizgVAopoVS
 4v6N/nyMHozA+1em9PKyZ/0YZ3MeM+1lFbm+yV01srARyemrNY2/7lINZJZ48+W7JQ3A
 Q2xA==
X-Gm-Message-State: AOAM530qyBsukv3XnGtWq8S3FsSjVz87HREtR6hYj3lw1fT7pzErLC1m
 2XwRwt867undX0tVTcdVSDzl8M3L9ZyLDAe6zVX1heA3nME=
X-Google-Smtp-Source: ABdhPJwAEY3KZkopclN8OXKjjYJOVOsCeMPFfqsrtSthoir4YcBHMHXNLBvboS33sXaiGq0gW/YvzLv9huEtc7e3mv4=
X-Received: by 2002:ac8:5a04:: with SMTP id n4mr7810286qta.21.1605745779462;
 Wed, 18 Nov 2020 16:29:39 -0800 (PST)
MIME-Version: 1.0
References: <CAO=noty_ADQwzPXx8AneRRcXNr9B15PBBByP6TNDeDCoy2ug6Q@mail.gmail.com>
 <20201118230938.GA1261035@heinlein>
In-Reply-To: <20201118230938.GA1261035@heinlein>
From: Patrick Venture <venture@google.com>
Date: Wed, 18 Nov 2020 16:29:28 -0800
Message-ID: <CAO=notwTKgDD20KKXE=5gF4QOeT3SEpuEwrzRRgEkxPYGzFFqw@mail.gmail.com>
Subject: Re: qemu for bmc
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Nov 18, 2020 at 3:09 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Nov 18, 2020 at 01:11:42PM -0800, Patrick Venture wrote:
>
> Hi Patrick.
>
> > Patrick;
> >
> > I was looking at a patch series of yours that landed,
> > https://github.com/qemu/qemu/blob/master/hw/arm/aspeed.c#L517 <-- in
> > this line you're referencing a device that appears to be missing from
> > qemu - namely, the pca i2c mux.
> >
> > My question is to the community at large, and you also, is anyone
> > currently implementing this i2c-mux or a similar one?
>
> Timely question.
>
> I don't know of any current work going on in that space.
>
> Facebook has a hack-a-thon kind of event we are sponsoring at a local
> university this weekend and that was one of the projects I gave as a
> potential item.  So, maybe, if we're lucky, it'll be done by Monday.
>
> I'll keep you posted.

Hahaha, thanks!  I'll keep an eye out for your update!  Seems like an
excellent hack-a-thon project!

Patrick

>
> --
> Patrick Williams
