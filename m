Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBDB70660
	for <lists+openbmc@lfdr.de>; Mon, 22 Jul 2019 19:06:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sp1F0kHFzDqWc
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 03:06:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45sp0f1dWVzDqML
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 03:06:09 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 22 Jul 2019 13:06:55 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Lei YU <mine260309@gmail.com>
Subject: Re: New repo request: phosphor-psu-code-mgmt
Message-ID: <20190722170654.pvdivxzgad7uowkt@thinkpad>
References: <CAARXrtkB5A7H+fw+yQbQEFO7y0LknnDutgKnvjAUkp3A_srbMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAARXrtkB5A7H+fw+yQbQEFO7y0LknnDutgKnvjAUkp3A_srbMw@mail.gmail.com>
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

On Thu, Jul 11, 2019 at 02:10:42PM +0800, Lei YU wrote:
>Hi Brad,
>
>Could you please help to create a new repo for PSU firmware management?
>It could be named like `phosphor-psu-code-mgmt` which is consistent to existing
>phosphor-[bmc|pnor]-code-mgmt, or maybe help to suggest another name?
>
>The design doc is under review and it looks like it's going to be accepted:
>https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22821
>
>Thanks!

Created phosphor-psu-code-mgmt.  thanks!
