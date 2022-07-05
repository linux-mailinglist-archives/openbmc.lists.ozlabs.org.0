Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F7D566799
	for <lists+openbmc@lfdr.de>; Tue,  5 Jul 2022 12:16:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LcdqL0l6gz3bsv
	for <lists+openbmc@lfdr.de>; Tue,  5 Jul 2022 20:15:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RV+CnAUf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RV+CnAUf;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lcdpv1NtTz2ywN
	for <openbmc@lists.ozlabs.org>; Tue,  5 Jul 2022 20:15:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657016135; x=1688552135;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=80UT52teUlq0UkLOZpvKjIETmclXp6E0n/fil5MHPbs=;
  b=RV+CnAUf7omU/qKxq3jBx/mjRNBGITcSyIL07qr1WM6IhXgCVVZKMlfb
   h5/wlp41imMqYPSC+YvLBSP1oJDPfrc0H5ziA7pTsawZyxAc3eeAd/kFi
   l652sR5jxdUH/iF4UcahNIFc2yv2DowvFQNUckpmzsXdURYZXXrDHzfI2
   LP+7m+UBFLEB1EymniJvNPgWxxpTgkM5G5aEZqmxVdr0pFB9GNzeIkRPM
   UhyM9AUaIdd5zEqeJVBtkBaz/V2vm936o2Bxfb+5NLgdJ3THjecrEZMa8
   XRoNwv4LFCJalXO1bYSsnhxIXc23RcMt0LlWryRrZ1psUrrvCFs7O9qGl
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="344994633"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
   d="scan'208";a="344994633"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2022 03:15:30 -0700
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
   d="scan'208";a="650060009"
Received: from aviranz-mobl1.ger.corp.intel.com (HELO localhost) ([10.254.144.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2022 03:15:27 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	Jianglei Nie <niejianglei2021@163.com>
Subject: [PATCH] peci: cpu: Fix use-after-free in adev_release()
Date: Tue,  5 Jul 2022 12:15:01 +0200
Message-Id: <20220705101501.298395-1-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Iwona Winiarska <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When auxiliary_device_add() returns an error, auxiliary_device_uninit()
is called, which causes refcount for device to be decremented and
.release callback will be triggered.

Because adev_release() re-calls auxiliary_device_uninit(), it will cause
use-after-free:
[ 1269.455172] WARNING: CPU: 0 PID: 14267 at lib/refcount.c:28 refcount_warn_saturate+0x110/0x15
[ 1269.464007] refcount_t: underflow; use-after-free.

Reported-by: Jianglei Nie <niejianglei2021@163.com>
Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
---
 drivers/peci/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
index 68eb61c65d34..de4a7b3e5966 100644
--- a/drivers/peci/cpu.c
+++ b/drivers/peci/cpu.c
@@ -188,8 +188,6 @@ static void adev_release(struct device *dev)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 
-	auxiliary_device_uninit(adev);
-
 	kfree(adev->name);
 	kfree(adev);
 }
@@ -234,6 +232,7 @@ static void unregister_adev(void *_adev)
 	struct auxiliary_device *adev = _adev;
 
 	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
 }
 
 static int devm_adev_add(struct device *dev, int idx)
-- 
2.36.1

