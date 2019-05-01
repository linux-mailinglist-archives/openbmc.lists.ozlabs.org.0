Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF39105E7
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 09:39:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44v9Jh14rZzDqQc
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 17:39:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.45;
 helo=mail.rptsys.com; envelope-from=tpearson@raptorengineering.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b="boXSIRf9"; dkim-atps=neutral
Received: from mail.rptsys.com (mail.rptsys.com [23.155.224.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44v9Hn6XmgzDqN1
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 17:38:45 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B898DD22AC7
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 02:38:42 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id faGjpTvML10K for <openbmc@lists.ozlabs.org>;
 Wed,  1 May 2019 02:38:42 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 32405D22AD8
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 02:38:42 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 32405D22AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1556696322; bh=Fy/iLWLoUAjii3QTBx0xWJ+oqjDvqUz2YhjHmdZTCr8=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=boXSIRf9HuPvLSjCNI2vY+fisYpM1Nv7kjUgfectx44iBltwEC610XtiVdGjxHdUo
 /zYmxnDgIwn3kYbxDYuC6ro1X60wfFG+9qR5l1BJoHj4DFXoRq/pbP/qCqnKYe2C8u
 DW9onsxksP4mX83h/c4o5Ue/O1YWM96KcwggELqo=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2IaHrLDWzezb for <openbmc@lists.ozlabs.org>;
 Wed,  1 May 2019 02:38:42 -0500 (CDT)
Received: from vali.starlink.edu (vali.starlink.edu [192.168.3.21])
 by mail.rptsys.com (Postfix) with ESMTP id 13EF6D22AC7
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 02:38:42 -0500 (CDT)
Date: Wed, 1 May 2019 02:38:41 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Message-ID: <757768607.3289093.1556696321378.JavaMail.zimbra@raptorengineeringinc.com>
Subject: CLA concerns
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC73 (Linux)/8.5.0_GA_3042)
Thread-Index: 30ss3KIJS4nzrN7gDvWGTqMdn2Mg+A==
Thread-Topic: CLA concerns
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

All,

While we would like to upstream the Talos II / Blackbird BMC patches to the OpenBMC project, our legal folks will not approve the CLA.  The main concern is the patent section, since our mainboards do contain patented technology that is not part of OpenBMC, but that OpenBMC may interface with.  We are not trying to upstream any code that would result in patent action, but are very concerned that the CLA would end up granting a license for the patented technology that exists outside of OpenBMC, merely because the OpenBMC codebase is able to interface with that external technology.

The specific clause in question is:
"...or by combination of Your Contribution(s) with the Work to which such Contribution(s) were submitted."

This is ambiguous enough that legal is concerned an external entity wishing to clone the patented technology from our mainboards without a license would simply be able to merge our contributions with their own de novo code duplicating parts of the patented technology, then claim a license for the patents was automatically granted by the CLA.  As such, we are currently blocked from upstreaming code to OpenBMC, despite the fact that our patches are freely available under GPL and MIT licenses, and that those patches are not covered by any of our patents (past or future).

Is there a way to clean up the patent section of the CLA to make it clearer that only the patches submitted are released from patent infringement claims, and that any third party modifications to those patches (or to the codebase created in part by those patches) must still be cleared by their respective authors / maintainers not to infringe on the patent rights of other contributors to the codebase?

Thank you!

--
Timothy Pearson
Raptor Engineering, LLC
https://www.raptorengineering.com
+1 (415) 727-8645
