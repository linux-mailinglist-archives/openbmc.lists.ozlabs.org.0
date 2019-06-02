Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EE232490
	for <lists+openbmc@lfdr.de>; Sun,  2 Jun 2019 20:26:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45H67r2zvRzDqP6
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 04:26:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45H67J68mBzDqN5
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2019 04:25:31 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jun 2019 11:25:28 -0700
X-ExtLoop1: 1
Received: from rakesh3x-mobl1.gar.corp.intel.com (HELO [10.252.69.175])
 ([10.252.69.175])
 by orsmga004.jf.intel.com with ESMTP; 02 Jun 2019 11:25:26 -0700
Subject: Re: Questions about changing default username or password
To: =?UTF-8?B?U2ltb24gWmh1KOacseiLsea+jSk=?= <zhuysh@inspur.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <FF401BD5-4C8A-4F01-8B6B-3138E4A458DB@inspur.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <680f0ea6-c986-42f2-1185-dcd62c7db1ba@linux.intel.com>
Date: Sun, 2 Jun 2019 23:55:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <FF401BD5-4C8A-4F01-8B6B-3138E4A458DB@inspur.com>
Content-Type: text/plain; charset=gbk; format=flowed
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


For #1 --> you can inherit extrausers class and override the users 
accordingly, and the password

For #2 --> There is no direct way to update /etc/ipmi_pass, but once 
this image is flashed, login to bmc serial console, then try to execute 
passwd and update the password to the desired one (during this scenario, 
the new password is stored back in /etc/ipmi_pass). Now copy this 
/etc/ipmi_pass from your BMC to your development environment, and 
override it using bbappend.

Note: Our ultimate goal is to get rid of the default user name and 
password from the system (to whichever project it is feasible for 
security reason -- 
https://github.com/openbmc/docs/blob/master/user_management.md#deployment---out-of-factory) 


Let me know if you need any further clarifications

Regards,

Richard


On 5/31/2019 5:56 AM, Simon Zhu(ÖìÓ¢äø) wrote:
> Hello ,
>
> 	I want to change default username and password in local.conf.sample.
>
> 	But caused an invalid username error.
>
> 	I fixed it in the following way in /openbmc/openbmc/meta/recipes-extended/shadow/shadow.inc:
> 	I moved the patch shadow-relaxed-usernames.patch from SRC_URI_append_class-target to SRC_URI.
> 	
>
> 	And If I changed the default username or password, I failed to use IPMI through lanplus interface because of authentication failure.
> 	I need to generate my own ipmi_pass and install it to /etc/ipmi_pass¡£
>
> 	Do these two issues need to be fixed?
>
> Best regards,
>
> Simon
