Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ABA4D33C3
	for <lists+openbmc@lfdr.de>; Wed,  9 Mar 2022 17:23:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDHYK6Ndtz3bWd
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 03:23:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=AznN3etc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::430;
 helo=mail-wr1-x430.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=AznN3etc; dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDHXv4mRVz2yQC
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 03:22:37 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id x15so3820406wru.13
 for <openbmc@lists.ozlabs.org>; Wed, 09 Mar 2022 08:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MfnYWoxYdYSXasCuQ14SjpWa976ksBxsJgJduql2fD0=;
 b=AznN3etcde9NedgvgasMAzn61FT6nQGy2y21JWLhtXDHdzwZLEhTiJHp6kgZG7kZvV
 pHC0MiKSlwCe74s7UACsgUEIaBVqp0A+BUSx6k0aGtu8qBZhwBkjif1sspwPOvH0jrPH
 TuljfJ/PwHglyRbdWmNkr1LNPwzGzFnGSua+cXxx/YNqbRnaoD9/qf7idbVVKc3XysEA
 +CpSyPCS3kOcZ2eYu75c4AJrwjhqD4OZGQp6JAl0iWkOu8ulfYsDDztUwkPZlgVQU9Q0
 Jpi4PyV26EKwoVjTtyRhGr3iK2SO2MryN+O+Q5Nmo0YOJ6X6RxJdga3yRsZ5RFR7e8eO
 VkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MfnYWoxYdYSXasCuQ14SjpWa976ksBxsJgJduql2fD0=;
 b=I99J++60XHfhYpiF8cXibQ1TmPprxr687VoOQa+AdQSgxiM1CS8NHYFnsrSo1Fc/sC
 vouvZ2XRT/2NY9jqOGfzS6fWiJ/CQ9nXpx+EufT+nRI2cmQZ2uWf9TTgBqAQCMPOnDuf
 8uDYX1XGnAxZImW/4Mu/DStIguuv9Pe3VRVlg8ent+xWchRiEyMyjIi4Mao514og+K5V
 wCMnr69F83o6IOxLpBzMBgE1PHafG6nSWMUVHLovqPrIrXcQCY9AB0fi6zgc+cwG7f8e
 SZjzPWzrYjxEQttt8TqBgqqYgrfsn5j2ludOLw6WGyM8D/FCn76ho17WpSK4PMHZ19Dr
 Mhgw==
X-Gm-Message-State: AOAM5337xgTgHXKhp97KrRYkf827I6aNW/6/ePF5lE+vIMO+X1Z3ammd
 FdiMGXupnDcv2Ynddifq7x3rvcq0si1h7bcKB9E5T8dsTUo=
X-Google-Smtp-Source: ABdhPJxVSNBmh7nEPBCMzkSLnv5JAg9/6frrff6MLuqLtYOpX5xokY6+vL678FgDg1wysnI8lN54etJWXmbh1IREiyM=
X-Received: by 2002:adf:f006:0:b0:203:723d:a2e5 with SMTP id
 j6-20020adff006000000b00203723da2e5mr337021wro.188.1646842950047; Wed, 09 Mar
 2022 08:22:30 -0800 (PST)
MIME-Version: 1.0
References: <a3127a6d-ac1d-b730-eb79-9a0342562c98@linux.alibaba.com>
In-Reply-To: <a3127a6d-ac1d-b730-eb79-9a0342562c98@linux.alibaba.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 9 Mar 2022 08:22:19 -0800
Message-ID: <CAH2-KxCa5-KYc3RXXqGBDf1mOsZAVeN50Kk6R1PYWu1VXYPR5A@mail.gmail.com>
Subject: Re: Does it make sense to change boost::asio::deadline_timer to
 steady_timer?
To: Heyi Guo <guoheyi@linux.alibaba.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Mar 9, 2022 at 6:16 AM Heyi Guo <guoheyi@linux.alibaba.com> wrote:
>
> Hi all,
>
> We can see lots of using boost::asio::deadline_timer in the code, like
> dbus-sensors. However, this timer is based on UTC clock and might be
> affected by system time. I tested and found the timer didn't trigger in
> time if I changed system time to some early time after starting the
> timer (calling expire_from_now()). And I think this situation might
> happen if system time of BMC is synchronized with host or NTP.
>
> At the other hand, steady_timer is a chrono timer and should not be
> affected by system time.
>
> Is there any reason to use deadline_timer for relative timer trigger?
> Shall we switch to steady_timer to avoid being affected by system time
> change?

Yes, these should be steady_timer.  For some reason I thought we fixed
this a long time ago in dbus-sensors, but apparently not.  Please send
the other maintainers and I a patch in gerrit (should be just a sed
replace of all deadline_timer instances) and I'll review it.

>
> Thanks,
>
> Heyi
>
