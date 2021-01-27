Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BBA3061A7
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 18:15:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQqxb2DyZzDqyv
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 04:15:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::330;
 helo=mail-wm1-x330.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=UqyJKBrH; dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQqwY6kMwzDq96
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 04:14:53 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id u14so2331687wmq.4
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 09:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oLb8+MYLZeryZ0dV7/QPWiOoZAoxIlynAEJiymGuNR8=;
 b=UqyJKBrHTOc6Z8Iahk/aHPw4hyiO7QRRnV4lSbiY4WzzNwgWbj5n7aLKA2p0x8yEso
 jtMY2SoUnKyZCfynqdwEIJ5hN06rv9+aLf5Nb7f9XI/4D0kQcwUFTE21m6lJDaia7K2i
 lkSDfg0RMai/2vTG84EJJTtVzkIsnSTuMlSm7xe98enixefworAraKFRGUVGD+MoLeq0
 oc4jTVbYzEKySmSMSMdJ9JCLX21CmMUkW98gnQaefS9X8QBU7jU7HZHREWrZoqU6W6Rr
 ri+js0SjiEbFxxc64O1CHF2ZERn2wJtf4GXn36IRRwIqeb9PRRjAgCywAExkqzus60q1
 5dHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oLb8+MYLZeryZ0dV7/QPWiOoZAoxIlynAEJiymGuNR8=;
 b=ST5eqKAyCcptfHdolR5MTNOpHRHXMJfLFSDcoklMe4ShOW6kxfm4bt6rQrKg1ZLysd
 uQR/yDcDruy9qLfmqw6awQi94MxxisFzpKHcHnqykVjsDPpXucrszUy5v4hQD0Hl080P
 M9XRZ2vri9e4V7ry8O9HfmxQnVCiEcpjcNS/r4C4s/kMEBmht7cvYla4WS6fRxKk+R3U
 0UONs19e2XBJ0pDiyM1ZYh17/gCB+LZueAENfhXZGhm9sOEEz6aWEj7AW156uY+uHpMs
 AVdTcd+MzKGsBOGfiZycmc/eACUz6hRKubtxcFpDjEvzAV3iP6jFSy85WPhln772q3Oe
 mN+A==
X-Gm-Message-State: AOAM533otC893EdcuVlsz20ZUZ5LwiNZCYbgZg7cnHXVyUCjo1jWdnat
 Lu6awK256NoSR2GiFitXM12x7UFTgbIN9KaE8kf/iPl2sww=
X-Google-Smtp-Source: ABdhPJy+NZZaktFhgObCMReiRMFvhHa8+O2cQ1AtLLUJ2MjMe07qE8Q4Z6sxlLNNIohAnPLXLXmPrZ+l7NUuOvzqB8c=
X-Received: by 2002:a1c:740b:: with SMTP id p11mr5201592wmc.34.1611767690561; 
 Wed, 27 Jan 2021 09:14:50 -0800 (PST)
MIME-Version: 1.0
References: <8fc3b7be-42bc-fc28-6bbd-c5d8de95feaf@linux.intel.com>
In-Reply-To: <8fc3b7be-42bc-fc28-6bbd-c5d8de95feaf@linux.intel.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 27 Jan 2021 09:14:39 -0800
Message-ID: <CAH2-KxDCorEjGSneVsSDWx7AXFvQZ8fJ1zaqf1zOJfndbW9eNA@mail.gmail.com>
Subject: Re: ObjectMapper - quantity limitations?
To: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jan 27, 2021 at 9:04 AM Ambrozewicz, Adrian
<adrian.ambrozewicz@linux.intel.com> wrote:
>
> Hello,
>
> I'm doing some performance measurements of OpenBMC telemetry subsystem.
> I'm using my custom app, which spawns valid D-Bus Sensors, I configure
> TelemetryService to monitor them and EventService to push MetricReports
> to external server.

Which sensor code are you using?

>
> I observe certain limitation on my system. Each sensor is mapped as two
> objects in ObjectMapper hierarchy. It seems that I am able to correctly
> create up to 1500 sensors. When I go above this limit part of the
> sensors are not represented in ObjectMapper tree.

When I wrote it originally, there were no arbitrary limits on how many
objects the mapper could cache or return, but considering how big your
responses will be, I'm guessing you're hitting the dbus per-message
limit.  You don't mention if you're seeing any errors in the
journalctl log from either the broker or object manager.  That might
give you more clues.

>
> Our use-case would most likely require creating even more sensors than
> the limit I've reached now. I'm just starting to investigate the issue
> and I would be happy if you could give me pointers or ideas what could
> be the culprit here.
>
> Regards,
> Adrian
