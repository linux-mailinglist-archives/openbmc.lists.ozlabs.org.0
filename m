Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A261F5717
	for <lists+openbmc@lfdr.de>; Wed, 10 Jun 2020 16:54:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hqlC3BlbzDqhN
	for <lists+openbmc@lfdr.de>; Thu, 11 Jun 2020 00:54:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232;
 helo=mail-oi1-x232.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EdrqdKXw; dkim-atps=neutral
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hqhM513MzDqhm
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 00:52:01 +1000 (AEST)
Received: by mail-oi1-x232.google.com with SMTP id 25so2259102oiy.13
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2020 07:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GdyHIMoDuNPyQmBaOY1wwURcgQscfKfZLC8EM7mwUII=;
 b=EdrqdKXwrwWm/6aJsHC24/VCoRAbN7GdOV8NauwDmBHZSmyF6drYERQPSO4OuLHxbe
 igQHdhQEi9u+uvxXkWqUlQakmlNVwNrQqRwjaCA4ywdRcX6uEpTk6vManA+UE/0DkEGI
 V+2pJ4RiOe9epAVHXQHozW6xggU2sAzXpzN17uUvdEXxAgB5c5IQT4IMnfQLpYgHjW7L
 BTM/tVyc8tNTQIbb3NjM8s4ajBF3hURFMLahS87jJT9/S99x2J4cDF4FYjPROLstsQD1
 Rzk3mMX0JaAw16V+QPqRVG/XAmLRYHgw3HDvQb1ynQ0Ob/V9DAk9Ltrjayr9Xpf7vpI0
 BA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GdyHIMoDuNPyQmBaOY1wwURcgQscfKfZLC8EM7mwUII=;
 b=rSvrjoRzlphfWdPdWsC+A7n2zFcjmN8N6IlBnt890t3+jw0RF11VV/aDZIbDcL8wVO
 T3xxeucuZsVjmtv+wMDaodyD1spDSmpPV/L6bNxY0yXQQcdZNBfzq7DJ+tZNQiW/M6Kf
 sMDIh7lwSi1ClK3Q8DQUQdMoPJHNzrAydfneqV9bV6stKZtzS6AxrsM2qgjbJM7FzLqF
 wQZG8yJxIYmbky88w5h0ZoMnnMgksZSRnD5wfPc2hw51JZ/2JS3r/aYT80qtIgfEq6EF
 ntXUdgCurd5EQ31WHndfaiOwdJMVOs2SR+i1PC4TVrH0kES9A4YnsSHAbOGw3fCmPyGz
 SzzQ==
X-Gm-Message-State: AOAM530PgPTZSEhGOHfBBHtP+G+Un1Yh45zSN1DRmzLtEa9ZBwmeJcez
 TCjk9s9vAN7KSr5gU6FV1nc=
X-Google-Smtp-Source: ABdhPJyuzk7FxnZN7vpjM8kPuRIH1IT4KRLrKT8DbgJaZK7KOabvhxlQ3j+Dxqp+5w9iZ+8uXUEVKA==
X-Received: by 2002:aca:d515:: with SMTP id m21mr2628205oig.7.1591800717708;
 Wed, 10 Jun 2020 07:51:57 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id 35sm37709otd.68.2020.06.10.07.51.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 07:51:57 -0700 (PDT)
Subject: Re: AMD's Signed CCLA
To: "Venkatesh, Supreeth" <Supreeth.Venkatesh@amd.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <SN1PR12MB25428FA4CD525DF87AC73F8496830@SN1PR12MB2542.namprd12.prod.outlook.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <1519a428-00f0-7566-1541-7ff5e060e5a0@gmail.com>
Date: Wed, 10 Jun 2020 09:51:56 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <SN1PR12MB25428FA4CD525DF87AC73F8496830@SN1PR12MB2542.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
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
Cc: "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>, "Stephens,
 Christie" <Christie.Stephens@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/10/20 9:36 AM, Venkatesh, Supreeth wrote:
> [AMD Public Use]
> 
> 
> Please find the signed CCLA from AMD attached.
> 
> We look forward to working with the OpenBMC community.

Welcome AMD! Thanks for signing, everything looks fine. Your CCLA has 
been accepted.

Kurt Taylor (krtaylor)

> 
> In my previous role, I enjoyed working with the OpenBMC Community and
> 
> I look forward to continue collaboration with the OpenBMC Community.
> 
> We have ported OpenBMC on AMD customer reference boards and would like 
> to upstream OpenBMC support for AMD customer reference boards.
> 
> Can you please help create meta-amd?
> 
> Thanks,
> 
> *Supreeth Venkatesh*
> 
> System Manageability Architect  |*  AMD*
> Server Software
> 
> *------------------------------------------------------------------------------------------------------------------***
> 
> 7171 Southwest Parkway, Austin, TX 78735
> 
> Facebook <https://www.facebook.com/AMD> | Twitter 
> <https://twitter.com/AMD> | amd.com <http://www.amd.com/>
> 
> cid:image001.png@01D4ACEA.20484940
> 

