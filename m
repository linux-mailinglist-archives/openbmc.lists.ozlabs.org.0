Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8861199A10
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 17:44:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sDCd0nhwzDqQ0
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 02:44:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sD6h24NRzDqS7
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 02:40:11 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: New repos request
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <7388c9a0-20da-a9a2-af08-76d3e4aca4f1@linux.intel.com>
Date: Tue, 31 Mar 2020 11:40:06 -0400
Content-Transfer-Encoding: 7bit
Message-Id: <56BA4944-EF73-40E7-9E16-35A327A2DC9B@fuzziesquirrel.com>
References: <7388c9a0-20da-a9a2-af08-76d3e4aca4f1@linux.intel.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 4:05 PM, Bills, Jason M <jason.m.bills@linux.intel.com> wrote:

> Hi Brad,
>
> We're doing some housekeeping and have some code various places that we'd  
> like to move into github.com/openbmc repos.
>
> I'd like to request the following four new repos, if possible:
> host-error-monitor
> libpeci
> pfr-manager
> service-config-manager
>
> Please let me know if you have any questions.  Thanks!
> -Jason

done!
