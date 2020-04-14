Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 469661A8EBB
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 00:43:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4920rh5WbMzDqlw
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 08:43:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4920r03p9XzDqLD
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 08:42:54 +1000 (AEST)
IronPort-SDR: cY282ub5tsJvENlgBiG4Obr6K1o29kY/uQDOhTfz6RNOVBd618AlNKJFuGAUty53+b6gT7l097
 TMeh+AC3KdWg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 15:42:49 -0700
IronPort-SDR: /FNTM6Q43Z0H3wmVhIi1IjAbLfgG8ib0HF7vsXlp3yRPYV8jM7rQcRBKqbxH8qc+IgUvi9OHyR
 Uioglkh/TJ4g==
X-IronPort-AV: E=Sophos;i="5.72,384,1580803200"; d="scan'208";a="400106584"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 15:42:49 -0700
Date: Tue, 14 Apr 2020 15:42:48 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: ipmi password storage
Message-ID: <20200414224248.GF9295@mauery.jf.intel.com>
References: <20200413230015.GB9295@mauery.jf.intel.com>
 <20200414155019.GB443018@heinlein.lan.stwcx.xyz>
 <20200414164610.GC9295@mauery.jf.intel.com>
 <c59d8a92-aabd-1a79-a97a-5947bb7ff4cc@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c59d8a92-aabd-1a79-a97a-5947bb7ff4cc@linux.ibm.com>
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 14-Apr-2020 05:03 PM, Joseph Reynolds wrote:
>
>
>On 4/14/20 11:46 AM, Vernon Mauery wrote:
>>On 14-Apr-2020 10:50 AM, Patrick Williams wrote:
>>>On Mon, Apr 13, 2020 at 04:00:15PM -0700, Vernon Mauery wrote:
>>>
>>>Vernon,
>>>
>>>Is there some background pointers on why IPMI needs to store passwords
>>>in a reverable way?=A0 I never understood that.
>>
>>Sure. I think this is most clearly described in section 13.31 "RMCP+=20
>>Authenticated Key-Exchange Protocol (RAKP)" in the IPMI v2 1.1 spec.
>
>This may be a bit naive....=A0 Is it possible to expand the RCMP+ spec=20
>with a new cipher suite or similar, to use a mechanism more like HTTPS=20
>or SSH that does not require the server to be able to produce a clear=20
>text password?=A0 Given that IPMI will be used for many years, this=20
>seems worthwhile, and would solve the current problem.

While IPMI will not likely be abandoned for many years to come, there=20
are not any plans to update the specification. Redfish is supposed to be=20
the answer, but like IPv4 was supposed to be supplanted by IPv6 long=20
ago, full adoption is still dragging its feet.

That being said, I am not opposed to creating a new de-facto standard.=20
In the name of security, I would not be opposed to using modern crypto=20
protocols to establish secure IPMI sessions. This would likely cause the=20
adoption of redfish to be even slower, because the biggest detractor of=20
IPMI would be fixed.

We have the maintainer of ipmitool as a member of the OpenBMC community,=20
(Alexander Amelkin) so we could even implement both ends of this new=20
de-facto standard. I would suggest a DTLS connection on UDP 623, fully=20
replacing RCMP+.

--Vernon
