Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CF88B8323
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2024 01:48:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fFiKjkVZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTcNR4vnFz3cmg
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2024 09:48:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fFiKjkVZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=f.fainelli@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTYkP1rQHz3cV2
	for <openbmc@lists.ozlabs.org>; Wed,  1 May 2024 07:49:15 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ee12766586so229406b3a.0
        for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2024 14:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714513752; x=1715118552; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQ81DFkgmFb2qWSA0tT95p3yazTu3GOFFQ2uKG4zcqU=;
        b=fFiKjkVZRFHERnoiWQ7v/NVKp/DrRGn++PlQXSmI1Y32RRIVXsVqz6MYNpUmXn1M6X
         ty3Lkm7ZBPcInN95Seuxaac+Lsg/BWlhpP2Rf2tYmbYFfAfwXlMYooxJRN4uFlkOWWJ4
         31opfxMlCE8V7dia+slV/f5DhkdA6NnkrxObWu/LPgpGpcmSGzVSmrT9eGSO6TmKO3iA
         IHK+kg979u61H2FQz76Eqbr0K12PXipWQWMmZP0D1Qs68euln1ZzYxvKCthoNSwv8Ym6
         qNix9lns10r4fGCYFt5W80u+JAE8v9NNJAwDXVLhzr+FFJ5zfKc+Epb49zZ5eVTtlH9E
         fV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714513752; x=1715118552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQ81DFkgmFb2qWSA0tT95p3yazTu3GOFFQ2uKG4zcqU=;
        b=XZ0RDZUlWHYhfO3TP8I0ASPpr9/qRaxyY7mHlm/fKLgOooyuH9HhltkpxDcVvnH0c9
         i9mkXfpXedq//IYfG5p5loQdhA0xNuwCj37hnf0ObvmtOSmuzzH7nQzNG4bsILRLbkwR
         lTWW6jCc73r0fishi7tPa3MJJJ+BDIAneytOTedYoFjHdO8jxr4K3DXgIyAQs9NXl1Eq
         9weGYO2Pn/nd4Gb2nBn17RyUNIUijVK4J/oFHzIDU21r32v0kFF2STPGTzeXRDJ67+Dk
         EpOEwg/XzltZkjxmEr2GXTD4BJzW4pTWMSSVHStk5blkwF2wYasEM48rjPRbD4L0+T/6
         a1bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR7Ki/CXi569p/cmkbaxt5Yexg5/GaL/AybHEkTHKpUBoMahVqTaqetMfPzOdeznHJ/ffBNBR2i3MHR7+I/4t5mf+O9rui/5s=
X-Gm-Message-State: AOJu0YxV5qL7UF6d7Nex2PjCMrnI105f6J9BX6sCxxAY3+hVAeCYgfC4
	meN3hyf5PPh3srYAYSGZG6EbSMxE5Q6c+Qaf+1YNimYANTATfnUS
X-Google-Smtp-Source: AGHT+IHQGDfoheQSbpzkVLH56jhhZSeorElzvZNIjh/7FJfIYfrT1165Kn1yMHGcREJjEIUoAW8BJA==
X-Received: by 2002:a05:6a00:10c6:b0:6ea:f43b:b961 with SMTP id d6-20020a056a0010c600b006eaf43bb961mr5803046pfu.6.1714513752457;
        Tue, 30 Apr 2024 14:49:12 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id y5-20020a63fa05000000b005cf450e91d2sm21394224pgh.52.2024.04.30.14.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 14:49:11 -0700 (PDT)
Message-ID: <7d412e48-a58b-479d-9333-066359d52432@gmail.com>
Date: Tue, 30 Apr 2024 14:49:08 -0700
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
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240430191856.874600-2-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 01 May 2024 09:47:37 +1000
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

On 4/30/24 12:18, Rob Herring (Arm) wrote:
> '/memory' nodes always have a 'reg' property, and therefore should have
> a unit-address with just plain hex (i.e. no commas). Fix all the arm64
> '/memory' nodes.
> 
> It's possible that some bootloader depends on /memory (arm32 ATAG to DT
> code does for example). If so, the memory node should be commented with
> that requirement.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> SoC maintainers, please take this directly.
> 
> arm32 is much worse, but the platforms using ATAG to DT code can't be
> changed and I don't know which ones those are.
> 
>   arch/arm64/boot/dts/actions/s700-cubieboard7.dts       | 2 +-
>   arch/arm64/boot/dts/apm/apm-merlin.dts                 | 2 +-
>   arch/arm64/boot/dts/apm/apm-mustang.dts                | 2 +-
>   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts    | 2 +-
>   arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts    | 2 +-

For the above two:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

