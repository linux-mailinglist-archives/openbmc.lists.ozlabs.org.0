Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C9A174E0F
	for <lists+openbmc@lfdr.de>; Sun,  1 Mar 2020 16:47:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Vnj23zWYzDr7Z
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 02:47:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lqkVpCAy; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VnhC03mjzDr68
 for <openbmc@lists.ozlabs.org>; Mon,  2 Mar 2020 02:46:50 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id p11so3167638plq.10
 for <openbmc@lists.ozlabs.org>; Sun, 01 Mar 2020 07:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rnDdU1t+i3pbiA7G2lqfJJVJbNAuzNGmpXr7ztBKXlQ=;
 b=lqkVpCAyg/jzYuiab/XMJeOi14yP/WQW36so+Rpz4P+A2QT9dG+Gsovj2cLgPUuB5i
 by7TXuO4DKZX1Awk+/cggTU47fBFKfiOzwleppi257Rs5lys3p8lFNo8fMkg8CcMijec
 c6HfCzQ/XvOJGrWbUve4M2H+1fmt7oejJBdvxMFa6chVj2uQuLKVX2FvSx0ZqDIiqqrz
 n3/2XA5vo6xHaIa9X3tVjXM6J4EAhsE74HdpGutaLvX8HxyezcfQSNICWl0rQlkgoU7D
 kpMH6qLyK38OwN87jwurNAR2PQERoL8mfZtR9cvVE+Obw9raidvCeEJ7JlzTbJ3Wf8+Y
 mu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rnDdU1t+i3pbiA7G2lqfJJVJbNAuzNGmpXr7ztBKXlQ=;
 b=BdZxzDVj0/DI1rMDCgX1avfYEBREpPDaG6O4HonP/9ud77oJ8jtt7uwwzEX95k2e8A
 IIWQK5CmjOvWDbktV1ug0vcwt2zbPZj4AlERNnVs+BDI1Xbv5bxa6CXijeivELabzFcE
 rjygRENcw/Cg7rFmLqBqQwouu0Hw/jtMSZYqSytwgqKVMAQ2Y/OwHS6xOv9IYiq+cLKT
 lzQX+GZf5AOHvKg/2fsUX4ELcaexOwcvLuSC9oXDZSbPOxTmlCHp7lcloTUQsdBKr61S
 dM53ynmkssFwAb9W9J//JOV3Yi5J/1vfQdppON/ULJzzz/yXUMSr7KvB7+IrbpdgzGId
 J0aA==
X-Gm-Message-State: ANhLgQ3bx70oOCgDJqvVOtiG+x0Xx+Oxx8nUL4eypdOTKbW4CmWL7mEL
 ESM48iNODl11+TRDsrM3qXXdbFxR
X-Google-Smtp-Source: ADFU+vsUUhq/wcS9dgZmaWvfisSda1ebn8/l6WK2I11wpblr8HoeUCOxeXQpV6Wj7gE0P8lg42PLDQ==
X-Received: by 2002:a17:902:b904:: with SMTP id
 bf4mr4278476plb.151.1583077607229; 
 Sun, 01 Mar 2020 07:46:47 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 c184sm17790346pfa.39.2020.03.01.07.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Mar 2020 07:46:46 -0800 (PST)
Subject: Re: [PATCH v1 1/4] dt-binding: watchdog: add restart priority
 documentation
To: Tomer Maimon <tmaimon77@gmail.com>
References: <20200301094040.123189-1-tmaimon77@gmail.com>
 <20200301094040.123189-2-tmaimon77@gmail.com>
 <6ecf9a6b-8fca-1e7a-10d0-ee518e6ecf64@roeck-us.net>
 <CAP6Zq1gYvoGwNwr2zCopQ5CcyVUjgdYK6yX1wVMmWh5gapp+zQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e009d5e5-03a1-301c-0a65-c7f59c1be9fa@roeck-us.net>
Date: Sun, 1 Mar 2020 07:46:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAP6Zq1gYvoGwNwr2zCopQ5CcyVUjgdYK6yX1wVMmWh5gapp+zQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/1/20 7:36 AM, Tomer Maimon wrote:
> 
> 
> On Sun, 1 Mar 2020 at 12:06, Guenter Roeck <linux@roeck-us.net <mailto:linux@roeck-us.net>> wrote:
> 
>     On 3/1/20 1:40 AM, Tomer Maimon wrote:
>     > Add device tree restart priority documentation.
>     >
> 
>     I think this warrants an explanation _why_ this is needed.
>     What is the use case ? Not just theory, please.
> 
> 
> In the NPCM750 there is two initiated restarts:
> 
>   * Software reset
>   * WD reset
> 
> the Software restart found at NPCM reset driver
> https://github.com/torvalds/linux/blob/master/drivers/reset/reset-npcm.c
> 
> In NPCM WD driver the restart is configure as well, I will like to add the priority so the user will have maximum flexibility if he using both restarts
> 

This is not the intended use case for restart priority. It is not
intended to be user configurable. The idea is that the more thorough
restart gets higher priority. This is implied by the restart method,
not by user preferences.

Also, the idea behind supporting multiple means to reset the system
is to be able to support multiple means to restart, some of which
may not always be available. In that situation, the priority means,
and is supposed to mean, "pick the best restart method available".
Again, that is determined by system design, and not supposed to
be configurable by the user.

On top of that, a watchdog driver based reset is almost always
a reset of last resort, to be chosen only if nothing else is available
in a given system. The existence of the reset driver confirms that
this is not different for this driver/chip.

Guenter
