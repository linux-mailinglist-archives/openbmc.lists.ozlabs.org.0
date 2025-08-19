Return-Path: <openbmc+bounces-480-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9434B2D004
	for <lists+openbmc@lfdr.de>; Wed, 20 Aug 2025 01:34:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c65Xd5Dbyz2xcD;
	Wed, 20 Aug 2025 09:34:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755609455;
	cv=none; b=foaC0zfjHp0lFBsNEhZzyCV/WGedvoR6ZM+Sl8zM8AA60Jxsbt5Hx74C9omlRtaQvGRRAr0SDN/hGMpVCh1CetXElbPhwXdD3kZznN96ePi5OiIOKocu/Bo4MCQcIHsmorR9Z7BuOkh+jsQof/2faQMmulU5jrdjz91g7sI3LbMQbKy+PP5ukwJwr5XdozaxmPadf9n+ryUe6OwQHP+/v13/vo8M1EUMJG2fcRJI3iEp8+RtJ9g92bCd5pD1bo6Vo5cBhgRqyqoP8oO80iZojG8oxKd8k+zv+jxUKMpDISIHlK0t8GFuDrp1hbOKV/mGqmafZesWOA1VtMagLo0gpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755609455; c=relaxed/relaxed;
	bh=tjVYQ2o31Wt0s4oOjjNkfAKW5LnQMlnPA5bHJIPGLc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FAFhvB1RVcAZzlppZ6Uz6E2iBRL5lGyiihniugS8tb4J0mbdsxBbptFZz7OVXgh2Tu5T615t5M7QAnIs4FCsEEwAcq2ZSY+MUqA7/cJ9kTUucMEGCdl4c/aT9qx1uZS0M22D5bKpkMlqIUW/1KqhiLI1oWs62sllCf25MThuChle0NHCrykyGBHqSWWyCZRUqIBu13sZfDMPP9DZ9zz/33vb9jWH7IFyv+ix4ghrJ/6ovdwHOqc/qULb8QpIPyqUkDoFiGI+UfUUpeZ1NjEIaqngP0ZcOqIkYuc100dW7/ZpSqosfmT7sJoFyZFuCvX1GMMUelWH6cwCkCN9jQ/TJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fNM5Vl/x; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fNM5Vl/x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5qrG6SwLz3d4D
	for <openbmc@lists.ozlabs.org>; Tue, 19 Aug 2025 23:17:34 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-afcb72b3a1bso95778866b.0
        for <openbmc@lists.ozlabs.org>; Tue, 19 Aug 2025 06:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609452; x=1756214252; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjVYQ2o31Wt0s4oOjjNkfAKW5LnQMlnPA5bHJIPGLc4=;
        b=fNM5Vl/x1E438nbUoQoUYf5r0IA9K9sCSVuhMRtI1m2+f7CHeXjHf+mDlGRtqe4G/Z
         WCptolauh4K83F0VmQzE/IsuVMZrZZhTdQzr0OMjSlW2cHvhHTVgqSgTIlI+vI5p+Xrm
         YbWXZIJiA8yuL38gQDw3XLxwoNCgPgBb3RuvM6C681GXMCtIwMNgUNdkrZaSIKl1Ip6W
         2uC8RCYkJPUVGoT/ta8G3G2h385cMwyMj7fhnERy/S21GYOsaS2T04+y6v7qRF0/e+TP
         3MfjDrD37VnZw9PqwOhheQX4hmzvR9MgDlmOVmmQrzsYO5jbbL93DB1prVCL0HKTfX7x
         GtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609452; x=1756214252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjVYQ2o31Wt0s4oOjjNkfAKW5LnQMlnPA5bHJIPGLc4=;
        b=LUXp0xFVFaTy+k7jaD6Aq1xaXkv46BVgiSiediEwUDG9Ws3hr5pWXCvIng23VYM3Rp
         iUYyYjP+mHuDpLO4XlckLkXu01u8lXrneg978vMVlm+yRZ1eCJRc69iTGm34vSB9VePq
         sDSBJoSGGmosj8Tm5zNStBjoo3l+2Ymk5VA5FDVIFdEHRR/hcUS4MYKaxXESY9SiTrlc
         I8tc0l8uO/GSG8c5ltpSVF7q/+UTpCOYrqVF+OnF1bfysgXVJVAD1Bj7Foe6fSiePjXi
         o/K2bxT5pgPRrTCW/0tlerZPqe4vzEH5QX39uLNvUVHBlB6wjit6hxYIiBBiBlnLXLC3
         Bb7A==
