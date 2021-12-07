Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA05346C400
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 20:53:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7rZh5bNZz305L
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 06:53:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KlhSt382;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KlhSt382; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7rZJ0f64z2xsh
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 06:53:09 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id 7so594860oip.12
 for <openbmc@lists.ozlabs.org>; Tue, 07 Dec 2021 11:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ocpM13shdrzspJtzRbkfnFcsNjtIdLeSrTT2g1ZXEgg=;
 b=KlhSt382SwfpGFCkrH6ZqVbc7kTqq0K5xD0J0TieVmpOk+pQprsi6iF0SYbo7HRDkA
 Llzpz1yPrYAwwR603VeO+MPu4GPF1gSiiudAxC8/AiTkBIyVivzKmX1elT0iuBy0mhiD
 wHjo62yYzw+rwNTwIfXiSJok/pRGyEqamnchkVE3QT7Lo4wTTqg86nse0NhHfeDP/fYw
 EkFbhoXHBeBRsKAIpgehk54LkgtIeryqwpx5s+wBxKC9KQbiUrspQb74kcKhAwGO8+A9
 2+F8UbaIQtQxaITkkD+7iP0EUVg4DIkAINOP2bIT3qTdq+zw1kiuLQhx6AkxGvDvExX2
 lmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ocpM13shdrzspJtzRbkfnFcsNjtIdLeSrTT2g1ZXEgg=;
 b=n02+okZSatV+aq3otSxSV4+y29Pn5/A0KAPj2wciMGI+Ji7ihNJzdX12g64NRbv21e
 z7TDZyXUUnT+PdBTO105D2l99ay/iuqqLPeVSDh2iT01ua4SMdtL6jA/a6l1CIQGsFPx
 nu8LGXV84x5ilAYgeYF4mL4ijitsNXsGB1M56vCDIJsEjlKzahyOHX+0dnvqNwcmmoAs
 zl5AhFjBtwpDM4xP7T0zEOsoGaSUllM+dBudrJ7ak2WlbAccGfDZfhtLV6+sV8gvWXfS
 viHfcfn6IcL8UkZ6jZWfcHgN9CHbho9XsbXVEAgIZ70vAAQGVQNH6Aq7icBtui6gpkcX
 Invg==
X-Gm-Message-State: AOAM532C6NH5P2ayUQNoLvxWCviT564faUpo1ZQhdP8/tNykmiEt/kpJ
 PImEGAeWZ0eBnXsVz4IYU+4=
X-Google-Smtp-Source: ABdhPJz9CzLS0f3B265ofV4rL23LMd8YvSPc0WWvZKz7yBSBzmiOhGYjDWJEYa7Vw5nWmyJ8I0tQPQ==
X-Received: by 2002:a05:6808:23d6:: with SMTP id
 bq22mr7233235oib.71.1638906786835; 
 Tue, 07 Dec 2021 11:53:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q22sm103043ots.62.2021.12.07.11.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 11:53:06 -0800 (PST)
Subject: Re: [PATCH v3 1/2] hwmon: (pmbus) Add Delta AHE-50DC fan control
 module driver
To: Zev Weiss <zev@bewilderbeest.net>
References: <20211207071521.543-1-zev@bewilderbeest.net>
 <20211207071521.543-2-zev@bewilderbeest.net>
 <20211207175015.GA772416@roeck-us.net>
 <Ya+0YDWIRBQFnEDb@hatter.bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <9ff85af2-f707-ee62-cc32-2dd628e5c63f@roeck-us.net>
Date: Tue, 7 Dec 2021 11:53:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ya+0YDWIRBQFnEDb@hatter.bewilderbeest.net>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
 Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/7/21 11:22 AM, Zev Weiss wrote:
> On Tue, Dec 07, 2021 at 09:50:15AM PST, Guenter Roeck wrote:
>> On Mon, Dec 06, 2021 at 11:15:20PM -0800, Zev Weiss wrote:
>>> This device is an integrated module of the Delta AHE-50DC Open19 power
>>> shelf.  For lack of proper documentation, this driver has been developed
>>> referencing an existing (GPL) driver that was included in a code release
>>> from LinkedIn [1].  It provides four fan speeds, four temperatures, and
>>> one voltage reading, as well as a handful of warning and fault
>>> indicators.
>>>
>>> [1] https://github.com/linkedin/o19-bmc-firmware/blob/master/meta-openbmc/meta-linkedin/meta-deltapower/recipes-kernel/fancontrol-mod/files/fancontrol.c
>>>
>>
>> Hmm, that reference isn't really accurate anymore. I think it would be
>> better to just say that the device was found to be PMBus compliant.
> 
> Sure, will do.
> 

Makes me wonder: How do you know that the referenced driver is for Delta AHE-50DC ?

Guenter
