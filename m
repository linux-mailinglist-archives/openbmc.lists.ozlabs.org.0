Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5523CE67C
	for <lists+openbmc@lfdr.de>; Mon,  7 Oct 2019 17:08:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46n3km201WzDqH5
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 02:08:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::a2f; helo=mail-vk1-xa2f.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="k3Xl4i1h"; 
 dkim-atps=neutral
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46n3jP5d4DzDqLV
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 02:06:47 +1100 (AEDT)
Received: by mail-vk1-xa2f.google.com with SMTP id s72so3036557vkh.5
 for <openbmc@lists.ozlabs.org>; Mon, 07 Oct 2019 08:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=YxO2sVPWvahZ+FLYeMSV1rtmV2yH9ulYT8oaQo9YBw8=;
 b=k3Xl4i1hot51Vz05Fasd/Uvq9MaE4v/SSN9tPb7uRVtF4klCentOIUnrGbtM/A6MDt
 LgaBa1i8AtNHLb7T9KotIt141Eh+UWAdnK9kpfWIkWeGKEDZvU9+IPUOgo1280ciOffj
 m4O7UaNq3lUTrUB6BOsTbvWoZWuqbrZJfba+1baVQwbV1SK2k1vRNjwhZ9G6b+aKTTvU
 SzcNmiXQjZbmj2JkEmJwjiLKhkbMfyPIAWzcVMmpr84xVc8aWKCV4pSepMSTnPyAskIA
 OhPqdnGvUQ+NoJoDs2YqgTQSVOrGaxO9RTY6UvjGDhOY32LrJPkGKd0goeJWqIlO0PoM
 wZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YxO2sVPWvahZ+FLYeMSV1rtmV2yH9ulYT8oaQo9YBw8=;
 b=YKXJovkEHWDbKlMx5KrROArVivR6P0mIY1b/zKJX1+cB4SzTYOinxl+8fpJJ2nNPQk
 VPO4EbcGGHeJxup4lczrrYYAdI87lmYUZixdwgBoxo/3WPSdXgqPRMA4wm8zrRvowGJG
 OC5sYCwZtJHw/5uLN9Xm088wUNk7yG7KkSWe2awyhl2nl+C0WBoqA2tx3AhhSbR52uvw
 Tz2YnZg559DY1Te1A5nCuHliMVUzL8XV6hpKS0fui13rSJP3FUkQ5noKCHWLK7r5YYnW
 3AQVIvUHzxEJKgScyg9AnsBPFTUSCkbP33nA9s3H7FyrO4OJcYyOZm1Pd1c8RZjmw+7P
 c5vA==
X-Gm-Message-State: APjAAAWOjZZvcPIPcUymWQad4W7hRuGV+0s9GN+47acT+4U1U5BES/TH
 PXQiGvXKuo1BMCzfTBHiFzS/RYsmbIow/A+v93iTuwnh
X-Google-Smtp-Source: APXvYqyqY3v/JIWIm4bsBzPxfFdw71ezCUXVPtSjB7xcLWiTsM6KzXDhBCY7hywBnjYStg/82yYysjLlHP3FZRJWKJ4=
X-Received: by 2002:a1f:e242:: with SMTP id z63mr14504259vkg.37.1570460803483; 
 Mon, 07 Oct 2019 08:06:43 -0700 (PDT)
MIME-Version: 1.0
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Mon, 7 Oct 2019 10:06:32 -0500
Message-ID: <CAG5OiwjD39ac835TMNiU2BG68LoeqbT7tfi-3fi1Wbznza-Ztg@mail.gmail.com>
Subject: Release Planning Workgroup meetings canceled
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Reminder: As a result of the last meeting, and the low attendance for
the past few months, I am canceling the Release Planning Workgroup
meetings. I have continued to run them despite low interest in the
hopes that we were just experiencing a lull for some reason.

So, for the 2.8 release, we will use a simple wiki format and rely on
our design documentation process to enumerate what we are working on.
We will still need developers to take a few minutes and document what
they are planning on delivering.

https://github.com/openbmc/openbmc/wiki/Current-Release-Content

My concern is that this will perpetuate the company work silos (one
company delivers one function). It places more importance on having
merged design documents for major functionality before code starts
dropping.

Hopefully this will be enough to continue toward our goal of having a
healthy community with cross-company participation in new features.

As always, I am very open to a discussion on this.

Kurt Taylor (krtaylor)