X-Forwarded-Encrypted: i=1; AJvYcCULOVzl9VcIl4OEFJJndWeO0udpuN/g2F+sx3sWQL/agYK85B8VIkBPzhwHCZN+ZrIsIWC83FM5@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxp7TZcZRFIVyU0eflV5ihFa/SJwq7GngXvmqmTzWcUiykciNgg
	eOti6PCto3If1kAhsWsyRRolD3rVeY/Ty+5RT4sBXxEHjTRVXitGN3nmhiTFOCuSUi4=
X-Gm-Gg: ASbGncs0zi8ijPcn3yScu7gEdx6+5zr/5fy7juEtx1Ne0V9WvolZn6noTsgmMpFYlHE
	BPkwGHoFFUp6Uo1OGlrA0+oS+uvj8zNeEjG557aTZ6Eu0aZtATSsb46VO7skRnPuEHKTD9FUyKW
	hwQtNHQ/2CeDZ/wd0jFL0ypSpTgNDHwTiKcilIoWz2LtflZJk8rRyfnC+jjxMzEzDr4pVlsRM+1
	aQjvYVroUJINkGrAcpD3nxNVJ6Bqb3MId/yfrc6myrfslnqs+KWBEH+q79m4LBy9NQIrjmtgzEb
	Ei8irv/Iy1mnsCkBwtEhk3/y7wJBERQDyXkSmwy9ndLxx9cyBoOyi5MRV9VFgpZ6tr+JWPt8zk5
	0Q3Lfaw6/i/xaE3dd665NjF8C78zdTDY0/A==
X-Google-Smtp-Source: AGHT+IGoW2rMavDLleY2STVqCubc7jV6BzLT7Ex6A/gWPiyHTzPLsgNEsjpfXZkcM23dkCpRS0+YaA==
X-Received: by 2002:a17:906:7950:b0:ae6:c555:8dbb with SMTP id a640c23a62f3a-afddd27def9mr116015066b.11.1755609451918;
        Tue, 19 Aug 2025 06:17:31 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd04de2csm1023271666b.111.2025.08.19.06.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:17:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: nuvoton: npcm845: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:17:27 +0200
Message-ID: <20250819131725.86770-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819131725.86770-3-krzysztof.kozlowski@linaro.org>
References: <20250819131725.86770-3-krzysztof.kozlowski@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=732; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=vDIX409XkJoWw9Q6XgVBVMhCjeHRXaM9O04OkEsD7ag=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHlmHPW43qsndZo3KHocAJD3K9RxN0VwvFKuY
 FcidO2bRDiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5ZgAKCRDBN2bmhouD
 1yAID/9Zp9ZjjLEMERK+PNNsU/fhJ5xM51k/pOhnp6a3rynBxNPgKirR6cSJW22rzyYyq3v2Rkb
 ZwKEGppGpuH9q9kT+FBwqTc2CASiUj82lj8v9MNSz3fFvPYBWcpbSbW4E9Qg4zOat01+aoJZtew
 vTZgx27fLCcXiAUYkGweEx8oTGXbxY/ODGqA4kaiDcNssCyu7zcTc38/qzaEgEAJi+l6Mj7Ke34
 Fq8O6Ga8K58o9aKyykNscT/49ahwqaLJkNlAK9xz6fXQaynm0Gsn8heGRO5HGYARYMVlW5XtLpC
 +6P1k++buaOokb8X7kl3qixEDBbhV1Q7f4+mk5NVJKPzSJNf3rHdoQxVvXR/D1A9o/va/wcKnKr
 53lZ0O/cG4UUYVz7H/QdLJPtiJmOgrqqx1ucd9dj/f4Ll/iFAs6kZiXOTecwhh26tKpeeanYZF5
 v3WxzUFTe0zHnts6WfhtZUaYtUIR4+WLHw1xx+wPrATAc6et8TIgv0y7HgJCvrcuEY8pjs6GrTJ
 MRExR5A88CN9WC5HpiLPvpB6aLr91uUZoFwBBF0jwAcZXz2gdEXc99n3iYYc50OjUo518WTyFX/
 A9VhakKqLgkFpIWl7gwkyme8ZunKQv9fkT2Em7P/MxWo4LRsKBULQu78h11QUSg2mFjcgYWb5am Ti40YDF9tdn1vnA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
index 383938dcd3ce..8239d9a9f0d2 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
@@ -64,8 +64,8 @@ arm-pmu {
 	};
 
 	psci {
-		compatible      = "arm,psci-1.0";
-		method          = "smc";
+		compatible = "arm,psci-1.0";
+		method = "smc";
 	};
 
 	timer {
-- 
2.48.1


