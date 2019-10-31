Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3C7EAD40
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 11:15:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473h5z5jh8zF5k8
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 21:15:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473h5F1WPTzF5k5
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 21:14:36 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 03:14:33 -0700
X-IronPort-AV: E=Sophos;i="5.68,250,1569308400"; d="scan'208";a="375194441"
Received: from aambroze-mobl1.ger.corp.intel.com (HELO [10.102.85.150])
 ([10.102.85.150])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 31 Oct 2019 03:14:31 -0700
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
Subject: openbmc project for telemetry
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Message-ID: <ca853ff3-6017-7e75-b66e-3116c042f38c@linux.intel.com>
Date: Thu, 31 Oct 2019 11:14:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Matuszczak,
 Piotr" <piotr.matuszczak@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Brad,

First I would like to say introduce myself as it's my first message to 
the mailing list. I'm Adrian, engineer from Intel Technology Poland. I'm 
very excited to have an opportunity to work within this group of 
professionals :)

Currently we're working with Piotr on Redfish Telemetry. Current design 
in the review 
(https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24357) seems to be 
on track to be accepted.

I would like to ask you what requirements we have to comply to have our 
own repository in openbmc project. From what I've seen in other topic - 
Apache 2.0 is preferred license. Are there any other expectations?

Should we wait until mentioned design is accepted or can we start 
working on some initial implementation right away? If so - I would love 
to have repo up and running as soon as possible.

Regards,
Adrian
