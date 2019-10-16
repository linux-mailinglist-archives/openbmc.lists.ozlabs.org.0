Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEB2D8614
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 04:53:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tH1c32S6zDqTg
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 13:53:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="T0cFOM82"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tGyv49NLzDqnR
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 13:51:35 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id i76so13357381pgc.0
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 19:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WhdZpXeQcpcBgfhgEnNdngbfc4NZ6mvRaZNYyOjJ9n4=;
 b=T0cFOM826CMb+iQtMHoI1dIYQkyKI6SCsjtnaO4kxD/2EyU1eLnVxB+kxJymA5zQmR
 tPJ5bWnMV/mSg7AicVlENrFLDsQmrAae0Gjij946oapIjhGH2leh2iCbpNNxMuTuis86
 ud/4Vo0W6/Zg3BZ/RmgeyHFCjQLIV+GoiEyLfCF3JH/Qt9q+5potswQYGSXmrxXzvnxm
 On1UeI0AastQZId7qD+4Uy/WES8Oy0l6SCJEfhU6JjS2QIqp9/YXjc91uSN8zvWx7PNg
 lhmyJkE5zPsdoizTJSBxtNddwUXAE9e33fPdoSvyFWDRiSMy6F9vLviioeD4Hes2AT29
 velg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WhdZpXeQcpcBgfhgEnNdngbfc4NZ6mvRaZNYyOjJ9n4=;
 b=dbQ4LVr8Zmnz8vkMYM3WrkTnoqf4IWerV3kyLtIevMa4R9FbiCZ77rnGPuU2A4KRUL
 M2SJrouliWv7NckOlmy9NGPuV4vz0U0sFO6WJEzepnMKFBgIzL+HYV03cKTe9+PsDaAk
 4hE1ovEMzdIXwUflB7uWeSEC8a3j3poMCzbVocuCQYpRdna9aK/+FNmQYYbIQiBkRVNi
 CyXDniI+Rb6rOG0F03cUFSAXjFdpdJ9ujSHBbLspmhx6Va86siEny0kFa8mFCcz4QmEo
 JmaCUK2w/pHVm0sDo0n11Fz+FUunomqwpMAyHHG6Qk4cc6Q++R1EWM8fY1XOeEW24kzF
 J2Qg==
X-Gm-Message-State: APjAAAXJnOy5CGS9zeBSA4q2vHZ4MB16cZTSQu3EUtYFd6Biun+a/j5A
 InPJLXqGG3kqvIK92iNMkLiakkN9NRU=
X-Google-Smtp-Source: APXvYqybU7EnooO+2hYxyoG/zlaIgN7zPq2yT5ku002I+IL5rVlgbOGpjP9ENuwD53J01xA0b9beig==
X-Received: by 2002:a62:b504:: with SMTP id y4mr42569151pfe.40.1571194292843; 
 Tue, 15 Oct 2019 19:51:32 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id f185sm30269191pfb.183.2019.10.15.19.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 19:51:32 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 v2 2/2] fsi: aspeed: Add trace when error occurs
Date: Wed, 16 Oct 2019 13:21:21 +1030
Message-Id: <20191016025121.16564-3-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016025121.16564-1-joel@jms.id.au>
References: <20191016025121.16564-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This prints out three registers in the FSI master when an error occurs.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 endian swap the values
 only read them out when tracepoint is enabled
---
 drivers/fsi/fsi-master-aspeed.c          | 13 +++++++++++++
 include/trace/events/fsi_master_aspeed.h | 18 ++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index d796c4012875..6fa9712c70c4 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -252,6 +252,19 @@ static int check_errors(struct fsi_master_aspeed *aspeed, int err)
 {
 	int ret;
 
+	 if (trace_fsi_master_aspeed_opb_error_enabled()) {
+		 __be32 mresp0, mstap0, mesrb0;
+
+		 opb_read(aspeed->base, ctrl_base + FSI_MRESP0, 4, &mresp0);
+		 opb_read(aspeed->base, ctrl_base + FSI_MSTAP0, 4, &mstap0);
+		 opb_read(aspeed->base, ctrl_base + FSI_MESRB0, 4, &mesrb0);
+
+		 trace_fsi_master_aspeed_opb_error(
+				 be32_to_cpu(mresp0),
+				 be32_to_cpu(mstap0),
+				 be32_to_cpu(mesrb0));
+	 };
+
 	if (err == -EIO) {
 		/* Check MAEB (0x70) ? */
 
diff --git a/include/trace/events/fsi_master_aspeed.h b/include/trace/events/fsi_master_aspeed.h
index 63b9ce7f0de6..8e47637c5fb7 100644
--- a/include/trace/events/fsi_master_aspeed.h
+++ b/include/trace/events/fsi_master_aspeed.h
@@ -54,6 +54,24 @@ TRACE_EVENT(fsi_master_aspeed_opb_write,
 		)
 	);
 
+TRACE_EVENT(fsi_master_aspeed_opb_error,
+	TP_PROTO(uint32_t mresp0, uint32_t mstap0, uint32_t mesrb0),
+	TP_ARGS(mresp0, mstap0, mesrb0),
+	TP_STRUCT__entry(
+		__field(uint32_t,  mresp0)
+		__field(uint32_t,  mstap0)
+		__field(uint32_t,  mesrb0)
+		),
+	TP_fast_assign(
+		__entry->mresp0 = mresp0;
+		__entry->mstap0 = mstap0;
+		__entry->mesrb0 = mesrb0;
+		),
+	TP_printk("mresp0 %08x mstap0 %08x mesrb0 %08x",
+		__entry->mresp0, __entry->mstap0, __entry->mesrb0
+		)
+	);
+
 #endif
 
 #include <trace/define_trace.h>
-- 
2.23.0

