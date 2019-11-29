Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5359110D02A
	for <lists+openbmc@lfdr.de>; Fri, 29 Nov 2019 01:20:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PFXP5dsszDr9S
	for <lists+openbmc@lfdr.de>; Fri, 29 Nov 2019 11:20:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bv85t85R"; 
 dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PFWb0VkYzDr8g
 for <openbmc@lists.ozlabs.org>; Fri, 29 Nov 2019 11:19:53 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id y21so12493747pjn.9
 for <openbmc@lists.ozlabs.org>; Thu, 28 Nov 2019 16:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h53cQjZSibuH3tAJSYGep55eMe8Vd0lhXfafS/71YMc=;
 b=Bv85t85R3UvENEoNM1z9LUb+cWEgsm9+BUi6Z6TY45q7P4tPHrTkzmbq19ZyKt3gaY
 4Y7b1GC07f6G3J9lhtrt1nyCJUz91Vr1W2Zz7WfhKYP89Y1e+CepLYa/Fd3ILNkgJBYm
 HXkFZ33yEKBBype4wxBkYrsItVCCwAL4ez8pa2iagti25qmNm1/7arPwnqs0LjBvPk/a
 HcOWyYq2ZMG0wlTN87SrVWqCrlFKwRYxUDQ1pE9TplPwkhzvnEg5teYfGGf3zSega9/A
 2n83v1OcpOZr1pKNmtVs5LQQ3sLA7oD9FUEar9wbLLo7EXJLaDtOv+EpKnCuO6o92m7i
 Udsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=h53cQjZSibuH3tAJSYGep55eMe8Vd0lhXfafS/71YMc=;
 b=ozJmIji3FaDOdpRuYtg7jJgCGY0A+Udr/gIR3N9m6Er6/RCp6BSqxxogMCTb4NzObP
 BhdFwgX28OrYC1LkAthmsXGR4AOn+NOcMm5dwX2n/Ibk1gK2ZpEC6QMqEtHUCLp6g+t1
 Tz/CbKJe4MwSealz0IFLzkOrgAWIwYtej02QjoJWQBg+QuGRNhbVWXiPup0aB07kPMvn
 R0IkYZs+l6/fNmKkteG/T+SFXCUx+uIKeUiqjh4S5iQPxYHpUOKHk3HroxmsSNivDYgg
 jb4DOeQMi2tTGeicgh8vRL6rokpnjmBUm5bqR5HtFB1GT+GnRe8cyrVp2v1GgKnsZ4oe
 F/nA==
X-Gm-Message-State: APjAAAUAmVtrRCk1WTsgFr1FJ3gHPvPoB840pBdkIxDFrOIYCoKAslHT
 t1GKt2rgmwIIxQkvbHPJITA=
X-Google-Smtp-Source: APXvYqydSlcywgyu28ko3Or1LMj946GqVhi84pXtfb+mGorPFT5tefwcV+ieBvVCZA+weqO0Y7JsjQ==
X-Received: by 2002:a17:902:a408:: with SMTP id
 p8mr12227465plq.266.1574986791930; 
 Thu, 28 Nov 2019 16:19:51 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id c2sm21717929pfn.55.2019.11.28.16.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 16:19:50 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>,
 openbmc@lists.ozlabs.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "jffs2: Fix possible null-pointer dereferences in
 jffs2_add_frag_to_fragtree()"
Date: Fri, 29 Nov 2019 10:49:30 +1030
Message-Id: <20191129001930.651128-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
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
Cc: stable@vger.kernel.org, Hou Tao <houtao1@huawei.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This reverts commit f2538f999345405f7d2e1194c0c8efa4e11f7b3a. The patch
stopped JFFS2 from being able to mount an existing filesystem with the
following errors:

 jffs2: error: (77) jffs2_build_inode_fragtree: Add node to tree failed -22
 jffs2: error: (77) jffs2_do_read_inode_internal: Failed to build final fragtree for inode #5377: error -22

Fixes: f2538f999345 ("jffs2: Fix possible null-pointer dereferences...")
Cc: stable@vger.kernel.org
Suggested-by: Hou Tao <houtao1@huawei.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
5.4 cannot mount (some?) jffs2 filesystems without this fix. Hou pointed
this out[1] a while back but the fix didn't make it in. It's still
broken in -next.

[1] https://lore.kernel.org/lkml/2758feea-8d6e-c690-5cac-d42213f2024b@huawei.com/

 fs/jffs2/nodelist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/nodelist.c b/fs/jffs2/nodelist.c
index 021a4a2190ee..b86c78d178c6 100644
--- a/fs/jffs2/nodelist.c
+++ b/fs/jffs2/nodelist.c
@@ -226,7 +226,7 @@ static int jffs2_add_frag_to_fragtree(struct jffs2_sb_info *c, struct rb_root *r
 		lastend = this->ofs + this->size;
 	} else {
 		dbg_fragtree2("lookup gave no frag\n");
-		return -EINVAL;
+		lastend = 0;
 	}
 
 	/* See if we ran off the end of the fragtree */
-- 
2.24.0

