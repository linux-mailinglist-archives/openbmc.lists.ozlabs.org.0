Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D0D2A9AAC
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 18:20:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSRwR5HNNzDrNH
	for <lists+openbmc@lfdr.de>; Sat,  7 Nov 2020 04:20:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSRvW6lkSzDqpB
 for <openbmc@lists.ozlabs.org>; Sat,  7 Nov 2020 04:19:12 +1100 (AEDT)
IronPort-SDR: zsu1VoBg4cEJT4IjoobvAFWlO62WiwseITk+/uI1WnU/jnXv7NfMnk+tNvDPogUBk7RM1wU9lV
 ceyTAsawUovg==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="187501439"
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; d="scan'208";a="187501439"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 09:19:09 -0800
IronPort-SDR: 0q+kX+Cwz+ah6Eobs5Fn1FOfnDzLIhoyavjaA/Y113J7ges+84gC1PbbtRhthdWZGQQ7ea4cDJ
 p7aoFfT8TfLQ==
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; d="scan'208";a="529869881"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 09:19:08 -0800
Date: Fri, 6 Nov 2020 09:19:07 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Secure boot/signed images and GPL code
Message-ID: <20201106171745.GA25199@mauery.jf.intel.com>
References: <CAM=TmwWinuWjpNr+NeTXTmPv0wUCCzg5BUKhhR=Rp=mfmma_6Q@mail.gmail.com>
 <20201103205600.GA38269@patrickw3-mbp.lan.stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201103205600.GA38269@patrickw3-mbp.lan.stwcx.xyz>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: cjengel@us.ibm.com, openbmc@lists.ozlabs.org,
 Deepak Kodihalli <deepak.kodihalli.83@gmail.com>, joseph-reynolds@charter.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 03-Nov-2020 02:56 PM, Patrick Williams wrote:
>
>In the doc you pointed to, I asked how key transition works, but the
>doc hasn't been updated to better describe it yet[2].  The initial
>response makes it seem like the AST2600 OTP doesn't give a whole lot of
>capabilities here, which is fairly concerning.  I know there are some
>design proposals that use a secondary device to assist with
>secureboot[3,4,5] which might better handle key transition.

You are right, the AST2600 OTP leaves something to be desired. If all 
the key regions are not initially programmed, it is possible to program 
a new key, deprecate all the old keys, and take control of the system. 
But programming all the keys prevents transferring the system from one 
owner to another (where the owner is the one providing firmware).

Storing and provisioning keys is hardest part of any crypto system. If 
we have ideas on how to make the AST2700 better, Aspeed has engineers on 
this list and would probably like to hear any great ideas.

--Vernon

