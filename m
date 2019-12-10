Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5504B117E24
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 04:25:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47X56h33pnzDqVH
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 14:25:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d33;
 helo=mail-io1-xd33.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bWLlU5ey"; 
 dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47X55x6smyzDqS2
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 14:24:51 +1100 (AEDT)
Received: by mail-io1-xd33.google.com with SMTP id v3so199383ioj.5
 for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2019 19:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BnMgg+cJ1+7ORP2pOV40Tgp0nssRCCnAZ9y/RY+JVhY=;
 b=bWLlU5ey+3YaBKvPaJo33FTWhQ8SMPn6Yce5FjG0APVwJYHksg2auOaQc4s8XhkXNe
 MFFlXZl1MsKHzjQ0J8bSUfsHJ4hGVwEcm95KHQPaL/j2G2w0QH97vIJmUVyZDkBiuNmM
 JYSZnnAhwRHBBk+fXZeGUXRcoPU2XsHK53wHw4YT02wuzEOLUfekXwjRXBNtXRBBVLxO
 Xrxa/vCn+e8QkRjjeiQ9k8WE0XbSJWfC87vcQVaanw0W+MCg6xHiPQ3E5dd+zMPz2GhE
 hQY6qoKGJCJVXXH56tc2oXHUFnYkkxDhSBEXORBQevze1MyoIg+bMdipmxLnJJLvjbgK
 Gkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BnMgg+cJ1+7ORP2pOV40Tgp0nssRCCnAZ9y/RY+JVhY=;
 b=pQ7f9oJ+IXO5PhHJ7tQN25Kgu7FBJGIUsBwc0WYX4zR1U2T8eWT7CgWVdgK2xxY1P4
 mROppTyCY3iZGrB5/vZibbxbg9tkNGh8KKo6m74cCTdfmqTXDgasLawhvjoAC9hpuRmu
 ye60Yk6clKIJbadh/hCa2GtjeLpT0M6EnjaoRd2Xv5mDpdoAJUrwZtNwFYrlEWrCVegj
 Grq03qOGf3GNO0EW2pN8y7kwl3y3IQSzWgv1SdF4nJfcqpnxuYkVnowIaP0sF5UNa8Tw
 tiwofmnEqWcXIqFYr6ofSQS1Ubx4BEi8Yf9L3YbSgujXJZTTsHX+CtPe0dILsEWq5P2/
 B+SQ==
X-Gm-Message-State: APjAAAWliRYzicvvlelnkr/ny/bQQnpBK2lSz34ZrHbyl2jQQYkC6Fa6
 Q29V3NS0VywX2FefX/+AkQiGdAy/33lmNzUruQY=
X-Google-Smtp-Source: APXvYqzCf5og3yIN2Prva3XLif1H4Rmd9s90bU9c2efpYq1rnNsHXiTukI+pK6GD8gm6hcbbgzXEr7Z8rSSRpP/0Pjk=
X-Received: by 2002:a5d:8c89:: with SMTP id g9mr23043309ion.221.1575948288205; 
 Mon, 09 Dec 2019 19:24:48 -0800 (PST)
MIME-Version: 1.0
References: <CAARXrtmNsry0bq-5eTD5qo0LDq_zWag9s8kGqMq4yGxzpxXCeA@mail.gmail.com>
 <CAGMNF6Wc_1pxReDXYQvOQO1Oy5K+Ejn+G+j9F-ei4Vpg4nQ5XQ@mail.gmail.com>
In-Reply-To: <CAGMNF6Wc_1pxReDXYQvOQO1Oy5K+Ejn+G+j9F-ei4Vpg4nQ5XQ@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 10 Dec 2019 11:24:38 +0800
Message-ID: <CAARXrtmYBVQCb320kNxKyo3Sp1i7sZ5-kMi1efHVDOD2cXvuGw@mail.gmail.com>
Subject: Re: Updates and future changes on phosphor-power
To: Kun Yi <kunyi@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Dec 10, 2019 at 5:10 AM Kun Yi <kunyi@google.com> wrote:
>
> Hello Lei,
>
> We have some interest to help contribute to the phosphor-power utils.
>

Great!

>
> Will phosphor-power provide PMBus fault status bits monitoring?

Yes, it already does monitor PMBus fault, see [power_supply.cpp#L134][1]


> How is it co-operating with phosphor-hwmon or dbus-sensors when reading sensor data from the same PSU device over the same i2c bus?

As far as I know, it does not co-operates with phosphor-hwmon (and I
am not familiar with dbus-sensors). @Matt Spinler correct me if I am
wrong.
Instead, it sends the error log to logging service with the inventory
path when the error is found. See [power_supply.cpp#L309][2]
And when the error is gone, it resolves the error by setting the
`Resolved` property of the log. See [power_supply.cpp#L282]

There is a [fault-monitor][4] in phosphor-led-manager that monitors
the error logs in logging service, and assert/deassert the related
fault LED group.
So the fault LED will be turned on when an error occurs, and turned
off when the error is resolved or cleared.

[1]: https://github.com/openbmc/phosphor-power/blob/1d103428e50ec000372e6b1c2bccc8ee92ddbc89/power-supply/power_supply.cpp#L134
[2]: https://github.com/openbmc/phosphor-power/blob/1d103428e50ec000372e6b1c2bccc8ee92ddbc89/power-supply/power_supply.cpp#L309
[3]: https://github.com/openbmc/phosphor-power/blob/1d103428e50ec000372e6b1c2bccc8ee92ddbc89/power-supply/power_supply.cpp#L282
[4]: https://github.com/openbmc/phosphor-led-manager/tree/master/fault-monitor
