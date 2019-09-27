Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F67EC0CC4
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 22:43:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46g3fD0D6BzDqxg
	for <lists+openbmc@lfdr.de>; Sat, 28 Sep 2019 06:43:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46g3dQ6VfxzDqxg
 for <openbmc@lists.ozlabs.org>; Sat, 28 Sep 2019 06:42:34 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id C24EB13984F;
 Fri, 27 Sep 2019 16:42:31 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: witherspoon-pfault-analysis repository rename to phosphor-power
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAGMNF6WsX90bDc5bLPO+f1y8MVwsEegSciyo6kiySA6fFT43gQ@mail.gmail.com>
Date: Fri, 27 Sep 2019 16:42:31 -0400
Content-Transfer-Encoding: 7bit
Message-Id: <8E8B90AC-C3C9-47B4-A083-4D43B42AA599@fuzziesquirrel.com>
References: <E413464F-B8BD-469C-8B58-432C25DEE77C@fuzziesquirrel.com>
 <CAARXrt=SpBeZ+kcg5zjTZ2mHr7Q1YCbNLPJrqaqsBwbv8-AfDA@mail.gmail.com>
 <22c0f2b4-1411-5690-3d19-b0a90890e642@linux.vnet.ibm.com>
 <D7110269-FC33-4C7F-85A6-5A2B26B7FD52@fuzziesquirrel.com>
 <CAGMNF6WsX90bDc5bLPO+f1y8MVwsEegSciyo6kiySA6fFT43gQ@mail.gmail.com>
To: Kun Yi <kunyi@google.com>
X-Mailer: Apple Mail (2.3445.104.11)
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
Cc: Shawn McCarney <shawnmm@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Matt Spinler <mspinler@gmail.com>,
 Brandon Wyman <bjwyman@gmail.com>, derekh@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 1:27 PM, Kun Yi <kunyi@google.com> wrote:

> Just found out this thread.. I'm starting to explore extending the
> capabilities. In particular, I'm looking at VRMs which can hold device
> specific NV fault logs and export them over D-Bus, and then realize
> that if the NV faults can be exported to debugfs, the design would be
> similar to what witherspoon-pfault-analysis is doing.
>
> Brad, thanks for kicking off the effort. Was the transition already  
> in-progress?

I finally got around to this just today.  Glad to hear about your  
interest!  There are a number of design documents in various states of  
merged and/or in-reivew in the power area, If you look at those it might  
help get in sync with the work that is happening out there.

-brad
