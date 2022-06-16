Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1808A550165
	for <lists+openbmc@lfdr.de>; Sat, 18 Jun 2022 02:34:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPxk36Pv3z3bvd
	for <lists+openbmc@lfdr.de>; Sat, 18 Jun 2022 10:34:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NgrhyL1P;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NgrhyL1P;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPDlP4tnSz3bkw
	for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2022 06:48:01 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id x138so2453209pfc.12
        for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 13:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DSrnqAFWoF8mM4JPrtGHlUHqt2gHTlKj7WZsyQLOO9Y=;
        b=NgrhyL1PF0ArhJm3ZhmdVUCh7jC1G5NtECPB4odxnvf36oIlo9JvJxiwHUOikYnGez
         OZfYmHP8lBAcxmsCX8JHuOyz2fSjl1a/gbp4YZzz+fcUUxozbYkaHcm7iUjUMyYs77nh
         ptLlGDzrt0KJ9WVl/mJX/KRi7YLkikhaZtxY+3sl1xUw2weLKkSzVSatDZF5srb6gVTj
         L5hynDAGPpaDVarNiOTx00gFaJHpnxyj1Emh3ipGEdzu6G8DIds4TxAMyRLtQbJK+8Xs
         QojnrCRX9V5dwo1ThTzJ8xEXXmh97WnM6DDJmGcEmlfmtIgfZJ4X7Hse164v7gPkCfv9
         V2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DSrnqAFWoF8mM4JPrtGHlUHqt2gHTlKj7WZsyQLOO9Y=;
        b=ZzVwjLVhzqNp0VkkWH5sMNOw35+BDENNbvYYGNcKjMt+4C2S/gSDdFVJkrCT/WXvAN
         uRG/AmBI0zncmoRgTnBYwQ4DYWgC9Pf+nQxgfIR96y+qf/oWtrv0kelyfTETobySIIjs
         slTEoXFB/z05vxQpz0XyLfvZ/U6LhzEwFRWQPmjshmYsEtYYny/DI5SEJUIpzPOwXrTB
         FAvIb44AQP5Vt8yMhQO+QfZ1apqA5aQ3x38Hc0aG9R6unG6L1m34XkwHDjGvlO6JS3lc
         Ka1xc0unAgTYV+/R1lKRjULu0lmCAKdSN0z+NRP9DTTvhaOVB47kbP8zxmiDawqrJbAc
         mqig==
X-Gm-Message-State: AJIora8jdiWaTInzZSD817Q5oiXBTc3D7qnFTajsYEZ6O6lky4uXk8vM
	rSC2LkID9w1vzWod2zCyQvov6g==
X-Google-Smtp-Source: AGRyM1s3VZTZrltd4/YYrXxaN7XSMklshqxOTInsXy0XAwRNWsYt3C+nUfHUDZDFdXfzDYBLQBwVzQ==
X-Received: by 2002:a05:6a00:14c8:b0:51c:29fb:7b2 with SMTP id w8-20020a056a0014c800b0051c29fb07b2mr6611600pfu.24.1655412479376;
        Thu, 16 Jun 2022 13:47:59 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id 203-20020a6218d4000000b0051ba0ee30cbsm2165453pfy.128.2022.06.16.13.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 13:47:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Nancy Yuen <yuenn@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	openbmc@lists.ozlabs.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	linux-kernel@vger.kernel.org,
	Benjamin Fair <benjaminfair@google.com>,
	Patrick Venture <venture@google.com>,
	Tali Perry <tali.perry1@gmail.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: nuvoton: adjust whitespace around '='
Date: Thu, 16 Jun 2022 13:47:20 -0700
Message-Id: <165541242280.9040.13557968338799812389.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526203724.831215-1-krzysztof.kozlowski@linaro.org>
References: <20220526203724.831215-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 18 Jun 2022 10:31:55 +1000
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

On Thu, 26 May 2022 22:37:24 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[1/1] ARM: dts: nuvoton: adjust whitespace around '='
      https://git.kernel.org/krzk/linux/c/f30528c6b08a4e4b8e6a36ef10c1e7bc918bf6f0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
