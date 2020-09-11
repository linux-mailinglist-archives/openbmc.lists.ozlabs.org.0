Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E44E2265BF9
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 10:51:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnqGy6bbSzDqnR
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 18:51:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=dbALnyi/; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnqFp4ht2zDqfq
 for <openbmc@lists.ozlabs.org>; Fri, 11 Sep 2020 18:50:05 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id x77so5106735lfa.0
 for <openbmc@lists.ozlabs.org>; Fri, 11 Sep 2020 01:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=2+7xT4V+L4reMR3M2o24Gzc/Xo9m6k+Kbsy/DWUwlew=;
 b=dbALnyi/f9leYirbBnc68/Si0zA5cbXezQXxlC+VAAqmh2Eo9adD37CKu3HdD2E5lx
 lrHb8C41Q/yrDn/zGN875P4KeX8r/xNaSj3RS7I4V3LQHHuDARANkFdIvK6l5dkPk0pY
 XtoIPpEq+YMuMRPrT4sBDnHTnxJzo5WTzGaSk2mVp7DgU2enWKCOrrrjl2KkE8TBf+73
 KpOr1CV9oT3QoQmUxdVrHepuy0I4sIwNip2fR3nrUqH9DDzwWtJ0I3/Aoz3am7zdDb1b
 qDX7kLeTvgo+o5t4VMYUyhgZ5R+BdvddahGXjaro/HGfgzOUEIZpgDLId5jOpBFnZSg9
 Am8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2+7xT4V+L4reMR3M2o24Gzc/Xo9m6k+Kbsy/DWUwlew=;
 b=OpbjlNmU1is8j58mHYCe35tHpea9CGOOmwRDm9trmCN6aDyI87xQMnsQYI8v8wRrFy
 nLT7IJ+zpGehfvcdk4kLjeyoUIN4U71TSe6Epr4kV1xpJkmglLB/aVDKab1PrpgrAg8Z
 1P/1loHvAtKDuQqhNYnIYz4ztgl2NUcntv61Etox3aOyaKsIZO1IgM48ZUwTFI4MEuIx
 EHrSlUUqOPyAqxTFDLzJRdwSuLYehlNJJemyC3ayDFTHBAK9krxy22IE4+ZBDQgEj7CT
 aYdi8k1aay2CzgoGe34IzAcp7Q9v7yZMViCqH+JPb2+uxjQzB5E0tonVdlIzroqKpOgC
 k3KA==
X-Gm-Message-State: AOAM532huMWDcCfnH21ny2b4NEMf8bHyKiEIUhVL2f75A2G0cgNLwIhc
 QBPvrQBpjuKzXT6sNHFNHKF74JxKwI1WkZvJPsuPxLqurGotSA==
X-Google-Smtp-Source: ABdhPJw2x1XuT401aEa21D8jPlP7K/5iUd6XndbAodFymspuv/Rks0LCe0+3hXXNBR2lX3ZfRMqxZc08cXtGTpOKYTA=
X-Received: by 2002:ac2:53b3:: with SMTP id j19mr431610lfh.101.1599814198481; 
 Fri, 11 Sep 2020 01:49:58 -0700 (PDT)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 11 Sep 2020 16:49:47 +0800
Message-ID: <CAGm54UETBZ-EAR-2tha+qHTH7h3H_1vZUe2Tp5kOTzY0isKLtw@mail.gmail.com>
Subject: Design proposal for dual BMC flash with "golden image"
To: openbmc <openbmc@lists.ozlabs.org>
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

We are working on a system that has two BMC chips, and one of them is
designed to be used as a golden image.

The current OpenBMC does not support this usage, so a design proposal
is sent to gerrit, please help to review if you are interested.

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/36407

Thanks!

-- 
BRs,
Lei YU
