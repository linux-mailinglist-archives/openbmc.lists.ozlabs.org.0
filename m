Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A64341BB0B
	for <lists+openbmc@lfdr.de>; Mon, 13 May 2019 18:33:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452mZz1WvRzDqBd
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2019 02:33:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kwdr90Mo"; 
 dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452mZ41S74zDqDy
 for <openbmc@lists.ozlabs.org>; Tue, 14 May 2019 02:32:27 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id t187so7019696pgb.13
 for <openbmc@lists.ozlabs.org>; Mon, 13 May 2019 09:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PjeSYcT6RL87tnaD4fNX2YqCJu3X4aR+dV5KX/12pY4=;
 b=kwdr90MoQCOB8p8xjvOC8kY/TtJJ9SZszTSFR4iv7ThY+uee6MCkr05qijr2Q2KSrr
 F9pQl++ti53rI78DJa2PkqtxFJ1cVk+W9v0PsVhlt1nhsVWhoGZS05XyKrvqjMz/lOIC
 Wts/NCYTyjKFH9cejhPa9u97Z21GcKAeRYXgGqdoXbqG/ktBRLFgn0cSKEu3RJKcx3ET
 vfnJEwlR4ahSiugk1ZW7mlRvrlYtX6d2HHq2zjO2YdwRN1hyY9kjA/BILwrYejUJdkUo
 lz2c2gKH4G7bHZlvrIBtUma6MqCD8lD1PzCYH42mCMJpFjHfCgOr2noNb3w2NVBXqicq
 TtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PjeSYcT6RL87tnaD4fNX2YqCJu3X4aR+dV5KX/12pY4=;
 b=S4i1L7GTRqTZ1ELEqpth/Lfwm0LYH464lngY/Pfvpw4CvxIyvQ2yC0dsGxF/glye4r
 /SwRgFr8z/Hl7cFQR/r8BJZwfzqV8wNj4KRfjpBn7FBXpx+r6cAvjTUMoVWM8lEvN7UP
 1qwpIR7AbrzXE4OVC6SBZHeApthSf/cHal02zFBFAFb4VcaZWUsahbQsA7pA5xp+EZ/g
 BLrI2BiwGY9x78W6HperH1fmX8dr9PkTa4RAlN4OczUsdN1aqZms/BI/HLwBfF4po0it
 TNSdSlo21sZbyOfBuANiEXwzUjkR8GbMxtbRuR74n4MHFzJNYH9t5NuWJB24P7HTXKFb
 q1sw==
X-Gm-Message-State: APjAAAWzcax9N/XBFMmwYBmbMxie0FblK2MDIvN3UTycXSJWvrxT8Fd+
 +r+15h0pAJj67Vpc+UfwbcU8gX7OGP1+9wJBO2eyQg==
X-Google-Smtp-Source: APXvYqyIXQEX09kgKeyoKTHfAR91YnqX3c4vTrZBo+/3tQk3fNyP35bPAxqPlsmVl8HBTA+26kAKWk6NYYCID5rmF0I=
X-Received: by 2002:a63:1e0c:: with SMTP id e12mr30860618pge.218.1557765144010; 
 Mon, 13 May 2019 09:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <96A52DC2-7B18-4F69-B8E8-3B489BDA84C6@fb.com>
 <1c5566ba-696e-42eb-c193-22eaca33a1db@intel.com>
 <7D337AEA-CB20-4E39-8A9A-58E21EDA0F31@fb.com>
 <1b82951d-4293-0525-a562-000899544c2e@intel.com>
 <14F05B01-0B7D-44D1-A599-5EDD8CC3A6C8@fb.com>
In-Reply-To: <14F05B01-0B7D-44D1-A599-5EDD8CC3A6C8@fb.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 13 May 2019 09:32:12 -0700
Message-ID: <CAO=notzQc2CX9Dx4gjX6HwnuCKnjmD_3ek+tv-XAfO+LxdQ3WA@mail.gmail.com>
Subject: Re: pid control configuration
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, May 10, 2019 at 2:21 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 5/6/19, 9:20 AM, "Ed Tanous" <ed.tanous@intel.com> wrote:
>
>     On 5/2/19 4:24 PM, Vijay Khemka wrote:
>     >  My understanding here is pid data are only defined for temp sensor=
s which will generate pwm values for fan.
>     >
>
>     The above is not how phosphor pid control operates.  The temperature
>     controllers "request" a given fan RPM, then the fan PID controller
>     (which is scanned much more quickly than the temperature controllers)
>     attempts to drive the fan to that speed.  This ends up being a two st=
age
>     feedback loop that can perform better than a single PID loop.
>
> Ed, we are not using cascade control here in facebook. We only use outer =
loop which gives data for fan to drive.
> Is it possible to still run Phosphor pid controller with single loop?

Your cascade PID could be a pass-through -- so that it receives the
set-point from the sensor PID and then just sets it directly within
that loop..  It may require a new PID controller that is just a
pass-through to explicitly exist -- i haven't dove into
phosphor-pid-control in a while, but you probably need to write a
basically empty PID controller object type.

>
> Regards
> -Vijay
>
