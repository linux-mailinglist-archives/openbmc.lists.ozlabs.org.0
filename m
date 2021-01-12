Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1018D2F27E8
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 06:34:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFK5K1KxRzDr0P
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 16:34:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=U2uT+Zbt; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFK4T5F1HzDqxL
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 16:33:41 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id a109so1236583otc.1
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 21:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8fhjKa7bv/kRg1cy8q/nHNoM1+2EMYHNCu4WQrdY7Mc=;
 b=U2uT+Zbt34iBlEBmRyBjBf+yOIBkDX7DtVC0bkX0EtNTbzuRt/jmPBbr6u7aZ7vIc8
 MhgRFvl8miFRacGvn5Lk3eSccwX2E72ibP6jLzoJo74EeefrP7guMh/ZyTuCUSioDCag
 nN4NCF34PWywUsjaHWJnkTCBOLHSQU/maEIIDZRaKXypqOyINBzvo+TBRH0kRyKasW/C
 xzeg95CqtsR8BozVFkVJYFWG91BVgl/IbE1EhbqxyQ7HU7wx52tPOXUVWGJExy8mYyXW
 yA97WDpn2Y/hp+fwdxsOelV4G22qYOAmvMOcm5DGGZl79zcW2prG1GTBfgec0YQsH0IV
 MJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8fhjKa7bv/kRg1cy8q/nHNoM1+2EMYHNCu4WQrdY7Mc=;
 b=OVB29ZXf9nvrHZw4eZETe4xWLTtEimxSILgyY3LU1RI05RBna7vEqbJIsZaCDHOlic
 yMJqGEIDQLK9Mik/siPjjsTAHKHYT5wV3KLdE1PNJHpSu/X7JmwodnzFY6VO2cWjKMXa
 iGs6YO0JNVcVIkqtNNNYlz8G5RN7uGS9TEbmB5r3bS/CWWbPhLee7UdtMNojpaWKDCEM
 Br2OxYgfQT846Epaxio7CR/ZQsLJeRXTdLDXMGJ+ZkRT9eEbJ6AMrO+n1I3YkkuluT4s
 Uv/N1VcnP6vq594EziEYce3osCleqJXqHZxcLk6Q7Y486CEf7OoQzhFwCNduyD6OU5jH
 zUFQ==
X-Gm-Message-State: AOAM5322pwpoKeLm8tmR8kyzG3WKPTrr0nyECOb2d001Cr3tER6e6Ymx
 /AfZNN/ZXKwxLL8Prkl7kntr6BGxvhPkOPSs30rTiA==
X-Google-Smtp-Source: ABdhPJz3CoTVp1XyU0s2Oox7SlethbIY0IA20sfTSZiycBaJ4GARuAuU4B4bMcz20NX5JvJFhL9D7pp/e9O5/dGnPyc=
X-Received: by 2002:a9d:620f:: with SMTP id g15mr1657692otj.361.1610429617522; 
 Mon, 11 Jan 2021 21:33:37 -0800 (PST)
MIME-Version: 1.0
References: <PU1PR04MB224835088E75178D9AB64B85A7C00@PU1PR04MB2248.apcprd04.prod.outlook.com>
 <4C410766-951F-4543-AE09-BC3F31197F5E@gmail.com>
 <PU1PR04MB22483D0A65A9A2632000C043A7AA0@PU1PR04MB2248.apcprd04.prod.outlook.com>
In-Reply-To: <PU1PR04MB22483D0A65A9A2632000C043A7AA0@PU1PR04MB2248.apcprd04.prod.outlook.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 12 Jan 2021 13:33:26 +0800
Message-ID: <CAGm54UGVDL5qN+z1vxXUytw-87SwtFCceM9bdzVNaUPg8RAAdg@mail.gmail.com>
Subject: Re: [External] RE: CI build for yosemitev2
To: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
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
Cc: "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jan 12, 2021 at 1:10 PM Velumani T-ERS,HCLTech
<velumanit@hcl.com> wrote:
>
> Classification: Public
>
> Hi Andrew,
>
>
>
> Thanks for your response. I am working on the hardware CI for yosemitev2 and will keep you posted.
>
>
>
> Can we enable build failure gating for yosemitev2 (not hardware CI) in the current system. Sometimes the new gerrit merges may cause build breaks to the YosemiteV2 machine.

We have set up an internal CI on meta-bytedance/meta-g220a build for
commits into meta-bytedance. The job could send "Verified +1/-1"
depends on the build result.
Technically, it could send this information to meta-phosphor as well
if you enable such CI and if you have permission.
But most likely we do not have permission to send the "Verified"
result into meta-phosphor, so instead, you could post a "Code-Review
-1" on a failure build, and post the failure log manually.


-- 
BRs,
Lei YU
