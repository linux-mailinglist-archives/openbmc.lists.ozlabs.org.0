Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82373A4324E
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2025 02:12:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z20234Rhzz3dRK
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2025 12:12:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::734"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740380644;
	cv=none; b=DzzyMuEPe3uclEyKWP3lgqfTRxgxZlmX4NbPwHhF+5XTl1V0+JkE/m05W5NMJUugulFQ0367cIAe3HSYGD8FEZs+Oq1YSN8OEkP5zmHUyhrxMxGrOyohv4x+QPT38wasqRVBEu6l2C1Q0dzU0yH+OnmCaiJwoGbl95+q4JGVA6V/Xyi0UYz214qFFCueao0uH9vx7ZCqOV6eHSP7X2ye305h81IH3Mb4ctxtldkHi/lP0Op7qxCYI6EM/mp4DFQ67IwSocv4tToZK+qFXRjcJY4L2yX7mHMK7IDtz/mRV7n6n4XZkvAsrN8hYf3agoyHK/B6w0bMhCRGQ338l2q/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740380644; c=relaxed/relaxed;
	bh=HHRUOB722SP2pT9GOeb3cvEiqmLTG17HzDuBznymqOc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AZ1qnQdc7op1K8GuGpDSx8MhJuTN2BSi0BHBF1+eiYtPerRDN2aKZMEl8JkLzPDwZUk7XKaKZquftOq1sW5NIEUQ4vFWqx0LF708+kJS0ODx1E3h+fAb+E7hCZAOxRYz8xwHp2MK7iOmLI3IJ1Q5JzdOqsTeqGjBe/hQc5vOQuKOpQqhpZg4jdY7HWF4vURF753bkJyrg1gNYOAKzm+OhBJB+USyN1cAj12eh5JHRoftwFvRp+Qb1SuMsqf6KyULZ51kSvNIODekNVY3eOvkFQFYtgZ1OiuNoWtxs+QAWI7VPRvwHTt74zOxVxv/6d57OqNPcaqfSFOlanV4pWyS3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NMu3VFBE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NMu3VFBE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1WtW0KRDz2yGs
	for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2025 18:04:01 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7c0a1677aebso392421485a.0
        for <openbmc@lists.ozlabs.org>; Sun, 23 Feb 2025 23:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740380638; x=1740985438; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HHRUOB722SP2pT9GOeb3cvEiqmLTG17HzDuBznymqOc=;
        b=NMu3VFBEr5WDl8MmNNmksleyhA01WndokLobPUPVXZVr65/hXn8CNznBW9AAApIoj3
         2n33odl3Wune1A5U7JLRJ6nPcXHD77VFpXFx/y138iPpHDbQe7T9boeu2TzHX6/D3tP/
         hbk+ae3twQYLQ4K86BoNeCttt4EMnx+tyFhtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740380638; x=1740985438;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHRUOB722SP2pT9GOeb3cvEiqmLTG17HzDuBznymqOc=;
        b=uuYLBLhFoSaPC+mA05/mCnxBqkH63W33cfdpVwzHALW+Ynrks4o/eSQEdQL8OM/9OB
         hmc/16F7ZbeupvtQDANn8TjvYGq633jhJvOsPRcbCbkqGaaCLHWmIFApa+TC85Iznu43
         WtUWkvh86ulhKYUB7qL0oN3y61JSaXd+6aTElTJYGUK8lLCgR5I1LA4wSvLdxSAI3me9
         Lk+jj7fVAC78WAIWq3W6oSYRhpyObeJRM0bCzx35Y/WBR/voQxNiZLJ3b89OspY5d/M2
         erhJbHofnRDV6NzrS0ajxrQw19gakKD8PIF4/oRgf2pTMp82WDbbnMzo2SUOLZ6M/SIm
         gwbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRnUpKfvNDhO1eVKxLBq7rt+0ds8XS3nwTTio4xkcEn57Zwy7TaBbDoWFBzSg2IjVapQSf48mY@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzDu32WdsO4sA1bKm7PtqazgyroNAzkZJXwDGeI9Qx6fXrD+D9p
	1JuXCPGWEg0e/f3bYmMEZmfsGgXMDxGMFyg24do67yhgrhj5kpJfnMm8iMtNqRRvPTZ87RRvWvn
	2Rw==
X-Gm-Gg: ASbGncsPK4tOhhlNndr8W+rd3TfS1s+qWoxH7WnwZaRICs1yOyfuntz9GcXoQow5iwu
	irivBxHnkTvd1boaqVHdBE9AKtb70kzrousK9C/UN5w7/5qsTWxYhD7CXFP7726o84ydIUvWxRz
	jj00Pmdm5RooLMkv2OuvTMbcZvKKEV+8XlD9FKbK93LD/X7rG3IhG5y34I2CGphE27vF6/gG2YZ
	q/w7FXgQZY6k3bY7nL0h1hwCriySr9Tv6a80J+o8jMd28Z8k+PhacKL2Q5Isli37wGG5TlYzRwT
	ZMsIEr7U1uHtuUMN0wlPGG7i3WVADzCKypoMKcsuMeau3cR9GstKdl3bmq0FHfGOEGg/s107kJn
	5t64=
X-Google-Smtp-Source: AGHT+IFkIZyKy46tv3pPOrC7t02hlkGCHtN8wPMQx/td4toBFnJF7+sLcSy9HQrjuNm68CaBgRk5CA==
X-Received: by 2002:a05:620a:450c:b0:7c0:abe0:ce64 with SMTP id af79cd13be357-7c0cf8aec7emr1654304985a.9.1740380637686;
        Sun, 23 Feb 2025 23:03:57 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm977920485a.47.2025.02.23.23.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 23:03:56 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] media: nuvoton: Fix some reference handling issues
Date: Mon, 24 Feb 2025 07:03:53 +0000
Message-Id: <20250224-nuvoton-v2-0-8faaa606be01@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANkZvGcC/2XMyw7CIBCF4VdpZi0GiLe48j1MF1yGMosyBlqia
 Xh3sVuX/8nJt0HBTFjgPmyQsVIhTj30YQAXTZpQkO8NWuqzVFqJtFZeOImAt6t0FkOwF+jvV8Z
 A7116jr0jlYXzZ4er+q3/RlVCCoXmFKTz1hv9cDHzTOt85DzB2Fr7AoP7C4ehAAAA
To: Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.1
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 25 Feb 2025 12:12:04 +1100
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
Cc: Marvin Lin <milkfafa@gmail.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When trying out 6.13 cocci, some bugs were found.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Squash fixes and port to cleanup.h.
- Link to v1: https://lore.kernel.org/r/20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org

---
Ricardo Ribalda (2):
      media: nuvoton: Fix reference handling of ece_node
      media: nuvoton: Fix reference handling of ece_pdev

 drivers/media/platform/nuvoton/npcm-video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
---
base-commit: c2b96a6818159fba8a3bcc38262da9e77f9b3ec7
change-id: 20250121-nuvoton-fe870cbeffb6

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

