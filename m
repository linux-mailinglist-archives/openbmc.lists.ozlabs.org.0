Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A98C51273C3
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 04:16:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fDR81n6SzDqv5
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 14:16:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d33;
 helo=mail-io1-xd33.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WWdB9K0l"; 
 dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fDQQ2s6GzDqrn
 for <openbmc@lists.ozlabs.org>; Fri, 20 Dec 2019 14:15:25 +1100 (AEDT)
Received: by mail-io1-xd33.google.com with SMTP id n21so6403450ioo.10
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 19:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S54TEo0pYF/9tAJTkJxzZvFyMxRD8fdDymNg3coX5aA=;
 b=WWdB9K0lQCK0qcaCLpLATdGMJyJmwCcHC/WloocLFJ6Ky+GPu7/0s3NrOxJuRKzeIr
 1qSOzheyS3QWk/p8TZwudOZjgrRatAgsG2hHLQEIscF8NwIhbDMV9EKgWQQOyVgUbdC7
 mU83ifSibfH1Dt2zuQavHqtpmsGczQtj5xteFhyoVkJfDv6spbeUcVRup9lH9cRWzeTH
 ctx+mE6YmI1a9SwvTMA1uLIl5MQ1KDME0rZT5njN82qIBRjjOg+Jol864aJLHnLVjrqq
 jsWwlhUZ6qTGK+cmQjeMfVxv8z0I6nqG2+Fg+8nq+v81iNnRrCZoLicaeHhV8rXjb0FT
 NsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S54TEo0pYF/9tAJTkJxzZvFyMxRD8fdDymNg3coX5aA=;
 b=hFeeGBFpjZDM2ezHsGxPwgXlhy+Y+VJmhmb9R3GzP3l/WKGzuVtH4w8zbiONqF/Zj7
 TTpcxwnFagLZtwf0lyVBUfgqBuIN5DEjO+vTaLkj/2Tfh+TL2ViBnFVRqCvcian5GGio
 pYOiEmJ30uuLlPFWLSEt8P1xLd93cidtGfMpJtli+tO3YIycrYRp5zhkejWqlU/Ivj+2
 xksZ/R0q5FOw5yFOatjZ4aTMM6fTz5Icvhc6GBOpit53ddCH+V0zoYPamNS0EI1C+f/t
 LDBE1YeeqwtU/dBZ6XebUAz6jrjnADVbXYv6qwbcNvL017g/D1zmPKemj/Q6KCjXhI6F
 AmTA==
X-Gm-Message-State: APjAAAWVcPJh8TvjFG4gbCfQU6EP/hvleBn6lRN8zd9d1S4AqAG4mThp
 kP3ZXzUBnuS4z8sANpFf5SGI2TpjB/JqL9xMxY3yjk02a8uKEw==
X-Google-Smtp-Source: APXvYqwXiV3PWPVgXVeEX/N1kGMaAHME7Re1WUy1joyXfOW52T/TN4n2W+KsdvywA8kr1+Kn9h5RBHnURyZWjhsCQNo=
X-Received: by 2002:a02:9988:: with SMTP id a8mr10640853jal.33.1576811722574; 
 Thu, 19 Dec 2019 19:15:22 -0800 (PST)
MIME-Version: 1.0
References: <2153c03a-fd09-fb67-7051-5e889e5d2f8b@linux.intel.com>
 <CAARXrt=wL7ZT=tGzP-DQTgEwiSZOfdQ4n1kvE5oa6HhyPV3UfQ@mail.gmail.com>
 <33a034df-8e29-681e-f83d-aa496f558d4f@linux.intel.com>
In-Reply-To: <33a034df-8e29-681e-f83d-aa496f558d4f@linux.intel.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 20 Dec 2019 11:15:12 +0800
Message-ID: <CAARXrtnL8-zpiL73E5E=q9=WcX_BDa31ZbcThBTNyMr1UF1HpQ@mail.gmail.com>
Subject: Re: Power Supply Cold Redundancy
To: "Yang, Cheng C" <cheng.c.yang@linux.intel.com>
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Dec 20, 2019 at 10:31 AM Yang, Cheng C
<cheng.c.yang@linux.intel.com> wrote:
>
> Originally, I also thought I may push my code to phosphor-power, but
> when I was trying to devtool modify phosphor-power, I found a error happen
>
> ERROR: Nothing PROVIDES 'openpower-dbus-interfaces' (but
> /home/cyang29/openbmc-openbmc/meta-phosphor/recipes-phosphor/power/phosphor-power_git.bb
> DEPENDS on or otherwise requires it).
>
> We do not use openpower-dbus-interfaces.

Right, that is a problem, and the good news is that Matt is already moving
openpower-dbus-interfaces into phosphor-dbus-interfaces
(https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/27380),
so it will be no problem in future :)
