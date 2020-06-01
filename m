Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A75D1EB051
	for <lists+openbmc@lfdr.de>; Mon,  1 Jun 2020 22:38:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bRpV6kF3zDqQG
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 06:38:42 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bRl02kRfzDqPw
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jun 2020 06:35:39 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <4c4aa12b1ffde80ebbf49ad78b6046889f4226c0.camel@fuzziesquirrel.com>
Subject: OpenBMC Logging and Error Handling Dos and Don'ts
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc <openbmc@lists.ozlabs.org>
Date: Mon, 01 Jun 2020 16:35:29 -0400
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

I would like to start a document centered on logging best practices in
OpenBMC.  To get started I used a simple Do/Don't format and picked an
easy topic that I've repeatedly gotten feedback on.

Please let me know if you like the format or have any feedback.

Also please feel free to reply with suggestions for additional Do/Don't
items...I may write them up if time allows.

thanks!

-brad

----------

# OpenBMC Logging and Error Handling Dos and Don'ts
**Audience:** OpenBMC application developers

**Prerequisites:** None

---
## Don't require `-o verbose` for systemd journal MESSAGE field context
The MESSAGE field of a systemd journal entry should be self describing and not
rely on additional structured log data.  For example when the MESSAGE field
references a filesystem path, the path should appear in the MESSAGE field.
When the MESSAGE field references a failed system call, the system call and the
return value should appear in the MESSAGE field.  This keeps the journal
informative and useful for casual journal users.  Note that it is perfectly
acceptible to add (duplicate) structured log entry values for the data that
appears in MESSAGE.  This guideline only prescribes that the data _not_ be
omitted from the MESSAGE field value.


## Don't #2
TBD

## Do #1
TBD
