Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4622FD445
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 16:41:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLV9m220LzDr3p
	for <lists+openbmc@lfdr.de>; Thu, 21 Jan 2021 02:41:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OkzdQPn0; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLV8Z35NczDqv3
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2021 02:40:12 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id f132so25405619oib.12
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 07:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=rkKorDGNT9wV4V2d00WIA4U2jPNi0cUWJ6BQoPBQ65o=;
 b=OkzdQPn0oX2C/9QKRC1qWrnrfS48QRhNIj3o/8QrQeqbh7xuZvH4TNc1feuPBi7tlz
 4I0GVfORGjIMdceBVRnfhNpOlm47IdmR0Hj+EwKTfV96RkrxdpJJ6e1Ne0uJCQdmPRsp
 KoHlryg8ar6SdiO9/N8wholnVb2UVzbabtE99sfqkKYkRH+6pRVpOK3R9UuvgTJGZixp
 lycTK57uSuh83r+mRDdkOEgPuYV52GM5Q9fI9YDARAX/WM6Q2msjs+Hf4yW9TV4xSqeU
 sD7CnUVuVTJDhWlDE6Q+Jz3T1xhCApFAfy75aw+wrBn7nCffvYzmo8uNW+7jvY6FU2rd
 IWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rkKorDGNT9wV4V2d00WIA4U2jPNi0cUWJ6BQoPBQ65o=;
 b=XHXH8y8fUOsiK6zVZYGkiOq+hsHpGrw7CGkOv5DavtLNBU6OwFrisJLvlIUn5tipk6
 Z6v/mAwwkbK+uw2MRmxCZi6lbhq8u9+UD2a9HG2wN7cE1CUgdOoliBX8N3l0Cu77zoey
 1n99Nm1raHMU/ufUhjQ3NvFPuTvGAUmT+r52trBo4d/EvZjiQIdkGM3NrkyGoNKcQPRb
 QF0iVl93w5fYnxVzB2g4YLIXbp6JZVx+vh3NWafA0e1JIpSiG+4aHk4qKXbbhX3ZYfNe
 /N7t6xMNacYLizXqlwbBHL/GiWrgS6alD/F7o0jLenuuNbn98TOeQzKJWSdBBPTQbWVY
 6Suw==
X-Gm-Message-State: AOAM531c24N9Q9trJA0aplEOoUBA0snV9H+M9mGlQFY0Uyp1+z+xSPAQ
 TMrQlwZKrlX0bSTFSjChbq6s+q6/m9y4ag==
X-Google-Smtp-Source: ABdhPJyPyt7gOmk52qsrKvfjSQN8Grimjxh1o+MGM2f/Y3ktEYy0iEQkBlswB2ufkvpq3QKrYEz3YA==
X-Received: by 2002:a05:6808:9a:: with SMTP id
 s26mr3268013oic.124.1611157208674; 
 Wed, 20 Jan 2021 07:40:08 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id b15sm460205otj.15.2021.01.20.07.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 07:40:07 -0800 (PST)
Subject: Re: [External Mail] Re: CCLA Upload (Compal)
To: Willie_Thai@compal.com, openbmc@lists.ozlabs.org
References: <14e4b87d97bf4c589ceaaa8c19f67d1a@TPEMBX06.compal.com>
 <c7953801-ec81-4dd3-5189-a3157965e8d0@gmail.com>
 <d46369c994e94ab081d5c866b3909006@TPEMBX06.compal.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <295aee54-6df5-b405-c45a-e7d9499035dd@gmail.com>
Date: Wed, 20 Jan 2021 09:37:51 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <d46369c994e94ab081d5c866b3909006@TPEMBX06.compal.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/20/21 2:58 AM, Willie_Thai@compal.com wrote:
> Hi Kurt,
> 
> Thanks for your remind, the attached file is our signed CCLA.
> 
> Thank you !

Thanks Willie, your CCLA has been accepted. Welcome!

Kurt Taylor (krtaylor)

> -----Original Message-----
> From: krtaylor [mailto:kurt.r.taylor@gmail.com]
> Sent: Tuesday, January 19, 2021 11:49 PM
> To: openbmc@lists.ozlabs.org; Thai. Willie (TPE)
> Subject: [External Mail] Re: CCLA Upload (Compal)
> 
> On 12/22/20 9:52 PM, Willie_Thai@compal.com wrote:
>> Hi OpenBmc Committee,
>> 
>> I am Willie from Compal Corp, we would like to contribute to OpenBmc 
>> project, so we want to upload our CCLA.
> 
> I have previously tried emailing you directly, maybe because of the
> holidays this message got lost.
> 
> The CCLA we received from Compal was not signed. Please have a company
> representative sign and return, and we will be happy to get you started
> making contributions to OpenBMC.
> 
> Kurt Taylor (krtaylor)
> 
>> Please help to approve and let me know if there is any question !
>> 
>> *Thanks.
>> Best Regards,*
>> 
>> *Willie Thai*
>> 
>> COMPAL ELECTRONICS,INC.
>> 
>> 6F., No. 585, Ruiguang Rd., Neihu Dist., Taipei City 11492, Taiwan, R.O.C.
>> 
>> Tel +886-2-2658-6288 ext.15728
>> 
>> Fax Tel +886-2-8751-1690
>> 
>> E-mail: willie_thai@compal.com
>> 
>>
>   ===============================================================================================================
>> This message may contain information which is private, privileged or 
>> confidential of Compal Electronics, Inc.
>> If you are not the intended recipient of this message, please notify the 
>> sender and destroy/delete the message.
>> Any review, retransmission, dissemination or other use of, or taking of 
>> any action in reliance upon this information,
>> by persons or entities other than the intended recipient is prohibited.
>>
>   ===============================================================================================================
> 
> 
> ===============================================================================================================
> This message may contain information which is private, privileged or 
> confidential of Compal Electronics, Inc.
> If you are not the intended recipient of this message, please notify the 
> sender and destroy/delete the message.
> Any review, retransmission, dissemination or other use of, or taking of 
> any action in reliance upon this information,
> by persons or entities other than the intended recipient is prohibited.
> ===============================================================================================================

