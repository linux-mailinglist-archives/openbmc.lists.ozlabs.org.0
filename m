Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C60C24C6EBA
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 14:57:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6hm46Ljsz3bXy
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 00:57:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o+Icet+A;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2d;
 helo=mail-oo1-xc2d.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=o+Icet+A; dkim-atps=neutral
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6hlh2fzlz2xWd
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2022 00:57:34 +1100 (AEDT)
Received: by mail-oo1-xc2d.google.com with SMTP id
 i10-20020a4aab0a000000b002fccf890d5fso18843484oon.5
 for <openbmc@lists.ozlabs.org>; Mon, 28 Feb 2022 05:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OQXq8SH7J2jGjbN+Ln0Krx+hZyTKyM2L283Eje0Rl+s=;
 b=o+Icet+A3e3amogcnwE0LZFgYCS1c3zcxIEg9oYMUgh7aJx9LZ5aWKNkJfS4Pq2x/O
 MWldII8xSmeLGFITWzgOlLaNe8pAwkXHMPhjG08dSq4Qof0rtBefeQY3NqtkewnvZMA0
 ly1la7NZVfTV2bIEh+o7w0J3UHB+cEe+7QcaLSRtioFrERv4DNrTuvLL2fAB7q/j/UMZ
 uTTMgZHed4j/jTiMkAOSwrNuvtN5lYtQCTOU0Kf48CjeEPLWR/sr+oSmD5DAwUbIpeAT
 4ruElN01gl/Y+L85OTriEsX7fXZKPo0h+k+FfkXBEdVSfZCAqOtlRlBsyX3qV2eee/p7
 G1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OQXq8SH7J2jGjbN+Ln0Krx+hZyTKyM2L283Eje0Rl+s=;
 b=Hcy9CAri6ZH7MhoRztBVjQe+tqpNCbpNBY0rThIucXXb0QM0eIR8HhcFYgihSwL81U
 52GivSWDqU1RuIDz8VEx2NaAUqlMyRKZ+k7E/l38V6V9DRn6TqI1g7BRjpTD4DZ2tupk
 rJ2BoUT6nTRb5agRp55HMzRNq699nrJ4LLPS9h20GgQn+2xzlw3euaMLjJK4Bd108VDq
 7mneYsvmJxVN680lsLJzl3Rr5ORDWvB7aISWWM7GcdU1GB7FBGSl1iEZsgz0oJYUHQyT
 xCawuNlX1dNzqC0o0On7LpZIXZWWOYbbNzpiUjS2RJjB0Tdoso2OHLjDNTwYJ512OwwE
 qRrQ==
X-Gm-Message-State: AOAM532lNRdKvomyUYSbcA1DE4pfhDnIUNPhphwQiH8vBYHPO7+lmUa0
 QilkeZFtSeuMAzxB5hulLPI=
X-Google-Smtp-Source: ABdhPJzpjJxKssZapkzltQ3XzA7dQSO9RfA/0OKeQZG1pM0V87IaqJKFXghJvuuE6QdlpO/bQjqaLA==
X-Received: by 2002:a05:6870:7c07:b0:d7:e5c:62ac with SMTP id
 je7-20020a0568707c0700b000d70e5c62acmr4494840oab.54.1646056649864; 
 Mon, 28 Feb 2022 05:57:29 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 z26-20020a0568301dba00b005ad0fc5abe4sm5050787oti.16.2022.02.28.05.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 05:57:29 -0800 (PST)
Message-ID: <fbb305e3-73b3-7a2d-99cf-a7205b7344ff@roeck-us.net>
Date: Mon, 28 Feb 2022 05:57:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>, linux-i2c@vger.kernel.org,
 Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>
References: <20220201001810.19516-1-zev@bewilderbeest.net>
 <YhyLIRFbs226KTwA@hatter.bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <YhyLIRFbs226KTwA@hatter.bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/28/22 00:43, Zev Weiss wrote:
> On Mon, Jan 31, 2022 at 04:18:08PM PST, Zev Weiss wrote:
>> Hello,
>>
>> This series adds support for a new pca9541 device-tree property
>> ("release-delay-us"), which delays releasing ownership of the bus
>> after a transaction for a configurable duration, anticipating that
>> another transaction may follow shortly.  By avoiding a
>> release/reacquisition between transactions, this can provide a
>> substantial performance improvement for back-to-back operations -- on
>> a Delta AHE-50DC (ASPEED AST1250) system running OpenBMC with dozens
>> of LM25066 PMICs on PCA9541-arbitrated busses, a setting of 10000 (10
>> ms) reduces the median latency the psusensor daemon's hwmon sysfs file
>> reads from 2.28 ms to 0.99 ms (a 57% improvement).
>>
> 
> Ping...Guenter, any thoughts on this?
> 

It sounds reasonable to me, but I don't have access to hardware anymore
to test it, so I have no means to confirm that it actually works.

Guenter

