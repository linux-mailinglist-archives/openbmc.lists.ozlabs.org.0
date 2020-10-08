Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D018286FCD
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 09:49:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6Nd35VR2zDqRn
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 18:49:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=PE58f6s7; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6NcM0jTnzDqRW
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 18:48:34 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2B5F34138A;
 Thu,  8 Oct 2020 07:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:mime-version:user-agent:date:date:message-id
 :subject:subject:from:from:received:received:received; s=mta-01;
 t=1602143308; x=1603957709; bh=fgal73CWOcpJRAL1AGZcwEY2do5ZPGCO
 3LRZjKlQrQI=; b=PE58f6s7emEf00O69CIlZH+MKTSomtUzKSlCVpT/ePCxGVnx
 1EY77wD9siIam31zVPORQT2sp8qdxlBK/xl9R1x3ODJblOIKCMCNDOkCIyCcKsu1
 rRTg1Gs6Ju1OOGZMJ3ZeGF/hA2CriVZAmkZZb+7iVhAyCQWK82zF1qUznIc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PUjf_ZzgC3BS; Thu,  8 Oct 2020 10:48:28 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C03FC41240;
 Thu,  8 Oct 2020 10:48:28 +0300 (MSK)
Received: from [10.199.2.134] (10.199.2.134) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 8 Oct
 2020 10:48:27 +0300
To: OpenBMC MailList OZLabs <openbmc@lists.ozlabs.org>
From: i.kononenko <i.kononenko@yadro.com>
Subject: Use usb-ctrl for USB gadget management
Message-ID: <127b55ea-175f-b60f-90e1-08465fb53592@yadro.com>
Date: Thu, 8 Oct 2020 10:48:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.2.134]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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

Jeremy,
I've found the gerrits change[1] about including the usb-ctrl to the state_hook of Virtual Media mounting. 
I'm working on improving Virtual Media functions to add media interface type[2] which impacts state_hook. I'd like to take over me the above described changes  to speed approve updates of [1].
Kindly may I ask to assign the task[1] to me? I'll like to suggest a [2] together with [1], is it possible? 
Thanks!

Links:
1. https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/33492
2. https://gerrit.openbmc-project.xyz/q/topic:%22virtual_media_interface_type%22
-- 
Best regards,

Igor Kononenko
