Return-Path: <openbmc+bounces-608-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D73E4B501C3
	for <lists+openbmc@lfdr.de>; Tue,  9 Sep 2025 17:46:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLp804rN3z2yVP;
	Wed, 10 Sep 2025 01:46:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757432768;
	cv=none; b=oBwKGM+1T+4V8ZRE/6k9EJhASib4z4xW2knZj6MlKnqWjeQsk4NqZ7G76fTKlwkykJfENwU81+ZJEG5x/7DQ2c0Gu8USNcSn8u74W6jUfvJYn3gGU1KHzZo9cFuwjVsLG/plWNXYyARtb4dQRHIFDyNauh0XQKVe3/CJ73HpRRTj1jw6L/BsQY3L+UJSkLI+MLKkc3s26N4/vXnKJBXfuEIDFPqSP8lB7XoAVu/OETGw0I/C0ZoQzINAUkhXZk7nOQ8ViMPSD+PPRl0fcgfj1J/qQmiiVUELAi7j2wcOqQWV0jVFJKR5zVj4PCyY7w8/QYkzUxAsFIoJYOzRbIuSxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757432768; c=relaxed/relaxed;
	bh=uNQdE5yOZswVE6LCOBdtsDcL2XOY1LZAHNkE5x3LHnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MWQGlLN6fmbB654OCxnDZFC0v9mRSrnhGNzjoSP1wUrhb6ir+tfdfNutwuU8K0MSUA9GGstCqXpGlEetWrg6GmnTsXxKZh8gyDW4WTzedMUgUI91pbrcLbC+33RZWsbK11ZYf7gTVwQFV2MFD6ccrr+LhfraEfEcMOheWzkE84q/1/j87bP3PLexxxebDNZk7cKlWWDq96uk3MQcN5KjU5HKximjM6UjECGq1jsbvwXXLZtlotSFH9rcstURTovHR1+0V6XlQeZ266X9+4wrylNcrFMifoOM5oStjKQQ8NI1UHT2YkCiFEEycPbc2oTdKNe/6POmXKuDPN2vzQO3xw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ElkEyT+L; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ElkEyT+L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLp7y4Qvrz2ySY
	for <openbmc@lists.ozlabs.org>; Wed, 10 Sep 2025 01:46:05 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-24b1622788dso39883695ad.2
        for <openbmc@lists.ozlabs.org>; Tue, 09 Sep 2025 08:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757432761; x=1758037561; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=uNQdE5yOZswVE6LCOBdtsDcL2XOY1LZAHNkE5x3LHnI=;
        b=ElkEyT+L1j+5BQCYz+PcX2YUT/omuCK01SyjnDyz/AnLEUA35qhBdpLY4zgunYMY2W
         zcbDpFpeJYzMW4peOjRaA4975x4ssT8kzgu7u3D6t1XmpmrMlZ1mg9MMtjdmbsKtnl07
         PZZd4s9XAVy8wp1JDBTIbiBCkJADWZEt74nYSEB7/YGQ9IdC3pVzxnQM5j9c9Yx+78q6
         KQWZrpu93sAVaWyUc+DdRi4X3XIksV5AEdPAWd/cTyH15zjBG9jidm/hWMgiaVSONRn1
         31BlX64xu7vWz/7GAHbafTnVikmf+ItVaI+jOS9wT94h/HaYjw/981jrXvZLJYb1i/NA
         cztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757432761; x=1758037561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNQdE5yOZswVE6LCOBdtsDcL2XOY1LZAHNkE5x3LHnI=;
        b=fxxX/WEt3WgEKWky4NcEBtLoENKanSyFgMyPBK2Ia0tKfF8f2qRxgqlA0ZlcfBQgVr
         NjKgxNk5pUrSwp5LvrPbI6Nha5IH2e1E3Q+2jbB5o4OFAKeLRgfJNl3GAXP/lgOpcKBA
         HkwIje9iY5M1oJrAiVHhsqjc+8IiM28Fw6tdfH2eSySW+xRO+/CWAWXT9s6051rylmgo
         y5EeIqmbkQQ5vLg7Ao9toKIOAI++leLBCJ/Q9DaUkahQPNkyrH54sdLlrS9nOtG1j0q+
         54cSaIHNzqN3nrqaIo/swS5OD/B7DLgmWutw1QFzD31Rlyyy81opT/S93Emr/wONt4fz
         fMXg==
X-Gm-Message-State: AOJu0Yw3frT/dzq7eLgT0ChoKl0ZIE6BFGLWEqrsBXrwgm00j9rQI1zU
	WlYClaVcnfcTroETTNbvfIZz5h/UOr5GSPReZV7d2dZKmu/yitCFdp9c
X-Gm-Gg: ASbGnctHNe/QSeNYyrUoAf+xKnJu6KUguJjwq+nm0X00+haZt8N4bb7Tkho8/eVZg0h
	yWxpJYcm46/doJOWG2UZuNcivl/RxE+XkolHFhSJTWN2bOVFMdx/uA4kEsOwvCBJnTRcMsfgOwI
	WCfTiKYzG25Jz9zHpWflxxxslEKQAILENfN+TgFI6ymsZfGLLJAbxh9ET9rEpmnvIlD+mUh686p
	3xJTiSkuxNBd9S0tN0v6ta83TksbYyXjtfEYzf41x/vHVLu1FWJo7EG7WuZ7KMp6mw51IA1WkgM
	xzmCerQLhaXZAdCRevep9mEpRBzRmiLHHfpFvwzCuLDcM8U5I5GOSBmvYfE3nC4hbRu6EOxuc3c
	xBSwb0wBWo+RnFro2CEgffpQ6Z2TiyLdht6jt3BWty0SYIvFBYDpMqQn/ZqXqkJZUlsOQy5+jzn
	Wu0IaK0Q==
X-Google-Smtp-Source: AGHT+IHEDLcvBUxgy4It5qzR9ySfj35Jxho02ojFfBjGPyU0POXrSQw6ivP4uGSFnQuh/rPMRMmzJw==
X-Received: by 2002:a17:902:d2c2:b0:24d:3ae4:1175 with SMTP id d9443c01a7336-2516c895b06mr197733895ad.5.1757432761326;
        Tue, 09 Sep 2025 08:46:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a2ab0d88asm1270235ad.111.2025.09.09.08.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 08:46:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f03fead0-39c4-4d06-8934-bbc388d614fc@roeck-us.net>
Date: Tue, 9 Sep 2025 08:45:58 -0700
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: watchdog: Convert nuvoton,npcm-wdt to DT
 schema
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250909142201.3209482-1-robh@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250909142201.3209482-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 9/9/25 07:21, Rob Herring (Arm) wrote:
> Convert the Nuvoton watchdog binding to DT schema format. It's a
> straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>


