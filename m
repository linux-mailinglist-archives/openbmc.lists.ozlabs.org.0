Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F371F8B92AC
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2024 02:06:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YZoAZXRa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVDkJ4Ydkz3cW3
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2024 10:06:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YZoAZXRa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=bryan.odonoghue@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTtx467XHz3bvJ
	for <openbmc@lists.ozlabs.org>; Wed,  1 May 2024 20:44:38 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-34db6a299b2so649466f8f.3
        for <openbmc@lists.ozlabs.org>; Wed, 01 May 2024 03:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714560273; x=1715165073; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SYmuLFK3BGv9NhdBLgDNFCQmHdP6DRQ3PI9eDeKznd4=;
        b=YZoAZXRa+WVjUg3vvlvopipU6/HuGd78+ciNSYRHx9cJfw3W5u4qjNwf4U9wGLrgRO
         DBJUIgO3xW2pRV6Z/HOHizZ3Iobd/DT3uPYE/JiDDBvsvjY7Z3U3VRXlqtL/gLt2tnMJ
         ZmUkhgleym3JcN8J53VG9URp0r8FqBUsaLJ+BeuvPQEHn69+zuKAxUE7aNc4VQ7lSTf/
         pveIi8EqMC7Bo0XKKhqSNmPRl3dT/oM95dbeB8M6ZGWZQakegI5mQe/Ga6lKNFRmmMre
         Y+P5tEIL8EjefO87WsQboc56qHyN/QmBhQguilxfOK/MmCjQQEbaNnLR2ABJPY5wCzis
         W9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714560273; x=1715165073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYmuLFK3BGv9NhdBLgDNFCQmHdP6DRQ3PI9eDeKznd4=;
        b=m8GgcvbF3QMmIJJ7VVEsG8vgZc5Mdbi3QJgseKLTDznVHVbG38Vs3RW2jZdxoxnd3Y
         Lr6+S2JuW70phCtlik7STH3MiCRaJqJ4ThYmbDttnzPOUh5kDV8ZuOnp9W7o5WnVdUZP
         /c8kb2M1d4TffXZ1Lm6ZGp4su+9gUHKZbcdQKXG0Qk+B61nL3bxhZNByw1kPiB0ouWe2
         CN0MlUj3QLcYsxSOfiU/S19NUGjRvy7tLZV7vRrGJvUSqBAXEjDJKLffR37SOWxQZK7n
         PXThGZkcfd5Ogu3PEvPSAHeYkGp8ThoZaWd7ekJiNFlz61bRH6ZN38VxDcujVeCfF7cy
         mt+w==
X-Forwarded-Encrypted: i=1; AJvYcCWHsHc6jlNs6TeGUubkZmQPPHiu1fuwKVZ1G2Qz44jp5quzXpbgjI4Jd+tbPgVqQhqNofSZJie1OZHXTLkyhjgODSlp0GKhQm8=
X-Gm-Message-State: AOJu0Yxmv2yfI+QNz39V5v9fHbHytq6SPBv3tdPtD4InQuOdwJkl4+6v
	OlCAsje+FrSp5mJGWWnYKjOt+YRDZDTR2h+NTF56rw9Md+v3O5oWb11/I62hf0E=
X-Google-Smtp-Source: AGHT+IGkxuY4dhK1o59E+WzYjdOhu0VVa0wkXzXcFXoTG3txAyFGqsjz9Wd91uyD57Er84He7gVn7w==
X-Received: by 2002:a05:6000:128a:b0:34c:c9dc:ccc5 with SMTP id f10-20020a056000128a00b0034cc9dcccc5mr1636807wrx.28.1714560272686;
        Wed, 01 May 2024 03:44:32 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id f1-20020a5d64c1000000b0034d24477662sm3562035wri.8.2024.05.01.03.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 03:44:32 -0700 (PDT)
Message-ID: <e4703eb2-dda5-41b1-bd47-8dd4d15dfb9f@linaro.org>
Date: Wed, 1 May 2024 11:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: Add/fix /memory node unit-addresses
To: "Rob Herring (Arm)" <robh@kernel.org>, soc@kernel.org,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Khuong Dinh <khuong@os.amperecomputing.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Robert Richter <rric@kernel.org>,
 Chanho Min <chanho.min@lge.com>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>
References: <20240430191856.874600-2-robh@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240430191856.874600-2-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 02 May 2024 10:06:05 +1000
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, openbmc@lists.ozlabs.org, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 30/04/2024 20:18, Rob Herring (Arm) wrote:
> +++ b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
> @@ -16,7 +16,7 @@ chosen {
>   		stdout-path = "serial0";
>   	};
>   
> -	memory {
> +	memory@40000000 {
>   		device_type = "memory";
>   		reg = <0x0 0x40000000 0x0 0x20000000>;
>   	};

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
