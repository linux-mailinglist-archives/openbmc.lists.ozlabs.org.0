Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA55626A6FA
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 16:22:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrQRs0ZPFzDqSS
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 00:22:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=pQGKXNcH; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrQK95xB7zDqQN
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 00:17:00 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 0E67957DBB;
 Tue, 15 Sep 2020 14:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:mime-version:user-agent:date:date:message-id
 :subject:subject:from:from:received:received:received; s=mta-01;
 t=1600179414; x=1601993815; bh=QCSJgVTAtNZtSXprpsMt4Ko8+Iv0NYxv
 +hZIJ5cFFuc=; b=pQGKXNcH7APeSgyDGM4LzctObc/KXM6C7DNNUl4VON9syr2I
 ZN/xOEjoGfi06nz28INHExy8zJghqA8Xew/x2xy8J8ltGh0B8gwnY9oZ1RB+xAxR
 eDmmA4bc6rxJAfhnv4gUYvnVrTPWHFVdfbQZcMq6Hc36WR/TMhLDuHwhdiQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uUfyD3LlnBiv; Tue, 15 Sep 2020 17:16:54 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id B0EF357DBA;
 Tue, 15 Sep 2020 17:16:54 +0300 (MSK)
Received: from [10.199.2.58] (10.199.2.58) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 15
 Sep 2020 17:16:54 +0300
From: i.kononenko <i.kononenko@yadro.com>
To: OpenBMC MailList OZLabs <openbmc@lists.ozlabs.org>
Subject: jsnbd: removing dependency of the state_hook
Message-ID: <3e24eacc-b8f1-cb0b-78ed-8bf3a81b1cc5@yadro.com>
Date: Tue, 15 Sep 2020 17:16:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.2.58]
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

Hello,

Jeremy, I'm working on implementing a virtual media device interface type.
Gerrit PRs: https://gerrit.openbmc-project.xyz/q/topic:virtual_media_interface_type.

Actually `jsnbd:nbd-proxy` are depend on a call the `state_hook` which configures usb-gadget and inject the UDC. 
By PR
https://gerrit.openbmc-project.xyz/c/openbmc/meta-bytedance/+/35726 
the related feature are moved to the `usb-ctrl` tool and 
https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/33492 allows to use `usb-ctrl` in `state_hook` script.

May I kindly ask, can we avoid the call `state_hook` in `nbd-proxy` and move to directly call the `usb-ctrl` from it?
I'd like to make these changes and suggest a patch set.

PS:  I have suggested a patch that adds an interface type to state_hook, but it seems to me that this is the wrong way 
(https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/36471)

-- 
best,

Igor Kononenko
