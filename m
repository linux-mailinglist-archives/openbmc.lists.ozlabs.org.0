Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA35100A13
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2019 18:17:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GwdH2hrjzDqT9
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 04:17:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="uYC4lbcR"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Gwcd75dVzDqQ8
 for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2019 04:17:21 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3ACFE438D1;
 Mon, 18 Nov 2019 17:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:date:date:from:from:subject:subject
 :message-id:received:received:received; s=mta-01; t=1574097435;
 x=1575911836; bh=UFJJRcF8chEGT4ph4mgnBCuWMvJ1/OuId/9FwsIGM1o=; b=
 uYC4lbcRKVOUdsEFR2/WKmKFOQ2dfvMOtCubBgyCCfnN/0S2mQDKAgg2Oo2Re0ME
 C5B8xeCO+thgMYfOLM6l+Xgbbcl3BFBbja7hkGj4IieahEW0un/UYUI7SU7cUAzO
 pBQ/QMQrxLYqkSMkHG6aJ0gRb3IEjCmM2dLvGP4hVxI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FiA8oiW_NIPB; Mon, 18 Nov 2019 20:17:15 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id DD5BD437FA;
 Mon, 18 Nov 2019 20:17:15 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Mon, 18 Nov 2019 20:17:15 +0300
Message-ID: <239c05241b09f29240271769a0af1c185338fe20.camel@yadro.com>
Subject: ftgmac100, channel timed out problem
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: <gwshan@linux.ibm.com>
Date: Mon, 18 Nov 2019 20:16:44 +0300
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.15.69]
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Gavin, I saw that you wrote NCSI subsystem, we have intermittent issue on our
aspeed board by some unknown reason -

[64370.881268] ftgmac100 1e660000.ethernet eth0: NCSI Channel 0 timed out!
[64370.887968] ftgmac100 1e660000.ethernet eth0: NCSI interface down
[64370.894100] ftgmac100 1e660000.ethernet eth0: NCSI: suspending channel 0
[64370.923031] ftgmac100 1e660000.ethernet eth0: NCSI: configuring channel 0
[64370.947428] ftgmac100 1e660000.ethernet eth0: NCSI: channel 0 config done
[64370.947482] ftgmac100 1e660000.ethernet eth0: NCSI: No more channels to
process
[64370.947511] ftgmac100 1e660000.ethernet eth0: NCSI interface up
[187718.883342] ftgmac100 1e660000.ethernet eth0: NCSI Channel 0 timed out!
[187718.890099] ftgmac100 1e660000.ethernet eth0: NCSI interface down
[187718.896349] ftgmac100 1e660000.ethernet eth0: NCSI: suspending channel 0
[187718.906581] ftgmac100 1e660000.ethernet eth0: NCSI: configuring channel 0
[187718.964435] ftgmac100 1e660000.ethernet eth0: NCSI: channel 0 config done
[187718.964488] ftgmac100 1e660000.ethernet eth0: NCSI: No more channels to
process
[187718.964519] ftgmac100 1e660000.ethernet eth0: NCSI interface up

So, as you see channel is timed out and as consequence of this action it's
trying to reconfigure the interface... Do you know any tips how to debug that at
this point? Or you maybe aware of such problem.

I've found this one 
https://www.dmtf.org/sites/default/files/standards/documents/DSP0222_1.0.0.pdf
from https://lwn.net/Articles/663748/ . Is there anything else related
documentation which may help to debug?

Thanks.

