Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEFF156C60
	for <lists+openbmc@lfdr.de>; Sun,  9 Feb 2020 21:23:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48G0q25WQkzDqSF
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2020 07:23:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com;
 envelope-from=rajeswaran.thillaigovindan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Y+jMopb1; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48G0pV2WHYzDqQl
 for <openbmc@lists.ozlabs.org>; Mon, 10 Feb 2020 07:22:58 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id k29so2594153pfp.13
 for <openbmc@lists.ozlabs.org>; Sun, 09 Feb 2020 12:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding;
 bh=7rwVukJWdnZ9FVjBZm1bWz3+Qs2kWYRkzm8X85NhctA=;
 b=Y+jMopb1+OXYMZkdyyhhWgKXtqy9Qv+EHrKQE9o7Ip/dXtg8P1N1O5DhNZKmtr+lfo
 /dek0hzvm4bIa8/DqkQc96ebHkHQ0Exzw+Xe8fQrfBJaytljBJH42uz5zaJ+08JBidbV
 G9aSKbzSEREt5HVmcXhpqByEp3zj6mTHKFBHQyJZim/Q0K3MtLcQ9XwhiP+9/1lDR+CX
 c7TLUZlCjTMsg+frtSt/viLRXKXRkz61/nwHUdh6dRCO5u8wqFhc7aN+cWOKGjX0JYqI
 hB7ziOt3z2uLkde0IIqwjdM6Dral82T+bExfBj2JSqzjBUUQ1nyTHRur02JQOQoipdI0
 xqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=7rwVukJWdnZ9FVjBZm1bWz3+Qs2kWYRkzm8X85NhctA=;
 b=eFYeVaauFVZWUqnCI28oMqmtq0AyCypCy+MI1lyle95m9vRTIaOnV3PCT1AyNyzgER
 UbYHi1T2ZoyghEP/GfAzmaZmCRf0gAUE3TsqQCAF1Wht3ZmykjVGu1jnZ0JIOeb/5Ifs
 gmxP7JXAdeCpjqaGCRQgcwcD3XWbwLV5kFU78hsoCQxTHztF8YNySu05Ma9FRxpoqf9k
 62qjDVYdefGaDm1xVnm88GXfweOYFlssBgImy0aX4v8KbgQp6dm8QbNI88FTYUhWSHhM
 6Tl0uCpdF30RBVvEMmtPBcr9cT9oC7LaR/IzpCw0riZn+wYnY23myKq9/jpeopKcSp/2
 /Ejg==
X-Gm-Message-State: APjAAAWGPgw1EDu+LJWu5FsHSH35eQVofpGIOhmltlvDVpTMfvJ1UZHx
 MbTIz6+AXBlV/LookjswbNw=
X-Google-Smtp-Source: APXvYqz7JTc7zhLu+sYfXZba8N90HifSHFtx6EdiTbgA3V2BNjThFDj7LRVvcuL608/MfTyTGJFMZA==
X-Received: by 2002:a63:3f85:: with SMTP id m127mr2663543pga.15.1581279774373; 
 Sun, 09 Feb 2020 12:22:54 -0800 (PST)
Received: from [192.168.1.4] ([122.178.217.21])
 by smtp.gmail.com with ESMTPSA id t65sm9627267pfd.178.2020.02.09.12.22.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Feb 2020 12:22:53 -0800 (PST)
From: RAJESWARAN THILLAIGOVINDAN <rajeswaran.thillaigovindan@gmail.com>
To: openbmc@lists.ozlabs.org, apparao.puli@linux.intel.com,
 James Feist <james.feist@linux.intel.com>
Subject: Re: Redfish EventService Implementation
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
Message-ID: <7a3d4141-ff5f-794a-6803-88a8bcfa3e02@gmail.com>
Date: Mon, 10 Feb 2020 01:52:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

ApparaRao.

As you have shown interest in this feature and submitted the design 
document, do you have any opinion on this? Do you see any merit in using 
D-Bus match in bmcweb to create event logs for life cycle events?  
Please feel free to weigh in.

Thanks,
Rajes

On 01-02-2020 02:23, RAJESWARAN THILLAIGOVINDAN wrote:
> Hi,
>
> I am going through the bmcweb code for implementing Redfish 
> EventService based on the design document 
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749. This design 
> is hooked to the journal based Redfish Event Logging. For life cycle 
> events(ResourceAdded, ResourceRemoved, ResourceUpdated),  using D-Bus 
> match, bmcweb can create an event log. This requires a JSON 
> dictionary, comprising an array of Redfish Resource Name and the D-Bus 
> path. This approach works only in case of one to one mapping of 
> Redfish Resource Name and the D-Bus path. For propertiesChanged 
> events, if the Redfish Resource property is not on the same D-Bus path 
> or the Redfish Resource property name is different from the D-Bus 
> property name, then an additional JSON dictionary to maintain this 
> information is required. With D-Bus match alone in the bmcweb, Redfish 
> EventService can't be fully supported. For the Message Registers and 
> the Resource Types that are supported, the relevant OpenBMC 
> application must create an event log in the journal using either the 
> phosphor::logging::entry or sd_journal_send() command.
>
> After realizing that with D-Bus match in the bmcweb alone can't help 
> to fully implement EventService, I prefer to avoid using D-Bus match 
> in bmcweb. Instead, I prefer to modify the OpenBMC application that 
> generated the event to create an event log in the journal. Do you see 
> any advantage of using combination of D-Bus match in the bmcweb 
> wherever it is possible and changes to OpenBMC application in other 
> cases to create an event log ?
>
> Your views are highly appreciated.
>
> Thanks,
> Rajes

