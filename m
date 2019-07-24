Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D73227333A
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 17:58:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45v0Q12s7CzDqMK
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 01:58:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Z8XE8gP1"; 
 dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45v0PT4ZMqzDqLW
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 01:58:18 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id p184so21164188pfp.7
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 08:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ndj4RislOdnvwDo2+jGJau/J0hf5g6ASOY9Lue+gNhk=;
 b=Z8XE8gP1AOGpSys+5zOXKlyKZ43xI1Wrh+rV9wu0GCxZVMJ/ibpDXzBoidamfBGanX
 tXzK+ysj/CsmD331IfgTtgYY8wjgFBgj6T1efJDOp5IlwT+QPSucbMbhKxhmRhWHcDWX
 KICIKmTf1kkLmNYhTtvtT07r9EMnLE1SxTyYGz0r2DA6jFjASjgPJpZw2jRTByL+SLKS
 JpCmSMBpUkWpJKAozv7l6VFcyiW/ReX31ch5hv4SyeMydxsOQvwe3oAaOE5qh/t33Y2N
 GnUt742vIiWU8FezjViKB37TUQJ9hfiBeD9Axpee99ipYFn/QEkiwUrbeV49LQC577oz
 FpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ndj4RislOdnvwDo2+jGJau/J0hf5g6ASOY9Lue+gNhk=;
 b=jyFWl7Cy+asvTQX7cc+W1ZXoro8EoGofSXh44y7Kc/xmbQKWGEfSEnEb/8IREwxj4P
 emVEUK4ilEld0ax5xp+lVTSv2doq8bJ9DrNCle9EJIaAxUQUhBMwlOUrZ0ZN2VCi82en
 zuxSAtdqSaNAWIMerpyNN7BOpOXNFqQf2M33VweKAIj5P1JXjY4afs10VFZhsIxYg8EQ
 /C+gHbR0NGS9+vjNX66AMKQosnP/+c6Xd/6CYnHyYG+xhqZSAEcC91rKPIiWM6DJ6nYu
 rDWlv2rLpQ0tBfgSaYTIK2lqShBROiaGSQSK3MxlrEvQ9nZcBVDVPQxF8Wn5Zg9QzlAE
 yilA==
X-Gm-Message-State: APjAAAXpO4aD+wS3vEO3+tkhlWxbow5JiZTUQlcrKwY8MctbSdsDHchF
 YsBhpC1qxTJonny7Ad4dck9cmQTElf+/qs1qR/HsxppcYGdf0g==
X-Google-Smtp-Source: APXvYqytUPoG/URZ+RdIm9FpluqmWgxpNy2f8xybmTFq7EZshb3CW2dMEH0mwJHJdySSNMb0PvfMIRJmAU5EaeTyuO8=
X-Received: by 2002:aa7:914e:: with SMTP id 14mr11984025pfi.136.1563983895365; 
 Wed, 24 Jul 2019 08:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <1CE4F632-2F5F-4EA3-BCC1-0F76C0DFAFD6@fb.com>
 <b92f4522-7d2c-d961-0089-c888dcf5335a@linux.vnet.ibm.com>
 <CAARXrt=sT4VJJVUU-FCKFfW9RWHeXbhcNQ-SzW9d6wEqw4WhNA@mail.gmail.com>
In-Reply-To: <CAARXrt=sT4VJJVUU-FCKFfW9RWHeXbhcNQ-SzW9d6wEqw4WhNA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 24 Jul 2019 08:58:04 -0700
Message-ID: <CAO=notzaEio5eNK8AE2QRksDyeAr7Cc1v4hG_fCiK93+u5Jemw@mail.gmail.com>
Subject: Re: BMC util
To: Lei YU <mine260309@gmail.com>
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
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jul 24, 2019 at 12:45 AM Lei YU <mine260309@gmail.com> wrote:
>
> On Wed, Jul 24, 2019 at 2:38 PM vishwa <vishwa@linux.vnet.ibm.com> wrote:
> >
> > Hi Vijay,
> >
> > On 7/24/19 12:21 AM, Vijay Khemka wrote:
> >
> > Hi,
> >
> > Do we have any repo which supports command line utility like
> >
> > power on/off server,
> > reading all sensors
> > reading a dbus property values

I usually just use busctl

~# busctl call ${DBUS_SERVICE} ${DBUS_PATH}
org.freedesktop.DBus.Properties GetAll s ${DBUS_INTERFACE}

> > printing fru data.
> >
> > There are some here. https://github.com/openbmc/openbmc-tools
> >
> > Below is what we use mostly.
> >
> > https://github.com/openbmc/phosphor-state-manager/blob/master/obmcutil
> >
> > # obmcutil --help
> > usage: obmcutil [-h] [--verbose] [--wait]
> >                 {bmcstate,bootprogress,chassiskill,chassisoff,chassison,chassisstate,hoststate,power,poweroff,poweron,state,status}
> >
> > positional arguments:
> >   {bmcstate,bootprogress,chassiskill,chassisoff,chassison,chassisstate,hoststate,power,poweroff,poweron,state,status}
> >
> > optional arguments:
> >   -h, --help            show this help message and exit
> >   --verbose, -v         Verbose output
> >   --wait, -w            Block until the state transition succeeds or fails
> >
> >
> >
> > Also do we have any daemon to monitor gpio lines and report events on changing values.
> >
> >
> >
> > https://github.com/openbmc/phosphor-gpio-monitor
> >
> > I am currently writing a README on how this works when the GPIO is asserted and how to configure the actions to be taken.
>
> There is an existing doc to describe how phosphor-gpio-monitor is used:
> https://github.com/openbmc/docs/blob/master/development/add-new-system.md#gpio-monitor
