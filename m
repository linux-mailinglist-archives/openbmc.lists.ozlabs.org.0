Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AED36D3DE
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 10:23:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVWqs5kfFz2ysm
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 18:23:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=QuVa68er;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=QuVa68er; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVWqd54Bbz2yRB
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 18:23:39 +1000 (AEST)
Received: by mail-qt1-x833.google.com with SMTP id f12so46124569qtf.2
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 01:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QsYXMyA2e0c9Xr26l6h/A0xEReOA7JV6WolK3AXkyXk=;
 b=QuVa68er2JaXq1dy+3iGff5Yh20FQM9jHIqspG+cfj9lqsubQlekx9XPr7Xrpao8rT
 bKgglSOpdiKAQw/tJAEiCGeRfzU/zudIjklzjr04xFCxuy6fPhXmJBdO1Gx5hi3HdGNm
 bdDx+zkqTc2PkPeOiZ9E1kyP2S++1yIyEMNeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QsYXMyA2e0c9Xr26l6h/A0xEReOA7JV6WolK3AXkyXk=;
 b=U2cyCFXz9ZzyOuKGvGc3iAVZB73sYfdHR6rnwhlHOoFb1V+08eQV7g9CwK695bcRVm
 6Nj0dKA8Ga1qY4ixuxQHQTN7r+VWekw0zXWiu32EFxEIvL1ArSo7j8hLyD2tkwS76JO8
 f5cVwwloKUs5niSNt/I2HLREg8KDTl8P7GenzzthiJJzKVPqM95iNsgV62KY9qCCLQyv
 VsywHkuBFYb4l5XAN3u++uNnln50QJewOlKCMkRHHLkjX0S88mSWZtuEE5c1jpgMXU7Y
 y45j4j18fJhrCkq43f8AaRCxmsmewljOcfeLiXgl9rUgZxuXrfKE9pgFnfYxE0KN3Z0k
 A7UA==
X-Gm-Message-State: AOAM530rJ/k2DfcUIarIRSdDuVjpSRtk9V0Yy8ygaPtuL+9HLDKEMj1f
 7rM942qrm9yrhEKFVIguvW/LAHclyvX+Ww3Hivc=
X-Google-Smtp-Source: ABdhPJyUh+v3/M0N5pto1z5xDoYFQuOQNChq7/JC7v9LeceC7ZllaOB3vlGzxEujGjVBGo4NKhPRPqaC1PS1l6Bc7rM=
X-Received: by 2002:ac8:7d4d:: with SMTP id h13mr12699842qtb.263.1619598213610; 
 Wed, 28 Apr 2021 01:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB233983F380954AF58F9898208F409@HK0PR04MB2339.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB233983F380954AF58F9898208F409@HK0PR04MB2339.apcprd04.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Apr 2021 08:23:21 +0000
Message-ID: <CACPK8XcKhmBnXg0EY-jNaubCposQsgprvW3YaU8LqtwgkjM_VQ@mail.gmail.com>
Subject: Re: [Kernel] Nuvoton NPCM7xx unbind FIU issue
To: =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
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
Cc: Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>,
 Brandon Kim <brandonkim@google.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 28 Apr 2021 at 01:15, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC)
<George.Hung@quantatw.com> wrote:
>
> Hi Joel,
>
> For kernel v5.x, we found that when we unbind FIU module at the first tim=
e, it would cause kernel warning like that:
>
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 2174 at lib/refcount.c:190 refcount_sub_and_test_che=
cked+0x60/0xbc
> refcount_t: underflow; use-after-free.
> Modules linked in:
> CPU: 0 PID: 2174 Comm: gbs-sysinit.sh Not tainted 5.4.80-ebad8cd-dirty-c4=
6444d #1 Hardware name: NPCM7XX Chip family

Hopefully you're not using 5.4.80 anywhere :)

>
> And there's a fix on kernel github for now: https://github.com/torvalds/l=
inux/commit/794aaf01444d4e765e2b067cba01cc69c1c68ed9
>
> Could you help to pull this fix to current OpenBMC kernel repo. to fix th=
is issue ?

Sure. I've applied this change to dev-5.10.

I imagine it will show up in the stable tree shortly too, so if you
are really using v5.4 I recommend merging in the latest stable tree
when that happens.

Cheers,

Joel
