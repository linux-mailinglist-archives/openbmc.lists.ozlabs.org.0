Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FBF4445E2
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 17:29:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hksfy2WRmz2xBq
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 03:29:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jTwAMi97;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=jTwAMi97; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HksfZ5Pmsz2xXx
 for <openbmc@lists.ozlabs.org>; Thu,  4 Nov 2021 03:29:09 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id u11so6354308lfs.1
 for <openbmc@lists.ozlabs.org>; Wed, 03 Nov 2021 09:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=EtF+J9Akr+GYJoO5/PqxPxdP+K5eGCGe3WWwnOalrX0=;
 b=jTwAMi975JSuAAEt6abzUysKYFBqIp7XPW0HzKLENKT1zXuzO7hTIKn/3VtZr63Cr+
 1+bltMO21s+oWJFk4jePRJYAt3wp8agoxMTwbkpGtB85erBonF+OZwcTeFKo2gUG6qFS
 EAMQ9kllg2iK3jxISbSKxGm+x30NSgk1zNkno3ReJu6vxIB6I5VJExVuA9MZWpXIg6PR
 X8ml8Cojf6HN0MAbTFZDz1/e/txryGhh2k18gRnJybPO6175ljYGhyaIRmsa6fseCRtm
 NuF/WyX60+AdrbOW+luhZCj+c2/iUfdTqA8SUIyztWj1qKVNjGxu7zr4XAOlPrYbRSLa
 q3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=EtF+J9Akr+GYJoO5/PqxPxdP+K5eGCGe3WWwnOalrX0=;
 b=aASFRosAkfa+mFNXUyn6roYLoRnSTfIsEVjsVeKsumR2a7kZAiqQjSSdQ4ZIdgo3aL
 HIWCOk/JjvHSU5FSLOP1DPLc1Yz3U9OAKsCIS23p/iy2wlKO8JvxKq/qs3fT08ZuvOxA
 rxod3+WtWr7MK/7b1/n81HKF3xasnsFmrZ39mtH5gV/MO5vM0M8rtGdm0GO+GmLyCsSu
 22RzrSneEVUxW0V8/GtmT7QtDaYNEqyGxghGfu18/JVMabGFUZJt0tDf1AbQhFdR1h6B
 zpAK9ArDAO7VzRfg1tESIDA05p+gULDHh5mP1P10qSCD6XsF4rIiBxQOEWZcSAIyt8Ua
 htIw==
X-Gm-Message-State: AOAM531GobJSIauODcll/TSdFdFChCQ3hn1/9eTU3Y0Zm+c+myag1yUT
 KhlKLSA7l42BZusFKNBRqAqOuwhMi+BSHtGilduzJGhVgtTw9w==
X-Google-Smtp-Source: ABdhPJwz1AiVHB8ngeHkfEsm9cDsxbd5dQDyb0Xoo2Sky2ozH66VOBhN26AU7vochUxyPYpJl3GYoaL7TEVk27pSyZY=
X-Received: by 2002:a19:740a:: with SMTP id v10mr2611865lfe.179.1635956944876; 
 Wed, 03 Nov 2021 09:29:04 -0700 (PDT)
MIME-Version: 1.0
From: Oskar Senft <osk@google.com>
Date: Wed, 3 Nov 2021 12:28:49 -0400
Message-ID: <CABoTLcQHOcfvHkCGX0nMUxFzmTcceuBhL3CQERn66CT8UsSvwQ@mail.gmail.com>
Subject: Cherry-picking 5.16 commits into OpenBMC Linux?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
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

Hi Joel

There are a few commit that I sent upstream that have been accepted by
the maintainers (i.e. have the appropriate "Reviewed-by" tags) that
are waiting for 5.16 to open.

I'm waiting for these patches to be available to be able to send a new
meta-tyan directory to OpenBMC for review.

Would it be possible to cherry-pick these commits into the OpenBMC
Linux tree to speed up this process? Or is this something you
generally prefer to not do?

Specific patches:
https://lore.kernel.org/lkml/20211020164213.174597-1-osk@google.com/t/#m8f7ac85809049fadcabf6e0bed1ebab12e71f094
https://lore.kernel.org/linux-arm-kernel/20210909004920.1634322-1-osk@google.com/

There will also be an update to the DTS from the second patch once the
driver change from the first patch has fully landed. Or should I
better send that DTS change now and we'll take it into OpenBMC Linux
together?

Thanks
Oskar.
