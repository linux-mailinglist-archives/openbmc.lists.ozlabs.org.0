Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A908792071
	for <lists+openbmc@lfdr.de>; Tue,  5 Sep 2023 08:04:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Ad7ttvlG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rfw210lVgz3btp
	for <lists+openbmc@lfdr.de>; Tue,  5 Sep 2023 16:04:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Ad7ttvlG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rfw1Q3MJHz2yPG
	for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2023 16:03:52 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68bed2c786eso1228841b3a.0
        for <openbmc@lists.ozlabs.org>; Mon, 04 Sep 2023 23:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693893830; x=1694498630; darn=lists.ozlabs.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KiBuOJI+CBSIVZXrdUCIwxPgk0hrH9gjlhPqB1GT98I=;
        b=Ad7ttvlGDigmuDsWFGYhW3T3lAsGlg2XzOjKz1nrShWV5I0WoLMoKtLAB85nSX5eA2
         Kh1Z2IJC5b9Wy5zhfB0x4cOISx4M/Cx/uL7HbOsI4lUWXOK8j2wc9ivVJOy3bQ1ueDGB
         oYsrWhJNFHU5iHA3cmx5pqwyB3fRm/5LfPKFUIfwtcSHSvMPLytxTX9MOljf3EmVfFJj
         SOOPRHQMjbnAYzcIorNA2XzKUcJerNmavV0HCP7DB6iK8jG0acd5l4pE5hR/cRgkG8dj
         ROjKZBnbyh9SdNo5ECgR1Uz2Rceb7T6kGBALXnhrGxyO5t9hhFxJbUHOLKjD2Or0VV0S
         XpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693893830; x=1694498630;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KiBuOJI+CBSIVZXrdUCIwxPgk0hrH9gjlhPqB1GT98I=;
        b=NJBGTZhy93AU56dvcwNf+vg0qY93eRcWshYeau10gBaxCRpNNaPaveIUNKgjdeUy6u
         8ZxEtpZmtg7EVkAb9nXwpVAY94/4wXngL6GUNfDADExJIQdClwk48QYDqH/ECEXXfhQ1
         2h3ACf8n/zkWkNzdbJvDXgjhSjm3NkqJv/yqd+OpwYnAeM4U24AheWoR/gaj9lFuMhPl
         vMXZYVmEtJdEMAfLMZ7xL8MdPKUoh8mdCvW8tRAnt8DlJKoblVQW+5ZRnSuhHRE7Tzh4
         F1FZspjZclCLT9xx5oQWCFZlbMqHR+qUVhx0x61p088i8j4yfGcNx70ZXJIre/Z7vnBP
         V4EA==
X-Gm-Message-State: AOJu0Yw342XIsT1lqUlKms1OG5B4W16nD/LoYn0nSJAoEFwJKkXck4eg
	rl1kRtNkDZcwOW2bhV5KMGw=
X-Google-Smtp-Source: AGHT+IFP8zd0itczP3+4VNTwpFdK3waU0XTslf+VWq3OTW1dVfoSL3qvPmwgTG6xNUFXXfIY9L0Usw==
X-Received: by 2002:a05:6a20:8f17:b0:133:e3e3:dc07 with SMTP id b23-20020a056a208f1700b00133e3e3dc07mr12560721pzk.49.1693893830108;
        Mon, 04 Sep 2023 23:03:50 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id t18-20020a170902d21200b001bf6ea340b3sm8482921ply.116.2023.09.04.23.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 23:03:49 -0700 (PDT)
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
Subject: [PATCH v5 0/1] Compatible with NCT3015Y-R and NCT3018Y-R
Date: Tue,  5 Sep 2023 14:03:40 +0800
Message-Id: <20230905060341.5632-1-mimi05633@gmail.com>
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

Changes since version 5:
  Add global parameter to store part number.
  Remove unnecessary changes for easier reading.

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

 drivers/rtc/rtc-nct3018y.c | 87 ++++++++++++++++++++++++++++----------
 1 file changed, 64 insertions(+), 23 deletions(-)

-- 
2.17.1

