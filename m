Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44400C21A1
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 15:16:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hjb36737zDqLT
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 23:16:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="K+x5g7kh"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hjYL5Z0MzDqLT
 for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2019 23:14:46 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id q10so5618613pfl.0
 for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2019 06:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tJEDDw3yOxrb71VC5CKbXIkJUsvnUza1w90ltv46DTs=;
 b=K+x5g7khunftljJLZIgmeOIpYH76mPtnLXbqVBZ8KuZUPtvYEvPR5MMwAVAXUvIoB+
 aj0ZxkQ/wNglDyyCC7rsb+rJdZztc0wE0+Ta93IibSp2jERAyN/ubwz6UwedyyXC1vaV
 NAUTqsvmvozN33SaaEtxruvbbbl54D2zsxYsJ/PkhodkeOvz4WdyWR3jEW6oumrmagyX
 Dz0kjYGzDnNHGTei2kZhyCGaVd4bDMFayuPXGgXZvnNPoRHCdUNK0mcHIqWZNhCXS6b/
 Jl/iURDz1vUuzMfqRmLw5hJ+zkDFnAiqdDVY/cyy3kcVhHbFQ7KeF+nOPsARPsal0Ok/
 Dk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=tJEDDw3yOxrb71VC5CKbXIkJUsvnUza1w90ltv46DTs=;
 b=RQnpWueOVwpoDdkCyil1RWqosk9Fdr2OW7ZQ32eM0Piqjb6CvfxVSWijLVeKcEjDOM
 HaSAW2lbFCWZu/dl1WAVcDQ4tmxGxg3INJiG21u2c23rQu3F119zZzaDOJ/d6kFU8AEL
 nzGKVBr1GvDVD6WfyfO7SlHVra63+K3gh0N3JsO4XNJrcfi+/LDG4Fbnsj91sjZ0ibG9
 Osmi0d3cyuOrtxzx8QeMYR8nrmGGDZILgHk2NC8un6SMQ0zHEvf8VDisGwwLBAk9K2VX
 5BtXXiqrVmAsGCk0Wp9kOz2k15N03c5uhPcQjbWQD9W7+uk01mypvuIuyeeONYGWk8Ge
 rAeA==
X-Gm-Message-State: APjAAAX5RBNA6+Pj8ewEKmE7jLmA7GWkau3c3PsZf+juUso1LyyPoHXW
 MPRkcGPMylCCYxCxewArROE=
X-Google-Smtp-Source: APXvYqwNpnOToFvHsZh2/ycIPEob2UFuQ9nps8f4cvU29tuzJvkiFqNGKyqPvjt3syNYDIHPQP+FCA==
X-Received: by 2002:a63:5f09:: with SMTP id t9mr24244532pgb.51.1569849283679; 
 Mon, 30 Sep 2019 06:14:43 -0700 (PDT)
Received: from voyager.lan ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id e14sm12542848pjt.8.2019.09.30.06.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 06:14:43 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: gadget: Quieten gadget config message
Date: Mon, 30 Sep 2019 22:44:34 +0930
Message-Id: <20190930131434.12388-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
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
Cc: openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On a system that often re-configures a USB gadget device the kernel log
is filled with:

  configfs-gadget gadget: high-speed config #1: c

Reduce the verbosity of this print to debug.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/usb/gadget/composite.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 76883ff4f5bb..b49ec81194c6 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -780,9 +780,9 @@ static int set_config(struct usb_composite_dev *cdev,
 		result = 0;
 	}
 
-	INFO(cdev, "%s config #%d: %s\n",
-	     usb_speed_string(gadget->speed),
-	     number, c ? c->label : "unconfigured");
+	DBG(cdev, "%s config #%d: %s\n",
+	    usb_speed_string(gadget->speed),
+	    number, c ? c->label : "unconfigured");
 
 	if (!c)
 		goto done;
-- 
2.23.0

