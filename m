Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6885184F007
	for <lists+openbmc@lfdr.de>; Fri,  9 Feb 2024 06:54:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BDmjXv4Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWNNG2bvjz3cCh
	for <lists+openbmc@lfdr.de>; Fri,  9 Feb 2024 16:54:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BDmjXv4Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=sunithaharish04@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWNMd2RhQz30Np
	for <openbmc@lists.ozlabs.org>; Fri,  9 Feb 2024 16:54:03 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d72f71f222so4979815ad.1
        for <openbmc@lists.ozlabs.org>; Thu, 08 Feb 2024 21:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707458041; x=1708062841; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KuRygcE7QyNXvGNpvAkglEFTpBs9jp2Tlt1ph1X5FyU=;
        b=BDmjXv4ZmxeWgVIWpHLT3WOyVAmRT9SnnyCxNtRMYKTfenIiQzYqLDCZZims5cJtTK
         Crn9Z+W8t+42a3+zIuQoY7BqOTayCsBn3RQimkVPcTyFjiOmC8tdvKWkTNUW5vcFvkKM
         9+x04ByEF4M5qb8kqwYbc3n5dIKTV+zuQPsZDsS3DeWL18Q68HzNbeanqKA6U1H1o0iF
         t8jXZCli/2MvtnlFeLs9RMF7Za3oLDTmTq+JybfGQ9sf6MeInzovGb36tF5PgqJeS92g
         ChANy/mmQFLBIJuZdRNwy8vV7LsqH72kpOClfXxd0SuCzelgQt/1KZojfAimrAyPDatX
         PDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707458041; x=1708062841;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KuRygcE7QyNXvGNpvAkglEFTpBs9jp2Tlt1ph1X5FyU=;
        b=DZoU1x+rIZcgtzt4t+lSZVC2BCQ8a0uKecCv6X2on04g/vFwgJEzak9dduxHYFgWxQ
         uq7f9WUElRVRtwakYDYnfo8RYkXVLhtkpvbONCAFj68V9AFyna5bNtMxSMcaux9Gxo9+
         jz8hUz/vng2uXjBr/94Wx5cWC2M3u6vP0BVb6po/gVfkctHwH2O0M6CC6eRE01OrE/B3
         Qnb1gVRkUSIHnuKoafL30YGflbJ3XyaXqIhX/sQBzuc3/qzkX8hZ23q/aHjkaEvt3WHq
         k+OaTFfcxdRF/ehGcAcovyxCIUY9tCRFy/PUJJNcjRzb32J75IQ6umbZ1mQ1DcKYQ8hn
         VSig==
X-Forwarded-Encrypted: i=1; AJvYcCUNKa4WHxMUOu3FtoPD6Rs/yaHHUgTf9APgi4ZJIDe+NcaQxQwzZWfU1HcCwvRUq/0cs4sA1edrpyRAKQCT0EUHXzjwNBb/uQs=
X-Gm-Message-State: AOJu0YxvkgNelB7U77k6rjlxWYdcHiaFnbu8zZaR2z4Zi7q8l+NDW4HD
	guxbf5OcT0RUMF10zzG8UsZxOchbrKvZL8XkuLQtFCITswIEOyDs8EMxU0zGhho=
X-Google-Smtp-Source: AGHT+IGiEde7UPBGiRhMMfmiwE7ge9rg754xzPpOSOLXPC0m+zhjsdaHYVRHrGzYteNlUIPyOyzn9Q==
X-Received: by 2002:a17:903:1c5:b0:1d7:17e6:44df with SMTP id e5-20020a17090301c500b001d717e644dfmr702105plh.14.1707458040797;
        Thu, 08 Feb 2024 21:54:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXnAUy2TE5ScgV0UmrJplTHZOK0YL9ceqWuF8PjLcrKIaFyCwCuxkKfURl5N0512xrJ0WICPdCnZ2Xn+SILFJdjb3/EpAhN1PBIGkGQYXekKfMoJMK0GFiYBV0uUAID8BO+bHUyxas2moQ3DbvJIA==
Received: from ?IPV6:2620:1f7:3d44:7c48::32:3cb? ([2620:1f7:3d44:7c48::32:3cb])
        by smtp.gmail.com with ESMTPSA id z16-20020a170903019000b001d8dbb867b1sm710673plg.179.2024.02.08.21.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 21:54:00 -0800 (PST)
Message-ID: <f7de9480-d92e-462b-ac8f-8e1d3c90b886@gmail.com>
Date: Fri, 9 Feb 2024 11:23:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: File Manager Service in OpenBMC
Content-Language: en-US
To: Andrew Jeffery <andrew@codeconstruct.com.au>, openbmc@lists.ozlabs.org
References: <88ba0256-2c86-4727-97b6-dce02ba61554@gmail.com>
 <34f3ba2f2279f5c63b20b7dc0da80f3de53a0768.camel@codeconstruct.com.au>
From: Sunitha Harish <sunithaharish04@gmail.com>
In-Reply-To: <34f3ba2f2279f5c63b20b7dc0da80f3de53a0768.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: gmills@us.ibm.com, ed@tanous.net, geissonator@yahoo.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thank you Andrew for the reply.

When IBM manages a single server with multiple management 
clients(redfish clients), they need to save some server related data 
(host data) in the form of files at BMC's persistent file system. Here 
BMC is used as a common persistent storage, which is accessible to all 
connected redfish clients.

Additionally, for IBM usecase, BMC need not consume these files, as they 
are targeted to be used by the host/hypervisor. We control the file 
permissions accordingly to make it non-executable at BMC. We already 
have a implementation at the bmcweb currently at 
https://github.com/openbmc/bmcweb/blob/master/include/ibm/management_console_rest.hpp. 
This is being re-designing as i mentioned in previous email.

If community is interested to have a File Manager running in BMC, then 
this re-design can be a generic solution.

Thanks & regards,
Sunitha


On 09/02/24 4:48 am, Andrew Jeffery wrote:
> On Thu, 2024-02-08 at 12:52 +0530, Sunitha Harish wrote:
>> Hi,
>>
>> This email is about adding a FileManager Service in OpenBMC.
>>
>> IBM has usecases implemented under /ibm/v1 path at bmcweb, which uploads
>> and manages files on the BMC. This usecase is being re-designed, to stop
>> bmcweb from modifying and accessing BMC file system directly.
>>
>> To achieve this, a dbus & backend application is needed. This should
>> provide APIs to Create, Update, Get and Delete a file. This application
>> should also take care of security aspects of the File upload usecases,
>> before letting the BMC file system updated. Please share your views on
>> adding this application.
> I'm struggling to make sense of this.
>
> What are we actually trying to achieve? If bmcweb can indirectly write
> arbitrary files through this service there's no advantage. Instead we
> have a whole bunch of complexity and overhead.
>
> It feels like the GPIO conversation that we seem to have periodically
> in the project. I think we need more information on *the use* of the
> files you need to upload.
>
> Andrew
>
