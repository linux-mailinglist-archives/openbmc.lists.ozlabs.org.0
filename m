Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC37A3334B6
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 06:08:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwKpm6Sbmz3cVd
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 16:08:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=BsaU+CyC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=BsaU+CyC; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwKpY2qFHz3cLG
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 16:08:04 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id p193so16504409yba.4
 for <openbmc@lists.ozlabs.org>; Tue, 09 Mar 2021 21:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iCnzDClqfPONYZOwBN8d7wjwIPnxFSUxhLjSScuxJ5A=;
 b=BsaU+CyC6loy1cUZMnJyoRwxNNucuUBkIo6Utc1SBJPNr2xubcWPT1Xjc8Q7duw8jd
 tbyuxE7LPyPBiovq71tqvLN9h/fY0vDCD9+t+pBwq71HBa5+VlYxNbwghYPn4+L2Oz1d
 ygOmsDwbvsDy6uzijiNnuzQzIfBkXzbeN1+oKzoGJSt+u0BosH3AvIFKwLBk7uvSHcjv
 nNN1FVFTQXuvScxtMZo0RhxqRbq+qC7s+W6RlMByFoN7XFsG5X+LBk15jwyND4BWS3J0
 cjZT7Ffj//ojIygTBCM5TshFmVPybMHE+ryQMN9sZTvc7sV4o6v1ZMAdpH2TmWmv9vaX
 qAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iCnzDClqfPONYZOwBN8d7wjwIPnxFSUxhLjSScuxJ5A=;
 b=NHtUM6dOx1oa1FULYaKedNUmuJNnp4iLoPCh9LblaX3fXqXxTFI14NmM1y8pUeTYx6
 DLrrrQBdslaYiO4mkFZC0tYV3b+PKwO0oapWNXPXBux5PrzcMybPHsde14Do4CCmuFqy
 Gt2KTlS/14N5m2DW/sn1M599y15g7v261rqeyqBKy/GhdInC7oeTCFCueKw+ZpW8xgF+
 Qc3JNDzNCZXoddf35zzoFZwtHqlfMz2SxXpTEgRUKaTmcecNs3AZDdqUEB1bDLw+db/l
 CNpd+lnT10RypreByqelkKrqNIPelOYoRJv8osftPmRfx3oQF0om0H8s4LcKlPGFof16
 oLCQ==
X-Gm-Message-State: AOAM530aANKQH1UScFFFf0dNsqvVyN2BBMp+9FStYTM+y7gpd9D7JQMj
 m1EDuBKT7z1La87Ojd6Xw5e78yV/7HSIF2iGpjQTMw==
X-Google-Smtp-Source: ABdhPJyoFXDfLf97bA9HfZFQ1pmYpqC24Nv+kmwpJf9Vdo7N5TIOr4Gfjy3yvtTBcs7qJA8mGv2WbZi10HOO4sBmqX4=
X-Received: by 2002:a25:7356:: with SMTP id o83mr1713700ybc.170.1615352881205; 
 Tue, 09 Mar 2021 21:08:01 -0800 (PST)
MIME-Version: 1.0
References: <20210218190654.kkdsmrlxgenzr6nz@thinkpad.fuzziesquirrel.com>
 <CACWQX81HtHCqXZCzmJqppR+tBy5xDjBHa_q5gw7YTHZ9UaAH2w@mail.gmail.com>
 <20210219193348.n5e6w4e2vr4sk5ge@thinkpad.fuzziesquirrel.com>
 <47d61387-d71f-b72a-fe30-316a3a37829b@linux.intel.com>
 <20210301150552.hfwsnzgb5wczdpyx@thinkpad.fuzziesquirrel.com>
 <CANFuQ7CaZW6mY11MjYQjk7heq00UuAFgS37JiFBw0WFBCGQNtw@mail.gmail.com>
In-Reply-To: <CANFuQ7CaZW6mY11MjYQjk7heq00UuAFgS37JiFBw0WFBCGQNtw@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 9 Mar 2021 21:07:51 -0800
Message-ID: <CACWQX80ZKiXJGH58L_1HVGie=CB0+3XD8RJq6sAZhdTq6UadtA@mail.gmail.com>
Subject: Re: any in-progress Redfish TelemetryService enhancements?
To: George Liu <liuxiwei1013@gmail.com>
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>, "Wludzik,
 Jozef" <jozef.wludzik@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 9, 2021 at 7:23 PM George Liu <liuxiwei1013@gmail.com> wrote:
>
> Hi, Wludzik, Brad:
>
> Since we have some open-issues that need to rely on Telemetry service:
> https://github.com/ibm-openbmc/dev/issues/2968
> https://github.com/ibm-openbmc/dev/issues/2969

The people that care about those things should really be reviewing the
patches that are already in flight.  Unless I'm mistaken, I see no
reviews from George on any of the telemetry patches:
https://gerrit.openbmc-project.xyz/q/topic:%2522telemetry%2522+reviewedby:liuxiwei%2540inspur.com

>
> I want to make sure that Intel team will finish it by summer?
> If it is, that is great, we will always focus on and participate in
> the code-review.
> Otherwise, as Brad said, we will come up with a proposal and report back here.

You should participate in the reviews and help test either way.  If
the initial feature doesn't land on master, there's no point in
working on or planning secondary features.

>
> Thanks,
> George Liu
>
> On Mon, Mar 1, 2021 at 11:06 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
> >
> > On Wed, Feb 24, 2021 at 01:09:56PM +0100, Wludzik, Jozef wrote:
> > >Hi, "Append" is on the list of to dos and should be ready till summer
> > >(might be ready).
> >
> > That's great!  Any chance you could you provide any hints on how you
> > expect it to be implemented - I'm not sure if I can wait that long to
> > get started.  I would like to make sure that if I start working on it,
> > it will have your approval from a high level view.  If you have not
> > given it any thought, no problem - I'll come up with a proposal and
> > report back here.
