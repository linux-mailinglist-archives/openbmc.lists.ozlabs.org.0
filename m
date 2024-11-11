Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D909C43B4
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2024 18:33:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnGqh2bHjz3bcX
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2024 04:33:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::229"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731346429;
	cv=none; b=ORA5M3uIYh089wCYiOv3fElgUcl0fatzbe73MfsqUWR8mdHmwaUvsA7+2+oSKoO4lpN0kvEFUu4HIf+eyc4B5BgxAsxqRZ6xiNnFhGrhoiqcRPU+Lz2G5PXXI/jQzNy3aaNqzjuB6ON4RRr3v6wmXL/qhCpSUZoz7KyHXYHCsegu155WWK58jIXPd6OPtYG4Vzh5HdiWMmZC89dotFRx60bTRFip4a0Aj3f+6udxWMSUzEhYseLRq6OtjIy+GRlCohYKurc8q6VKKgVJIatRahFE8sF/XRXa3hb0bHlenoU+EgNozqXSZL2afAHDRuRJTr82HXJjrCsPh3ZIV39mpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731346429; c=relaxed/relaxed;
	bh=k549qmcvy09asRIn2vFJCBpRahdHG41d4G0BzvgfmiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=T9W0cHu4Iyu2HKCI12Bjpo6mK5x+6JEs0GSMqyoOBpStkUGWj073Ur24Zwlw9XOfEnoa5LKtJ/J27CXUFC3m0J4lx1vdFKrgJAWZrA6z+Yhy4bbubDHmwVXU97xZCEZ4i3QfGchfORKIiURmAIoGmu4pG80t5wbgdn3Ho5p8qwUXKETScsQ8j4ucv3vnIzuTXRp5MbJPw3XRBLL/oCX2IkjHkZIV9OFpn9BcTW7PHBukopAcbGSL6GXv442NMWYTGml12Z07bAx+NEuqb7luDujErAHfiGMe8w58T9jDVZ2t6RG+N+cAHAkaBTFxX1Ik4xre2zBZRr+w8ClZ+XXjEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h8IzEyHA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h8IzEyHA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnGqc1PT5z2xGQ
	for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2024 04:33:47 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3e600add5dcso2226914b6e.2
        for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2024 09:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731346425; x=1731951225; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k549qmcvy09asRIn2vFJCBpRahdHG41d4G0BzvgfmiQ=;
        b=h8IzEyHA+nkBM9jWW5I30HWdFOf0/HYG/H/LWrPxbcNo8o9aQjrZmo3mB+7R4n4Afv
         jhB5WTf7liAY9j6OwtZuOwysVf2clT34ARcg3X8o0tg7KhqXb2I7Y0w2r4JhZnHg413i
         lPPD7RulRebT5hPeZHT+APWi516veI08aWD30N4D2sx6Ip4pFLp/77km0b3adgrvMxfo
         AEyXnDY4Cox7m8ygT6vHAWMUzlCW9gegRqzWfNfzibNDkwD5ggSHlQ3pqEUB2RReJs2F
         Q2onjKTBvuRmqd7fSImsFV+p9JiUwtuMXy86GlPRNsHsKZwNUeLuV6bWgUTR1VUgLB/R
         Xx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731346425; x=1731951225;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k549qmcvy09asRIn2vFJCBpRahdHG41d4G0BzvgfmiQ=;
        b=eTxRIgEEP/zX5+8PaVKPlxRS6Z+/irKt2Vbc8l4re3ZYxnBOmWhFrfWg5kOriFaMcI
         aCuVcKHcWAe4231kSzJO/t1+XJwwPsvvk1WsNGoGIPIbMTr358OYX7kgEiUMcCnfph0K
         WcJuQh95j+80zOoxU7MTIPzmysSs+qXsvdqVUCwD7fnAhh7rzlgyX6VbiUiSHnQthIzg
         GFeykpBEjnDZ2/Fh0aEdUPa1wogdZ6SeUiLIJCXF9OCLcKOX1LROL04AwpL0utepP7Uk
         f7LeGCqR5mwUhgUYjlapsabiCdfIWyIMFgnO/4GPUzW/mL9I2jSKo2IyD5ARoC5M/u1l
         VD1g==
X-Gm-Message-State: AOJu0YwpzQFuZdCZTj28zuLMUo6xecUExS3GOw+jePLWQvjvdFb2jDDy
	zwd76etfDkqnpGbo6tG+q7mZ5o4AsVnOu/MAhOlo3cLZE70aLVfa
X-Google-Smtp-Source: AGHT+IH0t7J4go85sgyNee8SdD6Hdlf5cZLtSU0DHVV3dTjKNSd41BbtBpARWw5j+viP7rNEQU0ddA==
X-Received: by 2002:a05:6808:21a7:b0:3e6:3777:76a7 with SMTP id 5614622812f47-3e7946af87cmr10839939b6e.23.1731346424588;
        Mon, 11 Nov 2024 09:33:44 -0800 (PST)
Received: from ?IPV6:2605:a601:aa57:7500:c5da:8ec9:bee9:a72c? ([2605:a601:aa57:7500:c5da:8ec9:bee9:a72c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e78cc6795esm2173831b6e.8.2024.11.11.09.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 09:33:44 -0800 (PST)
Message-ID: <c4fab55c-67f8-43be-ba7f-5f7b54923e78@gmail.com>
Date: Mon, 11 Nov 2024 11:33:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Gerrit Account Merge
To: elbadrym@google.com
References: <CAOO6b=ub=zw4Tu4PM3NbSsqNb=hz_pxLAxTCwqqJjCr2jQ8ENA@mail.gmail.com>
Content-Language: en-US
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <CAOO6b=ub=zw4Tu4PM3NbSsqNb=hz_pxLAxTCwqqJjCr2jQ8ENA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "'openbmc@lists.ozlabs.org'" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 11/1/2024 3:29 PM, Mo Elbadry wrote:
> Hi,
>
> I just noticed that when I changed my github username openbmc gerrit 
> created a different account for me and I cannot access the old account 
> which is tied to my Google email.
>
> If I may ask, is it possible to help fix this? I don't mind losing the 
> old account but need the Google email free so I can tie it to the new 
> github username.

Ok, your email has been removed from melbadry97. See if you can add it 
to your new account now.

Gerrit doesn't provide a way to delete accounts (in our current version).

