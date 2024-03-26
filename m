Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5375388BFAF
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 11:37:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ANbZ2mM6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3mTG0yn1z3vmp
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 21:37:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ANbZ2mM6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3mRp3XgDz3vlX;
	Tue, 26 Mar 2024 21:36:06 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6e6afb754fcso4697266b3a.3;
        Tue, 26 Mar 2024 03:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711449363; x=1712054163; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzA+4JI3wFiXDrwUJkR8zhNrvSRJ9geuAiqpr+wQJso=;
        b=ANbZ2mM6g4+FMPETg5tl4TP1cgESBzwd+2zbhno8tJnwQSnCB6cik3xWYrkLec7sNf
         qVP4nbhnkdcSDruJ1MuIfwqJGb+1UeoZQGxD5Nnkd11HO3IB91bs3SB6/jfSUBMxFH4w
         KXMygQBhBUmp6HrLca8O6V9nn7/codHZaUaoNcYIpZNU/f6z5Z5SWB58O2djD02wE3VX
         OnP8IIIBplf2FPPqb2aF41MaOedfdHjfWeU9lOZHIun9DljsMaHTNdSKSoKN9F7amtDP
         u3K/MzxW8scG2xTFYMiXj1MpmuhCy0Ics1XOeteYaR+2OUgwtYdf9GEeVWPw5FxfqEHb
         a1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711449363; x=1712054163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzA+4JI3wFiXDrwUJkR8zhNrvSRJ9geuAiqpr+wQJso=;
        b=aXSjEXFmqjRTRzkYCqTh6Ob9lMYRTF8SJGgKJWfdp2a9MYkGL5/G0Imw1OzxQShOdn
         kfCMCl1f585Lkoxe8ngv3Z7bFfxGHQdXYF+Sg893rlGZkr7sYce5mleU6pLxY5ajh2i5
         RrL1doiRtIgLfNDxC1reKZUmgs7IvxSMwCCuEEoetSZMG0eepgwTd4as2hyAu2dvrLBn
         WuW2CpF+e+XUauH9lfLZUrgAA8jy9MDWX+KMZto+ekhzR5IL+jzBJCh43h8tOptcuLjK
         +WtsfZ4K3g7z3wQ2+VPXOtcFCJ72+wzp5tixjHa56Y1/DSvjDDiVWrX8WL8t4LYkprtG
         1gyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFjEKx0esgwxjbT7xYjjJjs7X1OwDlZ0IrwSy9YT/Y1VFf2J4GwdyNfAmk7NbkBVvw8LRK1xGxZ3wTcbVlZbf+2coF8coiF3oSSHHL2QsFm1d2jXGZFZ/5g4tUBO1jfK06GtkQ8cLi
X-Gm-Message-State: AOJu0YyVk5qICzTBpPyfY4ubgYdY0DAr8KjtTrNRJ+xaw91IwYkIGaiE
	ULD88B1Y5QvxQEAm6IkCQ4xdnqpgmD2faW5SFFj1VCQBSTnCQsTOATz2ueN7PlA=
X-Google-Smtp-Source: AGHT+IHHOYzTj+IB7VjPayZebgf3uaGpX6yP65/tC4hSUtY5RbYDAX6ZhBtjhEVyZzYDQrPbpPPv+g==
X-Received: by 2002:a05:6a00:b42:b0:6ea:bdbc:963 with SMTP id p2-20020a056a000b4200b006eabdbc0963mr802295pfo.0.1711449363221;
        Tue, 26 Mar 2024 03:36:03 -0700 (PDT)
Received: from localhost.localdomain (125-229-150-10.hinet-ip.hinet.net. [125.229.150.10])
        by smtp.gmail.com with ESMTPSA id g14-20020a62f94e000000b006ea90941b22sm5554215pfm.40.2024.03.26.03.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 03:36:02 -0700 (PDT)
From: Kelly Hung <ppighouse@gmail.com>
X-Google-Original-From: Kelly Hung <Kelly_Hung@asus.com>
To: robh+dt@kernel.org
Subject: [PATCH v6 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Date: Tue, 26 Mar 2024 18:35:48 +0800
Message-Id: <20240326103549.2413515-2-Kelly_Hung@asus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240326103549.2413515-1-Kelly_Hung@asus.com>
References: <20240326103549.2413515-1-Kelly_Hung@asus.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Kelly Hung <Kelly_Hung@asus.com>, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Allenyy_Hsu@asus.com, linux-arm-kernel@lists.infradead.org, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document the new compatibles used on ASUS X4TF.

Signed-off-by: Kelly Hung <Kelly_Hung@asus.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Zev Weiss <zweiss@equinix.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v5 -> v6:
- Add Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
- Add Reviewed-by: Rob Herring <robh@kernel.org>
- Add Reviewed-by: Zev Weiss <zweiss@equinix.com>
- Add Acked-by: Conor Dooley <conor.dooley@microchip.com>
V4 -> V5: Update all changelog from v1 to v5.
V3 -> V4: The new compatible is a BMC for a ASUS X4TF server which use 
a ast2600-a3 chip, so correct string to asus,x4tf-bmc.
V2 -> V3: Add a label to indicate it is new compatible for bmc.
V1 -> V2: Remove blank in front of the string x4tf.
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 749ee54a3..0047eb4ab 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -74,6 +74,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
-- 
2.25.1

