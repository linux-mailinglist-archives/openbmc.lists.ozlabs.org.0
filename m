Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50035218F56
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 19:57:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B26Sn2KWMzDqWQ
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 03:56:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B26Rm0wsLzDqVv
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jul 2020 03:56:02 +1000 (AEST)
IronPort-SDR: /WKnJE0hjE3LdAXEbKtfxpm8vLme2s+91RMD5Ncgs3bzw2KGgbAYRpKNYGseDchjDWFiihXjS/
 aeYFYsN7xIfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="146950926"
X-IronPort-AV: E=Sophos;i="5.75,328,1589266800"; d="scan'208";a="146950926"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 10:55:59 -0700
IronPort-SDR: jE0OXbVyf+N8nYiKM+fLaYTKY+cfMM1b689nA2R5B46vicWfO9dCFJsvRb7Bm/eeCI5gdB1Uv0
 vsGZV7UaOeDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,328,1589266800"; d="scan'208";a="315951010"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.212.225.125])
 ([10.212.225.125])
 by fmsmga002.fm.intel.com with ESMTP; 08 Jul 2020 10:55:58 -0700
Subject: Re: Feedback on Current OpenBMC and Proposing Some Improvements ----
 "Improvements" Ideas
To: Alex Qiu <xqiu@google.com>, Ed Tanous <ed@tanous.net>
References: <CAA_a9xKn77KSnwPq2pEq36JGtfWctaBXOA_4vXtP+=JGszaPkg@mail.gmail.com>
 <CACWQX82=MuAavxCqOerxi-Sdywh0xatb-f+1YzGyVSg74oNGqA@mail.gmail.com>
 <CAA_a9xLUkr5rR5Q8YATphtmWUBEE6V=6N4=k74v8hr8PePMMAQ@mail.gmail.com>
 <CACWQX80fbSwvmyNX1d=kfZEcsS30k1ziN8JtA9LtwFfkNC9ciw@mail.gmail.com>
 <CAA_a9x+7DLrwoN9YmjZneghnGaZHAqM9kzzPo2RThH=GgSFw6w@mail.gmail.com>
 <CACWQX83XycCWC+oXXea8z6vB3Vm61_C=niUXyGXA9NO89Zwf-A@mail.gmail.com>
 <CAA_a9x+h61N1j3_OPvXeb7uCH+gcouy=r7_y8uSt3+XFh38ddA@mail.gmail.com>
 <CACWQX83baDkPtr6CxEUvBCQQF2YdOkfQDxc03c8YVpqX5qcpfQ@mail.gmail.com>
 <CAA_a9x+6OfxGP+Sd6hYeBo3u1yEm1Z=OeXbk5+EOkcik9KyGdg@mail.gmail.com>
 <CACWQX83treqBh2Xh6ycyK=3eO3HbGmZuPyqFPTEXt1dH8QheFA@mail.gmail.com>
 <CAA_a9xLuCPRGawer58S-XUMo_2A27hLYsn=5_0LE4BUvqSLmtg@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <17e2960e-eecd-eca8-4c70-ecfdec9e66f5@linux.intel.com>
Date: Wed, 8 Jul 2020 10:55:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAA_a9xLuCPRGawer58S-XUMo_2A27hLYsn=5_0LE4BUvqSLmtg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 Kais Belgaied <belgaied@google.com>, Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ofer Yehielli <ofery@google.com>,
 Josh Lehan <krellan@google.com>, Richard Hanley <rhanley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/1/2020 10:06 AM, Alex Qiu wrote:
>>> For the parser, I'm referring to the function templateCharReplace() in
>>> https://github.com/openbmc/entity-manager/blob/master/src/Utils.cpp#L154.
>>> We found it unintuitive that it does not support parenthesis and does
>>> not follow arithmetic order of operations. If we try to improve it to
>>> support parenthesis and arithmetic order of operations, it will break
>>> compatibility if we don't watch it carefully.

A real parser would be a great addition, at the time we had no idea all 
of the different replacement functions we would be adding.

>> Yes, it's not a real parser, but if you look at the commit for the
>> problem it was fixing (massively duplicated config files for power
>> supplies because of minor changes) then it starts to make more sense
>> that what's there is better than what came before.  If it's important
>> to you, then put together a patch to add a real parser?  Remember that
>> the relevant config files are checked into that repo, so you can
>> actually dump every single config statement and flush it through your
>> parser to test that it gives the same result, and in the cases it
>> doesn't, add parenthesis where required to get the same result.  I
>> would really only expect the quad mode power supply files to even be
>> effected, and I believe (based on how their expression is parsed) they
>> won't be.
> For the concern of compatibility, we worry that other companies are
> also using these features downstream. FYI, we are heavily relying on
> it right now, even though we find out it's not following arithmetic
> order of operations.

I think that is outside of the projects hands, and should influence 
others to upstream their configurations so that they get all necessary 
changes/support when new features are added.
