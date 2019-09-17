Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FBCB57EB
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 00:17:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XyCW03VTzF3wd
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 08:17:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XyBp4q2hzF1dq
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 08:16:49 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Sep 2019 15:16:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,518,1559545200"; d="scan'208";a="198839658"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga002.jf.intel.com with ESMTP; 17 Sep 2019 15:16:46 -0700
Subject: Re: Updating BMC GUI Front End Framework
To: Joseph Reynolds <jrey@linux.ibm.com>,
 Derick Montague <Derick.Montague@ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <OF4FF7F8E2.9E3777F1-ON0025846D.004E7B10-0025846D.0051A226@notes.na.collabserv.com>
 <f81aec54-b597-c953-25da-f4f94307316d@linux.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <787d34c7-87a5-8dfa-ab34-48f6a7f14c99@intel.com>
Date: Tue, 17 Sep 2019 15:16:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f81aec54-b597-c953-25da-f4f94307316d@linux.ibm.com>
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

On 9/7/19 2:52 PM, Joseph Reynolds wrote:
> - Community support, especially for security fixes.

In terms of the webui, the "UI" itself is executing in the browser
context, and a majority of the webui "security" is a contract between
bmcweb and the browser, which has next to nothing to do with the
javascript itself.

If you search AngularJs in the CVE database, there's nothing against
angularjs itself, only particular instances of AngularJS applications
with bad containers, not the framework itself.
https://cve.mitre.org/cgi-bin/cvekey.cgi?keyword=angularjs

We do need to make sure that whatever framework we move to supports the
content-security-policy headers we have in place, but most of that is
just appropriate configuration of the framework, and sticking to some
rules when developing, rather than a framework choice itself.
