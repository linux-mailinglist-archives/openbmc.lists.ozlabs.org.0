Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C1A2A8359
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 17:19:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRpcS1V30zDqpG
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 03:19:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32f;
 helo=mail-ot1-x32f.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GmUPYvZt; dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRpXw4gWlzDr34
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 03:15:59 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id j14so1935780ots.1
 for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2020 08:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0pKoGXLXMbWnE5EpX2OW/pkKuskuD590EFnjL840kgk=;
 b=GmUPYvZt7g1bHYMKdvCsDXLdzu+Ft+7zSAbuMB1GRHsqErY6laFdTF1boJyuYci1lQ
 Qjcm6V1raGZtAAwSDYST6wbQ5VZAECe0UQV4GLclA6uPqov9cwQXb2athZZCwXIiopw0
 9KeT0Drh5PC0WxD03VvxKVxE6JF9tWNdt3cFOr4ZAJeeEQUmo4EtUOVJxzUf2opCDNtd
 2ra3L4DXkQVp8Tl3BJCNSBwGbs3U42QROGu/lmTU3cXu8biNexci+4eDX7rt5mNpKKZd
 X61XU7NIq2bgU0cSzOA1B2RZVeeo0wo8EVlZAJVKZZNv32zwJzYeUU78A9Rj/8nx0A6p
 8OFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0pKoGXLXMbWnE5EpX2OW/pkKuskuD590EFnjL840kgk=;
 b=cCNwpJ9ZdoI3EOYQg2envvJlqGITkVRLhUFEir0xC2khhjECqmn7dC+u1TpZ64IrOA
 CBjvYwLCmLqE1g7iZL6Jb/hEdnxby80ULjLi+VgSSV73t0Ip3FDyQJ3V6p9hdvj7REd5
 7x9xLteygV+PiiJQXm4+f6ORE8zY2snyGsU4kqnO6GsZTO+ZXGFkJy7mC0Kwzfl/0WHY
 14jhNqi3uY3gItcYrEbXmnkMCslWDIPp2OxHXNdbHcOZYq3dkcnXAQIMm7wWbQpDAUZx
 aFUdG58ikpgNFON2lV3FYs3BiT5Vl0796cfZcITUg0/22nkqLuf8f7BeWo0ciknzfWy+
 biMg==
X-Gm-Message-State: AOAM531Q6o+dJsKpTg22L8V/7msZMrwpcBkU0fMqzoq74/0UbB9NM0Qe
 qsx5qUu9TlTxgbVhiQnPKF0=
X-Google-Smtp-Source: ABdhPJx0vD24ToL08CXCnNcCsYtOZfByaBj10eIkr6g+LsmSS8yjy4/dnv6m4doS9GJmI2Q/HaoN+g==
X-Received: by 2002:a9d:222f:: with SMTP id o44mr2226101ota.321.1604592956149; 
 Thu, 05 Nov 2020 08:15:56 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id b21sm400531ots.30.2020.11.05.08.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 08:15:55 -0800 (PST)
Subject: Re: OpenBMC Project Contributor
To: Michelle Liu <MichelleLiu@supermicro.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <df1a21b1e7164ed8a8a6b36d8a713c6e@EX2013-MBX3.supermicro.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <3b7a2e0d-5c17-a63a-06f9-307404c7c316@gmail.com>
Date: Thu, 5 Nov 2020 10:15:54 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <df1a21b1e7164ed8a8a6b36d8a713c6e@EX2013-MBX3.supermicro.com>
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
Cc: Kevin Liu <Kevin_Liu@supermicro.com.tw>,
 Hancock Chang <HancockC@supermicro.com.tw>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/4/20 2:25 PM, Michelle Liu wrote:
> To Who It May Concern,
> 
> Super Micro Computer likes to join the OpenBMC community as a 
> contributor. A signed CLA is attached. Please provide us with guidance. 
> Thank you.

Your CCLA has been accepted. Welcome Super Micro Computer!

Re: guidance -> Lots of great info here:
https://github.com/openbmc/openbmc/wiki
and here:
https://github.com/openbmc/docs

Jump on IRC (#openbmc on freenode), there are a bunch of friendly folks 
there willing to help.

Kurt Taylor (krtaylor)

> 
> Best regard,
> 
> Michelle Liu
> 
> Director, Software Products
> 
> Super Micro Computer, Inc.
> 
> D: +1 (669) 284-1046
> 
> C: +1 (408) 420-6407
> 

