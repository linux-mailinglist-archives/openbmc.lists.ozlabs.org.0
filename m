Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD057FAE7D
	for <lists+openbmc@lfdr.de>; Tue, 28 Nov 2023 00:39:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ahoEW6BE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfMW004pQz3c18
	for <lists+openbmc@lfdr.de>; Tue, 28 Nov 2023 10:39:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ahoEW6BE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=collabora.com (client-ip=2a00:1098:0:82:1000:25:2eeb:e5ab; helo=madras.collabora.co.uk; envelope-from=benjamin.gaignard@collabora.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 308 seconds by postgrey-1.37 at boromir; Tue, 28 Nov 2023 04:00:35 AEDT
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfBfr04sTz3cLY
	for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2023 04:00:35 +1100 (AEDT)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B752566072B4;
	Mon, 27 Nov 2023 16:55:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104113;
	bh=ayBhyvSUe+u4AtwC/rm89lTriRSE3ewHkfysyr3gsEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ahoEW6BEFCLYt8ukZWa9VOHDQ1+NdpPPSgLK/sNTfG2PMP2G6oYMPBqKgQF+emRS5
	 GQz5tkAX7r0tWaK9EFKT0dulFvaBrfAivz2AArXK6KnOYQ9TIC2l/Rz5pYtuYULIDi
	 dTyOz9lX6ZJOQLNtvEdtnjAnm57y/J8N+W5kGGZRGAoq6KIMxbAipc8cW0UVMQF49g
	 InY0zhL9GBg2M23GKowCPIUkCVUCLAvZW8G351rowpgw17YEnCQt1PBGYf2Jlg78/V
	 vN8+WHGycSA/NUCvj/mBuLNCSe4h7+4d8ZyhXnxOhqHTVvJlZ935py1NV8Z+cxg0ap
	 N2HnPImvB+bGA==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	matt.ranostay@konsulko.com
Subject: [PATCH 10/55] media: nuvoton: Stop abusing of min_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:09 +0100
Message-Id: <20231127165454.166373-11-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 28 Nov 2023 10:38:55 +1100
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
Cc: Joseph Liu <kwliu@nuvoton.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, openbmc@lists.ozlabs.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel@collabora.com, Marvin Lin <kflin@nuvoton.com>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

'min_buffers_needed' is suppose to be used to indicate the number
of buffers needed by DMA engine to start streaming.
nuvoton driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Joseph Liu <kwliu@nuvoton.com>
CC: Marvin Lin <kflin@nuvoton.com>
CC: openbmc@lists.ozlabs.org
---
 drivers/media/platform/nuvoton/npcm-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 267e301f2b26..6c122508be1d 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1612,7 +1612,7 @@ static int npcm_video_setup_video(struct npcm_video *video)
 	vbq->drv_priv = video;
 	vbq->buf_struct_size = sizeof(struct npcm_video_buffer);
 	vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	vbq->min_buffers_needed = 3;
+	vbq->min_reqbufs_allocation = 3;
 
 	rc = vb2_queue_init(vbq);
 	if (rc) {
-- 
2.39.2

