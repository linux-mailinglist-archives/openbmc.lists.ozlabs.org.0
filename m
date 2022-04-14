Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5E4500325
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 02:46:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kf1444QR6z300Q
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 10:46:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ixs7bFCJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ixs7bFCJ; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kf13g3TV2z2xBk
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2022 10:46:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649897167; x=1681433167;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e16Zz1Zjj872dLHZYCF+EQhSpwgh45uRwROO0IkBKgU=;
 b=Ixs7bFCJ0jaS3qLXol0iO0sRLeOIXkWoQ6EJF5vAywHrM8mYE207enkX
 vOZXm1KQUJMeC+CSJu2gnpF2SrEQzOMLXivQ2+FM8ex8tC1zelaTkF3Wc
 aaoEBxBGJ1NLSl7tScSOnYi1Ubw1gNCjWdEreoEb/HfmJZee2pRMIC748
 /b95xa7KucSatEPdnAhIsaNLMCwwTU0mvPTZNrolyi2VK8LplKbEt85/N
 pkTTEQQE+5vbROFvlsCMmkTY2cSDOadI1ZfCp7ly1aCxz1Aeu6shfeFM4
 FDwKx+TRGhAhSaKOrLzmKP3oX0hdeZpU9rTSeYsKTi8GgDyH7AOd9K+rR Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="325720224"
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; d="scan'208";a="325720224"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 17:45:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; d="scan'208";a="645398508"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.54.51.82])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 17:45:02 -0700
Date: Wed, 13 Apr 2022 17:44:57 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Subject: Re: IPMI Restriction Mode
Message-ID: <20220414004457.GA230974@mauery.jf.intel.com>
References: <CAA7Tbctgg9YJPTRcYCwkucajTvk-AUNeHJ9_=MD5dpvxF5D0ZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAA7Tbctgg9YJPTRcYCwkucajTvk-AUNeHJ9_=MD5dpvxF5D0ZA@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, anoo@us.ibm.com,
 Amithash Prasad <amithash@fb.com>, deepak.kodihalli.83@gmail.com,
 velumani.hcl@gmail.com, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 04-Apr-2022 12:49 PM, Kumar Thangavel wrote:
>Hi All,
>
>        IPMI Restriction mode support has been added for host machines
>which support IPMI.
>
>https://github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/host-template.yaml#L61
>
>        How IPMI restriction mode support can be added for other than host
>devices (IPMI based devices). Ex Debug card.  ?

I am not exactly sure what you are asking for here. When you say other 
devices, are you asking about restricting commands based on what channel 
they come in on?

This is possible. A filter can filter on any criteria that is available 
with the ipmi::Context object and the command. It can even extract 
command data and take action there. I only say this if you are 
interested in writing a new filter of your own.

But if you want to see a filter that is already implemented that 
restricts commands based on BMC state and incoming channel, you can look 
at the filtering done in the intel-ipmi-oem repo.

If my guess at what you meant was wrong, please clarify and I will try 
again.

--Vernon

>        Could you please provide any suggestions or any docs ?
>
>Thanks,
>Kumar.
