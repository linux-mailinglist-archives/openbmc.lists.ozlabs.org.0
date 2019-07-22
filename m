Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D42703CA
	for <lists+openbmc@lfdr.de>; Mon, 22 Jul 2019 17:30:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45slt20ZkPzDqP9
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 01:30:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=raptorcs.com
 (client-ip=23.155.224.45; helo=mail.rptsys.com;
 envelope-from=tpearson@raptorcs.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=raptorcs.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=raptorcs.com header.i=@raptorcs.com header.b="NbTTpr/L"; 
 dkim-atps=neutral
Received: from mail.rptsys.com (mail.rptsys.com [23.155.224.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45slmL3cc9zDqSm
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 01:25:21 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 87A4E14BAEE6A
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jul 2019 10:25:10 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id V_2r0yrXw4kp for <openbmc@lists.ozlabs.org>;
 Mon, 22 Jul 2019 10:25:07 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 240EF14BAE557
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jul 2019 10:25:05 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 240EF14BAE557
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raptorcs.com;
 s=A94A9A2C-6F84-11E6-B0DA-2EF54ACC974C; t=1563809105;
 bh=a5hR3/L4XBsgdCveikiTfeS2KLH73oyJ0Y9Ce8BnQCU=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=NbTTpr/LvQqzAeMIZl2FA/8D8xlnuRccaizWKt7vG8A8IUEQiZOdV9SFiK/9+kapK
 QNM9HMkeqQOK05G0JYJf9b+dEUmN4u3VwTlsAgj4jTJP2h8b6HD9MafD9OqsNECQgj
 exptO8lOwVU8EUczj2G9crUn7jYSqhKtlBI4cq9M=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2pozTV8O4oHp for <openbmc@lists.ozlabs.org>;
 Mon, 22 Jul 2019 10:25:05 -0500 (CDT)
Received: from vali.starlink.edu (unknown [192.168.3.2])
 by mail.rptsys.com (Postfix) with ESMTP id 51A0A14BAE305
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jul 2019 10:24:48 -0500 (CDT)
Date: Mon, 22 Jul 2019 10:24:48 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorcs.com>
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <2086908422.1402251.1563809088306.JavaMail.zimbra@raptorcs.com>
Subject: Request for meta-rcs subrepository
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC73 (Linux)/8.5.0_GA_3042)
Thread-Index: hC+lx4jLPfDQoA2AH4JgofDI9b1z4w==
Thread-Topic: Request for meta-rcs subrepository
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

Per the discussion on https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/23547, I would like to request creation of a meta-rcs repository to hold product-specific layer data for our product lineup.

Thank you!
