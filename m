Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 261E0292EF7
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 21:55:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFSCb0sHpzDqck
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 06:55:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c;
 helo=mail-oi1-x22c.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=etV1xMmW; dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFS9Z3R8czDqM9
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 06:53:21 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id w141so1315700oia.2
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2020 12:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=9p9qYxerANphWipNfp+JAd+QIXzLhiL3AAK+0Q3RrL4=;
 b=etV1xMmWNlA9ykrJ6l6fO2KTX2TdYMDmBlFjcBAgBU/zQrRwZoD3nHtr624vdGWLpT
 yiD4m7WMb4s3dgLfVYUNusSnXiUBajpzVrgJMc4pVvnd78mQRQgm543T4Tc7Y+EgzYqn
 aBA512FrK6H38PHNrUraQVD6tfL93fHtDG7s/QXKNLc70EitFVB8p1M3PY9mJqP+S786
 GfHgQtm61Hwy/sP0+yc9gwQkqBiwYfPMBiICva/H8/GTPCnZ/4GOHqFcioQYOyESTmsN
 YFd8q4YM9eukYuKPzFWXKG3YK3jGp6pEGenTG3AlY4kIJZwmKagXOtVWWdkyngpB5RUU
 CnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=9p9qYxerANphWipNfp+JAd+QIXzLhiL3AAK+0Q3RrL4=;
 b=o12Es5kovqcbHaBZEPbr1q1xx5rxBI9gtWi4ZZTMlxjYrvEXvSgrrh6zMsSjc6b00C
 wGkgLfd6UmIcfKoCfw+eOUIFAnLwdouU8eAF49eKULwBtiqY4rkbc6ky9mso13ESv7ZH
 UmgSo5mt/GJEXNaepR1WbBJntsAqjuMNN5aRgVZ/h8BDzhoADtUqIqdWosCnwdGzZxQx
 CLXzDfIqACCDBIJsISAEx9XOy+dRV53XAODb4ap6tBUzhZE38qJOYLKsC/M8lwZYZmzN
 wTeQZeKEBXi61zmCxuabhLV24b6s3ecq9xBLIrrOLyy1iDpJ8+uFOVkvDOW1oukwTt3T
 0wZg==
X-Gm-Message-State: AOAM532Ur1wwxdkd2RHb9Gw1h5sb1Nk0hpLYnwwKqjFuFdCIg+CKuIRX
 UltTHMo57o+mTLi6RR4TZxh98esT2Syumg==
X-Google-Smtp-Source: ABdhPJypTbVfuxqx04j1wdwbpsyQU1lsLQEexNWWLgeuwaN61ktMooWanlud+hwhM+Id4WeRwrCkCA==
X-Received: by 2002:aca:e0d7:: with SMTP id x206mr734162oig.67.1603137192343; 
 Mon, 19 Oct 2020 12:53:12 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
 by smtp.gmail.com with ESMTPSA id h32sm180540oth.2.2020.10.19.12.53.11
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Oct 2020 12:53:11 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Critical BMC process failure recovery
Message-Id: <C270F145-2236-4CA1-8D57-A63AB622A47C@gmail.com>
Date: Mon, 19 Oct 2020 14:53:11 -0500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
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

Greetings,

I've started initial investigation into two IBM requirements:

- Reboot the BMC if a "critical" process fails and can not recover
- Limit the amount of times the BMC reboots for recovery
  - Limit should be configurable, i.e. 3 resets within 5 minutes
  - If limit reached, display error to panel (if one available) and halt
    the BMC.

The goal here is to have the BMC try and get itself back into a working state
via a reboot of itself.

This same reboot logic and limits would also apply to kernel panics and/or
BMC hardware watchdog expirations.

Some thoughts that have been thrown around internally:

- Spend more time ensuring code doesn't fail vs. handling them failing
- Put all BMC code into a single application so it's all or nothing (vs. 
  trying to pick and choose specific applications and dealing with all of
  the intricacies of restarting individual ones)
- Rebooting the BMC and getting the proper ordering of service starts is
  sometimes easier then testing every individual service restart for recovery
  paths

"Critical" processes would be things like mapper or dbus-broker. There's
definitely a grey area though with other services so we'd need some
guidelines around defining them and allow the meta layers to have a way
to deem whichever they want critical.

So anyway, just throwing this out there to see if anyone has any input
or is looking for something similar.

High level, I'd probably start looking into utilizing systemd as much as
possible. "FailureAction=reboot-force" in the critical services and something
that monitors for these types of reboots and enforces the reboot limits.

Andrew
