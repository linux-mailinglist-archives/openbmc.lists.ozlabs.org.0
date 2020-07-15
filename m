Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAF32204F3
	for <lists+openbmc@lfdr.de>; Wed, 15 Jul 2020 08:29:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B66t74h1hzDqKv
	for <lists+openbmc@lfdr.de>; Wed, 15 Jul 2020 16:29:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::236;
 helo=mail-lj1-x236.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=U6CC6WMA; dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B66sJ1Yh4zDqKP
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2020 16:28:35 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id s9so1226482ljm.11
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jul 2020 23:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Zq6j6oLRviSESzhydeNumjd4mW3Ip78/eZMwxqcbSTg=;
 b=U6CC6WMA04XHS0PDUZrhBVA4FeSotnRQOBLrY+aY5F2SGrJCeXO6kJqZsM5sfLaq/N
 oNigwsN0mKIXkpuOscFdQZRg7RTxinmINuu3A+0ddGDxdyEBeXqOcfhyXeYG40DSiaFn
 CQMPnj3x+jRTrMp+Kbv4C4k4x9GKojX1A37ZUc8f4vOmNhqRa0muLlhU1nsKDgUxtDNh
 DylHD+xWi6gJfkbedHkp8lQES2ct5Ec21zmFzdspmwrY0SpHT9bvnztZ6WAghoGwCue2
 0kiZoI2bgJSTrqeR0+uYy3YAPyvXOF+YPetI9Ln1JRfdP9PHdiZKTgktDLnhtBZ/UQUa
 7Btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Zq6j6oLRviSESzhydeNumjd4mW3Ip78/eZMwxqcbSTg=;
 b=kQx8xt+oHaoHtNx2Oi5xobzXg8T2Zf5aToEtV2sbGg3yOsGUBtTLk+YC/dJUhMzqTa
 eGRa7rvdWZ22psao5CLPWGw7n8Q1iUH9hJ+pIa0ME3LCWoQkzxYU8efTr6xCBNzLU/mb
 ObzfvBYD3zV2LPt7SyMQHydqb9YjcwZ1/R/VJDurAMtJJ6nRKhutLZQPRkfZQJrgqwSZ
 jnpHQeHhT77TaB9EvTK+0Mqbo0dmER2+TzGXV6ejA9iSPgtZmkaOAgoXONhdDw9CfwJn
 shoPyhwSbb15CvZEWY6hpvPGBbw+dC5KDpHusL7Wx9joTyp9Iv+FpNkuycdjaV58tDQp
 yaVA==
X-Gm-Message-State: AOAM531K0TXHCYH9t7sV2P+bl0uYO3vMpevx+5hK5+o+g4fN0ZsqGZ96
 IowBpmBnc2h48BUwA0CiDix9vH1aGPIvgb1Oa1R8RGeK/LLRUw==
X-Google-Smtp-Source: ABdhPJx5vJ2JXeGquejtw4Qq8Ri9CdDOUTIwNTBnotC7PWLi6N5fEUshyBVoCOjvv2DxNrxGv1vLVOWJusw9Hda1M+Y=
X-Received: by 2002:a2e:b4d8:: with SMTP id r24mr4041125ljm.19.1594794511376; 
 Tue, 14 Jul 2020 23:28:31 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Wed, 15 Jul 2020 14:28:20 +0800
Message-ID: <CAGm54UEhd6KH0676mqN3EUmEAtgJ81NPKboZUffmRUFNBaXV1Q@mail.gmail.com>
Subject: Request to create new repo meta-bytedance
To: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: xuxiaohan@bytedance.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brad and all,

Bytedance is working on some projects using OpenBMC, and we would like
to create meta-bytedance to hold the configs, and in the near future,
we probably will upstream the machine configs as well.

The CCLA is already signed:
https://drive.google.com/drive/folders/18Si2WEW0caKObqT9UWapAvD70X_JHnVG

Could you kindly please help to create the meta-bytedance repo and add
it into openbmc as subtree?
Thanks!

-- 
BRs,
Lei YU
