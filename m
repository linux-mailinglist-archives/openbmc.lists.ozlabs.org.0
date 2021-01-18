Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 544FA2F9C05
	for <lists+openbmc@lfdr.de>; Mon, 18 Jan 2021 10:50:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DK6Tj0CySzDqc3
	for <lists+openbmc@lfdr.de>; Mon, 18 Jan 2021 20:50:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C8voBwXY; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DK6Sn2l4KzDqN6
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2021 20:49:28 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id s15so8352388plr.9
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2021 01:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=DE1TXcjfvdD5sJWQ3XEnyRoHR1wYsSR50DGpTE99eo0=;
 b=C8voBwXYz3jmpiU3pOvVuyn86XDxqwjMv/DsGIF0xSlF7RMQ1mt7snIUVRHo8HJ5mA
 6FAxew//znpl6mMzRa1QWiuG0IXSpE0JxoJsX3vaot2dPbGPea3IhK3ZN3v4NDdUnGTY
 i8PdfA9WAtwicBsbkF7lg30IT5gImRR1mqYtDUInNiezLlrEpoK0I919D+1TV0cJGgZ/
 v6Dqu4I3xEkHpUZTBCDrnA5xGwBF1g2B/5tFEJNtV8FnXopL5KayauPuwKttMnAChfjy
 HiDouSwt8Cq+7aSlsiw52yF/ifyX/dmFoX6tdL7t73JCyTqBSZodoZ4YOlpRlCnjrD+M
 j+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=DE1TXcjfvdD5sJWQ3XEnyRoHR1wYsSR50DGpTE99eo0=;
 b=RVyt7VzoBEC8ELPm/Wjt0Elx/qdIVm8jpWXuVMk6b1vJz4ZM7WGYp+sWUJH3twZL7n
 cXEAKoYBagJTkoa0uuSXJRzNoOHYHUvQXsGgl+7Yd7GnEYP6tGk71qOOwB9MwDQT161F
 VtHw7SmTjOk79DdXgIHvkrBHkBwtlu/TlB0HAKIK7UNPuVtN2ChIE6/qWXuWdDuoPSmX
 rOaB/mtffd3jw8IDu11ajbK22AScnTpvKWDscs1MwN8+PjVKr20rePhapfDc3gKqFh/G
 2MRZG4GTsFB25h6HJiWZewdrYb5yAU7/5hPbLE1QRdd1xR8mWyyDoLIlQM1fr/F/Mdqe
 WIJg==
X-Gm-Message-State: AOAM532/1CMWpBRsbImkm+8kJ1MkUDtIxLbXww67+A9b5frlc3URV2mq
 Hdof6IjsHZqWAtcE8H6VHXg=
X-Google-Smtp-Source: ABdhPJyJbyMg5sS8gOvKoVqp9DSIaIE2wUYRj1yikQEEMyH7GPfkdrTmeoP1W4xcp3u/FCSNSMlj0w==
X-Received: by 2002:a17:90a:2e83:: with SMTP id
 r3mr24456007pjd.112.1610963364769; 
 Mon, 18 Jan 2021 01:49:24 -0800 (PST)
Received: from [192.168.0.102] ([124.123.106.104])
 by smtp.gmail.com with ESMTPSA id o190sm15287773pga.2.2021.01.18.01.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 01:49:24 -0800 (PST)
Subject: Re: pthreads at bmcweb
To: Patrick Williams <patrick@stwcx.xyz>
References: <5181a536-a026-2f91-7335-f6a75b4694ab@gmail.com>
 <X/2ehAMgWkmUZoAr@heinlein>
From: Sunitha Harish <sunithaharish04@gmail.com>
Message-ID: <759a5406-aff0-3097-d602-ac4787c4c38b@gmail.com>
Date: Mon, 18 Jan 2021 15:19:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <X/2ehAMgWkmUZoAr@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: openbmc@lists.ozlabs.org, apparao.puli@linux.intel.com, edtanous@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 12-01-2021 18:35, Patrick Williams wrote:
> On Wed, Jan 06, 2021 at 01:32:11PM +0530, Sunitha Harish wrote:
>> Ed's suggestion is not to use the pthreads, instead implement
>> alternatives to do the same job, so that the binary size is kept
>> minimum. He mentioned: /"//Considering that's a ~30% increase in binary
>> size to support one line off code, and most systems are already at their
>> binary size limit, no, that's not going to be acceptable. We can either
>> patch boost to use this
>> //https://man7.org/linux/man-pages/man3/getaddrinfo_a.3.html
>> <https://man7.org/linux/man-pages/man3/getaddrinfo_a.3.html>//or we
>> could build our own resolver type that calls that underneath. This was
>> based on a quick lookthrough of solutions in Google. I'm open to other
>> ideas here". /
> Since we're using systemd and we have the `resolved` feature turned on,
> why not just send an async dbus message to the resolved.service?
>
> ```
> $ busctl introspect org.freedesktop.resolve1 /org/freedesktop/resolve1 | grep ResolveHostname
> .ResolveHostname                    method    isit          a(iiay)st                                -
> ```
>
> https://www.freedesktop.org/software/systemd/man/org.freedesktop.resolve1.html

Thank you Patrick. I will try implementing this and verify if all the 
async event notification scenarios works good.

Regards,
Sunitha
