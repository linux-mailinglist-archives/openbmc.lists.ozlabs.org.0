Return-Path: <openbmc+bounces-1190-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED0AD218B2
	for <lists+openbmc@lfdr.de>; Wed, 14 Jan 2026 23:21:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds0vq6YCRz309C;
	Thu, 15 Jan 2026 09:21:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768406477;
	cv=none; b=WRjlmWjz6/g6M0jMhJJrVrydD91P5PDycYfEs+Cox0eCMBgCn19qQ5g98qDB4PI56qSpqSXdy0mSFPSwPc3YZu7mHRVZQ8bUlwbcoFYAd49g0JwRfAIgBwkbu9IWwZCjdCFRMJrqIwpB0kfzfuZGJLrDKnrqqWhTpV1e7XvQdu/Bl1doi9xAbm56QTrv7W4apZZEcisDlPMKEMmwEOlcWqV7l+pYZfSe+Ik5QN92zKw9EA0zzRWsxJdZxvfRyw82BnxWKm+Dc8QeqJSaT7uTC2mKrqvE2x+p9/xj2CIM0sUnxd/ASZAkq8zAFHahUUDCiDltLwHVxv4V54PlLTjajg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768406477; c=relaxed/relaxed;
	bh=cDXaKw7hU4Ou74YOJlJoM7UHcKL9JB8/v6f4qXkRkDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cr0HMr9BpxkhF6hJ7tI6jRNYSyvPKr8NNzX/CXRootEPF+e9BAycI4nz7jgdRgYHABUJV0qITEjNfD8S1msURu6Rcjd7/9kLvEDBUMA6pIglHR2yYxJ0h64gzZD8M5xAkv603eJGRj/XVKOXVFTtjIDd4IZ2xbX7ydwmYomjGl6AB1+srhiXD9Z6GMRooRN7/UfE3W7ujd1rnJR6t9GNxUpW6cwLnz2la4iWNejp+q/aOMLQbIEYoZx4uAP9SMKnjhDFov7c2EMVhgRMWX1oa5Yt1he6ZaS535pqwvTz79MePEIN6V/MfbLGnoJa/sFje3Dp3r6Iwe6JTbGM/huflA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e6HvS/yl; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q2GCoRrA; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e6HvS/yl;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q2GCoRrA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drrSr6tlkz2xNT
	for <openbmc@lists.ozlabs.org>; Thu, 15 Jan 2026 03:01:16 +1100 (AEDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EE4ibK2081596
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 16:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cDXaKw7hU4Ou74YOJlJoM7UHcKL9JB8/v6f4qXkRkDY=; b=e6HvS/ylOeFmZz5r
	XCDj5Ie8I3H7HusyR9aeIzvngDginwvwvTiFEwfNcPji7TAtMCB7gTNXu9qQXf9t
	NhfLvvrpkmLP9eyes3lXKLER3c/SF5IMcFNud1eVoj8N1D9fB+qwgI2RNvJLrYPI
	aNVNT/U7s8Wv1mpIHgf7key2oXWWBXAqWji6+pbDnqxcSlreyhFIzOPyqX73YqOh
	qPGjDx8zlAUfNiphtt0GXne6VQ8ASN6nSrmaMFFJjwrqvrLouZWwkz5nIZUmA+ez
	3rSEqppcwctupx+ovw1Cemm7QLBh6h16EiPmb3r74DraqtXQ4fg00ncO8npZE/td
	DSJang==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58v3eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 16:01:09 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ec86f86afbso6179896137.0
        for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 08:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768406469; x=1769011269; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cDXaKw7hU4Ou74YOJlJoM7UHcKL9JB8/v6f4qXkRkDY=;
        b=Q2GCoRrAn7z1Pzrr6Wm912MUadzpTxqdcGOHK1XXOB1MHOZSv1UbBAUowafir4HXxz
         BG2jNYOXkO8fvPm2AYdO1AGCnlOgRiKXGbd0MekWUwA5YEaOWSic/9VJ+H8n0kzExz4i
         ON6v004exydVdzWHsM7WS38kPNbgTIDqT1WFHcW0BX0uE/KIiua08YZgORpbN4AdAyV+
         XKdpxiEkZu0N8llf7cvtORViruQU0v2Fl1Htf8J6ud9iXgbSRFo+Y5+DXBcoCnzFFqt6
         frE6DNkcJqLAvKzQhrW8GbL5r45ZSSQqovHrPjR3U8ODOOhh56LNGM3yN0HqkSbgeCA8
         0Zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406469; x=1769011269;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDXaKw7hU4Ou74YOJlJoM7UHcKL9JB8/v6f4qXkRkDY=;
        b=inBO1EQRYvXsDHrAFaq5c7tTH1Go9R5KH+/3ULH73BKbfcBjz3qji6Tv0miuBlKJKT
         DkiEK5wu2OmwA4J8PA5i6Krh5BR4gNqJe3VN7jmQXjmaVJBXFvabgLSHkyiTgZ6bo5fQ
         eA2zgNjWmR/3s+CLGXrCCsh9NMXZZCKn/Lxj+zIRQ63t6QcpK1MPhlcVt37sE2dpLtoI
         G59mwRYTNcfVjom+QeUhsEsl6ZyTDW9BK5lP0wqXEbmtAxVMcWoubTxjcg5gZ8wXo9fW
         3/UzncePNwLqliZAluBPCUdg7LKDYP5MvUFJXDdfAfmQc7Qb58Aw7PGYVVGGm5QnMrEE
         YKNw==
X-Forwarded-Encrypted: i=1; AJvYcCW6VF0gBgEFcvQ6vz5OdCNMmTDg5/T2R/v+nPuQOkycfOTcAPq39TAxVtahyFOTaqem7qXbAYKp@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx7zvGxXzl5XV2t9AmcpgFI+QaF+H4MKcIQRZr9S4RpGXgj9shq
	D2w6tu+bSWyd+pdUqJpuJCbBRYNKgl3Yl/AA2O4sJIUMo/obvC3OTmf0PAd40LDaY/Sng7q5EVG
	WSWJCFIAAseeZSmzsEydeIhBJJ4LrlCOSOYEBIJ/knqlIIHmvAn6SG0fkuBv5EQ==
X-Gm-Gg: AY/fxX4oicosZMrrTKMVq93wKzSopkWptOVn+nIlW+EyTHj/VjyyRnrVGp6M3DzEDMF
	zY62vxo4So/IbSnR7JMl0Or+p9YJqzy6X2mqtbv8ppZPOE+5Yx7ZxqfYrITj5u4mVVCRq8N9Doz
	qpEQLRM8BMJxypjE95DKo4orPHAdB9Z9wcin4zNvDiCizscUe1KwtSeZrlz+yiw3ZbuAx9c7Xgz
	u4ZLJy48a5QJQ5UlyJP4mz1P7vN4FtzJQVc1RBX5mnbOVizKwiciKlK6oGMQ14nCS9PA3ymjtYz
	8OK5iArOlA4uqwIrbomDuiEyoRHRdQxZBNYG1ZCX9ewdErgBJ1iUXSWb88+vZRxAziJmHJLK3fn
	X9UqjlIEEk57FGc9EDRQ9lMyvpd4IGQZDYZSLZA==
X-Received: by 2002:a05:6102:a4f:b0:5ef:a8da:8b29 with SMTP id ada2fe7eead31-5f1838f9fa3mr994410137.19.1768406466048;
        Wed, 14 Jan 2026 08:01:06 -0800 (PST)
X-Received: by 2002:a05:6102:a4f:b0:5ef:a8da:8b29 with SMTP id ada2fe7eead31-5f1838f9fa3mr994171137.19.1768406464543;
        Wed, 14 Jan 2026 08:01:04 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65411f70f39sm11577a12.18.2026.01.14.08.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 08:01:04 -0800 (PST)
Message-ID: <6a84b1d5-7305-4a30-a542-c4279989cb83@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 17:01:01 +0100
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
Subject: Re: [PATCH 09/11] pinctrl: tegra-xusb: Simplify locking with guard()
To: Jon Hunter <jonathanh@nvidia.com>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng
 <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
 <20260114-pinctrl-cleanup-guard-v1-9-a14572685cd3@oss.qualcomm.com>
 <af986bd3-0bb4-4888-861a-33fa09a7d139@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <af986bd3-0bb4-4888-861a-33fa09a7d139@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMyBTYWx0ZWRfX3s+hEFMC+XOw
 K8Ywk5i2uHgZFwNXA99Let0dTNhWrZ62e6ZkdZulyJbW/+tZznut8jpTFJizq6m9xui5KIAEkH7
 Pd8R1o+QdM9BIKtipjZs4isGtSvu3zu+NMMgwbloLQk1zD93JxZIjB6LdYvWB+6U6VQ0xgqxbnf
 n2lWSiPWR5XdvbkcCBRq45SUuQ7M6iCXC/IjVhB+q1KfdmwXdBEjBYkW6dzoedWSBgmanyi/VGd
 HSlHpC1SLmihniwUmeLX8xgHb5tDRR1OgnBWAbZpwj0Vo+/gpUJVNfzsauHJKAPXsG+Iu5nQK1i
 pxZGGRJC4BGucKLlwCMg4sedjawNqniW1Dc1DxxYY2avts1OZLyqZQithKHIgxtjpeNck6Pdzgj
 m45sFAteUu2pQ+wR6HOQPNJx78tDKw==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=6967bdc5 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mMPh4IZubgD9fDeW7bEA:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: fsBEpvrOmwmrl2NKgOpB6mikqRr2LgFk
X-Proofpoint-GUID: fsBEpvrOmwmrl2NKgOpB6mikqRr2LgFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2512120000 definitions=main-2601140133
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 14/01/2026 16:51, Jon Hunter wrote:
> 
> On 14/01/2026 15:30, Krzysztof Kozlowski wrote:
>> Simplify error handling (less gotos) over locks with guard().
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 14 +++++---------
>>   1 file changed, 5 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>> index 34a373f7e04d..855f708ce510 100644
>> --- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>> @@ -478,10 +478,10 @@ static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
>>   {
>>   	u32 value;
>>   
>> -	mutex_lock(&padctl->lock);
>> +	guard(mutex)(&padctl->lock);
>>   
>>   	if (padctl->enable++ > 0)
>> -		goto out;
>> +		return;
>>   
>>   	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
>>   	value &= ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN;
>> @@ -499,7 +499,6 @@ static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
>>   	value &= ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_VCORE_DOWN;
>>   	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
>>   
>> -out:
>>   	mutex_unlock(&padctl->lock);
>>   }
> 
> 
> I believe we need to remove the above unlock too?

Uh, of course, thanks. Some rebasing mixup on my side.

Best regards,
Krzysztof

