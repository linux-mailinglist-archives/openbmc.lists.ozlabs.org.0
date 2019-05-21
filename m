Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CCA24550
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2019 03:05:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457Hd72G2mzDqL0
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2019 11:05:47 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 457Hcd03StzDqCX
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 11:05:19 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 May 2019 18:05:16 -0700
X-ExtLoop1: 1
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.238])
 by fmsmga008.fm.intel.com with ESMTP; 20 May 2019 18:05:15 -0700
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'Brad Bishop'" <bradleyb@fuzziesquirrel.com>
References: <000d01d50b89$3beb7750$b3c265f0$@linux.intel.com>
 <20190520133130.ifmq4x2utuqqdzva@thinkpad.dyn.fuzziesquirrel.com>
In-Reply-To: <20190520133130.ifmq4x2utuqqdzva@thinkpad.dyn.fuzziesquirrel.com>
Subject: RE: Cannot find the submit button after "+2"
Date: Tue, 21 May 2019 09:05:14 +0800
Message-ID: <000a01d50f71$3ff660d0$bfe32270$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQDmuazrM1JlGaniODV1kpxZewuVIQDD62RMqEtPgMA=
Content-Language: en-us
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDNmNGYzY2MtYjdmYy00YTMzLTlkYWUtMDgyNGRhNzY0NmQwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiRXl0QjZyeGZiWGd3XC9PU1VFeHdlMWxHN2VWaHVvcFRMSXJFb3F2R2k2YmhIMWVjVVdVSmNZeVlNamNrMHYzbnQifQ==
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
Cc: 'OpenBMC Maillist' <openbmc@lists.ozlabs.org>, "'Li,
 Yong B'" <yong.b.li@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks Brad! Will contact the maintainers to merge my changes

Thanks,
Yong
-----Original Message-----
From: openbmc <openbmc-bounces+yong.b.li=linux.intel.com@lists.ozlabs.org>
On Behalf Of Brad Bishop
Sent: Monday, May 20, 2019 9:32 PM
To: Yong Li <yong.b.li@linux.intel.com>
Cc: 'OpenBMC Maillist' <openbmc@lists.ozlabs.org>; Li, Yong B
<yong.b.li@intel.com>
Subject: Re: Cannot find the submit button after "+2"

On Thu, May 16, 2019 at 09:46:50AM +0800, Yong Li wrote:
>Hi Brad,
>
>
>
>On the below code review I submitted, there are "+2" already, but I 
>cannot find the submit button on the web page,
>
>
>
>Do I need to apply for other permissions or groups?
>
>
>
>https://gerrit.openbmc-project.xyz/#/c/openbmc/intel-ipmi-oem/+/17234/,
>
>
>
>Thanks,
>
>Yong
>

Hi Yong

Whether or not the patch author clicks submit or the maintainer clicks
submit is a matter of maintainer preference.  I prefer to oversee the
merging of changes into the repositories I maintain.  I know that other
maintainers perfer to approve the change but delegate the actual submission
to the patch author (and that is fine).

I'm working on assigning the owner permission to refs/* to the current
repository maintainer for each openbmc repository.  This would allow each
repository maintainer to enable this (or not) as they see fit.

Thanks - brad

