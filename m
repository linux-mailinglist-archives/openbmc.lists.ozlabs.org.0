Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 144743D787F
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 16:29:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYzhH0fdcz309F
	for <lists+openbmc@lfdr.de>; Wed, 28 Jul 2021 00:29:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=B7IIAZpO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=B7IIAZpO; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYzgx148hz2xb6
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jul 2021 00:29:16 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id
 z6-20020a9d24860000b02904d14e47202cso13613568ota.4
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 07:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OC5PEtwTYaD6ZY/QCODz5mHQdG7XaojnJoPxat0TQqc=;
 b=B7IIAZpOBbL+B7vefBuZE0feXJTjoGo1PoMiVS75RyFjGd56TGX9RNgHnr3U8GViRO
 2SyCz6SK9KdD5GaTywyESR0mC9Vie8RlhMoVk5oamIyONhKtlY/iUYjjhchUs2mZUxsT
 Ye9orI7A53FYRd0Uk2iLNl3llKRqAIMrMgjyaTg7kS6grS7AuZbEgZKElY/y2r+wMvjj
 3PRl1+kw5BQF2NQvs5tNcjo2WmHOH5Awj7fspSZbanG1KyuKfW5HkGguLCMUbABCTZT1
 s2uzQua/UCXDr0HnnKp2ZArOnx2vAUj9JIHdILQFXoLPEJwFIb829dCbuGmi4u1JAr4g
 tTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OC5PEtwTYaD6ZY/QCODz5mHQdG7XaojnJoPxat0TQqc=;
 b=oZLGfKu2U+pDn+mGtNDVW/cBpOIrmdg8C8SUNVb1tC5+n6EL1BTDMRl9oenn4/szRl
 a4VhNyWMauHTwH28qKSph+L06DKawnurl32xFdwtdd4CRjHSpinK5oyTkAzY9Xbedact
 eSpLN3I6KL+VhWdyg0ukTJE3IfwPCu0d+tGPhM4NIuZJHkUzxMolXpJ8JQj75oC29cu1
 tiwxRqKmpbzJ5WxI6o/GNU0GMi1e8stsntIS6u1wUwTcM6ImBDhq2tHizZ8gRAUfgjDy
 iSGRcBf7RFs9dAGcjrsqsAjVMgVa55G58RUlPxI61onLcesHeICHKwQaZvt1kvlwU20e
 5/Nw==
X-Gm-Message-State: AOAM530/KIZg2dcdsjUqjmUHjLCTEny7NPKXy6ayA2M8CgJo/0u7Jl4I
 i/ViLDbKtvuCCEYrfT1SdgzM52/SzIMZgQ==
X-Google-Smtp-Source: ABdhPJyqXgp0moLoKXOdUB1HVbc3TYrObrmkv69CBfpH9ht/rnqhRrJrriaYLRZA3jCuYIddYSBvCA==
X-Received: by 2002:a9d:32f:: with SMTP id 44mr15643167otv.266.1627396149007; 
 Tue, 27 Jul 2021 07:29:09 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-104-102.res.spectrum.com.
 [72.182.104.102])
 by smtp.gmail.com with ESMTPSA id 45sm552499oty.16.2021.07.27.07.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 07:29:08 -0700 (PDT)
Subject: Re: Signed CLA from ASPEED
To: Luke Chen <luke_chen@aspeedtech.com>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>
References: <623110cb8acb4bbc99c43c47b37f5457@TWMBX01.aspeed.com>
 <9C742B6B-8604-4EC1-9AE8-98844ACB557D@fuzziesquirrel.com>
 <HK0PR06MB23218108A08BC07208A93909E1FF0@HK0PR06MB2321.apcprd06.prod.outlook.com>
 <CAN9Jwz375dV0fFbBaE_SK6Cw8t0pyC-j-fPFuK5tm_EATWoFmA@mail.gmail.com>
 <HK0PR06MB23215E570FE7381C47EEA024E1E99@HK0PR06MB2321.apcprd06.prod.outlook.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <791d8a3c-3bcc-8310-69ab-6b7917bdf30c@gmail.com>
Date: Tue, 27 Jul 2021 09:28:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <HK0PR06MB23215E570FE7381C47EEA024E1E99@HK0PR06MB2321.apcprd06.prod.outlook.com>
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
Cc: "manager@lfprojects.org" <manager@lfprojects.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/27/21 1:43 AM, Luke Chen wrote:
> Hi Manager, Brad
> 
> I would like to update CCLA, I added 2 more team members into the CCLA.
> Steven Lee, steven_lee@aspeedtech.com
> Jamin Lin, jamin_lin@aspeedtech.com
> 
> Please refer to the attached signed CCLA.
> And please help to approve it, thanks.

Hi Luke, your CCLA has been accepted. Thanks for keeping it updated!

Kurt Taylor (krtaylor)

> 
> 
> Best wishes
> 
> Luke Chen
> (O) : +886-3-5751185
> (M) : +886-935-592-892
> 4F, No.1,Sec. 3,Gongdao 5th Road, East Dist.,
> Hsinchu City, 30069,Taiwan,R.O.C.
> 
> 
> 
> ---------- Forwarded message ---------
> From: Luke Chen <luke_chen@aspeedtech.com>
> Date: Mon, Nov 23, 2020 at 10:16 AM
> Subject: RE: Signed CLA from ASPEED
> To: Brad Bishop <bradleyb@fuzziesquirrel.com>
> Cc: manager@lfprojects.org <manager@lfprojects.org>, openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
> 
> 
> Hi Brad
> I would like to update CCLA.
> 
> ASPEED moved to new office, so I changed the office address in this CCLA.
> And I also added a few ASPEED team members in the list.
> I am also attaching the doc file, so it is easy for you to copy-paste the email addresses of my team members.
> 
> Please help to approve it, thanks.
> 
> 
> Best wishes
> 
> Luke Chen
> (O) : +886-3-5751185
> (M) : +886-935-592-892
> 4F, No.1,Sec. 3,Gongdao 5th Road, East Dist., Hsinchu City, 30069,Taiwan,R.O.C.
> 
> 
> -----Original Message-----
> From: openbmc <openbmc-bounces+luke_chen=aspeedtech.com@lists.ozlabs.org>
> On Behalf Of Brad Bishop
> Sent: Wednesday, November 28, 2018 9:32 PM
> To: Luke Chen <luke_chen@aspeedtech.com>
> Cc: manager@lfprojects.org; openbmc@lists.ozlabs.org
> Subject: Re: Signed CLA from ASPEED
> 
> 
> 
>> On Nov 26, 2018, at 9:54 PM, Luke Chen <luke_chen@aspeedtech.com> wrote:
>>
>> Hi Sir
>> Here is the signed CLA from ASPEED.
>> Please help to approve it, thanks.
> 
> Thanks Luke!  CCLA accepted.
> 
> -brad
> 

