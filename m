Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C83211B3
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 03:21:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454r8n1GhNzDqNT
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 11:21:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454r8J12D7zDqNT
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 11:20:46 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 May 2019 18:20:43 -0700
X-ExtLoop1: 1
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.197.31])
 by fmsmga005.fm.intel.com with ESMTP; 16 May 2019 18:20:42 -0700
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'Andrew Jeffery'" <andrew@aj.id.au>,
 "Yong Li" <yong.b.li@linux.intel.com>,
 "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>
References: <000001d50af1$2e9f3700$8bdda500$@linux.intel.com>
 <acff464f-4e77-4b69-8d3a-bd03d1df37f3@www.fastmail.com>
In-Reply-To: <acff464f-4e77-4b69-8d3a-bd03d1df37f3@www.fastmail.com>
Subject: RE: Get the AST2500 SCUE0/E4 value using kernel device driver? 
Date: Fri, 17 May 2019 09:20:42 +0800
Message-ID: <001401d50c4e$bf32d660$3d988320$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdUK77AqM7Q1f1I/Rmq5dl/vVs/hUQBCr5IAABTjjyA=
Content-Language: en-us
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTIxN2I4ZjYtNDhlZC00YzllLWE3ZTEtY2I5ODBlZWU2NjYwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoib2E2cW9KalRiaXNWeVZhUXExbEZpdm1cL0hhaWNiek51ZExLaEdHdkRsWjUyMmlpUUViM000ZkdKQzRSK3R1QmUifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
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

HI Andrew,

Thanks for the reply.

I want to get the time from the very beginning of the AC power on, including
the time spent on u-boot. 

My understanding is that the clock_gettime only return the Linux up time, it
cannot get the delay in bootloader(u-boot).

For example, the time from power on to the console login is about 65
seconds,
u-boot spends 25 seconds, and Linux boot needs another 40 seconds.

I want to get the total time: 65 seconds.  

Thanks,
Yong
-----Original Message-----
From: Andrew Jeffery <andrew@aj.id.au> 
Sent: Friday, May 17, 2019 7:17 AM
To: Yong Li <yong.b.li@linux.intel.com>; 'OpenBMC Maillist'
<openbmc@lists.ozlabs.org>
Cc: Li, Yong B <yong.b.li@intel.com>
Subject: Re: Get the AST2500 SCUE0/E4 value using kernel device driver? 



On Wed, 15 May 2019, at 17:12, Yong Li wrote:
> Hi All,
> 
> 
> Just want to know if there is any existing device driver provides the 
> interface to get the SCUE0/E4 register values on AST2500?
> 
> 
> If no, I would like to know if there is any examples/similar drivers 
> for reference? By the way, the two registers are used for the uptime

I'm not aware of any, but I'm interested in what you're trying to measure.
Are you after something that can't be satisfied by CLOCK_MONOTONIC and
friends for clock_gettime()? Or is that what you're wanting to drive?

Andrew

> 
> 
> Thanks,
> 
> Yong
> 
>

