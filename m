Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A8D9C4384
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2024 18:25:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnGfC2XNgz3bcs
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2024 04:25:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731345936;
	cv=none; b=RjRL7Bga0CHyPr9DUtSX9Tw03SskFH3YI6jS+hpC+1g5Xz5kYvnBPtVMnQGI3OgpCFxwAeccROMzZDJ7uJrQErgehFWh2Me1RjUGPZKIQJka5rC8f2capMiIoYT0cC4Doj5eG1aqh0aGRGxWvJxvlhN/Vt94GckkATHXVU9dwcXyRCpwzAOAeoBUPMGTZkKyiwIgq981k/BHrxN91Tqzu30Gws1Ur7wbTKUDGmO8TyZYLE6VMlUx+d+6wG/NTzxH0Uv6dL5DJGQ7CZ1Mg0Xxjh57PQjyp45rMVTg0bQcqSvwZEwPjL220gcRbT8JMo8AhR87Uai/SMWjZdYiV4JrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731345936; c=relaxed/relaxed;
	bh=TGkctB5w2DgVNd65llyIf6DBsV2rcrcXeYWXerAzjMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nq7tuGFe55LbP0Ux+JhvQBrHoaAbWb45f7IzcHFUwcgbTqddVqwnomR5aG9GQkHBdVG6a7Oz8O5dKYP9kaPxh3IpJoFh1lk1+xzXoCugmfL8lt68jU5yV7EXIMOv75rblSnd8jmYNgNqcCW4oeLzodIvQM6Chpo2XdgHzWWqv7mi1gN+YGMw2/RIX076ZHT2jm1nqe6m+4nF/H7zi2fNqVqc1i5FPBgdMLOS7vAU7QpJ9NIKHrBp8IWuQRaLTDj4Y+QLcQ1vJ+TT5PVNbU1+jlXc7xrAIqEyFUaDjg2YnALN1/eLaHIAEXHg2xlpG7OogovSLcmA3189KQNwp6d3dQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kWAPtYsT; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kWAPtYsT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnGf63Q3Gz2yD4;
	Tue, 12 Nov 2024 04:25:32 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7181caa08a3so2726352a34.0;
        Mon, 11 Nov 2024 09:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731345930; x=1731950730; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TGkctB5w2DgVNd65llyIf6DBsV2rcrcXeYWXerAzjMs=;
        b=kWAPtYsTPDQsDdPJHqSj8P7e2qUOSncuTu02usurec1Bjlif/jEufFPObj1QdoyfwU
         4eBr7aC2N24aVSa9EcOU3R/MB2Mi2xEihzVzV76Qv12+y2i4BTuNjNkiw1Soo3I6jEyK
         4iWhAkC9HBEvRFD9VVUftfllzRBEv5lK01I98z6bIO6/0YXdx/ebVDTNzHpj2PrwH8LO
         Q4b29ztnsjf9tYgr6NgkBHf2grkIEU2Pxl6MFfBmFef26ORkmisW0r4+4IOcLArTNvNJ
         DnN7/v8E5tTVaPQCO1MBA/w3TO+L/z4tBZIIggjIdnC4S/8oW/LalPQ3iO9JV+T0PnsB
         eWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731345930; x=1731950730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TGkctB5w2DgVNd65llyIf6DBsV2rcrcXeYWXerAzjMs=;
        b=r6+2aTuteER/FiuEkVsmiVvBN/tJYUCWJ2FIJkNVv06+FZYnAoQleKiNSZ3M5zb3rd
         zQlwyRHPu9+7W5PkXvrVap2HOmmUFEz0OL0bJPJ2fbr+hq+lYXN2BIlIgnu29bszctrV
         zowkdry9zXE76W9tHqU2p2XHaBzEbfPRXKoq8XzmGh/eGq1PJcXex0evwSWisFmxbfdI
         scpdAXgF1zQrYaH0yFa52eMAwvRrCAjrFbQVZAq4Y27nto+fgBf8QGdfdi5+IKv9BemU
         9pZg/q3wDlf1y2Gv81mQ+KFggKebwUBn4Yu8AeTDmkdSVDOwEA3PgdxZCbff5jtCdSVW
         8Dag==
X-Forwarded-Encrypted: i=1; AJvYcCXXsw2W6hErrBTSIj7Y4MPYYrAg1yTFre1B+hb6jf03EojRuBov1cSlxfiQyRkegIF8U6zqcmSO@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwO4wZcL0ew2+n2grAtMEsuQR2ndszViooZuh1FabUDBp1nNjBC
	sZE9NE8WwM9VlUtf/9dYNS5e0SVMbOcUHJucXFQm+poSGfrL/iZA
X-Google-Smtp-Source: AGHT+IGSE8Tlbmi62yQY1NUtFU32C22MR6/icQoBaoeQ7KQoKvlXZzIHByJ3L7g7dUjxzUY+Qrxb5A==
X-Received: by 2002:a05:6830:2116:b0:718:e44:6da9 with SMTP id 46e09a7af769-71a1c1d2fa3mr12073671a34.11.1731345929640;
        Mon, 11 Nov 2024 09:25:29 -0800 (PST)
Received: from ?IPV6:2605:a601:aa57:7500:c5da:8ec9:bee9:a72c? ([2605:a601:aa57:7500:c5da:8ec9:bee9:a72c])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ee49527467sm2018955eaf.20.2024.11.11.09.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 09:25:29 -0800 (PST)
Message-ID: <c96c7e05-31ca-4145-a8ed-d74a32770011@gmail.com>
Date: Mon, 11 Nov 2024 11:25:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Pruning obsolete BMC devicetrees
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 openbmc <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
References: <b386a9e98412b06b6186ee5dea81ac6a69bc4f8b.camel@codeconstruct.com.au>
Content-Language: en-US
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <b386a9e98412b06b6186ee5dea81ac6a69bc4f8b.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 11/10/2024 10:49 PM, Andrew Jeffery wrote:
> Hi all, We now have quite a collection of BMC-related devicetrees 
> upstream. There's interest in whether we can prune some of them out.
Thanks for doing this AndrewJ, it's always good to keep things cleaned up.

> 2018-06-22 876c5d891c9d7442d2734871317bc6480cd9f80e: 
> aspeed-bmc-opp-palmetto.dts 
I think we're ready to call it good on Palmetto and remove it. I'd like 
to also remove it from our CI job.

> 2019-12-03 53820e00aaa173db268e0288d0407806539b4c3e: 
> aspeed-bmc-opp-swift.dts
Swift can also be removed.
> 2020-03-06 fa09a28ca3e966582d6d92ef1536de360c8b194b: 
> aspeed-bmc-opp-zaius.dts
Unless someone from google disagrees, I would like to also remove Zaius 
from CI.

> 2024-08-02 1c8b6faf882de15fd62094e08b2ca5bf7870b767: 
> aspeed-bmc-opp-tacoma.dts
Tacoma can also be removed.


Andrew (G)

