Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 827EA247DF7
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 07:44:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BW0G5656rzDqXB
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 15:43:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f;
 helo=mail-ej1-x62f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=aqAUW0Ro; dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BW0FK0y8WzDqXv
 for <openbmc@lists.ozlabs.org>; Tue, 18 Aug 2020 15:43:16 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id kq25so20582631ejb.3
 for <openbmc@lists.ozlabs.org>; Mon, 17 Aug 2020 22:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=82jvvQ/P1W55bzGMC5L2c0lvtv6mjAzL13TYCTxcPXg=;
 b=aqAUW0RoFRtjfQtOhYPxolAxThK3k4hDHswC4B65rZfhepKIamMu2HHHGKKqPLFPFr
 lx/HKckXZryIru1rMGJS5I1Uaqx8/dlLz0V52Uy2PbTzv76+P+Xz02+bH7/c2PgqRen2
 CmW83+Km9J+053VvN3tc4tjsHk+tariAcTkgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=82jvvQ/P1W55bzGMC5L2c0lvtv6mjAzL13TYCTxcPXg=;
 b=RYrGx9TJYcGObIESJeqrR42DMGAraSG720gpOm0+Nks7K8wjfD6x+afIzogLazR53a
 s4//FP1jD4YNpGjYK5Le+ntMsMTNOwOF2jo7cmQ7oFAE/gxH7ZH5Bfv2A8fagpaEZonI
 6s5haBbz5wOmsc2tQ8aXKuDzPGqMk6V6OOfYWGfsvVkTktTWe6aKYYqZ80/yvTSK7Uu9
 i5UygdzXtLFWYa62w1AIVzhMQYJdPtVckXHCt0Xl5vP2oDZ8brnuEbCzHTDojw5Me/Mp
 DKerHqLyB+3Ww0PW4ZiLfQ7t43MKJK/rHNMnq0jGzyl6QSOyiFCxS9roSAepVVIunIvu
 GThg==
X-Gm-Message-State: AOAM532txylo0Q73nGzmIAq9liQ9epqK/DpdpR6ZJnpOl4XiVRKFon60
 f/dOjZIXn7rP97rJe05dbZyBI2eZtIxDFFTN9YOpme8QQ5r64A==
X-Google-Smtp-Source: ABdhPJzF/YzkbqtL+m6lmv7iorSyqZKg1bqqwivviHiYpKU8TE3A/vMPADzlSzoHvkniuIRKOTHNzwQGYfBSLsGCBy8=
X-Received: by 2002:a17:906:4ec3:: with SMTP id
 i3mr18123192ejv.215.1597729391722; 
 Mon, 17 Aug 2020 22:43:11 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 18 Aug 2020 05:43:00 +0000
Message-ID: <CACPK8XeSyNyRnTJHw_1dSOk13rgQQ0SVY+STLbipeW=wJHw89w@mail.gmail.com>
Subject: Kernel updated to Linux v5.8
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

The openbmc kernel has moved to a 5.8 based tree for Aspeed machines.

    linux-aspeed: Move to Linux 5.8

    This updates the OpenBMC kernel tree to a 5.8 base. It has been two
    weeks since the kernel was last updated, making it the quickest bump in
    OpenBMC history.

    There are 93 out of tree kernel patches carried in the OpenBMC tree.

    The defconfigs were updated to fix selection of video device. An
    upstream reorganisation of the V4L kconfig resulted in a large number of
    extra drivers enabled when all we required was VIDEO_ASPEED.

Nuvoton is lagging as no one has merged the commit to bump to 5.7, so
I have not made one for moving to 5.8.

Please base future patches on the dev-5.8 tree.

Cheers,

Joel
