Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E8E7C6E7
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 17:37:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zHcg3nlYzDqdp
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 01:37:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jSUXePFU"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zHZn1CkzzDqZp
 for <openbmc@lists.ozlabs.org>; Thu,  1 Aug 2019 01:36:16 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id m9so30536557pls.8
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 08:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mz3SI1LA5tvbazhY2rAcOBo/o2nQIuzB44vGKL2+XaI=;
 b=jSUXePFUNmkuhUQ65/Nd4eK2UwQKxXy8DJ9V8mOlyVVpl47qE033HzNq41w/wVHNoh
 Gd4bGF1p0c1Ipv0lVV9KVvhRDnYTovkzhPOnaQALBCOCqbDIhTDqg5+UofRUW+JEkOrv
 5VbcMIPsXQe8v3rlM1G75Eq6BG7mVMqEpNuAMSMUNPGVX8h+9bRbEGPELuRh2zxCs0tJ
 HA/yuTcCjH38tdYWcA5u+pw9HmBgv8CiBeZG/h/QN/L+TlcuVRZJMBLCziPT9SC1/xLY
 mmHqvGY9mHmPTaf+gHGMQsE2BZ/r5zYa5J0dWG/TKODYUsPjSgGVC+NNfYLDyWOqfUAy
 sjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mz3SI1LA5tvbazhY2rAcOBo/o2nQIuzB44vGKL2+XaI=;
 b=Y6lnAAjdjqrLJg/IHdciCCVPyS61MGJ0+TAAmXEC6fxT6SNmNhg2VwHyEMwxn+2arM
 HIONhoiBG+qw12ppbz0ABGNJAi0XKHCWYR6VovIgray0/jVeqgLEUOhsBLyEp/mH98lQ
 0E1HVzZ83ELYqpvEIPyQxLIerFsROUBpQTllld0er+BK47ndBEG/CTR4b+kovIR3FerG
 O9jIctVFpQaKIvG4HaFUbWN6StoMmykRnqjpMKTcm3h67aIrlZ+cALSwFjuMIzWy4yY5
 8XAkBO5c83BzXVBEATYm7NcQroXgKcGm5sgRIGdcVnck0340jnpXEAGmcAIUkknshFY8
 0VjA==
X-Gm-Message-State: APjAAAX0KxHx4tIsAfSin4aL/IF3EOQ6ToVM4NzKNhCR3gaGXu91X1ti
 kxgw9XP0qtqKeNaZO5S7moRnTGwNg6MxyvMprS5iWg==
X-Google-Smtp-Source: APXvYqxt63/B739pRzmh/MW6Oy7cUU2kh1WXDk+r+7fQfhsujGIXBgVvG3dv9DOUKj6AXaQD19JaEyloibfyuPe6m4k=
X-Received: by 2002:a17:902:9307:: with SMTP id
 bc7mr117197127plb.183.1564587372129; 
 Wed, 31 Jul 2019 08:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzfZriPyq6tazS_0UxiZLPPbD_+z-YEDfFTvTT6utxcVg@mail.gmail.com>
In-Reply-To: <CAO=notzfZriPyq6tazS_0UxiZLPPbD_+z-YEDfFTvTT6utxcVg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 31 Jul 2019 08:36:00 -0700
Message-ID: <CAO=notxhF3DHd7dTi09FRfGBrYUuTMD1YV-h-7jgLkJW9TGt7w@mail.gmail.com>
Subject: Re: exposing device-tree populated eeproms in FruDevice
To: James Feist <james.feist@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Tanous,
 Ed" <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 29, 2019 at 10:59 AM Patrick Venture <venture@google.com> wrote:
>
> Per the previous email, some eeproms aren't supported by FruDevice.  I
> was curious if it made sense to have it not only search for responding
> i2c devices on a bus, but also look at ones that have the "eeprom"
> sysfs file, and talk to those as well?  So that we can put things in
> the device tree where the kernel will expose it with the known
> driver/configuration, and then it can be read by FruDevice -- although
> at that point, it may make sense to have a hybrid approach if possible
> that uses ipmi-fru-parser (which uses the eeprom sysfs entry).

Just wanted to promote this to the top of inboxes.  It isn't clear
from reading the code that this is doing anything beyond "installing"
the device via Exposes.  If it's a temperature sensor, it sets up the
dbus configuration, but otherwise not.

>
> Patrick
