Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB62F7AB9C4
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 21:03:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=UyJ7nZWe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RshWJ3TV5z3clP
	for <lists+openbmc@lfdr.de>; Sat, 23 Sep 2023 05:03:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=UyJ7nZWe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RshVl2CfCz3c8D
	for <openbmc@lists.ozlabs.org>; Sat, 23 Sep 2023 05:03:10 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-405417465aaso9603355e9.1
        for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 12:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20230601.gappssmtp.com; s=20230601; t=1695409384; x=1696014184; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMKoyuDTdT82rkq1IyOXPNQaSdHPBXxm757JWeOOsUk=;
        b=UyJ7nZWeYyc9bnGpGeml03ztKw/nAo5K+i6qEBJlRNQHeiewHx4oYsZpdtqziiGj7f
         HjdToiS/xw1zZ5jhrmcu+fhEXB4j49XfdTx7AV15sbFtS6j8W5GH+mRBDAjxVrDltvmx
         AVtZ6yRmV5HbxBqOFZMXaOE3/x60107CQab+sa6lPfFNMhzhQsf0BNUH0MFbvh8YJQQ1
         XIIlMz4MC9Ms9Zoa4mi9dumROP6XDmCM8dKTfZhn33p2cjsWgUXaNCSrw4kA/LPRVVOp
         LhEjmJ2D75UxDhS7eN30VOHkldIMnXe5Waw9EQGQWFdBt30fZLd74K/Sf5wempL78Kok
         l7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695409384; x=1696014184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMKoyuDTdT82rkq1IyOXPNQaSdHPBXxm757JWeOOsUk=;
        b=opshwWTYnloYvFRLe05h1vYCXK1RnLjqCXSmKBrIqnR0yXdHOHLpc/jh0wdQxu0uZi
         27GSn073vCIdysKTrqWwyNZKBx4n+OBDU8CkdS4UAEJkIT2wYQ9YC9sXvUhyfFMJtf/e
         /jAeMb0ae7pRkVFbWCCl+SInhrtf+lL6Y4wGqY6xasp0mBhv9A5V5C4wkl/pS72kVogg
         6/vufUjIUUwpIS43oONZgT6L7r8i6nXLdPQcVsdsnvku5ZD8W1YbKaGkbxMiMYx/SoZo
         CGtvSQ1gHHqHgZAXJGVl3A0sfSOFkRq723dsXLYBfrrCOB+NxpINEBCWEd0cbeEBf+Ns
         400g==
X-Gm-Message-State: AOJu0YxSqSgZd2kpL2Zg3NPmbhkHAN2arOMsPqTGOPszj0XjMf8kChNr
	S8xDbegU9fjblRo5UltQ3ed1jaEy76cLJb1zOr5Z+A==
X-Google-Smtp-Source: AGHT+IEwNGbiEMwM69x2jWsPHZ68FO8bVzJskrpNr5YUj/FPy/8u01UT59ESqwyhAZB1KlAfRo0L6EYTQ3DAgDcQagQ=
X-Received: by 2002:adf:f205:0:b0:31f:8a6d:e527 with SMTP id
 p5-20020adff205000000b0031f8a6de527mr472019wro.45.1695409383877; Fri, 22 Sep
 2023 12:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=pST5nX76byef6S4rsskMRD3xvF5gAVqhr2eRefcRa-qA@mail.gmail.com>
 <CACWQX83En+xqRAwM9hSwqFsZ_+SA6rqtGC7TenYSdAcxdPvaHg@mail.gmail.com> <CALLMt=pNqMNRRJRo5f3v3jA66Sq7HnAbyneX+n4svSAsm6z6fw@mail.gmail.com>
In-Reply-To: <CALLMt=pNqMNRRJRo5f3v3jA66Sq7HnAbyneX+n4svSAsm6z6fw@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 22 Sep 2023 12:02:52 -0700
Message-ID: <CACWQX82=fxWmxZeYJ2348dkJ=TYvcWi2DW6vy-bFowShaqsgWw@mail.gmail.com>
Subject: Re: webui by default in openbmc images
To: Andrew Geissler <geissonator@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 22, 2023 at 11:58=E2=80=AFAM Andrew Geissler <geissonator@gmail=
.com> wrote:
>
> On Thu, Sep 21, 2023 at 12:11=E2=80=AFPM Ed Tanous <ed@tanous.net> wrote:
>
> > The problem a while ago was that the webui is not able to build
> > offline, and completely bypasses yoctos do_fetch step, so the sources
> > aren't traceable and make the software bill of materials wrong.  What
> > exists in the OpenBMC recipe is literally just calling NPM install and
> > using the NPM registry to build the webui, which isn't able to be
> > built in an offline cluster.  That, along with issues with some users
> > proxy configurations why it was never installed by default.  I think
> > we need to take this up a level, and if we decide that we don't need
> > the defaults to be built hermetically or traced, and we don't want to
> > support devs with a weird proxy, that's fine, but it should be a
> > project level decision on that, not specifically scoped at the webui
> > as a default.
>
> Ahh, that's a good point. These issues haven't been a concern for me
> but I can see how that could affect others. I updated the commit to
> create the new image feature but to not include it by default in all
> openbmc images.

I fully support it being an image feature, and FWIW, I don't have the
problems I listed above, I just recall the issues from when I was the
phosphor-webui maintainer.

>
> https://gerrit.openbmc.org/c/openbmc/openbmc/+/66675
