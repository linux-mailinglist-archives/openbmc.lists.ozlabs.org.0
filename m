Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 500BF72934
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 09:45:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tnSt4H7vzDqJK
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 17:45:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AqrRsTLV"; 
 dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tnS806LxzDqGl
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 17:44:55 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id i10so87479964iol.13
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 00:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l6apUDeP4SR+P9lR0MRl7yByLlBAaPnhiTyPKtBT27A=;
 b=AqrRsTLVRXUZNbgxyWUxIqOwFcqOGmY97QXCRMxoa341M4COQ5a2X7j2tz21btY8Tg
 prRI5twW6xNkzi3cewOVcUMxl/HJX9OPeUfsiRcFtqAFyO3Zx7hYClRIRjqkOL2+PAse
 C+g7uVE3SUdilQTknm/lFB1I3b9tXhOvK/fAydrhld76t4coTa51P0MG4cx3+ObqaxL4
 xzWaJTqdv13VUjsySyujUPOzJdH3WIUv/pwV2Lii5sdbRWQiCNtFpl91eP5jVpYvRh5f
 LlCtqFZk5XxbA5ieTzGK1nudpzX8MIB8VgbxHZ7NmdIE6Oq+ynFZ18sT5PHPp8491lt0
 VjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l6apUDeP4SR+P9lR0MRl7yByLlBAaPnhiTyPKtBT27A=;
 b=YRGZ6NqAPt0CiAM3V7cOmIrxWq4VPBGjwNzYEye/l70PotSsK7Wo2wx/J5Q0IDUknI
 Cx7JHFhs6ix1Y9kHixahbxB4M03ToWGJUM+ttXzuZ+9Zl1oxn8m93bpDhSfvKQdQ8Ys4
 /3mQeG82GuCeALW+oJGJ9jnXj/hJ8rGJVsnfBNc7zQOM0TwKf5uwldjFjr9k7f5GXWOe
 P9r2LlhCIeNurZ57ENeT5usyiFqe0NEPHARNvDf5G+FrVZL/7D3oibu2H2yf01jxQ/gJ
 HkNAbTpEqgl1cgIWelMHVywBJvTKA4oFDJ/EwOm5MJeYvMIhaRpPj9fZmMy9B92drgkN
 +5qg==
X-Gm-Message-State: APjAAAXegFeRPwWrGbg9tFTO2P1Azi+4pMsY4rQ9BV2lHYXemtMn8fnl
 nt+giAyKgDhERdz+h4JmUfpIEl++RsJ8MOAWVzc=
X-Google-Smtp-Source: APXvYqxbpMjEmSl2umrg0DK+hVXujn3Aq1FXOxHhW7w4GSbtcnu3+fFZNzbY4YRIGX0pyqt7b+3Edb79CBU1o8Zq3bQ=
X-Received: by 2002:a6b:901:: with SMTP id t1mr500281ioi.42.1563954292139;
 Wed, 24 Jul 2019 00:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <1CE4F632-2F5F-4EA3-BCC1-0F76C0DFAFD6@fb.com>
 <b92f4522-7d2c-d961-0089-c888dcf5335a@linux.vnet.ibm.com>
In-Reply-To: <b92f4522-7d2c-d961-0089-c888dcf5335a@linux.vnet.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 24 Jul 2019 15:44:40 +0800
Message-ID: <CAARXrt=sT4VJJVUU-FCKFfW9RWHeXbhcNQ-SzW9d6wEqw4WhNA@mail.gmail.com>
Subject: Re: BMC util
To: vishwa <vishwa@linux.vnet.ibm.com>
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

On Wed, Jul 24, 2019 at 2:38 PM vishwa <vishwa@linux.vnet.ibm.com> wrote:
>
> Hi Vijay,
>
> On 7/24/19 12:21 AM, Vijay Khemka wrote:
>
> Hi,
>
> Do we have any repo which supports command line utility like
>
> power on/off server,
> reading all sensors
> reading a dbus property values
> printing fru data.
>
> There are some here. https://github.com/openbmc/openbmc-tools
>
> Below is what we use mostly.
>
> https://github.com/openbmc/phosphor-state-manager/blob/master/obmcutil
>
> # obmcutil --help
> usage: obmcutil [-h] [--verbose] [--wait]
>                 {bmcstate,bootprogress,chassiskill,chassisoff,chassison,chassisstate,hoststate,power,poweroff,poweron,state,status}
>
> positional arguments:
>   {bmcstate,bootprogress,chassiskill,chassisoff,chassison,chassisstate,hoststate,power,poweroff,poweron,state,status}
>
> optional arguments:
>   -h, --help            show this help message and exit
>   --verbose, -v         Verbose output
>   --wait, -w            Block until the state transition succeeds or fails
>
>
>
> Also do we have any daemon to monitor gpio lines and report events on changing values.
>
>
>
> https://github.com/openbmc/phosphor-gpio-monitor
>
> I am currently writing a README on how this works when the GPIO is asserted and how to configure the actions to be taken.

There is an existing doc to describe how phosphor-gpio-monitor is used:
https://github.com/openbmc/docs/blob/master/development/add-new-system.md#gpio-monitor
