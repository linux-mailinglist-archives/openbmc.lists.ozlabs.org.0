Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 939A2CC1DC
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2019 19:39:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46lHFD2mp9zDqfy
	for <lists+openbmc@lfdr.de>; Sat,  5 Oct 2019 03:39:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="sJbPdvI6"; 
 dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46lHDN1cBBzDqdw
 for <openbmc@lists.ozlabs.org>; Sat,  5 Oct 2019 03:38:57 +1000 (AEST)
Received: by mail-io1-xd2d.google.com with SMTP id w12so15218682iol.11
 for <openbmc@lists.ozlabs.org>; Fri, 04 Oct 2019 10:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CAhhFvMSG4mntRzimhL+EH21O4d7Yj3cRb3eZOBvG+U=;
 b=sJbPdvI6ffP1h0Nhup011pl4WzB5pzU3CMbE4cI88rSA4xFB9GJZp5Dn7KNomMk3fF
 fnZDFaHeOtJ19geBYinNsIW/LcKkaCMLC2BPW13EObYCE+QsDbwWIU2eDTxUHAUgCbb8
 yTRTv2HDBWe1SoC0H/4taujqvqcVHdINDEQlovSoFmVfw7h8LeQP91QxN9OlIB1dGKSd
 g+EZh0MwXLn5Z7PB8aIOF/+WsULvbQ09TSj2qIGO16IHeRMIGIoPUGXuKPvczYyKLYj0
 SiKi4PjAYCSz2GJ7SCxInUKT1qL89c6LUsbt4cNAmxpA+WMQ3/BeUv4n3YSyoO1UvZQW
 qhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CAhhFvMSG4mntRzimhL+EH21O4d7Yj3cRb3eZOBvG+U=;
 b=l9w8qL6Lhg2qOnISdXwwgbbQdV5wJERxyu34HiUVcSLPpV9BhZON8UH/adcK8JVK5D
 BgV7vAqgfkbhvXJ5fG+YD6r0LeAXIWxn/ku5Fkjz+aVf1uF95jUhKvN+9CZsk+79DVvd
 WCDAVFbRR5kE0JUTKzGqn0XDfdRmklwR0bWT6RWpd9sdqA6VmoIEFjD3hh70/u8LozKC
 fcpriREXlsnBY7PqxISoDLPeq+R1sP85SxbIRbgVYqrI6iAm+GRH5KBRKTUZD7VRv7hs
 lh76vWuxquaWJBAYIVRTPXf5s/0KAo02SMjfc1FdBVKwoEcyvnLoOIqiciI/e4niA0X/
 uK9g==
X-Gm-Message-State: APjAAAXZAkLuuJyVScpEj30td/XIlT37gHTaJ4x2VdT5/KWGxEcD04PS
 bSm7mw7nh7lnd/EwUs0LMEGPVCjPTY4skEmTETieoQ==
X-Google-Smtp-Source: APXvYqzDQD5czeacbVpBFXE6LjyeJig3G7g0n0Q49TmXG28LYvYTPm3p8xy7q2U43f9SuGNpOxCk2qAs+tc7dWnkSYs=
X-Received: by 2002:a6b:680f:: with SMTP id d15mr2065545ioc.52.1570210733077; 
 Fri, 04 Oct 2019 10:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzdWjU+9=QDDNinY4sOwfeOQOryF1CLf=xk0p1v3Oimiw@mail.gmail.com>
 <6024ee4f-4d3d-9f39-2b8f-197f9f8e35c7@intel.com>
In-Reply-To: <6024ee4f-4d3d-9f39-2b8f-197f9f8e35c7@intel.com>
From: Kun Yi <kunyi@google.com>
Date: Fri, 4 Oct 2019 10:38:26 -0700
Message-ID: <CAGMNF6Vuerf_rPtV3Xt7kggjAMKOANvp3wvFH7R=j4PUBnbchA@mail.gmail.com>
Subject: Re: Testing userspace code
To: Ed Tanous <ed.tanous@intel.com>
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

+1 for the idea of a D-bus 'takeover' daemon.
Especially since we can now build error injection, logging, etc. into
this daemon for the sake of testing.

On Fri, Oct 4, 2019 at 10:13 AM Ed Tanous <ed.tanous@intel.com> wrote:
>
> On 10/4/19 8:44 AM, Patrick Venture wrote:
> > The idea, one daemon runs and owns all the dbus objects expected, and
> > ipmid/bmcweb etc can be tested by talking to that daemon.
>
>
> I talked with a couple people about something like this as OSFC a
> little.  Having a DBus analog would be a great step toward testing
> things offline and having more confidence that we haven't broken a
> system type, even if we don't necessarily have the system itself to test on.
>
> +1 would use the hell out of something like this
>


-- 
Regards,
Kun
