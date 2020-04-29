Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC131BD1B2
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 03:24:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Bgln6NGqzDqxG
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 11:24:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132;
 helo=mail-il1-x132.google.com; envelope-from=suichen6@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aFWT1JTD; dkim-atps=neutral
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Bgl40QL1zDqjk
 for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2020 11:23:43 +1000 (AEST)
Received: by mail-il1-x132.google.com with SMTP id w6so889044ilg.1
 for <openbmc@lists.ozlabs.org>; Tue, 28 Apr 2020 18:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8xBzeq3KTU5VtbODJytK4d9S8BaGLQVFmIjh2IeX3qI=;
 b=aFWT1JTDwZEm+BOFatp0iToDBHaYKt2QSyRuodclGd4mqePnHN2J8DZ2Tgqd2/faVG
 ggwdi2lj8zIRcvkPWI/te4gUaAltS6ueW60zGYbZtxBnIUDxtHkyzoWs4OHJhcWojOsw
 XLwJJj9yYSxvYqEAmxOrstACUoXgF21Mzu5pHvzv8KrxKFEK6RqBIX4V9CplSnTplVhK
 folrlZ2VGi9vXyX222u+aMNxJNPbTI80p6pbsi/OPFl1WNKCiM6PTYhP/mGMMKhLMJ3y
 1mwlCko7/kCdIgG7YBHHTNgw/SDmBMaiU1lzUP6A9nNBqVypAf0/6O9S44lsqGQT2PMH
 XEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8xBzeq3KTU5VtbODJytK4d9S8BaGLQVFmIjh2IeX3qI=;
 b=nQzvZ26HrA1nhdWXQS8/K0I44qPi8nTowPM/TXjwTBD1eoPiKtp+Wbtax3pDk8abao
 KzXlCNW25URZyO9J4MT6voG/YZdkciWZ8iq409ue0nF8j/tlLmZ2aNA1opVWE3Frknwm
 FRCAjxigmYco/698sLsHSpXZsNh0Hy+ZMuB/EugA2CbdCmj9OaL0LPE8IeCJFKhsGe2Y
 H7JFif9YS1DuIOUsOyXEv9xMchWOzcETzv0V43YLyh4ZGiZt+YWpcFQgo5vewRQHxUYw
 4jSJGaPH474qSu5NKTKcKYhxV6irDkZ49RNXfXTjmGWRUuvxEo/7Rm+JL4u0RUIYQ5U4
 gGIA==
X-Gm-Message-State: AGi0PuYQADFPU1UyX1eoZWkoI51TxkkD3s+FZV7LGidDqBtHJ6kBm1Eb
 x9F8Hin8Re5ZBBbebp6uBJPxgDWES3xH9RdknHk=
X-Google-Smtp-Source: APiQypLHiMH9+LWamzbR0YypUsk1n6suKZs22500AvAQ3TOmXwMZxsElgQpOurRxtEZrKBd4rGxt0RbBBpbX+3URzkI=
X-Received: by 2002:a92:d846:: with SMTP id h6mr29263995ilq.196.1588123419580; 
 Tue, 28 Apr 2020 18:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <D823D4AF-9C24-4DFC-8AC8-5284C4167B30@fb.com>
In-Reply-To: <D823D4AF-9C24-4DFC-8AC8-5284C4167B30@fb.com>
From: Sui Chen <suichen6@gmail.com>
Date: Tue, 28 Apr 2020 18:23:27 -0700
Message-ID: <CAFaEeaHd_8+GCvFzmMdX01g5qQM5Z3oH8zd-g6LKpLO5-vs1pw@mail.gmail.com>
Subject: Re: BMC health monitoring
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Vijay,

I'm not aware of an BMC health monitoring package that is ready to use
out of the box, but it appears we're thinking of similar things --
monitor the BMC health.
I guess there may be multiple parts to this:
1) How does the BMC collect health metrics; this may be similar to
profiling a regular Linux system; actually the list of metrics may be
expanded to anything that may be obtained through Linux profilers, but
the set of metrics that are most important might vary in different
situations.
2) How to get the metric data out of the BMC to the host or some
monitoring entity that oversees a large number of machines; depending
on the connectivity of the BMC it may use different methods.

Thanks,
Sui

On Tue, Apr 28, 2020 at 1:19 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Is there any module which does health monitoring for BMC health. If there=
 is none then I am proposing a phosphor-bmc-health which will monitor follo=
wing component to start with and can be extended for more components.
>
> CPU utilization
> Memory utilization
>
>
>
> It will take proper action like report alert or reboot system when these =
data will cross it=E2=80=99s threshold value which was configured.
>
>
>
> Regards
>
> -Vijay
