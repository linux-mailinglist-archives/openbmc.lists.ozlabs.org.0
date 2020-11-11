Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BECF2AF628
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 17:22:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWVQ71HcZzDqvv
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 03:22:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::430;
 helo=mail-wr1-x430.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=BpLNg8+B; dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWVPC1wLVzDqvh
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 03:22:03 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id r17so3118508wrw.1
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 08:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Yquau6YqB6EIpJxwmX14I7SNZoFlYsF0tzecyYanSk=;
 b=BpLNg8+BTqlUUpgpm20U6Z2RPEChJWIgzpG2P0h3BNlPItSNELqKCpC/Y7ehg8xQlY
 OeGrnFkx948fniWkQbq+tIpawmAWOwwkxqcKUcj46d1cg9wJ/hkrLarle0+2HO42QO8M
 nCxR71P4rxlfb5Ftu7B3CJlphHEYD4obKOFHv5hq5BnjB9/hQh4jGXi965RM36c9RiVQ
 hn1ny3tJmsMjY/sLN7r6UgwpUfwLQ1wYxFjBYy33rGOqSphEcDxZc8bhKxbSRi9KcDLj
 BagYmGtdZgTJ4t2pK03czHVTzVoaNsrsSqi10YdZcwWGyNALJAZ1nC9BtPDxdAgdOoO7
 l0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Yquau6YqB6EIpJxwmX14I7SNZoFlYsF0tzecyYanSk=;
 b=ZiHLMpDplus9LMGIMSwEBpt2fCK5IYrI5nmhjJhwe6+9coRLeDjM6LeSAIAfCYkCeo
 PsmzAUdEq1Q/GlR30YCjnlE3mWJv/TNAf38Y45kzaa4knAEMjsjJpU75YXp7ejMhWh2G
 cn3tAyHSSD2YOka/mhxxp7Gzun/ElO4ZuNBKBuO3fudY6HYvqqyUUqaegN41GuqrfAyG
 dPOmQYMVvtdnu4kEJLvHuxxTi/Wvq3YEvI2E2nxPxTjPI+XanoMyndIxrse9lZ0wBjiF
 n1LmS14dSUGZDOjQjL/UzOJjJIyaBjumb567GsnxRLlstyjINXAy5VW//G4D85eLx4qq
 5kIw==
X-Gm-Message-State: AOAM533cwlKdCw5K8gHS3iKLU/nSk1/baTeFzpycf3JUtumbd80XtbaX
 4xa/e0P0rWNR1b1N/6pbDjwTbls56U1ZQX/9CPrpWw==
X-Google-Smtp-Source: ABdhPJzPAOLKeS9KeM6WSOBib1ut+ws/ZrYu6XuWKl5vg4nBVxi6f8jSR9OR/r7uDxOv6Soe31JLNVIPhGx75MZsFBk=
X-Received: by 2002:a5d:4802:: with SMTP id l2mr17461085wrq.424.1605111718749; 
 Wed, 11 Nov 2020 08:21:58 -0800 (PST)
MIME-Version: 1.0
References: <PS2PR04MB376626759A0B805833E82782F0E80@PS2PR04MB3766.apcprd04.prod.outlook.com>
 <CAFy7wvqH=3TphMDFb0AyNc4xtK=DvC3pDiQDZuvB=mbr3X39Pg@mail.gmail.com>
In-Reply-To: <CAFy7wvqH=3TphMDFb0AyNc4xtK=DvC3pDiQDZuvB=mbr3X39Pg@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 11 Nov 2020 08:21:47 -0800
Message-ID: <CAH2-KxDMpTDQpz3joLL=Gnoabt_HT536NJ1ocXoWS9HWkArgWA@mail.gmail.com>
Subject: Re: Reg:- SDR sensor read
To: SATHISH <srisathish23@gmail.com>
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
Cc: thangavel.k@hcl.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Nov 11, 2020 at 3:46 AM SATHISH <srisathish23@gmail.com> wrote:
>
> Is there an implementation already exists to handle SDRs for ipmbbased FRUs?
>
>

I don't believe IPMBDevice supports this dynamic discovery of sensors
today;  What's there is largely implemented to work with Management
engine, and its set of I2C commands.  SDR parsing and introspection
would need to be added.  I'm happy to help review if you want to put
together an implementation that does this.
