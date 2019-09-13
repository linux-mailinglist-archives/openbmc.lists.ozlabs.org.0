Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8457AB267A
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 22:10:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VRbF4Ky8zF5XW
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 06:10:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VRZT3bjNzF4Sj
 for <openbmc@lists.ozlabs.org>; Sat, 14 Sep 2019 06:10:07 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 13:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="197667250"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga002.jf.intel.com with ESMTP; 13 Sep 2019 13:10:05 -0700
Subject: Re: Rant regarding code review issues
To: Emily Shaffer <emilyshaffer@google.com>
References: <EB0500AF-9574-4007-BE55-B6E7384D027C@fb.com>
 <f5205bbe-7320-67ee-2b2d-91c5cc185b02@intel.com>
 <CAJoAoZm2apzNtkLNHULG1pkUL4U27+DoeVeR9-fgDPyjrBBakw@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <50cbafb6-6043-40fa-ef2c-2289906afecd@intel.com>
Date: Fri, 13 Sep 2019 13:10:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJoAoZm2apzNtkLNHULG1pkUL4U27+DoeVeR9-fgDPyjrBBakw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/13/19 1:02 PM, Emily Shaffer wrote:
> I'll point out that as I understand it, 80c line limit is an
> accessibility issue for tools like braille readers or for users who
> need to use a larger font size than you may expect.

Neat.  I never knew that was a reasoning for 80 character widths.

I will probably continue to complain in my own head every time I need to
go to a few nested scopes and my line gets wrapped in an inconvenient
place, but to a lesser extent than before now that I know there's a good
reason for it :)

-Ed
