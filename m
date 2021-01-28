Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC72F307442
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 11:59:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRHXh0J0RzDqhn
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 21:59:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bDpuUHvi; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRHQ02TdSzDqDJ
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 21:53:27 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id o7so4060396pgl.1
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 02:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WlId1yJ1zlfciw90J6O7DahoTo7vnHHmOqwv2Lx10ag=;
 b=bDpuUHviOSjBDl1Ft5kOCmB5el5xXZMz/v2bPsIFmjAoW5dD7OuclNqTab2/gjOJkZ
 m9aZc53OpLlBipIfCW7ikj3DsFYXkv/1EOtwnybdldEUGNf3nl2yWtt1dBlVvzfVzhZr
 HpIMB+bc8Q4+sr9jcnliav9klMhipicaKK+BrowRFUKAUO6kMIuXBJrR7+kXEPHnjIas
 vUtSex+Zq23DXOvs9LPoy9KGK1EiHhLMl0eztf1IKq78xn4HPEC1rcQP3zZtfWI2+OtZ
 KKJkLlOtJhOIGftZxZzIhkHdnwpAcHsY3huM43NF/VDDZZcV+zzlZh+v/tYDOIotkflQ
 At3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WlId1yJ1zlfciw90J6O7DahoTo7vnHHmOqwv2Lx10ag=;
 b=XjSBDj/ujo8ug31G1kcF0KVgZvLvdex4UMej77lrMqTJtMzPqHorZ3t2iUWqWdp1DM
 5N951HeuU1xisKHE7qluxGTUziSSZfLYb0T2sTLz7Q+gtTeD4MIRLxQveEAFlTaGDqAb
 rVi2C54FK4yLayMLImyWMuVqjjrL67uYTD2oa2y16SxjJ6WFVuSmS7y8tiK2eyz1mdka
 rhdR9gGyhLSDW+FWYvz8mCyZDMi9UZ9Lm0mfn81wmxct1Jq5ii6LPSrDplF1JCWE3DFP
 LuWtFGaHLBG7ZZdwrCuo1GDWScoWwu1ayDCannZYObgIKnZ1PKZiQ8iEUPEfc465C0Sd
 T6fQ==
X-Gm-Message-State: AOAM532veKbQrV+WcFqeJ8Ft8eNl3ycUXxLxuIYudWFl6kO5lvjW03dT
 Grie0EhPWDtDQ6174abQWIUXy6tAC2E=
X-Google-Smtp-Source: ABdhPJysUg5DhVIgs5+quTF0sacPAupwKI4mWZ+IVbdnQz9pE2OeR4vBpIl/YZ+SMNR8VkSy9p+j2g==
X-Received: by 2002:a62:ee09:0:b029:1c0:ba8c:fcea with SMTP id
 e9-20020a62ee090000b02901c0ba8cfceamr15061286pfi.7.1611831205137; 
 Thu, 28 Jan 2021 02:53:25 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id q197sm5102748pfc.155.2021.01.28.02.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 02:53:23 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 3/7] image: Return an error
 message from fit_config_verify_sig()
Date: Thu, 28 Jan 2021 21:23:00 +1030
Message-Id: <20210128105304.401058-4-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128105304.401058-1-joel@jms.id.au>
References: <20210128105304.401058-1-joel@jms.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Simon Glass <sjg@chromium.org>

This function only returns an error message sometimes. Update it to always
return an error message if one is available. This makes it easier to see
what went wrong.

Signed-off-by: Simon Glass <sjg@chromium.org>
(cherry picked from commit 472f9113dbbbed88345f3d38de3ff37ca163508e)
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 common/image-sig.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/common/image-sig.c b/common/image-sig.c
index 004fbc525b5c..48532b15a31a 100644
--- a/common/image-sig.c
+++ b/common/image-sig.c
@@ -470,13 +470,14 @@ static int fit_config_verify_sig(const void *fit, int conf_noffset,
 		goto error;
 	}
 
-	return verified ? 0 : -EPERM;
+	if (verified)
+		return 0;
 
 error:
 	printf(" error!\n%s for '%s' hash node in '%s' config node\n",
 	       err_msg, fit_get_name(fit, noffset, NULL),
 	       fit_get_name(fit, conf_noffset, NULL));
-	return -1;
+	return -EPERM;
 }
 
 int fit_config_verify_required_sigs(const void *fit, int conf_noffset,
-- 
2.29.2

