Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5702516A74
	for <lists+openbmc@lfdr.de>; Mon,  2 May 2022 07:55:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsC3l4w1sz3bXG
	for <lists+openbmc@lfdr.de>; Mon,  2 May 2022 15:54:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=NTvsw5I/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f34;
 helo=mail-qv1-xf34.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=NTvsw5I/; dkim-atps=neutral
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsC3K4NfBz2yQ9
 for <openbmc@lists.ozlabs.org>; Mon,  2 May 2022 15:54:35 +1000 (AEST)
Received: by mail-qv1-xf34.google.com with SMTP id js10so9704466qvb.0
 for <openbmc@lists.ozlabs.org>; Sun, 01 May 2022 22:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=SyqcxDwrdlYSA3rzbOoar7qg4Lij/EPAnXqAMJOZqt4=;
 b=NTvsw5I/mTayJhw8XFcfdwWB9Gurfv5fA8eQt3WD37fQa8CwNTEmZyslZGjTFzSYEt
 uk+7rnIAIVGOJ3mUgEQjNfIAJOLMAZZNNktwMaG9hWLU7Iu/hPPZm7o+P+vF5e9BW+iQ
 ZGdOwMI3HHWJpsEtVod/FMeZfy8aKykp1Gj8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=SyqcxDwrdlYSA3rzbOoar7qg4Lij/EPAnXqAMJOZqt4=;
 b=S5CIWSmNtZ91pjIGNYJB6zFHFPtb8UUbfeyCseLs5IHaIG10Gd/4ELhtayrEbz8pgB
 HNaLCZKgkKt2x06B+G3WRTq4x2VpLdpVYnjDAblE3x/YT8Mtc6VDu+RkqwO9O8++L+Tt
 UuTz7nUlVx5AtvHJLgNAk9rw9CT4v97hMbv6g07wyy/3jvqDgHDyEiCnrXKtLn7wnFFJ
 kBLDdP4KSGQX6Fy9XzDZBWiSzlPdIPjhdaGgYqP3zKIFE81ypxo9Wpv42qu27WBRParo
 t1Pm7pCLSqiF4/dwX3yKZqOxSu01sZBehpS6dqu0kpebs4IO+oG/Wd9UVs2ABMxr5Tm0
 zExg==
X-Gm-Message-State: AOAM531mptNCzTjeQFm+tL0O0qgim7TU19nYYlfk2lSQ9+4kcHAaB2qY
 kuvpTS0X2QYKJJFlNRVcCl7j6CnjQHuwKpY0tdv0mO4quYU=
X-Google-Smtp-Source: ABdhPJwVPP6wZ0RCNFEcDpLS9wOPS7T9O/nJq4sjcgrNZOoRU9TJbWCe6pS08LwP+6jb0vFAukFHG7zmEvRZiW5imDk=
X-Received: by 2002:a05:6214:202b:b0:458:10af:3f59 with SMTP id
 11-20020a056214202b00b0045810af3f59mr8399583qvf.57.1651470871463; Sun, 01 May
 2022 22:54:31 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 2 May 2022 05:54:20 +0000
Message-ID: <CACPK8XdtoHQj8z0wM2+xAYNfsH62UHdO4qLJWSJF8-WXRb1r1g@mail.gmail.com>
Subject: Bitbake recipes requiring configuration
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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

Hi Brad,

I'm after some general direction for bitbake recipes that require a
machine to provide configuration or script. eg:

SRC_URI += "file://whiz-bang.sh"

whiz-app/
  whiz-app.bb
  amachine/whiz-bang.sh
  theothermachine/whiz-bang.sh

If my layer supports three machines: amachine, theothermachine, and
bestmachine, bitbake will emit a warning for bestmachine, because
there's no whiz-bang.sh specified.

We could change the SRC_URI to be conditional on :append:<machine>, or
provide an whiz-bang.sh next to the .bb. Or another option I haven't
thought of.

Is there a (better) pattern we should be following here?

For a concrete case, I have put this change up for review:

  https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/53432

There are several apps in meta-ibm that currently warn depending on
the machine you're targeting, so would benefit from cleaning this up.

Cheers,

Joel
