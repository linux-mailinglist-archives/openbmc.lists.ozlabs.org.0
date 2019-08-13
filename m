Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 827398C257
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 22:53:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467Q115C7XzDql5
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 06:53:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467Q0S5tJ7zDqVL
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 06:53:12 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 13:53:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,382,1559545200"; d="scan'208";a="183989927"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Aug 2019 13:53:10 -0700
Subject: Re: OpenBMC Solution To CVE issues
To: openbmc@lists.ozlabs.org
References: <d739c79fc78643c8aa6da29522290874@lenovo.com>
 <2841ed2f-ef3d-7cbb-3afb-c8c657382455@linux.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <08c204c5-818b-f50c-9db1-48bd6e4f98b8@intel.com>
Date: Tue, 13 Aug 2019 13:53:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2841ed2f-ef3d-7cbb-3afb-c8c657382455@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 8/13/19 7:46 AM, Joseph Reynolds wrote:
>>
> The problem: BZ2 decompress - affects bzip2 through 1.0.6
> Impact: we are impacted, we are at bzip2 1.0.6
> How to exploit?  Do any OpenBMC interfaces use BZ2 compression? Image
> upload?  Web interfaces?  If so, we may be impacted.
The web doesn't implement BZ2 compression, only GZIP.

> 
>> CVE-2018-20843
>>
> The problem: affects Expat XML before 2.2.7
> Impact: Not applicable, OpenBMC does not use XML
Do we even use libexpat anywhere?  We use XML in several places, but I
can't think of anywhere we use Expat.

> 
>> CVE-2019-9169
>>
> The problem: glibc/libc6 regexec proceed_next_node
> Impact: we are impacted, we are on glibc 2.29
> How to exploit?  Do any OpenBMC interfaces parse regular expressions? 
> If so we may be impacted?  If not, this will be hared to exploit.
I just audited all uses of std::regex in bmcweb.  They are all using
compile-time strings for generating their expression.  Also, all uses
are post-authentication (on purpose) so even if there was an exploit, it
would be a relatively low CVE score, as it would require valid
credentials to exploit.

> 
>> CVE-2018-20750
>>
> The problem: libvncserver/rfbserver.c, affects LibVNC through 0.9.12
> Impact: we may be impacted, we are on 0.9.12
> Does our KVM use vncserver?
Yes.  We will just need to upgrade the package version when the new
release is available.

> 
>> CVE-2019-13404
>>
> The problem: Python installer, applies to Windows
> Impact: not applicable, note that OpenBMC removed Python from the image
> 
>> Thank your great support in advance!
>>
>> Thanks
>>
> 
