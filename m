Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0130DFD25
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 07:31:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y2DJ2k44zDqK9
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 16:31:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=santosh.puranik.ibm@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EOX2gTwR"; 
 dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y2CG3ylHzDqJs
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 16:30:18 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id t3so9218150pga.8
 for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2019 22:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=UmtCax0XUs07BEtp+gEYNW3b0BDLqXwj+ajdLTTjvS8=;
 b=EOX2gTwR8nw6wmmJUDIIHV3RdQ6g28LUobbf8Iy/uu4Bn2Rp8XkbrVkobHC7qVp6mO
 hdVsijbYi1jUbBKFL5l3224/n2Oq8EhbAqbUTmxqvihMl37qKceRIBocYFY0OznUZcny
 gD4mMorEvTTPPfKYOXX7eXefCwOXnx9+Gr2eozsyt0wBbs8DtIn8wCerRzLQH62HWXGv
 oDT7oti5rf2iFa+UQhpTfcOpyD0i56X5+iBrgke4xaH9cBk8e/bw86aSfd0PRZuNsMYD
 Ql1y0frXfgoXgGeZL1ckHaD8bcnPk1CxynaIY1Cg8T+qZWsQ/1HhIXOTOuqTnM9rYUxF
 PXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UmtCax0XUs07BEtp+gEYNW3b0BDLqXwj+ajdLTTjvS8=;
 b=YDSVk7V/9RXArj1Znve2uEF7d57mcED/zAHtGzszwaFsn3OyK7KyqsV3fhU+3NwMuw
 FxIGeMpmzUPeNR40gGKbJ2zxnhx/Gn4CvkliUCQX6g6A4wwBqzoL09ZYLWFAK5UQiw/6
 SrUSEm2Da8hDGJWQL3gsTkPpHl2iiHBsehX6z7zTUN/H6TiPuHg2zx+rEERvJekaeYhu
 bPVkZ4BvyK3U7knc4QFB9e5xaeccvDjnQ1cPwVN3UjU8TkapkolMl+yVTna0q8VMg7rP
 MdNyoiE3MSsET09MsxbGLtSSaxQ/iWqxddOyZK7pBSMG6wRCEG7q1rrfElsez76AlEKp
 HlvA==
X-Gm-Message-State: APjAAAV+PT5OlwbqbxBjCiR59P9eOqsLVzlOCb3RM7SMGYb9rssOVfOf
 PhA6Cm0R9fCEGvw2zduYRvCVfcmG
X-Google-Smtp-Source: APXvYqz7rLYKpdMxlAZzjFnNQ2DFexFIBQU3TXB+SQMf0FQ3Jluc9eM5gmPUUFd1d1qYC6UQoY8Nvg==
X-Received: by 2002:a62:4d:: with SMTP id 74mr1180760pfa.257.1571722214609;
 Mon, 21 Oct 2019 22:30:14 -0700 (PDT)
Received: from [9.199.76.54] ([129.41.84.92])
 by smtp.gmail.com with ESMTPSA id r81sm18759135pgr.17.2019.10.21.22.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2019 22:30:14 -0700 (PDT)
Subject: Re: It's been fun
To: Ed Tanous <ed.tanous@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <27c9e9df-6d1f-5fce-ed88-57d9cbfa71f9@intel.com>
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
Message-ID: <24edf1b5-6680-650e-47b3-94a53b724298@gmail.com>
Date: Tue, 22 Oct 2019 11:00:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <27c9e9df-6d1f-5fce-ed88-57d9cbfa71f9@intel.com>
Content-Type: text/plain; charset=utf-8
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ed,
It was great interacting with you on gerrit and IRC. Always learnt
something new.
I wish you all the best in your future endeavors!
--
Santosh
On 22/10/19 2:04 am, Ed Tanous wrote:
> All,
>
> This week will be my last week at Intel.  I'll be moving onto something
> else non-OpenBMC related for a bit;  While I may check in on the project
> from time to time, it's going to stop being my day job.
>
> You'll still be able to reach me at my other email, ed@tanous.net, and
> several key people across the project including the TSC have my cell
> number if there's some unknown OpenBMC "emergency", but I doubt that's
> going to be needed.  Functionally, I've made sure that every repo I
> maintain has backup maintainers, so as of the 25th, it will fall to
> those individuals to do new reviews for those individual repos.  I'll be
> pushing updates to the MAINTAINERS files shortly to that effect.
>
> Thanks you for all the patches, ideas, reviews, and merges that others
> have done for me over the last couple years.
>
> Until we meet again,
>
> -Ed
