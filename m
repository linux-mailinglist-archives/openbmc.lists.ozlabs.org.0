Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CA1109141
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 16:49:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MBL15GvjzDqcy
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 02:49:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335;
 helo=mail-ot1-x335.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AMVlFkq8"; 
 dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MBK96mmtzDqXP
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 02:48:45 +1100 (AEDT)
Received: by mail-ot1-x335.google.com with SMTP id l14so12955275oti.10
 for <openbmc@lists.ozlabs.org>; Mon, 25 Nov 2019 07:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=WlcGVrtvhU+P7PvxoDuGUpfPFA+6kIraoqxqaW2sPzY=;
 b=AMVlFkq8PQsHEeafXeHeohxDrsDLaPQ+ZI1NzBPSUQQCofETJRVb/NSkzy7B/JPR06
 AoAjkeTFh8+hjwYqboIj42kydvBAlFxPBfoq55yeKmHzGQUBfC8rFCQcnj4Rb4h4wf3s
 5n4k2y7SRcqRlYSnl/yB2cbkSwb4X6xmNr1ugzmfgkKSj7PD0z2S3WrjuUPmagW5nRfX
 nX13tlA0QZ94T1ob1mPXfup1ISFKKjNPRQJXaBwOfNrGQMS9xkSW03h0gmzFlSWxnURS
 cvFHZ/QneD/Ct9wQBzD4eo7K55jgcmRNem4p0TM8b/j/q2ieBSk3hc+3QibSzDT0kF78
 l57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WlcGVrtvhU+P7PvxoDuGUpfPFA+6kIraoqxqaW2sPzY=;
 b=pdt/Ud+dyg/Cyv/1ZHWQoOiT4MPsdOCpVKuQciMq/uBjWOR+yBQy9ZJeTfj2xM5DMz
 hGi0gGZVrl5jCvrP3VNpM6VRm0ooasu4f3k3om1M22EP8uYcezU38DO2mwUma3WNh4VT
 uzowP0vnrWsCrmh0zBoIDntWsukm9ZjJf2KkZdK3gHhyFX+eE6e1fvhnxSS1RHtTWJfM
 7Ym0gJpXaYd/YPbVQb/UOS4WJhOZtVuaYSQFhCmFKAZLPI5SkrNvZS/UowrWinNJXrqx
 rCvrniteJpqKZCDzOAKSUfRkoGTPvrbFdYDe4/OvCUyh5pIDpqbg2/jFOb2rYxLoMlAg
 p14Q==
X-Gm-Message-State: APjAAAXLaO/tPu5csl+s9H19xWQrj4GCj/HiEghH744b79sEw/VoTcaa
 7IXf3SfQtQUztqyE3ICWKDKfYphT
X-Google-Smtp-Source: APXvYqyFppO0P3w1rmVMIFT/reKI5vU04sGjD50WJ2h+amzB94uklbsVnCqBOPwUKEUEFXOZEHbjAg==
X-Received: by 2002:a9d:18b:: with SMTP id e11mr19524990ote.305.1574696922354; 
 Mon, 25 Nov 2019 07:48:42 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id 68sm2519083otw.56.2019.11.25.07.48.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Nov 2019 07:48:41 -0800 (PST)
Subject: Re: Re-joining the project
To: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20170925113628.GA4313@heinlein.lan>
 <20191119001526.GB98839@patrickw3-mbp.lan>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <74f7e36e-2894-05f0-636a-26f997c5e71f@gmail.com>
Date: Mon, 25 Nov 2019 09:48:41 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191119001526.GB98839@patrickw3-mbp.lan>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/18/19 6:15 PM, Patrick Williams wrote:
> On Mon, Sep 25, 2017 at 06:36:29AM -0500, Patrick Williams wrote:
>> (deleted a bunch of text)
>> -- 
>> Patrick Williams
> 
> Hello!  Observant individuals might have noticed that Sai added a
> familiar name to the FB CLA.  I started at Facebook a few weeks
> ago and will be a developer on the OpenBMC team here.  Lots of

Welcome back Patrick! I look forward to working with you.

Kurt Taylor (krtaylor)

> aspects of the project have changed and I have two years worth of
> mailing list emails to catch up on, so it'll be a while before I'm
> ramped up much here, but I will be starting to participate more
> regularly now.  Looking forward to catching up!
> 

