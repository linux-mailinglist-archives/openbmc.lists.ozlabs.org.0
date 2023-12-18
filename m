Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A715816640
	for <lists+openbmc@lfdr.de>; Mon, 18 Dec 2023 07:08:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kOHvZ8gD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4StqC02k2Zz3byT
	for <lists+openbmc@lfdr.de>; Mon, 18 Dec 2023 17:08:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kOHvZ8gD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4StqBR0gZpz3bZ4
	for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2023 17:08:14 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6d9d4193d94so2370090a34.3
        for <openbmc@lists.ozlabs.org>; Sun, 17 Dec 2023 22:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702879690; x=1703484490; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHqn0lmuttOCPsOAucTyzRzcawyQT2nV3YMJKvxfNVs=;
        b=kOHvZ8gDAba1TTSWEaKG0sG1K+2q48rQZifKlPaWiRjPS25D/Gp5Kf3xzad+hpMyeo
         Za6rzBA4ud9S8MxPs+huSJ9gkNJwqbyCSVL+eQFfUqdykcgZr6S5AWnSRwcoixT2p9qR
         Zxth7egLxVxj67lF+deFLjsToWfDYOyoojGJ+mp2/cQvCkmB7VnaMTVDPoh3soVpLFfd
         wE2uVoo84IycYPlRCRiqjgZR2b8zF5oZOFBp8LAz4jwAEasrue+y8nJl9+Phkhjn3HaZ
         /ITHqF61gxXyTve4b9+cqygvbHUCerlIT8y3k6iGFPUJdeZYbIWqi9khO/ZXAV0PCG99
         RmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702879690; x=1703484490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHqn0lmuttOCPsOAucTyzRzcawyQT2nV3YMJKvxfNVs=;
        b=gtGgh9PsiB2HVB0gWbrCcIllFXFyxudKuNzcoHddokZQ6FpeijLoA/q2J6b4InFTTb
         cMxBB/xl2uXvAQkTQNJ2suUkLg3iyLNKrdjb2iVyq4GsK5rrdVkN8k/xmlIuiiZijZNi
         tfDUS9sZWJnV4Ln/ypuwf0k8HPsjJ84klnIGANN5s+NyiF12QCl7AnMEW6CZp7+ntXZU
         9DR760G561Eh+zeFr9NSyokIZM23ybL+p3E3kToEL3bT/t+08QsDPHBzCB5hblphQAEN
         24A9JwfoG4dOs0BCRpX7f0yUpVN2KIO50JNPvxUa8jJdsDZbIokdstotyNG55m+oXCRV
         sYrQ==
X-Gm-Message-State: AOJu0Yx3930xIjOiaQJ5GVOg4Q5WwsRxGKuMl3MdIZjI9G1xJsd1SEuN
	f4B7z15AWOYRULox6epjAe/SMcQYy9E=
X-Google-Smtp-Source: AGHT+IG+t4/DaTlqA+8oDt9/UHEb67xxYsEsn4MZpIjhLT2Um2XQ/YeV5c6Usqg9uhzTO5KweLToiA==
X-Received: by 2002:a9d:7384:0:b0:6d9:d41e:286d with SMTP id j4-20020a9d7384000000b006d9d41e286dmr16201640otk.18.1702879689622;
        Sun, 17 Dec 2023 22:08:09 -0800 (PST)
Received: from localhost.localdomain (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id hq10-20020a056a00680a00b006d5b877aa9asm1877689pfb.41.2023.12.17.22.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 22:08:08 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 1/2] dt-bindings: Add MP2856/MP2857 voltage regulator device
Date: Mon, 18 Dec 2023 14:05:58 +0800
Message-Id: <20231218060559.2302459-2-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231218060559.2302459-1-potin.lai@quantatw.com>
References: <20231218060559.2302459-1-potin.lai@quantatw.com>
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

From: Peter Yin <peteryin.openbmc@gmail.com>

Monolithic Power Systems, Inc. (MPS) MP2856/MP2857
dual-loop, digital, multi-phase controller.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 386ebd1471d0e..c847a532283d4 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -119,6 +119,10 @@ properties:
           - fsl,mpl3115
             # MPR121: Proximity Capacitive Touch Sensor Controller
           - fsl,mpr121
+            # Monolithic Power Systems Inc. multi-phase controller mp2856
+          - mps,mp2856
+            # Monolithic Power Systems Inc. multi-phase controller mp2857
+          - mps,mp2857
             # Monolithic Power Systems Inc. multi-phase controller mp2888
           - mps,mp2888
             # Monolithic Power Systems Inc. multi-phase controller mp2971
-- 
2.31.1

