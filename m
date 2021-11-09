Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCF144A4F9
	for <lists+openbmc@lfdr.de>; Tue,  9 Nov 2021 03:49:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpC9s4bFfz2xXW
	for <lists+openbmc@lfdr.de>; Tue,  9 Nov 2021 13:49:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=MpFq3C/Y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=suichen@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=MpFq3C/Y; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpC9P1WBSz2xWd
 for <openbmc@lists.ozlabs.org>; Tue,  9 Nov 2021 13:48:54 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id q126so13112595pgq.13
 for <openbmc@lists.ozlabs.org>; Mon, 08 Nov 2021 18:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=axRAMEmTmSMcYfL3WAtS2oozXz72qWyBxcxKMr/zmYQ=;
 b=MpFq3C/Yxhy0cw7J6zymgZbAPPMakEijuJ3gcE/H0vJu15VM4Z8mCCAOEXX3zhiSMW
 Eb6t4JVquux5Wns6hjO8mvEa+eZC0InqWOre+pSPmBwp76A6jelFa3+BAfLZFKKzfrme
 4/MnAOmmeULE1zJwS5rHJUdDVIW5JkHXeE3n74S09CzUdI7yEyf0IMOTHcAbdGqUbg3l
 0xAKba+8voD3cA4wp6ipynnWejwLVw8Hl/oQYbwnpPA64I8GMcwdgVkpz8Mt3HpSN7Jh
 oz+ZDB/n5Y8zdOWQRVdq5pKtRmMs1OgqL0LqHkRxvIlksjH446m6KQkNQuWtcFKmV9kX
 Smqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=axRAMEmTmSMcYfL3WAtS2oozXz72qWyBxcxKMr/zmYQ=;
 b=7evNELg4qjLWRITZabhBJm6ahMTdn4nu/QYDF45ONnUDNY7fsBNYuD2iZ7KTTPW0ML
 CNKF46198KVauvT3CctRjSTn+D1BLgFCwSGi5MebA3tanpUgxKPx4z1LFjpTYjZL+kmP
 wsdjBh42eMWvJBMf/YRxA/lBWeBPgJLd1jDiykqnh/WSWuTcBqaC1o+ztKTIMPpSGeyp
 /4AfNYVBWeYZ4wwd2KCgB0phMEat1r2zTj5+usR2tUJEl5eM2BSBi7UBVY9Bxz91kCf1
 hPJLltRsnfXOrdsYF6a/ETVRBZcmQoRn5cJ2/JVD7qYiCAwpW1/2pcyrDvgLhcEy53rb
 uGVg==
X-Gm-Message-State: AOAM531EattAKwb5lH9vfzmaSbijXxzZpXqadsmkHOcHAlQUs6nxHvlB
 MIc1JBDObt+/ElOoq0fdGvdxodf5Q/7uDJoT
X-Google-Smtp-Source: ABdhPJwSetNgrM1u2ECwxaOf7ssOc9sP62iXyCr5izCZ8Y4/cwQLJU1wvgAGE1IDJN8aoCETPHxy4g==
X-Received: by 2002:a62:3387:0:b0:44d:7ec:906a with SMTP id
 z129-20020a623387000000b0044d07ec906amr87312856pfz.69.1636426130993; 
 Mon, 08 Nov 2021 18:48:50 -0800 (PST)
Received: from [100.115.92.196] (c-73-189-176-14.hsd1.ca.comcast.net.
 [73.189.176.14])
 by smtp.gmail.com with ESMTPSA id w129sm12500044pfd.61.2021.11.08.18.48.49
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 18:48:50 -0800 (PST)
Subject: =?UTF-8?B?UmU6IOWbnuimhjogW3Bob3NwaG9yLWhvc3QtaXBtaWRdIFF1ZXN0aW9u?=
 =?UTF-8?Q?_about_IPMI_SDR?=
To: openbmc@lists.ozlabs.org
References: <DM6PR08MB551412A7CBCEDFAA6D76C495DC919@DM6PR08MB5514.namprd08.prod.outlook.com>
 <DM6PR08MB5514160535BE1676DBC179E0DC919@DM6PR08MB5514.namprd08.prod.outlook.com>
From: Sui Chen <suichen@google.com>
Message-ID: <91c35372-7329-a80c-8be0-3e9d79251fdc@google.com>
Date: Mon, 8 Nov 2021 18:48:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <DM6PR08MB5514160535BE1676DBC179E0DC919@DM6PR08MB5514.namprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/8/21 3:37 AM, Chris Chen (TPI) wrote:
> Hi all,
> 
> I think I figured out the error message is due to the 
> phosphor-health-monitor package. The phosphor-health-monitor doesn't 
> have the interface of org.freedesktop.DBus.ObjectManager and with the 
> GetManagedObjects method call, so the getSensorMap() in the 
> intel-ipmi-oem would be failed.

Thanks for catching this, it seems there exists a change to make 
phosphor-health-monitor compatible with `ipmitool sdr`: 
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-health-monitor/+/41228

>  1.
>     is it only for monitoring CPU and memory sensor values?  it looks
>     like there is no explanation of it is in the phosphor-health-monitor
>     repo.

Yes it is for monitoring the BMC's CPU, memory and storage usage, and 
other metrics.

>  2.
>     can I remove it? If yes, will I miss any features?

Yes it is safe to remove, there are plans to use phosphor-health-monitor 
sensors in Redfish but the Schemas and bmcweb-side changes are still in 
progress, so you won't miss too many features for now.
