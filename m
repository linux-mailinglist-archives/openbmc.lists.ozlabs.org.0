Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A134AE35B6
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 16:40:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zVJp29r3zDqC7
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 01:40:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kSG72/Yc"; 
 dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zVJ23hNpzDqC4
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 01:39:28 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id 15so9027228pgt.7
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 07:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WwzIhe1H+zstjcgi6T5bwplNIhfEWZC1yMbZHvaEG4k=;
 b=kSG72/YcFo36kQqxeH6ka4RfRKpsIxj/GyH+EaOJcJgDwy9YsLXv6XnpbJtVwxCoBJ
 ekGIaj2VbOAUU83xqoF5StBV09M3W3OHlKSNQtOlGo1FIjrxc9laQ9LIL/knVk3UojMG
 6WY1YwFRUAR+FLWk5tnvwRPbr0N8Lqc749NGijnBVQcFlqseYdenwj/kIjZYo1YWowbB
 uadS+QRpNBLDymnoi1Q/K0l9zgMla6CjrkdHJyvaUQgohQtdWCzhbshRKvvW7CvaMGu1
 nive8q69+8WA1Jhov8GypXMCd424fH3/uBtzekgWUQNZu6EXztI8fU4c+WJL4rH0qt4o
 sfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WwzIhe1H+zstjcgi6T5bwplNIhfEWZC1yMbZHvaEG4k=;
 b=RFaq0t5eiTZbzO634A1rIrYnSp8SHJpBiPtxslwicpvnuk5p7p5mYhD1ebN2ZM7AhF
 df6jDZQPM+jjop8LNuW4RUMyNQxkafV0tXDjHVK3wkcxVtf1BL8O12kGr4CmaF3/3PaR
 CFadEVUdTrTtEOo2E7vVRVjDKtiL904gEO1MH8rHEIRkpzvDLpF/vjAAle4AL/90i401
 1HcZXx039LCRFYe4/ETuA7/4X9hlOwIHSMFhOxhODAqZngZPGFactz0MVInlaJKeFs8d
 yYDuXk5xAy8wS63DcDbRsi5E5FQiWr+pvZqe9nKfy54e7EzxViXPDcxCv29kqxCZc8cP
 sUKA==
X-Gm-Message-State: APjAAAVhF8HFhz3BCdFTyh6NQrQU5C/Nqbg6ImDAULDb1u+516m3P3d0
 YfNFIoAd90uCGbkBwwMO6NkMqCFX/85CoYuLRmVbUw==
X-Google-Smtp-Source: APXvYqwcQsqartvnsd5NWTmnuSYk+wOM/FEZLLvMsTsPOv21UOOaxsmoy/z584o6eFARvFTiLBASLkzQfNlv1iECedw=
X-Received: by 2002:a17:90a:bf09:: with SMTP id c9mr7749728pjs.9.1571927964514; 
 Thu, 24 Oct 2019 07:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notw-fwpSrWUssLY_WE07bQCy+38-Dp__B4TrnhL7Yzdnxg@mail.gmail.com>
 <CAARXrtni+vWJT446z21_waRVC8cZY89x=eGent6aOYX6LCdY-g@mail.gmail.com>
 <3f106eff-91a5-de66-1d91-e73d0491d35a@linux.ibm.com>
In-Reply-To: <3f106eff-91a5-de66-1d91-e73d0491d35a@linux.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 24 Oct 2019 07:39:09 -0700
Message-ID: <CAO=notydRFN_z3BA2=BvAFdm-MBfh1AvL-GNrpX2aXnf=THeaA@mail.gmail.com>
Subject: Re: PSU Sensors - Associations
To: Matt Spinler <mspinler@linux.ibm.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Josh Lehan <krellan@google.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 24, 2019 at 6:07 AM Matt Spinler <mspinler@linux.ibm.com> wrote:
>
>
>
> On 10/23/2019 9:03 PM, Lei YU wrote:
> > On Thu, Oct 24, 2019 at 1:39 AM Patrick Venture <venture@google.com> wrote:
> >> So, I flipped the association interface addition and the property
> >> initialization to match other sensors, and then it started working.  I
> >> was curious if you had any suggestions on how to find the matching
> >> sensor given the paths, for instance:
> >>
> >> busctl get-property xyz.openbmc_project.PSUSensor
> >> /xyz/openbmc_project/sensors/temperature/alt2_Temperature
> >> xyz.openbmc_project.Association.Definitions Associations
> >> a(sss) 1 "chassis" "all_sensors"
> >> "/xyz/openbmc_project/inventory/system/board/Altie"
> >>
> >> busctl tree --no-pager xyz.openbmc_project.EntityManager|grep Altie
> >>            |-/xyz/openbmc_project/inventory/system/board/Altie
> >>            | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_0
> >>            | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_1
> >>            | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_2
> >>            | `-/xyz/openbmc_project/inventory/system/board/Altie/alt1
> >>
> >> No alt2 -- so how do I know this?  I can walk every subordinate object
> >> to find the name match, but I was curious if you had a faster idea?
> > It looks like buggy, I think mapper shall make sure the association
> > object is created only when the associated object exists.
> > @Matt Spinler could you confirm that?
>
> I'm not entirely following  what the problem is here, but I will still
> take a moment
> to plug my association (and other mapper functionality) documentation at:
> https://github.com/openbmc/docs/blob/master/architecture/object-mapper.md#associations

Thanks, so given the documentation, we can create additional endpoints
because there is more than one relationship with the object.

>
