Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7A475938F
	for <lists+openbmc@lfdr.de>; Wed, 19 Jul 2023 12:58:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=V5IYMM/o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5Xqn2NCvz30Q3
	for <lists+openbmc@lfdr.de>; Wed, 19 Jul 2023 20:58:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=V5IYMM/o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4sws5SPnz2ytn
	for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2023 18:45:48 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-55ae2075990so3099759a12.0
        for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2023 01:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689669945; x=1692261945;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOBZtI7zq0pDtpmxxDapiR29tdvAo47dh+89oqAxAxQ=;
        b=V5IYMM/obyIyZDLEfNJ4gS5+PFG8QYImnOJmdsGv2seP2gnYvIZMKKFbx0pvFDmvrb
         nQPUZx4QQanAmaCvQ38Hza+zq10dqz/jIaObvsSFSwCnFcnHOXE5MoZL5mKCiusatjqQ
         tv0JblYQdbbFJCiTaC/R3qOyUblkgCJAXumm2uki+ecKkx33cyCVBsak/KJ4VUhfQ6wR
         RMZtWVj69KvaTEk7/wE6n8nD/MG4UAiTJAjPoUcTpXo/0YwxipnZ/ibXrxu3ly1ndd3O
         CA3Sqx0ti2AKtOvh5wWU/XniWusUVMBHFsYt/O71ifGrrk0LLEAsgrVoarA750ZVGhkh
         i22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689669945; x=1692261945;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOBZtI7zq0pDtpmxxDapiR29tdvAo47dh+89oqAxAxQ=;
        b=JWRpfnKaupZNcJvL56kYqYaI6E3EUCvrOM6lUYKOxA1SHCZfmgN00AUhq/6QkViOTU
         5cLYB4OC3uih4vteAhZQCkBjxgELzP3sAbegR+hfmEN+zeIMCdKH24AsNpUyHYjPxdgE
         jkLlQmk5O1xxT84moNkPg+4uXfYVwygOddSXyl24/6m5Ka/yuXdZHvOGuAZybMjFTHze
         kCUIPMaVJAv/yq4YmI8fE98Sn0BhOXo0Nbj/wpS65u7N3bHE3HMYDaa+YjhwFacyw/vc
         RYj10+uZXD95219ZyPf2XQmowhotUfZBqsS6SljBL6Cb1LsmWJBF724+B9vpbymLGtP1
         QLxg==
X-Gm-Message-State: ABy/qLYjw5c4C/+PDORkWLpKZzEyI05RXRRPcldX/LDTcfFJ+OqSnUu5
	dUTI1aRIXPy5z8whjkBm+oI=
X-Google-Smtp-Source: APBJJlGHrx/jx4rz6Syig56z0O+zwfso+AI83xdK2D9AOf/V6WZTAKb+JoXX1naJ15Hh6roXqD7y5A==
X-Received: by 2002:a17:902:7201:b0:1b3:d4ae:7e21 with SMTP id ba1-20020a170902720100b001b3d4ae7e21mr11523786plb.63.1689669945333;
        Tue, 18 Jul 2023 01:45:45 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902d3cd00b001b9fef7f454sm1291516plb.73.2023.07.18.01.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 01:45:45 -0700 (PDT)
From: Mia Lin <mimi05633@gmail.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	KFLIN@nuvoton.com,
	YHYANG2@nuvoton.com,
	mylin1@nuvoton.com
Subject: [PATCH 0/1] RTC: nuvoton: Modify the setting timing of write ownership
Date: Tue, 18 Jul 2023 16:45:34 +0800
Message-Id: <20230718084535.11081-1-mimi05633@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 19 Jul 2023 20:56:29 +1000
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
Cc: linux-rtc@vger.kernel.org, openbmc@lists.ozlabs.org, Mia Lin <mimi05633@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

- Change the write ownership to default.
- Set the TWO bit to gain write ownership for BMC before it updates time.
- Restore the TWO bit after BMC updates the time.
- Set 24-Hour Format.

Mia Lin (1):
  RTC: nuvoton: Modify the setting timing of write ownership

 drivers/rtc/rtc-nct3018y.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

-- 
2.17.1

