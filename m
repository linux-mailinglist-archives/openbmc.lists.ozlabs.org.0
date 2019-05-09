Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDE8192FE
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 21:37:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450Nst41qkzDqRk
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 05:37:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CQcUYLsk"; 
 dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450Ns20cg3zDqRd
 for <openbmc@lists.ozlabs.org>; Fri, 10 May 2019 05:37:09 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id r10so2686457otd.4
 for <openbmc@lists.ozlabs.org>; Thu, 09 May 2019 12:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Ga5w8cWJx1+mTRXoZBlMcg71vA9BjSQWvKeOFsxd/9M=;
 b=CQcUYLskcFdpXg0qCOkX3xZw9CEOcz7WfXeJVvx+YgEBu2BBeKSLXihRgIAkHwZqN5
 GaDzDKPl/94mVXF9tiYCnVR/bS0VUXPwCB+kQ1RrbMNKDKf5tu/jpuBxUzLaLwwFTJfg
 Ijkv5ADyiz9ogImF9q9Haj/HPWV2HWNgAlYYxOzGbNgI48pSXXvV3m7TuqUHg/XGoGx2
 Dj90S5LBji3MM+ePoFO9JHIW8bjwMxzPKPSV+gyeq8O5xteRRYdpfmdK4wkBpnqyscOJ
 C3XW7E7IOdOUQ3Cx5VGhDNu2zKVLqp50zawTn2gcyunvK6XvcgZpdlW4ng8Zx/8mPbt8
 CT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Ga5w8cWJx1+mTRXoZBlMcg71vA9BjSQWvKeOFsxd/9M=;
 b=fRo/jMhk0lhw8LPMzIf0HiThHDPR80SwsshBkU3/CqgzKstX8he8ZIrrPjZqtVQ/z3
 Oo4ef6FSN7mVW5uWgOC3CIPwVqYAoTi8iQ3d7Yy8H6oXzflzoG7Ss9a643eRb8finkry
 8Ii/0Bf9srIG3WpBEvEcBwYQTcbDz/AHT5DyM8em0766X7Vwh2yS/vN341WyIMWkdF2i
 HUWfv1IrUjP28KDzrd6XB2M/h5l3lYSN8bLH98wFHfuEJjyyO9dH3XA+nNMhCJamknM6
 YoyamRHoF2550PELYbgo93SIj/8VCkMIMzAsLfL2E0eDSmtlseFlaIpImKk6A58KODSy
 rPFg==
X-Gm-Message-State: APjAAAVsB/+ndks6BplrpeiIiDzA/kDp0Ap3koiXrj27Uyilzlm45vfL
 c02twzBr8qUe/QhRiGLdzrvcJN/7CrGTSTlmgBWcTWqDc1o=
X-Google-Smtp-Source: APXvYqyIjzC7x+/umgU8PjuXTGKwEe+VKUQKP5mW3YX/3Tf/WROmCH/LcBakWXQwrFYXpy4w3Rvt0fLMFMO1sgDa6V8=
X-Received: by 2002:a9d:4ef:: with SMTP id 102mr3993628otm.302.1557430626420; 
 Thu, 09 May 2019 12:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=qZOxWDH8eDqv6JYbkvgk10mR1K_REgnE-DkssLWD=iVg@mail.gmail.com>
In-Reply-To: <CALLMt=qZOxWDH8eDqv6JYbkvgk10mR1K_REgnE-DkssLWD=iVg@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 9 May 2019 14:36:50 -0500
Message-ID: <CALLMt=owcPLNawV0y7UBtp7xEG10ef2115XVO3C16kJRX0DfSg@mail.gmail.com>
Subject: Re: CI to stop testing meta-* layers not in tested machine
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I'd like to revisit this topic. It looks like the meta-* layers I
would remove from
meta-CI are still the same as below. We've added the
meta-facebook/meta-tiogapass
since my last email to CI so that will be a meta layer (meta-facebook)
we continue
to test.

Please let me know if you have any questions or concerns.

Thanks,
Andrew

On Thu, Mar 14, 2019 at 8:38 AM Andrew Geissler <geissonator@gmail.com> wrote:
>
> I took an action item from last weeks Infrastructure Workgroup.
>
> The point was we're wasting CI resources by testing meta-*
> commits that are not actually tested by any of the machines in the
> CI job. We're also falsely marking those commits as Verified because
> if they are not in any of the systems under test, they're not being
> tested at all.
>
> The systems currently run as a part of the meta-* CI jobs are here:
> https://openpower.xyz/view/CI/job/run-meta-ci/
>
> Some quick grepping indicates the following meta-* repos are not
> being tested:
>
> meta-arm
> meta-evb
> meta-google
> meta-hxt
> meta-inspur
> meta-intel
> meta-inventec
> meta-mellanox
> meta-nuvoton
> meta-portwell
> meta-qualcomm
> meta-quanta
> meta-raspberrypi
> meta-security
> meta-x86
> meta-xilinx
>
> This would mean the maintainers of the above repos would need to +1
> Verify the changes to these layers before merging.
>
> Are there any advantages to running CI against meta-* layers that
> are not in a machine being built? Are there other machines we can
> add to CI that would cover some of the meta layers above? The
> general criteria for getting a machine added to CI is that it's actively
> being developed and supported. We also need to balance our
> CI compute resources so the overall goal (in my mind) would be
> to pick the machines that cover the most meta layers.
>
> Andrew
