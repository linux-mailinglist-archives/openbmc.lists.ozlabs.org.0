Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6CF25A537
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 07:55:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhCpB0bfdzDqlf
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 15:55:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=HlDkX8v6; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhCmW05LtzDqjZ
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 15:53:46 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id s92so2263751ybi.2
 for <openbmc@lists.ozlabs.org>; Tue, 01 Sep 2020 22:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+TEZCmi6YmdBwwEU0a42tl8jbizTJeIqRdaf/eEfIh8=;
 b=HlDkX8v6Zx/WRQ5K4xhsM65LO1n98uYyYzQgj1qesG+VyPUbpsfdaOcP5vfUtaWyCy
 xmlsPNLetXeblOzbyxdceIMlS9VQ3Q3buHBGwDjoWQCXCkryZOLi4/RdLrGxDXQP31+L
 iTGg+/ZyUvp+4/Eo/gQPtVXgDrFePCqwEidKSD8xGLBltyo/e7kzFhyX6XbBKPLPu6Zs
 k3E6btviN+R0by4ZUwV5QBQva8ozE1K0uVTf1gRGN6sxRHlpJnUaQMXm9mkVF/3jzF1E
 DyN8TzAzbjSHQIZ1i27G1/RJ6O9He0HUt2XcUL7CyAxmfCYsqex1LgKq3Js+nCckfe80
 8cyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+TEZCmi6YmdBwwEU0a42tl8jbizTJeIqRdaf/eEfIh8=;
 b=e/IxEfXeT+jUEMMrtLn/nqeMuA38R810PCXuk28Ho2PSJOpnHtgnSG08oMavF2PWuR
 c35AR1gYHNvMT1n7P6197y4pqX+TwYZ4M7A4k1cr4PVpJNX3ZZiz+q2rtzUFSduS2wu8
 82bk1zOcxXjiY4hfa9fhujHxQ05u7tUE3HiZyf3qExaNW14/1AHHHaaFrf+uC4bPqk0S
 ywN5+JkybpnDcvlcNAkrrYiEGiw6FNvx8gjSrdM/XPN8pnLIw2EVl+bFlwJSF9jI6gyZ
 EXJrmDxr7vIGydEQuEE+zcuLaG73k4cShj0vvt+t1Q8E0hqsd9P9IEO0T5BI1c9FGE9U
 lFGg==
X-Gm-Message-State: AOAM531aKu0F5HWcWonuPajuNlSEnh073msXcmy4bCWW1VM8Yrb+2jJ6
 YGzn7atcysNV+RphFE0WhKXIWNy0hBmT7iz8B/I7uw==
X-Google-Smtp-Source: ABdhPJxuW3m9Du6nJZZljL0n7Njbvlt7PuakHStzKsgqn50Bjf2ieJRkhofL44pNGzOOt0EPOzzCEB7ydWmKnFTnpbk=
X-Received: by 2002:a25:d4e:: with SMTP id 75mr7391293ybn.480.1599026022239;
 Tue, 01 Sep 2020 22:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <98b9d39aa9004df78f8072ee6bdf4901@quantatw.com>
In-Reply-To: <98b9d39aa9004df78f8072ee6bdf4901@quantatw.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 1 Sep 2020 22:53:30 -0700
Message-ID: <CACWQX82NP+SPyHoPhkri=3eT+7jJYqmuTdwcTy2qDV0mTzrWkw@mail.gmail.com>
Subject: Re: Disable specific URLs in bmcweb
To: =?UTF-8?B?QWxhbiBLdW8gKOmDreaMr+e2rSk=?= <Alan_Kuo@quantatw.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 1, 2020 at 10:40 PM Alan Kuo (=E9=83=AD=E6=8C=AF=E7=B6=AD) <Ala=
n_Kuo@quantatw.com> wrote:
>
> Are there some configuration files in bmcweb that can be used to disable =
specific URLs and HTTP methods ?
>
There are compile time options that can disable features (and
therefore URLs associated).  They're listed in the CMakeLists.txt
file.

As far as disabling particular methods, why are you wanting to disable
them?  It seems odd to want to disable a few particular HTTP verbs.
