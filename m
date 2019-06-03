Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 660FE32F05
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 13:54:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HYP66y90zDqRJ
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 21:54:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="WtCoT4X/"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HYNg6hpvzDqKl
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2019 21:53:39 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id EE8B9418F9;
 Mon,  3 Jun 2019 11:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:content-disposition:content-type:content-type
 :mime-version:message-id:subject:subject:from:from:date:date
 :received:received:received; s=mta-01; t=1559562812; x=
 1561377213; bh=PkUX1+nKhro81Omj0xjlWHxi6fbyahbyU1wodn1BhOQ=; b=W
 tCoT4X/s0VWrDs7kQ8ZNe3hF9c+QZCROxFT6135CUQjTiPg5jnYDtmir3ibU1MqJ
 RF/nTiwy//ESCseBOWDx1WmuPpbBaT6e1B95I4aYKMcq18ekpCiCBxqtF93O/f/W
 Jmpkfbab59pMIOdgnh08its668WDL6ytPMJY5PQzG4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7GfUGQjWnOhJ; Mon,  3 Jun 2019 14:53:32 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 944CA41258;
 Mon,  3 Jun 2019 14:53:32 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 3 Jun
 2019 14:53:32 +0300
Date: Mon, 3 Jun 2019 14:53:32 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: meta-yadro subtree
Message-ID: <20190603115332.GA20703@bbwork.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Originating-IP: [172.17.14.115]
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brad,

Finally, we are ready to publish our yocto layer. 
Could you please create a repo meta-yadro in OpenBMC project and corresponded
subtree.
You might clone it from https://github.com/YADRO-KNS/meta-yadro.git.

--
Regards
Alexander Filippov
Software Engineer, YADRO
