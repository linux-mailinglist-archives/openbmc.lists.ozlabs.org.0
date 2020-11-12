Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8022B11FA
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 23:44:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXGqb1K1MzDr2K
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 09:44:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=X+IE/WVc; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXGpm5WBHzDr3F
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2020 09:43:23 +1100 (AEDT)
Received: by mail-ot1-x333.google.com with SMTP id l36so7241763ota.4
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 14:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=U5tYqoYvq/LiRQFKtYFmqEp9uPcLFOPhmpMZW9n3X4A=;
 b=X+IE/WVcL61A/t12rlgUKZwLy23/J4OYfjVXr0SE9YpuRhpv6no1DJ3myd8L3K2+MW
 auAEgrmYMqEHHOy66YFNjqCayPcJ7/Ees4sgKlF5Mb32rHsINrHYH79XpNPU5l2MlzIm
 jAypjN794fEho7Zu2hQUncPFXKKYAcri52DAl7G1cMlXlR+j+vkVauwXdX+7KMMdQmCL
 rPYxsDVU2vn0thskktBIivFITk2KgAG4u0zOmPMd0kLjwq8gvv4m50iIm4Yiyf8PgcUV
 mgQ32ygsnpYbf7HayTwWq57NiBa/5pR09Hrgd0gnMlGwGoXp5KN7QymTLa6XVPTI1838
 9iEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U5tYqoYvq/LiRQFKtYFmqEp9uPcLFOPhmpMZW9n3X4A=;
 b=bsBfZicwBZRQhKsRqSTB+UBQU3SA5I2IKBNIyd3GqVHrhyguGkRPC9QfX5M9s2QpR6
 lrBNZ5isEl0Li/fIp18ZDXIjDEsURa4NoUiH/buCb1b9WBeBAQVX4kBssQzSCerl9hNu
 1U3cZIp71sVu1lIvDEji5OIbpglhq+o6QsdK7pvYRX8pyLftH5bBRPD4BksfaaTwb+qQ
 5L4RctuUS+9u8f1UDZ4oOjJbzTLJ5u0elMF7loI3lMQnc3UyaCti4UIRMsjDtG7dm7LX
 Mv0NqVJ6Xscs5j0Cp9dWp0PEr7KEHHKKbBmOvOk5blWAckL/bcnc1nmNe/o74sIXS5tv
 moUg==
X-Gm-Message-State: AOAM533VQssNY1THk1RCfBcQAAYPM1U7J1VfluzL+xV+h6g7OtfDW3av
 BZ8kJs1vD6wlhChAzabFRY4uGx3txO1GmQ==
X-Google-Smtp-Source: ABdhPJzcG77c+bc1kCegAiblZ3jK5AkhQjyNpzRmPG6fbjkdtX1+XjjhxUfZy+mTavlJSU0EEymHHQ==
X-Received: by 2002:a9d:61d8:: with SMTP id h24mr1054662otk.217.1605220999887; 
 Thu, 12 Nov 2020 14:43:19 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id w3sm1573537oov.48.2020.11.12.14.43.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 14:43:19 -0800 (PST)
Subject: Re: Vertiv's CCLA Schedule A update 2020-11-12
To: "Troy.Lee@vertiv.com" <Troy.Lee@vertiv.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <DM6PR13MB253751B35A96B9C5FE3CDAEEEDE70@DM6PR13MB2537.namprd13.prod.outlook.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <51041b4c-37df-8ace-dec1-666b570cbe55@gmail.com>
Date: Thu, 12 Nov 2020 16:43:18 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <DM6PR13MB253751B35A96B9C5FE3CDAEEEDE70@DM6PR13MB2537.namprd13.prod.outlook.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/11/20 9:26 PM, Troy.Lee@vertiv.com wrote:
> Hi team,
> 
> Please help to update Vertiv’s CCLA Schedule A list.

Done, thanks for keeping it up to date.

Kurt Taylor (krtaylor)

> 
> Thanks,
> 
> Troy Lee
> 
> CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with it 
> are intended solely for the use of the individual or entity to whom they 
> are addressed and may contain confidential and privileged information 
> protected by law. If you received this e-mail in error, any review, use, 
> dissemination, distribution, or copying of the e-mail is strictly 
> prohibited. Please notify the sender immediately by return e-mail and 
> delete all copies from your system.

