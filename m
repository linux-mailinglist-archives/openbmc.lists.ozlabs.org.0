Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2841BE4FC
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 19:18:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49C4wv4Wr5zDr9y
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 03:18:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=aleksandr.v.tereschenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C4w60vkHzDr8R
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 03:17:55 +1000 (AEST)
IronPort-SDR: 7fY9IEvu99Bolfg2xBhIbZjM5zMxunEv3ci/Jf6buB89tRauWf6zlxooMOmlxJmzf03hTi6OIe
 pPo5hMx9np1w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 10:17:52 -0700
IronPort-SDR: ufkYCa3LzYCGkSzq5FGO0Kz5E0FZsQJ1sCPJWhaFr5y8G4Ut+De0B57hP/S3PH/hEIevzC1F6k
 K0Nk34uRHDoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; d="scan'208";a="459650376"
Received: from avteresc-mobl1.ger.corp.intel.com (HELO [10.213.20.47])
 ([10.213.20.47])
 by fmsmga006.fm.intel.com with ESMTP; 29 Apr 2020 10:17:51 -0700
Subject: Re: OWASP dependency checker
To: openbmc@lists.ozlabs.org
References: <ea8363a6-8f24-192b-a3af-68cb90fd88f1@linux.ibm.com>
From: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Message-ID: <02da4ec8-a65d-00fa-2dd0-2a7f379ba586@linux.intel.com>
Date: Wed, 29 Apr 2020 19:17:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ea8363a6-8f24-192b-a3af-68cb90fd88f1@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

On 28-Apr-20 17:12, Joseph Reynolds wrote:
> Does anyone have experience with OWASP's Dependency Checker?  Is using 
> something like this worthwhile to improve web application security?

I don't have any first-hand experience, the idea is interesting, but 
looking at the project's docs and issues list, looks like it doesn't 
really support C/C++ [1], so probably it's not going to be useful for 
OpenBMC?

In OpenBMC's project context I think it also overlaps somewhat with that 
cve-check Yocto class we discussed a couple of times on Security WG 
meetings, though if it supported C/C++, I think it could still be useful.

[1] https://github.com/jeremylong/DependencyCheck/issues/281

