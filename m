Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B945619B778
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 23:16:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48szXL0dX8zDr1g
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 08:16:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=LrtLER9Q; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48szWg16QxzDqQ3
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 08:15:58 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id v7so1759147qkc.0
 for <openbmc@lists.ozlabs.org>; Wed, 01 Apr 2020 14:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h4glCsq6AJpVCOvsMpQk4ts9fUMzx4nDNEOv4+/Ms7k=;
 b=LrtLER9QUXXLPObX8KWHX2W7/rf7Mb6w7PtSRSFbEyyqxc+0mLm8HTeVYfAlv6lWC5
 ljfzKSaUA0UPo+AVaUyur1pNMgnzddVxw5SbGlItsj9jmrh+L1NOb0HvmRs3HK7G9WdN
 FDL3PAAOEJLZKfepG0xFvlRf2Ph85EO/CG/bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h4glCsq6AJpVCOvsMpQk4ts9fUMzx4nDNEOv4+/Ms7k=;
 b=jntprMOQvNN/50agV3mqYCDpztd9h1Ep4UMpDEW7Tc5yDKQuANuCyv477GZRo3UOF8
 gE+bObrCLpMFmUzoNTYoCs9S3ZCVFZdhqVhkbvAKA6vKrPlGyrRFLOdfhvv5WLq/rQXj
 jcqCnVMbhvG3l9yGVBhCoctfvAh/qJoaC9MnwQrwa0qtSznUxvG0WTiTmXJFrta1Uqkv
 aOHmzkzQ3R3R9X9+8nSCldL6KRq3wJToQOA3IVeFQUqTr3YAwJ6c6aXnKZlOzf+rRA+4
 blZ3+am9fQ946AvLQ6F9x140zSDwdTU+4PgCELfVat0xVY2ijzz9F+tXuujXBrTXQz5e
 vRvg==
X-Gm-Message-State: AGi0PuaNvpTuUVO7uzeDiAru04k/btnJC+r3b6Msn+7mCQ5gJWFfpu+h
 b/kguu2A4AuP3i8XRr+ZH/eM4qGUkVn8huy/OT8=
X-Google-Smtp-Source: APiQypJbD+tEjPMP83YCscAMbK0sKUS4sZ8/q3LKVOExSAkZl4DP2lKnRvROeGjrcOhBsorXoNggwbbZBwe7xsLN6L4=
X-Received: by 2002:a37:3c9:: with SMTP id 192mr302848qkd.330.1585775755813;
 Wed, 01 Apr 2020 14:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200330211430.13064-1-eajames@linux.ibm.com>
 <CACPK8XcSvozg23MzbAoJP85ACnCvc8Hx6sFC7ye8BNR71=L6KQ@mail.gmail.com>
 <699bee76-27fa-c3ec-128e-e58b66505234@linux.ibm.com>
 <4f2afaa3-aee2-8034-7536-7e53418856d0@linux.ibm.com>
In-Reply-To: <4f2afaa3-aee2-8034-7536-7e53418856d0@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Apr 2020 21:15:44 +0000
Message-ID: <CACPK8Xdd42yAL1LEU2OpVLSQc0TUwCrC1-fU=NcwKBRvTY7CUw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4] ARM: dts: Aspeed: Tacoma: Add iio-hwmon
 nodes for IIO devices
To: Eddie James <eajames@linux.ibm.com>
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

On Wed, 1 Apr 2020 at 19:39, Eddie James <eajames@linux.ibm.com> wrote:
>
>
> On 4/1/20 1:57 PM, Eddie James wrote:
> >
> > On 3/30/20 4:36 PM, Joel Stanley wrote:
> >> On Mon, 30 Mar 2020 at 21:14, Eddie James <eajames@linux.ibm.com> wrote:
> >>> Connect the BMP280 and DPS310 to the hwmon subsystem with iio-hwmon
> >>> nodes.
> >> The BMP280 was on pre-production witherspoons. I imagine most of the
> >> ones we're using have dps310. Can we drop the bmp280 support?
> >
> >
> > Yes, sent a new patch for that, so this one can be abandoned.
>
>
> Nevermind... This one is better, because the device is physically there
> on all the Tacomas I've checked. It's also present in the regular old
> Witherspoon devicetree.

Sorry, I don't follow. The machines have both the DPS and the BMP?
