Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B46E37B5
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 18:19:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zXW12jH6zDqTZ
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 03:19:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zXVJ2n56zDqJN
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 03:18:31 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 09:18:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,225,1569308400"; d="scan'208";a="373268673"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga005.jf.intel.com with ESMTP; 24 Oct 2019 09:18:29 -0700
Subject: Re: Continuous Integration Build Failures
To: Johnathan Mantey <johnathanx.mantey@intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Andrew Geissler <geissonator@gmail.com>
References: <1b633df0-8ce7-963c-cb6b-d79ee7d24a9c@intel.com>
 <907DC60D-00EE-403D-82D0-4EFADD245A9D@fuzziesquirrel.com>
 <b7c8b873-15d8-8e16-eb5d-077bb4f5cc4f@intel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <4bff5798-6ef2-bca8-01e7-dbf0ea1c802f@linux.intel.com>
Date: Thu, 24 Oct 2019 09:18:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <b7c8b873-15d8-8e16-eb5d-077bb4f5cc4f@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/24/19 8:49 AM, Johnathan Mantey wrote:
> Brad,
> No I had not seen that doc.  That said, I worked with someone here to 
> run the CI build locally.  I got the Docker instance to perform a build 
> on the submission that instigated this email trail. The Docker instance 
> passed on my code changes.  Yet, the upstream Gerrit build does not.  
> Now I don't have logfiles on the upstream Gerrit server to find out 
> why.  I believe I've done my due diligence for preparing the code for a 
> successful build.  At the end of the day the only place that matters for 
> build success/failure is the upstream system.  As such anything that can 
> be done to improve that system is, in my opinion, a benefit to the 
> community.
> 
> My specific issue is: 
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-networkd/+/24666
> I have no idea why this is failing now that the logs have been deleted,

You can login to the Jenkins instance using your github credentials and 
re-trigger the build.


> and I can't determine a way to manually start a new build to get logs 
> without pushing meaningless commits.  I'd rather not waste reviewers 
> time having to see email messages about meaningless commits.
> 
> On 10/24/19 8:40 AM, Brad Bishop wrote:
>>> On Oct 24, 2019, at 11:16 AM, Johnathan Mantey<johnathanx.mantey@intel.com>  wrote:
>>>
>>> I would like to propose a change to how the continuous integration system works.
>>>
>>> I understand there are many builds, and there is a lot of data associated with the builds. Thus the current desire to remove the log file data in a short amount of time is a requirement. This works alright when the build succeeds. It's unhelpful when the build fails. Identifying where the build fails is impossible after approximately an hour. As an ordinary contributor I don't know how to make the CI system rebuild the source code so that the log files are available again without pushing some new change that consists of a useless piece of whitespace (or some other pointless change).  It shouldn't be necessary for the contributor to make requests for a build restart to the CI maintainers, they have their own agenda.
>> Are you referring to the bitbake CI jobs or the repository CI jobs?
>>
>>> Are the maintainers of the CI system willing to make a change that aids in debug?
>>>
>>> Suggestions:
>>> 	• Don't delete the log on build fails.
>>> 	• Delete everything but the log ascii output on build fails.
>>> 	• Email the ascii logfile for build fails
>>> 	• Email a compressed debug bundle to the submitter?
>>> 	• Allow build fails to be restarted by the submitter so the logs can be regenerated, inspected, and captured.
>>> 	• other...?
>> At first glance these are all good ideas.  Andrew how many of these can Jonathan implement himself and how many of them require access to the Jenkins instance?
> 
> -- 
> Johnathan Mantey
> Senior Software Engineer
> *azad te**chnology partners*
> Contributing to Technology Innovation since 1992
> Phone: (503) 712-6764
> Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>
> 
