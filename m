Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 829D696B173
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2024 08:21:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzC6q3Jrtz3cfR
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2024 16:21:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c0c:45b4::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725370078;
	cv=none; b=L2LzBhrM6/Rp7lHS9QUWfvf/s4DNNpe/mkKwBH7/RZOcbYtzk9ivNxeAj4yRn7dxiS+ijS+It8S83bGOw4SM0V8Ux+fnQBqPt0MrW+aULlbUpKD+fCpstBUrXW6lure77reeF1n76itY6DqGSstGqE4/54M83tHNkK0ZfnY0XghHSqiDeq4OAtKZTJk6P6VHnobtn5K/zp/vDGi6P1SldVDtBTLEA25PNUzr+pf4WpM9x2EcOUSJ07jJ77DTc1HPZzA+7VVI6KXASKk8uRFbPArRuEjvAL8vgyjphxfSX51TOfZn4PvmGj3yfD+eK1/EP6SLY1hjxsw9nnZmw7eQ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725370078; c=relaxed/relaxed;
	bh=HV2hf1nSATsA3NNJxSWkfgMwLvWvQ3pMvRpwUZxKkXc=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Type; b=HVkqBq9t91zH6CFKncQlzA/+ufE6cfFNOtPEdYLvfmOU7qGjTadrgit9b/dS9p1sM1EDWN5AoPQClU4wrhAhL5O1DxVFwznHFDYPz9E1k+MGtIqG9gV5c1rMx1Tnf/uISDIWPNZyOA5Gdjqv3hnEtNxJTLLNqo1ah77sgEPOlOfUrexHg8MWbujBuZCvgo39YZJhtGqs9bgY4UWxD6IF3A4/LDCAgk1JKjqGBLuFBkphwiZiUF/XX5Qv0VFRErUvZG1J0Y/nwHpkaWG7cWGldxvXeCDIlX77g73gba7JaPqRD+lE0PF4F41KdK9cpRc7YOZzoYZxLJN1S7zu9fG5GA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=diekuehnen.com; dkim=pass (2048-bit key; unprotected) header.d=diekuehnen.com header.i=@diekuehnen.com header.a=rsa-sha256 header.s=dkim header.b=yp1r/26l; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c0c:45b4::3; helo=mail.diekuehnen.com; envelope-from=andreas.kuehn@diekuehnen.com; receiver=lists.ozlabs.org) smtp.mailfrom=diekuehnen.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=diekuehnen.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=diekuehnen.com header.i=@diekuehnen.com header.a=rsa-sha256 header.s=dkim header.b=yp1r/26l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=diekuehnen.com (client-ip=2a01:4f8:c0c:45b4::3; helo=mail.diekuehnen.com; envelope-from=andreas.kuehn@diekuehnen.com; receiver=lists.ozlabs.org)
Received: from mail.diekuehnen.com (mail.diekuehnen.com [IPv6:2a01:4f8:c0c:45b4::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wymdp2ZgLz2xtK
	for <openbmc@lists.ozlabs.org>; Tue,  3 Sep 2024 23:27:57 +1000 (AEST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD2EE7E70D;
	Tue,  3 Sep 2024 15:27:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=diekuehnen.com;
	s=dkim; t=1725370068;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=HV2hf1nSATsA3NNJxSWkfgMwLvWvQ3pMvRpwUZxKkXc=;
	b=yp1r/26lNKqk7dD7+0Bh9E7ZrMQKfgz+bGiBEeBdChNJ567eFsyqrGZq1VTcMhFk4hoGwg
	ZpUBSD0nmRlaGKi+SSeQnVLwBY/d/7R7o67TUMm/KcJlLOT57Imw6g2tXihs+Hp397/Kin
	8WFCA/oHt1CBebwGnNIw9qBQrGMtBJFcYIkOwup+hDeWJa1aSCm+UrSuyB7hTI90ttxHLH
	XCsQsPFsXflPnWPHchXA2uTfQ4ET/WKP4Epez4sMkqNpuOqN1xRXCeJTp9m7TM0AGirIPq
	ouIESRkTIQtc2p6gpjXtn+51mF/8cssoG+wsiI2hOh8DVvcmh7WjR8j8T6KAHA==
From: =?UTF-8?q?Andreas=20K=C3=BChn?= <andreas.kuehn@diekuehnen.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Subject: [PATCH] usb: chipidea: npcm: Fix coding style with clarification of data type
Date: Tue,  3 Sep 2024 15:25:15 +0200
Message-ID: <20240903132535.15554-1-andreas.kuehn@diekuehnen.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Wed, 04 Sep 2024 16:21:02 +1000
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
Cc: =?UTF-8?q?Andreas=20K=C3=BChn?= <andreas.kuehn@diekuehnen.com>, linux-usb@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Fixed coding style issue: unsigned to unsigned int.

Signed-off-by: Andreas Kühn <andreas.kuehn@diekuehnen.com>
---
 drivers/usb/chipidea/ci_hdrc_npcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_npcm.c b/drivers/usb/chipidea/ci_hdrc_npcm.c
index c89c68f41ccc..3e5e05dbda89 100644
--- a/drivers/usb/chipidea/ci_hdrc_npcm.c
+++ b/drivers/usb/chipidea/ci_hdrc_npcm.c
@@ -18,7 +18,7 @@ struct npcm_udc_data {
 	struct ci_hdrc_platform_data pdata;
 };
 
-static int npcm_udc_notify_event(struct ci_hdrc *ci, unsigned event)
+static int npcm_udc_notify_event(struct ci_hdrc *ci, unsigned int event)
 {
 	struct device *dev = ci->dev->parent;
 
-- 
2.43.0

