Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF5C34BA81
	for <lists+openbmc@lfdr.de>; Sun, 28 Mar 2021 04:52:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7KxV05rlz2yy0
	for <lists+openbmc@lfdr.de>; Sun, 28 Mar 2021 13:52:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=1U44Mb6u;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::22d;
 helo=mail-oi1-x22d.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=1U44Mb6u; dkim-atps=neutral
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7KxG0MDkz2xYs
 for <openbmc@lists.ozlabs.org>; Sun, 28 Mar 2021 13:51:59 +1100 (AEDT)
Received: by mail-oi1-x22d.google.com with SMTP id n8so9805063oie.10
 for <openbmc@lists.ozlabs.org>; Sat, 27 Mar 2021 19:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MOgvs6HrAWzCkUxG/omaO9NYKMTNQ0Ur5xL5d6K0EnU=;
 b=1U44Mb6uNRkdep/SkYk3iyD7fV9klxQw+c00MmN+JAjuo2t+yUd5/eAHfx4sSdA8wD
 XaG8UGiU9q7DsJamvB+PGJ50cWDQk86oIJbntRwYBdfUVUlSyzHrIMUXLjGWW9e9jdjh
 XBAaFiMRUrSx3MfEUbE8lcgcUNLT842a1Kbi0YzjhA87YCdsftopNin61KFAbtV7vxe1
 dqR4gy+gta3CLM+pkfjfYhip+lYXTQAByBPNrF2zgAnxJq4B9eeRYuZLETmaa5roBN9h
 +LZ+nwV35ZufFMT0yrN/uYhkBOyjz/OBMhstLYXhhYNwUgHoDPKPg5IguXbLL7nLwme2
 V4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MOgvs6HrAWzCkUxG/omaO9NYKMTNQ0Ur5xL5d6K0EnU=;
 b=mWBJzWqnHXvhzbpzzn/8RjQKXNsvz0zFsOIhh4/TVl765UxuGGGTu9Nr7ub9ukW2Dp
 qS2sVtpOtpIQlvQWAzdiP34erDpH6NTJy1WNGkZeclVggpdDgVJ3sTom4QUyjQGpmvib
 LFZgJjBOrYLD9xQI9xwqL4MJLvz3tQ4mz2NYDubd+QUmsxEGUItH3ymS4bKl3wPyCZzP
 LjW0YBlIZUtNi+vyf5yEBRGjlqgR/jax5aKBeRmVe1fuY7yTENBxAFKxn+k/3bdlnpB2
 LEGTGikL/RPZHloENeGXgA2pVaXKdLGZ4AHNVUIqaLNIdfX5xOwjbMAG09zJVOYHGgsx
 5yDg==
X-Gm-Message-State: AOAM532xfbIeVyyhXF7m3fgDt0B+/nuU7UVgctusj+DAaeao72RuctA5
 hL+A6RY5Xx/Uxsw/FIHTp4uV3zYx7CzPij1Iu7l2lg==
X-Google-Smtp-Source: ABdhPJxlKPmnaSlphE0SjUhE5n2ZsPyzxV/21GyRwq5Eb6/wscj1A51MT1iEHbqV9b/Pq7jTdi9TVlMFfYYU2OehbFM=
X-Received: by 2002:a05:6808:3d9:: with SMTP id
 o25mr14953957oie.4.1616899915334; 
 Sat, 27 Mar 2021 19:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <gmu36wVnmbV9lyt9EpYcnZmnPwjF9wtDS0N8K0jOk9UR2uUO0QwQaackzJRPLjil_ZqLxTzX3qEMGl3IE6baoIpS-xh9aMnQL3VkAyXK6KU=@protonmail.com>
 <0a6dd101-fbea-7fdf-b9a6-3895b48a7f47@linux.ibm.com>
 <5197cbe7-1a8b-80ab-2712-9a8f07457432@linux.vnet.ibm.com>
 <nGEUmLQrNSqmytvShVUeFvOUKjW1cOTYv9Hrcmj7LyP1rfIdLOt8f7IkqzPKaXHZXHRGYtHBcjnt6Qo5c1fIw4doEmVwMmGI2e2rNhNXWZw=@protonmail.com>
 <5bcbc6b0-b9d3-a002-0f24-97bd91ba5bf8@linux.vnet.ibm.com>
 <36bafa0b-5dd3-6da5-b18d-847ee4a46459@linux.intel.com>
In-Reply-To: <36bafa0b-5dd3-6da5-b18d-847ee4a46459@linux.intel.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Sun, 28 Mar 2021 10:51:44 +0800
Message-ID: <CAGm54UEc9DOGZS0LLhFMP4SNw_-sJ2oa146wXfYvmF3As4xXsQ@mail.gmail.com>
Subject: Re: IPMI SEL Parsing
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
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

On Sat, Mar 27, 2021 at 12:08 AM Bills, Jason M
<jason.m.bills@linux.intel.com> wrote:
>
>
>
> On 3/26/2021 6:47 AM, Bruce Mitchell wrote:
> > On 3/26/2021 01:04, rgrs wrote:
> >> Hi Matt, Bruce,
> >>
> >> Yes, SELs for sensor events, threshold alarms.
> >> When a sensor value is beyond the range of thresholds, we need to log
> >> the SEL.
> >>
> >> My understanding of OpenBMC implementation:
> >> dbus-sensors/phosphor-hwmon logs d-bus errors (logging/entry).
> >> Each entry object has a "callout", that is used by phosphor-ipmi-host
> >> to convert dbus-error logs to IPMI SEL (16 bytes).
> Please note that there are two locations that SEL entries can be logged:
> 1. D-Bus
> 2. Journal/syslog
>
> It looks like you are using D-Bus which I'm not familiar with.

phosphor-sel-logger now supports either, by default it logs to syslog;
With SEL_LOGGER_SEND_TO_LOGGING_SERVICE enabled, it logs to
phosphor-logging which is on D-Bus.

You could call the same APIs ("IpmiSelAdd", "IpmiSelAddOem") to create SEL logs.

-- 
BRs,
Lei YU
