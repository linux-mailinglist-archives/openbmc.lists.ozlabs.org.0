Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B413871035
	for <lists+openbmc@lfdr.de>; Mon,  4 Mar 2024 23:42:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=moEoK3t7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpYcK6bhsz3bwR
	for <lists+openbmc@lfdr.de>; Tue,  5 Mar 2024 09:42:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=moEoK3t7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=prosunofficial@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tnjkj07tXz3btQ
	for <openbmc@lists.ozlabs.org>; Mon,  4 Mar 2024 00:45:15 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dc13fb0133so26865675ad.3
        for <openbmc@lists.ozlabs.org>; Sun, 03 Mar 2024 05:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709473509; x=1710078309; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f+XvaSacvZv2FwpCKQI/VZDC6hmI2YHWeRkctoTLloI=;
        b=moEoK3t7KQ0CZ12zv67wRMrxL/rikvabD8PD+a+aa4JypvCimmUS39DxeEYvsELts0
         DFufm6ICWJDDRNz1M5/1PT+0xehWcjijMjX2vYVM8YTVzDCO6GxgbafU6eKnIZiaaoyz
         y3zfPypgEJ7dH6ub+kYwiELrTbQwvDdY94WHadynW+EZlPURCMv3HLCj9rORpWv0m++D
         AKWHl0or37iScPTEr31URau4aMfL3woZMBnPtTJFGlzqzyduD1aBjIiRHNRt933I1pKD
         QdzazsxmBUMID70DEhjZdFWI+lKh8c/kLdMtbgjQ3XluEuH/dR1VpO4xCyMrRJkFqyTO
         Sdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709473509; x=1710078309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+XvaSacvZv2FwpCKQI/VZDC6hmI2YHWeRkctoTLloI=;
        b=lQUNdW+wkpQCfYTcZlO7pLKZB29Lht4EQrHca8eW6EqGlemwrnb/Nv3rEaSvgcDUEW
         DszmQ7h7wQ2GnbZLgfCEbRmi5Y29WH2etynozepw3WJ14b3ZgRNDtilr/S52lYDS8DXK
         lPl7G1dpCklDg5+GL4fem47KAQtARYNtv5ZvyQGDmZIKuSUB++mgPqiRaAgyGk7Pgxo0
         AB1srSS9W9q/mVAHaU43OjiAVKToi2CAIyLkokqNRBadh9IxJgpFFTQFoKzfJ4M3us1k
         WagIrrOsjUg5Qp8DWsrRqtoQHEN0FRR75HYsYdDakLNu4wSvCxUhMmhQOdKDHARFJdZh
         BnOA==
X-Gm-Message-State: AOJu0Yx81Ofl8c9Gse8Ou8rDddvG9cZvFhdzXtopasqjA7ETI205Cqal
	4ZDCuNuCQ0Jd0ZsuTrdDVdDQQ2MwYGIk+fPcTR/7YtCuA6C5ntlSJprjzn00
X-Google-Smtp-Source: AGHT+IHp0+kCn7euvS782F+lC0zGNSOjCiP4/N9VFfmkptpZU9eXdpG/ngz60LloISbZgst1lD4Q5g==
X-Received: by 2002:a17:903:22cb:b0:1db:c6ff:664a with SMTP id y11-20020a17090322cb00b001dbc6ff664amr6965221plg.53.1709473508876;
        Sun, 03 Mar 2024 05:45:08 -0800 (PST)
Received: from kernel.. ([2402:e280:214c:86:98b4:6d91:d5f4:8f27])
        by smtp.gmail.com with ESMTPSA id c9-20020a170902d48900b001db37fd26bcsm6658041plg.116.2024.03.03.05.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 05:45:08 -0800 (PST)
From: R SUNDAR <prosunofficial@gmail.com>
To: openbmc@lists.ozlabs.org,
	iwona.winiarska@intel.com
Subject: [PATCH] Removed controller field description to prevent kernel-doc warnings
Date: Sun,  3 Mar 2024 19:14:53 +0530
Message-Id: <20240303134453.5791-1-prosunofficial@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Mar 2024 09:42:14 +1100
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
Cc: R SUNDAR <prosunofficial@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

./include/linux/peci.h:84: warning: Excess struct member 'controller' description in 'peci_device'

Signed-off-by: R SUNDAR <prosunofficial@gmail.com>
---
 include/linux/peci.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/peci.h b/include/linux/peci.h
index 9b3d36aff431..90e241458ef6 100644
--- a/include/linux/peci.h
+++ b/include/linux/peci.h
@@ -58,7 +58,6 @@ static inline struct peci_controller *to_peci_controller(void *d)
 /**
  * struct peci_device - PECI device
  * @dev: device object to register PECI device to the device model
- * @controller: manages the bus segment hosting this PECI device
  * @info: PECI device characteristics
  * @info.family: device family
  * @info.model: device model
-- 
2.34.1

