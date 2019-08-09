Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8FB87E5A
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 17:43:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464qKG5V6BzDqby
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 01:43:46 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 464qJV62LtzDqby
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 01:43:05 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 08:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; d="scan'208";a="182936831"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2019 08:43:02 -0700
Subject: Re: Continuing discussion on Handling persistent files
 (/etc/group)during BMC updates
To: "Alexander A. Filippov" <a.filippov@yadro.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <96f5e075-b324-90da-f004-703ab6275374@gmail.com>
 <20190809073304.GA327@bbwork.lan>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <20dcb81d-9048-508c-d890-757b1d78db14@intel.com>
Date: Fri, 9 Aug 2019 08:43:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809073304.GA327@bbwork.lan>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/9/19 12:33 AM, Alexander A. Filippov wrote:
> On Fri, Aug 09, 2019 at 12:19:32PM +0530, Raviteja Bailapudi wrote:
>> Hi all,
>>
>> We are looking for thoughts and perspectives on the way the persistent files
>> are managed across BMC code updates.
>>
>> The problem is regarding the code update where, as a part of code update we
>> don't touch any of the persistent files like /etc/group or /etc/passwor
>>
>> what if the new BMC image has an application which requires some changes to
>> be present in these persistent files ?
>>
>> For Example:
>> Let's say the BMC image which is used for code update has a new
>> feature(ex:avahi) and it requires avahi user and
>> the group to be present in the /etc/passwd and /etc/group to even kick start
>> it's daemon.

One way that I've seen work quite well in other production firmwares is
to treat it like you would a database schema, and simply generate the
"new" files via patching the existing file in a script that executes on
first new firmware startup.  In general, when you're messing with these
files, you're either appending a new line, which would be done with a
script like:
if grep -Fxqv "avahi:x:41:" /etc/group
then
cat "avahi:x:41:" >> /etc/group
fi

or you're modifying an existing line, which would be done with a sed
replace.

In the above, we're checking to see if the file has been changed
appropriately before actually appending the line, to make sure that the
update only gets applied once.  I've seen other cases where it makes
more sense to simply leave a separate marker file, with an arbitrary
revision number so that the BMC knows which updates it needs to apply.
It really all depends on what you're attempting to add and whether or
not it could conflict.

If you're careful about how you craft the matching regexes, and keep the
scripts around forever, you can generally transition files like that
from one firmware update to another without any ill effects.

The only case where it doesn't work is in the downgrade case, which gets
really tricky really fast, and why most vendors give a "your mileage may
vary" warning on downgrades, and recommend defaulting the configuration
after a downgrade.
