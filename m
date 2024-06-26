Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDA6919A27
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2024 23:58:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=gf32/DSB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8bDP4cZFz3cR3
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 07:58:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=gf32/DSB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8bCs1p5Lz30T0
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 07:57:43 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2c2d25b5432so5333279a91.2
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 14:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20230601.gappssmtp.com; s=20230601; t=1719439057; x=1720043857; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98sy636a2QOuzESOMg8jmAvuAfAw38ACZGXTgVWbY6g=;
        b=gf32/DSBv4D7iyDnQnIhh7VvrPV4oeZf19hHHrEMOVDbsTjw3vwj61Q78b/EynxyB5
         7nJYU4g+kkd+pQAvrCGr1eJ3snuPVlBwID7h358StvWxMbxzFd8ka/p9rpk+lbsiwGZM
         nONALj4egCZLRYpYSfBKUwwee2BSEpjzpdmdlxU7x9eGe3I97jXWsMFIuDZFqxOAb56v
         f9zZks1W8aUQeaZQeISbZPx0dT1UPrz6bbCI4pKwclxXvJlnfPot7NLY1AS0/cTpht63
         QcIcAXXBXmb14yjir7qpUxTrbmAQpw96NotxMYCNryFTeWbtNuHArjP9P8T9achcUYs5
         0+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719439057; x=1720043857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98sy636a2QOuzESOMg8jmAvuAfAw38ACZGXTgVWbY6g=;
        b=ibLyrzBJxosfzyeBs0nN+1+ziy9xXizud+5V3akTshMpnNiihx1QBAg2kd008p+FVp
         0jpBjPxl8F1bkqUgpupCf2niyt2HmOobcq9U+/uN6GtSBQsAeLoDNvZcCwgxLy5sKDUx
         txOy1CDXA71zY+glFAqZrJxvFGAJPijUyDCr4iefJprg4ODrzO1M//F2B5n2PZ2NX4dX
         KMBuwSUbp9IQ5fVMQeW3rfa31gziYbFL/NfYLiS2obr+j4L7LeFZBOwwyKvoLMpFqd8W
         xI7ibxJa92G0b/h1XAqeYnpxiir0LUO8tC3M8Vuf7Ophqv3UrQp6BqNkO5kRZVNtVg/o
         swTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlIxKmCiLojWq/P23xRY3wTibxWKG696QiUeDt6RMJCiEyy7fE1tmaxUsY9nlcimt6BYM4cPyCtKIUw3ntLDbpbNBakakr6iw=
X-Gm-Message-State: AOJu0YwQ3q9DzI13rkxAyp2ZqCPGaknaaNv723eAVV9F3+2TQwaMP+0o
	w3Qtmq6xcl1qh6W8B9/X+d0ugkUIZqazkStfppbya/CPn7SzwF/ahogLgUpHOzEX+THs+nTlR7P
	dMwRoLs5srPVJnFiBz6IT1btUVcxIJfh52C/QTQ==
X-Google-Smtp-Source: AGHT+IF/YvmJcE+yZMCwxF1OVy/HYOHw0udLHRx/2Ug/i6dTDxJKADLGgFs4EXCmF3WBNH2MKiA/KKnqQXwgfbnc/kg=
X-Received: by 2002:a17:90a:39cd:b0:2c8:8a5:c1b9 with SMTP id
 98e67ed59e1d1-2c861408737mr9425117a91.13.1719439056626; Wed, 26 Jun 2024
 14:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <1403524602.354586.1719434789488@privateemail.com> <ZnyKk8xOmIgqAbs0@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZnyKk8xOmIgqAbs0@heinlein.vulture-banana.ts.net>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 26 Jun 2024 14:57:25 -0700
Message-ID: <CACWQX80A_TqXZ5QFyJcEqZZHhRf6ckAnLJJ74guz=SYV3+4gAA@mail.gmail.com>
Subject: Re: Request for a new vue3 branch in webui-vue
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: "kirankumarb@ami.com" <kirankumarb@ami.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "a.nikhil@ibm.com" <a.nikhil@ibm.com>, Gunnar M <gunnar@gmills.xyz>, "Renuka.Sharanya.Pundla@ibm.com" <Renuka.Sharanya.Pundla@ibm.com>, "sivaprabug@ami.com" <sivaprabug@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 26, 2024 at 2:40=E2=80=AFPM Patrick Williams <patrick@stwcx.xyz=
> wrote:
>
> On Wed, Jun 26, 2024 at 02:46:29PM -0600, Gunnar M wrote:
> > Kiran and his team have volunteered to sync patches merged to master to=
 this new 'vue3' branch bi-weekly. Thank you, Kiran! When the migration to =
Vue 3 is complete, and all commits are synced over, this 'vue3' branch will=
 become the 'master' branch.
>
> We need to be careful about how we do this.  You don't want it to appear
> on github as a rewrite of the "master" branch and we absolutely need to
> at least keep the vue2 code in some branch so that it doesn't get pruned
> from the github history.  If we don't do this, it will become impossible
> for people to build older OpenBMC releases.
>
> I would suggest either:
>
>     a. We do the opposite: create a 'vue2' branch and update the recipe
>        to point at it.
>
>     b. We use this as an opportunity to migrate from 'master' to 'main'
>        and use 'main' as the vue3 branch.


My expectation was that this branch continues to rebase in patches,
and once ready to merge, we would just rebase the series on top of
master before pushing it so there's no discontinuity, no merge commit,
and autobump would just pick it up.

>
> --
> Patrick Williams
