Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3372297C6
	for <lists+openbmc@lfdr.de>; Fri, 24 May 2019 14:04:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459Q596gcZzDqVs
	for <lists+openbmc@lfdr.de>; Fri, 24 May 2019 22:03:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="HCnGHXNk"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459Q4k5T4WzDqTP
 for <openbmc@lists.ozlabs.org>; Fri, 24 May 2019 22:03:34 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3726141931
 for <openbmc@lists.ozlabs.org>; Fri, 24 May 2019 12:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:content-disposition:content-type:content-type
 :mime-version:message-id:subject:subject:from:from:date:date
 :received:received:received; s=mta-01; t=1558699409; x=
 1560513810; bh=NvJMtRJmra8MYbvE8GS+xiH3w0rgXbNYRLqrgFgVLAE=; b=H
 CnGHXNkflGdvoniZqCNfryhNs1kbt+Y7iYk1Iw1boa/PSAGONmibaNgseJGtFyAH
 Efy+6ovm4BFj35DEI0HGy4pcaypeIkVXoy1iWPUfsd4oQHckAaLeQIFp8se5rbIL
 73bpJhk/DdYLD2AfxekdvdOxa5to8BcF9rhg5JTgs0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZzN7irnk63eR for <openbmc@lists.ozlabs.org>;
 Fri, 24 May 2019 15:03:29 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 25E6541907
 for <openbmc@lists.ozlabs.org>; Fri, 24 May 2019 15:03:28 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 24
 May 2019 15:03:28 +0300
Date: Fri, 24 May 2019 15:03:28 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: IKVM on AST2400
Message-ID: <20190524120328.GA648@bbwork.lan>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Some time ago the obmc-ikvm service was added to the firmware. It causes some
problems on our VESNIN hardware. As it based on AST2400 it does not have support
for IKVM in the DTS. The system log contains messages that create_usbhid.sh is
unable to find some items in the sysfs and then obmc-ikvm service crashes. It
causes fail in QEMU_CI test.

I belive that this issue also present on other platforms based on AST2400. 

IBM Guys: Do you run tests for Palmetto? 
Is there anybody else who uses AST2400?

Well, my proposal is to make the IKVM support optional by moving it to the
distrofeature.

Besides, I've solved these problems for our hardware by adding required kernel
modules and modifying DTS. 
IKVM works, but bring a lot of warnings after the host was shut down while the
VNC-client is still connected.

During the solving I copied some records from aspeed-g5.dtsi to aspeed-g4.dtsi. 
Should I commit these changes to Torvalds or OpenBMC repo?

--
Regards
Alexander Filippov
Software Engineer, YADRO
