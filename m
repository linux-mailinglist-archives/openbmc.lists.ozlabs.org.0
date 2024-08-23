Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C0095C54C
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2024 08:18:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqqcs5Mb1z3c2F
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2024 16:18:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4860:4864:20::29"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724393881;
	cv=none; b=VAi6s05fZRWmg8jf6GfMS7lU9FOr6N4yjxuUhU+2nP1nBqa+WkanoxVWpgT4ndFBjBBVC0lqDJ/4fBC7JZf95k7Ytd3i6d7hApAlBibtjllFDkiIH3HKkcNLMcBRcgufIQpCWdGAZFBgSRSnhLnEVBB/JsnBSjDlFTPZuZ4wt2B2t4xnHYPLetBv+ZOlu5T7TVLvAVhjwRNijcuxJlC2a4QsFhVMnbh6yFgKjdLreApLLuD/FYUQ6b+wjlKVjuFa9C3uD5rM414S3Oc94B4S1VA7ruOaxylkBdpCYgA5bROz4CVBmaBBuNNegXqHZacvg4kbZuTuaLGckB9lANZ+Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724393881; c=relaxed/relaxed;
	bh=MqZgILwCJnO4fiF3lzwtEIcS40ie6qnN0WYtughNHhg=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=XcgTUTtl+A0tpbPr6BORgUbfgLRUUbYdBQiNpCLq/3X9ZLA9I+00U/5PXUlHIJ5spSzvEp8F7Rik97GgHk/mKz98Fn5NcNBfZD2Qo/5vkAQTbgB/cI1oQcSOHLC9UdWLcPMhvr2BPDsGruJ5YuPd+/9FQ+zukVQ4BwyU8QrRCjMBcSNiCK6x8XNAE9+bOCG4VZDIdcGdoUvJHZpLc3dwTLMD3PKX8PCGnWxtrlgkHmqyJ2CbeupnTp05BCpM3dhCzxgMJeegVFBTBQg48Oq5p+34wcIonQV2gs7BSTVeQo9svJYUrm57ljB0It3MbkKPXjjecEkPgwjvH5XtzHbTdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f7RGXJ6M; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f7RGXJ6M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqqcn1yt0z2ytN
	for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2024 16:18:01 +1000 (AEST)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-2701824beeeso1177242fac.1
        for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2024 23:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724393878; x=1724998678; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqZgILwCJnO4fiF3lzwtEIcS40ie6qnN0WYtughNHhg=;
        b=f7RGXJ6MiRKdh2MYmthqw43hBSbqceeU5Jbmagr3dHLSOaIR5WQvfMfqXgzvpRTXNv
         KJRUC7W3iWdgyMXxMdEulfp39weiHjUopa6uQbEM3JErW7p1GvkkmE4ydvREHPEf74kY
         qfD+xZKEIqFl9v7dSgM1LRnCBwXzYyHHJW/rvaHgByGO0c4C6aogAoXHNVoApurur+n8
         Pp716NQi/iaOkeDLyPMgOUELw6ShpMjAgr5MvVo9eWKEmDbea+xgGDQ00MZXWWCWLaek
         2JA0fGTzW6EaRxmg4s1uL4Dc+C8EVLzqK4QojMPDSCopj4XH6WRE/SNjJ2ZM40ymgOqE
         sM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724393878; x=1724998678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqZgILwCJnO4fiF3lzwtEIcS40ie6qnN0WYtughNHhg=;
        b=wiq4QbSQnHYrMpdKhuuL5CDVuet/bx/RLdHANdNbSDcZXL3aj5uz8T87AXCKSz/V3F
         +ISvQokt+TYkfY5EqLS+Oxwirgz1PmfkPB6av/UwwPR8WoCwlr640ezcgxH0Ky1DKbs3
         5apYJF5HkJcT/WUEfBtRaiFF2kKYIXowtvKhsLSczQab1aAoPtcM5M0bgoPBOY0kMC3r
         2ctnjYKLEDPVI6V+kHfcuvvvdTw5SDv7DoZLbuKnMNLMqKjz0QJoNgh4x6DJMoSMh0NB
         0h4rJYjo0oGgOEPDb3/NZBahlNJNxdUEpHEj3ggUHL+f0L16Qwd5S3YGPJEsXEXJCLeG
         77Qg==
X-Forwarded-Encrypted: i=1; AJvYcCV9quCHWyJA8cEl6Q+HtIJDbEb31I0gA+oegrvqgkZoSO2YlyFAkbRQhQcEMLz979BMHe0jxiDY@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwNmxYV7NGyLWXNmN7Y4/uDxTTJ/oS8XxRjg8wvLYFoZK1ZOWhI
	2arPkXIEu4y3C/ozLtJc6VxubG0XpBJASpX+MRijLzh9mv1Q5EmG
X-Google-Smtp-Source: AGHT+IEmdbH5j6ArBYnY+KmuX9zMvmWHEn7IZyhgdQdVJZ8jjQNBcBxASLuVNAW1O3W48Tc+rWuR5w==
X-Received: by 2002:a05:6870:e0ce:b0:270:29df:e5f0 with SMTP id 586e51a60fabf-273e63e6be4mr1236698fac.5.1724393878381;
        Thu, 22 Aug 2024 23:17:58 -0700 (PDT)
Received: from cosmo-ubuntu-2204.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434255798sm2319551b3a.82.2024.08.22.23.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 23:17:57 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.6] dt-bindings: trivial-devices: add Astera Labs PT5161L
Date: Fri, 23 Aug 2024 14:15:32 +0800
Message-Id: <20240823061533.3463647-2-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823061533.3463647-1-chou.cosmo@gmail.com>
References: <20240823061533.3463647-1-chou.cosmo@gmail.com>
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
Cc: chou.cosmo@gmail.com, Conor Dooley <conor.dooley@microchip.com>, cosmo.chou@quantatw.com, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings for pt5161l temperature monitoring.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://lore.kernel.org/r/20240115100518.2887549-3-chou.cosmo@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 088b23ed2ae6..842eb65e4c03 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -47,6 +47,8 @@ properties:
           - adi,lt7182s
             # AMS iAQ-Core VOC Sensor
           - ams,iaq-core
+            # Temperature monitoring of Astera Labs PT5161L PCIe retimer
+          - asteralabs,pt5161l
             # i2c serial eeprom (24cxx)
           - at,24c08
             # ATSHA204 - i2c h/w symmetric crypto module
-- 
2.34.1

