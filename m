Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9A29508DE
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 17:21:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DU4CF8c1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wjw900rdPz2yQ9
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2024 01:21:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DU4CF8c1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wjw8S2vYZz2xJX
	for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2024 01:21:26 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7a1be7b5d70so4002677a12.0
        for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2024 08:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723562484; x=1724167284; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MyG8WTl81rC7yOUM1xO7NMVMnItmW9uYuEDKQEDYors=;
        b=DU4CF8c1VS6lUwaxtWxEg8mai3TFc0TTUY80BTZwz2EkOUuiEAVIakYuO2y9l+C2cz
         qje99eW5LKaCKfeg/gKsA57fhZSe8RAd3DfrEXN3m3sugKneoK3MkXSV8VevUgnDj+Vc
         c4bCUdtSjv4BZ+fzc8MoYwNWfqYEDuaEVZLWz9ag2C0dFiZv3osWGhacOfdNXqwjwwJM
         U96d9KVs9fhZtzUoXmJbTxzAG9YSzOg8Kur1jQdTGZ/IeDz3kdDnVi/ieDJKQcXxY8Jb
         ZDoi34uHHb59SHM9ser0g4j0c0BoLPyUbqHbHGoWVP7JScz/YFy4bxdBv5Euk/1f8gsw
         srUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723562484; x=1724167284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MyG8WTl81rC7yOUM1xO7NMVMnItmW9uYuEDKQEDYors=;
        b=EDlst+NK/VoG4H85Vy3nuJgSU1D8kr1a1w7kBxKHS5CoOMriy2NCLqHPDySWXMWVz9
         ZnA/DbhQg0ziluPyn2zchcQ/lIfRnaGZCh9IRjxdsgbFx3/1s8HYQsvtFCxX6QoeJB6l
         N4K/sONNfqLg5OD0YV0uzIciuYmr8lIhJhxFJo6Np7ZBW8OVds8/2zxQfu8b/7SYCSL1
         lvbEdASeVEHW1zeYsRwhIzaK4c5uxw5CxV888kz/8UybQIVEFmhjaVfB6yoGUPyqjxM6
         fLRzYrW53nFmuA2Pe2AwK4ZN0r+P8v3fklyTD2ZqmQjQbTtBQq5vz49O0CSiHumBq5tT
         PZcA==
X-Forwarded-Encrypted: i=1; AJvYcCXkN6iOeXwTeusyabF7JcvjOk4ZVMAgRxbA2U5Gx2CVgkB/iNDz0nSwNrk8a1Z0HRTb/c0ibQFK79iOEXyZv++im6sBdNgYWjI=
X-Gm-Message-State: AOJu0Yzrih9QCUqzsQbpuWYG7lGEdvFDml7yRVJha1oQHk/iWIZLL0GA
	78KFWIFPqsUDU0rBIs852qOK3gDSmVdG2XyYXr+nUvC5pyz/ofhg
X-Google-Smtp-Source: AGHT+IF6uH9uw4NB7F8BrsiCWazNGk/2Pgzy2V0W+zBqLr160PSFrIwk7sIp5jUWRKDdmjrls7OSxw==
X-Received: by 2002:a17:902:f604:b0:1fd:a412:5df2 with SMTP id d9443c01a7336-201cbc919c2mr48390485ad.29.1723562483921;
        Tue, 13 Aug 2024 08:21:23 -0700 (PDT)
Received: from [192.168.1.50] (host97.186-124-166.telecom.net.ar. [186.124.166.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1b9f7esm14759395ad.207.2024.08.13.08.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 08:21:23 -0700 (PDT)
Message-ID: <3a962617-2447-447a-bedb-f9911757558f@gmail.com>
Date: Tue, 13 Aug 2024 12:21:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CCLA for MiTAC_Tyan needs to be updated
To: hancock.chang@mic.com.tw, openbmc@lists.ozlabs.org
References: <9b6b8fbff7924cb6a505f028f68e51b3@mic.com.tw>
Content-Language: en-US
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <9b6b8fbff7924cb6a505f028f68e51b3@mic.com.tw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: eric_kuo@mic.com.tw
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 8/1/2024 12:26 AM, hancock.chang@mic.com.tw wrote:
>
> Dear OpenBMC org,
>
> Tyan, the branded business group of MiTAC Computing Technology, has 
> signed CCLA of OpenBMC in several years ago, since lots of member 
> change in these year, also the organization change with brand name 
> change, we will unify our brand to combine “Tyan” and “MiTAC” then 
> just keep “MiTAC” as our single brand from 2024 Q3; assume it might 
> need to re-new the original CCLA between Tyan and Linux Foundation for 
> OpenBMC, should we re-submit a new CCLA?
>
Hi, welcome back. I don't see a CLA for Tyan in our google drive. I do 
see one for MiTAC

up at 
https://drive.google.com/drive/folders/1vKCSGGXlUbEZgAxnC54pSMklSh_xTzRc

If you can  just submit one CLA for both Tyan and MiTAC then that would 
be simplest.

You can send to the mailing list and I'll review and update it in our 
google drive.

Thanks,

Andrew

> BTW, may we have help from OpenBMC org, to check and get the original 
> CCLA between Tyan and Linux Foundation?
>
> Thank you
>
> Hancock Chang
>
> Director, Solution Enabling Dept., BEOC
>
> MiTAC Computing Technology
>
> Tel: +8863-327-5988 #7359
>
> Cell: +886935547665
>
