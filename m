Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 953C4373F1
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 14:16:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KPlN0pcyzDqf4
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 22:16:16 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KPkh1Kr0zDqf1
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 22:15:39 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Thu, 6 Jun 2019 08:16:19 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Yang, Cheng C" <cheng.c.yang@linux.intel.com>
Subject: Re: Code review on "Add D-Bus interface for Cold Redundancy"
Message-ID: <20190606121619.ofmnherh7qz7pezq@thinkpad.dyn.fuzziesquirrel.com>
References: <d2abca17-e40e-8086-c4b1-1833bd89c1ee@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
In-Reply-To: <d2abca17-e40e-8086-c4b1-1833bd89c1ee@linux.intel.com>
Content-Transfer-Encoding: quoted-printable
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 06, 2019 at 08:48:28AM +0800, Yang, Cheng C wrote:
>Hi Bard,

Hi Yang

Please copy the list when sending email about OpenBMC.  Thanks.  I went=20
ahead and added it to CC here...I hope that is ok.

>
>=A0=A0=A0 Yuan has already reviewed https://gerrit.openbmc-project.xyz/c=
/openbmc/phosphor-dbus-interfaces/+/21532
>
>Not sure if you can help merge it or you still need more Intel=20
>engineer to review on it?

Thanks for getting some of your peers have a look.  I went ahead and=20
merged it, but in the commit message you mentioned a "cold redundancy=20
service"

That sounds like a new feature.  Thanks to you and to Intel for=20
contributing it to OpenBMC.

Do you think you could have someone submit a completed design template=20
and open a github issue?  That enables the rest of the community to know=20
what Intel is working on and when, and thus have input, possibly help,=20
and avoid duplicate work.  Does that make sense?

Thanks!

-brad
