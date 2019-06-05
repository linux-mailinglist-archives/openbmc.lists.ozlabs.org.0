Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E14F35D37
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 14:49:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JpXL66dszDqXl
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 22:49:38 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JpWW34dLzDqLl
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2019 22:48:55 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 5 Jun 2019 08:49:35 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Kun Yi <kunyi@google.com>
Subject: Re: Platform telemetry and health monitoring
Message-ID: <20190605124935.ywwwoj26fk46e6qu@thinkpad.dyn.fuzziesquirrel.com>
References: <BL0PR2101MB0932AE0C63ADC3CBDAE0CF16C8060@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <4d082cf8-c99c-22ac-9a60-85f70abb8bd6@linux.vnet.ibm.com>
 <CAGMNF6W+W1VPnqa3J1Y_wqc=BcnkBCi4-h9rG4tjUUrCk3zR8g@mail.gmail.com>
 <CALXe31mBvxQTaUkuFJsMozBYLiVTur18pMsTUfHY2t02Xp34wg@mail.gmail.com>
 <CAGMNF6XSD2U-qAe5ibotCkYW-U21vV+tL5-rJwvjPUvWwHA1hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAGMNF6XSD2U-qAe5ibotCkYW-U21vV+tL5-rJwvjPUvWwHA1hw@mail.gmail.com>
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
Cc: srinivas k <srinuklge@gmail.com>, Neeraj Ladkani <neladk@microsoft.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 04, 2019 at 12:35:05PM -0700, Kun Yi wrote:
>FYI: Srinivas, Neeraj, and I are finalizing a time slot for the kick off
>meeting. We are thinking about a bi-weekly discussion.
>
>Also, I'm drafting a version of BMC metrics collection daemon. The first
>draft is up on https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22257,
>which we probably will go over during the meeting.

I just wanted to point out the collectd project:  https://collectd.org/

I'm not sure if it is suitable or not but it seems like a pretty close 
match to what you are trying to do and it would be a lot of code you 
don't have to write.

Just something to consider.

thx - brad
