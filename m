Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A269120FFD
	for <lists+openbmc@lfdr.de>; Mon, 16 Dec 2019 17:47:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47c6dL6tlWzDqTs
	for <lists+openbmc@lfdr.de>; Tue, 17 Dec 2019 03:47:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="P9+jj5Jl"; 
 dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47c6cb0wHRzDqKM
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 03:46:54 +1100 (AEDT)
Received: by mail-oi1-x230.google.com with SMTP id b8so3815711oiy.5
 for <openbmc@lists.ozlabs.org>; Mon, 16 Dec 2019 08:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U9U1Ws23cjF69U6srU6hBJO4I3JxOApyxdlAlBOUpSc=;
 b=P9+jj5JlvZsLFYY+S1OHoYWcXXuT3gb9k63WmqiFB/CmFGMgaFhgZazyVZ+QmB3wWT
 BFQwoylEU3jrl8colcUpZDLG+i+Izg4KxsbSAHpZujx1jHeoWQaMF4Kp96AIM3FGhHG6
 UIUWfWwAU6k2sgmhU4vAT4ofrIpaV0IMDB0ZWhOuN5hT/rNpM2tZy9NFZhwSXorwKrJV
 +Fhd4SV0t6Dlvw0Ct3x5Q2mXMEBBkHHaUOmY97vVsSrLyTyCcUm5S5QhaSNjaMQt6/0r
 obXiXJS7gMmyE5WPkpwWfnDdyNvelOzgMe2Gp+ndzfqigkL7hX4cYrVQ2zb74U4d3o6q
 edDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U9U1Ws23cjF69U6srU6hBJO4I3JxOApyxdlAlBOUpSc=;
 b=dypPZ4Ub6MvLLnmjnpfIF9thnGkAG3V0RXFc/8jPGQ7nfKOt63qorBqAWDDfYLsz8l
 ZsVlEBdVaXyB4tKXzs9RH/UJ/CwtiiVa+hkUkYXT7OCjuMOCPJ7y/0m4xDMtI2TEb0wH
 msWRmK1IlrrSO5+960Q8dWJc/nqw1WwzIPsRdNDrzzeJxXT7tOSOH0fhDZxzhOlxjS9r
 MZ6Gj08Epw17j+fx2xgJkBFD9C9QLMgahFaHzsNqVOnFVg2/e5RFLJDD+5Erq5OYRktd
 jPNQpXxz3cF8Mp4Y5+MMxkZm/qyHzixbpf8+7szBuyHBzX16XwwveGeMemeq8Y/V9Ccb
 LYqQ==
X-Gm-Message-State: APjAAAUXe1zYQ/0OnbQZo4islMElvS4XLaMs8dW5eUo2DVFyqqbRTxpM
 6YxW3FZMzke5V53VZsCISj4=
X-Google-Smtp-Source: APXvYqzYtIzZ4uieG6CUWf3r/sLd84SzbNqPD+SRpNFxLGRjVRc2vr4iMY6EieZwjTBtY+ISFR6BKw==
X-Received: by 2002:a54:4e8d:: with SMTP id c13mr9977041oiy.27.1576514811014; 
 Mon, 16 Dec 2019 08:46:51 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id y139sm6964614oie.18.2019.12.16.08.46.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Dec 2019 08:46:50 -0800 (PST)
Subject: Re: Wistron CCLA Schedule A update 2019216
To: Claire_Ku@wistron.com, openbmc@lists.ozlabs.org
References: <d22732004bb74e3da870f2dc88f3e5a7@wistron.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <0d4d855e-0d2f-f92a-0270-651836855248@gmail.com>
Date: Mon, 16 Dec 2019 10:46:49 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d22732004bb74e3da870f2dc88f3e5a7@wistron.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Timothy_Huang@wistron.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/16/19 3:53 AM, Claire_Ku@wistron.com wrote:
> Dear Sir/Madam,
> 
> Update the schedule A from Wistron Corporation.
> Please help to review it.
> Thank you very much.

Received and entered. Thanks again for the update!

Kurt Taylor (krtaylor)

> 
> Yours faithfully,
> Claire Ku
> 
> -----Original Message-----
> From: krtaylor <kurt.r.taylor@gmail.com>
> Sent: Monday, October 7, 2019 10:05 PM
> To: Claire Ku/WHQ/Wistron <Claire_Ku@wistron.com>; openbmc@lists.ozlabs.org
> Cc: Timothy Huang/WHQ/Wistron <Timothy_Huang@wistron.com>
> Subject: Re: Wistron CCLA Schedule A update 20191001
> 
> On 10/1/19 2:51 AM, Claire_Ku@wistron.com wrote:
>> Dear Sir/Madam,
>>
>> Update the schedule A from Wistron Corporation.
>>
>> Please help to review it.
> 
> Looks good, thanks for keeping this information updated!
> 
> Kurt Taylor (krtaylor)
> 
> 
>> Thank you very much.
>>
>> Yours faithfully,
>>
>> Claire Ku
>>
>> *---------------------------------------------------------------------
>> ----------------------------------------------------------------------
>> --------------------*
>>
>> *This email contains confidential or legally privileged information
>> and is for the sole use of its intended recipient. *
>>
>> *Any unauthorized review, use, copying or distribution of this email
>> or the content of this email is strictly prohibited.*
>>
>> *If you are not the intended recipient, you may reply to the sender
>> and should delete this e-mail immediately.*
>>
>> *---------------------------------------------------------------------
>> ----------------------------------------------------------------------
>> --------------------*
>>
> 

