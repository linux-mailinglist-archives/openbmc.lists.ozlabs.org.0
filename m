Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3BF265C58
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 11:20:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnqwd229lzDqkB
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 19:20:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=LhfvV3fU; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bnqvm4DjHzDqTd
 for <openbmc@lists.ozlabs.org>; Fri, 11 Sep 2020 19:19:29 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C7A2257548;
 Fri, 11 Sep 2020 09:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1599815963; x=1601630364; bh=J/tHMZH8z/eg7vpTQfGL5OG/t
 C3iE8CJqXFV86k9Xfs=; b=LhfvV3fUPbB1w2nqHOxVop1awlc7eCUWU20tLhDmV
 3mbPcgj4MDsDlXxlEJv4tqPwiXidU/swv/SPdNretHpeMZeZI1TCrotyVkrFcKNZ
 ARBQ+6qzeYI8B2QZtN9jKeriBB5zddcPw5WTY99RlhHiW0edJF7ab/2eyidLoCdm
 qk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9sNri2F5T8Ws; Fri, 11 Sep 2020 12:19:23 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 98EE757534;
 Fri, 11 Sep 2020 12:19:23 +0300 (MSK)
Received: from [10.199.0.178] (10.199.0.178) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 11
 Sep 2020 12:19:23 +0300
Message-ID: <bf3645151d434adadf930030dcf40db1edc18596.camel@yadro.com>
Subject: Storage inventory on x86
From: Andrei Kartashev <a.kartashev@yadro.com>
To: James Feist <james.feist@linux.intel.com>, Openbmc
 <openbmc@lists.ozlabs.org>
Date: Fri, 11 Sep 2020 12:19:22 +0300
In-Reply-To: <675aaf18-40f6-e175-5899-3269c93ca3f5@linux.intel.com>
References: <C24D4BAF-B185-4640-BFEF-D391E51A0A35@fb.com>
 <452FDC0B-2E4F-4AD9-97E6-DE9B2333D99B@fb.com>
 <8EE0F70D-78CB-4CDB-A51C-53FC33A2AC87@fb.com>
 <EFFBC9D1-BA53-4C61-8BC2-7F52320245F7@fb.com>
 <51C18C28-4894-4BEF-AAA6-BACE5B934B5C@fb.com>
 <AFA8029B-BBBC-41A5-9F66-671D41D0E624@fb.com>
 <675aaf18-40f6-e175-5899-3269c93ca3f5@linux.intel.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.178]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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

Hi,

The question is mainly for Intel guys: 
Is there some universal way to build inventory of storage devices
(SATA/SAS/NVMe)?
I found that on wolfpass there is hsbp-manager who responsible for
storage inventory, but if I get it right, there is CPLD on that
backplane, which somehow communicate with drives and can get the basic
information about (model, serial, etc). Can anyone point me what should
we have in our system to implement something like this?
I guess, storage devices are not handled by smbios-mdr daemon, because
of hotswap requirement, and not handled by PECI, because of PECI have
no such commands. Is there any other ways to get drive inventory
(including RAID)?

-- 
Best regards,
Andrei Kartashev


