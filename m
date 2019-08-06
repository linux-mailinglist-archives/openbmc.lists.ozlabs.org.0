Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C8B83AEF
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2019 23:19:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4636vq0dPPzDr4M
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 07:19:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4636vG45dpzDqW1
 for <openbmc@lists.ozlabs.org>; Wed,  7 Aug 2019 07:18:49 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <13df94c71d76b180bcdf2723f5c1dc0e9c984b2c.camel@fuzziesquirrel.com>
Subject: how to distribute avahi config files?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: asmitk01@in.ibm.com, ratagupt@in.ibm.com
Date: Tue, 06 Aug 2019 17:19:30 -0400
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Asmitha, Ratan

I went ahead and merged 
https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/22950 but
I want to suggest that going forward we distribute zeroconf config
files with the applications that provide the services rather than via
the bitbake metadata.  Much like how we have done with systemd unit
files.  So please don't make further investments there.

I've copied the OpenBMC list to get this in front of a large
audience...just in case anyone thinks I'm giving bad advice here.

Thanks!

-brad
