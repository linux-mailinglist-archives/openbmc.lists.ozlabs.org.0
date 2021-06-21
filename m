Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB883AF70F
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 22:56:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G81zb3NMmz3099
	for <lists+openbmc@lfdr.de>; Tue, 22 Jun 2021 06:56:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=ZCkjEeCr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=ZCkjEeCr; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G81zK0wsXz2xvN
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jun 2021 06:56:28 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6942C41286
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 20:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:date:date:from:from:subject:subject
 :message-id:received:received:received; s=mta-01; t=1624308982;
 x=1626123383; bh=Ym01/NzM81WhqlIvCAvSY4P37PjPGe/XQVhR7YX/JDE=; b=
 ZCkjEeCrf0sAwkElsHgsRBx70/3NLSQCoS/z+Y3H29DOw/0ovHsn33ot/f4V1LQf
 zIX5tP4TQ9mQhc00Y7t7aq4yUXuwBeCI0wGhptXW4dTwYhpJYYC2dLbZSIw/2HVv
 oYJxW13CpRt8djbDztwL7hnk2+amhLmgqCc7pKhkNcQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R_PxkHJHVGI6 for <openbmc@lists.ozlabs.org>;
 Mon, 21 Jun 2021 23:56:22 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 21DF74126D
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 23:56:21 +0300 (MSK)
Received: from [10.199.0.46] (10.199.0.46) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 21
 Jun 2021 23:56:21 +0300
Message-ID: <36db44ef6cab760cf7c5a5dbba0f193ef78ca3a3.camel@yadro.com>
Subject: x86-power-control: NMI Enabled
From: Andrei Kartashev <a.kartashev@yadro.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Mon, 21 Jun 2021 23:56:20 +0300
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.46]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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

I was a bit confused today when I found that x86-power-control uses
undocumented "Enabled" property of
xyz.openbmc_project.Chassis.Control.NMISource interface (see links
below).
The xyz.openbmc_project.Chassis.Control.NMISource is hosted by Settings
daemon and thus should store persistent configuration information.

According to the sources, "Enabled" is used to store internal state of
NMI operation or even to trigger NMI. My confusion is about if it
really required to have this state to be persistent over reboot? I
almost sure, it doesn't. But even if it does, it should not be hosted
by Settings daemon as semantically it is not a configuration option.

Does anyone know, Is there any software that depend on this Enabled
property? Otherwise I prefer to cut it out.

https://github.com/openbmc/x86-power-control/blob/master/power-control-x86/src/power_control.cpp#L2006
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Chassis/Control/NMISource.interface.yaml#L4


-- 
Best regards,
Andrei Kartashev


