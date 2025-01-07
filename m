Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC3DA04C9A
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2025 23:46:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSR3H5WLgz3dRD
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2025 09:45:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736231794;
	cv=none; b=BYh4IrpizP9SaNGSLOpa955lJDJsiAPIGFpYXPbqsQRhvU7wAetTenPmuDDThXYw4hEWOdV8MgM3CGTWQbxVHEYxF0JT8AmiPVAeNRsqruluS5rcGfNMzxO9IuOx7yt5skST3fRqf1rZaJR2BWIthSS1qpX9LzlP1QcIxHKG6LoG1VPGS41C7+4gvXJym86U/dNGqVSjcCCCZYRGIoTl0pz6VSN23GF6iIMzpeLuYlKdASDKsXf4EGdxJDtJFle+llKhLoFdSMzBJA2teuI6PxlwZ4GR9EQYic4NEyF0zHQokjOTQiqK/oDQYMS2AAhHRVGcoxeQY1ekaXe0YmHEkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736231794; c=relaxed/relaxed;
	bh=Kng/mpbUzhaJx0h/7Fasw6w2qS0oY3rIDnnEx7pNUzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YhzeOdO14J7nIQBaMxKG5fBBl8c17ByS4vi4WfkqhQ7i0fxCCKkQWuiwI1xC8Z79QLBcrPfT27QJbaRiWHduGvGnTPNzz+xxpOSr/rW3L37YpfJYj8KWrZqnSlqPwDL4CbsYDDHkRSD05IlrGSx8ezeTFCvlWQgTS4qQLxH8wv5QDCXofHPredey0+4Qq2UJNx7yTgF+cP2yVAyqHaAunWYsO3vQjUCRMlUTQ+67SCa4Gcw/Rq2HcVSha2bzRx8L94xML1Y5i0FHFZvSFuUvTxTBKioYeuoOe1SU3mKfBxzgOGyDc1V4B0blme0C6jISF8b4FVPb67NNtf0Rae4Ugg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NaVEHR/W; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NaVEHR/W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YS1Xw65MTz2yD5
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2025 17:36:31 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-215770613dbso164083095ad.2
        for <openbmc@lists.ozlabs.org>; Mon, 06 Jan 2025 22:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736231786; x=1736836586; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kng/mpbUzhaJx0h/7Fasw6w2qS0oY3rIDnnEx7pNUzQ=;
        b=NaVEHR/WHAs8SpU4Vae+VQ5LG2Y/bg//7wSAL/ggCWNMb+nfg9z4j26VsQhOXUK+lE
         /ig3s+Rb8+abdxErv9iZRf5m3zAsY+gCJCLVOn1Fu6iXvC7kUTQdcAJepANop0qUbiCV
         KhwNTieL+JqgFvh+uQi4DnXSn42ZvWVGxQnn9/qXpCvaiP0Dqw7opQpso21R9Sxv5boM
         i3WMK17m/FI5R7WU/kPq1i4YJXdoBQwyWwDLT1B7QyJHwLWTVB7qnb7JfUrssguZ7rWZ
         g3Kx7/R4ZJTbil7sUmzJKOFO+8dukRn6ahCrt47peV9R2CqDZtoR0RoITNsQxc8eOuVn
         3TOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736231786; x=1736836586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kng/mpbUzhaJx0h/7Fasw6w2qS0oY3rIDnnEx7pNUzQ=;
        b=j1hoN2cH/vcyUAJOIFprPwX3tcSMecBZbbjBqtIAUXoByM4ySAw66obsDFAvRyPWS7
         +QNQ3zpRR/6GFyCzxK91egUAJHYE37QEFck+/AokPXrhmeMSpLeot2fB2azn26nbwzk5
         USm1oKKbmYflC11CohwqaVHi7Fa2MYJetbMgb/szBgd/EpwIz0JeYMSGhuUy9j5TW9w0
         1cvBQ00qBF0ZsvYa9ImeOHnwyMDEjMHRdjr1RaA5Ces05cqQ0JQx+85J7zkO6x6Rysui
         wYNiNNiu9AOKa5AQCbPDhq5TIkPTg2/0sqQ61yGMYz1FBtTa4wOoP2YLq0mGEgv4azqU
         k7AA==
X-Forwarded-Encrypted: i=1; AJvYcCW1U+IgXugaJ2HpEvT9a0iD6WQXwykMOlm2Cx827gfdvmGBSexbgvbdZCrB61nrHHhf7igGA3fw@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzzptunIiAQ+2QjShHJK+HHyYRTCCIDIqXhQ2S0OtpYY5JL0ICo
	uzNAGhG0PbiJeMXV/8dEbgY9DlHy+eR2OeUwhk8BUVGbBfl4VpgF
X-Gm-Gg: ASbGnct40pCxs1jolek1k00F4rVC7LSmnCP+6QK9oF6sop2zMj2bPULEIMGCnPV2qYc
	0S3A69knTI6W7I8i2oCFYeZVQQK1Ns04P8CfgWsFPpH299dQY3m+E++D8a5LUUP5XRO1JqF7yrn
	mnHdJQ7dNKWyVurnaRkiGSNjYrtne3EPxMuWeaECNKApdITAk6RYOCgDW0IX1HXDfYcBiIEmCw7
	vZhDbbubZpwLcVbwlVIdHWGaLHkN3E3zKdndthhwyMq2i3uGCSKbDBH+8IgHA+eQHLcvECUTacb
	/TK9oJzHRFyQxBe0uD4WH/M5GheTDSYIFMU=
X-Google-Smtp-Source: AGHT+IFB3swUN2iLMUEOpHvMus0FiubXQryQDXtAgLSPcX+ECwaEuxj3DZQ/Bf/+X66C3yI9GBLI7g==
X-Received: by 2002:a17:903:94e:b0:212:68e2:6c81 with SMTP id d9443c01a7336-219e6ea0223mr977864255ad.24.1736231785959;
        Mon, 06 Jan 2025 22:36:25 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a739b423fsm23758445ad.198.2025.01.06.22.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 22:36:25 -0800 (PST)
Message-ID: <83c11616-ac3a-48b8-a513-ca000ff9d48e@gmail.com>
Date: Tue, 7 Jan 2025 14:36:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 1/3] dt-bindings: net: nuvoton: Add schema for
 Nuvoton MA35 family GMAC
To: "Rob Herring (Arm)" <robh@kernel.org>
References: <20250103063241.2306312-1-a0987203069@gmail.com>
 <20250103063241.2306312-2-a0987203069@gmail.com>
 <173592330334.2414402.4730979254460270593.robh@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <173592330334.2414402.4730979254460270593.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 08 Jan 2025 09:45:42 +1100
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
Cc: richardcochran@gmail.com, devicetree@vger.kernel.org, ychuang3@nuvoton.com, yclu4@nuvoton.com, davem@davemloft.net, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com, conor+dt@kernel.org, mcoquelin.stm32@gmail.com, kuba@kernel.org, schung@nuvoton.com, peppe.cavallaro@st.com, krzk+dt@kernel.org, pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


Rob Herring (Arm) 於 1/4/2025 12:55 AM 寫道:
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches*only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.

Got it. Thank you for the reminder.🙂

Joey

