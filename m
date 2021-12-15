Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE084761B3
	for <lists+openbmc@lfdr.de>; Wed, 15 Dec 2021 20:27:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDlcf52F6z3c5d
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 06:27:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20210112.gappssmtp.com header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=QRPidkI4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20210112.gappssmtp.com
 header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=QRPidkI4; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDlcF3Zncz2y8P
 for <openbmc@lists.ozlabs.org>; Thu, 16 Dec 2021 06:26:51 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id l22so45073113lfg.7
 for <openbmc@lists.ozlabs.org>; Wed, 15 Dec 2021 11:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oNt9b4bnmiCJdQLIRsZlWIy+brzA8h8h/tbev/4+Sho=;
 b=QRPidkI47UPUw0p01oaRUI5hhuAbHz2MlQ62wguEvG2BI0C8p34YT3bLfpVjRPnJ58
 7bk72OS1NEwSG5Ex8J4ZL8GFdk0sMRjRK/f6hFfzWwrZLn0vjNi2ANctpg6FnuWy9/O0
 /TBZ1aAPjT7E3NT+cDWw2Z4vgIo1jau7CFArOUnlqEyB9Q1rjkZ+UKDylme1ZgDnkINo
 pvUEn+Kh0Va7sotpiWx7VWYOx9JBZj22lI2CqVCIpq9xdVFEz2Nlh4c0ncn30NH4c4Y0
 3Bm1w0eFF/rWDwWWjp3HKJPKgWqnqdldS1tPoP9Ht0R6A0bOHsT+ZYgWchafKPhi1l5i
 ps9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oNt9b4bnmiCJdQLIRsZlWIy+brzA8h8h/tbev/4+Sho=;
 b=czYnxZT/6aJ1rX4SOhg47egYtnC4m8sI5TjdS5xvHeCsbL3QT/WnvpQD1bsOR8CS37
 VCc7hD6kJZZm3gxuXASfpGPitrjs7AJeIC0xVgRy8Jjt/JVBB1v3gOYqUQ66RFT0k7pT
 At+9mNX1ocaQzYa9wSasla8P9OMP2R/KH0jluqGNjrOGdQQYy41PezY0M3muRfkvqXa/
 FjMel6n1zyo/OmELnE65M7M1Be/lAv0Qw31i4XH9uZ4Iz6n2r1dfidCjRqJt1FHpb8BK
 gvI/dbi/tlsixF7bOpaG8CMs0Q+Lw6y2lCt7Ca6uWRAld/n8SbWqxkmm/KHdQ8TnNjOn
 k9SA==
X-Gm-Message-State: AOAM530PsTlXL8GavgeNUTfhJhIrGdzG4sMCYPPVn9usHmqb2uYLjDZi
 9YhdZBXNsPmbNutuhqJ6XJTLgZi8Fh8bWlUbeKY4zj38VvI=
X-Google-Smtp-Source: ABdhPJySRwvniaQXvQMjvO7dVEKxSe86CVv24kmWYcgVZw8F5c+Fa+uOrdW5Iv4i64gMcj+nqTVtfNt9YeTHVs/MiZg=
X-Received: by 2002:a05:6512:2350:: with SMTP id
 p16mr11438264lfu.482.1639596404311; 
 Wed, 15 Dec 2021 11:26:44 -0800 (PST)
MIME-Version: 1.0
References: <DM4PR11MB52476717C6A134B92BD62061B96E9@DM4PR11MB5247.namprd11.prod.outlook.com>
 <YbDjsxZYYtnNPsCK@heinlein>
 <475ba120-3734-8bf1-868f-83f48f10ccac@linux.intel.com>
 <YbdwYODNRJPuRady@heinlein>
 <5c98b6d46d71907242f1d868cc3d918db99cea53.camel@codeconstruct.com.au>
In-Reply-To: <5c98b6d46d71907242f1d868cc3d918db99cea53.camel@codeconstruct.com.au>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 15 Dec 2021 11:26:33 -0800
Message-ID: <CACWQX819tsUA6t190mVp8LrrHbteiP4w-35MEH9LG9mWTvYgxw@mail.gmail.com>
Subject: Re: Virtual Media repository request
To: Jeremy Kerr <jk@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Czarnowski,
 Przemyslaw" <przemyslaw.hawrylewicz.czarnowski@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 13, 2021 at 6:11 PM Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Hi all,
>
> > Maybe Ed's proposal of using an existing repository solves that.  We
> > would need to make sure the current maintainer is accepting of
> > whatever design direction you've decided to go though.
>
> I'm fine with replacing the jsnbd code with a newer implementation,
> provided there's general community acceptance for doing so. If that's
> the case, I'm happy to use the existing repo, or replacing openbmc/jsnbd
> entirely - whatever suits best.
>
> [Perhaps in your design document, you can expand the Alternatives
> Considered section, to provide some motivation to change over]
>
> However, I'm *not* OK with just introducing a completely alternate VM
> implementation and leaving jsnbd as-is, where some platforms use one,
> and some the other. We have way too many instances where there are two
> separate implementations and/or repos that deliver the same
> functionality. I would like to avoid making that problem worse.

+1

>
> So, either:
>
>  - submit these as updates to jsnbd, which implement the new structure as
>    you like. I'd be happy to hand over the repo to the new maintainers.
>
>  or
>
>  - provide the new VM implementation as a new repo, propose to change
>    platforms to use the new implementation, and we can delete jsnbd.
>
> Cheers,
>
>
> Jeremy
