Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A9323807
	for <lists+openbmc@lfdr.de>; Mon, 20 May 2019 15:31:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4570Ck6d1yzDqL0
	for <lists+openbmc@lfdr.de>; Mon, 20 May 2019 23:31:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4570CB3vLzzDqDr
 for <openbmc@lists.ozlabs.org>; Mon, 20 May 2019 23:30:45 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 20 May 2019 09:31:30 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Yong Li <yong.b.li@linux.intel.com>
Subject: Re: Cannot find the submit button after "+2"
Message-ID: <20190520133130.ifmq4x2utuqqdzva@thinkpad.dyn.fuzziesquirrel.com>
References: <000d01d50b89$3beb7750$b3c265f0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <000d01d50b89$3beb7750$b3c265f0$@linux.intel.com>
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
Cc: 'OpenBMC Maillist' <openbmc@lists.ozlabs.org>, "Li,
 Yong B" <yong.b.li@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 16, 2019 at 09:46:50AM +0800, Yong Li wrote:
>Hi Brad,
>
>
>
>On the below code review I submitted, there are "+2" already, but I cannot
>find the submit button on the web page,
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
maintainers perfer to approve the change but delegate the actual
submission to the patch author (and that is fine).

I'm working on assigning the owner permission to refs/* to the current
repository maintainer for each openbmc repository.  This would allow
each repository maintainer to enable this (or not) as they see fit.

Thanks - brad
