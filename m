Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1503E24DC6B
	for <lists+openbmc@lfdr.de>; Fri, 21 Aug 2020 19:02:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BY79S2NvZzDqYp
	for <lists+openbmc@lfdr.de>; Sat, 22 Aug 2020 03:02:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Gedy4J+X; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BY72x2sSyzDrHd
 for <openbmc@lists.ozlabs.org>; Sat, 22 Aug 2020 02:56:41 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id e14so1379123ybf.4
 for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2020 09:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KVna2NWd7/yinf+7f8YG2XoeJLtTFVp4lgLrJYaiRHU=;
 b=Gedy4J+Xw/xCLS+cDGeJ/b6aQEDPngivKvKoiZv7K1tqn16ul7jlKNq1F41KFuhspn
 8wjW/WrNabAymRPZNSnHTavgV24qvgkCWhH2FUt5ow1uSiLOfkwdXKF1sj4gL5BzblxP
 1nwrGW5csmlfjg8nuZiAazgCtFv1+PNRQ2Cpaz41mCQiKKPbZg0Iy5NPVM0tyIUAecrF
 QSu4fFfKtWkORvj8XhO1wQ2UE/0l60QZr9/pcMphOlO/yTMmbVIcDLyemY/3b3TwqwvH
 XflC4pvPQnxdF3R5nyiR15PErqSQfa2M5vePEv7zleIUAFxlOSvYlsMxnNmuvMvCOlfr
 norQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KVna2NWd7/yinf+7f8YG2XoeJLtTFVp4lgLrJYaiRHU=;
 b=bHZbBvZHJJ8P5IrdUCzKRPxkCaYbUVNScoFU8ppqTMqXd3SoIftHLw6hgIA5lPjl6H
 BlIREiTwe5qBbsMCjlk3HAAxfXOqBQHVuftlWU0gZTw9k9U4MRFY0wrd+lzQGr4+KWUi
 BZ5Jd0SijMQ0Pqb6zZuQS6ZBkuGI6xQmWbMUYngPlt59V8r6984j8I5p1hXqaNcOQDDD
 WqYYQMUbDaTSHrZOnywV3kAfGeb54G7z+RfDGWX+31Elze8WdGwOZ0d+pHUP26KMam//
 hT1vJIVgqMo8hK6vNMwhPhfPMLcF3iftAW22QeDcTVjJTeb5vkCfTIaHbo9T3UZNRALT
 BnCQ==
X-Gm-Message-State: AOAM531FkJUZC+TSWkll97MWYR6AygblyjpNSJE6Vbd35+o8HG3pE5JX
 bXPPXxKSVlAYp1mHn/yUhrN6kVy3/KO2sF1pKiX+mQ==
X-Google-Smtp-Source: ABdhPJxEmdMXlLVuKOMShqpnNKUmf8VO+t/1oPbiHvW2EN94EuvKzV30aFANdSn8xO2YHmdyPUWSxer/YcoUNU/b1B8=
X-Received: by 2002:a25:8481:: with SMTP id v1mr4900445ybk.203.1598028996625; 
 Fri, 21 Aug 2020 09:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <d6d450e638d016d29496ef1713083e80551a84bd.camel@fuzziesquirrel.com>
 <CAGm54UFLDWAqBstr6q2Su_wtF6ux1pJiHnJD2j8k5V0a2dJkNg@mail.gmail.com>
In-Reply-To: <CAGm54UFLDWAqBstr6q2Su_wtF6ux1pJiHnJD2j8k5V0a2dJkNg@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 21 Aug 2020 09:56:25 -0700
Message-ID: <CACWQX82vzhzWhf40Xkyy5OzrWeTezXVQXGz7JUyehF-ezbmpYA@mail.gmail.com>
Subject: Re: moving meta-{openpower, x86, arm} content to meta-phosphor
To: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 20, 2020 at 11:23 PM =E9=83=81=E9=9B=B7 <yulei.sh@bytedance.com=
> wrote:
>
> On Thu, Aug 20, 2020 at 9:17 PM Brad Bishop <bradleyb@fuzziesquirrel.com>=
 wrote:
> >
> > Please share your thoughts on the matter.
> >
>
> The whole idea looks good and it makes the layers simpler.
>
> One concern would be, what if we have recipes with the same name in
> (previous) different layers?
>
> E.g. in case we had:
>   meta-openpower/recipes-xxx/foo1/bar.bb
>   meta-x86/recipes-xxx/foo2/bar.bb
> And if we move the layers into the meta-phosphor, and a build picks
> the bar.bb recipe, what will happen?

I believe what Brad is proposing actually fixes your issue.  The meta
layers essentially go away, and your examples become:

meta-phosphor/recipes-power/bar/bar.bb
meta-phosphor/recipes-x86-intel/bar/bar.bb

At which point you immediately would get a warning that you have
duplicated recipe names, and we as a community can figure out how best
to disambiguate the two recipes.
