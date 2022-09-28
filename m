Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 866595ED4EF
	for <lists+openbmc@lfdr.de>; Wed, 28 Sep 2022 08:35:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mcmvv0s6kz3bbl
	for <lists+openbmc@lfdr.de>; Wed, 28 Sep 2022 16:35:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VJcTVV+y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VJcTVV+y;
	dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McmvQ6Chbz2xJM
	for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2022 16:35:12 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id n10so18122822wrw.12
        for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2022 23:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date;
        bh=bTuRribH+xnen3gsTZdqOLbtc3iPq25iXIaWAVkRQjU=;
        b=VJcTVV+yU82SOQhveQfo0G5brgwcHRv6/4rRemWUcB6d/Va6awWTdAbgH2zCn/mRMy
         O+tv9E7VWXdwBuaziZ5PEFH+/PaPemRvHXYhhu16zEsd9ngAOqidwYXPHgw5nCLb2kA+
         N3ZsQDZXlsNFMqSbCpFBKk9H69byhWiQnh2To=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=bTuRribH+xnen3gsTZdqOLbtc3iPq25iXIaWAVkRQjU=;
        b=SVAJ21oxu0bO9dQ8pehVO9jUCpIXHrL38E+HPu9PlzZQfzKs30vLwO23Hy++1FdFcE
         ZCDSnitIloqDJMlHsiH9fYLgcJ8EkSs6N4pODzgS0p1+6CSktVdcFzplwOdSSk271U+H
         crHBiL+/eMUTp4Z3vxFQ36oy4waf3GpI/ZRiU9N7g2cFzxnmWI0J446qYpoO8W0I7d9f
         tIYNDll+LzqpmKsLvnel2GV+dveTP/dKbzdBfCsbCMl5fTbEZMWqWiKP8UmjgJLqbttL
         hEdeTJO16T5afCoM+9h1XeTfJvlaSrXO7Yh3/8p9c0JlkVI61EGY4bz56nRGXjz0A5BH
         etpA==
X-Gm-Message-State: ACrzQf3Lh/NcLYOnOyOBUdSDiLHdgnZQJg/vM0uQi75/ViYbvtffu/Z2
	sTcc469XQnPvBBvzGI0IeATvCA+tvCgUSSD4LlK+S6MgwTE=
X-Google-Smtp-Source: AMsMyM6jBBQD9mxfVRNOUuYZPzIhPtolZdqVCSnkJ1IlqFqWyXUrQKMsotTyxhzZJjzSM4YKd5Z6r4HgvsheHklSips=
X-Received: by 2002:a05:6000:114b:b0:228:ab76:fa00 with SMTP id
 d11-20020a056000114b00b00228ab76fa00mr18725029wrx.628.1664346905342; Tue, 27
 Sep 2022 23:35:05 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Sep 2022 06:34:53 +0000
Message-ID: <CACPK8XdERea0Mt+3o1z2TwbN_NXJ-FDYf8mxUEAWe5Lp7oFRmg@mail.gmail.com>
Subject: Linux kernel updates and v6.0
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hello OpenBMC,

We've been using the v5.15 kernel as a base for almost 11 months. In
that time there's been 16 bumps to pull in stable fixes. We have
merged about 300 patches in that time to support new machines, and new
hardware, including MCTP, nct6775, lm25066, aspeed-adc and aspeed's
spi-nor devices.

It's time to move to a new base to ensure progress is made on our
mission to upstream all of the support. By rebasing on a new kernel
release we can see what work has been done, and what remains. Since
v5.15 we have upstream support for:

 - PECI, thanks to Jae and Iwona
 - MCTP, thanks to Jermey and Matt
 - spi-nor, thanks to C=C3=A9dric
 - nct6775 i2c and lm25066, thanks to Zev
 - ast2600 adc, thanks to Billy
 - ast2600 gfx, thanks to Tommy

and others I have missed.

In addition to the ASPEED changes the Nuvton hackers have been hard at
work. We now have support for their latest generation  Cortex-A35 BMC,
the npcm845 "Arbel" and it's eval board. Likewise the HPE "GXP"
Cortex-A9 ASIC now has upstream support. Congratulations to both teams
for this work.

I have prepared a v6.0 tree that contains backports of the FSI and
Aspeed v6.1 patches, and a small set of existing patches. I will
publish this on Monday, or once v6.0 final has been tagged.

As promised the last time we rebased, the Nuvoton patches that have
not seen any updates since they were merged in 2019 have been dropped.
They are welcome to be resubmitted as long as they are also being
worked on upstream.

Please address any future patches to the dev-6.0 tree.

Cheers,

Joel
