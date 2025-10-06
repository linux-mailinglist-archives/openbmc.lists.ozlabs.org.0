Return-Path: <openbmc+bounces-717-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31404BBF9B8
	for <lists+openbmc@lfdr.de>; Mon, 06 Oct 2025 23:54:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgY2F4yJxz2xlK;
	Tue,  7 Oct 2025 08:54:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::732"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759787653;
	cv=none; b=S1jsCla0MP7O4OZShyNtZh0ZItQZDUBTkzCJT3LOPUcBggNgX+WfdXghtYQgAhkXH/SsAonIiZ2K123wF1+d5c8woUPWN3scJQ1g8hwcckjh+jyPi5LD94l86rEixtiDel4jwzliReLWQqdY7V6tWchDu8ANNBV57oejErbUQJlDV0dJxV12dGc3Yjr2+qauSdY0aGYMoomNSz4TsWJ5Asn2G9riK1kNhqyDiGWv3W/g4OUj3RbZUr64YZ+odOOHOiioGs68rL6pEeRLyRe7q1ZUcG1ekE14qgxdcVDonEEUFUXJwQVHqpLd8IcSoQUUwQrKU2HW0WfrlRosKDN4Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759787653; c=relaxed/relaxed;
	bh=GzHR9nOubrbOV66JDSdOHQf9JHwFVJCFi2cD9sJyIbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kfJshWxEv5B0N06zZsZQUFt/uZ3P4MmrPIq28jdC5DcsAeSYjNlvUbxiQkP22/k4FB2YHN6w/t+/qM13BPRMmZcXNUUn0+5GSGRa0ZVdDvR0quTOgMQzLplfGjIdCrmWFBhAaC0XOZAzVr6X+YGaIKtgsK1+mRglnnhIAXTh/PSDKsAa76+8XoVCtw8mHyczL5crE/bh1DHGMFj1vkA6rlMmVH4BK6FIIKdBh7Cuc2d/e4wKVO+/I6p8jgX804NdlCJJS4Vw5lQtfzbbKgkg3bZ5FN1TUmJnKdpXNxJZOvrnnR9SObCzZNcT9+ekNInEOq0TwHX3Yark/bkwinRomw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=c0dnOMJl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=c0dnOMJl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgY2D3BmLz2xgp
	for <openbmc@lists.ozlabs.org>; Tue,  7 Oct 2025 08:54:11 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-858183680b4so681105785a.2
        for <openbmc@lists.ozlabs.org>; Mon, 06 Oct 2025 14:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759787647; x=1760392447; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GzHR9nOubrbOV66JDSdOHQf9JHwFVJCFi2cD9sJyIbU=;
        b=c0dnOMJlS1Av34EIDhjOmbzUU88yFnDQoUb+Vqm7IrjpUCGkq/SS3rR2HiNy5v2xVR
         9S3pwHdYZqK3Hae3Bm4p0UqBw5f7izBX9EDV2QVEiA+pvDZeikt1lXMvmoQShSnnhVrh
         MxrPzzZ6g6yYIfT8nFQC5bZLYjekWcAUbkOEu10WVep0JD0yTPIbREr3sX0p96Mvopub
         DcDJTpG5+KwhVBWVPW3lFlYVR8bHYS6lBajT0TwvDKyQyeRmdfCbPfScCmHKeLZEde2O
         mT2NVmSSqLX3SrUQ676tHkwLME1bW3FGPrRv6oB4/izCzPeKh8b0w7YxKiU48hpcD8Nn
         /Law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759787647; x=1760392447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzHR9nOubrbOV66JDSdOHQf9JHwFVJCFi2cD9sJyIbU=;
        b=h7qlnxINkAdBeONnCr16IsOQeCkZLqtCSSF6JKAdpU09QPpGDmB0jRJcnP+fl6+HEP
         hWJfvvt+d/z4sNObcompck80EPDuRztr2A2VyLGKlzfnlUEcFORFGRf/4IJRmh3OeAm/
         aIDPZ16rbLfwJUJt7UZCA7hGWb+6g3j1KxFfhtnm1KRrfx4PEAF8EFWkSZl4kYchLbJu
         Gl02k1qg3Vsw0aEiCaVNSS4d1C7RkASZRl0uOt+xly12WXzagHtkud4018QczgETjB6S
         0eUPa2Zub69uAbJYDJzmvQvBhKstsodhLROi7ejD61LqpdcAybGwBr/cfkCH2Fou4QeB
         AVeQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2rUZXtUqk0Vw2SrwQTCZkRdA5eJJcn7PYqL3Vkp+uUY+nu5Sf0cGRd4t//oLDHP8OURNiFYN4@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx21W2sfxr0as5Tkfu/ejAeiewaD/vsTNoPwwOQU5gc0WBQC+jU
	tREuTt7wrYhqqfBwytyEb42eaQ2c74IV3ykawzK+z9It30i81i/c7o7+
X-Gm-Gg: ASbGncuHBztDGA4BA8+t4deTAfY+PjF5xLo4DGubEHGeoM+uCj+3MXjHB8TOT4XJbQo
	UPWANrUCsMzPkTLjZA0Awcmh06O6h73GzyUGwvYCRcsfuqabaSFtpgvRd7SV4Eceqal4O2XuZuv
	vkF7SwS/5nmMAnNDISnNeK+EZlTsrWFnWwCqBliuKbf2WCSGgbkSqOGDgoLXxxOKds02nm8kort
	h3U9v0ovuWBryNfAM3s1Ncr3KcqyfTTPRym4ARaxW5XCgpMRp7lHXVkSVStDgko79UaPjgk/zcN
	Lf8J+XGdbnRJ6MH3SX0pGtKRJTNKBNZSDCQz+HGW8RgYf7OG0nRQx7yVDYvE1EY+uZdJlePCuRv
	pp9h1cZuvwaWMIBsSJ9wBLaTc8+Lli0ZoDadMQg==
X-Google-Smtp-Source: AGHT+IG0UNlyx78vsddyW3DjBY/aA6lui1aLxmretPKBkhllfywXoRVS9YugmVjoHVxZWQR0Lyw84w==
X-Received: by 2002:a05:620a:4514:b0:858:a4dd:d180 with SMTP id af79cd13be357-87a3808f557mr1974325785a.40.1759787647517;
        Mon, 06 Oct 2025 14:54:07 -0700 (PDT)
Received: from fr.lan ([81.200.23.195])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-87771129478sm1314168585a.1.2025.10.06.14.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 14:54:07 -0700 (PDT)
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	Ivan Mikhaylov <fr0st61te@gmail.com>
Subject: [PATCH 0/3] Add Emerald Rapids PECI support
Date: Tue,  7 Oct 2025 00:53:18 +0300
Message-ID: <20251006215321.5036-1-fr0st61te@gmail.com>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add PECI Emerald Rapids support for CPU and hwmon interfaces. dimmtemp use
Sapphire's callbacks about reading thresholds because it's same
platform/socket.

Ivan Mikhaylov (3):
  peci: cpu: add Intel Emerald Rapids support
  hwmon: (peci/dimmtemp) add Intel Emerald Rapids platform support
  hwmon: (peci/cputemp) add Intel Emerald Rapids support

 drivers/hwmon/peci/cputemp.c  | 18 ++++++++++++++++++
 drivers/hwmon/peci/dimmtemp.c | 19 +++++++++++++++++++
 drivers/peci/cpu.c            |  4 ++++
 3 files changed, 41 insertions(+)

-- 
2.49.0


