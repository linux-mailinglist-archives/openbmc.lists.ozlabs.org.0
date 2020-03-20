Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 134F018D6BD
	for <lists+openbmc@lfdr.de>; Fri, 20 Mar 2020 19:22:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kXDh3ZFRzF0YD
	for <lists+openbmc@lfdr.de>; Sat, 21 Mar 2020 05:22:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=wiktor.golgowski@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kXD35xF3zF0PJ
 for <openbmc@lists.ozlabs.org>; Sat, 21 Mar 2020 05:21:32 +1100 (AEDT)
IronPort-SDR: /5oPNlxY3mKHvlPtRkDaHTTKm7BeR5YS1p+PFuhYurWKLAL+mQc1UfQ1qs3qf64RxT1bKF3DOJ
 r+ol+ufIrb/A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 11:21:29 -0700
IronPort-SDR: aAZ2vFZSEjXEHx/wzQS7Uq2wtbjTEtIpnuNLNObZYXvbEHROPR7PnzOL4nxGgtEuKXrtTpW2ef
 H/MMnvb+4EcA==
X-IronPort-AV: E=Sophos;i="5.72,285,1580803200"; d="scan'208";a="418800328"
Received: from gklab-127-200.igk.intel.com (HELO [10.91.127.200])
 ([10.91.127.200])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 11:21:28 -0700
From: =?UTF-8?Q?Wiktor_Go=c5=82gowski?= <wiktor.golgowski@linux.intel.com>
Subject: MCTP control messages handling in libmctp
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <073c959d-d554-4cc8-21f4-c94777a42313@linux.intel.com>
Date: Fri, 20 Mar 2020 19:21:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
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
Cc: Andrew Jeffery <andrew@aj.id.au>, richard.marian.thomaiyar@linux.intel.com,
 sumanth.bhat@linux.intel.com, iwona.winiarska@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi all, 



I am currently working on a base implementation for handling control

command requests in libmctp (relevant change here: [1]).  As I am not

sure which solution would be the best here, I would like to put a

quick summary of the different approaches that could be used for

further discussion on Monday PMCI WG meeting:



1. External handling (as Andrew proposes)

All control messages are handled in the layer calling into

libmctp. The daemon is in control of how messages are handled.



2. Separate handlers (what [1] introduces)

There are separate callbacks for regular messages, control messages and

transport-specific control messages. The main reason for this behavior

is that I expect transport-specific commands to be executed in the

context of the specific binding (serial, VDM, SMBus). I also hope that

the daemon could be at least partially binding-agnostic.



3. Handling is split between the caller and the library

We could identify control command requests that libmctp (or its

specific binding) is able to fulfill independently from the daemon

(for example Get EID) and leave the implementation of the rest to the

actual caller.



I hope we could find the best solution to implement. Looking forward

to the Monday meeting.



Regards-

Wiktor





[1] https://gerrit.openbmc-project.xyz/c/openbmc/libmctp/+/30330


