Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E211FF699
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 17:26:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nm4S06jJzDrGG
	for <lists+openbmc@lfdr.de>; Fri, 19 Jun 2020 01:26:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nm1p02MjzDqHh
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jun 2020 01:24:12 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <401bbeda08bbeee4bcb9bc94a2b33eaa75f167ce.camel@fuzziesquirrel.com>
Subject: Re: Message registries continuation
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: James Feist <james.feist@linux.intel.com>, Matt Spinler
 <mspinler@linux.ibm.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 18 Jun 2020 11:23:51 -0400
In-Reply-To: <85015a54-0de6-42e2-bd56-732c7f0a420d@linux.intel.com>
References: <74794819-3b3c-0c39-30e0-b2ca6c46d9fb@linux.ibm.com>
 <85015a54-0de6-42e2-bd56-732c7f0a420d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2020-06-16 at 13:39 -0700, James Feist wrote:
> 
> Entity-manager uses valijson, in that way you could validate them 
> against a schema: https://github.com/tristanpenman/valijson. It plays 
> nicely with nlohmann-json. Although if these are compiled in json
> files, I'm not sure it's a large issue. We could just create a
> compile-time script to validate.

FYI for EM, I've actually done this work.  I just need to submit it for
review.
