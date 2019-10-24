Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A04E27F6
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 04:04:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46z9YD4sJfzDqSS
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 13:04:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132;
 helo=mail-il1-x132.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mAAn7TKR"; 
 dkim-atps=neutral
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46z9Xc137szDqQT
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 13:04:15 +1100 (AEDT)
Received: by mail-il1-x132.google.com with SMTP id p8so11153638ilp.2
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 19:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vYJc4yDXGa5XT1IMS7j8KSsWrglw81HuLXkmjK9k4h0=;
 b=mAAn7TKRdb8RoP73E7mN0jhx2PAD95kGu8Ats6ysVNeqA4SUVddGNkKkeky6Xcik0i
 g3jz0b3RN2b0Uy22kzi60ZP7lulGyF6G+wlafz1dvrr2EGjUHOFNO4n9FuFfUE2llFv2
 g1FZJhqQrdmNXwGSDdS1+ZRw9Gd6nb57LxXS8fejMugd0XnGLWw8DXn+x5HgbYNGy1RM
 cKqNambGHu6CdODeht9+kA99KfjZqaLApwbSEGay3bqgJ9lMVmXpt4oXIEpxt21H7q7X
 Gt3MeZBPoFaGuOJcBxBvssWQHEaOSyriqm2toD7ICBWz7Syt3s3gT0o+oMIMConSChM9
 OV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vYJc4yDXGa5XT1IMS7j8KSsWrglw81HuLXkmjK9k4h0=;
 b=sVZVVUa0oIhHWRqDELNLdXNPt86Xy7LnbEOISL0OPKythEo1emnNezlVzEXrX2xzRl
 6HLW+e0zOMGb23Hxe0pEFUqJFU2bqmjm6KkkCfNNvuxODDb3FJ39IeRhDHWw6uu6RUxg
 dP9LG6RRMNYsKlpfrxt6nh1RraYzqpWaipdGjCdNJgccAYgcF0zd2IOQPGZoeySoUbcq
 q4YbgJb4SVDKvNkwzUFZoGaDrtIPMl0gLSnIKTWlkplF+3EkKpMCBJtndBnxtiBDAFn2
 zizp6irkgORlyBlyOc+iD5BZsMlvgWmJSIEFkb4etuTukkqLE96bWn4Uhiye9/2Qc1ih
 8/Sw==
X-Gm-Message-State: APjAAAWA/4rWmAHqDsZawIsAWZAReRRPwpLrR3HevnkZGeIzm0vGkRwx
 1d+mGYbQA6ur1CCqYezmm9qfPbc/UHo/p2K2J7k=
X-Google-Smtp-Source: APXvYqyQg/qdrs9rgB3oiz4G7y4BF3GkgONaG/VRmhxO7KlZ8wMvmGenH5MxSarlFYKrchwpa+qJ7g+3WtvWw1mXmYg=
X-Received: by 2002:a92:a103:: with SMTP id v3mr43010781ili.52.1571882651787; 
 Wed, 23 Oct 2019 19:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notw-fwpSrWUssLY_WE07bQCy+38-Dp__B4TrnhL7Yzdnxg@mail.gmail.com>
In-Reply-To: <CAO=notw-fwpSrWUssLY_WE07bQCy+38-Dp__B4TrnhL7Yzdnxg@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 24 Oct 2019 10:03:59 +0800
Message-ID: <CAARXrtni+vWJT446z21_waRVC8cZY89x=eGent6aOYX6LCdY-g@mail.gmail.com>
Subject: Re: PSU Sensors - Associations
To: Patrick Venture <venture@google.com>, Matt Spinler <mspinler@gmail.com>
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
Cc: Josh Lehan <krellan@google.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>,
 Peter Lundgren <peterlundgren@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 24, 2019 at 1:39 AM Patrick Venture <venture@google.com> wrote:
>
> So, I flipped the association interface addition and the property
> initialization to match other sensors, and then it started working.  I
> was curious if you had any suggestions on how to find the matching
> sensor given the paths, for instance:
>
> busctl get-property xyz.openbmc_project.PSUSensor
> /xyz/openbmc_project/sensors/temperature/alt2_Temperature
> xyz.openbmc_project.Association.Definitions Associations
> a(sss) 1 "chassis" "all_sensors"
> "/xyz/openbmc_project/inventory/system/board/Altie"
>
> busctl tree --no-pager xyz.openbmc_project.EntityManager|grep Altie
>           |-/xyz/openbmc_project/inventory/system/board/Altie
>           | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_0
>           | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_1
>           | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_2
>           | `-/xyz/openbmc_project/inventory/system/board/Altie/alt1
>
> No alt2 -- so how do I know this?  I can walk every subordinate object
> to find the name match, but I was curious if you had a faster idea?

It looks like buggy, I think mapper shall make sure the association
object is created only when the associated object exists.
@Matt Spinler could you confirm that?
