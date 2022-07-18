Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B69D9577DDA
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 10:48:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmbFx3QfDz3c3w
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 18:48:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c5Iz8fSW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c5Iz8fSW;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmbFY3ZHXz2xKh
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 18:47:44 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id z12-20020a17090a7b8c00b001ef84000b8bso17520405pjc.1
        for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 01:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kmStNi0v48dD0B8szXe/UfAUNr4xFhfZFdwej11zanc=;
        b=c5Iz8fSWA0VowYrUkswNoSuLTrie4R6aH/s0hTOCPTFuA50dzfYmcTmixltxsIDLJf
         5UH1yGkxrGnO5/f0S7GFfnEs37e9R9HfJKkXjP05jVpeQkohKQDMja8wp5LdFo6yxwE3
         3EUI7rFgoq299HjYQz/AiZH7uO4IvWL7oPZ5BJ7D+v1NcrmKN/FuMiMOeS+ngVGvl3/Z
         PhZl+SMC0fCOcft/XkF9cGQDbQLdNY0ImnLPt/2ny8UIb76ZS5V64LbTKCU2W3BNKFVz
         rXIPKsaKshYFik2YNPuUXykakKu1iiLyh0aUhvAoVyE2kuqRUMSi0l38DRmygizfEn2q
         Ccdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=kmStNi0v48dD0B8szXe/UfAUNr4xFhfZFdwej11zanc=;
        b=upxWmKuHqrUDh2ew1trWNm+U5cKc4PM7DL4S2SW44KzzPmvJu3O7hd/OcAGZ+AyEjh
         0WhPQEIqeUybJRiHHhGnpg+yxYRQpIscSE03nZNNEoNHYZ+lY+s1SkiUpFBpY4vB9FrD
         TmhCiL8Q2/8Un3JBnFC5tpcows6E2FhmHdKBilOkY0UTmABuBjZPNfO2oSpMpqxkoQIr
         qY656Z4BdxdvkBEKLXALXKoNLkrIGiKryGjrBhEowafCCbd3/fqS1DjUbGWsQ+EpDloa
         VTompa8coH8L3DZqfvF9h6yixjkWtAXMFkdNKsSqZ1kONIvn+rv0jCdRrqRIEpPulZ+7
         lcZw==
X-Gm-Message-State: AJIora+1EDOUZ7hFtmxjp0b+QuRneVRRwqytmiMpzmolFGO4j0ZBSscZ
	0Hs7RcKfKxLggg7vvUNQ8GkuMKA4o90=
X-Google-Smtp-Source: AGRyM1v6669fwRQsUjwfxC2UgptWMASBhx5rfZT3LNcFUfblktdMpER3Wu9FNSzstVnvvm1yE/KxFw==
X-Received: by 2002:a17:902:ccc9:b0:16b:af81:37c6 with SMTP id z9-20020a170902ccc900b0016baf8137c6mr27201696ple.107.1658134059112;
        Mon, 18 Jul 2022 01:47:39 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id i28-20020a056a00225c00b005289521b656sm8806095pfu.92.2022.07.18.01.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 01:47:38 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 0/5] OTP Fixes
Date: Mon, 18 Jul 2022 18:17:23 +0930
Message-Id: <20220718084728.1140108-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The v0.4.11 Aspeed SDK has reworked the OTP command, which breaks the
current OpenBMC eMMC SPL config by force-enabling the ACRY hardware for
RSA. It also pulls in the software version of the hashing algorithms
into u-boot proper. Both changes increase the code size.

This resolves both of those issues and further reduces the proper binary
size.

The patches are to be applied on top of a rebased version of the tree.
An example is provided here:

 https://github.com/shenki/u-boot/tree/v00.04.11-rebase

This will become the new v2019.04-aspeed-openbmc branch once these
patches are reviewed.

Joel Stanley (5):
  config/openbmc: Enable SHA384
  cmd/otp: Use any MOD_EXP driver
  cmd/otp: Depend on SHA variants
  cmd/otp: Use hashing API
  cmd/otp: Reduce size of otpkey

 cmd/otp.c                                  | 63 +++++++++-------------
 cmd/Kconfig                                |  7 +--
 configs/ast2600_openbmc_spl_emmc_defconfig |  2 +-
 3 files changed, 27 insertions(+), 45 deletions(-)

-- 
2.35.1

