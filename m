Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A269A19B66
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2025 00:22:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ydg7d5KSvz3bXD
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2025 10:21:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f36"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737494101;
	cv=none; b=g0ks1geL1OmfOKYXFlZO8lz4b5maTM5djc7es3iRYCEX/QhoZelMdKC5Xoa1pUweCxF44XgJXLIdKCI61XHcxSTR6z21xdzqZkq3WSPxSjmXzQ3s9sjFtkJOyJjepCP3SmCsLZOuWI3aZ+wbR90/X5V4nJNNn02H3unw6qtJM1qWDAPbi1Rkm+uricjZbHkAc+XkJuojn+ikZQSWi+JrpPJrOSolF02C/JEwQlMZI+4UOk0mKwG2lTaqlZjHAz+Y5paVT3j3ob677JSTnBL/4c9MUhY37QFI0GWBRXLBbu1cEOlNcuOVuB+DMnrIvJgSxa+L5BXMJe4RAE5nxddGUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737494101; c=relaxed/relaxed;
	bh=rQuSQ7bovNI6GEsgzAgDtL6O/sCAbswELfNsKv2rreI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M7c3jv7nQdxlND5tJM3E2/EomDcL195bBUuxMgbPpS4sIUJ3VcbgbKzvEhdiSLgQunthzovn+NMyNWfq3WAPHIV7c59fxcxkx3Uf5VBSwiz0ZD76wnaIyWgbXw3Wm8yZ2DAfUiIQWksV7b5V4/5MwmtZ73hnu3eJL0EPdWr+GreD2tVQvT/c7XvpcTVnWcgDzYiOnO4wrL9Icx3uBo7i0yTxNYgGFbULUNyjXbxMaHgKpkTvCBn0Bt3QLuqRbp8uCNAQcCKQqGphaqcgZo+QeNy8U97OU3YjK6nwIU4NwhY0drlPQtatIXQrNTi5fqym+ud8j8IbIJOVB0xaLdJEZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VJlKr84A; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VJlKr84A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yd0N43Ybmz2yGN
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2025 08:14:59 +1100 (AEDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6dd1b895541so59325566d6.0
        for <openbmc@lists.ozlabs.org>; Tue, 21 Jan 2025 13:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737494096; x=1738098896; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rQuSQ7bovNI6GEsgzAgDtL6O/sCAbswELfNsKv2rreI=;
        b=VJlKr84AET085tpIGbsqsMX5egaymQzx8LCEMXXJRxRr4dVkWgqQ/9YfVwzuGcddKC
         SW/nGBUqyjMdWe+9vCj6kZnvsX07qp0za1Py11e8YKsHvIdqAAKY62cwDb8iQOUxwHJY
         H/F2bmc6EanxbcYIPRCkylGfBL5K3QbOKTwOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737494096; x=1738098896;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQuSQ7bovNI6GEsgzAgDtL6O/sCAbswELfNsKv2rreI=;
        b=owCchZkNXV7CV05hSMbzwzslyUIYtCnqoVc4XyuVhBCOYvEJV/7L+skhAtIHsSWrEb
         XZmpseEITaKWxJLV/atxG25AyUA8nEprdvfkVzBc13nCmwyIftLjVoZ2YmQg/FDURSGv
         SsqCsQfIEjJ4iHGtKn0B4f8GAMiLqJuwU6Myf8EcvXVAk0Ac6ZlaRKlEW/8u2N0ljkbm
         V8tcFLM+kJe9QY8sfoqaubtqXw5sIxiqTyHzi2wArEQZTsiE/dIv6uogr8ZJ70EQzAxW
         o3VhUo49wG3IaJH4RTVMb/kQVHdkRNfqg1OHtID2d7Fit4Q7A0kZxPF5p1cxvv2nWQF7
         N37g==
X-Forwarded-Encrypted: i=1; AJvYcCVUbietm3vYnRRTqu1K/ORr96YXIsQxEtOc6BmZcAGWGcn2iNSR8KrXfi+XtkC2nMCuVxvQTHIF@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxB0U564SFyNDDysauOGbdk6grBIWcfO5JSDOA8fqh3Vicf0Qke
	Gj69DVa2tfr1cFNozFmoXkupajHQxgnZB9fRVjLD2+pZlhq87FlaK7/bhp56kw==
X-Gm-Gg: ASbGncsRStZ96L+j1E+Bv67QaNzQxALEcgK+rOEJmvr9WpV//rbA4dD8K876CKuXLnk
	2dvjmIsLYtEmQp2BTVZMbBJJPEm1TDzK/BmexEUA0mewyAU4gyLUONLchKh6HHfTeWG7kwoyeiM
	Cs5oRVAPP23TvH20WicpEbDOlzQVlvjAc8UzMiVWQCUcSz4wuVTm3uBjXiPiNR55nI17cGfMg9p
	IGZX80966ZTccj0mts0Sq78qPXkEIB0z9axCJm8rsZQag2hdJ6TNX4EVFC+PY6iwIDihNs4+e8N
	MzgY5h95uUUm+mzxD2WLD0RMnF1Ga3D9GWD5imQ7fzs17d7hgQ==
X-Google-Smtp-Source: AGHT+IFVRDtX4xLCSgnndPd/KmBxnL9FoLZx0NyA+ZEg2Wgowuj2xhPVpo4f+zf+P1TtX9DKiJhurQ==
X-Received: by 2002:ad4:5747:0:b0:6d8:9be9:7d57 with SMTP id 6a1803df08f44-6e1b222e66amr323757436d6.37.1737494096451;
        Tue, 21 Jan 2025 13:14:56 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc28f84sm54790186d6.63.2025.01.21.13.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 13:14:55 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/4] media: nuvoton: Fix some reference handling issues
Date: Tue, 21 Jan 2025 21:14:49 +0000
Message-Id: <20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEkOkGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyND3bzSsvyS/DzdtFQLc4PkpNS0tCQzJaDqgqLUtMwKsEnRsbW1ABh
 h0VdZAAAA
To: Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.13.0
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 23 Jan 2025 10:21:31 +1100
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

The fixes without using cleanup.h should be backported. The last two
patches make use of cleanup.h to avoid this kind of errors in the
future.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (4):
      media: nuvoton: Fix reference handling of ece_pdev
      media: nuvoton: Fix reference handling of ece_node
      media: nuvoton: Use cleanup.h macros for device_node
      media: nuvoton: Use cleanup.h macros for put_device

 drivers/media/platform/nuvoton/npcm-video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
---
base-commit: c4b7779abc6633677e6edb79e2809f4f61fde157
change-id: 20250121-nuvoton-fe870cbeffb6

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

