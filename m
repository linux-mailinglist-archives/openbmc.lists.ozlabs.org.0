Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A41B7494D
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 10:44:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vQkb16tGzDqPK
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 18:44:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=richard.purdie@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.b="AXoYV/9a"; dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vQjy4WWkzDqPK
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 18:44:02 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id 31so49862670wrm.1
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 01:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=PPTiziLu39V8zgY4Ofym1qc35oRQ4fDDGgP3kqodAXI=;
 b=AXoYV/9av4csxyTuMv1GJjNy6yd08W4gz5vk1IWCm8He0vb/J88XzASypeTRIdqFWL
 dEg4YIvl2IBVFREqre6EaImourx8kiNbCI4gl2xKStUTRIy/g26Z6NzW5RN+s02rPidf
 NcUyMpgL2lOIJp7EU4yWa5OJLx3HMfS/nRKB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=PPTiziLu39V8zgY4Ofym1qc35oRQ4fDDGgP3kqodAXI=;
 b=BCrStma3YhFbFVZI663W3NmOS0enXm7+bRtuTV62VOcL6C/lqtdA5s7Z0T77Np+nPP
 3onQI/xV6MFMcHnLGnG6LPr54xy0NfCPPXKH0783SDXPv7aPU4i7K/A+JAnZdD5xvzJs
 I3aTOnd9EhryNw5JTo0cMi+bQ7iESnGToKUR7Oz3kDjhR096/11s2qprBWTDy7nyICiE
 JmnSYqbKbdvEbzHs6C7WNOXGstwm0e1E2RsJUhyKyyF9Nutiaz/FDYTv9prA7yHfscTC
 shecaggRWeIB/4c2FNxITT7ingnO/7/7c4S9USKIU7hl+O2SG1QYzIFITiVG831a3pgf
 jG1w==
X-Gm-Message-State: APjAAAXNloBRBzDe0ncH/Um9H1RV9eniOJaY2ICrl4rydabHeQyc5Kt7
 +dBTOurE/q5rdQ5oyzKc6W1Ofw==
X-Google-Smtp-Source: APXvYqzz3M9MrkpuQbOlVZ5HizSD+NtZ4Y4w2hwHPn0gXLu1m/wFfC6Fnv/SH6b72N7+29ZsFxlivw==
X-Received: by 2002:a5d:4602:: with SMTP id t2mr80303555wrq.340.1564044238408; 
 Thu, 25 Jul 2019 01:43:58 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
 by smtp.gmail.com with ESMTPSA id o11sm45031687wmh.37.2019.07.25.01.43.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 01:43:57 -0700 (PDT)
Message-ID: <c3b7056b3327a2b930a48060edfe368bb9dfb2a0.camel@linuxfoundation.org>
Subject: Re: [yocto-security] Design for initial expired default password
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc
 <openbmc@lists.ozlabs.org>,  yocto-security@yoctoproject.org
Date: Thu, 25 Jul 2019 09:43:56 +0100
In-Reply-To: <cafdcfd1-7f98-4eab-eb07-ad5df650db2a@linux.ibm.com>
References: <cafdcfd1-7f98-4eab-eb07-ad5df650db2a@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
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

On Wed, 2019-07-24 at 18:06 -0500, Joseph Reynolds wrote:
> I pushed an OpenBMC design to [Gerrit review][] for the OpenBMC
> project 
> for a new distro or image feature (disabled by default) which causes
> the 
> initial password to be disabled by default, so the password has to
> be 
> changed before using the BMC.
> 
> This design is intended to make it easier to comply with the new CA
> law 
> [SB-327][] which becomes effective on 2020-01-01 (in 5 months).
> 
> - Joseph
> 
> [Gerrit review]: 
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23849
> [SB-327]: 
> https://leginfo.legislature.ca.gov/faces/billTextClient.xhtml?bill_id=201720180SB327

I'm fine with adding a mechanism like this. I'd suggest it should be an
image feature rather than a distro feature as you'll only realistically
know the users, image usage and so on in the image recipe itself
(locking up an initramfs would be bad).

Cheers,

Richard

