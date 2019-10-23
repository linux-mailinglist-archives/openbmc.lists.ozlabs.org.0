Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F9BE221E
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 19:53:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yyfV152qzDqQn
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 04:53:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="G06T3Jo5"; 
 dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yyds0ZX2zDqQf
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 04:53:04 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id b4so4464862pfr.12
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 10:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BluUlF2pQG2WRYuuPJ90CjUDLxK0ReV3iJR15b6Jf48=;
 b=G06T3Jo5gPzAXO5FMftYQjtaVh8ZZc8aPN6TQCfdTpdQEfpmNa+cYSmoAtOljUxD1I
 IZIqrsIB8VIRSTPSKAxcLZiRg+AI9d1YcquREGAEZjm6F+qkJJ2l8vI5jWmEUlXSOKG1
 YPvHk5eRvnVGex/fm9XKCQ42uonQYo/6ACQvr1FLMJW3AIv3O9RjSYzMRPqvhyRLTK6Z
 LvhPsY5yBrRQgppDtiiOe0pUpQJwOOM18mdEjBy56IZuemHIVW7wCKZHJY8WMMEtgnGo
 GOMRcr+LUZLOob04WQwEimSrB5wSDBTcY+9ISI/DG81Iowwp7AwbjEHccv43LUmVJg5O
 aaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BluUlF2pQG2WRYuuPJ90CjUDLxK0ReV3iJR15b6Jf48=;
 b=Ng6jbGxVMhJfVyR3gWyR0xyUhLTeedsP4xqBSgfvkEh8CWM/5m4b63dis0poh5TaPV
 RfjkBSIrN/gDm2qwtfMehCpZWCto+VU+19awHzEW/1QQ9dK8xXQ3tuNzADuMAasT3mfJ
 Wq5Eu4gEXZWizMHEJqTm9DVrmBUuWGgAeePFKRvF0wG032SxV9xWeDndMNJ0ubAdO8fL
 xLgi6EIerw4Evik0sXmQiZPeODBTmM7q6T5B1mD8+Vn106VdkkXdmDiVQtlvfyDRfbVO
 YnGru0PS7bcpAW9TnSfwTXgzQeKVvmuEzmwrvAgBRSgKExW1QnJGAfN8iOiUNKiQ3j3K
 uaDA==
X-Gm-Message-State: APjAAAWorGdMo0dFF+QX/0tHh/VCzhQRfqPsnkvvQRPgf6tKpzFWgH5/
 cYaRsRKr6yFIutnc8GNyEgvnVPDcGtqlakvU+sWNNg==
X-Google-Smtp-Source: APXvYqydIJcTJJxTmFSD1AkiBQ4QOKK2WxRJ3MEPQf/v09DMeVyqWAzh5e5EyEGyI9odNvblhkUETEGJGk3xBDm6RTM=
X-Received: by 2002:a63:e255:: with SMTP id y21mr7946111pgj.353.1571853180941; 
 Wed, 23 Oct 2019 10:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notw-fwpSrWUssLY_WE07bQCy+38-Dp__B4TrnhL7Yzdnxg@mail.gmail.com>
 <657c3cf2-b6c8-6c02-1397-e09963ebb267@linux.intel.com>
In-Reply-To: <657c3cf2-b6c8-6c02-1397-e09963ebb267@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 23 Oct 2019 10:52:49 -0700
Message-ID: <CAO=notxLcqmNFDeA+XZFkoe2e2=xyQ6F56_EMRvfx--LfzyvJw@mail.gmail.com>
Subject: Re: PSU Sensors - Associations
To: James Feist <james.feist@linux.intel.com>
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Josh Lehan <krellan@google.com>,
 "cheng.c.yang@linux.intel.com" <cheng.c.yang@linux.intel.com>,
 Peter Lundgren <peterlundgren@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 23, 2019 at 10:50 AM James Feist
<james.feist@linux.intel.com> wrote:
>
> On 10/23/19 10:37 AM, Patrick Venture wrote:
> > So, I flipped the association interface addition and the property
> > initialization to match other sensors, and then it started working.  I
> > was curious if you had any suggestions on how to find the matching
> > sensor given the paths, for instance:
> >
> > busctl get-property xyz.openbmc_project.PSUSensor
> > /xyz/openbmc_project/sensors/temperature/alt2_Temperature
> > xyz.openbmc_project.Association.Definitions Associations
> > a(sss) 1 "chassis" "all_sensors"
> > "/xyz/openbmc_project/inventory/system/board/Altie"
> >
> > busctl tree --no-pager xyz.openbmc_project.EntityManager|grep Altie
> >            |-/xyz/openbmc_project/inventory/system/board/Altie
> >            | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_0
> >            | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_1
> >            | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_2
> >            | `-/xyz/openbmc_project/inventory/system/board/Altie/alt1
> >
> > No alt2 -- so how do I know this?  I can walk every subordinate object
> > to find the name match, but I was curious if you had a faster idea?
>
> So for the associations you should generally not look at the definition,
> the definition is primarily for the mapper. You should be looking in the
> mapper for the association that matches the sensor name that you care
> about and it should point back to the configuration. If there are not
> associations for each of the sub-sensors, there should be.

I must have looked at the wrong entry there because I didn't see
anything pointing back to the sensor config entry, but just the sensor
itself.  I'll take a look now, the PSU sensor naming issue is
identical to the one if there is just another name available or the
Pwm case.
>
> >
> > Thanks,
> > Patrick
> >
