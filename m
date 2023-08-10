Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E388777797C
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 15:22:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=iCv6B/VP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RM6zD62hRz3bh5
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 23:22:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=iCv6B/VP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=yulei.sh@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RM6yf2qypz2xBF
	for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2023 23:21:44 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2681223aaacso664021a91.0
        for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2023 06:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691673700; x=1692278500;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E3PiUwH0twxv7j7x0aq3jqIJ8yz2/JeNtawTmWjVsvU=;
        b=iCv6B/VPlRmpowJQTJ4oFw/mg+PvBUhgGaI1fIE4CZcinJkWss/poVW41KdVFjquKo
         BzuwZDqcTrcIpUoUHsAgbKernStFF/LLFqXHTQeV0fDGONK7SwGTuehJr4Agcrtxf5P9
         wD2UoTcSpbmEqCtGy2KGm0igGh4oaRaCS8J1NZsQmblxmYt0LNtGWihPKFYODr0pJgt7
         MeY/rZuBgJmWdI1FGV8SPv7+lj1JATC478VXNbiPX1gjVy3DamWdFAWMpvzXNRXoPVuO
         lWN6tgrL4sbdfzR22h+9DS3s5AtyJZcUwBZAJRTX1AwjwjbyJruInAl7L5GEujGt4uL9
         mFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691673700; x=1692278500;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E3PiUwH0twxv7j7x0aq3jqIJ8yz2/JeNtawTmWjVsvU=;
        b=iBBDw24b7F4yj+L6IvVq10CHXMSR5bwx5msQF07otWxMIlDkOTLhV9xv2DDJZTpWwS
         xpCTgijumpAusoI5YX/j+48+eS8/kbA9XaUQy0iqWlIBKCCbvjwu2RboBji3dVRsupES
         rvxkKEkdKc+VPi3H1JqPyyro9sfg/GmFbbNPsORMsHKFbmNbcJjHFF9CDMWoB9RPU/JI
         ewwEzYQhV1Sj57dYKQwuA9tpWBNuI4DUMlwGQDGoyOSc+tJTuRKN7o5DzETo7JQKoSkJ
         0ztDRXB2Yw4StH/3CyyhkLA+AzntOAnbKtVhynRQs22e/oqPiazyAeU6Y+ZYcteqp/ip
         xReQ==
X-Gm-Message-State: AOJu0YxsEyI7o+wBIgC26YyOORN9V7ycGfkFaBuQslM/BG98qdipWFNJ
	3ArrPU3tXKGrMZPAefw7XEl+3ekBy8FJ9WDSgwuyEq5CnI66j49vAbs=
X-Google-Smtp-Source: AGHT+IE1BIwYB/MMU52RzHZ7qTtgTCyrXfDj7IOth2+WFFf78b876wUNUrdFzTme9SSr1Is8FvKPWP4HuDDS2I57Glg=
X-Received: by 2002:a17:90a:3808:b0:268:307a:c3cd with SMTP id
 w8-20020a17090a380800b00268307ac3cdmr2772947pjb.21.1691673699675; Thu, 10 Aug
 2023 06:21:39 -0700 (PDT)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 10 Aug 2023 21:21:32 +0800
Message-ID: <CAGm54UHmqkwceEwUg8nkrAyNwpN2m7rEDmSm701nNVeURVdM6A@mail.gmail.com>
Subject: Proposal of moving "StaticNTPServers" to time interface.
To: openbmc <openbmc@lists.ozlabs.org>
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

This email proposes to move `StaticNTPServers` from
`EthernetInterface` to  `Time.Synchronization` interface, which makes
it a static setting to BMC instead of the network interfaces and makes
it easier for bmcweb/phosphor-network to handle this setting changes.

For details, refer to https://gerrit.openbmc.org/c/openbmc/docs/+/65819
Feel free to add comments in the above gerrit.

-- 
BRs,
Lei YU
