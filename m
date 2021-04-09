Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 504A8359650
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 09:26:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGqSn1tm8z3bs2
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 17:26:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=riT77YVQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=riT77YVQ; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGqSZ19Bgz2yy7
 for <openbmc@lists.ozlabs.org>; Fri,  9 Apr 2021 17:26:37 +1000 (AEST)
Received: by mail-ot1-x32b.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so4837929otr.4
 for <openbmc@lists.ozlabs.org>; Fri, 09 Apr 2021 00:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PT7IKHUvagojFu+41guw/OZ5G4dsij/09kkEC8bibRw=;
 b=riT77YVQcfeD2k0mmG7OE2nVHAJnQSWJGjsuTFaSX1XTKGoG/Y07/V5HwZTcnUSiVW
 QW/ilsu6u2FcExoLcPwjhU5mpvXoW8O4RkOuriTlwo75lBvm7oI2ywwHj+oJWHse94kt
 KGBx6WzWHK3y1X5p3QKfqZOU3gXSCIhZwvI3haFM6vtRIkOuCtzU6I994jtO3seTcB5V
 3KuitzcL3vfC0VpoOzi3dxaixxzFYlWh5Qy/XZk0kV5hVM4zXXv5q0RwqLfFubW8zQD5
 aLuU3dTGxxN5zmv3IECQDCbR69M/GlejZlyJH9vaytTr6/TW2wqe3JccdGYc3VLY2zQr
 NvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PT7IKHUvagojFu+41guw/OZ5G4dsij/09kkEC8bibRw=;
 b=tUuNii1uPYxTwfRSwI1TOFPJkea7ab60BEaJ7HD1YxvOdr+FQpUDSsy5N8SKYQOuVu
 7Bx7Pkcaj4yHCqVLg9W5pbxaqRkH1aFJDYbS2Z/dgLMkq8o7k+BSwSpG5abkiAlMzrQb
 EOKmrRfbNhfhtpgFr4RYSpHHZkd2eiXVWhwsnwmsMdlK45RcDR7xkvSbPNNPJpAVMroz
 2sm9LnVYhet+RBLGCyAWFytK7UpooSOnYzzmUNDQc5ZsM3H7i6E9YhiVE1XFMmIcHjG8
 YhSQ6+nN6UBG0AYcAq3OZc2WGpj429oAOOVTrWLXPnlHE+pK7RT2LibSBmuXubU2kdhB
 lXBw==
X-Gm-Message-State: AOAM530us5spR5rI5rOoQ0sjJKyOgF1WmYqDklfohzMzFZGzFauTFW50
 t4cDZVkA82WGW6uP4OGCQPq2poGT2sBkn6pw0bztPCqHmU08G6GA
X-Google-Smtp-Source: ABdhPJzarzUBV72ssT+mNn9ctWirCcUhOaOSdGgtHCJEJUlogCqOVx5yovT57snQvyE+e3An06jZ6kqCDkmY83It3gI=
X-Received: by 2002:a9d:4e95:: with SMTP id v21mr10703029otk.361.1617953195046; 
 Fri, 09 Apr 2021 00:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <PU1PR04MB2248961AEF87BA87C7749050A70D0@PU1PR04MB2248.apcprd04.prod.outlook.com>
 <20201007013446.GE6152@heinlein>
 <80ea13b3-1779-b2b3-c295-3d09dfd41987@yadro.com>
In-Reply-To: <80ea13b3-1779-b2b3-c295-3d09dfd41987@yadro.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 9 Apr 2021 15:26:24 +0800
Message-ID: <CAGm54UE8q10dx6Q2KCFMSXv4MpVLQJ7njOHbwMD1dWMtSMr3Vw@mail.gmail.com>
Subject: Re: adding sync method in phosphor-time-manager
To: Alexander Amelkin <a.amelkin@yadro.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 9, 2021 at 2:17 AM Alexander Amelkin <a.amelkin@yadro.com> wrote:
>
> Hi Patrick, everybody!
>
> As far as I can see, this discussion has had no development, to our regret.
> We would really like to read some clarification on what is the proposed
> method
> of timekeeping for x86 systems nowadays, because with TimeOwner interface
> removed, it's not clear to me anymore.
>
> Do you allow the users to set time/date on the BMC side? If so, how do you
> propagate those changes on to the host, which in x86 is the owner of RTC?
> What if the BMC is rebooted before the time settings are propagated?
>
> If you don't allow setting the time in BMC, then what are the options
> for the user?
> Do you allow a choice between NTP and Host time only?
>
> How and when is the time synced from the host? Is there a method to
> force a sync?

In our x86 system, what we do is:
1. Sync time during BMC boot from ME;
2. Use NTP in BMC side and never sync time from host (ME) anymore.
3. Ignore time settings from host if there is any.

-- 
BRs,
Lei YU
