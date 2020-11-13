Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9972B25C5
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 21:47:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXrBB4c2HzDr1g
	for <lists+openbmc@lfdr.de>; Sat, 14 Nov 2020 07:47:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Ytglp4Gl; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXr762vF9zDrB2
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2020 07:44:29 +1100 (AEDT)
Received: by mail-yb1-xb2f.google.com with SMTP id k65so9899897ybk.5
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2020 12:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=czFUqx8mThUGl1j+43F/9BITosVUaMb/W190QfMPzj4=;
 b=Ytglp4Gl/dQc/f+OXfBVfQwxaIHq8q32NwFatXm6iM13mVErbBthW5TnB+hq/ozESw
 J1USqPqwwPGZzAl5R+Laxl7tArRl1SX0zuZtHaQLzWX5Gm4p+5U9VIL2+Ofi0zhEK0td
 JOlMCxC0VwEJP8Ugx7FPZLmSAeUaZl/8tqU0cfmmtn+/5Wa8uQ9zXjKs1zUH5KVLwpNB
 /BfXlxVDUCKAl22FZj4iETUIxIRzQPoffT+cKbR2WbmXtykmIXVObNJ4Fj5kcDwxOo22
 QZzox7hVRvmSumaAVXJMqdJXndq04tXpDHgQuORoqBEeT6B3eENRXAZRcA+UzLMXixJl
 ql9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=czFUqx8mThUGl1j+43F/9BITosVUaMb/W190QfMPzj4=;
 b=kR6x+M6Wk3Pq+cSKt0ptlED4rESC0A5MmFsFJjSkzVMGPxEmln7B0hEwuKlQRGtk5d
 JZF4y6OCxLY1hU9O+Vae7jJLIZ5i29sZEQZ2rMmv4EnUESO8eV4pCqbc3DNBEMK4226V
 a7OvwmwwnvyUsGxa7SSglEIDlm39S/l6bQ7KeKHKplFqdH+xheKFL9+PAseAAl7tgfj3
 Wo7boUmZxQgJUj+rgEkhMO95Z/TndyPIjfal325xpE6mazcwhszJcna/ZNTSzxUU8Fux
 gZlqNyjREI2bQiPtK6hvl54HZgMYwiZ63NTeGrR+94qFIhudS0f8sGxz5PJ0sJL8zswH
 mA+Q==
X-Gm-Message-State: AOAM530mfSIHQyq08ypKI/TKqIpROb5bstu3Vakf44uvI1aDEXnpLxmT
 e9EwEuSMDMwCuOFsV2NN54b5oJA4ecQcE4zIkgVCHA==
X-Google-Smtp-Source: ABdhPJxfcFfnRaq6+TRiK4MKq3DQ6NKWCmVrMHp4ZRGCOrpa/QuAAbSp/KH7QCWNLPyvkTMvuDHP2uMR4kMThbmEank=
X-Received: by 2002:a25:340c:: with SMTP id b12mr5096345yba.417.1605300265595; 
 Fri, 13 Nov 2020 12:44:25 -0800 (PST)
MIME-Version: 1.0
References: <HK0PR04MB2964AA77874471609F0B25BEFDE60@HK0PR04MB2964.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB2964AA77874471609F0B25BEFDE60@HK0PR04MB2964.apcprd04.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 13 Nov 2020 12:44:14 -0800
Message-ID: <CACWQX81k6M6acw0VL3aYA_uqpNsEUjZ3DhiAQp_mXLbGJU87=g@mail.gmail.com>
Subject: Re: Fault handling(Threshold exceeds/low) in Fan and NIC sensors
To: Kumar Thangavel <thangavel.k@hcl.com>
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Nov 13, 2020 at 8:31 AM Kumar Thangavel <thangavel.k@hcl.com> wrote:
>
>          Could you please provide your suggestions on this.

I'm having a little trouble following your email.  Dbus-sensors has
the ability to mask thresholds where appropriate, the platform
specifics of which are already captured in the config file definition.
If there's some configurable masking needed that's new, we can
certainly add it, but I'd recommend looking at the existing threshold
masking before adding anything new to see if what's there meets your
needs.  If you have some concrete things you'd like to see added, I'm
happy to talk in more detail, just at this point, I have no idea what
you're looking to solve, so you might want to be slightly more
specific, and reference the existing threshold even masking in your
proposed changes.

Cheers,

-Ed
