Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF769EA2B5
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 18:44:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473G6f6QgLzF4bv
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 04:44:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234;
 helo=mail-oi1-x234.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MXzNb6jI"; 
 dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473G5p74rCzF4c2
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 04:43:40 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id j7so2734903oib.3
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 10:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=CLzNtAemBPhtGh+6Wu2X5RQuXIKS9c5pLW09tFr8J90=;
 b=MXzNb6jIwc3sf0JRBh0IIpxlao79uVHi/U86UBkZZgeJMVrkJWAmeLuh69NNczAd6A
 N9DJzumbild3WIdFR43X/J7aK+5fJg1xU4BJUxOhVBQxgccEOljLCTQ5zbivzhVmFo6q
 HrywaY9lNrZXeziriJrWCJ+pAyVQbJVQXeolorXIjD6ldb/Gm+0CRHx1hkoQPklNQOGc
 347qnplQbfEuQTpiDqh3fyafQQ0ietA5LdpKmRv6owXg6DDhP1G6XWXwcRA8Ft+v08Hb
 mzd3ylGz+mMlkvpqWmN8iK9o1QrsBaefUNmLL4dfwRy9mJ8oqfuL6vhUnarSax9YHNVL
 UY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=CLzNtAemBPhtGh+6Wu2X5RQuXIKS9c5pLW09tFr8J90=;
 b=XmEAgH9QX30/WwLMIgbpqsdcs/Sg8V60II1XN62hJdrlGRTUeokQ6K3ydZm4UhTBBz
 nnKLrx1mwV6YINiYgU1kGjXDo1GAXqImGQLQLWoGPRvmqXGchFH8aznsV1pe8enI6yh8
 V2mSbEFzeN8ZTGJER+YPLWgHK8fGYCkUpzoxFYnbNWZRBfBa3gCwyWkMLLB4JB+6FwFg
 VAYzIwNDTK2BHA4R4FMt7SSDy8vnQig7X8Un7uH7s91RqcjWIhXIniySfwftRZ3/fOYE
 yq782kI0FJz3CR7ZejheqB+AsyalA1jhNszFqdt/Q84+vr6OATMxQblL5rSpUmoQLaIC
 74Pg==
X-Gm-Message-State: APjAAAUjsDC2Ip28hs7GxVWl4m0RiXJNYJXbfWsXYNCyhJ9ea1W4BHh4
 Db4oFmF/XlHYuy5z1RCG2ETe93HtdZ0q6cIS8jg2latW
X-Google-Smtp-Source: APXvYqybPwCGBM7J7529Grh+MVQOsZVKoTRSK23tZ1dziJVHl7NMvO0UQ1qiopZEQHGQSMpg1Xf2zUlrtC5abhvPpgI=
X-Received: by 2002:aca:dc57:: with SMTP id t84mr279375oig.145.1572457417053; 
 Wed, 30 Oct 2019 10:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=pwzWPjgWtfUjX30Cy=ddiO3wvpR3pd7y=dz0a5QQ5spw@mail.gmail.com>
In-Reply-To: <CALLMt=pwzWPjgWtfUjX30Cy=ddiO3wvpR3pd7y=dz0a5QQ5spw@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 30 Oct 2019 12:43:21 -0500
Message-ID: <CALLMt=ozAC6cUDk854enVOxbtdnXdHe27A=3NdHYUU4cQxoHOA@mail.gmail.com>
Subject: Re: capability to stop all bmc recovery
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 5, 2019 at 4:15 PM Andrew Geissler <geissonator@gmail.com> wrote:
>
> Greetings,
>
> It's a common request among our lab team that brings up our OpenBMC managed
> servers to be able to disable all recovery actions on the BMC. This is so they
> can stop on errors and debug issues with the host without the BMC rebooting
> the host or itself. Our manufacturing team also requires this at times to
> ensure the system stops on failures.
>
> Story https://github.com/ibm-openbmc/dev/issues/990 tracks this work along
> with some discussion on the requirements.
>
> Up to this point we've tended to give our users busctl commands but as we've
> seen, those can change over time and new one's are going to be required going
> forward. It seems best for our users to wrap these in a obmcutil command.
>
> If anyone is interested in collaborating or has input on the design direction
> feel free to respond to this email or post to the github issue. I plan on
> starting work on this over the next few weeks.

Vishwa kindly took this story on and his first commit to start with is up:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-state-manager/+/26510

Comments welcome. It will be adding new options to obmcutil.

>
> Thanks,
> Andrew
