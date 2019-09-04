Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 598D1A85D1
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 16:59:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Nn5n45bnzDqNt
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 00:59:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (helo) smtp.helo=mga12.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=aleksandr.v.tereschenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nn4V3MRfzDqsy
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 00:57:56 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 07:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,467,1559545200"; d="scan'208";a="207503828"
Received: from avteresc-mobl1.ger.corp.intel.com (HELO [172.22.250.100])
 ([172.22.250.100])
 by fmsmga004.fm.intel.com with ESMTP; 04 Sep 2019 07:57:53 -0700
Subject: Re: BMCWeb changes login password
To: openbmc@lists.ozlabs.org
References: <959CAFA1E282D14FB901BE9A7BF4E7724E51562F@shsmsx102.ccr.corp.intel.com>
 <c73c4823-7fd1-0762-72d1-da1920897667@linux.ibm.com>
From: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Message-ID: <3160626c-d162-c7bb-1059-f8215dd69717@linux.intel.com>
Date: Wed, 4 Sep 2019 16:57:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c73c4823-7fd1-0762-72d1-da1920897667@linux.ibm.com>
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

On 04-Sep-19 04:06, Joseph Reynolds wrote:
> 2. The scenario where we may want to ask for the old password is the 
> "password change dialog".  This dialog is accessed when the user signs 
> into the Web App login page and the web app informs the user that 
> their password is expired and must be changed before they can access 
> the BMC  The dialog asks for their new password (twice) ... and does 
> it also ask for the old password? <== That's the question.

FWIW, by the time the BMC is able to determine that user's password is 
expired (and make sure that's indeed that user who's accessing the web 
app), the user must have entered their password, so asking it once again 
sounds like surplus step in this particular scenario.

regards,
Alexander

