Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B97AD79DDAD
	for <lists+openbmc@lfdr.de>; Wed, 13 Sep 2023 03:38:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DBZ3wHQs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rljl102Qnz3c5d
	for <lists+openbmc@lfdr.de>; Wed, 13 Sep 2023 11:38:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DBZ3wHQs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RljkN1tt6z3cPK
	for <openbmc@lists.ozlabs.org>; Wed, 13 Sep 2023 11:37:31 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-68fba57030fso2739235b3a.3
        for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2023 18:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694569046; x=1695173846; darn=lists.ozlabs.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fh2Jx+3S+9JoD1fd1NoMZMT1+EHOY1WNMnptmQPxXtE=;
        b=DBZ3wHQs1XyfuCCG9hgM8kA9DLiX1kObt7lPk4+tKD1CkmtFt90KwR51LNBT5QapNf
         hYKBRFvDSHeKJEPPerZM4Og9vYKCUwrh+XyNPQ3TAajzpcLD5zYYRfiBDXh4AMMN87vi
         0ukQeJy2YH1+uQRsYfnLYaLDnemAwc8jzHlgkf/LhbOKLbaDE8neD44QxBI58aeXnogi
         7gvp4+ZX7vpoRvc7V5iZHCfK/ynp5FjY1PWYgQUVRJZsYblYO0ZGawluORVy5xpgwPKM
         BKK94mUCE9D5U2RSsSk9JUtfvV0Vr9xYOlwJY4o/0dUHfHqKpwB+6oQeSjRBNutqNCtW
         YMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694569046; x=1695173846;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fh2Jx+3S+9JoD1fd1NoMZMT1+EHOY1WNMnptmQPxXtE=;
        b=WTEgiC/Pe2HkDdkSrbi9OzAbGvPTzfP7F26Lq4IfBHSG9lUsAB1AsTW463RQ8at14j
         9Qu+Q+hFTguwrR97L+Ff2a3ZXdsarzHutF8zfCWdS6qKvfV+mSWTNbAG9b9knDwL2jae
         8Ng1weCi48gqmgnNBvxar15SFFvR9EKDmkgejWqJIOxXAzmZ//r+pwtgRcj84YEDNVEE
         a20VMkrNd/8DkUqLPS39kUUS6aCd2NR+8dUU4Qn13yd3cxAd6+gxrQilh5YaEUy2asDY
         UHWpBnOT4ExUHmUrJJGyaOw7D962HhTW3TT5i10iaYCY+b3BeZLSWHGZChwuN/1x0Sll
         ROfQ==
X-Gm-Message-State: AOJu0YzAdKmHgAtzmexbQ8C4Cg3zhMdFWrDRqyVqW9VoXtSEsWnjUY5y
	VhOkt99KrUbr6+JvPan/vEQ=
X-Google-Smtp-Source: AGHT+IH8zbLKTSdUX5D73pqq4SUlqTUyb6QdU05sKLMXfE9pkui4MoWrEShh92TtebO7wHppGkimLw==
X-Received: by 2002:a05:6a00:1584:b0:68f:efc2:ba46 with SMTP id u4-20020a056a00158400b0068fefc2ba46mr1516597pfk.25.1694569046160;
        Tue, 12 Sep 2023 18:37:26 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id l20-20020a62be14000000b0068a0c403636sm7874648pff.192.2023.09.12.18.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 18:37:25 -0700 (PDT)
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
Subject: [PATCH v6 0/1] Compatible with NCT3015Y-R and NCT3018Y-R
Date: Wed, 13 Sep 2023 09:37:18 +0800
Message-Id: <20230913013719.8342-1-mimi05633@gmail.com>
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
2.17.1

