Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3140A79A81A
	for <lists+openbmc@lfdr.de>; Mon, 11 Sep 2023 15:01:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=g9VVuQdM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rkmzy0hBDz3bx0
	for <lists+openbmc@lfdr.de>; Mon, 11 Sep 2023 23:01:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=g9VVuQdM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RkmzM5tW3z2xHb
	for <openbmc@lists.ozlabs.org>; Mon, 11 Sep 2023 23:00:29 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-52a39a1c4d5so5776398a12.3
        for <openbmc@lists.ozlabs.org>; Mon, 11 Sep 2023 06:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1694437223; x=1695042023; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gETY1lSqVcPnq4saUWdjUiGiKS6IEVtxgi+KdrgjoEc=;
        b=g9VVuQdMbNuDQHXJrdjSrbLn75LZDP3j4xaqw3jQRsMJPITycy7CiNTaZ1V/XzBDJm
         byEPAgLG32in04yHZXXe9lwJsDuunSfY0urELdIXDvXVZtrJuzlZ6Z+aW2otR0Ba3asu
         549sGtJYIwOD9o9WdFv37SGzWGhhlj7aq9ikg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694437223; x=1695042023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gETY1lSqVcPnq4saUWdjUiGiKS6IEVtxgi+KdrgjoEc=;
        b=VQpUi/L1fFPs9YYif+AylAs/vroMt0/RxP7K3GGxIGp5Tu0fqtHKhHimRnQs0WWU98
         RZpoYG/miCKgqUVLFfbNB8aOq9t9MGN07gFhq7G5/eQR+2jFzCrbJQX7bVwJioK1/KOq
         AwyJteT+Sq0RfiOE10Nh+LrUye6AV78Lpe1UCChDqlZB2IvVFaw75wWFw7DksH/bfgVz
         hXaheeTIaEyBqZScd6r2AkJ6qrU4KnURGut8nSbYQymQ/WdMsZZxheFdjV4ia0jw3Fz9
         /6uA+2RKhNvvq71FCQqveFPluAMNcvIkfeGmCCTPPlpK4Z/aNJ4VD6fBf7O4SU5LETeG
         4z2A==
X-Gm-Message-State: AOJu0YwL9++R3nvhiqVGQ7GCuhVQi4Tw5mKwPbgzYkzZ8Tr4XuMxZfqP
	daFBvkuQauYsAdItxKypw8ISbUkncAeFvf2T154=
X-Google-Smtp-Source: AGHT+IGNbAAe+VGlVE5EqRSGfjWZGo5TJ43uNPKMzqqgysc9bXYkhaJ1cTma2mPVn5VeuBaUkJm6bcf+VrY+KMOhBxw=
X-Received: by 2002:a17:907:a057:b0:9a1:cdf1:ba7 with SMTP id
 gz23-20020a170907a05700b009a1cdf10ba7mr7927497ejc.15.1694437222750; Mon, 11
 Sep 2023 06:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230905131401.82232-1-stefanb@linux.ibm.com> <CACPK8XfECNDdDYfqsJQeUKfEWu-QYb6p2ztd7FjnK3B9rnAgeQ@mail.gmail.com>
 <121c959c-e19c-d92b-42c0-16e5647a881d@linux.ibm.com>
In-Reply-To: <121c959c-e19c-d92b-42c0-16e5647a881d@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 11 Sep 2023 13:00:10 +0000
Message-ID: <CACPK8XcbOoeQJnch491XsHMYiMAQSZb=r7+80qfO7sDGoLSoAQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.1 0/5] Backports to support OpenBMC with IMA
To: Stefan Berger <stefanb@linux.ibm.com>
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
Cc: jmstanle@au1.ibm.com, andrewrj@au1.ibm.com, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 11 Sept 2023 at 12:49, Stefan Berger <stefanb@linux.ibm.com> wrote:
>
>
> On 9/11/23 04:04, Joel Stanley wrote:
> > On Tue, 5 Sept 2023 at 13:14, Stefan Berger <stefanb@linux.ibm.com> wrote:
> >> This series of patches are backports from recent extensions to core Linux
> >> filesystem code (support for STATX_CHANGE_COOKIE) and subsequent fixes
> >> to IMA and overlayfs so that IMA can be used by OpenBMC configured with
> >> overlayfs. Overlayfs is for example used by the p10bmc build.
> >>
> >> The patches in this series have been cherry-picked from upstream Linux
> >> using the following commands:
> >>
> >> git cherry-pick 131f4fd2c25a # 3 consecutive patches of longer series
> >> git cherry-pick a3bb710383cb
> >> git cherry-pick a1175d6b1bda
> >> git cherry-pick db1d1e8b9867 # IMA: use vfs_getattr_nosec ...
> >> git cherry-pick 18b44bc5a672 # ovl: Always reevaluate ...
> > This is great. My only concern with backporting a bunch of upstream
> > changes is we miss out on subsequent upstream fixes that modify this
> > code.
> >
> > The intent is to move to v6.5 shortly. Do you mind if we wait for
> > that, and ensure the 6.5 tree has your changes (I assume the delta
> > will be smaller)?
>
> I can wait. 6.5.2 seems to have all these changes. (The first commit
> above seems wrong and should be c5bc1b3ff35ae321d018.)

No worries. If the situation changes please reply to this mail and we
can reconsider.

Cheers,

Joel
