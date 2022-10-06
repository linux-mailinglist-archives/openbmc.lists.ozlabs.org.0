Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD375F5E62
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 03:27:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjYh66cmhz30F7
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 12:27:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=SzIGmO4o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=SzIGmO4o;
	dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjYgZ3w5Bz2xVr
	for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2022 12:26:33 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id o20-20020a05600c4fd400b003b4a516c479so126803wmq.1
        for <openbmc@lists.ozlabs.org>; Wed, 05 Oct 2022 18:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date;
        bh=/c0ATp6+U8PWkhdbWMDvfUIhR9P8z+PrFsU1pMgOWVw=;
        b=SzIGmO4oMI0WeepKpMBfkW7F+fy05KSqHjx4tTfoeC8wE8WdibE4XRLvreIcAsdh4N
         9t/aW/io99bHsKXA11rO45Uzfhwvo9psab3psZ0zDdDya0q2tblZ5CkJizfLzU3m48os
         H6CPa0Gb4z6VtPwy55F1lYMYo94QrOdn6Xfwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/c0ATp6+U8PWkhdbWMDvfUIhR9P8z+PrFsU1pMgOWVw=;
        b=b6mdLTTDSPly4b5hZPiYxWgp/OYXmwjLGMJiinUyEfdKn7gjGf2uit2R3MMlypwpli
         uN3fvX8H8wdoegf/S6lpfOQ9DRT7ORKv+83tpfU6+SHpwNCmGaA8+/C8iZSvAl5Mcmz+
         Wx7tOn2BwHZSK8xCzurN/Ahzcv1m1/HHFUhxTnVWonQGZHdyRXZJ1CMaPHsqK6fbZ2K3
         GGsnMMZsjwPXilZwyTPX5ZR5w73czvewkTeJDlb6jMmOpucfOs/rQ0VD6Az2sBgAuB2J
         L09ANToHSS9/4ySoBpKd83/Lg0qvhzIWmkR/0sOkhZsyaW9WcD1U7cgcLDA4E/Vqo0Vi
         r+/Q==
X-Gm-Message-State: ACrzQf1WptuD9wJIH7pkiTKyubJSZAIc+PymDyUr/tZQnGhN7D7bhue3
	Wc6UdDuJHjRR61dP9zPHpMk6kucZdvzzeKEIjz9xOQkKeiM=
X-Google-Smtp-Source: AMsMyM6/tCYUEQjcPOFBT+of9eev4rj1UOoeGi+WunlTFA0M0TAHPzSJoxdqvRtimis/4475DUk8k8t2eKN0yOf6TA8=
X-Received: by 2002:a05:600c:3d0c:b0:3b4:c481:c63b with SMTP id
 bh12-20020a05600c3d0c00b003b4c481c63bmr4820591wmb.147.1665019585960; Wed, 05
 Oct 2022 18:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XdERea0Mt+3o1z2TwbN_NXJ-FDYf8mxUEAWe5Lp7oFRmg@mail.gmail.com>
In-Reply-To: <CACPK8XdERea0Mt+3o1z2TwbN_NXJ-FDYf8mxUEAWe5Lp7oFRmg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Oct 2022 01:26:13 +0000
Message-ID: <CACPK8XfrECvJtwZ8AR1EgsVHpSnkKCVp2LovCXCyFXBpjeBbfQ@mail.gmail.com>
Subject: Re: Linux kernel updates and v6.0
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 28 Sept 2022 at 06:34, Joel Stanley <joel@jms.id.au> wrote:
 for this work.
> I have prepared a v6.0 tree that contains backports of the FSI and
> Aspeed v6.1 patches, and a small set of existing patches. I will
> publish this on Monday, or once v6.0 final has been tagged.

This slipped as we had a public holiday on Monday, and there were a
few yocto issues to sort out before I could get the tree through CI.
I've now pushed dev-6.0 to openbmc/linux.

The +1 party is here:

 https://gerrit.openbmc.org/c/openbmc/openbmc/+/57706

Please join in.

> As promised the last time we rebased, the Nuvoton patches that have
> not seen any updates since they were merged in 2019 have been dropped.
> They are welcome to be resubmitted as long as they are also being
> worked on upstream.

Tomer has been working with me to get the recent Nuvoton work
backported to 6.0. There remains a chunk of work that hasn't been
posted to the upstream lists and therefore isn't in the openbmc tree
yet. I encourage those who maintain systems with a npcm7xx and npcm8xx
to help there.

> Please address any future patches to the dev-6.0 tree.

If you have pending patches then please let me know that you want them
merged to the dev-6.0 branch. Otherwise, rebase and re-send them to
the list.

Cheers,

Joel
