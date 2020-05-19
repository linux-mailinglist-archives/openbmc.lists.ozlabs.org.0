Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BB41D8D9D
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 04:26:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R0BB28SDzDqlS
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 12:26:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::22e;
 helo=mail-lj1-x22e.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=XOnFGjDx; dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R09P6H8BzDqgp
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 12:25:44 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id d21so11994482ljg.9
 for <openbmc@lists.ozlabs.org>; Mon, 18 May 2020 19:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WJVPHBjk5e5ck6jEwmkX7aWX0sZeObiWTX0reVMVcQQ=;
 b=XOnFGjDxg4xo8DP6U/OO28gssmlvht1C7zhV//FZ4LcqjVzL/rhGinfhhZz9lU/9ZI
 LtCLVrnSkRe3OFD+Ap/5PfRw+dIJPEA1lNG9eiF01Cu7yHrlB0sjXeaKFAYy3a4afMAc
 M2pqii7zU1xahStYI9J+Bvquq0+dvckBRh6tDVFSIpjY956XrZENKp5N4G7fLWB96kjM
 ypU5Cou/XkTagDX35YaQSSsaZTTMTHdA0UHtDHBVLXdssarvzii+e4DlYzS3H3VSGygc
 KjEsc+hGxOiBvdg7B5lFNkSIk/0YH3PAFzQSI7KGScQ+tml7NjVZoukDInuwD07rJX0C
 0dBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WJVPHBjk5e5ck6jEwmkX7aWX0sZeObiWTX0reVMVcQQ=;
 b=o8x/ygAFUnqFT754Dk81yqNNxODQUYt1jjLHGaQ6loMBVsQd/8ZKQ60wErdArBLDzU
 JhXLxKVHts3BAHHzp509Dxd6K0MIj7n94uH2Lw2qoMakz6f8jVEjuMf+NoHFQ86XQDV6
 3zz05N0FuVVjtvq8us5ksErLBFs95J2trNquMxwD/lApaHWozSs2IskXG3uhPsSerNS2
 WOdy+XclFYJNjSCSBWihhRTVQKlgdo0JfU25HCS9w4MNoNgs+ZAU1qRR8DC+XZfrrt8I
 0hD88g/DPjHuuHYwslwZOGy7Y6fmBeYyanZXOl1OBtXS+UvPNA6y92C5H42XZ12RWKdR
 kcQg==
X-Gm-Message-State: AOAM531vzBb6wujQvNZK2zoQLlrLrgFTuySbDBDy41UTqsGYfdxqH7LN
 DLPSplPbCdUxsThitdzdnNUvtanA16XDrQT2RBd6CA==
X-Google-Smtp-Source: ABdhPJwzB/O21Xz2avS2ucW9cv4ZUzeoDjmI/QJLn1wldL2/2jkDIJtC9267D+JNIT6ju6LFH35mvKf1/EVmWZl0SIQ=
X-Received: by 2002:a2e:9159:: with SMTP id q25mr1122132ljg.95.1589855139575; 
 Mon, 18 May 2020 19:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <d7da4861c449609d2cf1b1b1434c653e9a27a805.camel@ozlabs.org>
 <AA2FE467-1072-4CD6-BA9F-3AAAD40DC8E0@gmail.com>
In-Reply-To: <AA2FE467-1072-4CD6-BA9F-3AAAD40DC8E0@gmail.com>
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Tue, 19 May 2020 10:25:28 +0800
Message-ID: <CAGm54UFc15aXH9qJz+-hig8NDbX-bVxjpZa-g-9Bg=uUpjEydQ@mail.gmail.com>
Subject: Re: Reducing fragmentation in OpenBMC
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 19, 2020 at 8:53 AM Andrew Geissler <geissonator@gmail.com> wro=
te:

> I know phosphor-dbus-interfaces has always been a bit onerous. I do feel =
like
> we get some good stuff in the reviews though. It also ensures we have
> documentation  of our interfaces. The cross-repo dependencies we
> get are a bit frustrating (i.e. need to get interface merged and bubbled =
into
> openbmc before you can implement). There=E2=80=99s also no versioning con=
cept so
> if an interface needs to be changed, it=E2=80=99s a huge pain. Ideas on h=
ow we could
> make this easier but keep the benefits? Or people that don=E2=80=99t use =
it and just
> define their own interfaces, any improvements we could make to get
> you to use it?
>

This usually involves the repo CI.
If we could implement "Cross-repo dependencies", making the Jenkins
job able to pick the "dependent" revision of phosphor-dbus-interfaces
(or sdbusplus, or else), and build a docker container with the
dependencies to run the repo CI, the issue could be resolved.
For example:
* A change in phosphor-dbus-interfaces is submitted to gerrit with
revision `abcd` and Change-Id `wxyz`, which is not yet merged;
* A change in repo is submitted to gerrit, with commit message
containing `Depends-On: wxyz`

The Jenkins repo CI job needs to figure out that this commit depends
on `wxyz`, which is phosphor-dbus-interfaces.
Then it needs to build the container with `abcd` revision of
phosphor-dbus-interfaces, and run the repo CI.

It requires non-trivial changes to the Jenkins job though.

--=20
BRs,
Lei YU
