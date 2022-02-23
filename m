Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C964C07B0
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 03:15:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3KQ54LNvz3bTr
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 13:15:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=c22U+w57;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::c35;
 helo=mail-oo1-xc35.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=c22U+w57; dkim-atps=neutral
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3KPk4ftCz2xrG
 for <openbmc@lists.ozlabs.org>; Wed, 23 Feb 2022 13:15:18 +1100 (AEDT)
Received: by mail-oo1-xc35.google.com with SMTP id
 y15-20020a4a650f000000b0031c19e9fe9dso17366067ooc.12
 for <openbmc@lists.ozlabs.org>; Tue, 22 Feb 2022 18:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=UvuKS5RXuJzPT2pYy4h3sWxRrEkBIDwHyXOK4WNFdD4=;
 b=c22U+w57H4QhX3xLNWOJXJPidbXev7kPDSVgjf6WQQzhqCg3QNnMtYbJHcsnwUHKrU
 LiWE+3RsQ6QFmGH3p4YQ3TNYIb7vVB6dpzV/3csAX/uuBB4vPKalSlwUXBspZe5CKiKP
 byRU++XWmvIKKSXMEEt7fq5VT9nfIuR8ZbKmrlx1vUs5kXQx0kpD4Q9Wp6oiaNPE1vTh
 ukFwQ//5twXMN8F1V+d1/JN57HqXwPPnv7ZnwaB9L3OAp9fB4i+eGmHCIzn61KLQO/f2
 wOJgP9ezhUGxz4CsWy7e3Kw1fS7ib6PNU//TcWw41F1AdVuiESaft1SARqRDqBv/AqTY
 2fDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=UvuKS5RXuJzPT2pYy4h3sWxRrEkBIDwHyXOK4WNFdD4=;
 b=k6hbHfSQg84XhubcRU+X73zGK74ohajjGQjddkGXcjuCgAzUr9PpcJZ3FQN1gpMSZX
 ihwRAkrciv3RHdI4GT1YfN5uvRexLnUEDGAIm9EldAh7LZrhDuZlDBXaj7uQonHOLYX6
 y7KeebaGzxdOJX/tzkc2H4SSX/gdMPkXSE6llfUOnjs1zWvI3++7TZpbXAM4aYFBgbdT
 aYlofGuoO4cw7ZiTb1nqRDhXQAnonTjIe2+SAS6UECqZNrem3DD9ckRZ6bmn9i/OC2lq
 vPgerSyBPML78dsiwYhYZPuouOd3UzK8a5V8fBitl6HRv33LV47LL2oK7NkK8G0GrSR8
 WE6Q==
X-Gm-Message-State: AOAM5314X4S3yQqTB0HkQHBgwXOWHpibX85ZiLPyuSTcrDP3SYTOFTgF
 3Hp8bJfgSvNsOagrMR+N7xqEtftqpA/LRHT3rS7UFRSkUP+SGyBT
X-Google-Smtp-Source: ABdhPJzYUnE4r7YKqV9fobHx6i1FsrmJ3lFJ/uPuJQNTeQX6bUWwWsRixBbYDuvxPCmVHyF24aNGIEyiAASV446rNEA=
X-Received: by 2002:a05:6870:219c:b0:d1:5c1d:7f54 with SMTP id
 l28-20020a056870219c00b000d15c1d7f54mr2987932oae.213.1645582515441; Tue, 22
 Feb 2022 18:15:15 -0800 (PST)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 23 Feb 2022 10:15:04 +0800
Message-ID: <CAGm54UE7-QxGBniV3J2jnBiW4ygvRcHxKd=G88PsOiNZP+hBTA@mail.gmail.com>
Subject: New u-boot-aspeed-sdk runs slow and cause wdt2 timeout on ast2500
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On the latest master with u-boot-aspeed v00.04.09 SDK, an issue occurs
on g220a that it runs slower than before and gets wdt2 timeout.
We reverted the u-boot to a version before v00.04.09 SDK (b0fe8fd9d)
and the issue is gone.

Below are some details:
* Before v00.04.09: u-boot works OK, and it takes about 9~10 seconds
to load and start the kernel including the 2 seconds timeout for
autoboot, the kernel starts OK and it kicks the watchdog as long as
the driver is loaded.
* With v00.04.09: u-boot runs slower than before, and it takes about
**16 seconds** to load and start the kernel (including 2s timeout for
autoboot), then the kernel does not have enough time to run and loads
the watchdog driver, and the wdt2 times out on about 22s.

Be noted that the issue is observed on g220a that is based on AST2500,
and could not be reproduced in QEMU. I think it could be reproduced on
other systems with AST2500.

-- 
BRs,
Lei YU
