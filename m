Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A39E45C8DF
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 07:38:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dCgy5QpBzDqCH
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 15:38:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="JjKPmXqW"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dCNt06GpzDqB7
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jul 2019 15:25:00 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id a15so17154984qtn.7
 for <openbmc@lists.ozlabs.org>; Mon, 01 Jul 2019 22:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2MP7SBYrNOvAb/ZoupLDNjtaViG5KWgvDKrKBazI4p0=;
 b=JjKPmXqWriJUrMNvUXadU1YXV9UP/oE5ot8kPei1tQFNMZqeiNGOTBDwAQGR/56NFQ
 0DVOY0la+4kPUSscQ2lIh32TZ/JxvlaGNI6/wn7H4mmAD73TZ1x/56MZo2/Ye+huW4hB
 1+f+2qDi96c82JFVXT42KT+ctnbLpFAImDTtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2MP7SBYrNOvAb/ZoupLDNjtaViG5KWgvDKrKBazI4p0=;
 b=FMYihqbFo2V07uSIzxKjcJn/RxdhVogOZgs9EBdANfsuk1lZIVxNJrFMJVMtO9gByK
 9qxI4O4CSsHpLqWNplu6CBpVtafLe3KO71LSBShz4zivHc1d6tkod3tBazXnROUAalaT
 oPgCFoZdimTueGQadwKUnEWamwzm+bwmjcPG4xQR8ujJmsej3smqhrU+pbQ4a6FdqH1a
 TnXYykqq9L4pPLPlg10OPjfsO9LITuRBDcCvMXXRuOsQLp0JhQoG6e5SFuMzj6iX6G1n
 ZSdboz/+JUryIFk/cRDgG58snhl7ubHfxqHmZFKXU0NO/2r4AGOcgb1fyZdSPALAum98
 SsHg==
X-Gm-Message-State: APjAAAWRHqbWO0vW8nu9ijFZGHGe9/7xw+zkLBP8O4XmXyHeRcrvmDXA
 Zkk0kmWU9kHyxZa+ttliSmENW6YabYs/sFtLTQM=
X-Google-Smtp-Source: APXvYqw6xmcqkD/k9Q9Crxn7DmlEdXwpJ/uS1tKpl7nds7CnKCeyF2YY0ZqF8MPDshEhMW2KbPCKeYo34sgbOiJdH9Y=
X-Received: by 2002:a0c:a8d2:: with SMTP id h18mr25215322qvc.16.1562045094427; 
 Mon, 01 Jul 2019 22:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190625205109.27672-1-jae.hyun.yoo@linux.intel.com>
 <20190625205109.27672-5-jae.hyun.yoo@linux.intel.com>
 <5cc696ba-7fa7-c7cb-0ba6-81df3015e974@fb.com>
 <9c862188-8360-fa39-f21d-9c6d51e1d831@linux.intel.com>
In-Reply-To: <9c862188-8360-fa39-f21d-9c6d51e1d831@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Jul 2019 05:24:42 +0000
Message-ID: <CACPK8XdSeK0CPrncmxjMKBLfCwCVHE-VWhAVaia1oQMFTOf_0w@mail.gmail.com>
Subject: Re: [RFC v2 dev-5.1 4/5] i2c: aspeed: add buffer mode transfer support
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>, Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 27 Jun 2019 at 23:35, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> On 6/27/2019 4:24 PM, Tao Ren wrote:
> > On 6/25/19 1:51 PM, Jae Hyun Yoo wrote:
> >> Byte mode currently this driver uses makes lots of interrupt call
> >> which isn't good for performance and it makes the driver very
> >> timing sensitive. To improve performance of the driver, this commit
> >> adds buffer mode transfer support which uses I2C SRAM buffer
> >> instead of using a single byte buffer.
> >>
> >> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >
> > Tested-by: Tao Ren <taoren@fb.com>
> >
> > Applied patch serial 1-4 to openbmc kernel 5.1.15 and booted up Facebook CMM AST2500 BMC: I2C component looks normal to me.
>
> Hi Tao,
>
> Thanks a lot for sharing the test result.

Do you want we to merge this series into the openbmc tree for further testing?

Cheers,

Joel

>
> Regards,
> Jae
>
> >
> > Cheers,
> >
> > Tao
> >
