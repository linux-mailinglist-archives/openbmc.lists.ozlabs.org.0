Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E087F144
	for <lists+openbmc@lfdr.de>; Mon, 18 Mar 2024 21:38:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TJwtN4La;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz6C14TQgz3dvs
	for <lists+openbmc@lfdr.de>; Tue, 19 Mar 2024 07:38:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TJwtN4La;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz66m2pqqz3cDw
	for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2024 07:35:12 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-513d717269fso4950219e87.0
        for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2024 13:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710794108; x=1711398908; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JknIsko635WhVVLi1ylj6NQrxKxNK2l5LWcyGnBFbE=;
        b=TJwtN4LaWCXYUln8GwQsaApi8gZAJrMdETn9vFor0zlJS89KP2NeW4DI1IjTyNhBrL
         CqIF+1iFxkcgoYYRsKY+LXHKi4I0Foq7bC4TGOawAaJ5sG754LYAZK7UVbqHyCVH56Lz
         Vwqwh5A554sJBDujtDFLXrTrKfoXQbbFc+hNLAFpEsosS1JVRHqy5Li52nKFNfYHo5aP
         oFA8PR4LaxvelIp02v+mVOu/xe0hGmbFU0D8A6vrwZDvFa1+PjVugYaUQVOgjqKyS+dA
         5HjV3ZcEMP7RNfq7ofUAaC70RPBE01x+M+8J13rOP1EsIe1F7WtuvYimvHhLG4fX+fwz
         ebeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710794108; x=1711398908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JknIsko635WhVVLi1ylj6NQrxKxNK2l5LWcyGnBFbE=;
        b=Fqc71ugaZZ8b3mygi8vERQliWR9dzhYZZ97LK0XmDruAlUHOSKAA8rp6yzCFCc6LyG
         HyDuHc+3Sfl30B3/E9mgiMO+GgcuAbmE5vIbVwOsLEaUNzPya2fYQIhenkQEefBjvBWB
         fJmHW0mgYAF8j9DCMMSXU6w1OK+X/JYtSx1DtjvP07skYi/BUDxPDUDJLazHJKGMXtO1
         LKrwfMiiLQiBjjcZvVtqMeoRzbDVBg3BI/unpraq9nheHYCnzmsV1Dy5guVJL1FMMwYP
         Ecq9/fRVHS+9o6K2YQ3ispH1s7F00ZFvQB/rvNQLy3QM8wqluYW7vjUqR/u8jH0u81At
         KdMA==
X-Gm-Message-State: AOJu0Yw5XjO0W3DhvghWNIm9W5AlKOozTK9MMy7wy7wyEPhWqYaat63E
	JkWP6KtOKRa8zGY4IYNEBDwUVdu7WW8s0SfYwDfAuIfWbWpyJ6gGWGvlsNUTo98=
X-Google-Smtp-Source: AGHT+IE4qRxhlgwFitFXzZnpn2dv+sUUFp9n5jQ3zti2jnGf0rVdvBXpSCqb1uFbOdBRRd6d62Jm9A==
X-Received: by 2002:a05:6512:441:b0:513:cf61:6847 with SMTP id y1-20020a056512044100b00513cf616847mr7760272lfk.22.1710794107889;
        Mon, 18 Mar 2024 13:35:07 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id q24-20020a05651232b800b00513dd120ecasm1110853lfe.252.2024.03.18.13.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:35:07 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 42IKZ4hu029097;
	Mon, 18 Mar 2024 23:35:05 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 42IKZ4Db029096;
	Mon, 18 Mar 2024 23:35:04 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH downstream-hack dev-6.6 4/6] fms: Support the DVD/BD images size over 2.1Gb
Date: Mon, 18 Mar 2024 23:34:43 +0300
Message-Id: <20240318203445.29036-5-fercerpav@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240318203445.29036-1-fercerpav@gmail.com>
References: <20240318203445.29036-1-fercerpav@gmail.com>
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
Cc: Paul Fertser <fercerpav@gmail.com>, Igor Kononenko <i.kononenko@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Igor Kononenko <i.kononenko@yadro.com>

Adds the ability to use the FMS image size greater than 2.1Gb.  This
limitation is due to the maximum number of available frames on the
CD-ROM media.

An incoming implementation of additional media formats (DVD-ROM, BD-ROM)
should support both formats' possible capacity.

End-user-impact: Now, the FMS able to use a medium-image backend  file,
                 which size is more significant than 2.1Gb

Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>
Signed-off-by: Paul Fertser <fercerpav@gmail.com>
---
 drivers/usb/gadget/function/storage_common.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/storage_common.c b/drivers/usb/gadget/function/storage_common.c
index 081ffba7725e..f2051e3b6db4 100644
--- a/drivers/usb/gadget/function/storage_common.c
+++ b/drivers/usb/gadget/function/storage_common.c
@@ -243,15 +243,8 @@ int fsg_lun_open(struct fsg_lun *curlun, const char *filename)
 
 	num_sectors = size >> blkbits; /* File size in logic-block-size blocks */
 	min_sectors = 1;
-	if (curlun->cdrom) {
+	if (curlun->cdrom)
 		min_sectors = 300;	/* Smallest track is 300 frames */
-		if (num_sectors >= 256*60*75) {
-			num_sectors = 256*60*75 - 1;
-			LINFO(curlun, "file too big: %s\n", filename);
-			LINFO(curlun, "using only first %d blocks\n",
-					(int) num_sectors);
-		}
-	}
 	if (num_sectors < min_sectors) {
 		LINFO(curlun, "file too small: %s\n", filename);
 		rc = -ETOOSMALL;
-- 
2.34.1

