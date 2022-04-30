Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD0E5168AD
	for <lists+openbmc@lfdr.de>; Mon,  2 May 2022 00:36:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ks1LC6fWvz3bYZ
	for <lists+openbmc@lfdr.de>; Mon,  2 May 2022 08:36:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gbvxq1yY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::634;
 helo=mail-ej1-x634.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gbvxq1yY; dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kr6qJ5K5Wz2yXM
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2022 21:40:26 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id gh6so19940270ejb.0
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2022 04:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=37IZKYMhQSNg4t1jdanquzuzImuToF3uqBKV1QSoGwI=;
 b=gbvxq1yYiDoaisR85HzGtsvG7lGu9kbT8uLnZc8etRsQliGN5hvvP+tVA0tkb2fVso
 D5Z3vc/E5WLiSJt27kDTmCO+8KInOv+AqKmsNNf/gWVeis0TkxZecBRAvBjlhZ34a6qt
 vFwkAST2rq/LeFg/BAL/BDe4eF9EGj+ayZ9Uu0ioZO1uJTV94qhriMOGRyiEuHYgelrO
 47GZ+MNiVyN/yfs0lsGzkQ2HzQpwwCDshS87c7y4vZnAeN2Oa0OjmiDdUCgPeHzGMbIp
 ft9lG6rMfHrKpoQ1dkZdH/DXpCb0qChFEk5iDCRFINXhF1CCNDiyvgKtYAyX0y9Xk8Ry
 qhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=37IZKYMhQSNg4t1jdanquzuzImuToF3uqBKV1QSoGwI=;
 b=6y3hE4ZgEepFdKcdB6Uz/fz6oP6goKg3jbXvecc80WX/NcpUVYb4N9Avs7qEnYpVuM
 ow4oRS2VoevQaCpUIFqGwpGSOwTsaoek18ieI9IfXYWADugO1vl4iECdAOtFL4TTueoD
 knYBo7C81w2gEXaHGRjMJp6rGvEL6O5HoLe3MRQ4tSuvEGSuNpvun+Up55scguIsZ6bE
 b13S5qdtojd5qzVcRNq7Hk3G7py/xJlRaC9psufMVKvOd8B+d1RYQz81LCVWroR0Vp2d
 dYFvAJG0LDRhel3vxt2t1cN3FBWZH4eW7ZYuf1g5MOPTHEr9aumndHn/39kZbXW2ebkq
 dj1A==
X-Gm-Message-State: AOAM530Hk6TPAW/l7bDfyqN7ODbHBRR+hzU1iwVcaYyIAEkYRdLWBvQw
 oaSbrM+HwzsJVU7Ib/P3VRrhGQ==
X-Google-Smtp-Source: ABdhPJxqvU+aueMbCCnCL1KZngADRZdQAAqgBioEW7uSV5Ga8AA/zvEd5BhlYdaXnzQ+KVNnCL5TCw==
X-Received: by 2002:a17:907:1b1c:b0:6f0:10e2:7a9b with SMTP id
 mp28-20020a1709071b1c00b006f010e27a9bmr3662004ejc.58.1651318819017; 
 Sat, 30 Apr 2022 04:40:19 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 eo9-20020a1709069b0900b006f3ef214e02sm1536835ejc.104.2022.04.30.04.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 04:40:18 -0700 (PDT)
Message-ID: <b5c2c497-c053-5d74-823b-73ad3e709ee4@linaro.org>
Date: Sat, 30 Apr 2022 13:40:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 02/11] arch: arm: configs: multi_v7_defconfig
Content-Language: en-US
To: "Hawkins, Nick" <nick.hawkins@hpe.com>,
 "Verdun, Jean-Marie" <verdun@hpe.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <20220421192132.109954-1-nick.hawkins@hpe.com>
 <20220421192132.109954-3-nick.hawkins@hpe.com>
 <b5a549c0-c3f8-3c39-c4ca-a960fb748814@linaro.org>
 <PH0PR84MB1718FC5AC7FFF0D5509337A888FC9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <PH0PR84MB1718FC5AC7FFF0D5509337A888FC9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 02 May 2022 08:36:31 +1000
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
Cc: Russell King <linux@armlinux.org.uk>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 29/04/2022 22:34, Hawkins, Nick wrote:
> I have moved CONFIG_GXP_WATCHDOG between CONFIG_PM8916_WATCHDOG=m and CONFIG_BCM47XX_WDT=y. How do I run savedefconfig to make sure it is in the right place for this file?

make savedefconfig

Best regards,
Krzysztof
