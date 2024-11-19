Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A48049D30AC
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2024 23:49:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtKSF3bmnz3c7q
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2024 09:49:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732010904;
	cv=none; b=jcPwAdHGJto13Ir73f1Af+1/Q0BhcQuKYimgq5DL+RMyDJOxRo4uDVAN2LMBRQOmQoL1VNSB9YdVz93vIJR2qzFCLiwUMGJtVc+EUFany5PZhyxPO7bXKIqZ6xRLhwhRfbFdt4pbikz6tyaJgZW/8/H2sV8C3sJQRQ1oVCY3L3a7obfZTZWWgq6BMeL10CyvOxt4Lo0K+rgublbA7560c4+CtG2c+hO4XVaTtD2wUrIDeIZiJGsZfkk5GYY0A/sJGREHOdlpkdDsS1FcBcPLcRJeytMMByChvALOFRxtkRMXBS5FI6wkaUzV2ag9mABWrjCYzt4YF2If8fOy7dWsaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732010904; c=relaxed/relaxed;
	bh=cWTYfL2NcNvtJ7hT2DfleWj2jSJLFnsNcjBnW0uewCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VIkoGA2uOAkjGCkzSt5PKkml9Q0zhlyaC/tFPFlXsDvgXaWD+IQArfj2OGTZQ3LiJnbUNDT7IhkznKxNuOcAYTr/1LL574QtQOP4i0x7vyrbg008oKktniux9pmEzvmrukXmSgXqgtLaFTBXSHBdUwwKUHg2tjIPBvUdQKb22D7O3aEzA8D2vlY4n3ESw+AlOKeXN1k+rK/3iEOHcd9HeK+M/9hkTB0vMIgB/oUR0e2raU8VXpYXlWrSMpeAVC2I6mDZwT1a+GtLcMMcHdnRCPiE0RRsWPUZiZNfs45zzFdLVlOAC/p5Ns7TA2jQGCvvqvPiESvMj91v4Lz8TtjAxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C29N1NRZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C29N1NRZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xt0Z00lb1z2yMb
	for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2024 21:08:23 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20c9978a221so6659125ad.1
        for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2024 02:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732010901; x=1732615701; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cWTYfL2NcNvtJ7hT2DfleWj2jSJLFnsNcjBnW0uewCg=;
        b=C29N1NRZehc8F9J2EMfne9W4UD2tylMxX/B9iT/Uw3IOOaCpDFKNJJaWwLKuUlbnPh
         K/w+a/HctLl2mvvixD9r5/SJdH4BG1okr5KMFRfkg9MYVTCsY+EvJXRDfc3DxMP0RZNT
         QtPVRendS3GpX0s3dMVTMgnexC5p1M+W8cDflCsx/pCHBrD971nJuDG7F5fySFhEF5av
         ONU3OTORZVfMi20WEcZXsUR2/XaOdWINh9M3Azg2GzDaU/z74ZanzgPXGMmX/0oQyhiO
         c5YXKScyRTObs2I/NX7hAKc8kq2ihPxoePBkiphTPYJqRBOxKA96xo4qvgnH6NklllXX
         8iqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732010901; x=1732615701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cWTYfL2NcNvtJ7hT2DfleWj2jSJLFnsNcjBnW0uewCg=;
        b=esy4998vu4/FDDztPKEwhRDUJQhlQLHLyYOUdsF3fpnGZGboaPeN6xcZd6wn2yGvBn
         +H8ydFw+jqFIa+Sx/SgXUNdHMYWG6mNru8HmK8w3o+BT0ebvIeqKzIK78YEWsMpRCkru
         8Kp92sByDo7uKmqSYonW3VzfZrv62FoNT3QycjJHQp7JxIz0khCrwlQ3wNMwWfFsjVoZ
         WBGd+BBdaMGnM5cK06af+2UWW9J5A3tfDhe+sGU7NSIInW3tOCnjtexpmAd+YRlOa569
         MAunqZwDUO76CcwMxxEOHdaU8G+lV42WcOY42MeSin5UfpzlF6cStO7NQxQsENOOQtNc
         K9sA==
X-Forwarded-Encrypted: i=1; AJvYcCUpF3USKumbE02IRJB3GT4k3JrviIADDAeZO5HpAozK1BT3ofVuh1sX801Hi0y3xvQpln8kyuaq@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyBjuXiwYm7nJAx94buebg+MrKgd+lX595s4+Y8YM/HlUXpzQaZ
	q97J9rwlZu1kDM7y2smmcZEMV2q8uFrpDkwNeq94glDkMDqEODzV
X-Google-Smtp-Source: AGHT+IEAjyQGdRHNm7PwkX2khYpceIhQ92EAPL/Ia7j4slTtR5ja4Ryry5i8z7VVQ8n6txgqIQJr+w==
X-Received: by 2002:a17:903:1d1:b0:20c:9983:27ae with SMTP id d9443c01a7336-211d0ecdac7mr237798475ad.48.1732010900702;
        Tue, 19 Nov 2024 02:08:20 -0800 (PST)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2120ac39585sm41966965ad.261.2024.11.19.02.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 02:08:20 -0800 (PST)
Message-ID: <191ebf4b-231d-4ebc-9ff2-4916ef718970@gmail.com>
Date: Tue, 19 Nov 2024 18:08:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
To: Andrew Lunn <andrew@lunn.ch>
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-4-a0987203069@gmail.com>
 <4d44bc93-6a81-4dc8-9f22-a103882f25e1@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <4d44bc93-6a81-4dc8-9f22-a103882f25e1@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 20 Nov 2024 09:49:30 +1100
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
Cc: ychuang3@nuvoton.com, edumazet@google.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, richardcochran@gmail.com, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


Andrew Lunn 於 11/19/2024 9:48 AM 寫道:
>> +	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
>> +		tx_delay = 0; /* Default value is 0 */
>> +	} else {
>> +		if (arg <= 2000) {
>> +			tx_delay = (arg == 2000) ? 0xF : (arg / PATH_DELAY_DEC);
>> +			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay);
> The device tree binding says:
>
> +  tx-internal-delay-ps:
> +    enum: [0, 2000]
>
>
> So only two values are allowed. Yet the C code is
>
> arg / PATH_DELAY_DEC
>
> which seems to allow 16 values?
>
> Please make this consistent.
>
>
>      Andrew

Oops. That was my misuse; I will change it to minimum and maximum.

Thanks!

BR,

Joey

>
> ---
> pw-bot: cr
