Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B999B416AFF
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 06:29:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFzb64wJ5z304w
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 14:29:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qaNfiHWP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=raj.khem@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qaNfiHWP; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFzZh37Ncz2ynf
 for <openbmc@lists.ozlabs.org>; Fri, 24 Sep 2021 14:29:31 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id h3so8705116pgb.7
 for <openbmc@lists.ozlabs.org>; Thu, 23 Sep 2021 21:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=olPxty5hYtWik487FoN7+rIMxmrkvQY8pmN4ISVe5qc=;
 b=qaNfiHWPFAAqZSXHp4qy94z+4wc9WJKMBf164AeGJzcPbnG/WpLn1H7o8g244ma0zy
 zCUwWdfnaXI0ElhkPcNAANAtub/l4Z2EMlhMjwHjpOIwnv6wxf+3WpMIRCp4+w9Of2I+
 GLOjTiqEfo4c3CMj1nwH/PATjMJ7XXJdxQ1jxio8qOFkmDrwmGav31VGKvNdmb4dZ2vm
 7T3wO/+lNRHDqxUCTKIjdJkGO1k9jWkNDKXcz/kyhZnhj1vcDnweNg+y5sGgWS5Q9vlJ
 HMPJHuihzDD2cqmNmNh044ZDVKYSDN+LRqENzrQA129rI+gTg6WPLWYrjGtskalfEskl
 ewNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=olPxty5hYtWik487FoN7+rIMxmrkvQY8pmN4ISVe5qc=;
 b=Rudy22am3wR6vDpts4PsFj59Cl7IfBRml1fDqXXLrffT3ytp67A+ERFIzBE9w09Ba0
 xZVc4OMhueHCl5sU1q6dlYZoLUoNKSDG9lIP4cQgrH5gQSkpRnZMa3HutamUcanlqzRU
 MTBaUjXM3+RZj0nIKCa0nTL61evm24ACp5ZIz2ogWGimkC8dwC671PYHBVts/wj6D1WS
 Ee9+Tv0FItcBei6HC7IfGA7fGCbWknKIwktO6eBY4/sZR0ZfmiJ5LOSMZpE+mN5L11Js
 eoNnCzbmByS+EP4TPBBPkM/37P+lRUQRQGj8VxzzG/VC/04MRPbaqe9vbE0JipH0ZZFw
 8WYw==
X-Gm-Message-State: AOAM531qBcajrUIHvPrSvKXA2aB/jnqR/YtTQkimIL4HwQwBFkqkHLk/
 0qapQE1PqIJ1EXES9wZgzV+mYxO61Hi2zg==
X-Google-Smtp-Source: ABdhPJx+lstCfj6gukNurJeYK58eJ9+jildgq9idrxB7Es7dpZASVVDpkD8DiQODl2G/djWCK1VI4w==
X-Received: by 2002:a63:7402:: with SMTP id p2mr2066462pgc.472.1632457768062; 
 Thu, 23 Sep 2021 21:29:28 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0::d11e? ([2601:646:9200:a0f0::d11e])
 by smtp.gmail.com with ESMTPSA id t6sm7153406pfh.63.2021.09.23.21.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 21:29:27 -0700 (PDT)
Message-ID: <5b7e2d77-85f7-cc88-5260-05e6b012f3ad@gmail.com>
Date: Thu, 23 Sep 2021 21:29:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [oe] openssh-dev package and populate_sdk conflicts
Content-Language: en-US
To: Matt Johnston <matt@codeconstruct.com.au>,
 openembedded-devel@lists.openembedded.org
References: <94429904ec0c9d75919cda42339a2fafcbc35fe4.camel@codeconstruct.com.au>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <94429904ec0c9d75919cda42339a2fafcbc35fe4.camel@codeconstruct.com.au>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 9/23/21 20:08, Matt Johnston wrote:
> Hi OE list,
> 
> Recently OpenBMC merged a change to install openssh-sftp-server package
> alongside dropbear sshd [1]. That caused a conflict in "populate_sdk" which
> installs all available -dev packages [2]. 'openssh-dev' pulls in an
> 'openssh' -> 'openssh-sshd' dependency which conflicts with 'dropbear' [3].
> 
> What would be the recommended way to handle that situation? For now OpenBMC
> has merged a change to disable building openssh-dev (it's empty since
> openssh doesn't have libraries) [4].
> 
> Should non-library packages handle -dev packages differently? The default
> -dev package comes from bitbake.conf .
> 

perhaps set

RDEPENDS:${PN}-dev = ""

in openssh

> Cheers,
> Matt
> 
> [1]
> https://github.com/openbmc/openbmc/commit/26dbcdbd917e4f22fb400153da0d3e7255c8e646
> [2]
> https://github.com/openbmc/openbmc/blob/49465582e16221caf74cbdea11c87600a02bf47b/poky/meta/classes/populate_sdk_base.bbclass#L5
> 
> [3] https://github.com/openbmc/openbmc/issues/3819
>   *   - package openssh-8.7p1-r0.arm1176jzs conflicts with dropbear provided
> by dropbear-2020.81-r0.arm1176jzs
>   *   - package openssh-dev-8.7p1-r0.arm1176jzs requires openssh = 8.7p1-r0,
> but none of the providers can be installed
> 
> [4] https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/47089
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93114): https://lists.openembedded.org/g/openembedded-devel/message/93114
> Mute This Topic: https://lists.openembedded.org/mt/85831414/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
