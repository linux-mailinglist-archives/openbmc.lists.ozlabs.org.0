Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DCF77D7A4
	for <lists+openbmc@lfdr.de>; Wed, 16 Aug 2023 03:26:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=W2BVuarH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQVpf2WT7z3cP7
	for <lists+openbmc@lfdr.de>; Wed, 16 Aug 2023 11:26:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=W2BVuarH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQVp21mbSz2ys2
	for <openbmc@lists.ozlabs.org>; Wed, 16 Aug 2023 11:26:00 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-56546b45f30so4642239a12.3
        for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2023 18:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692149156; x=1692753956;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eS73907VIaCeI53gzLLDOXrTmdR8uzZ1TgnhrmdjAfE=;
        b=W2BVuarHi+6pbrQsl6hiKrxEXM9fXIA6Su8DOcpzFEbDu4//L9sLF6EgJaZhkvnUev
         N+6t2NTVAFl4kSpxLw1uez5Hr9nAKkejmVBfrO9jWHRUGfWjoY/MKlNxovAqpdnq3q+F
         Ol7+C2hR62tDDpgSDlO8yl9qHCUUEBBrVG5BkoP3jgS6hXSIOzRgzsThrOwRSzfSSr4m
         H5i1bOOFKxV6J5Hkbz5Rz5FSTmBGa8uqXf6OdKg/L35iBDzSz4D2iMajGiyz5b1/I+TV
         55Eh8VMUCMAHp2oRIyjIwcYbU5JwLH/Xa13gWByWSA171lnThMuEJQIsSN085rlWkHYb
         uVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692149156; x=1692753956;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eS73907VIaCeI53gzLLDOXrTmdR8uzZ1TgnhrmdjAfE=;
        b=DBmWkDHIcqXrggDlotZT+dqevHKBTMjxoCcSqSFexOgvikctBS4qK6ryDauOEtbtqK
         BBF5zWUxyO/OVM2OeGhlDYABhZSNlKszQL1jQOe7wWiIF9+2BBeSGgOx0iTtDf+MihHa
         4KiiQSQt5plE3PPnF6W92Dd3+s82m6aDXUSbUoKHxj2N99u/voYD6+oPBa51N0ry4HRl
         y8LASSbnJGFk9bAV41FRdU5FPZaNUaecVrga8kSmUi4JFcIOOS5UkTunbNGAm6pACGsx
         HrSUdr5SSKmDnWcej/xpHdC/L1uVMhD1YJc9PEO3MZSe7a7SmOXYlbZTNYr0OmQhvsaA
         wCpg==
X-Gm-Message-State: AOJu0Yw7ZbM87kF47zS5K8JjEc6g1+B93zZj4nBnxKZ/ON4WH4qi+OUD
	ztSLCwaqhVOo+ZEWoBp0hQo=
X-Google-Smtp-Source: AGHT+IHKxroaeDsPMZSPoBDxdrhVDk2WoFodBQQXZmJfm7VKR0XuLLTGvJIobdyYW/H8EJzlkqDyDQ==
X-Received: by 2002:a05:6a20:42a6:b0:135:110c:c6de with SMTP id o38-20020a056a2042a600b00135110cc6demr769678pzj.6.1692149155478;
        Tue, 15 Aug 2023 18:25:55 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79251000000b0064d47cd116esm9895468pfp.161.2023.08.15.18.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 18:25:54 -0700 (PDT)
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
	mylin1@nuvoton.com
Subject: [PATCH v4 0/1] Compatible with NCT3015Y-R and NCT3018Y-R
Date: Wed, 16 Aug 2023 09:25:39 +0800
Message-Id: <20230816012540.18464-1-mimi05633@gmail.com>
X-Mailer: git-send-email 2.17.1
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

Changes since version 4:
  Add an introduction bewteen NCT3015Y-R and NCT3018Y-R.
  Restore the initial value of err in nct3018y_rtc_set_time().
  Refine error messages to pinpoint the correct location.

Changes since version 3:
  Remove the comparison between DT compatible and chip data.

Changes since version 2:
  Add DT compatible to check the chip matches or not.

Changes since version 1:
  rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R

Mia Lin (1):
  rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R

 drivers/rtc/rtc-nct3018y.c | 122 +++++++++++++++++++++++++------------
 1 file changed, 83 insertions(+), 39 deletions(-)

-- 
2.17.1

