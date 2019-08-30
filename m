Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D87A2FEC
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 08:30:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KV2m16CZzDrgD
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 16:30:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KV1b3YxgzDrQX
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 16:29:05 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 23:29:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,446,1559545200"; d="scan'208";a="188784869"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.126])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Aug 2019 23:29:01 -0700
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'Andrew Jeffery'" <andrew@aj.id.au>, "'AKASH G J'" <akashgj91@gmail.com>,
 <openbmc@lists.ozlabs.org>
References: <CAE33tLGxcBFHYzXQ7Uqdg03ZibvS4busoJT=iGTwLMb8TMD-2g@mail.gmail.com>
 <57995e3f-ef82-49b3-909a-054b5b9bef8e@www.fastmail.com>
In-Reply-To: <57995e3f-ef82-49b3-909a-054b5b9bef8e@www.fastmail.com>
Subject: RE: Enable KCS interface in zaius
Date: Fri, 30 Aug 2019 14:29:00 +0800
Message-ID: <000001d55efc$36c53100$a44f9300$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJcB1X7Z8c6uIR1m/dKdfL+hCFWWQFjbNgipfrL1tA=
Content-Language: en-us
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMGJkMTMyYjItYWQzMi00YjdlLTg5NDAtOWQ1YmU0ZDg1MjdiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQkJlOUpNN0hLK0Y3NXlSMmVsaFNvcWVCbE84aHM5Um5rXC9ldXhReDZ3RXlDcW43QVo2NTh5WENHZytaSjZhXC9DIn0=
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

It seems that the kernel needs to enable KCS, and disable BT. 
CONFIG_ASPEED_KCS_IPMI_BMC=y

Suggest to check on this: https://github.com/Intel-BMC/openbmc

Thanks,
Yong
-----Original Message-----
From: openbmc <openbmc-bounces+yong.b.li=linux.intel.com@lists.ozlabs.org>
On Behalf Of Andrew Jeffery
Sent: Friday, August 30, 2019 12:42 PM
To: AKASH G J <akashgj91@gmail.com>; openbmc@lists.ozlabs.org
Subject: Re: Enable KCS interface in zaius



On Thu, 29 Aug 2019, at 09:05, AKASH G J wrote:
> Hi all,
> 
> I am using server platform with Intel processor and Aspeed AST-2500 
> BMC. OpenBMC firmware with zaius configuration is used for BMC.
> 

Zaius is an OpenPOWER platform (and our OpenPOWER platforms use the BT
interface rather than KCS). You're using an Intel-based processor for the
host, so perhaps it's better to start with an x86-based platform such as the
s2600wf. This should already have KCS IPMI enabled for you.

Andrew

