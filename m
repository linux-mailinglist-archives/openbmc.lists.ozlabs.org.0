Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA0233D80
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 05:20:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HxyR0Wj0zDqXS
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 13:20:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::129; helo=mail-it1-x129.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aV911pHS"; 
 dkim-atps=neutral
Received: from mail-it1-x129.google.com (mail-it1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Hxxj57YkzDqRJ
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 13:20:09 +1000 (AEST)
Received: by mail-it1-x129.google.com with SMTP id u124so1526363itc.1
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jun 2019 20:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=00T6X1xWulN0+xMjl5X7DyUGcNiAdQYUeMdJ7wSeIn8=;
 b=aV911pHS2tB4OaoEAJ4d1LJ92ST4GvI92q6zRVOKRjUiwm43KBzzT8JGKAZfG/JmLY
 T/P6r4tbegNIR+DrBHgR7NcOEZAvSL8U3yd4hED3fSoE+V3as30xo5dsQW0LGtNYV0/1
 WZJRVGtXKg69ene7ugMThbwlnfjTN3q770JDJ/YZIVhEw4EedGh1/Kv0t1X7c4bz6K53
 op7ZMmY/8HC+Igjlw6Li+lGee3/Cf//lpJi9Wmcj0gGS3t6TfEhYs+XCEoCTx3NvKhwl
 cnusAI5Y1RDla+P0G3PrUlmV95fGSwlA19mRtUruXVOvH2qC364naLw8q4kfGFxquXIK
 Dipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=00T6X1xWulN0+xMjl5X7DyUGcNiAdQYUeMdJ7wSeIn8=;
 b=Op/rBGbKbicSnCQbZxscQNR1UmpiF1S/lcNj6pyELoePq+0v2dmzX8OQs3eAkOSyWD
 NC/A4hIIvypHF1RKhcpKjqICwf4vbLNi4w4aQDzoFyC9UmU5nSTlgWIaxnJY+HUjyhhh
 +9Tsuvn8swVW/sPMQgsheouBMSznHhl6ChRNPHOELILtvS6spgl53qVYasC1Wkz9Sc8Y
 Hjhdbgp64Hs9DQUgj4HYIGJO3gcbXCtbhqkAPbzBKLx3Y+1fysYyoFNp7yPEIMmcnemT
 eYB+vOv87L7TSh/JJ1dcUD0A8wdpYmCw1x0D7mYC2eUKwdwAbYPumkY+wRSVEzjAjkpE
 Ikvg==
X-Gm-Message-State: APjAAAXqtLw6nEj+V7YIRojtWSGojgMvvet+v0N1LNS6AMDPGt9ODWe2
 LrutP7FXGf4IAEHlQjdhdOmBQd+13JELq07cqc3/SHp+bkacGw==
X-Google-Smtp-Source: APXvYqzyryia8VRXxysbAYtlwn1evYne8EFkrNkr4CQycWgCUxEPjAz4M8EbGMz5wcjpPBm/Jv9kPmZIxDJFTNzcbxo=
X-Received: by 2002:a02:a384:: with SMTP id y4mr19353333jak.77.1559618405446; 
 Mon, 03 Jun 2019 20:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
 <4a1d2e3c-b780-d72c-9af6-8c1d472873a9@linux.vnet.ibm.com>
In-Reply-To: <4a1d2e3c-b780-d72c-9af6-8c1d472873a9@linux.vnet.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 4 Jun 2019 11:19:54 +0800
Message-ID: <CAARXrt=Qy32zT4-spZf25TY_sgAM1tMN51HYFNhb7tbx5Du8vA@mail.gmail.com>
Subject: Re: [Design] PSU firmware update
To: Derek Howard <derekh@linux.vnet.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> > ## Requirements
> >
> > To mitigate the risk of power loss, the PSU firmware code update shall meet
> > pre-conditions:
> > 1. The host is powered off;
> > 2. The redundant PSUs are all connected;
> > 3. The AC input and DC standby output shall be OK on all the PSUs;
>
> As part of the PSU code update, it will turn off it's control supply.
> If only 1 PSU has AC applied, and it turns off the control supply, then
> the BMC would lose power and get reset, which is not wanted.  That being
> said, some systems may have 4 PSU instead of 2.  So ALL of the redundant
> PSUs wouldn't be connected, but at least 1 other PSU should be connected
> and have AC applied, so that when 1 PSU is reset due to the download, at
> least 1 other PSU will hold up the control supply and be providing
> standby power to the BMC.  It should still be ok to download the
> remaining PSU even if they don't have AC applied.
>
> So #2 and #3 aren't always valid, including in systems with more than 2
> PSUs attached.  It's probably better to say that whenever downloading a
> PSU, that at least 1 other PSU is connected and has AC attached.

Yes, technically, as long as there is at least 1 other PSU has AC, it should
be safe to do PSU update.
But that involves a certain complexity, and it is safer to require all PSUs to
have AC.
So I chose a simpler way to require the above 2 & 3.

The requirements could be relaxed, let's see others' ideas probably?
