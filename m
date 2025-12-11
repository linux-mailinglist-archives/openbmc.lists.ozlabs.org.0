Return-Path: <openbmc+bounces-999-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2FDCB5357
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 09:49:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRmSH49Zdz2yfl;
	Thu, 11 Dec 2025 19:47:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765442863;
	cv=none; b=K3NMlIulr7Izh1r4BQzf4MnfSSigG7hJAbtwwWqVFpXV1wQ0PNI9jZB1NGKu+wrJzKhDF93uqMHrAhP4AesfCvZqSN7UsKEIhIUqrih9qnGneXl8xJbjCIjHvMnTk7SGwAhA5snTL890uu4cvcpCd/E3HWUPXBu25mxE+Jh6LBydLHssHtkjTB99Ykp2YT+U5zULiK3PtWq8HhZTyporgs+W5YPe0tajBjkpKJWIdocfoVawUbOI/IINf9+hHE+vwCONa+yRUJZvWowx92M1SL8rFJsUIBf+nMVjNn906Ox+GbdPO7NqVEAIdZDBLnyyl5I4Hd2A5QsYDFG6UkRpBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765442863; c=relaxed/relaxed;
	bh=QA5RNQcEfirms9HgWj8AssmGCc/5FNo1GGf/ysp2RSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Le7enTEKVN9dNKXN4G6Nf3ZNGJtDpJ7Z2SamEiq+PVkiIhyyqjKBazUZ5S79LcGxq52kyk5abBmlK5mgTAPW7SpuJB55cDa4oE4o6P1RWdXYO8ZDSGPLRvAhRPZO3xQhUCpVCxgatBO1ftZhCOxjXXFVW+A9wV0gW7JtquPr2FYRMv00tPb0/IKpCYQ6FiifRXnnoQM5LS87tB5pRep/ioklyHTNSAdqlE5kgcs3DJJLC297UXdoGrcBwsdnZk7FKWruqATgjubL/p6EFxcu4Xps8jWCfGTHuP3nDascSqhuzBwwVw3xvSYyv5FPfNI4duvvvymmeGZwynTjxj/DCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=N0E4UmYM; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=N0E4UmYM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRmSH1lYjz2yFj;
	Thu, 11 Dec 2025 19:47:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442862;
	bh=QA5RNQcEfirms9HgWj8AssmGCc/5FNo1GGf/ysp2RSE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=N0E4UmYMR2ijnu8okYEs3ej0qTmDYPSsnolgBDBHQXQUyBeklOSMTxvmwqiB1XfUU
	 kN3ZpVQfS67dqTf19F28O4LUE8MSV38xyX7ibzXktLyUNi69uS23ZIJyY28lE5N+df
	 VBeUUNrZlX9i0MzdEEuxqoysSM/GgXD6esgTzWtH5H6Tcyoev2EhySg4EOCEDJk8XJ
	 GIa23Q/YY58ZvlrfHve5yA73oxn2+tA8rBnZhDPbz5bfvIEBVDYSuHX8w25wP0uPqw
	 /wg5SoDm2WGhjTpspHP7NTxW6ekroF7I+DLH+mP2eSdQELxc/1fLg0vNh+4Qd/zpZ5
	 kJ/XRzBv/LSKw==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 29A0C7D6BB;
	Thu, 11 Dec 2025 16:47:37 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:56 +0900
Subject: [PATCH RFC 14/16] dt-bindings: iio: adc: Allow interrupts property
 for AST2600
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-dev-dt-warnings-all-v1-14-21b18b9ada77@codeconstruct.com.au>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-iio@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.3
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The device has interrupts allocated according to the datasheet, and
the devicetree already defines the interrupt property. Address existing
warnings by allowing the property.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
index 509bfb1007c4..249101b55cf4 100644
--- a/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
@@ -44,6 +44,9 @@ properties:
       Input clock used to derive the sample clock. Expected to be the
       SoC's APB clock.
 
+  interrupts:
+    maxItems: 1
+
   resets:
     maxItems: 1
 

-- 
2.47.3


