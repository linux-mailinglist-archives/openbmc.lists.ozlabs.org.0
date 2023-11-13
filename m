Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED8E7E9A6B
	for <lists+openbmc@lfdr.de>; Mon, 13 Nov 2023 11:38:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BPqnwWBW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STQrn1Hq5z3cbB
	for <lists+openbmc@lfdr.de>; Mon, 13 Nov 2023 21:38:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BPqnwWBW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STQr80zYrz2y1l
	for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2023 21:38:15 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1cc3c51f830so30190945ad.1
        for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2023 02:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699871893; x=1700476693; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7icwEtB7jK89kNzAukZaN8SD/d7VobBjcqp8IeCkF/4=;
        b=BPqnwWBWaqi+lpCJ9svFUIa0UDH4CNgMzaXlqaiwrHXQim/pkbHwl3Lx6/K0IclOiR
         ZLFRmyRgX7lZoyi1PaGZXVJ86PFBiRlEk2fh1uVf4a7AxTXuVqPoLqUHUcOX/xAjho/j
         pNUhBeyOraH35XeQqOJX8UgQl/kxgtoULdyYz3CSlRmM/iSlKJWMzON8fAM09uIbbF99
         CGOEyKlGxzkAZ8vVXs2bzuog4LeUW8s6vZ4epq9KC2BMDYMmiCzVs8tBD/QzyqrjqkYl
         xuvCqdlYY8R7TfHIZ3fn37U6+itLOqkV/TPACZTLeejKqCpzmd8VDRhkPQddPa4SuvOc
         +Wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699871893; x=1700476693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7icwEtB7jK89kNzAukZaN8SD/d7VobBjcqp8IeCkF/4=;
        b=ZeyMF5sMcoGibOvROA48CNYkjyOER8kV09YXKAEO0o/FCRm45rQwRfNi7PrZOX2q+1
         V8zpwypSJqb9sfrRaTlB+pfPGN8sETV/R/LErEN/xUdkMd7pkhzcYYvlNK3TNXrXROf5
         qtVornO2+c6sP6udl6wKWXqgNbAUnaHewK3CRpVCAZ9ICZfXdtm6ZNudUqRPT+vaZ4aK
         bZ8oxUtfADgXA61Mdftde7jxfqnon2Q9vXuc9AS2tWfChBI7fuGQOfixetw5FOa8Lsnl
         TL2WCEzjc6bnUmH4gz7amo6FgiG7rZXJd9m1KJzcUsU434hE9nNfsbxtQ4k8K+113SvT
         rM2Q==
X-Gm-Message-State: AOJu0YxhrH1XpOdYyg3tLYdvWoBxRTAkZqI+CZWFV58BOlEBn7ghrwjd
	pwTbRy8kf9NFKrp7i9OAy7c=
X-Google-Smtp-Source: AGHT+IEKBFHR6EG+JMHY1a3JcODzZH4u5JepZ4yWWhSwBttqdjVudbw6e20EDMNopuyW0+2O9Pf4OA==
X-Received: by 2002:a17:902:dac9:b0:1cc:5dd4:7ce5 with SMTP id q9-20020a170902dac900b001cc5dd47ce5mr5671705plx.19.1699871893257;
        Mon, 13 Nov 2023 02:38:13 -0800 (PST)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id bb4-20020a170902bc8400b001c755810f89sm3752593plb.181.2023.11.13.02.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 02:38:12 -0800 (PST)
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
Subject: [PATCH v7 0/1] Compatible with NCT3015Y-R and NCT3018Y-R
Date: Mon, 13 Nov 2023 18:38:06 +0800
Message-Id: <20231113103807.1036978-1-mimi05633@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-rtc@vger.kernel.org, openbmc@lists.ozlabs.org, Mia Lin <mimi05633@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Changes since version 7:
  Fix the part number parameter checking issue.

Changes since version 6:
  Move the part number parameter to struct nct3018y.

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

 drivers/rtc/rtc-nct3018y.c | 52 +++++++++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 6 deletions(-)

-- 
2.25.1

