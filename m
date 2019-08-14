Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 020DC8DFA5
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 23:10:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4682LB2rS2zDqvd
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 07:10:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lFB16B3y"; 
 dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4682KR4w4SzDqjc
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 07:10:03 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id o70so94431pfg.5
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 14:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=4Zu9tcEoSc0CvZTapAuSKu0z1+5SgC3WiAqJMLLJMZ8=;
 b=lFB16B3y7Wty76DV1FXjANRp1W5e4hhU/v2v8fS1M5Lt8XruJM9XAITwzz+z/dXQLh
 3QtLT47u0tveMyLXYU9DhsvQS39Z4DdfTvLphsUxH6Mp+fMB+ABIQQmokHKVDyzB73fQ
 s0tGek9Yn0CYOsFdai+gxlS5jQHiQJEgOVqv9nobYcV3yTGJypAvEWkWjuuclCr1+ZUe
 Jg4TyexGcgKr0NNBFleDxxkZUTPajEC7zwjzOdKA0bEA3hkSDWvnf9RJQRZK22BvJKkf
 xL8HbjZVq8KOHjyEKKx/ATmyl6Z4ttsj5iaHgGeHMGWQdImmaiOhfnj3hGuzmqlj2cre
 y6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=4Zu9tcEoSc0CvZTapAuSKu0z1+5SgC3WiAqJMLLJMZ8=;
 b=i25jAHfuwIMHEAfFDSmlGX40018arPwVHZLMRNLVR4kKPzarF1c85u15jeqavqxakf
 +rXfDk3QhucPlMndf32qoTgw1iH1XoRFXT9d9ZNjZnvkMX+n5yAEv4PWf2Y74jL+I4nD
 h4sXTWazsCvi5xir7IbSPBkh+WiO7kAx91TmYENnI0EvW8s9vwYDkLmxMPkXKcyQVFbv
 umiKOPuu+0iAtNh6aBq0QaIZauMJRuV742hWC2Lp3ZLT0dJ6RBs12qdyJzUwoRv/w2EL
 8szE2vAU8X3Y5wMLknDY8Dvste/LY/1KIgU9LRIvbD9kaJOdMY9WC984SeAwLNoGz5RM
 Jtgg==
X-Gm-Message-State: APjAAAVgopeYLlSx45zhdN10xmkTyqfi/5MHr74X/UNMaUNYoLzTnl+8
 eoayjq7QKqaB71lycuMpwwxKxMFmTS3Dk1xL+nr23w==
X-Google-Smtp-Source: APXvYqyQMFh12CYMxhWb8o0zrhlOToANK8K3svXuafdRaEWrm4FD1i48PfrKlAscxdYxkhKxuCKuwnh9jwDfa6E5vXg=
X-Received: by 2002:a62:e515:: with SMTP id n21mr2014833pff.186.1565816999217; 
 Wed, 14 Aug 2019 14:09:59 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 14 Aug 2019 14:09:47 -0700
Message-ID: <CAO=notwDmu0Xz4usK1aZQg39V3vT9ZBOt7L7zDp8zRN+5dMcvw@mail.gmail.com>
Subject: mixing phosphor-dbus-interfaces and intel-dbus-interfaces
To: James Feist <james.feist@linux.intel.com>, "Tanous,
 Ed" <ed.tanous@intel.com>, Nancy Yuen <yuenn@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I was curious how you guys mixed your dbus-interfaces repos.  it looks
like at least in dbus-sensors that you approach the use of them
differently.  So there's no incompatibility -- for instance, between
the two sensor value interfaces?

Patrick
