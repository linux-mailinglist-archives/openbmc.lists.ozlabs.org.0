Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C99BF7F3E42
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 07:37:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cu29SReD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZs3k53dzz3cb6
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 17:37:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cu29SReD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZs136nJGz3cZm
	for <openbmc@lists.ozlabs.org>; Wed, 22 Nov 2023 17:34:47 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6c4cf0aea06so6068390b3a.0
        for <openbmc@lists.ozlabs.org>; Tue, 21 Nov 2023 22:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700634881; x=1701239681; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQdtIod8/WEOmGQN/sVRQT/vfmPbkQZq79mNkPK2+YI=;
        b=cu29SReD7DQCC4pqTG9/15ttPJ8HnPi/WRE7O6A9m9ODLYJ+8MlfJH+RrJ0XONWckO
         3Giyn4e5cBJkp5IkR1WGs7aAmuKRVP1uSPmx3oZ+VlSGlwaM7YDvJj6QI4MrzuAu68+t
         /Vk8idFpFxEaxD7lEiJDRXsArVV65CtOZDMWPhZzgl8zTjybn7JhZkiucyUWe0CE9bA1
         YcpHamgkozKXvVloYngEKA146bLNqDUt0dHn02qGLvx+LQWel63pfG4LG/HYK4G514vj
         Vv79kXaupOmPRqpUngZowHMd/oqQkVGtox3HcHqcYrbD25CRdCnp4TKP1f7UeDFxr+tp
         WAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700634881; x=1701239681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQdtIod8/WEOmGQN/sVRQT/vfmPbkQZq79mNkPK2+YI=;
        b=LnMbTzYsPFK7nN+LqqMI/Yhskb5RZ/K9oqK+q5bkgu6qYimHQauDFS1/UEEryJPSA0
         eybr2ib2f9z/N4otpp2lVbExHLJqJgR5P4pegZSvituJl4+Oh/l6QzNYHGVGnaD82I+O
         ZwDinrv2lbyQuWjB+meTPutmQRwaVTE+6JGkn0vEMKsZRhCAz+odytLQ4aA52TEynfw1
         SjKZaYmelt8LtBwU5o5Z22+aZHfCpEHlG/2+6Jo62iKvi1vmVeIiyFuBv7CSwhOFxByJ
         XNPXQTyIGtqNRUlxJMMZ00k8QsjjLJ4OVVD9exgCFDNIt6q8WV8M2k7VN8vwYL6jDO2X
         QLrQ==
X-Gm-Message-State: AOJu0YwWStIG+1oeS2ll0Ektxcbh6CIAvPUsRxHsGZ6Em4UckuaavOxT
	J2HCH0s+ZQvx/qKxjhzEN5ekidRYUVA=
X-Google-Smtp-Source: AGHT+IGZVYgozPRYcqurzU2/qeN7aDY8CqvDkgvY3400HkWGnXczu3Uro1g/d7Bo5vrM1RHlCkpnLw==
X-Received: by 2002:a05:6a20:1604:b0:187:e2ad:9946 with SMTP id l4-20020a056a20160400b00187e2ad9946mr1366196pzj.54.1700634880946;
        Tue, 21 Nov 2023 22:34:40 -0800 (PST)
Received: from localhost.localdomain (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id s11-20020a170902ea0b00b001cf76664db6sm962714plg.309.2023.11.21.22.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 22:34:40 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.5 1/2] dt-bindings: hwmon: Add mps mp5990 driver bindings
Date: Wed, 22 Nov 2023 14:32:27 +0800
Message-Id: <20231122063228.4037027-2-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231122063228.4037027-1-potin.lai@quantatw.com>
References: <20231122063228.4037027-1-potin.lai@quantatw.com>
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
Cc: peter.yin@quantatw.com, Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Peter Yin <peteryin.openbmc@gmail.com>

Add a device tree bindings for mp5990 device.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 7680c8a9b4ade..eb83ab4c02ee1 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -123,6 +123,8 @@ properties:
           - mps,mp2888
             # Monolithic Power Systems Inc. multi-phase controller mp2975
           - mps,mp2975
+            # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5990
+          - mps,mp5990
             # Honeywell Humidicon HIH-6130 humidity/temperature sensor
           - honeywell,hi6130
             # IBM Common Form Factor Power Supply Versions (all versions)
-- 
2.31.1

