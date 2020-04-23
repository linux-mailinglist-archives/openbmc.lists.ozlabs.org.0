Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F25F1B60FB
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 18:31:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497N9D11H9zDqRb
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 02:31:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497N271Sc5zDqS5
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 02:25:18 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Security Working Group - Wednesday April 1
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CADVsX8_Yck3vCDQGDRZXBBN744X_HSTOPeYJKy0kOuSMdQr+5w@mail.gmail.com>
Date: Thu, 23 Apr 2020 12:16:26 -0400
Content-Transfer-Encoding: 7bit
Message-Id: <FD4E21C7-4310-408E-983D-BBDFA8ECF46A@fuzziesquirrel.com>
References: <44bae429-2507-e044-2d0e-c4e110dfa700@linux.ibm.com>
 <9e9929c1-1c55-43ea-236d-b14c82aacf88@linux.vnet.ibm.com>
 <CADVsX8-r8ebFydQJgGQ=C7sTFVQmxk_vFinbRi2kkJ5skRgXcA@mail.gmail.com>
 <01100446-5312-2ab4-f2e4-7bab3a86631d@linux.vnet.ibm.com>
 <CADVsX8-2L6umOA8OE-8z3Buu=dKefPJa8KQvycJPPLX9QDz=nQ@mail.gmail.com>
 <CADVsX89dY1YcKmsBvsymb2dGu5_tXQNzmDCgrmf38b0_0T_y4Q@mail.gmail.com>
 <089D9714-9BE3-468C-A29D-5DEF9FB94191@fuzziesquirrel.com>
 <CADVsX8_Yck3vCDQGDRZXBBN744X_HSTOPeYJKy0kOuSMdQr+5w@mail.gmail.com>
To: Anton Kachalov <rnouse@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Manojeda@in.ibm.com,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 8:10 AM, Anton Kachalov <rnouse@google.com> wrote:

> Hi, Brad.
>
> AppArmor is upstreamed. I just enabled apparmor config for aspeed kernel.
>
> Furthermore, Ubuntu's kernel has additional not upstreamed patches for  
> AppArmor. E.g. patch from:
> https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/linux/5.4.0-26.30/linux_5.4.0-26.30.diff.gz
>
> is adding new routines like:
>  -- apparmor_unix_stream_connect to check perms before making unix domain connection
>  -- apparmor_unix_may_send to check perms before conn or sending unix dgrams
>
> and various new hooks for LSM.
>
> Without those patches we wouldn't have all the benefits for DBus  
> hardening. Plus, the dbus-broker doesn't support all that stuff and needs  
> to have features to be ported from Freedesktop/DBus.

Ok.  I just wanted to suggest that when we weigh the pros and cons of the  
different LSMs, that upstream support is taken into consideration.  Thanks  
for the detailed reply!

-brad
