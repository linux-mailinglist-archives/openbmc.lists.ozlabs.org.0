Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5648B1D18FB
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 17:20:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Mddp3Q9mzDqgN
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 01:20:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sK0Nv2h2; dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MdPG10VBzDqfs
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 01:09:21 +1000 (AEST)
Received: by mail-oi1-x22b.google.com with SMTP id r25so21703028oij.4
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 08:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=VmtAHZPCQnUN98Y34tXll6MmGOtVH/+ZH612dT5FXWA=;
 b=sK0Nv2h2egvupFXymULl7nvEVC+EIjG6/VjmLs+HzsGIy848QZ9EC3Fh3idbwuuHU0
 X2PRFdocblGCl61NjPZfxoBaM7O5J8npWnNlY2iO7O1tJ7I/FHeosHcG8YTr96NUjme7
 G8jYb15hwbVPNEjOrz110DWgY7DYzcn4XbrFdsxIFuafhkjPhTBAGs2Iz8pE6o9cAj9d
 aBhILIazXZHau8b2+7KIlClfLrH8Q5MNPJeN/5gJVl1CGr/5peEG+iu+ZvT+cJxiDcN9
 S5Kw+2nZ3PIguHiw3+q8eUovkA1xEtkAHD047pD0rWNfHRVcM8OVu2gK/P/t0kbvg4fZ
 uyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VmtAHZPCQnUN98Y34tXll6MmGOtVH/+ZH612dT5FXWA=;
 b=gmAGLTNlTiJ8VXd2PKqp7C98+NHDlxt0HELHUn9hTw5jfgTBDJ8Jv9SWwY4YYPvF4h
 ONCKxly8/+i79Yf4a3+sybhYjlNsDcU1VyBiQnnFyaolhtxwQiOaYXzRze7QTmIVUxWZ
 EOl2+8tcHyvvqtQMgvMXvUSDnLCynDg00kK9qbIt+YGe8gddampxVQMcy2UaluoC7pSW
 55FBsZHrjiwvWrR9zycfOvCvqYoZt9WxVtFTR1s/LutpoMfbgQTrfPZ0OISLHs0mHpNX
 azusyrwPhKltbUWynptJQqiVFnr4OQGImpPPrhQ1FmoSlGGUCvGY6aMGgYEXKLKLBbDR
 ZV0A==
X-Gm-Message-State: AGi0Pua6KjnPOjQ8A1sWwVK0GCyi4/9OXFdUY6KEjEJ3MzD03vVSKfbC
 K5pIwOMWgCEVAqGFSEOVZcQw/mDJ1jg=
X-Google-Smtp-Source: APiQypIncpE9amu2N41HZ2UlH7ovLgAxgxH6c9xh1iMsOzlQQuTDOXO/dZtmlXj7BxX/eMQ42Br0/Q==
X-Received: by 2002:aca:ccc6:: with SMTP id
 c189mr27514353oig.161.1589382553125; 
 Wed, 13 May 2020 08:09:13 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id q142sm6148307oic.44.2020.05.13.08.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2020 08:09:12 -0700 (PDT)
Subject: Re: CCLA for Code Construct Pty Ltd
To: Jeremy Kerr <jk@codeconstruct.com.au>, openbmc@lists.ozlabs.org
References: <117d87290b79966daae8e1e8b6ff66acbd0ab3d5.camel@codeconstruct.com.au>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <bc512c4b-4629-14b9-9be8-957bc6c9fccf@gmail.com>
Date: Wed, 13 May 2020 10:09:11 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <117d87290b79966daae8e1e8b6ff66acbd0ab3d5.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 5/11/20 11:56 PM, Jeremy Kerr wrote:
> Hi all,
> 
> I'd like to register a CCLA for Code Construct Pty Ltd, and have
> attached a completed CCLA.
> 
> [I suspect I'll continue to contributing partly from my personal email
> address - jk@ozlabs.org - but I thought a CCLA would be more
> appropriate than an ICLA

Thanks Jeremy, your CCLA has been accepted.

You're official now! :)

Kurt Taylor (krtaylor)


> Cheers,
> 
> 
> Jeremy
> 

